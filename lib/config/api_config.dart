/// Configurazione dell'API per connettersi all'istanza BirdNET-Pi
class ApiConfig {
  /// Il backend è sempre sulla stessa origine del frontend.
  /// Usando stringa vuota tutti gli URL diventano relativi (es. '/api/v2/overview')
  static const String baseUrl = '';

  /// Timeout per le richieste HTTP
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // ═══════════════════════════════════════
  // REST API v2 endpoints
  // ═══════════════════════════════════════

  // Utility
  static String get ping => '$baseUrl/api/v2/ping';

  // Overview
  static String get overview => '$baseUrl/api/v2/overview';

  // Detections
  static String detections({
    String? date,
    String? species,
    double? minConfidence,
    int? limit,
    int? offset,
  }) {
    final params = <String, String>{};
    if (date != null) params['date'] = date;
    if (species != null) params['species'] = species;
    if (minConfidence != null) {
      params['min_confidence'] = minConfidence.toString();
    }
    if (limit != null) params['limit'] = limit.toString();
    if (offset != null) params['offset'] = offset.toString();
    return _withParams('$baseUrl/api/v2/detections', params);
  }

  // Species
  static String get speciesList => '$baseUrl/api/v2/species';
  static String speciesDetail(String sciName) =>
      '$baseUrl/api/v2/species/${Uri.encodeComponent(sciName)}';
  static String speciesListSorted({String sort = 'occurrences', String? date}) {
    final params = <String, String>{'sort': sort};
    if (date != null) params['date'] = date;
    return _withParams('$baseUrl/api/v2/species', params);
  }

  // Recordings
  static String recordings({
    String? date,
    String? species,
    String sort = 'date',
    int? limit,
  }) {
    final params = <String, String>{'sort': sort};
    if (date != null) params['date'] = date;
    if (species != null) params['species'] = species;
    if (limit != null) params['limit'] = limit.toString();
    return _withParams('$baseUrl/api/v2/recordings', params);
  }

  static String recordingDelete(String fileName) =>
      '$baseUrl/api/v2/recordings/${Uri.encodeComponent(fileName)}';
  static String recordingChangeId(String fileName) =>
      '$baseUrl/api/v2/recordings/${Uri.encodeComponent(fileName)}/id';
  static String recordingLock(String fileName) =>
      '$baseUrl/api/v2/recordings/${Uri.encodeComponent(fileName)}/lock';

  // Charts
  static String dailyChart(String date) =>
      '$baseUrl/api/v2/charts/daily?date=$date';
  static String get chartDates => '$baseUrl/api/v2/charts/dates';

  // Weekly Report
  static String weeklyReport({String? date}) {
    if (date != null) return '$baseUrl/api/v2/report/weekly?date=$date';
    return '$baseUrl/api/v2/report/weekly';
  }

  // Configuration
  static String get config => '$baseUrl/api/v2/config';

  // Services
  static String get services => '$baseUrl/api/v2/services';
  static String serviceAction(String serviceName) =>
      '$baseUrl/api/v2/services/$serviceName';

  // System
  static String get systemInfo => '$baseUrl/api/v2/system/info';
  static String systemAction(String action) => '$baseUrl/api/v2/system/$action';

  // Species Lists
  static String speciesListByType(String type) =>
      '$baseUrl/api/v2/species-lists/$type';

  // Image
  static String image(String sciName) =>
      '$baseUrl/api/v2/image/${Uri.encodeComponent(sciName)}';

  // Auth
  static String get authLogin => '$baseUrl/api/v2/auth/login';

  // Logs
  static String logs({String? cursor, int? lines}) {
    final params = <String, String>{};
    if (cursor != null) params['cursor'] = cursor;
    if (lines != null) params['lines'] = lines.toString();
    return _withParams('$baseUrl/api/v2/logs', params);
  }

  // Stream
  static String get streamInfo => '$baseUrl/api/v2/stream';
  static String get liveAudioStream => '$baseUrl/stream';

  // eBird
  static String get ebirdLocationConfig => '$baseUrl/api/v2/ebird/location';

  // recordinglength
  static String get recordinglengthLocationConfig =>
      '$baseUrl/api/v2/recordinglength';

  // database-lang
  static String get databaseLang => '$baseUrl/api/v2/database-lang';

  static String ebirdDetections(String date) =>
      '$baseUrl/api/v2/ebird/ebirddetections?date=$date';
  static String get ebirdExport => '$baseUrl/api/v2/ebird/export';

  // Media files (direct access, not through API)
  static String extractedAudio(String path) => '$baseUrl/api/v2/media/$path';
  static String extractedImage(String path) =>
      '$baseUrl/api/v2/media/$path.png';

  /// Recupera l'immagine del grafico
  static String chartImage(String filename) =>
      '$baseUrl/api/v2/chart/$filename';

  // ═══════════════════════════════════════
  // Helper
  // ═══════════════════════════════════════
  static String _withParams(String url, Map<String, String> params) {
    if (params.isEmpty) return url;
    final query = params.entries
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
        .join('&');
    return '$url?$query';
  }
}
