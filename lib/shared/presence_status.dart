// lib/shared/presence_status.dart
//
// The one place "what dot color does this member get" is computed --
// shared by settings_screen.dart (the user's own status editor),
// member_panel.dart, dm_screen.dart, and home_screen.dart's profile
// popover, all of which now render another user's presence.
//
// A self-reported status (online/away/dnd/offline, set in Settings) is
// never trustworthy on its own -- a user can sit on "online" while
// disconnected, since nothing ties that DB field to an actual socket.
// effectiveStatus combines it with the real, connection-tracked
// boolean each list already gets from Phoenix.Presence (see
// server_controller.ex's member_presence/2): not actually connected
// always renders "offline" regardless of self-report (which also gives
// users Discord's "appear offline" for free -- picking "offline" while
// connected shows offline too, since that's indistinguishable from not
// being online in the first place). Connected renders the self-reported
// nuance, defaulting to "online" if unset.

import 'package:flutter/material.dart';
import '../core/theme.dart';

String effectiveStatus({required bool online, String? selfReported}) {
  if (!online) return 'offline';
  return selfReported ?? 'online';
}

// A getter, not a static const/final map -- re-evaluated on each access
// so it always reflects the currently-active palette (a cached final
// would freeze at whichever palette was active on first read and never
// pick up a live High Contrast toggle).
Color statusColor(String status) => switch (status) {
      'online' => KodaColors.mint,
      'away' => KodaColors.gold,
      'dnd' => KodaColors.accent,
      _ => KodaColors.text3,
    };
