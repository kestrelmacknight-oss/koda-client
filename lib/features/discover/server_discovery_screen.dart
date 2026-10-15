// lib/features/discover/server_discovery_screen.dart
//
// Phase 4 "Community surfaces": browse servers that opted into public
// discovery (Server.is_public, Koda.Servers.discover_servers/1) and
// join one without an invite code. Distinct from KodaMarketplaceScreen's
// own "Discover" tab, which lists marketplace_discoverable servers for
// their merch catalogs -- a separate opt-in, separate purpose. See
// lib/core/api.dart's discoverServers/getServerPreview/joinPublicServer.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';
import '../server/rules_screen.dart';

class ServerDiscoveryScreen extends StatefulWidget {
  const ServerDiscoveryScreen({super.key});
  @override
  State<ServerDiscoveryScreen> createState() => _ServerDiscoveryScreenState();
}

class _ServerDiscoveryScreenState extends State<ServerDiscoveryScreen> {
  final _searchCtrl = TextEditingController();
  List<Map<String, dynamic>> _servers = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final servers = await KodaApi.instance.discoverServers(
        query: _searchCtrl.text.trim().isEmpty ? null : _searchCtrl.text.trim());
    if (mounted) setState(() { _servers = servers; _loading = false; });
  }

  Future<void> _openServer(Map<String, dynamic> server) async {
    final joined = await Navigator.push<bool>(context, MaterialPageRoute(
        builder: (_) => ServerPreviewScreen(serverId: server['id'] as String)));
    if (joined == true && mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.serverDiscoveryTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 16, fontWeight: FontWeight.w700)),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: KodaTextField(
            controller: _searchCtrl,
            hintText: t.serverDiscoverySearchHint,
            onSubmitted: (_) => _load(),
          ),
        ),
        Expanded(
          child: _loading
              ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
              : _servers.isEmpty
                  ? Center(child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(t.serverDiscoveryEmptyState,
                          style: TextStyle(color: KodaColors.text3, fontSize: 13),
                          textAlign: TextAlign.center),
                    ))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _servers.length,
                      itemBuilder: (_, i) {
                        final s = _servers[i];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: KodaColors.card, borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: KodaColors.border)),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            leading: KodaAvatar(
                                username: s['name'] as String? ?? '',
                                avatarUrl: s['icon_url'] as String?,
                                size: 44),
                            title: Row(children: [
                              Flexible(child: Text(s['name'] as String? ?? '',
                                  style: TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis)),
                              if (s['mature_content'] == true) ...[
                                const SizedBox(width: 6),
                                _MatureBadge(label: t.serverDiscoveryMatureBadge),
                              ],
                            ]),
                            subtitle: Text(
                                (s['description'] as String?)?.isNotEmpty == true
                                    ? s['description'] as String
                                    : t.serverDiscoveryNoDescription,
                                style: TextStyle(color: KodaColors.text3, fontSize: 12),
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                            trailing: Text(
                                t.serverDiscoveryMemberCount(s['member_count'] as int? ?? 0),
                                style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                            onTap: () => _openServer(s),
                          ),
                        );
                      },
                    ),
        ),
      ]),
    );
  }
}

class _MatureBadge extends StatelessWidget {
  final String label;
  const _MatureBadge({required this.label});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
            color: Colors.redAccent.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.redAccent.withValues(alpha: 0.4))),
        child: Text(label, style: const TextStyle(color: Colors.redAccent, fontSize: 9, fontWeight: FontWeight.w700)),
      );
}

class ServerPreviewScreen extends StatefulWidget {
  final String serverId;
  const ServerPreviewScreen({super.key, required this.serverId});
  @override
  State<ServerPreviewScreen> createState() => ServerPreviewScreenState();
}

