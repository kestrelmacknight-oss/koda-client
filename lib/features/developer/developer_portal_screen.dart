// lib/features/developer/developer_portal_screen.dart
//
// Phase 1 of the third-party bot platform: register an "Application"
// (which gets its own bot identity server-side, see koda-server's
// Koda.Developers), and manage its API key. Reachable from Settings --
// deliberately NOT part of admin_screen.dart, which is admin-only;
// this is for any regular user who wants to register an app.
//
// A raw API key is only ever shown once, right after it's generated
// (at creation or regeneration) -- the server never stores it in
// recoverable form, so there is no "view key" action afterward, only
// "key ending in ****" plus Regenerate.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';

class DeveloperPortalScreen extends StatefulWidget {
  const DeveloperPortalScreen({super.key});
  @override
  State<DeveloperPortalScreen> createState() => _DeveloperPortalScreenState();
}

class _DeveloperPortalScreenState extends State<DeveloperPortalScreen> {
  List<Map<String, dynamic>> _apps = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final apps = await KodaApi.instance.listDeveloperApps();
    if (mounted) setState(() { _apps = apps; _loading = false; });
  }

  Future<void> _showNewKeyDialog(String rawKey) async {
    final t = AppLocalizations.of(context);
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.devPortalKeyRevealTitle, style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 400,
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(t.devPortalKeyRevealWarning,
                style: TextStyle(color: KodaColors.gold, fontSize: 13, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      color: KodaColors.elevated, borderRadius: BorderRadius.circular(8)),
                  child: SelectableText(rawKey,
                      style: TextStyle(color: KodaColors.text1, fontSize: 12,
                          fontFamily: 'monospace')),
                ),
              ),
              IconButton(
                icon: Icon(Icons.copy, size: 16, color: KodaColors.text3),
                tooltip: t.devPortalCopyKeyTooltip,
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: rawKey));
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(t.devPortalKeyCopiedToast)));
                },
              ),
            ]),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(t.devPortalKeySavedIt)),
        ],
      ),
    );
  }

  Future<void> _showCreateDialog() async {
    final t = AppLocalizations.of(context);
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final usernameCtrl = TextEditingController();

    final create = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.devPortalNewAppTitle, style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 400,
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            KodaTextField(controller: nameCtrl, hintText: t.devPortalAppNameHint, autofocus: true),
            const SizedBox(height: 8),
            KodaTextField(controller: descCtrl, hintText: t.devPortalAppDescriptionHint),
            const SizedBox(height: 8),
            KodaTextField(controller: usernameCtrl, hintText: t.devPortalBotUsernameHint),
            const SizedBox(height: 8),
            Text(t.devPortalInteractionDataOnlyNote,
                style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(t.commonCreate)),
        ],
      ),
    );
    if (create != true) return;
    if (nameCtrl.text.trim().isEmpty || usernameCtrl.text.trim().isEmpty) return;

    final result = await KodaApi.instance.createDeveloperApp(
      name: nameCtrl.text.trim(),
      description: descCtrl.text.trim().isEmpty ? null : descCtrl.text.trim(),
      botUsername: usernameCtrl.text.trim(),
    );
    if (result == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context).devPortalCreateError)));
      }
      return;
    }
    await _load();
    if (mounted) await _showNewKeyDialog(result['api_key'] as String);
  }

  Future<void> _regenerate(String appId) async {
    final t = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.devPortalRegenerateConfirmTitle, style: TextStyle(color: KodaColors.text1)),
        content: Text(t.devPortalRegenerateConfirmBody, style: TextStyle(color: KodaColors.text3)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(t.devPortalRegenerate)),
        ],
      ),
    );
    if (confirmed != true) return;
    final newKey = await KodaApi.instance.regenerateDeveloperAppKey(appId);
    if (newKey != null && mounted) await _showNewKeyDialog(newKey);
  }

  Future<void> _editRedirectUris(String appId, List<String> current) async {
    final t = AppLocalizations.of(context);
    final ctrl = TextEditingController(text: current.join('\n'));
    final save = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.devPortalEditRedirectUrisTitle, style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 400,
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(t.devPortalRedirectUrisHelp, style: TextStyle(color: KodaColors.text3, fontSize: 11)),
            const SizedBox(height: 8),
            TextField(
              controller: ctrl,
              maxLines: 5,
              style: TextStyle(color: KodaColors.text1, fontSize: 13, fontFamily: 'monospace'),
              decoration: InputDecoration(
                hintText: t.devPortalRedirectUrisHint,
                hintStyle: TextStyle(color: KodaColors.text3),
                filled: true,
                fillColor: KodaColors.elevated,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              ),
            ),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(t.commonSave)),
        ],
      ),
    );
    if (save != true) return;
    final uris = ctrl.text.split('\n').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
    final ok = await KodaApi.instance.setDeveloperAppRedirectUris(appId, uris);
    if (ok) _load();
  }

  Future<void> _generateClientSecret(String appId) async {
    final newSecret = await KodaApi.instance.regenerateDeveloperAppClientSecret(appId);
    if (newSecret == null) return;
    await _load();
    if (mounted) await _showNewKeyDialog(newSecret);
  }

  Future<void> _delete(String appId) async {
    final t = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.devPortalDeleteConfirmTitle, style: TextStyle(color: KodaColors.text1)),
        content: Text(t.devPortalDeleteConfirmBody, style: TextStyle(color: KodaColors.text3)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true),
              child: Text(t.commonDelete, style: TextStyle(color: Colors.redAccent))),
        ],
      ),
    );
    if (confirmed != true) return;
    final ok = await KodaApi.instance.deleteDeveloperApp(appId);
    if (ok) _load();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.devPortalScreenTitle, style: TextStyle(color: KodaColors.text1, fontSize: 16)),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: KodaColors.koda),
            tooltip: t.devPortalNewAppTooltip,
            onPressed: _showCreateDialog,
          ),
        ],
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _apps.isEmpty
              ? Center(child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(t.devPortalEmptyState,
                      style: TextStyle(color: KodaColors.text3, fontSize: 13),
                      textAlign: TextAlign.center),
                ))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _apps.length,
                  itemBuilder: (_, i) {
                    final app = _apps[i];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: KodaColors.card, borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: KodaColors.border)),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(app['name'] as String? ?? '',
                            style: TextStyle(color: KodaColors.text1, fontSize: 15, fontWeight: FontWeight.w600)),
                        if ((app['description'] as String?)?.isNotEmpty == true) ...[
                          const SizedBox(height: 4),
                          Text(app['description'] as String,
                              style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                        ],
                        const SizedBox(height: 12),
                        Row(children: [
                          TextButton.icon(
                            icon: Icon(Icons.refresh, size: 14, color: KodaColors.text3),
                            label: Text(t.devPortalRegenerate,
                                style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                            onPressed: () => _regenerate(app['id'] as String),
                          ),
                          const Spacer(),
                          TextButton.icon(
                            icon: const Icon(Icons.delete_outline, size: 14, color: Colors.redAccent),
                            label: Text(t.commonDelete, style: TextStyle(color: Colors.redAccent, fontSize: 12)),
                            onPressed: () => _delete(app['id'] as String),
                          ),
                        ]),
                        Divider(color: KodaColors.border, height: 20),
                        Text(t.devPortalOAuthSectionTitle,
                            style: TextStyle(color: KodaColors.text2, fontSize: 11, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 6),
                        Text(
                          (app['redirect_uris'] as List?)?.isNotEmpty == true
                              ? (app['redirect_uris'] as List).join('\n')
                              : t.devPortalNoRedirectUris,
                          style: TextStyle(color: KodaColors.text3, fontSize: 11, fontFamily: 'monospace'),
                        ),
                        const SizedBox(height: 8),
                        Row(children: [
                          TextButton(
                            onPressed: () => _editRedirectUris(
                                app['id'] as String, List<String>.from(app['redirect_uris'] ?? [])),
                            child: Text(t.devPortalEditRedirectUris,
                                style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () => _generateClientSecret(app['id'] as String),
                            child: Text(
                                app['client_secret_last_four'] != null
                                    ? t.devPortalRegenerateClientSecret
                                    : t.devPortalGenerateClientSecret,
                                style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                          ),
                        ]),
                        if (app['client_secret_last_four'] != null)
                          Text(t.devPortalClientSecretEndingIn(app['client_secret_last_four'] as String),
                              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                      ]),
                    );
                  },
                ),
    );
  }
}
