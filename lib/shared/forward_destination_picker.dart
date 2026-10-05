// lib/shared/forward_destination_picker.dart
//
// "Pick where to forward this" -- two tabs (channels you can post in,
// across every server you're a member of; direct messages), both backed
// by plain KodaApi reads independent of home_screen's/dm_screen's own
// widget state (see core/api.dart's getServers/getChannels/
// getConversations), so this dialog can be shown from either screen with
// no coupling to whichever one happens to be on top. Selecting a
// destination performs the forward itself (see core/forwarding.dart) and
// pops with the result, so the caller only needs to show a confirmation.

import 'package:flutter/material.dart';
import '../core/api.dart';
import '../core/crypto/attachment_crypto.dart';
import '../core/forwarding.dart';
import '../core/theme.dart';
import '../l10n/generated/app_localizations.dart';
import 'widgets.dart';

/// Returns true once the forward actually succeeded, false if it was
/// attempted and failed, or null if the dialog was dismissed without
/// picking anything.
Future<bool?> showForwardDestinationPicker(
  BuildContext context, {
  required String text,
  EncryptedAttachmentMeta? originalAttachment,
  Map<String, dynamic>? gifAttachment,
  required ForwardedFrom forwardedFrom,
  required String myUserId,
}) {
  return showDialog<bool>(
    context: context,
    builder: (_) => _ForwardDestinationPickerDialog(
      text: text,
      originalAttachment: originalAttachment,
      gifAttachment: gifAttachment,
      forwardedFrom: forwardedFrom,
      myUserId: myUserId,
    ),
  );
}

class _ForwardDestinationPickerDialog extends StatefulWidget {
  final String text;
  final EncryptedAttachmentMeta? originalAttachment;
  final Map<String, dynamic>? gifAttachment;
  final ForwardedFrom forwardedFrom;
  final String myUserId;
  const _ForwardDestinationPickerDialog({
    required this.text,
    required this.originalAttachment,
    required this.gifAttachment,
    required this.forwardedFrom,
    required this.myUserId,
  });

  @override
  State<_ForwardDestinationPickerDialog> createState() => _ForwardDestinationPickerDialogState();
}

class _ForwardDestinationPickerDialogState extends State<_ForwardDestinationPickerDialog> {
  Map<String, dynamic>? _selectedServer;
  bool _sending = false;
  late final Future<List<Map<String, dynamic>>> _servers = KodaApi.instance.getServers();
  late final Future<List<Map<String, dynamic>>> _conversations = KodaApi.instance.getConversations();

  Future<void> _send(Future<bool> Function() doSend) async {
    setState(() => _sending = true);
    final ok = await doSend();
    if (mounted) Navigator.pop(context, ok);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Dialog(
        backgroundColor: KodaColors.card,
        child: SizedBox(
          width: 420,
          height: 480,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(children: [
                Expanded(child: Text(t.forwardDestinationPickerTitle,
                    style: TextStyle(color: KodaColors.text1, fontSize: 16, fontWeight: FontWeight.w600))),
                IconButton(icon: Icon(Icons.close, color: KodaColors.text3),
                    onPressed: () => Navigator.pop(context)),
              ]),
            ),
            TabBar(
              labelColor: KodaColors.koda,
              unselectedLabelColor: KodaColors.text3,
              indicatorColor: KodaColors.koda,
              tabs: [
                Tab(text: t.forwardDestinationPickerChannelsTab),
                Tab(text: t.forwardDestinationPickerDmsTab),
              ],
            ),
            Expanded(
              child: Stack(children: [
                TabBarView(children: [_buildChannelsTab(t), _buildDmsTab(t)]),
                if (_sending)
                  Container(
                    color: Colors.black.withValues(alpha: 0.4),
                    child: Center(child: CircularProgressIndicator(color: KodaColors.koda)),
                  ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildChannelsTab(AppLocalizations t) {
    if (_selectedServer != null) {
      final server = _selectedServer!;
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: TextButton.icon(
            onPressed: () => setState(() => _selectedServer = null),
            icon: Icon(Icons.arrow_back, size: 16, color: KodaColors.text3),
            label: Text(server['name'] as String? ?? '', style: TextStyle(color: KodaColors.text3)),
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: KodaApi.instance.getChannels(server['id'] as String),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator(color: KodaColors.koda));
              }
              final channels = (snapshot.data ?? []).where((c) => c['type'] == 'text').toList();
              if (channels.isEmpty) {
                return Center(child: Text(t.forwardDestinationPickerNoChannels,
                    style: TextStyle(color: KodaColors.text3, fontSize: 13)));
              }
              return ListView.builder(
                itemCount: channels.length,
                itemBuilder: (_, i) {
                  final c = channels[i];
                  return ListTile(
                    leading: Icon(Icons.tag, color: KodaColors.text3),
                    title: Text(c['name'] as String? ?? '', style: TextStyle(color: KodaColors.text1)),
                    onTap: _sending ? null : () => _send(() => forwardMessageToChannel(
                        channelId: c['id'] as String,
                        text: widget.text,
                        originalAttachment: widget.originalAttachment,
                        gifAttachment: widget.gifAttachment,
                        forwardedFrom: widget.forwardedFrom,
                        myUserId: widget.myUserId)),
                  );
                },
              );
            },
          ),
        ),
      ]);
    }
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _servers,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator(color: KodaColors.koda));
        }
        final servers = snapshot.data ?? [];
        if (servers.isEmpty) {
          return Center(child: Text(t.forwardDestinationPickerNoServers,
              style: TextStyle(color: KodaColors.text3, fontSize: 13)));
        }
        return ListView.builder(
          itemCount: servers.length,
          itemBuilder: (_, i) {
            final s = servers[i];
            return ListTile(
              leading: Icon(Icons.dns_outlined, color: KodaColors.text3),
              title: Text(s['name'] as String? ?? '', style: TextStyle(color: KodaColors.text1)),
              trailing: Icon(Icons.chevron_right, color: KodaColors.text3),
              onTap: () => setState(() => _selectedServer = s),
            );
          },
        );
      },
    );
  }

  Widget _buildDmsTab(AppLocalizations t) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _conversations,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator(color: KodaColors.koda));
        }
        final convos = snapshot.data ?? [];
        if (convos.isEmpty) {
          return Center(child: Text(t.forwardDestinationPickerNoConversations,
              style: TextStyle(color: KodaColors.text3, fontSize: 13)));
        }
        return ListView.builder(
          itemCount: convos.length,
          itemBuilder: (_, i) {
            final c = convos[i];
            final other = c['user'] as Map<String, dynamic>?;
            final peerUserId = other?['id'] as String?;
            final name = other?['username'] as String? ?? t.dmUnknownUser;
            return ListTile(
              leading: KodaAvatar(username: name, size: 28, avatarUrl: other?['avatar_url'] as String?),
              title: Text(name, style: TextStyle(color: KodaColors.text1)),
              onTap: peerUserId == null || _sending ? null : () => _send(() => forwardMessageToDm(
                  conversationId: c['id'] as String,
                  peerUserId: peerUserId,
                  text: widget.text,
                  originalAttachment: widget.originalAttachment,
                  forwardedFrom: widget.forwardedFrom,
                  myUserId: widget.myUserId)),
            );
          },
        );
      },
    );
  }
}
