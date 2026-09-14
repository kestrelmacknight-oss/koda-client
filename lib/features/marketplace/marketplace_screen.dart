// lib/features/marketplace/marketplace_screen.dart
//
// Marketplace hub: Creator setup, Spark/Pulse subscriptions,
// server bank balance, tip history.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/api.dart';
import '../../core/providers.dart';
import '../../core/theme.dart';
import '../../shared/tier_badge.dart';
import '../../shared/widgets.dart';
import 'digital_goods_screen.dart';

class MarketplaceScreen extends ConsumerStatefulWidget {
  /// When true, renders just the tab bar + tab content (no Scaffold/AppBar
  /// of its own) so it can sit inline inside another screen's layout --
  /// see home_screen.dart, where this is shown in the main content area
  /// as a server-scoped pseudo-channel rather than a pushed full-screen
  /// route. Pushed full-screen (the default), it's reached from Settings
  /// for account-level billing (Subscriptions/Creator), which isn't tied
  /// to any one server.
  final bool embedded;
  const MarketplaceScreen({super.key, this.embedded = false});
  @override
  ConsumerState<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends ConsumerState<MarketplaceScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  Map<String, dynamic>? _connectAccount;
  Map<String, dynamic>? _subscriptionInfo;
  List<Map<String, dynamic>> _boostTokens = [];
  bool _loadingConnect = true;
  bool _loadingSub = true;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 4, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final connect = await KodaApi.instance.getConnectAccount();
    final sub = await KodaApi.instance.getSubscriptionInfo();
    final tokens = await KodaApi.instance.getMyBoostTokens();
    if (!mounted) return;
    setState(() {
      _connectAccount = connect;
      _subscriptionInfo = sub;
      _boostTokens = tokens;
      _loadingConnect = false;
      _loadingSub = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabBar = TabBar(
      controller: _tabs,
      indicatorColor: KodaColors.koda,
      labelColor: KodaColors.text1,
      unselectedLabelColor: KodaColors.text3,
      tabs: const [
        Tab(text: 'Subscriptions'),
        Tab(text: 'Creator'),
        Tab(text: 'Server Bank'),
        Tab(text: 'Digital Goods'),
      ],
    );
    final tabViews = TabBarView(
      controller: _tabs,
      children: [
        _buildSubscriptionsTab(),
        _buildCreatorTab(),
        _buildServerBankTab(),
        _buildDigitalGoodsTab(),
      ],
    );

    if (widget.embedded) {
      // No Scaffold/AppBar of its own -- the host screen (home_screen.dart)
      // already supplies the surrounding chrome and a channel-style header.
      return Column(children: [
        Container(
          color: KodaColors.bg2,
          child: tabBar,
        ),
        Expanded(child: tabViews),
      ]);
    }

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: const Text('Marketplace',
            style: TextStyle(color: KodaColors.text1,
                fontSize: 16, fontWeight: FontWeight.w700)),
        bottom: tabBar,
      ),
      body: tabViews,
    );
  }

  // ── Subscriptions tab ─────────────────────────────────────────────────────

  Widget _buildSubscriptionsTab() {
    if (_loadingSub) return const Center(
        child: CircularProgressIndicator(color: KodaColors.koda));

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
                ? const Icon(Icons.person_outline, color: KodaColors.text3, size: 28)
                : TierBadge(tier: tier, size: 32),
            const SizedBox(width: 12),
            Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                tier == 'free' ? 'Free' :
                tier == 'spark' ? 'Spark' : 'Pulse',
                style: const TextStyle(color: KodaColors.text1,
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              if (sub != null)
                Text('Expires ${_formatDate(sub['expires_at'])}',
                    style: const TextStyle(color: KodaColors.text3, fontSize: 12)),
              if (tier == 'free')
                const Text('Upgrade for exclusive perks',
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
              const Icon(Icons.rocket_launch_outlined, color: KodaColors.koda, size: 24),
              const SizedBox(width: 12),
              Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('${_boostTokens.length} boost token${_boostTokens.length == 1 ? '' : 's'} available',
                    style: const TextStyle(color: KodaColors.text1,
                        fontSize: 14, fontWeight: FontWeight.w600)),
                const Text('Gift a token to any server you\'re in from its Server Bank tab',
                    style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              ])),
            ]),
          ),
        ],
        const SizedBox(height: 20),

        // Spark tier
        _buildTierCard(
          tier: 'spark',
          name: 'Spark',
          price: sparkPrice,
          color: const Color(0xFFFF6B35),
          current: tier == 'spark',
          perks: [
            'Custom avatar frame',
            'Spark badge on profile',
            'Increased file upload limit (50MB)',
            'Priority voice quality',
          ],
        ),
        const SizedBox(height: 12),

        // Pulse tier
        _buildTierCard(
          tier: 'pulse',
          name: 'Pulse',
          price: pulsePrice,
          color: KodaColors.koda,
          current: tier == 'pulse',
          perks: [
            'Everything in Spark',
            'Animated avatar frame',
            'Pulse badge on profile',
            '100MB file upload limit',
            '1 server boost token per month',
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
            color: color.withOpacity(0.1),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
          ),
          child: Row(children: [
            TierBadge(tier: tier, size: 24),
            const SizedBox(width: 10),
            Text(name, style: TextStyle(color: color,
                fontSize: 18, fontWeight: FontWeight.w700)),
            const Spacer(),
            Text('\$${(price / 100).toStringAsFixed(2)}/mo',
                style: const TextStyle(color: KodaColors.text1,
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
                Text(p, style: const TextStyle(
                    color: KodaColors.text2, fontSize: 13)),
              ]),
            )),
            const SizedBox(height: 12),
            if (current)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Current Plan',
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
                    child: Text('Get $name'),
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
                    child: Text('Gift $name'),
                  ),
                ),
              ]),
          ]),
        ),
      ]),
    );
  }

  Future<void> _showSubscribeDialog(String tier, int price, bool isGift) async {
    final recipientCtrl = TextEditingController();
    final messageCtrl = TextEditingController();
    final server = ref.read(selectedServerProvider);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(isGift ? 'Gift ${tier.toUpperCase()}' : 'Subscribe to ${tier.toUpperCase()}',
            style: const TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          if (isGift) ...[
            const Text('Gift username:', style: TextStyle(color: KodaColors.text3, fontSize: 12)),
            const SizedBox(height: 4),
            KodaTextField(controller: recipientCtrl, hintText: 'Username'),
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
                const Text('Subscription', style: TextStyle(color: KodaColors.text2)),
                Text('\$${(price / 100).toStringAsFixed(2)}',
                    style: const TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w600)),
              ]),
              const Divider(color: KodaColors.border),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Total', style: TextStyle(
                    color: KodaColors.text1, fontWeight: FontWeight.w600)),
                Text('\$${(price / 100).toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: KodaColors.koda, fontWeight: FontWeight.w700)),
              ]),
            ]),
          ),
          const SizedBox(height: 8),
          const Text('Payment processed securely by Stripe',
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda,
                foregroundColor: Colors.black),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Proceed to Payment'),
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
            const SnackBar(content: Text('User not found')));
        return;
      }
    }

    final result = await KodaApi.instance.createSubscription(
      tier,
      serverId: server?['id'] as String?,
      giftedToUserId: giftedTo,
    );

    if (result != null && mounted) {
      // In a real implementation, use flutter_stripe to present payment sheet
      // For now, show the client secret for testing
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment initiated — Stripe integration coming soon')));
    }
  }

  // ── Creator tab ───────────────────────────────────────────────────────────

  Widget _buildCreatorTab() {
    if (_loadingConnect) return const Center(
        child: CircularProgressIndicator(color: KodaColors.koda));

    final connected = _connectAccount != null;
    final onboarded = _connectAccount?['onboarding_complete'] == true;
    final chargesEnabled = _connectAccount?['charges_enabled'] == true;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: KodaColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: KodaColors.border),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: KodaColors.koda.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.payments_outlined,
                    color: KodaColors.koda, size: 24),
              ),
              const SizedBox(width: 12),
              const Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Creator Payouts',
                    style: TextStyle(color: KodaColors.text1,
                        fontSize: 16, fontWeight: FontWeight.w700)),
                Text('Receive tips directly via Stripe',
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
              ])),
            ]),
            const SizedBox(height: 20),

            // Status indicator
            _buildStatusRow('Stripe account', connected),
            const SizedBox(height: 8),
            _buildStatusRow('Onboarding complete', onboarded),
            const SizedBox(height: 8),
            _buildStatusRow('Accepting payments', chargesEnabled),

            const SizedBox(height: 20),

            if (!connected)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: KodaColors.koda,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 44),
                ),
                icon: const Icon(Icons.add_card, size: 18),
                label: const Text('Connect Stripe Account'),
                onPressed: _connectStripe,
              )
            else if (!onboarded || !chargesEnabled)
              Column(children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KodaColors.koda,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 44),
                  ),
                  icon: const Icon(Icons.open_in_new, size: 18),
                  label: const Text('Complete Stripe Onboarding'),
                  onPressed: _openOnboarding,
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: KodaColors.text2,
                    side: const BorderSide(color: KodaColors.border),
                    minimumSize: const Size(double.infinity, 44),
                  ),
                  icon: const Icon(Icons.refresh, size: 18),
                  label: const Text('Refresh Status'),
                  onPressed: _syncAccount,
                ),
              ])
            else
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: KodaColors.koda.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: KodaColors.koda.withOpacity(0.3)),
                ),
                child: const Row(children: [
                  Icon(Icons.check_circle, color: KodaColors.koda, size: 18),
                  SizedBox(width: 8),
                  Text('You\'re ready to receive tips!',
                      style: TextStyle(color: KodaColors.koda,
                          fontWeight: FontWeight.w500)),
                ]),
              ),
          ]),
        ),

        const SizedBox(height: 16),

        // How it works
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: KodaColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: KodaColors.border),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('How it works',
                style: TextStyle(color: KodaColors.text1,
                    fontWeight: FontWeight.w600, fontSize: 14)),
            const SizedBox(height: 12),
            _buildHowItWorksRow('1', 'Connect your Stripe account'),
            _buildHowItWorksRow('2', 'Complete identity verification'),
            _buildHowItWorksRow('3', 'Receive tips directly to your bank'),
            const SizedBox(height: 8),
            const Text('Koda charges a 5% processing fee. The fee goes to your server\'s bank as points.',
                style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          ]),
        ),
      ],
    );
  }

  Widget _buildStatusRow(String label, bool status) {
    return Row(children: [
      Icon(
        status ? Icons.check_circle : Icons.radio_button_unchecked,
        color: status ? KodaColors.koda : KodaColors.text3,
        size: 16,
      ),
      const SizedBox(width: 8),
      Text(label, style: TextStyle(
          color: status ? KodaColors.text1 : KodaColors.text3,
          fontSize: 13)),
    ]);
  }

  Widget _buildHowItWorksRow(String step, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(children: [
        Container(
          width: 22, height: 22,
          decoration: BoxDecoration(
            color: KodaColors.koda.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Center(child: Text(step,
              style: const TextStyle(color: KodaColors.koda,
                  fontSize: 11, fontWeight: FontWeight.w700))),
        ),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(color: KodaColors.text2, fontSize: 13)),
      ]),
    );
  }

  Future<void> _connectStripe() async {
    final result = await KodaApi.instance.createConnectAccount();
    if (result != null && mounted) {
      setState(() => _connectAccount = result);
      await _openOnboarding();
    }
  }

  Future<void> _openOnboarding() async {
    final result = await KodaApi.instance.getOnboardingUrl();
    if (result == null || !mounted) return;
    final url = Uri.parse(result['url'] as String);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _syncAccount() async {
    final result = await KodaApi.instance.syncConnectAccount();
    if (result != null && mounted) {
      setState(() => _connectAccount = {...?_connectAccount, ...result});
    }
  }

  // ── Server bank tab ───────────────────────────────────────────────────────

  Widget _buildServerBankTab() {
    final server = ref.watch(selectedServerProvider);
    if (server == null) {
      return const Center(child: Text('Select a server to view its bank',
          style: TextStyle(color: KodaColors.text3)));
    }
    return _ServerBankView(server: server);
  }

  Widget _buildDigitalGoodsTab() {
    final user = ref.watch(authProvider).user;
    final server = ref.watch(selectedServerProvider);
    return DigitalGoodsScreen(
      server: server,
      creatorMode: false,
    );
  }

  String _formatDate(dynamic raw) {
    if (raw == null) return '';
    try {
      final dt = DateTime.parse(raw.toString()).toLocal();
      return '${dt.month}/${dt.day}/${dt.year}';
    } catch (_) { return ''; }
  }
}

