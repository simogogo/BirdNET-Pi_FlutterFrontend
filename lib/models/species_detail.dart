import 'detection.dart';

class SpeciesDetail {
  final String comName;
  final String sciName;
  final int detectionCount;
  final double maxConfidence;
  final String firstSeen;
  final String lastSeen;
  final double avgConfidence;
  final Detection? bestDetection;
  final List<DailyTrend> dailyTrend;
  final String? imageUrl;
  final String? base64Data;
  final String? infoUrl;
  final String? infoTitle;

  SpeciesDetail({
    required this.comName,
    required this.sciName,
    required this.detectionCount,
    required this.maxConfidence,
    required this.firstSeen,
    required this.lastSeen,
    required this.avgConfidence,
    this.bestDetection,
    required this.dailyTrend,
    this.imageUrl,
    this.base64Data,
    this.infoUrl,
    this.infoTitle,
  });

  factory SpeciesDetail.fromJson(Map<String, dynamic> json) {
    var trendList = json['daily_trend'] as List? ?? [];
    List<DailyTrend> trend = trendList
        .map((i) => DailyTrend.fromJson(i))
        .toList();

    return SpeciesDetail(
      comName: json['Com_Name'] ?? '',
      sciName: json['Sci_Name'] ?? '',
      detectionCount: json['detection_count'] ?? 0,
      maxConfidence: (json['max_confidence'] ?? 0).toDouble(),
      firstSeen: json['first_seen'] ?? '',
      lastSeen: json['last_seen'] ?? '',
      avgConfidence: (json['avg_confidence'] ?? 0).toDouble(),
      bestDetection: json['best_detection'] != null
          ? Detection.fromJson(json['best_detection'])
          : null,
      dailyTrend: trend,
      imageUrl: json['image'] != null ? json['image']['image_url'] : null,
      base64Data: json['image'] != null ? json['image']['base64_data'] : null,
      infoUrl: json['info_url'],
      infoTitle: json['info_title'],
    );
  }
}

class DailyTrend {
  final String date;
  final int count;

  DailyTrend({required this.date, required this.count});

  factory DailyTrend.fromJson(Map<String, dynamic> json) {
    return DailyTrend(date: json['date'] ?? '', count: json['count'] ?? 0);
  }
}
