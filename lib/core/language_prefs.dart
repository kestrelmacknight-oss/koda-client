// lib/core/language_prefs.dart
//
// UI language preference -- synced across devices via the same
// user-settings blob accessibility_prefs.dart uses (same reasoning:
// someone's chosen language should follow them to every device, not
// just the one they set it on), not shared_preferences.
//
// null uiLocale means "follow the system locale" -- the default for
// everyone who's never touched this setting. An explicit code
// (matching language_options.dart) overrides it. See main.dart's
// KodaApp.build for where this actually reaches MaterialApp.locale.
//
// Loaded/reset from the same AuthGate choke point as accessibility_prefs.dart.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api.dart';

class LanguagePrefs {
  final String? uiLocale;

  const LanguagePrefs({this.uiLocale});

  factory LanguagePrefs.fromJson(Map<String, dynamic> j) =>
      LanguagePrefs(uiLocale: j['ui_locale'] as String?);

  Map<String, dynamic> toJson() => {'ui_locale': uiLocale};

  LanguagePrefs copyWith({String? uiLocale}) =>
      LanguagePrefs(uiLocale: uiLocale);
}

class LanguagePrefsNotifier extends StateNotifier<LanguagePrefs> {
  LanguagePrefsNotifier() : super(const LanguagePrefs());

  Map<String, dynamic> _fullSettings = {};

  Future<void> load() async {
    final settings = await KodaApi.instance.getSettings();
    _fullSettings = settings;
    final raw = settings['language'];
    state = raw is Map
        ? LanguagePrefs.fromJson(Map<String, dynamic>.from(raw))
        : const LanguagePrefs();
  }

  void reset() {
    _fullSettings = {};
    state = const LanguagePrefs();
  }

  /// null = follow system locale.
  Future<void> setUiLocale(String? code) async {
    state = LanguagePrefs(uiLocale: code);
    _fullSettings = {..._fullSettings, 'language': state.toJson()};
    await KodaApi.instance.putSettings(_fullSettings);
  }
}

final languagePrefsProvider =
    StateNotifierProvider<LanguagePrefsNotifier, LanguagePrefs>(
        (ref) => LanguagePrefsNotifier());
