// lib/core/steam_app_names.dart
//
// Resolves a Steam appid to its display name via Steam's own public,
// unauthenticated store API -- no API key needed client-side, same
// reasoning as fetching a link preview's own image directly from its
// source rather than Koda holding a games-metadata table. Shared by
// the library-comparison screen and the "manage synced games" screen,
// both of which render the same appid list.

import 'package:dio/dio.dart';

class SteamAppNames {
  SteamAppNames._();
  static final _http = Dio();
  static final Map<int, String> _cache = {};

  static String? cached(int appId) => _cache[appId];

  static Future<String?> resolve(int appId) async {
    if (_cache.containsKey(appId)) return _cache[appId];
    try {
      final res = await _http.get(
          'https://store.steampowered.com/api/appdetails',
          queryParameters: {'appids': appId, 'filters': 'basic'});
      final entry = res.data['$appId'] as Map<String, dynamic>?;
      final name = (entry?['data'] as Map<String, dynamic>?)?['name'] as String?;
      if (name != null) _cache[appId] = name;
      return name;
    } catch (_) {
      return null;
    }
  }
}
