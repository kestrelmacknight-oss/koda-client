// lib/core/message_order_prefs.dart
//
// Whether newest messages appear at the bottom (today's default,
// Discord-style) or the top -- synced across devices via the same
// user-settings blob accessibility_prefs.dart uses
// (KodaApi.getSettings/putSettings), not shared_preferences, so the
// choice follows the account, not just the device it was set on.
//
// Loaded/reset from the same single choke point as every other synced
// preference (AuthGate's ref.listen on authProvider in main.dart).
// Applies everywhere messages render -- channels (home_screen.dart),
// the voice-panel side chat (channel_chat_panel.dart), and DMs
// (dm_screen.dart) all read this one provider rather than each having
// their own setting.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api.dart';

class MessageOrderPrefs {
  final bool newestAtTop;

  const MessageOrderPrefs({this.newestAtTop = false});

  factory MessageOrderPrefs.fromJson(Map<String, dynamic> j) => MessageOrderPrefs(
        newestAtTop: j['newest_at_top'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {'newest_at_top': newestAtTop};

  MessageOrderPrefs copyWith({bool? newestAtTop}) =>
      MessageOrderPrefs(newestAtTop: newestAtTop ?? this.newestAtTop);
}

class MessageOrderPrefsNotifier extends StateNotifier<MessageOrderPrefs> {
  MessageOrderPrefsNotifier() : super(const MessageOrderPrefs());

  // Same "hold the full blob to merge-and-save without clobbering other
  // keys" reasoning as AccessibilityPrefsNotifier._fullSettings.
  Map<String, dynamic> _fullSettings = {};

  Future<void> load() async {
    final settings = await KodaApi.instance.getSettings();
    _fullSettings = settings;
    final raw = settings['message_order'];
    state = raw is Map
        ? MessageOrderPrefs.fromJson(Map<String, dynamic>.from(raw))
        : const MessageOrderPrefs();
  }

  void reset() {
    _fullSettings = {};
    state = const MessageOrderPrefs();
  }

  Future<void> setNewestAtTop(bool value) async {
    state = state.copyWith(newestAtTop: value);
    _fullSettings = {..._fullSettings, 'message_order': state.toJson()};
    await KodaApi.instance.putSettings(_fullSettings);
  }
}

final messageOrderPrefsProvider =
    StateNotifierProvider<MessageOrderPrefsNotifier, MessageOrderPrefs>(
        (ref) => MessageOrderPrefsNotifier());
