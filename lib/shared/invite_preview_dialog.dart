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
import '../l10n/generated/app_localizations.dart';

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
    final t = AppLocalizations.of(context);
    final result = await KodaApi.instance.getInvitePreview(widget.code);
    if (!mounted) return;
    setState(() {
      _loading = false;
      if (result != null && result['valid'] == true) {
        _server = result['server'] as Map<String, dynamic>;
      } else {
        _error = result?['error'] as String? ?? t.invitePreviewInvalidOrExpired;
      }
    });
  }

  Future<void> _join() async {
    // Captured before the await below, so we don't touch a
    // possibly-unmounted context afterward.
    final t = AppLocalizations.of(context);
    setState(() => _joining = true);
    final result = await KodaApi.instance.redeemInvite(widget.code);
    if (!mounted) return;
    if (result != null && result['ok'] == true) {
      Navigator.pop(context, true);
    } else {
      setState(() {
        _joining = false;
        _error = result?['error'] as String? ?? t.invitePreviewCouldNotJoin;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return AlertDialog(
      backgroundColor: KodaColors.card,
      title: Text(t.invitePreviewTitle, style: TextStyle(color: KodaColors.text1)),
      content: SizedBox(
        width: 320,
        child: _loading
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(child: CircularProgressIndicator(color: KodaColors.koda)),
              )
            : _server != null
                ? _buildPreview(_server!, t)
                : Text(_error ?? t.invitePreviewInvalidOrExpired,
                    style: TextStyle(color: KodaColors.text2)),
      ),
      actions: [
        TextButton(
          onPressed: _joining ? null : () => Navigator.pop(context, false),
          child: Text(_server != null ? t.commonCancel : t.commonClose),
        ),
        if (_server != null)
          TextButton(
            onPressed: _joining ? null : _join,
            child: _joining
                ? SizedBox(
                    width: 16, height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                : Text(t.commonJoin),
          ),
      ],
    );
  }

  Widget _buildPreview(Map<String, dynamic> server, AppLocalizations t) {
    final name = server['name'] as String? ?? t.invitePreviewUnknownServer;
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
                style: TextStyle(
                    color: KodaColors.text1, fontSize: 24, fontWeight: FontWeight.w700))
            : null,
      ),
      const SizedBox(height: 12),
      Text(name,
          style: TextStyle(
              color: KodaColors.text1, fontSize: 16, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center),
      if (description != null && description.isNotEmpty) ...[
        const SizedBox(height: 6),
        Text(description,
            style: TextStyle(color: KodaColors.text3, fontSize: 12),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis),
      ],
      const SizedBox(height: 10),
      // Reuses the Koda Marketplace's member-count plural -- identical
      // "N member(s)" pattern, no need for a second copy of the same ICU rule.
      Text(t.kodaMarketplaceMemberCount(memberCount),
          style: TextStyle(color: KodaColors.text3, fontSize: 12)),
      if (_error != null) ...[
        const SizedBox(height: 10),
        Text(_error!, style: TextStyle(color: KodaColors.accent, fontSize: 12)),
      ],
    ]);
  }
}
