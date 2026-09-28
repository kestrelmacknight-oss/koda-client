// lib/features/settings/content_filters_screen.dart
//
// Personal content-filter preferences for standard accounts --
// BlueSky-style: per label (adult / suggestive / graphic / non-sexual
// nudity), Hide / Warn / Show, entirely the user's own choice about
// their own view. Persisted under settings['content_filters'] via the
// existing user-settings endpoint (see voice_video_settings_screen.dart
// for the same load-merge-save pattern this follows).
//
// This is NOT the access-control boundary for child accounts -- those
// are hard-blocked server-side regardless of any preference here (see
// koda-server's Koda.Servers.member_can_view_channel?/2). This screen
// is only reachable for standard accounts in the first place (see
// settings_screen.dart).

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';

const kContentLabels = ['adult', 'suggestive', 'graphic', 'nudity'];

/// Public so channel_edit_dialog.dart (setting labels on a channel) can
/// show the same display names as this preferences screen.
const kContentLabelNames = {
  'adult':      'Adult content',
  'suggestive': 'Suggestive',
  'graphic':    'Graphic media',
  'nudity':     'Non-sexual nudity',
};
// kContentLabelNames above stays as a plain (unlocalized) const -- it's
// also imported by channel_edit_dialog.dart and home_screen.dart, which
// don't have a BuildContext handy at their call sites. This screen's own
// UI uses these localized equivalents instead, which do need one.
Map<String, String> _labelNames(AppLocalizations t) => {
  'adult':      t.contentFiltersLabelAdult,
  'suggestive': t.contentFiltersLabelSuggestive,
  'graphic':    t.contentFiltersLabelGraphic,
  'nudity':     t.contentFiltersLabelNudity,
};
Map<String, String> _labelDescriptions(AppLocalizations t) => {
  'adult':      t.contentFiltersDescAdult,
  'suggestive': t.contentFiltersDescSuggestive,
  'graphic':    t.contentFiltersDescGraphic,
  'nudity':     t.contentFiltersDescNudity,
};

/// Most restrictive first -- used elsewhere (channel rendering) to pick
/// one effective setting when a channel carries multiple labels.
const kFilterSettingOrder = ['hide', 'warn', 'show'];

String effectiveFilterSetting(List<String> labels, Map<String, dynamic> prefs) {
  if (labels.isEmpty) return 'show';
  final settings = labels.map((l) => prefs[l] as String? ?? 'warn');
  for (final s in kFilterSettingOrder) {
    if (settings.contains(s)) return s;
  }
  return 'warn';
}

class ContentFiltersScreen extends StatefulWidget {
  const ContentFiltersScreen({super.key});
  @override
  State<ContentFiltersScreen> createState() => _ContentFiltersScreenState();
}

class _ContentFiltersScreenState extends State<ContentFiltersScreen> {
  Map<String, dynamic> _fullSettings = {};
  Map<String, dynamic> _filters = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final settings = await KodaApi.instance.getSettings();
    if (!mounted) return;
    setState(() {
      _fullSettings = settings;
      _filters = Map<String, dynamic>.from(settings['content_filters'] as Map? ?? {});
      _loading = false;
    });
  }

  Future<void> _setFilter(String label, String value) async {
    setState(() => _filters = {..._filters, label: value});
    _fullSettings = {..._fullSettings, 'content_filters': _filters};
    await KodaApi.instance.putSettings(_fullSettings);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        // Exact match with the Settings nav entry's own title.
        title: Text(t.settingsContentFiltersTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 16, fontWeight: FontWeight.w700)),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  t.contentFiltersDescription,
                  style: TextStyle(color: KodaColors.text3, fontSize: 12, height: 1.5),
                ),
                const SizedBox(height: 20),
                ...kContentLabels.map((label) => _buildLabelRow(t, label)),
              ],
            ),
    );
  }

  Widget _buildLabelRow(AppLocalizations t, String label) {
    final current = _filters[label] as String? ?? 'warn';
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(_labelNames(t)[label] ?? label,
            style: TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 2),
        Text(_labelDescriptions(t)[label] ?? '',
            style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        const SizedBox(height: 10),
        SegmentedButton<String>(
          segments: [
            ButtonSegment(value: 'hide', label: Text(t.contentFiltersHide)),
            ButtonSegment(value: 'warn', label: Text(t.contentFiltersWarn)),
            ButtonSegment(value: 'show', label: Text(t.contentFiltersShow)),
          ],
          selected: {current},
          onSelectionChanged: (s) => _setFilter(label, s.first),
          style: SegmentedButton.styleFrom(
            backgroundColor: KodaColors.elevated,
            foregroundColor: KodaColors.text3,
            selectedBackgroundColor: KodaColors.koda,
            selectedForegroundColor: Colors.black,
          ),
        ),
      ]),
    );
  }
}
