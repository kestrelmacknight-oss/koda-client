// lib/features/server/threshold_moderation_tab.dart
//
// Tier 3 ("threshold moderator decryption") -- server-owner-requested
// oversight of their own server's channels, under multi-party control
// so no single admin has a unilateral skeleton key. See koda-server's
// Koda.ThresholdModeration and lib/core/crypto/threshold_moderation_manager.dart
// for the full design and protocol this UI drives.

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api.dart';
import '../../core/crypto/channel_epoch.dart';
import '../../core/crypto/threshold_moderation_manager.dart';
import '../../core/providers.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';

class ThresholdModerationTab extends ConsumerStatefulWidget {
  final String serverId;
  final List<Map<String, dynamic>> members;
  final List<Map<String, dynamic>> channels;
  const ThresholdModerationTab({
    super.key,
    required this.serverId,
    required this.members,
    required this.channels,
  });

  @override
  ConsumerState<ThresholdModerationTab> createState() => _ThresholdModerationTabState();
}

class _ThresholdModerationTabState extends ConsumerState<ThresholdModerationTab> {
  Map<String, dynamic>? _config;
  List<Map<String, dynamic>> _requests = [];
  bool _loading = true;

  String? get _myUserId => ref.read(authProvider).user?.id;
  bool get _isOwner => ref.read(selectedServerProvider)?['owner_id'] == _myUserId;
  bool get _isDesignatedModerator =>
      _config != null && (_config!['moderator_ids'] as List).contains(_myUserId);

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final config = await KodaApi.instance.getThresholdModerationConfig(widget.serverId);
    if (!mounted) return;
    setState(() => _config = config);

