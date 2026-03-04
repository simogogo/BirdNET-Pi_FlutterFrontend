import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/detection.dart';
import '../services/api_service.dart';

/// Provider per le detection di oggi
final todayDetectionsProvider =
    FutureProvider.autoDispose<Map<String, List<Detection>>>((ref) async {
      final api = ref.watch(apiServiceProvider);
      final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
      return api.getDetectionsByDate(today);
    });

/// Provider per le detection di una data specifica (raggruppate per ora, formato eBird — una per specie)
final detectionsForDateProvider = FutureProvider.autoDispose
    .family<Map<String, List<Detection>>, String>((ref, date) async {
      final api = ref.watch(apiServiceProvider);
      return api.getDetectionsByDate(date);
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

/// Provider derivato: lista flat di tutte le detection di oggi
final todayDetectionsFlatProvider = FutureProvider.autoDispose<List<Detection>>((
  ref,
) async {
  final byHour = await ref.watch(todayDetectionsProvider.future);
  final flat = <Detection>[];
  // Ordina per hora decrescente
  final sortedHours = byHour.keys.toList()..sort((a, b) => b.compareTo(a));
  for (final hour in sortedHours) {
    flat.addAll(byHour[hour]!);
  }
  // Ordina per data+ora decrescente per garantire che il primo sia l'ultimo rilevamento
  flat.sort((a, b) {
    final dateTimeA = '${a.date} ${a.time}';
    final dateTimeB = '${b.date} ${b.time}';
    return dateTimeB.compareTo(dateTimeA);
  });
  return flat;
});

/// Conteggio specie uniche oggi
final uniqueSpeciesTodayProvider = FutureProvider.autoDispose<int>((ref) async {
  final detections = await ref.watch(todayDetectionsFlatProvider.future);
  return detections.map((d) => d.scientificName).toSet().length;
});

/// Conteggio totale detection oggi
final totalDetectionsTodayProvider = FutureProvider.autoDispose<int>((
  ref,
) async {
  final detections = await ref.watch(todayDetectionsFlatProvider.future);
  return detections.length;
});

/// Provider per le statistiche generali (overview)
final overviewProvider = FutureProvider.autoDispose<Map<String, dynamic>>((
  ref,
) async {
  final api = ref.watch(apiServiceProvider);
  return api.getOverview();
});
