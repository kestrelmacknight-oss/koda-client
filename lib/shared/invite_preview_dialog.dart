// lib/shared/invite_preview_dialog.dart
//
// Shown when an invite deep link resolves (see core/deep_links.dart) or
// when a user pastes an invite code/URL manually -- previews the target
// server (name/icon/description/member count) via the public, no-auth
// GET /invite/:code endpoint before actually joining, same as tapping a
// Discord invite link before you're a member.

import 'package:flutter/material.dart';
import '../core/api.dart';
import '../core/theme.dart';

/// Returns true if the user ended up joining the server, false otherwise
/// (cancelled, invalid code, or already a member and just dismissed it).
Future<bool> showInvitePreviewDialog(BuildContext context, String code) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (_) => _InvitePreviewDialog(code: code),
  );
  return result ?? false;
}

class _InvitePreviewDialog extends StatefulWidget {
  final String code;
  const _InvitePreviewDialog({required this.code});
  @override
  State<_InvitePreviewDialog> createState() => _InvitePreviewDialogState();
}

class _InvitePreviewDialogState extends State<_InvitePreviewDialog> {
  bool _loading = true;
  bool _joining = false;
  Map<String, dynamic>? _server;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final result = await KodaApi.instance.getInvitePreview(widget.code);
    if (!mounted) return;
    setState(() {
      _loading = false;
      if (result != null && result['valid'] == true) {
        _server = result['server'] as Map<String, dynamic>;
      } else {
        _error = result?['error'] as String? ?? 'Invalid or expired invite.';
      }
    });
  }

  Future<void> _join() async {
    setState(() => _joining = true);
    final result = await KodaApi.instance.redeemInvite(widget.code);
    if (!mounted) return;
    if (result != null && result['ok'] == true) {
      Navigator.pop(context, true);
    } else {
      setState(() {
        _joining = false;
        _error = result?['error'] as String? ?? 'Could not join server.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: KodaColors.card,
      title: const Text('Server Invite', style: TextStyle(color: KodaColors.text1)),
      content: SizedBox(
        width: 320,
        child: _loading
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(child: CircularProgressIndicator(color: KodaColors.koda)),
              )
            : _server != null
                ? _buildPreview(_server!)
                : Text(_error ?? 'Invalid or expired invite.',
                    style: const TextStyle(color: KodaColors.text2)),
      ),
      actions: [
        TextButton(
          onPressed: _joining ? null : () => Navigator.pop(context, false),
          child: Text(_server != null ? 'Cancel' : 'Close'),
        ),
        if (_server != null)
          TextButton(
            onPressed: _joining ? null : _join,
            child: _joining
                ? const SizedBox(
                    width: 16, height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                : const Text('Join'),
          ),
      ],
    );
  }

  Widget _buildPreview(Map<String, dynamic> server) {
    final name = server['name'] as String? ?? 'Unknown server';
    final iconUrl = server['icon_url'] as String?;
    final description = server['description'] as String?;
    final memberCount = server['member_count'] as int? ?? 0;

    return Column(mainAxisSize: MainAxisSize.min, children: [
      CircleAvatar(
        radius: 32,
        backgroundColor: KodaColors.elevated,
        backgroundImage: iconUrl != null ? NetworkImage(iconUrl) : null,
        child: iconUrl == null
            ? Text(name.isNotEmpty ? name[0].toUpperCase() : '?',
                style: const TextStyle(
                    color: KodaColors.text1, fontSize: 24, fontWeight: FontWeight.w700))
            : null,
      ),
      const SizedBox(height: 12),
      Text(name,
          style: const TextStyle(
              color: KodaColors.text1, fontSize: 16, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center),
      if (description != null && description.isNotEmpty) ...[
        const SizedBox(height: 6),
        Text(description,
            style: const TextStyle(color: KodaColors.text3, fontSize: 12),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis),
      ],
      const SizedBox(height: 10),
      Text('$memberCount ${memberCount == 1 ? 'member' : 'members'}',
          style: const TextStyle(color: KodaColors.text3, fontSize: 12)),
      if (_error != null) ...[
        const SizedBox(height: 10),
        Text(_error!, style: const TextStyle(color: KodaColors.accent, fontSize: 12)),
      ],
    ]);
  }
}
