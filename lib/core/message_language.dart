// lib/core/message_language.dart
//
// Message language auto-detection -- purely client-side, on-device,
// no cloud call. Has to be: messages are E2EE, so the server never
// holds plaintext to detect a language from itself. Wraps
// flutter_langdetect (pure Dart n-gram profiles, initialized once in
// main.dart via initLangDetect()) with the small amount of app-specific
// policy: skip unreliably-short text, and normalize the package's
// Chinese variant codes to match this app's own language codes (see
// language_options.dart) everywhere else.

import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;

const _kMinDetectableLength = 10;

const Map<String, String> _codeNormalization = {
  'zhcn': 'zh',
  'zhtw': 'zh_Hant',
};

/// Returns this app's own language code (matching language_options.dart)
/// for [text], or null when detection wouldn't be meaningful --
/// either the text is too short to detect reliably, or the detector
/// itself couldn't settle on a language.
String? detectMessageLanguage(String text) {
  final trimmed = text.trim();
  if (trimmed.length < _kMinDetectableLength) return null;

  try {
    final code = langdetect.detect(trimmed);
    if (code.isEmpty || code == 'unknown') return null;
    return _codeNormalization[code] ?? code;
  } catch (_) {
    // langdetect throws LangDetectException on text it can't classify
    // at all (e.g. pure punctuation/emoji) -- that's a "no badge"
    // outcome, not an error worth surfacing.
    return null;
  }
}
