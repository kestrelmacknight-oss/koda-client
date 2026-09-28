// lib/features/marketplace/koda_marketplace_screen.dart
//
// Platform-wide Koda Marketplace -- reachable from the server rail
// (home_screen.dart, next to "Create or Join"), not scoped to any
// particular server. Three tabs: the account-wide Spark/Pulse
// subscription (moved here from marketplace_screen.dart, which is now
// server-scoped only), buying a boost token directly (separate from
// the one Pulse subscribers already get minted per renewal -- both
// paths feed the same Koda.Boosts token/redemption system), and
// browsing servers that opted into being discoverable here.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/api.dart';
import '../../core/checkout.dart';
import '../../core/theme.dart';
import '../../core/time_utils.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/tier_badge.dart';
import '../../shared/widgets.dart';

class KodaMarketplaceScreen extends ConsumerStatefulWidget {
  const KodaMarketplaceScreen({super.key});
  @override
  ConsumerState<KodaMarketplaceScreen> createState() => _KodaMarketplaceScreenState();
}

class _KodaMarketplaceScreenState extends ConsumerState<KodaMarketplaceScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  Map<String, dynamic>? _subscriptionInfo;
  List<Map<String, dynamic>> _boostTokens = [];
  bool _loadingSub = true;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 3, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final sub = await KodaApi.instance.getSubscriptionInfo();
    final tokens = await KodaApi.instance.getMyBoostTokens();
    if (!mounted) return;
    setState(() {
      _subscriptionInfo = sub;
      _boostTokens = tokens;
      _loadingSub = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.kodaMarketplaceTitle,
            style: TextStyle(color: KodaColors.text1,
                fontSize: 16, fontWeight: FontWeight.w700)),
        bottom: TabBar(
          controller: _tabs,
          indicatorColor: KodaColors.koda,
          labelColor: KodaColors.text1,
          unselectedLabelColor: KodaColors.text3,
          tabs: [
            Tab(text: t.kodaMarketplaceTabSubscriptions),
            Tab(text: t.kodaMarketplaceTabBoosts),
            Tab(text: t.kodaMarketplaceTabDiscover),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: [
          _buildSubscriptionsTab(),
          _BoostsTab(tokenCount: _boostTokens.length, onPurchased: _loadData),
          const _DiscoverTab(),
        ],
      ),
    );
  }

  // ── Subscriptions tab ─────────────────────────────────────────────────────

  Widget _buildSubscriptionsTab() {
    final t = AppLocalizations.of(context);
    if (_loadingSub) {
      return Center(
          child: CircularProgressIndicator(color: KodaColors.koda));
    }

    final tier = _subscriptionInfo?['tier'] as String? ?? 'free';
    final sub = _subscriptionInfo?['subscription'] as Map<String, dynamic>?;
    final sparkPrice = _subscriptionInfo?['prices']?['spark'] as int? ?? 500;
    final pulsePrice = _subscriptionInfo?['prices']?['pulse'] as int? ?? 1000;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Current status
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: KodaColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: KodaColors.border),
          ),
          child: Row(children: [
            tier == 'free'
                ? Icon(Icons.person_outline, color: KodaColors.text3, size: 28)
                : TierBadge(tier: tier, size: 32),
            const SizedBox(width: 12),
            Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                tier == 'free' ? t.kodaMarketplaceTierFreeName :
                tier == 'spark' ? t.kodaMarketplaceTierSparkName : t.kodaMarketplaceTierPulseName,
                style: TextStyle(color: KodaColors.text1,
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              if (sub != null)
                Text(t.kodaMarketplaceExpiresOn(_formatDate(sub['expires_at'])),
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
              if (tier == 'free')
                Text(t.kodaMarketplaceUpgradeForPerks,
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
            ])),
          ]),
        ),

        if (tier == 'pulse' || _boostTokens.isNotEmpty) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: KodaColors.card,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: KodaColors.border),
            ),
            child: Row(children: [
              Icon(Icons.rocket_launch_outlined, color: KodaColors.koda, size: 24),
              const SizedBox(width: 12),
              Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(t.kodaMarketplaceBoostTokensAvailable(_boostTokens.length),
                    style: TextStyle(color: KodaColors.text1,
                        fontSize: 14, fontWeight: FontWeight.w600)),
                Text(t.kodaMarketplaceGiftTokenHint,
                    style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              ])),
            ]),
          ),
        ],
        const SizedBox(height: 20),

        // Spark tier
        _buildTierCard(
          tier: 'spark',
          name: t.kodaMarketplaceTierSparkName,
          price: sparkPrice,
          color: const Color(0xFFFF6B35),
          current: tier == 'spark',
          perks: [
            t.kodaMarketplaceSparkPerkAvatarFrame,
            t.kodaMarketplaceSparkPerkBadge,
            t.kodaMarketplaceSparkPerkFileLimit,
            t.kodaMarketplaceSparkPerkVoiceQuality,
          ],
        ),
        const SizedBox(height: 12),

        // Pulse tier
        _buildTierCard(
          tier: 'pulse',
          name: t.kodaMarketplaceTierPulseName,
          price: pulsePrice,
          color: KodaColors.koda,
          current: tier == 'pulse',
          perks: [
            t.kodaMarketplacePulsePerkEverythingInSpark,
            t.kodaMarketplacePulsePerkAnimatedFrame,
            t.kodaMarketplacePulsePerkBadge,
            t.kodaMarketplacePulsePerkFileLimit,
            t.kodaMarketplacePulsePerkBoostToken,
          ],
        ),
      ],
    );
  }

  Widget _buildTierCard({
    required String tier,
    required String name,
    required int price,
    required Color color,
    required bool current,
    required List<String> perks,
  }) {
    final t = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: current ? color : KodaColors.border,
            width: current ? 2 : 1),
      ),
      child: Column(children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
          ),
          child: Row(children: [
            TierBadge(tier: tier, size: 24),
            const SizedBox(width: 10),
            Text(name, style: TextStyle(color: color,
                fontSize: 18, fontWeight: FontWeight.w700)),
            const Spacer(),
            Text(t.kodaMarketplacePricePerMonth('\$${(price / 100).toStringAsFixed(2)}'),
                style: TextStyle(color: KodaColors.text1,
                    fontSize: 16, fontWeight: FontWeight.w600)),
          ]),
        ),

        // Perks
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            ...perks.map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(children: [
                Icon(Icons.check_circle_outline, size: 14, color: color),
                const SizedBox(width: 8),
                Text(p, style: TextStyle(
                    color: KodaColors.text2, fontSize: 13)),
              ]),
            )),
            const SizedBox(height: 12),
            if (current)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(t.kodaMarketplaceCurrentPlanLabel,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: color, fontWeight: FontWeight.w600)),
              )
            else
              Row(children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => _showSubscribeDialog(tier, price, false),
                    child: Text(t.kodaMarketplaceGetTierButton(name)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: color,
                      side: BorderSide(color: color),
                    ),
                    onPressed: () => _showSubscribeDialog(tier, price, true),
                    child: Text(t.kodaMarketplaceGiftTierButton(name)),
                  ),
                ),
              ]),
          ]),
        ),
      ]),
    );
  }

  Future<void> _showSubscribeDialog(String tier, int price, bool isGift) async {
    // Captured up front -- used across several `await`s below, some of
    // which happen after this dialog (and possibly this whole screen) may
    // no longer be mounted.
    final t = AppLocalizations.of(context);
    final recipientCtrl = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(isGift ? t.kodaMarketplaceGiftTierTitle(tier.toUpperCase()) : t.kodaMarketplaceSubscribeTierTitle(tier.toUpperCase()),
            style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          if (isGift) ...[
            Text(t.kodaMarketplaceGiftUsernameLabel, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
            const SizedBox(height: 4),
            KodaTextField(controller: recipientCtrl, hintText: t.kodaMarketplaceUsernameHint, autofocus: true),
            const SizedBox(height: 10),
          ],
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: KodaColors.elevated,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(t.kodaMarketplaceSubscriptionRowLabel, style: TextStyle(color: KodaColors.text2)),
                Text('\$${(price / 100).toStringAsFixed(2)}',
                    style: TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w600)),
              ]),
              Divider(color: KodaColors.border),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(t.kodaMarketplaceTotalLabel, style: TextStyle(
                    color: KodaColors.text1, fontWeight: FontWeight.w600)),
                Text('\$${(price / 100).toStringAsFixed(2)}',
                    style: TextStyle(
                        color: KodaColors.koda, fontWeight: FontWeight.w700)),
              ]),
            ]),
          ),
          const SizedBox(height: 8),
          Text(t.kodaMarketplacePaymentSecureNote,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false),
              child: Text(t.commonCancel)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda,
                foregroundColor: Colors.black),
            onPressed: () => Navigator.pop(context, true),
            child: Text(t.kodaMarketplaceProceedToPaymentButton),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    String? giftedTo;
    if (isGift && recipientCtrl.text.trim().isNotEmpty) {
      final user = await KodaApi.instance.getUserByUsername(recipientCtrl.text.trim());
      giftedTo = user?['id'] as String?;
      if (giftedTo == null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(t.kodaMarketplaceUserNotFound)));
        return;
      }
    }

    // No server_id -- this is the account-wide Koda subscription, not
    // tied to whatever server happened to be selected before opening
    // this screen (unlike the old embedded-in-marketplace_screen.dart
    // version, this screen is reached from the server rail, not from
    // inside any particular server's own view).
    final result = await KodaApi.instance.createSubscription(
      tier,
      giftedToUserId: giftedTo,
    );

    final checkoutUrl = result?['checkout_url'] as String?;
    if (checkoutUrl == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(t.kodaMarketplaceCouldNotStartCheckout)));
      }
      return;
    }

    if (!mounted) return;
    final messenger = ScaffoldMessenger.of(context);
    final paymentConfirmed = await launchCheckoutAndWait(context, ref,
        checkoutUrl: checkoutUrl,
        // No subscription id exists yet at this point -- it's only
        // created once the webhook confirms -- so this matches loosely
        // on payment_type rather than a specific record.
        matches: (data) => data['payment_type'] == 'subscription');
    if (mounted) {
      messenger.showSnackBar(SnackBar(content: Text(paymentConfirmed
          ? t.kodaMarketplaceSubscriptionActive
          : t.kodaMarketplaceSubscriptionPending)));
      _loadData();
    }
  }

  String _formatDate(dynamic raw) {
    if (raw == null) return '';
    try {
      final dt = parseServerTimestamp(raw.toString());
      return '${dt.month}/${dt.day}/${dt.year}';
    } catch (_) { return ''; }
  }
}

