// lib/core/storage.dart
//
// Persists the JWT between app launches using flutter_secure_storage
// (Windows Credential Manager / macOS Keychain / Android Keystore /
// Linux Secret Service, depending on platform) -- previously this was
// shared_preferences, a plain-text file on disk. On first read after
// upgrading, any token still sitting in the old shared_preferences
// store is migrated over and the old copy is cleared, so existing
// sessions don't get silently logged out.

import 'package:shared_preferences/shared_preferences.dart';
import 'config.dart';
import 'secure_storage.dart';

class KodaStorage {
  static Future<void> saveToken(String token) => SecureStorage.saveToken(token);

  static Future<String?> loadToken() async {
    final token = await SecureStorage.loadToken();
    if (token != null) return token;
    return _migrateLegacyToken();
  }

  static Future<void> clearToken() => SecureStorage.clearToken();

  static Future<String?> _migrateLegacyToken() async {
    final prefs = await SharedPreferences.getInstance();
    final legacy = prefs.getString(KodaConfig.tokenStorageKey);
    if (legacy == null) return null;
    await SecureStorage.saveToken(legacy);
    await prefs.remove(KodaConfig.tokenStorageKey);
    return legacy;
  }
}
