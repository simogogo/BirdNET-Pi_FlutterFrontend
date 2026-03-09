import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class WikipediaService {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'User-Agent':
            'BirdNET-Pi-Companion-App/1.0 (https://github.com/simogogo/BirdNET-Pi_FlutterFrontend)',
      },
    ),
  );

  /// Fetches a summary and main image for a species from Wikipedia.
  /// [scientificName] e.g. "Turdus merula"
  /// [languageCode] e.g. "it", "en"
  Future<Map<String, dynamic>?> fetchSpeciesSummary(
    String scientificName,
    String languageCode,
  ) async {
    try {
      // Step 1: Search for the page title based on the scientific name
      // We use the 'query' API to find pages that match the scientific name
      final searchUrl =
          'https://$languageCode.wikipedia.org/w/api.php?action=query&list=search&srsearch=${Uri.encodeComponent(scientificName)}&format=json&origin=*';
      final searchResponse = await _dio.get(searchUrl);

      final searchResults = searchResponse.data['query']['search'] as List;
      if (searchResults.isEmpty) return null;

      // Use the first result's title
      final title = searchResults[0]['title'];

      // Step 2: Get summary and page image
      final summaryUrl =
          'https://$languageCode.wikipedia.org/api/rest_v1/page/summary/${Uri.encodeComponent(title)}';
      final summaryResponse = await _dio.get(summaryUrl);

      if (summaryResponse.statusCode == 200) {
        final data = summaryResponse.data;
        return {
          'title': data['title'],
          'description': data['description'],
          'extract': data['extract'],
          'thumbnail': data['thumbnail'] != null
              ? data['thumbnail']['original'] ?? data['thumbnail']['source']
              : null,
          'content_urls': data['content_urls'] != null
              ? data['content_urls']['desktop']['page']
              : 'https://$languageCode.wikipedia.org/wiki/${Uri.encodeComponent(title)}',
        };
      }
    } catch (e) {
      debugPrint(
        'Error fetching Wikipedia summary for $scientificName in $languageCode: $e',
      );
    }
    return null;
  }
}
