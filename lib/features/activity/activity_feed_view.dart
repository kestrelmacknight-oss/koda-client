// lib/features/activity/activity_feed_view.dart
//
// The actual feed content -- embedded both in a normal in-app route
// (ActivityFeedScreen, every platform) and inside the desktop pop-out
// window (activity_feed_popout_window.dart), which is why this doesn't
// assume anything about Riverpod/provider scope beyond what KodaApi's
// own singleton already gives it. Polls every 30s rather than opening
// a socket -- a friend's activity is occasional, not a live stream, and
// the pop-out window runs in a separate engine/process with no shared
// Dart memory to push updates through anyway.

import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../core/time_utils.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';

class ActivityFeedView extends StatefulWidget {
  const ActivityFeedView({super.key});
  @override
  State<ActivityFeedView> createState() => _ActivityFeedViewState();
}

class _ActivityFeedViewState extends State<ActivityFeedView> {
  List<Map<String, dynamic>> _entries = [];
  bool _loading = true;
  Timer? _pollTimer;

  @override
  void initState() {
    super.initState();
    _load();
    _pollTimer = Timer.periodic(const Duration(seconds: 30), (_) => _load(silent: true));
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  Future<void> _load({bool silent = false}) async {
    if (!silent && mounted) setState(() => _loading = true);
    final entries = await KodaApi.instance.getActivityFeed();
    if (!mounted) return;
    setState(() { _entries = entries; _loading = false; });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    if (_loading) return Center(child: CircularProgressIndicator(color: KodaColors.koda));
    if (_entries.isEmpty) {
      return Center(child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(t.activityFeedEmptyState,
            style: TextStyle(color: KodaColors.text3, fontSize: 13), textAlign: TextAlign.center),
      ));
    }
    return RefreshIndicator(
      onRefresh: _load,
      color: KodaColors.koda,
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _entries.length,
        itemBuilder: (_, i) => _buildEntryRow(t, _entries[i]),
      ),
    );
  }

  Widget _buildEntryRow(AppLocalizations t, Map<String, dynamic> e) {
    final username = e['username'] as String? ?? '?';
    final serverName = e['server_name'] as String?;
    final data = Map<String, dynamic>.from(e['data'] as Map? ?? {});
    final when = parseServerTimestamp(e['inserted_at'] as String);
    final described = _describe(t, e['type'] as String? ?? '', username, serverName, data);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        KodaAvatar(username: username, avatarUrl: e['avatar_url'] as String?, size: 36),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(described.icon, size: 14, color: KodaColors.koda),
            const SizedBox(width: 4),
            Expanded(child: Text(described.label, style: TextStyle(color: KodaColors.text1, fontSize: 13))),
          ]),
          const SizedBox(height: 2),
          Text(_relativeTime(t, when), style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        ])),
      ]),
    );
  }

  ({IconData icon, String label}) _describe(
      AppLocalizations t, String type, String username, String? serverName, Map<String, dynamic> data) {
    switch (type) {
      case 'achievement_awarded':
        return (
          icon: Icons.emoji_events,
          label: t.activityFeedAchievement(
              username, data['achievement_name'] as String? ?? '', serverName ?? ''),
        );
      case 'went_live':
        return (
          icon: Icons.live_tv,
          label: t.activityFeedWentLive(username, _platformLabel(data['platform'] as String? ?? '')),
        );
      case 'server_joined':
        return (icon: Icons.group_add, label: t.activityFeedServerJoined(username, serverName ?? ''));
      case 'arcade_high_score':
        return (
          icon: Icons.videogame_asset,
          label: t.activityFeedArcadeHighScore(
              username, _gameLabel(t, data['game'] as String? ?? ''), (data['score'] as num?)?.toInt() ?? 0),
        );
      default:
        return (icon: Icons.circle, label: username);
    }
  }

  // Brand names -- deliberately not localized, same convention
  // settings_screen.dart's own _platformLabel already uses.
  String _platformLabel(String platform) => platform == 'twitch' ? 'Twitch' : 'YouTube';

  String _gameLabel(AppLocalizations t, String game) =>
      game == 'minesweeper' ? t.arcadeMinesweeperTitle : t.arcadeMatch3Title;

  String _relativeTime(AppLocalizations t, DateTime when) {
    final diff = DateTime.now().difference(when);
    if (diff.inMinutes < 1) return t.activityFeedJustNow;
    if (diff.inHours < 1) return t.activityFeedMinutesAgo(diff.inMinutes);
    if (diff.inDays < 1) return t.activityFeedHoursAgo(diff.inHours);
    return t.activityFeedDaysAgo(diff.inDays);
  }
}
