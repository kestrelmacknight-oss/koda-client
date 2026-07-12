// lib/core/storage.dart
//
// Persists the JWT between app launches using shared_preferences.
//
// NOTE: shared_preferences stores data in a plain local file -- adequate
// for an Alpha build. Before a wider release, swap this for
// flutter_secure_storage (Windows Credential Manager-backed) so the
// token isn't sitting in a readable file on disk.

import 'package:shared_preferences/shared_preferences.dart';
import 'config.dart';

class KodaStorage {
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(KodaConfig.tokenStorageKey, token);
  }

  static Future<String?> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(KodaConfig.tokenStorageKey);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(KodaConfig.tokenStorageKey);
  }
}