// ── Server bank view ──────────────────────────────────────────────────────

class _ServerBankView extends ConsumerStatefulWidget {
  final Map<String, dynamic> server;
  const _ServerBankView({required this.server});
  @override
  ConsumerState<_ServerBankView> createState() => _ServerBankViewState();
}

class _ServerBankViewState extends ConsumerState<_ServerBankView> {
  Map<String, dynamic>? _bank;
  Map<String, dynamic>? _boostStatus;
  int _myTokenCount = 0;
  bool _loading = true;
  bool _boosting = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final serverId = widget.server['id'] as String;
    final results = await Future.wait([
      KodaApi.instance.getServerBank(serverId),
      KodaApi.instance.getServerBoostStatus(serverId),
      KodaApi.instance.getMyBoostTokens(),
    ]);
    if (!mounted) return;
    setState(() {
      _bank = results[0] as Map<String, dynamic>?;
      _boostStatus = results[1] as Map<String, dynamic>?;
      _myTokenCount = (results[2] as List).length;
      _loading = false;
    });
  }

  Future<void> _boost() async {
    setState(() => _boosting = true);
    final error = await KodaApi.instance.boostServer(widget.server['id'] as String);
    if (!mounted) return;
    setState(() => _boosting = false);
    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.server['name']} boosted!')));
    _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(
        child: CircularProgressIndicator(color: KodaColors.koda));

    final balance = _bank?['balance'] as int? ?? 0;
    final balanceUsd = _bank?['balance_usd'] as double? ?? 0.0;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                KodaColors.koda.withOpacity(0.3),
                KodaColors.card,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: KodaColors.koda.withOpacity(0.3)),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              const Icon(Icons.account_balance_outlined,
                  color: KodaColors.koda, size: 20),
              const SizedBox(width: 8),
              Text(widget.server['name'] as String? ?? 'Server',
                  style: const TextStyle(color: KodaColors.text2, fontSize: 13)),
            ]),
            const SizedBox(height: 16),
            Text('$balance pts',
                style: const TextStyle(color: KodaColors.text1,
                    fontSize: 36, fontWeight: FontWeight.w800)),
            Text('\$${balanceUsd.toStringAsFixed(2)} in activity',
                style: const TextStyle(color: KodaColors.text3, fontSize: 13)),
            const SizedBox(height: 16),
            const Text(
              'Points are earned from the 5% processing fee on tips and subscriptions in this server. Use points to unlock server upgrades.',
              style: TextStyle(color: KodaColors.text3, fontSize: 11),
            ),
          ]),
        ),

        const SizedBox(height: 16),

        // Server boosts
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: KodaColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: KodaColors.border),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              const Icon(Icons.rocket_launch_outlined, color: KodaColors.koda, size: 20),
              const SizedBox(width: 8),
              const Text('Server Boosts',
                  style: TextStyle(color: KodaColors.text1,
                      fontWeight: FontWeight.w600, fontSize: 14)),
              const Spacer(),
              Text('Level ${_boostStatus?['level'] ?? 0}',
                  style: const TextStyle(color: KodaColors.koda,
                      fontWeight: FontWeight.w700, fontSize: 13)),
            ]),
            const SizedBox(height: 4),
            Text('${_boostStatus?['count'] ?? 0} active boost${(_boostStatus?['count'] ?? 0) == 1 ? '' : 's'}',
                style: const TextStyle(color: KodaColors.text3, fontSize: 12)),
            const SizedBox(height: 12),
            Text(
              _myTokenCount > 0
                  ? 'You have $_myTokenCount boost token${_myTokenCount == 1 ? '' : 's'} available.'
                  : 'Boost tokens come from a Pulse subscription (1/month). Subscribe on the Subscriptions tab to earn one.',
              style: const TextStyle(color: KodaColors.text3, fontSize: 11),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 40),
              ),
              icon: _boosting
                  ? const SizedBox(width: 14, height: 14,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                  : const Icon(Icons.rocket_launch_outlined, size: 16),
              label: Text(_boosting ? 'Boosting...' : 'Boost This Server'),
              onPressed: (_myTokenCount == 0 || _boosting) ? null : _boost,
            ),
          ]),
        ),

        const SizedBox(height: 16),

        // Spend points section (placeholder for Phase 2)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: KodaColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: KodaColors.border),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Coming soon — Server upgrades',
                style: TextStyle(color: KodaColors.text1,
                    fontWeight: FontWeight.w600, fontSize: 14)),
            const SizedBox(height: 8),
            const Text('Spend server bank points on:\n• Custom server domain\n• Increased member limit\n• Priority support\n• Exclusive server badge',
                style: TextStyle(color: KodaColors.text3, fontSize: 13, height: 1.6)),
          ]),
        ),
      ],
    );
  }

  Widget _buildDigitalGoodsTab() {
    final server = ref.watch(selectedServerProvider);
    return DigitalGoodsScreen(
      server: server,
      creatorMode: false,
    );
  }

  String _formatDate(dynamic raw) {
    if (raw == null) return '';
    try {
      final dt = DateTime.parse(raw.toString()).toLocal();
      return '${dt.month}/${dt.day}/${dt.year}';
    } catch (_) { return ''; }
  }
}



