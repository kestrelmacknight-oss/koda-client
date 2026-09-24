// lib/core/theme.dart
//
// Koda's dark, violet/mint brand palette -- matches koda.fyi and the
// transactional email templates so the experience is consistent
// website -> email -> app.

import 'package:flutter/material.dart';

class _KodaPalette {
  final Color voidBg, bg2, card, elevated, border;
  final Color koda, mint, gold, accent;
  final Color text1, text2, text3;

  const _KodaPalette({
    required this.voidBg,
    required this.bg2,
    required this.card,
    required this.elevated,
    required this.border,
    required this.koda,
    required this.mint,
    required this.gold,
    required this.accent,
    required this.text1,
    required this.text2,
    required this.text3,
  });
}

const _normalPalette = _KodaPalette(
  voidBg:  Color(0xFF09090F),
  bg2:     Color(0xFF0D0E1A),
  card:    Color(0xFF131524),
  elevated: Color(0xFF181A2E),
  border:  Color(0xFF1E2238),
  koda:    Color(0xFF7B68EE), // violet
  mint:    Color(0xFF5BEAD4),
  gold:    Color(0xFFFFCA28),
  accent:  Color(0xFFFF5370), // red/error
  text1:   Color(0xFFECEEF8),
  text2:   Color(0xFF9BA5C8),
  text3:   Color(0xFF575F80),
);

// First-pass high-contrast palette -- pure black background, near-white
// text, saturated accents chosen for strong contrast against #000000.
// A first pass to visually tune once it's actually on screen, same as
// every other heuristic value tuned this session.
const _highContrastPalette = _KodaPalette(
  voidBg:  Color(0xFF000000),
  bg2:     Color(0xFF000000),
  card:    Color(0xFF0D0D0D),
  elevated: Color(0xFF1A1A1A),
  border:  Color(0xFFFFFFFF),
  koda:    Color(0xFFA78BFA),
  mint:    Color(0xFF00F5D4),
  gold:    Color(0xFFFFD60A),
  accent:  Color(0xFFFF453A),
  text1:   Color(0xFFFFFFFF),
  text2:   Color(0xFFE0E0E0),
  text3:   Color(0xFFB0B0B0),
);

/// Live-swappable color palette -- every existing `KodaColors.x` call
/// site across the app keeps working unchanged (these are getters, not
/// static consts, so the *identifier* never needed to change, only the
/// `const` keyword on whatever constructor reads it). setHighContrast
/// flips which palette every getter reads from; pairing it with a
/// forced full-tree remount (see KodaApp in main.dart) is what actually
/// makes the switch appear live rather than requiring an app restart.
class KodaColors {
  KodaColors._();

  static _KodaPalette _active = _normalPalette;

  static void setHighContrast(bool enabled) {
    _active = enabled ? _highContrastPalette : _normalPalette;
  }

  static Color get voidBg   => _active.voidBg;
  static Color get bg2      => _active.bg2;
  static Color get card     => _active.card;
  static Color get elevated => _active.elevated;
  static Color get border   => _active.border;

  static Color get koda   => _active.koda;
  static Color get mint   => _active.mint;
  static Color get gold   => _active.gold;
  static Color get accent => _active.accent;

  static Color get text1 => _active.text1;
  static Color get text2 => _active.text2;
  static Color get text3 => _active.text3;
}

ThemeData kodaTheme({bool dyslexiaFont = false, VisualDensity? visualDensity}) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: KodaColors.voidBg,
    // Overriding this one place covers all body text app-wide -- no
    // individual TextStyle sets its own fontFamily except the handful
    // that intentionally pin 'monospace'/'Consolas' for security codes
    // (TOTP secrets, safety numbers, license keys), which correctly
    // stay fixed-width regardless of this setting.
    fontFamily: dyslexiaFont ? 'OpenDyslexic' : 'Segoe UI',
    visualDensity: visualDensity ?? VisualDensity.standard,
    colorScheme: ColorScheme.dark(
      primary:   KodaColors.koda,
      secondary: KodaColors.mint,
      error:     KodaColors.accent,
      surface:   KodaColors.card,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: KodaColors.text2),
      bodyLarge:  TextStyle(color: KodaColors.text1),
    ),
    dividerColor: KodaColors.border,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: KodaColors.card,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: KodaColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: KodaColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: KodaColors.koda, width: 1.5),
      ),
      hintStyle: TextStyle(color: KodaColors.text3),
    ),
  );
}
