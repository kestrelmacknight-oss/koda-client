// lib/shared/custom_emoji.dart
//
// Rendering helpers for per-server custom emoji (see Koda.Emoji
// server-side) shared between message reactions and message-body
// :shortcode: rendering, so the plain-Unicode-vs-custom-image branch
// exists in exactly one place. Custom emoji are channel-message-only --
// DMs have no server context, so neither of these is used there.

import 'package:flutter/material.dart';
import '../core/theme.dart';

const kCustomEmojiPrefix = 'custom:';

/// Matches an *unterminated* shortcode ending at the given position --
/// e.g. the text immediately before a cursor while typing ":wave" (no
/// closing colon yet). Used by the composer's autocomplete row.
final RegExp kOpenShortcodePattern = RegExp(r':([a-zA-Z0-9_]{1,32})$');

/// Matches a *complete* :name: token anywhere in already-sent message
/// text. Used by renderMessageWithEmoji below.
final RegExp _completeShortcodePattern = RegExp(r':([a-zA-Z0-9_]{2,32}):');

/// Renders a single reaction value: a plain Unicode emoji string, or
/// "custom:<id>" resolved against [serverEmoji]. Falls back to the raw
/// text for a since-deleted/unknown custom emoji rather than showing
/// nothing.
class EmojiGlyph extends StatelessWidget {
  final String value;
  final List<Map<String, dynamic>> serverEmoji;
  final double size;

  const EmojiGlyph({
    super.key,
    required this.value,
    required this.serverEmoji,
    this.size = 18,
  });

  @override
  Widget build(BuildContext context) {
    if (!value.startsWith(kCustomEmojiPrefix)) {
      return Text(value, style: TextStyle(fontSize: size));
    }
    final id = value.substring(kCustomEmojiPrefix.length);
    final match = serverEmoji.firstWhere(
      (e) => e['id'] == id,
      orElse: () => const <String, dynamic>{},
    );
    final imageUrl = match['image_url'] as String?;
    if (imageUrl == null) {
      return Text(value, style: TextStyle(fontSize: size * 0.55, color: KodaColors.text3));
    }
    return Image.network(
      imageUrl,
      width: size,
      height: size,
      errorBuilder: (_, __, ___) => Icon(Icons.broken_image_outlined, size: size, color: KodaColors.text3),
    );
  }
}

/// Splits [text] on complete :name: tokens, replacing any that match a
/// known custom emoji in [serverEmoji] with a small inline image.
/// Unmatched tokens (a typo, or a since-renamed/deleted emoji) are left
/// as literal text -- same graceful-degradation choice as [EmojiGlyph].
List<InlineSpan> renderMessageWithEmoji(
  String text,
  List<Map<String, dynamic>> serverEmoji,
  TextStyle style,
) {
  if (serverEmoji.isEmpty || !text.contains(':')) {
    return [TextSpan(text: text, style: style)];
  }

  final byName = {for (final e in serverEmoji) e['name'] as String: e};
  final spans = <InlineSpan>[];
  var lastEnd = 0;

  for (final match in _completeShortcodePattern.allMatches(text)) {
    final emoji = byName[match.group(1)];
    if (emoji == null) continue;

    if (match.start > lastEnd) {
      spans.add(TextSpan(text: text.substring(lastEnd, match.start), style: style));
    }
    spans.add(WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Image.network(
          emoji['image_url'] as String,
          width: 18,
          height: 18,
          errorBuilder: (_, __, ___) => const SizedBox(width: 18, height: 18),
        ),
      ),
    ));
    lastEnd = match.end;
  }

  if (lastEnd < text.length) {
    spans.add(TextSpan(text: text.substring(lastEnd), style: style));
  }
  if (spans.isEmpty) spans.add(TextSpan(text: text, style: style));
  return spans;
}
