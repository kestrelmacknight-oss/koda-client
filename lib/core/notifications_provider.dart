// lib/core/notifications_provider.dart
//
// Manages in-app notifications state: unread count, list, real-time updates.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api.dart';

class NotificationsState {
  final List<Map<String, dynamic>> notifications;
  final int unreadCount;
  final bool loading;

  const NotificationsState({
    this.notifications = const [],
    this.unreadCount = 0,
    this.loading = false,
  });

  NotificationsState copyWith({
    List<Map<String, dynamic>>? notifications,
    int? unreadCount,
    bool? loading,
  }) => NotificationsState(
    notifications: notifications ?? this.notifications,
    unreadCount: unreadCount ?? this.unreadCount,
    loading: loading ?? this.loading,
  );
}

class NotificationsNotifier extends StateNotifier<NotificationsState> {
  NotificationsNotifier() : super(const NotificationsState());

  Future<void> load() async {
    state = state.copyWith(loading: true);
    final data = await KodaApi.instance.getNotifications();
    if (data == null) {
      state = state.copyWith(loading: false);
      return;
    }
    final notifs = List<Map<String, dynamic>>.from(
        data['notifications'] ?? []);
    final count = data['unread_count'] as int? ?? 0;
    state = state.copyWith(
      notifications: notifs,
      unreadCount: count,
      loading: false,
    );
  }

  void addNotification(Map<String, dynamic> notif) {
    state = state.copyWith(
      notifications: [notif, ...state.notifications],
      unreadCount: state.unreadCount + 1,
    );
  }

  Future<void> markRead(String id) async {
    await KodaApi.instance.markNotificationRead(id);
    final updated = state.notifications.map((n) {
      if (n['id'] == id) return {...n, 'read': true};
      return n;
    }).toList();
    final count = updated.where((n) => n['read'] != true).length;
    state = state.copyWith(notifications: updated, unreadCount: count);
  }

  Future<void> markAllRead() async {
    await KodaApi.instance.markAllNotificationsRead();
    final updated = state.notifications
        .map((n) => {...n, 'read': true}).toList();
    state = state.copyWith(notifications: updated, unreadCount: 0);
  }
}

final notificationsProvider = StateNotifierProvider<NotificationsNotifier,
    NotificationsState>((ref) => NotificationsNotifier());