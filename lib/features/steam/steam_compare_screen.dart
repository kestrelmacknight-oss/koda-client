// lib/features/steam/steam_compare_screen.dart
//
// Plain list of shared Steam games between the viewer and one other
// user -- no Venn diagram, deliberately minimal for v1 (see the Steam
// integration plan). The server only returns appids
// (Koda.Steam.compare_libraries/2); name/icon per appid are resolved
// here directly from Steam's own public, unauthenticated store API,
// the same way a link preview fetches its own image from its source
// URL rather than Koda holding a games-metadata table.

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

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final shared = await KodaApi.instance.compareSteamLibraries(widget.userId);
    if (!mounted) return;
    if (shared == null) {
      setState(() { _loading = false; _error = true; });
      return;
    }
    setState(() { _appIds = shared; _loading = false; });
    for (final appId in shared) {
      _resolveName(appId);
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
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        Text(t.steamCompareSharedCount(_appIds.length),
                            style: TextStyle(color: KodaColors.text1, fontSize: 14,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 12),
                        for (final appId in _appIds)
                          ListTile(
                            dense: true,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                'https://cdn.akamai.steamstatic.com/steam/apps/$appId/capsule_sm_120.jpg',
                                width: 48, height: 24, fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const SizedBox(width: 48, height: 24),
                              ),
                            ),
                            title: Text(_names[appId] ?? 'App $appId',
                                style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                          ),
                      ],
                    ),
    );
  }
}
