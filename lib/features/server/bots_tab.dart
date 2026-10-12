// lib/features/server/bots_tab.dart
//
// Server settings' "Bots" tab -- lists installed bots (with the
// permissions their dedicated role currently holds, see koda-server's
// Koda.Developers.list_installed_bots/1) and uninstall actions, plus
// an entry point to install a new one by pasting its client_id. There's
// no bot directory to browse (confirmed none exists) -- this is the
// same "paste/click an invite" shape as Discord's own bot-invite links.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../developer/bot_install_screen.dart';

String _permissionLabel(String key) => key
    .split('_')
    .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
    .join(' ');

class BotsTab extends StatefulWidget {
  final String serverId;
  const BotsTab({super.key, required this.serverId});

  @override
  State<BotsTab> createState() => _BotsTabState();
}

class _BotsTabState extends State<BotsTab> {
  List<Map<String, dynamic>> _bots = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final bots = await KodaApi.instance.getInstalledBots(widget.serverId);
    if (mounted) setState(() { _bots = bots; _loading = false; });
  }

  Future<void> _openInstall() async {
    final t = AppLocalizations.of(context);
    final ctrl = TextEditingController();
    final clientId = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.botsTabInstallDialogTitle, style: TextStyle(color: KodaColors.text1)),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          style: TextStyle(color: KodaColors.text1),
          decoration: InputDecoration(
            hintText: t.botsTabClientIdHint,
            hintStyle: TextStyle(color: KodaColors.text3),
            filled: true, fillColor: KodaColors.elevated,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(t.commonCancel)),
          TextButton(
            onPressed: () => Navigator.pop(context, ctrl.text.trim()),
            child: Text(t.commonNext),
          ),
        ],
      ),
    );
    if (clientId == null || clientId.isEmpty || !mounted) return;
    await Navigator.push(context, MaterialPageRoute(
        builder: (_) => BotInstallScreen(clientId: clientId, initialServerId: widget.serverId)));
    _load();
  }

  Future<void> _uninstall(String clientId) async {
    final ok = await KodaApi.instance.uninstallBot(widget.serverId, clientId);
    if (ok) _load();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: Text(t.botsTabDescription, style: TextStyle(color: KodaColors.text3, fontSize: 12))),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
            icon: const Icon(Icons.add, size: 16),
            label: Text(t.botsTabInstallButton),
            onPressed: _openInstall,
          ),
        ]),
        const SizedBox(height: 16),
        Expanded(
          child: _loading
              ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
              : _bots.isEmpty
                  ? Center(child: Text(t.botsTabEmptyState, style: TextStyle(color: KodaColors.text3, fontSize: 13)))
                  : ListView.builder(
                      itemCount: _bots.length,
                      itemBuilder: (_, i) {
                        final bot = _bots[i];
                        final perms = (bot['permissions'] as Map<String, dynamic>? ?? {})
                            .entries.where((e) => e.value == true).map((e) => _permissionLabel(e.key)).join(', ');
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: KodaColors.card, borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: KodaColors.border)),
                          child: Row(children: [
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text(bot['name'] as String? ?? '',
                                    style: TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w600)),
                                const SizedBox(height: 4),
                                Text(perms.isEmpty ? t.botsTabNoPermissions : perms,
                                    style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                              ]),
                            ),
                            TextButton(
                              onPressed: () => _uninstall(bot['id'] as String),
                              child: Text(t.botsTabUninstall, style: TextStyle(color: Colors.redAccent)),
                            ),
                          ]),
                        );
                      },
                    ),
        ),
      ]),
    );
  }
}
