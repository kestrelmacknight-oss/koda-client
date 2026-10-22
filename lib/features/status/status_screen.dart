// lib/features/status/status_screen.dart
//
// Admin-facing view of Koda.Status -- current health plus a manually-
// posted incident log (not automatic detection, same "manual entry
// over inferred automation" choice already made for custom
// leaderboards). The public-facing read view lives on koda.fyi's
// static site instead of here, fetching the same GET /status JSON --
// no reason to build a second full page in the Flutter app for
// something the public should see without installing Koda at all.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});
  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  bool _loading = true;
  bool? _databaseUp;
  List<Map<String, dynamic>> _incidents = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final status = await KodaApi.instance.getStatus();
    if (!mounted) return;
    setState(() {
      _loading = false;
      _databaseUp = status?['database_up'] as bool?;
      _incidents = List<Map<String, dynamic>>.from(status?['incidents'] ?? []);
    });
  }

  Future<void> _postIncident() async {
    final t = AppLocalizations.of(context);
    final titleCtrl = TextEditingController();
    final bodyCtrl = TextEditingController();
    final post = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.statusPostIncidentTitle, style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          KodaTextField(controller: titleCtrl, hintText: t.statusIncidentTitleHint, autofocus: true),
          const SizedBox(height: 8),
          KodaTextField(controller: bodyCtrl, hintText: t.statusIncidentBodyHint),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(t.commonSubmit)),
        ],
      ),
    );
    if (post != true || titleCtrl.text.trim().isEmpty) return;
    final ok = await KodaApi.instance.adminPostIncident(titleCtrl.text.trim(), bodyCtrl.text.trim());
    if (ok) await _load();
  }

  Future<void> _resolve(String id) async {
    final ok = await KodaApi.instance.adminResolveIncident(id);
    if (ok) await _load();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    if (_loading) {
      return Center(child: CircularProgressIndicator(color: KodaColors.koda));
    }
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          Icon(_databaseUp == true ? Icons.check_circle : Icons.error,
              color: _databaseUp == true ? KodaColors.mint : Colors.redAccent, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(
              _databaseUp == true ? t.statusAllSystemsNormal : t.statusDegraded,
              style: TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w600))),
          TextButton.icon(
            onPressed: _postIncident,
            icon: Icon(Icons.add, size: 16, color: KodaColors.koda),
            label: Text(t.statusPostIncidentTitle, style: TextStyle(color: KodaColors.koda)),
          ),
        ]),
      ),
      Divider(color: KodaColors.border, height: 1),
      Expanded(
        child: _incidents.isEmpty
            ? Center(child: Text(t.statusNoIncidents, style: TextStyle(color: KodaColors.text3)))
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: _incidents.length,
                itemBuilder: (_, i) {
                  final incident = _incidents[i];
                  final resolved = incident['resolved_at'] != null;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: KodaColors.card,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: KodaColors.border),
                    ),
                    child: Row(children: [
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(incident['title'] as String? ?? '',
                            style: TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w600)),
                        if ((incident['body'] as String? ?? '').isNotEmpty)
                          Text(incident['body'] as String,
                              style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                      ])),
                      if (resolved)
                        Text(t.statusResolvedLabel, style: TextStyle(color: KodaColors.mint, fontSize: 11))
                      else
                        TextButton(
                          onPressed: () => _resolve(incident['id'] as String),
                          child: Text(t.statusResolveButton, style: TextStyle(color: KodaColors.koda, fontSize: 12)),
                        ),
                    ]),
                  );
                },
              ),
      ),
    ]);
  }
}
