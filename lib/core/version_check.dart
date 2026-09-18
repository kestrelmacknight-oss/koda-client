// lib/core/version_check.dart
//
// Checks the public, no-auth GET /version endpoint (koda-server's
// VersionController) once at startup and nudges the user toward
// koda.fyi/#download when a newer build exists. The API method
// (KodaApi.checkVersion) and server endpoint already existed --
// nothing was actually calling either of them before this.

import 'package:shared_preferences/shared_preferences.dart';
import 'api.dart';
import 'config.dart';

class VersionCheckResult {
  final String latestVersion;
  final String downloadUrl;
  final String releaseNotes;
  final bool required;
  const VersionCheckResult({
    required this.latestVersion,
    required this.downloadUrl,
    required this.releaseNotes,
    required this.required,
  });
}

/// Numeric segment-by-segment comparison ("0.9.0" < "0.10.0", where a
/// naive string compare would get this backwards) -- negative if [a] <
/// [b], zero if equal, positive if [a] > [b]. Non-numeric/missing
/// segments (a stray "1.2.0-beta" build label, a differing segment
/// count) are treated as 0, so this degrades to "as equal as it can
/// tell" rather than throwing on anything that isn't strict x.y.z.
int compareVersions(String a, String b) {
  final aParts = a.split('.');
  final bParts = b.split('.');
  final length = aParts.length > bParts.length ? aParts.length : bParts.length;
  for (var i = 0; i < length; i++) {
    final aNum = i < aParts.length ? int.tryParse(aParts[i]) ?? 0 : 0;
    final bNum = i < bParts.length ? int.tryParse(bParts[i]) ?? 0 : 0;
    if (aNum != bNum) return aNum - bNum;
  }
  return 0;
}

const _dismissedVersionKey = 'koda_update_dismissed_version';

class VersionCheck {
  VersionCheck._();

  /// Null if up to date, the check failed, or the user already
  /// dismissed this exact version before (never suppressed when
  /// [VersionCheckResult.required] is true -- see maybeShow's caller).
  static Future<VersionCheckResult?> check() async {
    final data = await KodaApi.instance.checkVersion();
    if (data == null) return null;

    final latest = data['version'] as String?;
    if (latest == null) return null;
    if (compareVersions(latest, KodaConfig.appVersion) <= 0) return null;

    return VersionCheckResult(
      latestVersion: latest,
      downloadUrl: data['download_url'] as String? ?? 'https://koda.fyi/#download',
      releaseNotes: data['release_notes'] as String? ?? '',
      required: data['required'] as bool? ?? false,
    );
  }

  /// Whether [result] should actually be shown right now -- false if
  /// the user already dismissed this exact version and it isn't a
  /// required update (a later, even-newer version will show again).
  static Future<bool> shouldShow(VersionCheckResult result) async {
    if (result.required) return true;
    final prefs = await SharedPreferences.getInstance();
    final dismissed = prefs.getString(_dismissedVersionKey);
    return dismissed != result.latestVersion;
  }

  static Future<void> dismiss(VersionCheckResult result) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_dismissedVersionKey, result.latestVersion);
  }
}