// ── Boosts tab ───────────────────────────────────────────────────────────

class _BoostsTab extends ConsumerStatefulWidget {
  final int tokenCount;
  final VoidCallback onPurchased;
  const _BoostsTab({required this.tokenCount, required this.onPurchased});
  @override
  ConsumerState<_BoostsTab> createState() => _BoostsTabState();
}

class _BoostsTabState extends ConsumerState<_BoostsTab> {
  bool _purchasing = false;

  Future<void> _purchase() async {
    // Captured before the `await`s below, in case this widget is no longer
    // mounted by the time the request comes back.
    final t = AppLocalizations.of(context);
    setState(() => _purchasing = true);
    final checkoutUrl = await KodaApi.instance.purchaseBoost();
    if (!mounted) return;
    setState(() => _purchasing = false);
    if (checkoutUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(t.kodaMarketplaceCouldNotStartCheckout)));
      return;
    }
    final messenger = ScaffoldMessenger.of(context);
    final confirmed = await launchCheckoutAndWait(context, ref,
        checkoutUrl: checkoutUrl,
        matches: (data) => data['payment_type'] == 'boost_purchase');
    if (!mounted) return;
    messenger.showSnackBar(SnackBar(content: Text(confirmed
        ? t.kodaMarketplaceBoostPurchased
        : t.kodaMarketplaceBoostPending)));
    if (confirmed) widget.onPurchased();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: KodaColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: KodaColors.border),
          ),
          child: Row(children: [
            Icon(Icons.rocket_launch_outlined, color: KodaColors.koda, size: 28),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(t.kodaMarketplaceTokenCountAvailable(widget.tokenCount),
                  style: TextStyle(color: KodaColors.text1,
                      fontSize: 18, fontWeight: FontWeight.w700)),
              Text(t.kodaMarketplaceGiftTokenHint,
                  style: TextStyle(color: KodaColors.text3, fontSize: 12)),
            ])),
          ]),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: KodaColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: KodaColors.koda),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(t.kodaMarketplaceBuyABoostTitle, style: TextStyle(color: KodaColors.text1,
                fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Text(t.kodaMarketplaceBoostPurchaseExplanation,
                style: TextStyle(color: KodaColors.text3, fontSize: 12)),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 44),
              ),
              onPressed: _purchasing ? null : _purchase,
              child: _purchasing
                  ? const SizedBox(width: 16, height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                  : Text(t.kodaMarketplaceBuyABoostButton('\$9.99')),
            ),
          ]),
        ),
      ],
    );
  }
}

