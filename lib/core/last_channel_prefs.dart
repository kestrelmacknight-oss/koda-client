// lib/core/last_channel_prefs.dart
//
// Remembers the last channel viewed per server, purely as a client-side
// UX default (see home_screen.dart's _selectServer) -- not synced, not
// a trust boundary. Safe by construction: the server already filters
// the channel list returned to a client down to exactly what that user
// can currently view (see koda-server-check's
// Servers.filter_viewable_channels/2, used by ChannelController.index/2)
// before this remembered id is ever looked up against it, so a stale
// id for a channel someone lost access to since simply won't be found
// -- it can't leak a channel's existence or content.

import 'package:shared_preferences/shared_preferences.dart';

class LastChannelPrefs {
  LastChannelPrefs._();

  static String _key(String serverId) => 'last_channel_$serverId';

  static Future<String?> get(String serverId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key(serverId));
  }

  static Future<void> set(String serverId, String channelId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key(serverId), channelId);
  }
}
