import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/wikipedia_service.dart';
import 'database_lang_provider.dart';

final wikipediaServiceProvider = Provider((ref) => WikipediaService());

final wikipediaSummaryProvider =
    FutureProvider.family<Map<String, dynamic>?, String>((
      ref,
      scientificName,
    ) async {
      final service = ref.watch(wikipediaServiceProvider);
      final langCode = await ref.watch(databaseLangProvider.future);

      return service.fetchSpeciesSummary(scientificName, langCode);
    });
