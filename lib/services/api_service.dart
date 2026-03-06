import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/api_config.dart';
import '../models/detection.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: ApiConfig.connectTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        headers: {'Accept': 'application/json'},
      ),
    );

    // Interceptor per aggiungere Basic Auth a ogni richiesta
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            final prefs = await SharedPreferences.getInstance();
            final username = prefs.getString('auth_username');
            var password = prefs.getString('auth_password');
            password ??= "";
            if (username != null && username.isNotEmpty) {
              final credentials = base64Encode(
                utf8.encode('$username:$password'),
              );
              options.headers['Authorization'] = 'Basic $credentials';
            }
          } catch (_) {
            // Se non riesce a leggere le credenziali, procede senza auth
          }
          handler.next(options);
        },
      ),
    );
  }

  // ═══════════════════════════════════════
  //  Connessione
  // ═══════════════════════════════════════

  /// Testa la connessione al server BirdNET-Pi
  Future<bool> testConnection(String serverUrl) async {
    try {
      final response = await _dio.get('$serverUrl/api/v2/ping');
      return response.statusCode == 200 && response.data?['success'] == true;
    } catch (e) {
      return false;
    }
  }

  // ═══════════════════════════════════════
  //  Overview
  // ═══════════════════════════════════════

  /// Recupera le statistiche panoramiche
  Future<Map<String, dynamic>> getOverview() async {
    final response = await _dio.get(ApiConfig.overview);
    return response.data['data'];
  }

  // ═══════════════════════════════════════
  //  Detections
  // ═══════════════════════════════════════

  /// Recupera le detection per una data specifica
  Future<List<Detection>> getDetections({
    required String date,
    String? species,
    double? minConfidence,
    int? limit,
    int? offset,
  }) async {
    try {
      final url = ApiConfig.detections(
        date: date,
        species: species,
        minConfidence: minConfidence,
        limit: limit,
        offset: offset,
      );
      final response = await _dio.get(url);
      final data = response.data['data'];
      if (data == null || data['detections'] == null) return [];
      final rawDets = data['detections'];
      final List dets = rawDets is List ? rawDets : [];
      return dets.map((d) => Detection.fromJson(d)).toList();
    } catch (e) {
      return [];
    }
  }

  /// Recupera le detection di oggi (scorciatoia)
  Future<List<Detection>> getTodayDetections({int? limit}) async {
    return getDetections(
      date: DateTime.now().toIso8601String().substring(0, 10),
      limit: limit,
    );
  }

  /// Recupera gli ultimi rilevamenti in assoluto (indipendenti dalla data)
  Future<List<Detection>> getRecentDetections({int? limit}) async {
    try {
      final url = ApiConfig.detections(
        limit: limit,
      ).replaceFirst('/detections', '/detections/recent');
      final response = await _dio.get(url);
      final data = response.data['data'];
      if (data == null || data['detections'] == null) return [];
      final List dets = data['detections'];
      return dets.map((d) => Detection.fromJson(d)).toList();
    } catch (e) {
      return [];
    }
  }

  /// Recupera le detection per data raggruppate per ora (eBird format - una per specie high confidence)
  Future<Map<String, List<Detection>>> getEbirdDetections(String date) async {
    try {
      final response = await _dio.get(ApiConfig.ebirdDetections(date));

      if (response.data['success'] == true) {
        final rawByHour = response.data['data']['detectionsByHour'];
        final Map<String, dynamic> byHour;
        if (rawByHour is Map) {
          byHour = Map<String, dynamic>.from(rawByHour);
        } else {
          byHour = {};
        }

        final Map<String, List<Detection>> result = {};
        byHour.forEach((hour, detections) {
          if (detections is List) {
            result[hour] = detections
                .map((d) => Detection.fromJson(d))
                .toList();
          }
        });
        return result;
      }
      return {};
    } catch (e) {
      return {};
    }
  }

  // ═══════════════════════════════════════
  //  Species
  // ═══════════════════════════════════════

  /// Recupera lista specie con aggregati
  Future<List<Map<String, dynamic>>> getSpeciesList({
    String sort = 'occurrences',
    String? date,
  }) async {
    final url = ApiConfig.speciesListSorted(sort: sort, date: date);
    final response = await _dio.get(url);
    return List<Map<String, dynamic>>.from(
      response.data['data']['species'] ?? [],
    );
  }

  /// Recupera dettaglio specie (info + best detection + trend + image)
  Future<Map<String, dynamic>> getSpeciesDetail(String sciName) async {
    final response = await _dio.get(ApiConfig.speciesDetail(sciName));
    return response.data['data'];
  }

  // ═══════════════════════════════════════
  //  Recordings
  // ═══════════════════════════════════════

  /// Crea e scarica archivio ZIP di esportazione
  Future<String?> createExportZip(
    String date,
    List<Map<String, String>> files,
  ) async {
    try {
      final response = await _dio.post(
        ApiConfig.ebirdExport,
        data: {'date': date, 'files': files},
        options: Options(contentType: 'application/json'),
      );

      if (response.data['success'] == true) {
        final relativeUrl = response.data['data']['download_url'];
        // Use Uri.base to resolve the relative url to an absolute one
        return Uri.base.resolve(relativeUrl).toString();
      } else {
        throw Exception(
          response.data['error'] ?? 'Errore sconosciuto dal server',
        );
      }
    } on DioException catch (e) {
      if (e.response?.data != null && e.response?.data['error'] != null) {
        throw Exception(e.response!.data['error']);
      }
      rethrow;
    }
  }

  /// Recupera registrazioni per data/specie
  Future<List<Map<String, dynamic>>> getRecordings({
    String? date,
    String? species,
    String sort = 'date',
    int? limit,
  }) async {
    final url = ApiConfig.recordings(
      date: date,
      species: species,
      sort: sort,
      limit: limit,
    );
    final response = await _dio.get(url);
    return List<Map<String, dynamic>>.from(
      response.data['data']['recordings'] ?? [],
    );
  }

  /// Cancella una registrazione
  Future<bool> deleteRecording(String fileName) async {
    try {
      final response = await _dio.delete(ApiConfig.recordingDelete(fileName));
      return response.data['success'] == true;
    } catch (e) {
      return false;
    }
  }

  /// Cambia identificazione di una registrazione
  Future<bool> changeRecordingId(String fileName, String newName) async {
    try {
      final response = await _dio.put(
        ApiConfig.recordingChangeId(fileName),
        data: {'new_name': newName},
      );
      return response.data['success'] == true;
    } catch (e) {
      return false;
    }
  }

  /// Toggle protezione file
  Future<bool> toggleFileLock(String fileName, bool lock) async {
    try {
      final response = await _dio.put(
        ApiConfig.recordingLock(fileName),
        data: {'locked': lock},
      );
      return response.data['success'] == true;
    } catch (e) {
      return false;
    }
  }

  // ═══════════════════════════════════════
  //  Charts
  // ═══════════════════════════════════════

  /// Recupera dati grafici giornalieri
  Future<Map<String, dynamic>> getDailyChartData(String date) async {
    final response = await _dio.get(ApiConfig.dailyChart(date));
    return response.data['data'];
  }

  /// Recupera date disponibili con conteggio
  Future<List<Map<String, dynamic>>> getChartDates() async {
    final response = await _dio.get(ApiConfig.chartDates);
    return List<Map<String, dynamic>>.from(
      response.data['data']['dates'] ?? [],
    );
  }

  /// URL immagine grafico
  String getDailyChartUrl(String date) =>
      ApiConfig.chartImage('Combo-$date.png');
  String getDailyChart2Url(String date) =>
      ApiConfig.chartImage('Combo2-$date.png');

  // ═══════════════════════════════════════
  //  Weekly Report
  // ═══════════════════════════════════════

  /// Recupera il report settimanale strutturato
  Future<Map<String, dynamic>> getWeeklyReport({String? date}) async {
    final response = await _dio.get(ApiConfig.weeklyReport(date: date));
    return response.data['data'];
  }

  // ═══════════════════════════════════════
  //  Configurazione
  // ═══════════════════════════════════════

  // ─── CONFIG ────────────────────────────────────────────────────────────────

  Future<Map<String, dynamic>> getRecordingLength() async {
    final response = await _dio.get(ApiConfig.recordinglengthLocationConfig);
    return response.data['data'] as Map<String, dynamic>;
  }

  /// Recupera la lingua del database dal server (no auth)
  Future<String> getDatabaseLang() async {
    try {
      final response = await _dio.get(ApiConfig.databaseLang);
      return (response.data['data']['DATABASE_LANG'] as String?) ?? 'en';
    } catch (e) {
      return 'en'; // fallback
    }
  }

  /// Recupera la configurazione corrente
  Future<Map<String, dynamic>> getConfig() async {
    final response = await _dio.get(ApiConfig.config);
    return response.data['data'];
  }

  /// Aggiorna la configurazione
  Future<bool> updateConfig(Map<String, dynamic> settings) async {
    try {
      final response = await _dio.put(ApiConfig.config, data: settings);
      return response.data['success'] == true;
    } catch (e) {
      return false;
    }
  }

  /// Recupera la configurazione di localizzazione per eBird esportazione
  Future<Map<String, String>> getLocationConfig() async {
    try {
      final response = await _dio.get(ApiConfig.ebirdLocationConfig);
      return Map<String, String>.from(response.data['data']);
    } catch (e) {
      throw Exception('Errore nel recupero della configurazione: $e');
    }
  }

  // ═══════════════════════════════════════
  //  Services
  // ═══════════════════════════════════════

  /// Recupera lo stato di tutti i servizi
  Future<List<Map<String, dynamic>>> getServices() async {
    final response = await _dio.get(ApiConfig.services);
    return List<Map<String, dynamic>>.from(
      response.data['data']['services'] ?? [],
    );
  }

  /// Esegue un'azione su un servizio (start, stop, restart, enable, disable)
  Future<Map<String, dynamic>> serviceAction(
    String serviceName,
    String action,
  ) async {
    final response = await _dio.post(
      ApiConfig.serviceAction(serviceName),
      data: {'action': action},
    );
    return response.data['data'];
  }

  // ═══════════════════════════════════════
  //  System
  // ═══════════════════════════════════════

  /// Esegue un'azione di sistema (reboot, shutdown, update, clear-data, info)
  Future<Map<String, dynamic>> systemAction(String action) async {
    // Some actions (update, clear-data) spawn long scripts: use an extended
    // timeout on the client so we never abort before the server responds.
    final opts = Options(receiveTimeout: const Duration(seconds: 60));
    final response = await _dio.post(
      ApiConfig.systemAction(action),
      options: opts,
    );
    return response.data['data'] ?? {'message': 'OK'};
  }

  /// Recupera informazioni di sistema
  Future<Map<String, dynamic>> getSystemInfo() async {
    final response = await _dio.get(ApiConfig.systemInfo);
    return response.data['data'];
  }

  // ═══════════════════════════════════════
  //  Species Lists
  // ═══════════════════════════════════════

  /// Recupera lista specie per tipo (included, excluded, whitelist)
  Future<List<String>> getSpeciesListByType(String type) async {
    final response = await _dio.get(ApiConfig.speciesListByType(type));
    return List<String>.from(response.data['data']['species'] ?? []);
  }

  /// Aggiorna lista specie completa
  Future<bool> updateSpeciesList(String type, List<String> species) async {
    try {
      final response = await _dio.put(
        ApiConfig.speciesListByType(type),
        data: {'species': species},
      );
      return response.data['success'] == true;
    } catch (e) {
      return false;
    }
  }

  /// Aggiungi/rimuovi singola specie dalla lista
  Future<bool> modifySpeciesList(
    String type,
    String speciesName,
    String action,
  ) async {
    try {
      final response = await _dio.post(
        ApiConfig.speciesListByType(type),
        data: {'action': action, 'species_name': speciesName},
      );
      return response.data['success'] == true;
    } catch (e) {
      return false;
    }
  }

  // ═══════════════════════════════════════
  //  Image
  // ═══════════════════════════════════════

  /// Recupera immagine di una specie
  Future<Map<String, dynamic>?> getSpeciesImage(String sciName) async {
    try {
      final response = await _dio.get(ApiConfig.image(sciName));
      if (response.data['success'] == true) {
        return response.data['data'];
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // ═══════════════════════════════════════
  //  Media URLs
  // ═══════════════════════════════════════

  /// URL dell'audio estratto
  String getAudioUrl(String extractedPath) =>
      ApiConfig.extractedAudio(extractedPath);

  /// URL dell'immagine dello spettrogramma
  String getSpectrogramImageUrl(String extractedPath) =>
      ApiConfig.extractedImage(extractedPath);

  /// URL dello stream audio live con credenziali integrate
  Future<String> getLiveStreamUrl() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('auth_username');
    final password = prefs.getString('auth_password');

    // Recuperiamo rigorosamente l'URL originario da Uri.base.origin
    // proprio come faceva il vecchio codice _buildStreamUrl che funzionava,
    // per non incorporare path imprevisti o porte sbagliate.
    final origin = Uri.base.origin;
    final uri = Uri.parse(origin);

    if (username != null &&
        username.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      final authUri = Uri(
        scheme: uri.scheme,
        userInfo:
            '${Uri.encodeComponent(username)}:${Uri.encodeComponent(password)}',
        host: uri.host,
        port: uri.port,
        path: '/stream',
      );
      return authUri.toString();
    }

    return '$origin/stream';
  }

  /// Recupera le rilevationi live JSON dalla directory StreamData in tempo reale
  Future<Map<String, dynamic>> getLiveStreamDetections({
    String? newestFile,
  }) async {
    try {
      final origin = Uri.base.origin;
      final uriStr =
          '$origin/api/v2/stream/detections${newestFile != null ? '?newest_file=$newestFile' : ''}';
      final response = await _dio.get(uriStr);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return response.data['data'] as Map<String, dynamic>;
      }
      return {};
    } catch (_) {
      return {};
    }
  }

  // ═══════════════════════════════════════
  //  Logs
  // ═══════════════════════════════════════

  /// Recupera i log di analisi (con supporto ai cursori)
  Future<Map<String, dynamic>> getAnalysisLogs({
    String? cursor,
    int? lines,
  }) async {
    final url = ApiConfig.logs(cursor: cursor, lines: lines);
    final response = await _dio.get(url);
    if (response.data['success'] == true) {
      return response.data['data'];
    }
    throw Exception(response.data['error'] ?? 'Errore nel recupero dei log');
  }
}
