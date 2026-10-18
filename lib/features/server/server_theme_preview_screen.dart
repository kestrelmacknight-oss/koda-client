// lib/features/server/server_theme_preview_screen.dart
//
// A self-contained mock of what applying a theme would look like --
// a rail-icon swatch with the theme's border color, a sample channel
// header with its background -- rather than live-patching the real
// app's state (the rail's own server list and the selected-server
// provider are two separate state trees that would both need careful
// temporary overriding and restoring for a real live reskin). Nothing
// here touches real app state until "Apply" is actually pressed.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';

class ServerThemePreviewScreen extends StatefulWidget {
  final String serverId;
  final Map<String, dynamic> theme;
  const ServerThemePreviewScreen({super.key, required this.serverId, required this.theme});

  @override
  State<ServerThemePreviewScreen> createState() => _ServerThemePreviewScreenState();
}

class _ServerThemePreviewScreenState extends State<ServerThemePreviewScreen> {
  bool _applying = false;

  Future<void> _apply() async {
    final t = AppLocalizations.of(context);
    setState(() => _applying = true);
    final updated = await KodaApi.instance.applyServerTheme(
        widget.serverId, widget.theme['id'] as String);
    if (!mounted) return;
    setState(() => _applying = false);
    if (updated != null) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.serverThemeApplyError)));
    }
  }

  Color _parseColor(String hex) {
    final clean = hex.replaceAll('#', '');
    return Color(int.parse('FF$clean', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final cosmetics = Map<String, dynamic>.from(widget.theme['cosmetics'] ?? {});
    final backgroundUrl = cosmetics['background_url'] as String?;
    final borderColor = cosmetics['icon_border_color'] as String?;
    final name = widget.theme['name'] as String? ?? '';

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.serverThemePreviewTitle(name),
            style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          color: KodaColors.elevated,
          child: Text(t.serverThemePreviewNote,
              textAlign: TextAlign.center,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Mock rail icon.
              Center(
                child: Container(
                  width: 64, height: 64,
                  decoration: BoxDecoration(
                    color: KodaColors.card,
                    borderRadius: BorderRadius.circular(18),
                    border: borderColor != null
                        ? Border.all(color: _parseColor(borderColor), width: 3)
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: const KodaAvatar(username: 'Your Server', size: 56),
                ),
              ),
              const SizedBox(height: 24),
              // Mock channel header + background.
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: KodaColors.card,
                    image: backgroundUrl != null
                        ? DecorationImage(
                            image: NetworkImage(backgroundUrl),
                            fit: BoxFit.cover,
                            onError: (_, __) {},
                          )
                        : null,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter, end: Alignment.topCenter,
                        colors: [Colors.black.withValues(alpha: 0.55), Colors.transparent],
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    child: const Text('# general',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(widget.theme['description'] as String? ?? '',
                  style: TextStyle(color: KodaColors.text3, fontSize: 12), textAlign: TextAlign.center),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            Expanded(
              child: OutlinedButton(
                onPressed: _applying ? null : () => Navigator.pop(context, false),
                child: Text(t.commonCancel),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: KodaPrimaryButton(
                label: t.serverThemeApplyButton,
                busy: _applying,
                onPressed: _applying ? null : _apply,
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
