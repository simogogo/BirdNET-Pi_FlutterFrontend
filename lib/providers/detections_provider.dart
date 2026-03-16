import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/detection.dart';
import '../models/species_detail.dart';
import '../services/api_service.dart';

/// Trigger per il refresh globale delle registrazioni e statistiche
class RecordingsRefreshTrigger extends Notifier<int> {
  @override
  int build() => 0;

  void increment() => state++;
}

final recordingsRefreshTriggerProvider =
    NotifierProvider<RecordingsRefreshTrigger, int>(RecordingsRefreshTrigger.new);

/// Notifier per le detection di oggi (linear list, all confidence values)
/// Notifier per le detection di oggi (linear list, all confidence values)
class TodayDetectionsNotifier extends Notifier<AsyncValue<List<Detection>>> {
  @override
  AsyncValue<List<Detection>> build() {
    ref.watch(recordingsRefreshTriggerProvider);
    // Caricamento iniziale
    _load();
    return const AsyncLoading();
  }

  Future<void> _load() async {
    try {
      final api = ref.read(apiServiceProvider);
      final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final detections = await api.getDetections(date: today);
      if (state is! AsyncData) {
        state = AsyncData(detections);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Aggiorna lo stato di lock di una detection in memoria
  void updateLockStatus(String fileName, bool isLocked) {
    state.whenData((detections) {
      final index = detections.indexWhere((d) => d.fileName == fileName);
      if (index != -1) {
        final updatedList = List<Detection>.from(detections);
        updatedList[index] = detections[index].copyWith(isLocked: isLocked);
        state = AsyncData(updatedList);
      }
    });
  }
}

final todayDetectionsProvider =
    NotifierProvider<TodayDetectionsNotifier, AsyncValue<List<Detection>>>(
      TodayDetectionsNotifier.new,
    );

/// Provider per le detection di una data specifica (linear list, all confidence values)
final detectionsForDateProvider = FutureProvider.autoDispose
    .family<List<Detection>, String>((ref, date) async {
      ref.watch(recordingsRefreshTriggerProvider);
      final api = ref.watch(apiServiceProvider);
      return api.getDetections(date: date);
    });

/// Provider per TUTTE le detection di una data specifica (ordinate per ora decrescente)
final allDetectionsForDateProvider = FutureProvider.autoDispose
    .family<List<Detection>, String>((ref, date) async {
      ref.watch(recordingsRefreshTriggerProvider);
      final api = ref.watch(apiServiceProvider);
      final detections = await api.getDetections(date: date);
      // Ordina per data+ora decrescente (più recente in cima)
      detections.sort((a, b) {
        final dateTimeA = '${a.date} ${a.time}';
        final dateTimeB = '${b.date} ${b.time}';
        return dateTimeB.compareTo(dateTimeA);
      });
      return detections;
    });

/// Provider per l'elenco di tutte le specie storicamente identificate
final allSpeciesProvider =
    FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
      ref.watch(recordingsRefreshTriggerProvider);
      final api = ref.watch(apiServiceProvider);
      return api.getSpeciesList(sort: 'name');
    });

/// Provider per le registrazioni di una specifica specie
final recordingsForSpeciesProvider = FutureProvider.autoDispose
    .family<List<Map<String, dynamic>>, String>((ref, species) async {
      ref.watch(recordingsRefreshTriggerProvider);
      final api = ref.watch(apiServiceProvider);
      return api.getRecordings(species: species, sort: 'date', limit: 100);
    });

/// Provider per il dettaglio arricchito di una specie (info, trend, image)
final speciesDetailProvider = FutureProvider.autoDispose
    .family<SpeciesDetail, String>((ref, sciName) async {
      final api = ref.watch(apiServiceProvider);
      return api.getSpeciesDetail(sciName);
    });

/// Provider per l'immagine di una specie (restituisce mappa con url e base64 se disponibili)
final speciesImageProvider = FutureProvider.family<Map<String, dynamic>?, String>((
  ref,
  sciName,
) async {
  // Mantieni viva la cache anche quando il provider non è più in ascolto
  ref.keepAlive();

  final nonBirdCategories = {
    'Human vocal',
    'Human non-vocal',
    'Human whistle',
    'Dog',
    'Power tools',
    'Siren',
    'Engine',
    'Gun',
    'Fireworks',
  };

  if (nonBirdCategories.contains(sciName)) {
    return <String, dynamic>{};
  }

  final api = ref.watch(apiServiceProvider);

  // User-defined retry intervals for automatic refresh
  final retryIntervals = [
    const Duration(seconds: 10),
    const Duration(seconds: 30),
    const Duration(seconds: 60),
  ];

  int attempt = 0;
  while (true) {
    try {
      final imageMap = await api.getSpeciesImage(sciName);

      // Se il backend segnala che non c'è nessun provider configurato,
      // usciamo subito restituendo mappa vuota (così mostra il placeholder)
      if (imageMap != null && imageMap['no_provider'] == true) {
        return <String, dynamic>{};
      }

      // If the API returns success but base64_data is missing (e.g., backend
      // is still downloading it or temporarily failed), we force a retry.
      if (imageMap != null) {
        final b64 = imageMap['base64_data']?.toString();
        if (b64 == null || b64.isEmpty) {
          throw Exception(
            'base64_data is empty, retrying to fetch complete image',
          );
        }
      }
      return imageMap;
    } catch (e) {
      if (attempt >= retryIntervals.length) {
        debugPrint(
          'Error fetching image for $sciName after $attempt retries: $e',
        );
        rethrow;
      }
      final delay = retryIntervals[attempt];
      debugPrint(
        'Retrying image fetch for $sciName in ${delay.inSeconds}s (attempt ${attempt + 1}/${retryIntervals.length})...',
      );
      await Future.delayed(delay);
      attempt++;
    }
  }
});

/// Provider per l'elenco delle specie in un determinato periodo
final speciesByPeriodProvider = FutureProvider.autoDispose
    .family<
      List<Map<String, dynamic>>,
      ({String? fromDate, String? toDate, String? fromTime, String? toTime})
    >((ref, range) async {
      ref.watch(recordingsRefreshTriggerProvider);
      final api = ref.watch(apiServiceProvider);
      return api.getSpeciesByPeriod(
        fromDate: range.fromDate,
        toDate: range.toDate,
        fromTime: range.fromTime,
        toTime: range.toTime,
        sort: 'name',
      );
    });

/// Provider per le registrazioni di una specie in un determinato periodo
final recordingsForPeriodProvider = FutureProvider.autoDispose
    .family<
      List<Map<String, dynamic>>,
      ({
        String species,
        String? fromDate,
        String? toDate,
        String? fromTime,
        String? toTime,
      })
    >((ref, args) async {
      ref.watch(recordingsRefreshTriggerProvider);
      final api = ref.watch(apiServiceProvider);
      return api.getRecordings(
        species: args.species,
        fromDate: args.fromDate,
        toDate: args.toDate,
        fromTime: args.fromTime,
        toTime: args.toTime,
        sort: 'date',
        limit: 200,
      );
    });

/// Provider derivato: lista filtrata e ordinata di tutte le detection di oggi
final todayDetectionsFlatProvider =
    Provider.autoDispose<AsyncValue<List<Detection>>>((ref) {
      final asyncDetections = ref.watch(todayDetectionsProvider);
      return asyncDetections.whenData((detections) {
        final flat = List<Detection>.from(detections);
        // Ordina per data+ora decrescente per garantire che il primo sia l'ultimo rilevamento
        flat.sort((a, b) {
          final dateTimeA = '${a.date} ${a.time}';
          final dateTimeB = '${b.date} ${b.time}';
          return dateTimeB.compareTo(dateTimeA);
        });
        return flat;
      });
    });

/// Conteggio specie uniche oggi
final uniqueSpeciesTodayProvider = Provider.autoDispose<AsyncValue<int>>((ref) {
  final asyncDetections = ref.watch(todayDetectionsFlatProvider);
  return asyncDetections.whenData(
    (detections) => detections.map((d) => d.scientificName).toSet().length,
  );
});

/// Conteggio totale detection oggi
final totalDetectionsTodayProvider = Provider.autoDispose<AsyncValue<int>>((
  ref,
) {
  final asyncDetections = ref.watch(todayDetectionsFlatProvider);
  return asyncDetections.whenData((detections) => detections.length);
});

/// Provider per le statistiche generali (overview)
final overviewProvider = FutureProvider.autoDispose<Map<String, dynamic>>((
  ref,
) async {
  ref.watch(recordingsRefreshTriggerProvider);
  final api = ref.watch(apiServiceProvider);
  return api.getOverview();
});

/// Provider per i dati dei grafici giornalieri (family)
final dailyChartDataProvider = FutureProvider.autoDispose
    .family<Map<String, dynamic>, String>((ref, date) async {
      ref.watch(recordingsRefreshTriggerProvider);
      final api = ref.watch(apiServiceProvider);
      return api.getDailyChartData(date);
    });

/// Provider per i dati dei grafici di oggi (usa dailyChartDataProvider internamente)
final todayChartDataProvider = FutureProvider.autoDispose<Map<String, dynamic>>(
  (ref) async {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return ref.watch(dailyChartDataProvider(today).future);
  },
);

/// Provider per la lunghezza della registrazione (configurazione)
final recordingLengthProvider = FutureProvider.autoDispose<int>((ref) async {
  final api = ref.watch(apiServiceProvider);
  try {
    final config = await api.getRecordingLength();
    final recLen = config['RECORDING_LENGTH'];
    return int.tryParse(recLen.toString()) ?? 15;
  } catch (_) {
    return 15; // Default 15 secondi
  }
});

/// Provider per gli ultimi rilevamenti in assoluto (Home screen)
final recentDetectionsProvider = FutureProvider.autoDispose<List<Detection>>((
  ref,
) async {
  ref.watch(recordingsRefreshTriggerProvider);
  final api = ref.watch(apiServiceProvider);
  // Ne recuperiamo 20 per sicurezza, poi la UI filtrerà le specie
  return api.getRecentDetections(limit: 20);
});

/// Invalida tutti i provider relativi alle registrazioni e statistiche
void invalidateRecordings(dynamic ref) {
  ref.read(recordingsRefreshTriggerProvider.notifier).increment();
}
