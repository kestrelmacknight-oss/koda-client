// lib/features/steam/steam_library_manage_screen.dart
//
// Lets the user review their own synced Steam library and mark
// individual games as hidden from comparison -- a Koda-side control
// independent of whatever Steam's own per-game privacy already filters
// out of the synced list (see koda-server's Koda.Steam.set_hidden/3).
// Reachable from the Steam card in Settings, so this works even before
// library sharing is ever turned on (curate first, share second).
//
// Name/icon/playtime come from owned_games (Koda.Steam.sync_library/1's
// include_appinfo: true data -- authoritative, works even for delisted/
// region-locked/age-gated games the account still genuinely owns).
// SteamAppNames.resolve is only a fallback for a game synced before this
// existed, until the next daily/manual sync backfills it.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/steam_app_names.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';

class SteamLibraryManageScreen extends StatefulWidget {
  const SteamLibraryManageScreen({super.key});

  @override
  State<SteamLibraryManageScreen> createState() => _SteamLibraryManageScreenState();
}

class _SteamLibraryManageScreenState extends State<SteamLibraryManageScreen> {
  bool _loading = true;
  bool _syncing = false;
  List<Map<String, dynamic>> _games = [];
  Set<int> _hiddenAppIds = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final status = await KodaApi.instance.getSteamStatus();
    if (!mounted) return;

    final ownedGames = List<Map<String, dynamic>>.from(status?['owned_games'] ?? []);
    final games = ownedGames.isNotEmpty
        ? ownedGames
        // Pre-migration fallback: a connection that hasn't re-synced
        // since owned_games shipped. The next daily sweeper (or a
        // manual Sync Now) replaces this with the real thing.
        : List<int>.from(status?['owned_app_ids'] ?? [])
            .map((id) => {'appid': id, 'name': null, 'icon_url': null, 'playtime_forever': 0})
            .toList();

    setState(() {
      _games = games;
      _hiddenAppIds = Set<int>.from(status?['hidden_app_ids'] ?? []);
      _loading = false;
    });

    for (final g in games) {
      if (g['name'] == null) _resolveName(g['appid'] as int);
    }
  }

  Future<void> _resolveName(int appId) async {
    final name = await SteamAppNames.resolve(appId);
    if (name == null || !mounted) return;
    setState(() {
      final idx = _games.indexWhere((g) => g['appid'] == appId);
      if (idx != -1) _games[idx] = {..._games[idx], 'name': name};
    });
  }

  Future<void> _sync() async {
    setState(() => _syncing = true);
    final ok = await KodaApi.instance.syncSteamLibraryNow();
    if (!mounted) return;
    final t = AppLocalizations.of(context);
    if (ok) await _load();
    setState(() => _syncing = false);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
        ok ? t.steamSyncSuccess : t.steamSyncError)));
  }

  Future<void> _toggleHidden(int appId, bool hidden) async {
    setState(() {
      if (hidden) { _hiddenAppIds.add(appId); } else { _hiddenAppIds.remove(appId); }
    });
    final ok = await KodaApi.instance.setSteamGameHidden(appId, hidden);
    if (!ok && mounted) {
      setState(() {
        if (hidden) { _hiddenAppIds.remove(appId); } else { _hiddenAppIds.add(appId); }
      });
    }
  }

  List<int> get _unplayedVisibleAppIds => _games
      .where((g) => (g['playtime_forever'] as int? ?? 0) == 0 && !_hiddenAppIds.contains(g['appid']))
      .map((g) => g['appid'] as int)
      .toList();

  Future<void> _hideAllUnplayed() async {
    final t = AppLocalizations.of(context);
    final targets = _unplayedVisibleAppIds;
    if (targets.isEmpty) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.steamHideUnplayedTitle, style: TextStyle(color: KodaColors.text1)),
        content: Text(t.steamHideUnplayedBody(targets.length), style: TextStyle(color: KodaColors.text3)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(t.steamHideUnplayedConfirm)),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _hiddenAppIds.addAll(targets));
    await Future.wait(targets.map((id) => KodaApi.instance.setSteamGameHidden(id, true)));
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final unplayedCount = _unplayedVisibleAppIds.length;

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.steamManageLibraryTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 16)),
        actions: [
          IconButton(
            icon: _syncing
                ? SizedBox(width: 16, height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                : const Icon(Icons.sync),
            tooltip: t.steamSyncNow,
            onPressed: _syncing ? null : _sync,
          ),
        ],
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _games.isEmpty
              ? Center(child: Text(t.steamManageLibraryEmptyState,
                  style: TextStyle(color: KodaColors.text3, fontSize: 13)))
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: _games.length + 1,
                  separatorBuilder: (_, __) => const SizedBox(height: 6),
                  itemBuilder: (_, i) {
                    if (i == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(t.steamManageLibraryDescription,
                              style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                          if (unplayedCount > 0) ...[
                            const SizedBox(height: 10),
                            OutlinedButton.icon(
                              onPressed: _hideAllUnplayed,
                              icon: Icon(Icons.visibility_off_outlined, size: 15, color: KodaColors.text2),
                              label: Text(t.steamHideUnplayedButton(unplayedCount),
                                  style: TextStyle(color: KodaColors.text2, fontSize: 12)),
                            ),
                          ],
                        ]),
                      );
                    }
                    return _buildGameRow(t, _games[i - 1]);
                  },
                ),
    );
  }

  Widget _buildGameRow(AppLocalizations t, Map<String, dynamic> game) {
    final appId = game['appid'] as int;
    final name = game['name'] as String?;
    final iconUrl = game['icon_url'] as String?;
    final playtime = game['playtime_forever'] as int? ?? 0;
    final hidden = _hiddenAppIds.contains(appId);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: hidden ? KodaColors.card.withValues(alpha: 0.5) : KodaColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: KodaColors.border),
      ),
      child: SwitchListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        secondary: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: iconUrl != null
              ? Image.network(iconUrl, width: 32, height: 32, fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _gameIconFallback())
              : _gameIconFallback(),
        ),
        title: Text(name ?? t.steamUnresolvedGameLabel(appId),
            style: TextStyle(
                color: hidden ? KodaColors.text3 : KodaColors.text1,
                fontSize: 13,
                fontStyle: name == null ? FontStyle.italic : FontStyle.normal)),
        subtitle: Row(children: [
          if (playtime == 0) ...[
            Icon(Icons.schedule, size: 11, color: KodaColors.text3),
            const SizedBox(width: 3),
            Text(t.steamNeverPlayedLabel, style: TextStyle(color: KodaColors.text3, fontSize: 11)),
            const SizedBox(width: 8),
          ],
          Text(hidden ? t.steamHiddenFromComparison : t.steamVisibleInComparison,
              style: TextStyle(
                  color: hidden ? KodaColors.gold : KodaColors.text3,
                  fontSize: 11, fontWeight: hidden ? FontWeight.w600 : FontWeight.w400)),
        ]),
        value: hidden,
        activeThumbColor: KodaColors.koda,
        onChanged: (v) => _toggleHidden(appId, v),
      ),
    );
  }

  Widget _gameIconFallback() => Container(
        width: 32, height: 32,
        color: KodaColors.elevated,
        child: Icon(Icons.videogame_asset_outlined, size: 18, color: KodaColors.text3),
      );
}
