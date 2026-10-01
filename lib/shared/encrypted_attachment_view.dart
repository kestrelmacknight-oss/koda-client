// lib/shared/encrypted_attachment_view.dart
//
// Renders one decrypted channel attachment. Deliberately not
// `Image.network` (or any direct CDN fetch by URL) -- the bytes at that
// URL are AES-256-GCM ciphertext (see core/crypto/channel_attachments.dart),
// so they have to be fetched and decrypted first before there's anything
// displayable. Decrypted once per widget lifetime and cached in memory;
// nothing plaintext is written to disk unless the user explicitly saves
// the file. A straight port of dm_screen.dart's private
// `_EncryptedAttachment`, shared here because home_screen.dart and
// channel_chat_panel.dart both need it and it depends on nothing
// screen-specific.

import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../core/crypto/attachment_crypto.dart';
import '../core/theme.dart';
import '../l10n/generated/app_localizations.dart';

class EncryptedAttachmentView extends StatefulWidget {
  final EncryptedAttachmentMeta meta;
  const EncryptedAttachmentView({super.key, required this.meta});

  @override
  State<EncryptedAttachmentView> createState() => _EncryptedAttachmentViewState();
}

class _EncryptedAttachmentViewState extends State<EncryptedAttachmentView> {
  late final Future<Uint8List> _bytes = downloadAndDecryptAttachment(widget.meta);

  Future<void> _saveToDisk(Uint8List bytes) async {
    final path = await FilePicker.platform.saveFile(fileName: widget.meta.fileName);
    if (path == null) return;
    await File(path).writeAsBytes(bytes);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).homeSavedAttachment(widget.meta.fileName))));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isImage = widget.meta.contentType.startsWith('image/');
    return FutureBuilder<Uint8List>(
      future: _bytes,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox(
              width: 32, height: 32,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)));
        }
        if (snapshot.hasError || snapshot.data == null) {
          return _attachmentChip(Icons.error_outline, widget.meta.fileName,
              color: KodaColors.accent, onTap: null);
        }
        final bytes = snapshot.data!;
        if (isImage) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320, maxHeight: 240),
              child: GestureDetector(
                onTap: () => _saveToDisk(bytes),
                child: Image.memory(bytes, fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => _attachmentChip(
                        Icons.insert_drive_file_outlined, widget.meta.fileName,
                        onTap: () => _saveToDisk(bytes))),
              ),
            ),
          );
        }
        return _attachmentChip(Icons.insert_drive_file_outlined, widget.meta.fileName,
            onTap: () => _saveToDisk(bytes));
      },
    );
  }

  Widget _attachmentChip(IconData icon, String fileName, {Color? color, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: KodaColors.elevated,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: KodaColors.border),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 16, color: color ?? KodaColors.text3),
          const SizedBox(width: 8),
          Flexible(
            child: Text(fileName,
                style: TextStyle(color: KodaColors.koda, fontSize: 12),
                overflow: TextOverflow.ellipsis),
          ),
        ]),
      ),
    );
  }
}
