import '../models/detection.dart';

class EBirdCsvGenerator {
  static String generateCsv({
    required List<Detection> detections,
    required Map<Detection, String> detectionCounts,
    required String dateStr,
    required Map<String, String> hourlyProtocols,
    required Map<String, dynamic> locationData,
    required int observersCount,
    required String comments,
    required bool includeAudioLinks,
  }) {
    StringBuffer csv = StringBuffer();

    // Group species by hour (HH)
    final Map<String, Map<String, dynamic>> speciesByHour = {};

    for (final d in detections) {
      if (d.time.length < 2) continue;
      final hour = d.time.substring(0, 2);

      if (!speciesByHour.containsKey(hour)) {
        speciesByHour[hour] = {};
      }

      final key = d.scientificName;
      final currentForSpecies = speciesByHour[hour]![key];

      // Keep the detection with the highest confidence
      if (currentForSpecies == null ||
          d.confidence > (currentForSpecies['confidence'] as double)) {
        speciesByHour[hour]![key] = {
          'detection': d,
          'count': detectionCounts[d] ?? 'X',
          'confidence': d.confidence,
        };
      }
    }

    final sortedHours = speciesByHour.keys.toList()..sort();

    for (final hour in sortedHours) {
      final hourSpeciesMap = speciesByHour[hour]!;
      final startTime = '$hour:00';
      const duration = '60';

      final protocol = hourlyProtocols[hour] ?? 'Stationary';
      final hourlyComment = '$comments - Hourly checklist $hour:00-$hour:59';

      for (final speciesData in hourSpeciesMap.values) {
        final Detection species = speciesData['detection'];
        final count = speciesData['count'];

        // Split date (assuming yyyy-MM-dd)
        final parts = dateStr.split('-');
        String myDate = dateStr;
        if (parts.length >= 3) {
          final myYear = parts[0];
          final myMonth = parts[1];
          final myDay = parts[2].substring(0, 2);
          myDate = '$myMonth/$myDay/$myYear';
        }

        String speciesComment =
            'Confidence: ${(species.confidence * 100).toStringAsFixed(1)}%';
        if (includeAudioLinks && species.fileName.isNotEmpty) {
          speciesComment += ' | Audio: ${species.fileName}';
        }

        final countryCode = locationData['countryCode'] ?? '';
        String myStateProvince = '';
        if (countryCode.toUpperCase() == 'US') {
          myStateProvince = escapeCSV(locationData['stateProvince'] ?? '');
        }

        final row = [
          escapeCSV(species.commonName),
          escapeCSV(''), // Genus
          escapeCSV(species.scientificName),
          count,
          escapeCSV(speciesComment),
          escapeCSV(locationData['locality'] ?? ''),
          locationData['latitude'] ?? '',
          locationData['longitude'] ?? '',
          myDate,
          startTime,
          myStateProvince,
          escapeCSV(countryCode),
          protocol,
          observersCount.toString(),
          duration,
          'N',
          '',
          '',
          escapeCSV(hourlyComment),
        ];

        csv.writeln(row.join(','));
      }
    }

    return csv.toString();
  }

  static String escapeCSV(String value) {
    if (value.contains(',') || value.contains('"') || value.contains('\n')) {
      return '"${value.replaceAll('"', '""')}"';
    }
    return value;
  }
}