// ── Discover tab ─────────────────────────────────────────────────────────

class _DiscoverTab extends StatefulWidget {
  const _DiscoverTab();
  @override
  State<_DiscoverTab> createState() => _DiscoverTabState();
}

class _DiscoverTabState extends State<_DiscoverTab> {
  List<Map<String, dynamic>> _featured = [];
  List<Map<String, dynamic>> _all = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final results = await Future.wait([
      KodaApi.instance.getMarketplaceServers(featuredOnly: true),
      KodaApi.instance.getMarketplaceServers(),
    ]);
    if (!mounted) return;
    setState(() {
      _featured = results[0];
      _all = results[1];
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    if (_loading) {
      return Center(child: CircularProgressIndicator(color: KodaColors.koda));
    }
    if (_all.isEmpty) {
      return Center(child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          t.kodaMarketplaceDiscoverEmptyState,
          textAlign: TextAlign.center,
          style: TextStyle(color: KodaColors.text3),
        ),
      ));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (_featured.isNotEmpty) ...[
          Text(t.kodaMarketplaceFeaturedThisWeekHeader, style: TextStyle(color: KodaColors.text3,
              fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
          const SizedBox(height: 8),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _featured.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, i) => _MarketplaceServerCard(server: _featured[i], width: 180),
            ),
          ),
          const SizedBox(height: 20),
        ],
        Text(t.kodaMarketplaceAllListedServersHeader, style: TextStyle(color: KodaColors.text3,
            fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
        const SizedBox(height: 8),
        ..._all.map((s) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _MarketplaceServerCard(server: s, width: double.infinity),
            )),
      ],
    );
  }
}

