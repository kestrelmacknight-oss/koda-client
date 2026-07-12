// lib/core/uploader.dart
//
// Uploads files to R2 via a server-side proxy endpoint on koda-server.
// The server receives the raw bytes and puts them to R2 directly,
// avoiding client-side TLS issues with R2's S3 endpoint.
//
// POST /api/v1/uploads
//   Headers: Content-Type: <mime>, X-Upload-Type: avatar|gallery|attachment
//   Body: raw file bytes
//   Response: {cdn_url, max_bytes}

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'api.dart';

class UploadResult {
  final String cdnUrl;
  const UploadResult({required this.cdnUrl});
}

class KodaUploader {
  KodaUploader._();
  static final KodaUploader instance = KodaUploader._();

  /// Uploads [file] through the Koda server to R2.
  /// Returns the permanent CDN URL on success.
  /// Throws [UploadException] with a user-readable message on failure.
  Future<UploadResult> upload({
    required File file,
    required String uploadType,
    required String contentType,
  }) async {
    const maxBytes = 8 * 1024 * 1024;

    final fileSize = await file.length();
    if (fileSize > maxBytes) {
      throw UploadException('File is too large. Maximum size is 8MB.');
    }

    try {
      final cdnUrl = await KodaApi.instance.uploadFile(
        file: file,
        uploadType: uploadType,
        contentType: contentType,
      );

      if (cdnUrl == null) {
        throw UploadException('Upload failed. Please try again.');
      }

      return UploadResult(cdnUrl: cdnUrl);
    } on UploadException {
      rethrow;
    } catch (e) {
      debugPrint('[KodaUploader] Upload error: $e');
      throw UploadException('Upload failed. Please check your connection.');
    }
  }

  Future<UploadResult?> uploadImageFile(
    String filePath, {
    required String uploadType,
    String contentType = 'image/jpeg',
  }) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) return null;
      return await upload(
        file: file,
        uploadType: uploadType,
        contentType: contentType,
      );
    } on UploadException {
      rethrow;
    } catch (e) {
      debugPrint('[KodaUploader] Unexpected error: $e');
      return null;
    }
  }
}

class UploadException implements Exception {
  final String message;
  const UploadException(this.message);
  @override
  String toString() => message;
}