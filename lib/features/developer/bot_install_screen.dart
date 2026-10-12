// lib/features/developer/bot_install_screen.dart
//
// Installing a registered bot into a server with specific permissions
// -- Phase 3 of the developer/bot platform. Deliberately NOT part of
// OAuthConsentScreen's Allow/Deny flow: there's no token or redirect
// involved here at all (see koda-server's Koda.Developers.install_bot/4),
// just a direct, synchronously-authorized admin action, so this screen's
// body (server picker + permission checklist) shares nothing with that
// one. Reached either via a koda://oauth/authorize?...&scope=bot.install
// deep link (home_screen.dart's _handleOAuthDeepLink) or from server
// settings' "Bots" section with [initialServerId] already set.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';

// Mirrors koda-server's Koda.Servers.Role.permission_keys/0 exactly --
// keep in sync by hand (different repo/language, same reasoning as
// every other client-side mirror of a server-side enum this session).
const _permissionKeys = [
  'view_channels', 'send_messages', 'connect_voice', 'manage_server',
  'manage_channels', 'manage_roles', 'manage_messages', 'kick_members',
  'ban_members', 'mute_members', 'mention_everyone', 'post_media',
  'manage_marketplace', 'announce_live', 'move_members',
];

String _permissionLabel(String key) => key
    .split('_')
    .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
    .join(' ');

class BotInstallScreen extends StatefulWidget {
  final String clientId;
  final String? initialServerId;
  const BotInstallScreen({super.key, required this.clientId, this.initialServerId});

  @override
  State<BotInstallScreen> createState() => _BotInstallScreenState();
}

class _BotInstallScreenState extends State<BotInstallScreen> {
  Map<String, dynamic>? _app;
  bool _appNotFound = false;
  List<Map<String, dynamic>> _servers = [];
  String? _selectedServerId;
  Set<String> _grantedPermissions = {};
  final Set<String> _chosen = {};
  bool _loading = true;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final app = await KodaApi.instance.getOAuthAppInfo(widget.clientId);
    final servers = await KodaApi.instance.getInstallableServers();
    if (!mounted) return;
    setState(() {
      _app = app;
      _appNotFound = app == null;
      _servers = servers;
      _loading = false;
    });
    final initial = widget.initialServerId;
    if (initial != null && servers.any((s) => s['id'] == initial)) {
      _selectServer(initial);
    }
  }

  void _selectServer(String serverId) {
    final server = _servers.firstWhere((s) => s['id'] == serverId);
    setState(() {
      _selectedServerId = serverId;
      _grantedPermissions = Set<String>.from(server['effective_permissions'] ?? []);
      _chosen.clear();
    });
  }

  Future<void> _confirm() async {
    final serverId = _selectedServerId;
    if (serverId == null) return;
    setState(() => _submitting = true);
    final error = await KodaApi.instance.installBot(serverId, widget.clientId, _chosen.toList());
    if (!mounted) return;
    setState(() => _submitting = false);
    final t = AppLocalizations.of(context);
    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.botInstallSuccess)));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.botInstallTitle, style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _appNotFound
              ? Center(child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(t.oauthConsentUnknownApp,
                      style: TextStyle(color: KodaColors.text3, fontSize: 13), textAlign: TextAlign.center),
                ))
              : Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(_app!['name'] as String? ?? '',
                        style: TextStyle(color: KodaColors.text1, fontSize: 18, fontWeight: FontWeight.w700)),
                    if ((_app!['description'] as String?)?.isNotEmpty == true) ...[
                      const SizedBox(height: 6),
                      Text(_app!['description'] as String, style: TextStyle(color: KodaColors.text3, fontSize: 13)),
                    ],
                    const SizedBox(height: 20),
                    if (_servers.isEmpty)
                      Text(t.botInstallNoEligibleServers, style: TextStyle(color: KodaColors.text3, fontSize: 13))
                    else ...[
                      Text(t.botInstallSelectServer,
                          style: TextStyle(color: KodaColors.text2, fontSize: 12, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        initialValue: _selectedServerId,
                        dropdownColor: KodaColors.card,
                        decoration: InputDecoration(
                          filled: true, fillColor: KodaColors.elevated,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                        ),
                        items: _servers.map((s) => DropdownMenuItem(
                            value: s['id'] as String,
                            child: Text(s['name'] as String? ?? '', style: TextStyle(color: KodaColors.text1)))).toList(),
                        onChanged: (id) { if (id != null) _selectServer(id); },
                      ),
                      if (_selectedServerId != null) ...[
                        const SizedBox(height: 20),
                        Text(t.botInstallSelectPermissions,
                            style: TextStyle(color: KodaColors.text2, fontSize: 12, fontWeight: FontWeight.w600)),
                        Text(t.botInstallPermissionsHelp,
                            style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                        const SizedBox(height: 4),
                        Expanded(
                          child: ListView(children: [
                            for (final key in _permissionKeys)
                              CheckboxListTile(
                                dense: true,
                                controlAffinity: ListTileControlAffinity.leading,
                                title: Text(_permissionLabel(key),
                                    style: TextStyle(
                                        color: _grantedPermissions.contains(key) ? KodaColors.text1 : KodaColors.text3,
                                        fontSize: 13)),
                                value: _chosen.contains(key),
                                enabled: _grantedPermissions.contains(key),
                                onChanged: _grantedPermissions.contains(key)
                                    ? (v) => setState(() {
                                        if (v == true) { _chosen.add(key); } else { _chosen.remove(key); }
                                      })
                                    : null,
                              ),
                          ]),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
                            onPressed: _submitting ? null : _confirm,
                            child: _submitting
                                ? SizedBox(width: 16, height: 16,
                                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                                : Text(t.botInstallConfirm),
                          ),
                        ),
                      ],
                    ],
                  ]),
                ),
    );
  }
}