class ServerPreviewScreenState extends State<ServerPreviewScreen> {
  Map<String, dynamic>? _preview;
  bool _loading = true;
  bool _joining = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final preview = await KodaApi.instance.getServerPreview(widget.serverId);
    if (mounted) setState(() { _preview = preview; _loading = false; });
  }

  Future<void> _join() async {
    final t = AppLocalizations.of(context);
    setState(() { _joining = true; _error = null; });
    final result = await KodaApi.instance.joinPublicServer(widget.serverId);
    if (!mounted) return;
    if (!result.ok) {
      setState(() { _joining = false; _error = result.errorCode ?? t.serverDiscoveryJoinError; });
      return;
    }

    // If the server has rules this member hasn't accepted yet, show
    // them right away -- the channel list they'll land on is server-
    // side gated down to just the rules (and any preview) channels
    // until they do (Koda.Servers.has_unaccepted_rules?/2).
    final rules = await KodaApi.instance.getServerRules(widget.serverId);
    if (mounted && rules != null && rules['rules'] != null && rules['accepted'] != true) {
      await Navigator.push(context, MaterialPageRoute(
        builder: (_) => RulesScreen(
          serverId: widget.serverId,
          serverName: _preview?['name'] as String? ?? '',
          rulesContent: rules['rules'] as String,
          onAccepted: () => Navigator.pop(context),
        ),
      ));
    }

    if (mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final preview = _preview;
    final previewChannels = preview == null
        ? const <Map<String, dynamic>>[]
        : List<Map<String, dynamic>>.from(preview['channels'] ?? []);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(backgroundColor: KodaColors.bg2),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : preview == null
              ? Center(child: Text(t.serverDiscoveryNotFound,
                  style: TextStyle(color: KodaColors.text3, fontSize: 13)))
              : ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Row(children: [
                      KodaAvatar(
                          username: preview['name'] as String? ?? '',
                          avatarUrl: preview['icon_url'] as String?,
                          size: 56),
                      const SizedBox(width: 14),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(children: [
                          Flexible(child: Text(preview['name'] as String? ?? '',
                              style: TextStyle(color: KodaColors.text1, fontSize: 18, fontWeight: FontWeight.w700),
                              overflow: TextOverflow.ellipsis)),
                          if (preview['mature_content'] == true) ...[
                            const SizedBox(width: 6),
                            _MatureBadge(label: t.serverDiscoveryMatureBadge),
                          ],
                        ]),
                        Text(t.serverDiscoveryMemberCount(preview['member_count'] as int? ?? 0),
                            style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                      ])),
                    ]),
                    const SizedBox(height: 16),
                    Text(
                        (preview['description'] as String?)?.isNotEmpty == true
                            ? preview['description'] as String
                            : t.serverDiscoveryNoDescription,
                        style: TextStyle(color: KodaColors.text2, fontSize: 13, height: 1.5)),
                    const SizedBox(height: 20),
                    if (_error != null) ...[
                      KodaErrorBanner(message: _error!),
                      const SizedBox(height: 4),
                    ],
                    KodaPrimaryButton(
                      label: t.serverDiscoveryJoinButton,
                      busy: _joining,
                      onPressed: _joining ? null : _join,
                    ),
                    if (previewChannels.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      Text(t.serverDiscoveryPreviewChannelsLabel,
                          style: TextStyle(color: KodaColors.text3, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                      const SizedBox(height: 8),
                      for (final ch in previewChannels)
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                              color: KodaColors.card, borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: KodaColors.border)),
                          child: ListTile(
                            leading: Icon(Icons.tag, color: KodaColors.text3, size: 18),
                            title: Text(ch['name'] as String? ?? '',
                                style: TextStyle(color: KodaColors.text1, fontSize: 13, fontWeight: FontWeight.w600)),
                            subtitle: (ch['description'] as String?)?.isNotEmpty == true
                                ? Text(ch['description'] as String,
                                    style: TextStyle(color: KodaColors.text3, fontSize: 11))
                                : null,
                            onTap: () => Navigator.push(context, MaterialPageRoute(
                                builder: (_) => _PreviewChannelScreen(
                                    serverId: widget.serverId,
                                    channelId: ch['id'] as String,
                                    channelName: ch['name'] as String? ?? ''))),
                          ),
                        ),
                    ],
                  ],
                ),
    );
  }
}

/// Read-only view of a "preview" channel's messages, for someone who
/// hasn't joined the server. Deliberately minimal -- no send box, no
/// socket subscription, no reactions/threads -- this is a teaser, not
/// the real chat experience (lib/shared/channel_chat_panel.dart is
/// that, for actual members). Preview-channel messages are always
/// plaintext server-side (KodaWeb.ChannelController.send_message/2
/// forces encrypted: false for this channel type, since a non-member
/// has no E2EE key material to decrypt anything with anyway), so
/// there's nothing to decrypt here -- just render `content` directly.
class _PreviewChannelScreen extends StatefulWidget {
  final String serverId;
  final String channelId;
  final String channelName;
  const _PreviewChannelScreen({required this.serverId, required this.channelId, required this.channelName});
  @override
  State<_PreviewChannelScreen> createState() => _PreviewChannelScreenState();
}

class _PreviewChannelScreenState extends State<_PreviewChannelScreen> {
  List<Map<String, dynamic>> _messages = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final msgs = await KodaApi.instance.getPublicPreviewMessages(widget.serverId, widget.channelId);
    if (mounted) setState(() { _messages = msgs; _loading = false; });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text('#${widget.channelName}',
            style: TextStyle(color: KodaColors.text1, fontSize: 15)),
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          color: KodaColors.elevated,
          child: Text(t.serverDiscoveryPreviewReadOnlyNote,
              textAlign: TextAlign.center,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        ),
        Expanded(
          child: _loading
              ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
              : _messages.isEmpty
                  ? Center(child: Text(t.serverDiscoveryPreviewEmptyState,
                      style: TextStyle(color: KodaColors.text3, fontSize: 13)))
                  : ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.all(12),
                      itemCount: _messages.length,
                      itemBuilder: (_, i) {
                        final m = _messages[i];
                        final author = m['author'] as Map<String, dynamic>? ?? {};
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            KodaAvatar(
                                username: author['username'] as String? ?? '',
                                avatarUrl: author['avatar_url'] as String?,
                                size: 32),
                            const SizedBox(width: 10),
                            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(author['username'] as String? ?? '',
                                  style: TextStyle(color: KodaColors.text1, fontSize: 13, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 2),
                              Text(m['content'] as String? ?? '',
                                  style: TextStyle(color: KodaColors.text2, fontSize: 13)),
                            ])),
                          ]),
                        );
                      },
                    ),
        ),
      ]),
    );
  }
}
