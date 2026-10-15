// lib/features/discover/featured_server_rail_tile.dart
//
// A single rotating slot in the server rail (home_screen.dart, right
// after the DM button) that cycles through this week's community-
// featured servers (Koda.Servers.CommunityFeaturedRotationSweeper,
// KodaApi.getFeaturedServers) one at a time, advancing every minute.
// Renders nothing at all when the list is empty -- most of the time
// most servers won't be featured, and the rail shouldn't show a dead
// slot for it.

import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';
import 'server_discovery_screen.dart';

class FeaturedServerRailTile extends StatefulWidget {
  const FeaturedServerRailTile({super.key});
  @override
  State<FeaturedServerRailTile> createState() => _FeaturedServerRailTileState();
}

class _FeaturedServerRailTileState extends State<FeaturedServerRailTile> {
  List<Map<String, dynamic>> _servers = [];
  int _index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    final servers = await KodaApi.instance.getFeaturedServers();
    if (!mounted) return;
    setState(() => _servers = servers);
    if (servers.isNotEmpty) _startRotation();
  }

  void _startRotation() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (!mounted || _servers.isEmpty) return;
      setState(() => _index = (_index + 1) % _servers.length);
    });
  }

  Future<void> _open(Map<String, dynamic> server) async {
    _timer?.cancel();
    await Navigator.push(context, MaterialPageRoute(
        builder: (_) => ServerPreviewScreen(serverId: server['id'] as String)));
    if (mounted && _servers.isNotEmpty) _startRotation();
  }

  @override
  Widget build(BuildContext context) {
    if (_servers.isEmpty) return const SizedBox.shrink();
    final t = AppLocalizations.of(context);
    final server = _servers[_index % _servers.length];
    final name = server['name'] as String? ?? '';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Tooltip(
        message: t.homeFeaturedServerTooltip(name),
        child: KodaTappable(
          semanticLabel: t.homeFeaturedServerTooltip(name),
          borderRadius: BorderRadius.circular(24),
          onTap: () => _open(server),
          child: Container(
            width: 48, height: 48,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: KodaColors.elevated,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: KodaColors.koda, width: 2),
            ),
            alignment: Alignment.center,
            child: KodaAvatar(username: name, avatarUrl: server['icon_url'] as String?, size: 44),
          ),
        ),
      ),
    );
  }
}
