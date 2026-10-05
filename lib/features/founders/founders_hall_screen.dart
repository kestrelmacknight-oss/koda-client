// lib/features/founders/founders_hall_screen.dart
//
// Public list of backers with the "Founders Hall" reward (see
// koda-server's Koda.Invites.apply_rewards/3 and list_founders_hall/0) --
// no auth needed to view, same as server discovery. Reachable from
// Settings and the Koda Marketplace screen's footer.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';

class FoundersHallScreen extends StatefulWidget {
  const FoundersHallScreen({super.key});
  @override
  State<FoundersHallScreen> createState() => _FoundersHallScreenState();
}

class _FoundersHallScreenState extends State<FoundersHallScreen> {
  List<Map<String, dynamic>> _founders = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final founders = await KodaApi.instance.getFoundersHall();
    if (!mounted) return;
    setState(() { _founders = founders; _loading = false; });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.foundersHallTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _founders.isEmpty
              ? Center(child: Text(t.foundersHallEmptyState,
                  style: TextStyle(color: KodaColors.text3, fontSize: 13)))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(t.foundersHallSubtitle,
                        style: TextStyle(color: KodaColors.text3, fontSize: 13)),
                    const SizedBox(height: 16),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 120,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: _founders.length,
                        itemBuilder: (_, i) {
                          final f = _founders[i];
                          final name = f['display_name'] as String? ??
                              f['username'] as String? ?? '?';
                          return Column(children: [
                            KodaAvatar(username: name, size: 64,
                                avatarUrl: f['avatar_url'] as String?),
                            const SizedBox(height: 6),
                            Text(name,
                                style: TextStyle(color: KodaColors.text1, fontSize: 12,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ]);
                        },
                      ),
                    ),
                  ]),
                ),
    );
  }
}
