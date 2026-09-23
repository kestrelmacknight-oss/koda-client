// lib/core/accessibility_prefs.dart
//
// Accessibility preferences (font size, dyslexia-friendly font,
// density) -- synced across devices via the same user-settings blob
// content_filters_screen.dart uses (KodaApi.getSettings/putSettings),
// not shared_preferences: someone who needs larger text needs it on
// every device they use, not just the one they set it on.
//
// Loaded/reset from a single choke point (AuthGate's ref.listen on
// authProvider in main.dart) rather than from each individual login
// call site, so it can't be silently missed on a path that's added
// later.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api.dart';

class AccessibilityPrefs {
  final double textScale;
  final bool dyslexiaFont;
  final String density; // 'standard' | 'comfortable' | 'compact'

  const AccessibilityPrefs({
    this.textScale = 1.0,
    this.dyslexiaFont = false,
    this.density = 'standard',
  });

  factory AccessibilityPrefs.fromJson(Map<String, dynamic> j) => AccessibilityPrefs(
        textScale: (j['text_scale'] as num?)?.toDouble() ?? 1.0,
        dyslexiaFont: j['dyslexia_font'] as bool? ?? false,
        density: j['density'] as String? ?? 'standard',
      );

  Map<String, dynamic> toJson() => {
        'text_scale': textScale,
        'dyslexia_font': dyslexiaFont,
        'density': density,
      };

  AccessibilityPrefs copyWith({double? textScale, bool? dyslexiaFont, String? density}) =>
      AccessibilityPrefs(
        textScale: textScale ?? this.textScale,
        dyslexiaFont: dyslexiaFont ?? this.dyslexiaFont,
        density: density ?? this.density,
      );
}

class AccessibilityPrefsNotifier extends StateNotifier<AccessibilityPrefs> {
  AccessibilityPrefsNotifier() : super(const AccessibilityPrefs());

  // The full settings blob as last fetched from the server -- held so
  // updates below can merge-and-save without clobbering other keys
  // (e.g. 'content_filters') the way content_filters_screen.dart's own
  // local _fullSettings does, just hoisted here since both KodaApp
  // (global theme/text-scale effect) and the Settings screen (the UI)
  // need the same loaded state.
  Map<String, dynamic> _fullSettings = {};

  Future<void> load() async {
    final settings = await KodaApi.instance.getSettings();
    _fullSettings = settings;
    final raw = settings['accessibility'];
    state = raw is Map
        ? AccessibilityPrefs.fromJson(Map<String, dynamic>.from(raw))
        : const AccessibilityPrefs();
  }

  void reset() {
    _fullSettings = {};
    state = const AccessibilityPrefs();
  }

  Future<void> setTextScale(double value) => _update(state.copyWith(textScale: value));
  Future<void> setDyslexiaFont(bool value) => _update(state.copyWith(dyslexiaFont: value));
  Future<void> setDensity(String value) => _update(state.copyWith(density: value));

  Future<void> _update(AccessibilityPrefs next) async {
    state = next;
    _fullSettings = {..._fullSettings, 'accessibility': next.toJson()};
    await KodaApi.instance.putSettings(_fullSettings);
  }
}

final accessibilityPrefsProvider =
    StateNotifierProvider<AccessibilityPrefsNotifier, AccessibilityPrefs>(
        (ref) => AccessibilityPrefsNotifier());
