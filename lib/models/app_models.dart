import 'detection.dart';

enum ServiceState { active, inactive, error, stalled }

class ServiceStatus {
  final String name;
  final String displayName;
  final ServiceState state;
  final String? details;

  ServiceStatus({
    required this.name,
    required this.displayName,
    required this.state,
    this.details,
  });
}

class OverviewData {
  final int totalDetections;
  final int todayDetections;
  final int uniqueSpeciesToday;
  final Detection? mostRecentDetection;
  final List<TopSpecies> topSpeciesToday;
  final String? chartImagePath;

  OverviewData({
    required this.totalDetections,
    required this.todayDetections,
    required this.uniqueSpeciesToday,
    this.mostRecentDetection,
    this.topSpeciesToday = const [],
    this.chartImagePath,
  });
}

class TopSpecies {
  final String commonName;
  final String scientificName;
  final int count;

  TopSpecies({
    required this.commonName,
    required this.scientificName,
    required this.count,
  });
}

class WeeklyReportData {
  final int weekNumber;
  final String startDate;
  final String endDate;
  final int totalDetections;
  final int uniqueSpecies;
  final double totalPercentChange;
  final double speciesPercentChange;
  final List<WeeklySpecies> topSpecies;
  final List<String> newSpecies;

  WeeklyReportData({
    required this.weekNumber,
    required this.startDate,
    required this.endDate,
    required this.totalDetections,
    required this.uniqueSpecies,
    required this.totalPercentChange,
    required this.speciesPercentChange,
    this.topSpecies = const [],
    this.newSpecies = const [],
  });
}

class WeeklySpecies {
  final String commonName;
  final int count;
  final double percentChange;
  final bool isFirstSeen;

  WeeklySpecies({
    required this.commonName,
    required this.count,
    required this.percentChange,
    this.isFirstSeen = false,
  });
}

class DailyChartData {
  final String date;
  final int totalDetections;
  final String? chart1Path;
  final String? chart2Path;

  DailyChartData({
    required this.date,
    required this.totalDetections,
    this.chart1Path,
    this.chart2Path,
  });
}

class Recording {
  final String fileName;
  final String commonName;
  final String scientificName;
  final String date;
  final String time;
  final double confidence;
  final bool isLocked;

  Recording({
    required this.fileName,
    required this.commonName,
    required this.scientificName,
    required this.date,
    required this.time,
    required this.confidence,
    this.isLocked = false,
  });

  String get extractedPath {
    final comName = commonName.replaceAll(' ', '_').replaceAll("'", '');
    return '$date/$comName/$fileName';
  }

  String get confidencePercent => '${(confidence * 100).toStringAsFixed(0)}%';
}

class BirdNetConfig {
  final String latitude;
  final String longitude;
  final String siteName;
  final String model;
  final String language;
  final String? birdweatherId;
  final double confidence;
  final double sensitivity;
  final double overlap;
  final String audioFormat;

  BirdNetConfig({
    required this.latitude,
    required this.longitude,
    required this.siteName,
    required this.model,
    required this.language,
    this.birdweatherId,
    this.confidence = 0.7,
    this.sensitivity = 1.0,
    this.overlap = 0.0,
    this.audioFormat = 'mp3',
  });
}
