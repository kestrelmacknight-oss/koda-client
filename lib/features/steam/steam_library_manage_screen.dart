// lib/features/steam/steam_library_manage_screen.dart
//
// Lets the user review their own synced Steam library and mark
// individual games as hidden from comparison -- a Koda-side control
// independent of whatever Steam's own per-game privacy already filters
// out of the synced list (see koda-server's Koda.Steam.set_hidden/3).
// Reachable from the Steam card in Settings, so this works even before
// library sharing is ever turned on (curate first, share second).

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
  List<int> _ownedAppIds = [];
  Set<int> _hiddenAppIds = {};
  final Map<int, String> _names = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final status = await KodaApi.instance.getSteamStatus();
    if (!mounted) return;
    setState(() {
      _ownedAppIds = List<int>.from(status?['owned_app_ids'] ?? []);
      _hiddenAppIds = Set<int>.from(status?['hidden_app_ids'] ?? []);
      _loading = false;
    });
    for (final appId in _ownedAppIds) {
      SteamAppNames.resolve(appId).then((name) {
        if (name != null && mounted) setState(() => _names[appId] = name);
      });
    }
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

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
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
          : _ownedAppIds.isEmpty
              ? Center(child: Text(t.steamManageLibraryEmptyState,
                  style: TextStyle(color: KodaColors.text3, fontSize: 13)))
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(t.steamManageLibraryDescription,
                        style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                    const SizedBox(height: 12),
                    for (final appId in _ownedAppIds)
                      SwitchListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(_names[appId] ?? 'App $appId',
                            style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                        subtitle: Text(t.steamHiddenFromComparison,
                            style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                        value: _hiddenAppIds.contains(appId),
                        activeColor: KodaColors.koda,
                        onChanged: (v) => _toggleHidden(appId, v),
                      ),
                  ],
                ),
    );
  }
}
