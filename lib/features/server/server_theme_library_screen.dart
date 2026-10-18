// lib/features/server/server_theme_library_screen.dart
//
// Curated catalog of cosmetics presets ("Server Templates" in the UI;
// Koda.ServerThemes/ServerTheme server-side -- see that module's doc
// for why it isn't literally named "template" in code, which already
// means something else here). Boost-gated same as the hand-picked
// background/icon-border controls in server_settings_screen.dart's
// Customize tab, which is where this screen is reached from.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import 'server_theme_preview_screen.dart';

class ServerThemeLibraryScreen extends StatefulWidget {
  final String serverId;
  const ServerThemeLibraryScreen({super.key, required this.serverId});

  @override
  State<ServerThemeLibraryScreen> createState() => _ServerThemeLibraryScreenState();
}

class _ServerThemeLibraryScreenState extends State<ServerThemeLibraryScreen> {
  bool _loading = true;
  List<Map<String, dynamic>> _themes = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final themes = await KodaApi.instance.getServerThemes(widget.serverId);
    if (!mounted) return;
    setState(() { _themes = themes; _loading = false; });
  }

  Future<void> _open(Map<String, dynamic> theme) async {
    final applied = await Navigator.push<bool>(context, MaterialPageRoute(
        builder: (_) => ServerThemePreviewScreen(serverId: widget.serverId, theme: theme)));
    if (applied == true && mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.serverThemeLibraryTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _themes.isEmpty
              ? Center(child: Text(t.serverThemeLibraryEmptyState,
                  style: TextStyle(color: KodaColors.text3, fontSize: 13)))
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: _themes.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) => _buildThemeCard(t, _themes[i]),
                ),
    );
  }

  Widget _buildThemeCard(AppLocalizations t, Map<String, dynamic> theme) {
    final unlocked = theme['unlocked'] == true;
    final cosmetics = Map<String, dynamic>.from(theme['cosmetics'] ?? {});
    final backgroundUrl = cosmetics['background_url'] as String?;
    final borderColor = cosmetics['icon_border_color'] as String?;
    final level = theme['required_boost_level'] as int? ?? 4;

    return Opacity(
      opacity: unlocked ? 1.0 : 0.55,
      child: Container(
        decoration: BoxDecoration(
          color: KodaColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: KodaColors.border),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 48, height: 48,
              color: KodaColors.elevated,
              child: Stack(alignment: Alignment.center, children: [
                if (backgroundUrl != null)
                  Image.network(backgroundUrl, width: 48, height: 48, fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const SizedBox.shrink()),
                if (borderColor != null)
                  Container(
                    width: 48, height: 48,
                    decoration: BoxDecoration(
                        border: Border.all(color: _parseColor(borderColor), width: 3)),
                  ),
              ]),
            ),
          ),
          title: Text(theme['name'] as String? ?? '',
              style: TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w600)),
          subtitle: Text(
              unlocked
                  ? (theme['description'] as String? ?? '')
                  : t.serverThemeLockedHint(level),
              style: TextStyle(color: KodaColors.text3, fontSize: 11,
                  fontStyle: unlocked ? FontStyle.normal : FontStyle.italic)),
          trailing: unlocked
              ? Icon(Icons.chevron_right, color: KodaColors.text3)
              : Icon(Icons.lock_outline, size: 16, color: KodaColors.text3),
          onTap: unlocked ? () => _open(theme) : null,
        ),
      ),
    );
  }

  Color _parseColor(String hex) {
    final clean = hex.replaceAll('#', '');
    return Color(int.parse('FF$clean', radix: 16));
  }
}