    if (_isDesignatedModerator) {
      final requests = await KodaApi.instance.getThresholdDecryptRequests(widget.serverId);
      if (!mounted) return;
      setState(() => _requests = requests);
    }
    if (mounted) setState(() => _loading = false);
  }

  Future<void> _showConfigDialog() async {
    final t = AppLocalizations.of(context);
    final selected = <String>{...((_config?['moderator_ids'] as List?) ?? const []).cast<String>()};
    var threshold = _config?['threshold'] as int? ?? 2;

    await showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(t.thresholdModConfigureTitle, style: TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 360,
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                t.thresholdModConfigureExplanation,
                style: TextStyle(color: KodaColors.text3, fontSize: 12),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 220,
                child: ListView(
                  children: widget.members.map((m) {
                    final id = m['user_id'] as String;
                    final checked = selected.contains(id);
                    return CheckboxListTile(
                      dense: true,
                      value: checked,
                      activeColor: KodaColors.koda,
                      title: Text(m['username'] as String? ?? id,
                          style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                      onChanged: (v) => setDialogState(() {
                        if (v == true) {
                          selected.add(id);
                        } else {
                          selected.remove(id);
                        }
                      }),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 8),
              Row(children: [
                Text(t.thresholdModThresholdLabel, style: TextStyle(color: KodaColors.text2, fontSize: 13)),
                const SizedBox(width: 12),
                IconButton(
                  icon: Icon(Icons.remove_circle_outline, size: 20, color: KodaColors.text3),
                  tooltip: t.thresholdModDecreaseThresholdTooltip,
                  onPressed: threshold > 2 ? () => setDialogState(() => threshold--) : null,
                ),
                Text('$threshold', style: TextStyle(color: KodaColors.text1, fontSize: 15, fontWeight: FontWeight.w700)),
                IconButton(
                  icon: Icon(Icons.add_circle_outline, size: 20, color: KodaColors.text3),
                  tooltip: t.thresholdModIncreaseThresholdTooltip,
                  onPressed: threshold < selected.length ? () => setDialogState(() => threshold++) : null,
                ),
                const Spacer(),
                Text(t.thresholdModOfModeratorsCount(selected.length),
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
              ]),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: Text(t.commonCancel)),
            TextButton(
              onPressed: selected.length < 2 || threshold > selected.length
                  ? null
                  : () async {
                      final result = await KodaApi.instance.setThresholdModerationConfig(
                          widget.serverId, selected.toList(), threshold);
                      if (ctx.mounted) Navigator.pop(ctx);
                      if (result != null && mounted) {
                        setState(() => _config = result);
                        _load();
                      }
                    },
              child: Text(t.commonSave),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showRequestDialog() async {
    final t = AppLocalizations.of(context);
    final textChannels = widget.channels.where((c) => c['type'] == 'text').toList();
    if (textChannels.isEmpty) return;
    Map<String, dynamic>? selectedChannel = textChannels.first;
    final reasonCtrl = TextEditingController();

    await showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(t.thresholdModRequestDecryptTitle, style: TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 320,
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(t.thresholdModChannelLabel, style: TextStyle(color: KodaColors.text2, fontSize: 12)),
              DropdownButton<Map<String, dynamic>>(
                value: selectedChannel,
                isExpanded: true,
                dropdownColor: KodaColors.card,
                items: textChannels.map((c) => DropdownMenuItem(
                    value: c,
                    child: Text('#${c['name']}', style: TextStyle(color: KodaColors.text1)))).toList(),
                onChanged: (v) => setDialogState(() => selectedChannel = v),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: reasonCtrl,
                maxLines: 2,
                style: TextStyle(color: KodaColors.text1, fontSize: 13),
                decoration: InputDecoration(hintText: t.thresholdModReasonHint),
              ),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: Text(t.commonCancel)),
            TextButton(
              onPressed: reasonCtrl.text.trim().isEmpty
                  ? null
                  : () async {
                      final channelId = selectedChannel!['id'] as String;
                      final epoch = await KodaApi.instance.getChannelEpoch(channelId);
                      if (epoch == null || epoch == 0) return;
                      await ThresholdModerationManager.instance
                          .requestDecrypt(channelId, epoch, reasonCtrl.text.trim());
                      if (ctx.mounted) Navigator.pop(ctx);
                      if (mounted) _load();
                    },
              child: Text(t.thresholdModRequestButton),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _approve(Map<String, dynamic> request) async {
    final updated = await ThresholdModerationManager.instance.approve(request['id'] as String);
    if (updated != null && mounted) {
      // A late approver can cross the threshold immediately -- relay
      // right away rather than waiting for a manual refresh.
      await ThresholdModerationManager.instance
          .relayShareIfApproved(request: updated, myUserId: _myUserId!);
      _load();
    }
  }

  Future<void> _relay(Map<String, dynamic> request) async {
    await ThresholdModerationManager.instance.relayShareIfApproved(request: request, myUserId: _myUserId!);
    if (mounted) {
      final t = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.thresholdModShareRelayed)));
    }
  }

  Future<void> _tryReconstruct(Map<String, dynamic> request) async {
    final threshold = _config?['threshold'] as int?;
    if (threshold == null) return;
    final key = await ThresholdModerationManager.instance.tryReconstruct(
        request: request, myUserId: _myUserId!, threshold: threshold);
    if (!mounted) return;
    final t = AppLocalizations.of(context);
    if (key == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.thresholdModNotEnoughShares)));
      return;
    }
    _showDecryptedEpoch(request, key);
    _load();
  }

  Future<void> _showDecryptedEpoch(Map<String, dynamic> request, Uint8List key) async {
    final channelId = request['channel_id'] as String;
    final epoch = request['epoch'] as int;
    final messages = await KodaApi.instance.getMessages(channelId);
    final inEpoch = messages.where((m) => m['epoch'] == epoch).toList();

    final decrypted = <Map<String, String>>[];
    for (final m in inEpoch) {
      try {
        final content = m['content'] as String?;
        final nonce = m['nonce'] as String?;
        if (content == null || nonce == null) continue;
        final text = await decryptChannelMessage(
            epochKey: key, channelId: channelId, epoch: epoch, content: content, nonce: nonce);
        decrypted.add({'author': m['sender_id'] as String? ?? '?', 'text': text});
      } catch (_) {
        continue; // a row that doesn't belong to this epoch's key -- skip, don't fail the whole view
      }
    }

    if (!mounted) return;
    final t = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.thresholdModEpochMessagesTitle(epoch, decrypted.length),
            style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 360,
          height: 400,
          child: decrypted.isEmpty
              ? Center(child: Text(t.thresholdModNoDecryptableMessages,
                  style: TextStyle(color: KodaColors.text3)))
              : ListView.builder(
                  itemCount: decrypted.length,
                  itemBuilder: (_, i) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: RichText(
                      text: TextSpan(style: TextStyle(fontSize: 12.5, color: KodaColors.text2), children: [
                        TextSpan(text: '${decrypted[i]['author']}: ',
                            style: TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w600)),
                        TextSpan(text: decrypted[i]['text']),
                      ]),
                    ),
                  ),
                ),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text(t.commonClose))],
      ),
    );
  }

  // Not static const -- labels are localized, which needs a BuildContext.
  // Only covers the statuses this tab renders a distinct label for; an
  // unrecognized status falls back to the raw server value.
  Map<String, String> _statusLabels(AppLocalizations t) => {
    'pending': t.thresholdModStatusPending,
    'approved': t.thresholdModStatusApproved,
  };

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Center(child: CircularProgressIndicator(color: KodaColors.koda));
    }

    final t = AppLocalizations.of(context);
    final enabled = _config?['enabled'] == true;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          t.thresholdModExplanation,
          style: TextStyle(color: KodaColors.text3, fontSize: 12),
        ),
        const SizedBox(height: 16),
        if (_isOwner) ...[
          Row(children: [
            Expanded(
              child: Text(
                enabled
                    ? t.thresholdModEnabledStatus(
                        (_config!['moderator_ids'] as List).length, _config!['threshold'] as int)
                    : t.thresholdModNotConfigured,
                style: TextStyle(color: KodaColors.text1, fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
            OutlinedButton(onPressed: _showConfigDialog,
                child: Text(enabled ? t.thresholdModReconfigureButton : t.thresholdModEnableButton)),
          ]),
          const SizedBox(height: 20),
        ],
        if (!enabled && !_isOwner)
          Text(t.thresholdModNotEnabledForServer,
              style: TextStyle(color: KodaColors.text3, fontSize: 13)),
        if (enabled && !_isDesignatedModerator)
          Text(t.thresholdModEnabledNotDesignated,
              style: TextStyle(color: KodaColors.text3, fontSize: 13)),
        if (_isDesignatedModerator) ...[
          Row(children: [
            Text(t.thresholdModRequestsLabel, style: TextStyle(
                color: KodaColors.text3, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1)),
            const Spacer(),
            TextButton.icon(
              onPressed: _showRequestDialog,
              icon: const Icon(Icons.add, size: 16),
              label: Text(t.thresholdModRequestDecryptButton),
            ),
          ]),
          if (_requests.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(t.thresholdModNoActiveRequests, style: TextStyle(color: KodaColors.text3, fontSize: 13)),
            )
          else
            ..._requests.map((r) {
              final channel = widget.channels.cast<Map<String, dynamic>?>().firstWhere(
                  (c) => c?['id'] == r['channel_id'], orElse: () => null);
              final isMine = r['requested_by'] == _myUserId;
              final status = r['status'] as String;
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: KodaColors.card,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: KodaColors.border),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(t.thresholdModRequestRowLabel(channel?['name'] as String? ?? '?',
                          r['epoch'] as int, _statusLabels(t)[status] ?? status),
                      style: TextStyle(color: KodaColors.koda, fontSize: 12, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(r['reason'] as String? ?? '', style: TextStyle(color: KodaColors.text2, fontSize: 12)),
                  const SizedBox(height: 8),
                  Wrap(spacing: 8, children: [
                    if (status == 'pending')
                      TextButton(onPressed: () => _approve(r), child: Text(t.thresholdModApproveButton)),
                    if (status == 'approved' && !isMine)
                      TextButton(onPressed: () => _relay(r), child: Text(t.thresholdModRelayShareButton)),
                    if (status == 'approved' && isMine)
                      TextButton(onPressed: () => _tryReconstruct(r), child: Text(t.thresholdModTryReconstructButton)),
                  ]),
                ]),
              );
            }),
        ],
      ],
    );
  }
}
