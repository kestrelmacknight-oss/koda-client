// lib/features/wiki/wiki_screen.dart
//
// In-app Help/Wiki viewer -- read-only, public data (see
// WikiController.public_index/2 server-side), same corpus that's also
// exported to koda.fyi's public docs (koda.export_wiki_html.ex) and used
// to ground Visp's answers. This is simply the first place a signed-in
// user can read it without leaving the app.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import 'wiki_article_screen.dart';

// Canonical display order -- matches koda-server's Koda.Wiki.categories/0
// and koda.export_wiki_html.ex's @category_labels (not shared code since
// this is a different repo/language; keep in sync by hand if either
// changes). A category with zero articles is simply never rendered,
// rather than guarded against explicitly.
const _categoryOrder = [
  'getting-started', 'messaging', 'voice-video', 'server-management',
  'moderation', 'marketplace', 'events', 'parental-controls',
  'integrations', 'visp',
];

String _categoryLabel(String slug) => slug
    .split('-')
    .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
    .join(' ');

class WikiScreen extends StatefulWidget {
  const WikiScreen({super.key});
  @override
  State<WikiScreen> createState() => _WikiScreenState();
}

class _WikiScreenState extends State<WikiScreen> {
  List<Map<String, dynamic>> _articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final articles = await KodaApi.instance.getWikiArticles();
    if (!mounted) return;
    setState(() { _articles = articles; _loading = false; });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final byCategory = <String, List<Map<String, dynamic>>>{};
    for (final a in _articles) {
      (byCategory[a['category'] as String? ?? ''] ??= []).add(a);
    }
    final categories = _categoryOrder.where((c) => byCategory.containsKey(c)).toList();

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.wikiScreenTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _articles.isEmpty
              ? Center(child: Text(t.wikiScreenEmptyState,
                  style: TextStyle(color: KodaColors.text3, fontSize: 13)))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: categories.length,
                  itemBuilder: (_, i) {
                    final category = categories[i];
                    final articles = byCategory[category]!;
                    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                        child: Text(_categoryLabel(category),
                            style: TextStyle(color: KodaColors.koda, fontSize: 12,
                                fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                      ),
                      for (final article in articles)
                        ListTile(
                          dense: true,
                          title: Text(article['title'] as String? ?? '',
                              style: TextStyle(color: KodaColors.text1, fontSize: 14)),
                          trailing: Icon(Icons.chevron_right, color: KodaColors.text3, size: 18),
                          onTap: () => Navigator.push(context, MaterialPageRoute(
                              builder: (_) => WikiArticleScreen(article: article))),
                        ),
                    ]);
                  },
                ),
    );
  }
}
