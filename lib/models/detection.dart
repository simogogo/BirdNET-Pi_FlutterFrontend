class Detection {
  final String date;
  final String time;
  final String commonName;
  final String scientificName;
  final double confidence;
  final String fileName;
  final String? latitude;
  final String? longitude;
  final bool isLocked;

  Detection({
    required this.date,
    required this.time,
    required this.commonName,
    required this.scientificName,
    required this.confidence,
    required this.fileName,
    this.latitude,
    this.longitude,
    this.isLocked = false,
  });

  factory Detection.fromJson(Map<String, dynamic> json) {
    return Detection(
      date: json['date'] ?? json['Date'] ?? '',
      time: json['time'] ?? json['Time'] ?? '',
      commonName: json['common_name'] ?? json['Com_Name'] ?? '',
      scientificName: json['scientific_name'] ?? json['Sci_Name'] ?? '',
      confidence: (json['confidence'] ?? json['Confidence'] ?? 0).toDouble(),
      fileName: json['filename'] ?? json['File_Name'] ?? '',
      latitude: json['latitude']?.toString(),
      longitude: json['longitude']?.toString(),
      isLocked: json['is_locked'] == true,
    );
  }

  String get confidencePercent => '${(confidence * 100).toStringAsFixed(0)}%';

  String get commonNameSafe => commonName.replaceAll("'", '');

  /// Path relativo del file audio estratto
  String get extractedPath {
    final comName = commonName.replaceAll(' ', '_').replaceAll("'", '');
    return '$date/$comName/$fileName';
  }

  Detection copyWith({
    String? date,
    String? time,
    String? commonName,
    String? scientificName,
    double? confidence,
    String? fileName,
    String? latitude,
    String? longitude,
    bool? isLocked,
  }) {
    return Detection(
      date: date ?? this.date,
      time: time ?? this.time,
      commonName: commonName ?? this.commonName,
      scientificName: scientificName ?? this.scientificName,
      confidence: confidence ?? this.confidence,
      fileName: fileName ?? this.fileName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isLocked: isLocked ?? this.isLocked,
    );
  }
}

class DetectionsByHour {
  final String hour;
  final List<Detection> detections;

  DetectionsByHour({required this.hour, required this.detections});
}
