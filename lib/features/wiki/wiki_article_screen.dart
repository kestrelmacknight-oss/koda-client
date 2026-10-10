// lib/features/wiki/wiki_article_screen.dart
//
// A single wiki article's content -- split on blank lines into
// paragraphs, same convention koda.export_wiki_html.ex's render_article/1
// uses for the koda.fyi export, so the two surfaces read identically.
// No markdown rendering on either side (see that exporter's own
// plain-text-only comment) -- wiki prose is written plain on purpose.

import 'package:flutter/material.dart';
import '../../core/theme.dart';

class WikiArticleScreen extends StatelessWidget {
  final Map<String, dynamic> article;
  const WikiArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final title = article['title'] as String? ?? '';
    final content = article['content'] as String? ?? '';
    final paragraphs = content.split(RegExp(r'\n\s*\n')).where((p) => p.trim().isNotEmpty);

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(title, style: TextStyle(color: KodaColors.text1, fontSize: 16),
            overflow: TextOverflow.ellipsis),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          for (final p in paragraphs)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Text(p.trim().replaceAll(RegExp(r'\s+'), ' '),
                  style: TextStyle(color: KodaColors.text2, fontSize: 14, height: 1.5)),
            ),
        ]),
      ),
    );
  }
}
