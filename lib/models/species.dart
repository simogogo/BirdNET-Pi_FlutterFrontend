class Species {
  final String commonName;
  final String scientificName;
  final int detectionCount;
  final double maxConfidence;
  final String? lastSeen;
  final String? imageUrl;
  final double? probability;
  final int? filesOnDisk;
  final bool isConfirmed;
  final bool isExcluded;
  final bool isWhitelisted;

  Species({
    required this.commonName,
    required this.scientificName,
    this.detectionCount = 0,
    this.maxConfidence = 0,
    this.lastSeen,
    this.imageUrl,
    this.probability,
    this.filesOnDisk,
    this.isConfirmed = false,
    this.isExcluded = false,
    this.isWhitelisted = false,
  });

  String get maxConfidencePercent =>
      '${(maxConfidence * 100).toStringAsFixed(1)}%';

  Species copyWith({
    String? commonName,
    String? scientificName,
    int? detectionCount,
    double? maxConfidence,
    String? lastSeen,
    String? imageUrl,
    double? probability,
    int? filesOnDisk,
    bool? isConfirmed,
    bool? isExcluded,
    bool? isWhitelisted,
  }) {
    return Species(
      commonName: commonName ?? this.commonName,
      scientificName: scientificName ?? this.scientificName,
      detectionCount: detectionCount ?? this.detectionCount,
      maxConfidence: maxConfidence ?? this.maxConfidence,
      lastSeen: lastSeen ?? this.lastSeen,
      imageUrl: imageUrl ?? this.imageUrl,
      probability: probability ?? this.probability,
      filesOnDisk: filesOnDisk ?? this.filesOnDisk,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      isExcluded: isExcluded ?? this.isExcluded,
      isWhitelisted: isWhitelisted ?? this.isWhitelisted,
    );
  }
}
