import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/detection.dart';
import '../services/api_service.dart';

/// Notifier per le detection di oggi (linear list, all confidence values)
/// Notifier per le detection di oggi (linear list, all confidence values)
class TodayDetectionsNotifier extends Notifier<AsyncValue<List<Detection>>> {
  @override
  AsyncValue<List<Detection>> build() {
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
      final api = ref.watch(apiServiceProvider);
      return api.getDetections(date: date);
    });

/// Provider per TUTTE le detection di una data specifica (ordinate per ora decrescente)
final allDetectionsForDateProvider = FutureProvider.autoDispose
    .family<List<Detection>, String>((ref, date) async {
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
      final api = ref.watch(apiServiceProvider);
      return api.getSpeciesList(sort: 'name');
    });

/// Provider per le registrazioni di una specifica specie
final recordingsForSpeciesProvider = FutureProvider.autoDispose
    .family<List<Map<String, dynamic>>, String>((ref, species) async {
      final api = ref.watch(apiServiceProvider);
      return api.getRecordings(species: species, sort: 'date', limit: 100);
    });

/// Provider per l'elenco delle specie in un determinato periodo
final speciesByPeriodProvider = FutureProvider.autoDispose
    .family<
      List<Map<String, dynamic>>,
      ({String? fromDate, String? toDate, String? fromTime, String? toTime})
    >((ref, range) async {
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
  final api = ref.watch(apiServiceProvider);
  return api.getOverview();
});

/// Provider per i dati dei grafici giornalieri (family)
final dailyChartDataProvider = FutureProvider.autoDispose
    .family<Map<String, dynamic>, String>((ref, date) async {
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
  final api = ref.watch(apiServiceProvider);
  // Ne recuperiamo 20 per sicurezza, poi la UI filtrerà le specie
  return api.getRecentDetections(limit: 20);
});
