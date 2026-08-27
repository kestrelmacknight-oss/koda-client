// lib/shared/notification_bell.dart
//
// Bell icon with unread badge and dropdown panel.
// Shows in the home screen header.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../core/notifications_provider.dart';
import '../core/theme.dart';

class NotificationBell extends ConsumerWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationsProvider);
    final unread = state.unreadCount;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined,
              color: KodaColors.text2, size: 20),
          tooltip: 'Notifications',
          onPressed: () => _showDropdown(context, ref),
        ),
        if (unread > 0)
          Positioned(
            top: 6, right: 6,
            child: Container(
              width: 16, height: 16,
              decoration: const BoxDecoration(
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
                      const Text('Notifications',
                          style: TextStyle(color: KodaColors.text1,
                              fontSize: 15, fontWeight: FontWeight.w700)),
                      const Spacer(),
                      if (state.unreadCount > 0)
                        TextButton(
                          onPressed: () {
                            notifier.markAllRead();
                            Navigator.pop(context);
                          },
                          child: const Text('Mark all read',
                              style: TextStyle(
                                  color: KodaColors.koda, fontSize: 12)),
                        ),
                    ]),
                  ),
                  const Divider(color: KodaColors.border, height: 1),

                  // Notification list
                  if (state.loading)
                    const Padding(
                      padding: EdgeInsets.all(32),
                      child: CircularProgressIndicator(color: KodaColors.koda),
                    )
                  else if (state.notifications.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(32),
                      child: Text('No notifications yet',
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
                            const Divider(color: KodaColors.border, height: 1),
                        itemBuilder: (ctx, i) {
                          final n = state.notifications[i];
                          final read = n['read'] == true;
                          final time = _formatTime(n['inserted_at']);
                          return InkWell(
                            onTap: () {
                              if (!read) notifier.markRead(n['id'] as String);
                              Navigator.pop(context);
                              // TODO: navigate to channel
                            },
                            child: Container(
                              color: read
                                  ? Colors.transparent
                                  : KodaColors.koda.withOpacity(0.06),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Row(children: [
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
                                        style: const TextStyle(
                                            color: KodaColors.text3,
                                            fontSize: 11)),
                                ])),
                                if (time.isNotEmpty)
                                  Text(time,
                                      style: const TextStyle(
                                          color: KodaColors.text3,
                                          fontSize: 10)),
                              ]),
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
      'dm'           => Icons.mail_outline,
      'friend_request' => Icons.person_add_outlined,
      _              => Icons.notifications_outlined,
    };
  }

  String _formatTime(dynamic raw) {
    if (raw == null) return '';
    try {
      final dt = DateTime.parse(raw.toString()).toLocal();
      final now = DateTime.now();
      if (now.difference(dt).inHours < 24) {
        return DateFormat('h:mm a').format(dt);
      }
      return DateFormat('MMM d').format(dt);
    } catch (_) { return ''; }
  }
}