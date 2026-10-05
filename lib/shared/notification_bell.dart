// lib/shared/notification_bell.dart
//
// Bell icon with unread badge and dropdown panel.
// Shows in the home screen header.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../core/notifications_provider.dart';
import '../core/theme.dart';
import '../core/time_utils.dart';
import '../l10n/generated/app_localizations.dart';

class NotificationBell extends ConsumerWidget {
  /// Routes a tapped notification to the screen it's actually about --
  /// same `(type, data)` shape as a tapped OS push notification (see
  /// home_screen.dart's _routeToNotification, which both this and
  /// push_notifications.dart's tap stream funnel into).
  final void Function(String? type, Map<String, dynamic>? data) onNavigate;
  const NotificationBell({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationsProvider);
    final unread = state.unreadCount;
    final t = AppLocalizations.of(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: Icon(Icons.notifications_outlined,
              color: KodaColors.text2, size: 20),
          tooltip: t.notificationBellTitle,
          onPressed: () => _showDropdown(context, ref),
        ),
        if (unread > 0)
          Positioned(
            top: 6, right: 6,
            child: Container(
              width: 16, height: 16,
              decoration: BoxDecoration(
                color: KodaColors.accent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  unread > 9 ? '9+' : '$unread',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
      ],
    );
  }

  void _showDropdown(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(notificationsProvider.notifier);
    final state = ref.read(notificationsProvider);
    final t = AppLocalizations.of(context);

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (_) => Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(color: Colors.transparent),
          ),
          Positioned(
            top: 56, right: 16,
            child: Material(
              color: KodaColors.card,
              borderRadius: BorderRadius.circular(12),
              elevation: 8,
              child: Container(
                width: 340,
                constraints: const BoxConstraints(maxHeight: 480),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 8, 8),
                    child: Row(children: [
                      Text(t.notificationBellTitle,
                          style: TextStyle(color: KodaColors.text1,
                              fontSize: 15, fontWeight: FontWeight.w700)),
                      const Spacer(),
                      if (state.unreadCount > 0)
                        TextButton(
                          onPressed: () {
                            notifier.markAllRead();
                            Navigator.pop(context);
                          },
                          child: Text(t.notificationBellMarkAllRead,
                              style: TextStyle(
                                  color: KodaColors.koda, fontSize: 12)),
                        ),
                    ]),
                  ),
                  Divider(color: KodaColors.border, height: 1),

                  // Notification list
                  if (state.loading)
                    Padding(
                      padding: EdgeInsets.all(32),
                      child: CircularProgressIndicator(color: KodaColors.koda),
                    )
                  else if (state.notifications.isEmpty)
                    Padding(
                      padding: EdgeInsets.all(32),
                      child: Text(t.notificationBellEmptyState,
                          style: TextStyle(color: KodaColors.text3,
                              fontSize: 13)),
                    )
                  else
                    Flexible(
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: state.notifications.length,
                        separatorBuilder: (_, __) =>
                            Divider(color: KodaColors.border, height: 1),
                        itemBuilder: (ctx, i) {
                          final n = state.notifications[i];
                          final read = n['read'] == true;
                          final time = _formatTime(n['inserted_at']);
                          return MergeSemantics(
                            child: InkWell(
                            onTap: () {
                              if (!read) notifier.markRead(n['id'] as String);
                              Navigator.pop(context);
                              onNavigate(n['type'] as String?,
                                  n['data'] as Map<String, dynamic>?);
                            },
                            child: Container(
                              color: read
                                  ? Colors.transparent
                                  : KodaColors.koda.withValues(alpha: 0.06),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Row(children: [
                                // No visual footprint -- gives the tint-only
                                // "unread" status (Container.color above) a
                                // text equivalent, merged into this row's
                                // announcement by the MergeSemantics above.
                                if (!read)
                                  Semantics(label: t.notificationBellUnreadLabel, child: const SizedBox.shrink()),
                                Icon(
                                  _notifIcon(n['type'] as String? ?? ''),
                                  color: read
                                      ? KodaColors.text3
                                      : KodaColors.koda,
                                  size: 18,
                                ),
                                const SizedBox(width: 10),
                                Expanded(child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text(n['title'] as String? ?? '',
                                      style: TextStyle(
                                          color: read
                                              ? KodaColors.text2
                                              : KodaColors.text1,
                                          fontSize: 13,
                                          fontWeight: read
                                              ? FontWeight.w400
                                              : FontWeight.w600)),
                                  if (n['body'] != null)
                                    Text(n['body'] as String,
                                        style: TextStyle(
                                            color: KodaColors.text3,
                                            fontSize: 11)),
                                ])),
                                if (time.isNotEmpty)
                                  Text(time,
                                      style: TextStyle(
                                          color: KodaColors.text3,
                                          fontSize: 10)),
                              ]),
                            ),
                            ),
                          );
                        },
                      ),
                    ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _notifIcon(String type) {
    return switch (type) {
      'mention'      => Icons.alternate_email,
      'role_mention' => Icons.group_outlined,
      // Persisted/broadcast as "dm_message" (see Koda.Chat.notify_dm_recipient/5),
      // not "dm" -- this never matched, so every DM notification fell
      // through to the generic bell icon below.
      'dm_message'   => Icons.mail_outline,
      'friend_request' => Icons.person_add_outlined,
      _              => Icons.notifications_outlined,
    };
  }

  String _formatTime(dynamic raw) {
    if (raw == null) return '';
    try {
      final dt = parseServerTimestamp(raw.toString());
      final now = DateTime.now();
      if (now.difference(dt).inHours < 24) {
        return DateFormat('h:mm a').format(dt);
      }
      return DateFormat('MMM d').format(dt);
    } catch (_) { return ''; }
  }
}