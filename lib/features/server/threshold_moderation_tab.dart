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
    final selected = <String>{...((_config?['moderator_ids'] as List?) ?? const []).cast<String>()};
    var threshold = _config?['threshold'] as int? ?? 2;

    await showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text('Configure Threshold Moderation', style: TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 360,
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Pick trusted moderators and how many of them must agree before any '
                'of them can decrypt one epoch of a channel\'s history. Not even you '
                'get a unilateral key -- you\'re only exempt if you\'re also in this list.',
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
                Text('Threshold:', style: TextStyle(color: KodaColors.text2, fontSize: 13)),
                const SizedBox(width: 12),
                IconButton(
                  icon: Icon(Icons.remove_circle_outline, size: 20, color: KodaColors.text3),
                  tooltip: 'Decrease threshold',
                  onPressed: threshold > 2 ? () => setDialogState(() => threshold--) : null,
                ),
                Text('$threshold', style: TextStyle(color: KodaColors.text1, fontSize: 15, fontWeight: FontWeight.w700)),
                IconButton(
                  icon: Icon(Icons.add_circle_outline, size: 20, color: KodaColors.text3),
                  tooltip: 'Increase threshold',
                  onPressed: threshold < selected.length ? () => setDialogState(() => threshold++) : null,
                ),
                const Spacer(),
                Text('of ${selected.length} moderators',
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
              ]),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
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
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showRequestDialog() async {
    final textChannels = widget.channels.where((c) => c['type'] == 'text').toList();
    if (textChannels.isEmpty) return;
    Map<String, dynamic>? selectedChannel = textChannels.first;
    final reasonCtrl = TextEditingController();

    await showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text('Request Threshold Decrypt', style: TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 320,
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Channel', style: TextStyle(color: KodaColors.text2, fontSize: 12)),
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
                decoration: const InputDecoration(hintText: 'Reason -- shown to every designated moderator'),
              ),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
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
              child: const Text('Request'),
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
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Share relayed to the requester.')));
    }
  }

  Future<void> _tryReconstruct(Map<String, dynamic> request) async {
    final threshold = _config?['threshold'] as int?;
    if (threshold == null) return;
    final key = await ThresholdModerationManager.instance.tryReconstruct(
        request: request, myUserId: _myUserId!, threshold: threshold);
    if (!mounted) return;
    if (key == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Not enough shares relayed yet -- try again once more moderators have relayed theirs.')));
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
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text('Epoch $epoch -- ${decrypted.length} messages',
            style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 360,
          height: 400,
          child: decrypted.isEmpty
              ? Center(child: Text('No decryptable messages in this epoch.',
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
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Center(child: CircularProgressIndicator(color: KodaColors.koda));
    }

    final enabled = _config?['enabled'] == true;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Real decryption of a channel\'s history, gated on multiple designated '
          'moderators actively agreeing -- never one person alone, not even the '
          'server owner. Only ever unlocks one whole epoch (everything sent since '
          'the last membership change), never a single message.',
          style: TextStyle(color: KodaColors.text3, fontSize: 12),
        ),
        const SizedBox(height: 16),
        if (_isOwner) ...[
          Row(children: [
            Expanded(
              child: Text(
                enabled
                    ? 'Enabled -- ${(_config!['moderator_ids'] as List).length} moderators, threshold ${_config!['threshold']}'
                    : 'Not configured',
                style: TextStyle(color: KodaColors.text1, fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
            OutlinedButton(onPressed: _showConfigDialog, child: Text(enabled ? 'Reconfigure' : 'Enable')),
          ]),
          const SizedBox(height: 20),
        ],
        if (!enabled && !_isOwner)
          Text('Threshold moderation is not enabled for this server.',
              style: TextStyle(color: KodaColors.text3, fontSize: 13)),
        if (enabled && !_isDesignatedModerator)
          Text('Enabled for this server. You are not one of the designated moderators.',
              style: TextStyle(color: KodaColors.text3, fontSize: 13)),
        if (_isDesignatedModerator) ...[
          Row(children: [
            Text('Requests', style: TextStyle(
                color: KodaColors.text3, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1)),
            const Spacer(),
            TextButton.icon(
              onPressed: _showRequestDialog,
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Request Decrypt'),
            ),
          ]),
          if (_requests.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('No active requests.', style: TextStyle(color: KodaColors.text3, fontSize: 13)),
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
                  Text('#${channel?['name'] ?? '?'} -- epoch ${r['epoch']} -- $status',
                      style: TextStyle(color: KodaColors.koda, fontSize: 12, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(r['reason'] as String? ?? '', style: TextStyle(color: KodaColors.text2, fontSize: 12)),
                  const SizedBox(height: 8),
                  Wrap(spacing: 8, children: [
                    if (status == 'pending')
                      TextButton(onPressed: () => _approve(r), child: const Text('Approve')),
                    if (status == 'approved' && !isMine)
                      TextButton(onPressed: () => _relay(r), child: const Text('Relay My Share')),
                    if (status == 'approved' && isMine)
                      TextButton(onPressed: () => _tryReconstruct(r), child: const Text('Try Reconstruct')),
                  ]),
                ]),
              );
            }),
        ],
      ],
    );
  }
}
