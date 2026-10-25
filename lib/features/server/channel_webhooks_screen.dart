// lib/features/server/channel_webhooks_screen.dart
//
// Per-channel incoming webhooks (Koda.ChannelWebhooks) -- Discord-
// compatible: the generated URL accepts the same {content, username,
// avatar_url, embeds} JSON body Discord's own webhook execute endpoint
// does, so an existing "post to a Discord webhook" integration
// (streaming alert tools, CI, etc.) works by just swapping the URL in.
// No bot/Developer Portal registration needed.
//
// A webhook-posted message can never be end-to-end encrypted -- the
// external caller has no channel key material -- which is why these
// are only offered on text channels and render with a visible "not
// encrypted" marker in chat (see channel_chat_panel.dart).

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';

class ChannelWebhooksScreen extends StatefulWidget {
  final String serverId;
  final String channelId;
  const ChannelWebhooksScreen({super.key, required this.serverId, required this.channelId});

  @override
  State<ChannelWebhooksScreen> createState() => _ChannelWebhooksScreenState();
}

class _ChannelWebhooksScreenState extends State<ChannelWebhooksScreen> {
  bool _loading = true;
  List<Map<String, dynamic>> _webhooks = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final webhooks = await KodaApi.instance.getChannelWebhooks(widget.channelId);
    if (!mounted) return;
    setState(() { _webhooks = webhooks; _loading = false; });
  }

  Future<void> _create() async {
    final t = AppLocalizations.of(context);
    final nameCtrl = TextEditingController();
    final create = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.webhookCreateTitle, style: TextStyle(color: KodaColors.text1)),
        content: KodaTextField(controller: nameCtrl, hintText: t.webhookNameHint, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(t.commonCreate)),
        ],
      ),
    );
    if (create != true || nameCtrl.text.trim().isEmpty) return;

    final result = await KodaApi.instance.createChannelWebhook(widget.channelId, nameCtrl.text.trim());
    if (!mounted) return;
    if (result == null) {
      _showActionFailed();
      return;
    }
    await _load();
    if (!mounted) return;
    _showUrlOnceDialog(result['url'] as String);
  }

  Future<void> _regenerate(String webhookId) async {
    final t = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.webhookRegenerateTitle, style: TextStyle(color: KodaColors.text1)),
        content: Text(t.webhookRegenerateBody, style: TextStyle(color: KodaColors.text3)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true),
              child: Text(t.webhookRegenerateConfirm, style: const TextStyle(color: Colors.redAccent))),
        ],
      ),
    );
    if (confirmed != true) return;

    final result = await KodaApi.instance.regenerateChannelWebhookToken(webhookId);
    if (!mounted) return;
    if (result == null) {
      _showActionFailed();
      return;
    }
    _showUrlOnceDialog(result['url'] as String);
  }

  Future<void> _delete(String webhookId) async {
    final ok = await KodaApi.instance.deleteChannelWebhook(webhookId);
    if (!mounted) return;
    if (ok) {
      await _load();
    } else {
      _showActionFailed();
    }
  }

  void _showActionFailed() {
    final t = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.commonActionFailed)));
  }

  Future<void> _showUrlOnceDialog(String url) async {
    final t = AppLocalizations.of(context);
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.webhookUrlRevealTitle, style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 420,
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(t.webhookUrlRevealWarning,
                style: TextStyle(color: KodaColors.gold, fontSize: 13, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(color: KodaColors.elevated, borderRadius: BorderRadius.circular(8)),
                  child: SelectableText(url,
                      style: TextStyle(color: KodaColors.text1, fontSize: 12, fontFamily: 'monospace')),
                ),
              ),
              IconButton(
                icon: Icon(Icons.copy, size: 16, color: KodaColors.text3),
                tooltip: t.commonCopy,
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: url));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.webhookUrlCopiedToast)));
                },
              ),
            ]),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(t.webhookUrlSavedIt)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.webhookScreenTitle, style: TextStyle(color: KodaColors.text1, fontSize: 16)),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: KodaColors.koda),
            tooltip: t.webhookCreateTitle,
            onPressed: _create,
          ),
        ],
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : Column(children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(t.webhookScreenDescription,
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
              ),
              Expanded(
                child: _webhooks.isEmpty
                    ? Center(child: Text(t.webhookEmptyState, style: TextStyle(color: KodaColors.text3)))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: _webhooks.length,
                        itemBuilder: (_, i) {
                          final w = _webhooks[i];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: KodaColors.card,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: KodaColors.border),
                            ),
                            child: Row(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  width: 36, height: 36,
                                  child: (w['avatar_url'] as String?) != null
                                      ? Image.network(w['avatar_url'] as String, fit: BoxFit.cover,
                                          errorBuilder: (_, __, ___) => ColoredBox(color: KodaColors.elevated,
                                              child: Icon(Icons.webhook, color: KodaColors.text3, size: 18)))
                                      : ColoredBox(color: KodaColors.elevated,
                                          child: Icon(Icons.webhook, color: KodaColors.text3, size: 18)),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(child: Text(w['name'] as String? ?? '',
                                  style: TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w600))),
                              IconButton(
                                icon: Icon(Icons.refresh, size: 18, color: KodaColors.text3),
                                tooltip: t.webhookRegenerateTitle,
                                onPressed: () => _regenerate(w['id'] as String),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline, size: 18, color: Colors.redAccent),
                                tooltip: t.commonDelete,
                                onPressed: () => _delete(w['id'] as String),
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
