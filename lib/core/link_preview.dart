// lib/core/link_preview.dart
//
// Fetches OpenGraph metadata for a URL directly from the sender's device
// (never through the Koda server -- see the koda-server commit this
// pairs with for why). Uses its own bare Dio instance, deliberately not
// KodaApi's, since that one injects the user's auth Bearer token into
// every request and this fetches arbitrary third-party URLs.

import 'dart:convert';
import 'package:dio/dio.dart';

final _urlRegex = RegExp(r'https?://[^\s<>"\x27]+', caseSensitive: false);
const _maxFetchBytes = 200 * 1024;

/// The first http(s) URL found in [text], if any.
String? firstUrl(String text) => _urlRegex.firstMatch(text)?.group(0);

/// Fetches and parses OG tags for [url]. Returns null on any failure --
/// a broken preview must never block or corrupt sending a message.
Future<Map<String, String>?> fetchLinkPreview(String url) async {
  try {
    final uri = Uri.parse(url);
    if (uri.scheme != 'http' && uri.scheme != 'https') return null;

    final dio = Dio();
    try {
      final response = await dio.get<ResponseBody>(
        url,
        options: Options(
          responseType: ResponseType.stream,
          receiveTimeout: const Duration(seconds: 6),
          sendTimeout: const Duration(seconds: 6),
          followRedirects: true,
          maxRedirects: 5,
        ),
      );

      final bytes = <int>[];
      await for (final chunk in response.data!.stream) {
        bytes.addAll(chunk);
        if (bytes.length >= _maxFetchBytes) break;
      }
      final html = utf8.decode(bytes, allowMalformed: true);

      final meta = _extractMeta(html);
      final title = meta['og:title'] ?? _extractTitleTag(html);
      if (title == null || title.trim().isEmpty) return null;

      return {
        'url': url,
        'title': _unescapeHtml(title.trim()),
        if ((meta['og:description'] ?? meta['description']) != null)
          'description': _unescapeHtml((meta['og:description'] ?? meta['description'])!.trim()),
        if (meta['og:image'] != null) 'image_url': _resolveUrl(uri, meta['og:image']!),
      };
    } finally {
      dio.close(force: true);
    }
  } catch (_) {
    return null;
  }
}

final _metaTagRe = RegExp(r'<meta\s+[^>]*>', caseSensitive: false, dotAll: true);
final _propRe = RegExp('''(?:property|name)\\s*=\\s*["']([^"']+)["']''', caseSensitive: false);
final _contentRe = RegExp('''content\\s*=\\s*["']([^"']*)["']''', caseSensitive: false);
final _titleTagRe = RegExp(r'<title[^>]*>([^<]*)</title>', caseSensitive: false, dotAll: true);

Map<String, String> _extractMeta(String html) {
  final result = <String, String>{};
  for (final tag in _metaTagRe.allMatches(html)) {
    final t = tag.group(0)!;
    final prop = _propRe.firstMatch(t)?.group(1)?.toLowerCase();
    final content = _contentRe.firstMatch(t)?.group(1);
    if (prop != null && content != null && content.isNotEmpty) result[prop] = content;
  }
  return result;
}

String? _extractTitleTag(String html) => _titleTagRe.firstMatch(html)?.group(1);

String _resolveUrl(Uri base, String maybeRelative) {
  try {
    return base.resolve(maybeRelative).toString();
  } catch (_) {
    return maybeRelative;
  }
}

String _unescapeHtml(String s) => s
    .replaceAll('&amp;', '&')
    .replaceAll('&lt;', '<')
    .replaceAll('&gt;', '>')
    .replaceAll('&quot;', '"')
    .replaceAll('&#39;', "'")
    .replaceAll('&apos;', "'");
