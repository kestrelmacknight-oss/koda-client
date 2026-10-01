// lib/core/presence_provider.dart
//
// Live overlay for other users' status/custom_status, keyed by user id.
// Every member-list/DM-list/profile-popover row already gets an initial
// status/custom_status value from its own fetch (see server_controller.ex
// members/2, dm_controller.ex's user_json/1, chat.ex's message author
// blob) -- this only holds *patches* that arrive afterward, over the
// "presence_update" socket event on the per-user "user:<id>" topic every
// client already joins (see home_screen.dart's
// _subscribeToUserNotifications and Koda.Auth.broadcast_presence_update/1
// server-side). A render site overlays this map onto its own row data;
// an absent entry just means "nothing's changed since the initial
// fetch," not "no status."

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PresenceOverride {
  final String? status;
  final String? customStatus;
  const PresenceOverride({this.status, this.customStatus});
}

class PresenceOverridesNotifier extends StateNotifier<Map<String, PresenceOverride>> {
  PresenceOverridesNotifier() : super(const {});

  void patch(String userId, {String? status, String? customStatus}) {
    state = {
      ...state,
      userId: PresenceOverride(status: status, customStatus: customStatus),
    };
  }
}

final presenceOverridesProvider =
    StateNotifierProvider<PresenceOverridesNotifier, Map<String, PresenceOverride>>(
        (ref) => PresenceOverridesNotifier());
