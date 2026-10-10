// lib/core/presence_provider.dart
//
// Live overlay for other users' status/custom_status/playingGame, keyed
// by user id. Every member-list/DM-list/profile-popover row already gets
// an initial status/custom_status value from its own fetch (see
// server_controller.ex members/2, dm_controller.ex's user_json/1,
// chat.ex's message author blob) -- this only holds *patches* that
// arrive afterward, over the "presence_update" socket event on the
// per-user "user:<id>" topic every client already joins (see
// home_screen.dart's _subscribeToUserNotifications,
// Koda.Auth.broadcast_presence_update/1, and Koda.Steam's own
// broadcast_presence/2 -- two independent server-side sources feeding
// the same event, which is why patch() merges rather than replaces). An
// absent entry just means "nothing's changed since the initial fetch,"
// not "no status."

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PresenceOverride {
  final String? status;
  final String? customStatus;
  final String? playingGame;
  const PresenceOverride({this.status, this.customStatus, this.playingGame});
}

class PresenceOverridesNotifier extends StateNotifier<Map<String, PresenceOverride>> {
  PresenceOverridesNotifier() : super(const {});

  // Merges onto the existing entry rather than replacing it -- a
  // status-only broadcast (Koda.Auth) must not wipe a previously-known
  // playingGame (Koda.Steam), and vice versa. A field not present in
  // this particular broadcast keeps its previous value; hasX
  // distinguishes "not part of this payload" from "explicitly cleared
  // to null" (e.g. presence sharing turned off sends playingGame: null
  // on purpose).
  void patch(String userId, {
    String? status,
    String? customStatus,
    String? playingGame,
    bool hasStatus = true,
    bool hasCustomStatus = true,
    bool hasPlayingGame = true,
  }) {
    final prev = state[userId];
    state = {
      ...state,
      userId: PresenceOverride(
        status: hasStatus ? status : prev?.status,
        customStatus: hasCustomStatus ? customStatus : prev?.customStatus,
        playingGame: hasPlayingGame ? playingGame : prev?.playingGame,
      ),
    };
  }
}

final presenceOverridesProvider =
    StateNotifierProvider<PresenceOverridesNotifier, Map<String, PresenceOverride>>(
        (ref) => PresenceOverridesNotifier());
