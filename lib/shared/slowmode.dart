// lib/shared/slowmode.dart
//
// Shared between channel_edit_dialog.dart (the moderator-facing picker)
// and home_screen.dart (the channel-header indicator everyone sees).
// Discord's own preset list, in seconds -- 0 is off. Duration values
// are formatted as plain numbers+units ("30s", "5m", "1h") rather than
// given individual translated strings: a formatted duration reads fine
// in every language this app ships, and localizing 14 near-identical
// values would be pure l10n overhead for zero actual clarity gain.

import '../l10n/generated/app_localizations.dart';

const List<int> kSlowmodePresets = [
  0, 5, 10, 15, 30, 60, 120, 300, 600, 900, 1800, 3600, 7200, 21600,
];

String formatSlowmode(int seconds, AppLocalizations t) {
  if (seconds <= 0) return t.channelEditDialogSlowmodeOff;
  if (seconds < 60) return '${seconds}s';
  if (seconds < 3600) return '${seconds ~/ 60}m';
  return '${seconds ~/ 3600}h';
}