class _MarketplaceServerCard extends StatelessWidget {
  final Map<String, dynamic> server;
  final double width;
  const _MarketplaceServerCard({required this.server, required this.width});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final iconUrl = server['icon_url'] as String?;
    final name = server['name'] as String? ?? t.kodaMarketplaceServerFallback;
    final description = server['description'] as String?;
    final memberCount = server['member_count'] as int? ?? 0;
    final link = server['marketplace_link'] as String?;

    return Container(
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 36, height: 36,
              child: iconUrl != null
                  ? Image.network(iconUrl, fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => ColoredBox(color: KodaColors.elevated))
                  : ColoredBox(color: KodaColors.elevated,
                      child: Icon(Icons.groups_outlined, color: KodaColors.text3, size: 18)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis,
                style: TextStyle(color: KodaColors.text1, fontSize: 13, fontWeight: FontWeight.w600)),
          ),
        ]),
        const SizedBox(height: 8),
        if (description != null && description.isNotEmpty)
          Expanded(
            child: Text(description, maxLines: 3, overflow: TextOverflow.ellipsis,
                style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          ),
        const SizedBox(height: 6),
        Row(children: [
          Icon(Icons.people_outline, size: 12, color: KodaColors.text3),
          const SizedBox(width: 4),
          Text(t.kodaMarketplaceMemberCount(memberCount), style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          const Spacer(),
          if (link != null && link.isNotEmpty)
            GestureDetector(
              onTap: () async {
                final uri = Uri.tryParse(link);
                if (uri != null && await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              child: Icon(Icons.open_in_new, size: 14, color: KodaColors.koda),
            ),
        ]),
      ]),
    );
  }
}
