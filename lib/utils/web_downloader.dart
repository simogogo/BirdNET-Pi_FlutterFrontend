import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;

class WebDownloader {
  static Future<bool> downloadStringAsFile({
    required String content,
    required String filename,
  }) async {
    try {
      if (kIsWeb) {
        // We use universal_html to support web downloading without crashing mobile compilation
        final bytes = utf8.encode(content);
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        html.AnchorElement(href: url)
          ..setAttribute('download', filename)
          ..click();
        html.Url.revokeObjectUrl(url);
        return true;
      } else {
        // On mobile, fallback to data URI or let users handle it
        final base64Csv = base64Encode(utf8.encode(content));
        final uri = Uri.parse('data:text/csv;base64,$base64Csv');
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
          return true;
        }
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
