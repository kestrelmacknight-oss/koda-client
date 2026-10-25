// lib/core/self_update.dart
//
// Downloads and launches a desktop installer the user explicitly
// confirmed via the update dialog (lib/shared/update_nudge.dart) --
// never automatic or silent; this only ever runs after an explicit
// "Update Now" tap. Windows only for now: the Windows build ships a
// real .exe installer via direct download (not an app store), so
// "fetch it and run it" is a single, well-defined step there. macOS
// ships a .dmg (mount + drag-install, not a silent installer) and
// Linux a .tar.gz (not an installer at all) -- both need different
// mechanics this doesn't attempt yet; they keep getting the plain
// browser-download fallback (see update_nudge.dart).

import 'dart:io';
import 'package:cryptography/cryptography.dart';
import 'package:dio/dio.dart';

enum SelfUpdateStep { downloading, verifying, launching }

class SelfUpdateException implements Exception {
  final String message;
  SelfUpdateException(this.message);
  @override
  String toString() => message;
}

class SelfUpdate {
  SelfUpdate._();

  /// Whether [downloadAndLaunch] has anything to do on this build --
  /// false on any platform but Windows, or whenever the server hasn't
  /// supplied both a direct URL and a digest to verify it against (see
  /// Koda.VersionController's moduledoc on why a missing digest means
  /// "don't run this" rather than "skip verification").
  static bool canSelfUpdate({required String? platformDownloadUrl, required String? platformSha256}) {
    return Platform.isWindows && platformDownloadUrl != null && platformSha256 != null;
  }

  /// Downloads [url] to a temp file, verifies it against
  /// [expectedSha256] (lowercase hex SHA-256), then launches it as a
  /// detached process and exits Koda -- so the installer isn't trying
  /// to overwrite files a running instance still holds open. Throws
  /// [SelfUpdateException] on any failure; the caller falls back to
  /// opening the plain browser download page.
  static Future<void> downloadAndLaunch(
    String url,
    String expectedSha256, {
    required void Function(SelfUpdateStep step, double? progress) onProgress,
  }) async {
    onProgress(SelfUpdateStep.downloading, 0);

    // A bare Dio(), not the app's authenticated client -- this is a
    // public GitHub Releases asset, the same cross-origin-CDN case
    // downloadRawBytes' own doc comment carves out an exception for.
    final dio = Dio();
    final segments = Uri.parse(url).pathSegments;
    final fileName = segments.isNotEmpty ? segments.last : 'koda-update.exe';
    final file = File('${Directory.systemTemp.path}${Platform.pathSeparator}$fileName');

    try {
      await dio.download(url, file.path, onReceiveProgress: (received, total) {
        if (total > 0) onProgress(SelfUpdateStep.downloading, received / total);
      });
    } catch (e) {
      throw SelfUpdateException('Download failed: $e');
    }

    onProgress(SelfUpdateStep.verifying, null);
    final bytes = await file.readAsBytes();
    final hash = await Sha256().hash(bytes);
    final digest = hash.bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    if (digest.toLowerCase() != expectedSha256.toLowerCase()) {
      await file.delete().catchError((_) => file);
      throw SelfUpdateException('Downloaded installer did not match the expected checksum.');
    }

    onProgress(SelfUpdateStep.launching, null);
    try {
      await Process.start(file.path, [], mode: ProcessStartMode.detached);
    } catch (e) {
      throw SelfUpdateException('Could not launch the installer: $e');
    }

    // Give the installer a moment to actually start before Koda exits
    // out from under it -- it likely wants to overwrite this very
    // process's own files.
    await Future.delayed(const Duration(milliseconds: 500));
    exit(0);
  }
}
