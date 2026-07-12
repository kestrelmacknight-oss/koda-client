// lib/core/theme.dart
//
// Koda's dark, violet/mint brand palette -- matches koda.fyi and the
// transactional email templates so the experience is consistent
// website -> email -> app.

import 'package:flutter/material.dart';

class KodaColors {
  KodaColors._();

  static const Color voidBg  = Color(0xFF09090F);
  static const Color bg2     = Color(0xFF0D0E1A);
  static const Color card    = Color(0xFF131524);
  static const Color elevated = Color(0xFF181A2E);
  static const Color border  = Color(0xFF1E2238);

  static const Color koda    = Color(0xFF7B68EE); // violet
  static const Color mint    = Color(0xFF5BEAD4);
  static const Color gold    = Color(0xFFFFCA28);
  static const Color accent  = Color(0xFFFF5370); // red/error

  static const Color text1 = Color(0xFFECEEF8);
  static const Color text2 = Color(0xFF9BA5C8);
  static const Color text3 = Color(0xFF575F80);
}

ThemeData kodaTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: KodaColors.voidBg,
    fontFamily: 'Segoe UI',
    colorScheme: ColorScheme.dark(
      primary:   KodaColors.koda,
      secondary: KodaColors.mint,
      error:     KodaColors.accent,
      surface:   KodaColors.card,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: KodaColors.text2),
      bodyLarge:  TextStyle(color: KodaColors.text1),
    ),
    dividerColor: KodaColors.border,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: KodaColors.card,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: KodaColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: KodaColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: KodaColors.koda, width: 1.5),
      ),
      hintStyle: const TextStyle(color: KodaColors.text3),
    ),
  );
}
