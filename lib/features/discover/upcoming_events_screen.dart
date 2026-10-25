// lib/features/discover/upcoming_events_screen.dart
//
// Phase 4 "Community surfaces": a user's own cross-server "Upcoming"
// view -- events on any server you're a member of, plus events a
// friend is attending on a public server you're not in (see
// Koda.Events.list_upcoming_for_user and api.dart's getUpcomingEvents).
// The one place in the app an event list genuinely spans more than one
// server; every other calendar view (calendar_screen.dart) is scoped
// to a single channel.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../core/time_utils.dart';
import '../../l10n/generated/app_localizations.dart';
import 'server_discovery_screen.dart' show ServerPreviewScreen;

class UpcomingEventsScreen extends StatefulWidget {
  const UpcomingEventsScreen({super.key});
  @override
  State<UpcomingEventsScreen> createState() => _UpcomingEventsScreenState();
}

class _UpcomingEventsScreenState extends State<UpcomingEventsScreen> {
  List<Map<String, dynamic>> _events = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final events = await KodaApi.instance.getUpcomingEvents();
    if (mounted) setState(() { _events = events; _loading = false; });
  }

  // A "mine" event (on a server you're already in) hands the server +
  // channel back to HomeScreen via the pop result so it can select
  // into that channel, same as a tapped mention notification does --
  // see HomeScreen._routeToNotification's 'mention' case. A friend's
  // event on a server you're not in instead opens that server's public
  // preview, which is as far as a non-member can go.
  Future<void> _openEvent(Map<String, dynamic> event) async {
    if (event['is_member'] == true) {
      Navigator.pop(context, {
        'server_id': event['server_id'],
        'channel_id': event['channel_id'],
      });
    } else {
      await Navigator.push(context, MaterialPageRoute(
          builder: (_) => ServerPreviewScreen(serverId: event['server_id'] as String)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.upcomingEventsTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 16, fontWeight: FontWeight.w700)),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _events.isEmpty
              ? Center(child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(t.upcomingEventsEmptyState,
                      style: TextStyle(color: KodaColors.text3, fontSize: 13),
                      textAlign: TextAlign.center),
                ))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _events.length,
                  itemBuilder: (_, i) => _buildEventRow(t, _events[i]),
                ),
    );
  }

  Widget _buildEventRow(AppLocalizations t, Map<String, dynamic> event) {
    final start = parseServerTimestamp(event['start_at'] as String);
    final isMember = event['is_member'] == true;
    final friends = List<String>.from(event['friend_usernames'] as List? ?? []);
    final color = Color(int.parse(
        (event['color'] as String? ?? '#2DD4A0').replaceFirst('#', '0xFF')));

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: color, width: 3)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        title: Text(event['title'] as String? ?? '',
            style: TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w600, fontSize: 14)),
        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 4),
          Text(
            '${DateFormat('EEE, MMM d · h:mm a').format(start)} · ${event['server_name'] as String? ?? ''}',
            style: TextStyle(color: KodaColors.text3, fontSize: 12),
          ),
          if (!isMember && friends.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(_goingLabel(t, friends),
                style: TextStyle(color: KodaColors.koda, fontSize: 11, fontWeight: FontWeight.w600)),
          ],
        ]),
        trailing: isMember
            ? null
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: KodaColors.elevated,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(t.upcomingEventsPublicBadge,
                    style: TextStyle(color: KodaColors.text3, fontSize: 10)),
              ),
        onTap: () => _openEvent(event),
      ),
    );
  }

  String _goingLabel(AppLocalizations t, List<String> friends) {
    if (friends.length == 1) return t.upcomingEventsFriendGoing(friends[0]);
    if (friends.length == 2) return t.upcomingEventsTwoFriendsGoing(friends[0], friends[1]);
    return t.upcomingEventsManyFriendsGoing(friends[0], friends.length - 1);
  }
}
