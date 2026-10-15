// lib/features/steam/steam_compare_screen.dart
//
// Plain list of shared Steam games between the viewer and one other
// user -- no Venn diagram, deliberately minimal for v1 (see the Steam
// integration plan). The server only returns appids
// (Koda.Steam.compare_libraries/2); name/icon per appid come from the
// VIEWER's own owned_games (Koda.Steam.sync_library/1) -- every shared
// appid is by definition something the viewer owns too, so their own
// synced metadata already has it. Falls back to Steam's public store
// API (SteamAppNames) only if that's somehow missing, e.g. not yet
// re-synced since owned_games shipped.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/steam_app_names.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';

class SteamCompareScreen extends StatefulWidget {
  final String userId;
  final String username;
  const SteamCompareScreen({super.key, required this.userId, required this.username});

  @override
  State<SteamCompareScreen> createState() => _SteamCompareScreenState();
}

class _SteamCompareScreenState extends State<SteamCompareScreen> {
  bool _loading = true;
  bool _error = false;
  List<int> _appIds = [];
  final Map<int, String> _names = {};
  final Map<int, String> _icons = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final results = await Future.wait([
      KodaApi.instance.compareSteamLibraries(widget.userId),
      KodaApi.instance.getSteamStatus(),
    ]);
    if (!mounted) return;
    final shared = results[0] as List<int>?;
    if (shared == null) {
      setState(() { _loading = false; _error = true; });
      return;
    }

    final status = results[1] as Map<String, dynamic>?;
    final ownedGames = List<Map<String, dynamic>>.from(status?['owned_games'] ?? []);
    for (final g in ownedGames) {
      final appId = g['appid'] as int;
      if (g['name'] != null) _names[appId] = g['name'] as String;
      if (g['icon_url'] != null) _icons[appId] = g['icon_url'] as String;
    }

    setState(() { _appIds = shared; _loading = false; });
    for (final appId in shared) {
      if (!_names.containsKey(appId)) _resolveName(appId);
    }
  }

  Future<void> _resolveName(int appId) async {
    final name = await SteamAppNames.resolve(appId);
    if (name != null && mounted) setState(() => _names[appId] = name);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.steamCompareScreenTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _error
              ? Center(child: Text(t.steamCompareError,
                  style: TextStyle(color: KodaColors.text3, fontSize: 13)))
              : _appIds.isEmpty
                  ? Center(child: Text(t.steamCompareEmptyState,
                      style: TextStyle(color: KodaColors.text3, fontSize: 13)))
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: _appIds.length + 1,
                      separatorBuilder: (_, __) => const SizedBox(height: 6),
                      itemBuilder: (_, i) {
                        if (i == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(t.steamCompareSharedCount(_appIds.length),
                                style: TextStyle(color: KodaColors.text1, fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                          );
                        }
                        final appId = _appIds[i - 1];
                        final icon = _icons[appId];
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                          decoration: BoxDecoration(
                            color: KodaColors.card,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: KodaColors.border),
                          ),
                          child: ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: icon != null
                                  ? Image.network(icon, width: 32, height: 32, fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => _iconFallback())
                                  : _iconFallback(),
                            ),
                            title: Text(_names[appId] ?? t.steamUnresolvedGameLabel(appId),
                                style: TextStyle(color: KodaColors.text1, fontSize: 13,
                                    fontStyle: _names[appId] == null ? FontStyle.italic : FontStyle.normal)),
                          ),
                        );
                      },
                    ),
    );
  }

  Widget _iconFallback() => Container(
        width: 32, height: 32,
        color: KodaColors.elevated,
        child: Icon(Icons.videogame_asset_outlined, size: 18, color: KodaColors.text3),
      );
}
