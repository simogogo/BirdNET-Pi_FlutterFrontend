import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';
import '../utils/labels_helper.dart';
import 'database_lang_provider.dart';

/// Provider che recupera le label del modello e della lingua attivi dal server
/// (`/api/v2/labels`), con fallback agli asset locali in caso di errore/offline.
final speciesLabelsProvider = FutureProvider<List<String>>((ref) async {
  try {
    final labels = await ref.read(apiServiceProvider).getLabels();
    if (labels.isNotEmpty) {
      return labels;
    }
  } catch (e) {
    debugPrint('Fallback to local labels asset (/api/v2/labels error): $e');
  }

  try {
    final lang = await ref.read(databaseLangProvider.future);
    final content = await rootBundle.loadString(labelsAssetPath(lang));
    return const LineSplitter()
        .convert(content)
        .where((line) => line.trim().isNotEmpty)
        .toList();
  } catch (e) {
    debugPrint('Errore durante il caricamento fallback delle label locali: $e');
    return [];
  }
});
