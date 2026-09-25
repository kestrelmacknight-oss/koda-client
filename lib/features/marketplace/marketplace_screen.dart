// lib/features/marketplace/marketplace_screen.dart
//
// Server-scoped marketplace hub: Creator Payouts (only reachable in
// accountOnly mode, see Settings > Billing) plus, embedded inside a
// specific server's own view, Server Bank/Digital Goods/Merch/
// Subscription/Revenue -- all server-scoped, all read
// ref.watch(selectedServerProvider). The account-wide Spark/Pulse
// subscription and boost purchasing live in KodaMarketplaceScreen
// instead (reachable from the server rail), not here.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/api.dart';
import '../../core/permissions.dart';
import '../../core/providers.dart';
import '../../core/theme.dart';
import '../../core/time_utils.dart';
import '../visp/visp_boost_advisor_panel.dart';
import 'digital_goods_screen.dart';
import 'printful_merch_screen.dart';
import 'server_subscription_screen.dart';

class MarketplaceScreen extends ConsumerStatefulWidget {
  /// When true, renders just the tab bar + tab content (no Scaffold/AppBar
  /// of its own) so it can sit inline inside another screen's layout --
  /// see home_screen.dart, where this is shown in the main content area
  /// as a server-scoped pseudo-channel.
  final bool embedded;
  /// Settings > Billing's mode: Creator Payouts only, no tab bar (it's
  /// the only thing left here that's genuinely account-level -- Spark/
  /// Pulse subscriptions live in KodaMarketplaceScreen instead). Server
  /// Bank/Digital Goods/Merch/Subscription/Revenue all read
  /// ref.watch(selectedServerProvider) as their primary data source --
  /// meaningful when this screen is embedded inside a specific server's
  /// own view (home_screen.dart, selectedServerProvider correctly
  /// reflects that server), but not from account Settings, where
  /// there's no server the user deliberately chose to be looking at.
  final bool accountOnly;
  const MarketplaceScreen({super.key, this.embedded = false, this.accountOnly = false});
  @override
  ConsumerState<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends ConsumerState<MarketplaceScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabs;
  Map<String, dynamic>? _connectAccount;
  bool _loadingConnect = true;
  bool _canManageMarketplace = false;

  @override
  void initState() {
    super.initState();
    if (!widget.accountOnly) {
      _tabs = TabController(length: 5, vsync: this);
      _loadPermission();
    }
    _loadData();
  }

  @override
  void dispose() {
    _tabs?.dispose();
    super.dispose();
  }

  Future<void> _loadPermission() async {
    final server = ref.read(selectedServerProvider);
    if (server == null) return;
    final user = ref.read(authProvider).user;
    final canManage = await hasServerPermission(server, 'manage_marketplace',
        currentUserId: user?.id, isKodaAdmin: user?.isAdmin ?? false);
    if (mounted) setState(() => _canManageMarketplace = canManage);
  }

  Future<void> _loadData() async {
    final connect = await KodaApi.instance.getConnectAccount();
    if (!mounted) return;
    setState(() {
      _connectAccount = connect;
      _loadingConnect = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.accountOnly) {
      // The only thing left here now -- no tab chrome needed for one tab.
      final content = _buildCreatorTab();
      if (widget.embedded) return content;
      return Scaffold(
        backgroundColor: KodaColors.voidBg,
        appBar: AppBar(
          backgroundColor: KodaColors.bg2,
          title: Text('Creator Payouts',
              style: TextStyle(color: KodaColors.text1,
                  fontSize: 16, fontWeight: FontWeight.w700)),
        ),
        body: content,
      );
    }

    final tabBar = TabBar(
      controller: _tabs,
      indicatorColor: KodaColors.koda,
      labelColor: KodaColors.text1,
      unselectedLabelColor: KodaColors.text3,
      isScrollable: true,
      tabs: const [
        Tab(text: 'Server Bank'),
        Tab(text: 'Digital Goods'),
        Tab(text: 'Merch'),
        Tab(text: 'Subscription'),
        Tab(text: 'Revenue'),
      ],
    );
    final tabViews = TabBarView(
      controller: _tabs,
      children: [
        _buildServerBankTab(),
        _buildDigitalGoodsTab(),
        _buildMerchTab(),
        _buildSubscriptionTab(),
        _buildRevenueTab(),
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
        title: Text('Marketplace',
            style: TextStyle(color: KodaColors.text1,
                fontSize: 16, fontWeight: FontWeight.w700)),
        bottom: tabBar,
      ),
      body: tabViews,
    );
  }

  // ── Subscriptions tab ─────────────────────────────────────────────────────

  // ── Subscription tab (server-scoped tier, not the account-wide Spark/Pulse) ──

  Widget _buildSubscriptionTab() {
    final server = ref.watch(selectedServerProvider);
    if (server == null) {
      return Center(child: Text('Select a server to view its subscription',
          style: TextStyle(color: KodaColors.text3)));
    }
    return ServerSubscriptionScreen(server: server, isOwner: _canManageMarketplace);
  }

  // ── Creator tab ───────────────────────────────────────────────────────────

  Widget _buildCreatorTab() {
    if (_loadingConnect) {
      return Center(
          child: CircularProgressIndicator(color: KodaColors.koda));
    }

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
                  color: KodaColors.koda.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.payments_outlined,
                    color: KodaColors.koda, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(child: Column(
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
                    side: BorderSide(color: KodaColors.border),
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
                  color: KodaColors.koda.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: KodaColors.koda.withValues(alpha: 0.3)),
                ),
                child: Row(children: [
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
            Text('How it works',
                style: TextStyle(color: KodaColors.text1,
                    fontWeight: FontWeight.w600, fontSize: 14)),
            const SizedBox(height: 12),
            _buildHowItWorksRow('1', 'Connect your Stripe account'),
            _buildHowItWorksRow('2', 'Complete identity verification'),
            _buildHowItWorksRow('3', 'Receive tips directly to your bank'),
            const SizedBox(height: 8),
            Text('Koda charges a 5% processing fee. The fee goes to your server\'s bank as points.',
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
            color: KodaColors.koda.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: Center(child: Text(step,
              style: TextStyle(color: KodaColors.koda,
                  fontSize: 11, fontWeight: FontWeight.w700))),
        ),
        const SizedBox(width: 10),
        Text(text, style: TextStyle(color: KodaColors.text2, fontSize: 13)),
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
      return Center(child: Text('Select a server to view its bank',
          style: TextStyle(color: KodaColors.text3)));
    }
    // Financial balance/boost management -- owner or a manage_marketplace
    // role only, same authority as pricing tiers/products or the
    // revenue dashboard. Server-side enforced too (GET /servers/:id/bank
    // and /boost_status), this is UX, not the real boundary.
    if (!_canManageMarketplace) {
      return Center(child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Only the server owner or someone with the Manage Marketplace '
          'permission can view the Server Bank.',
          textAlign: TextAlign.center,
          style: TextStyle(color: KodaColors.text3),
        ),
      ));
    }
    return _ServerBankView(server: server);
  }

  Widget _buildDigitalGoodsTab() {
    final server = ref.watch(selectedServerProvider);
    return DigitalGoodsScreen(
      server: server,
      creatorMode: false,
    );
  }

  Widget _buildMerchTab() {
    final server = ref.watch(selectedServerProvider);
    return PrintfulMerchScreen(
      server: server,
      creatorMode: false,
    );
  }

  // ── Revenue tab ──────────────────────────────────────────────────────────

  Widget _buildRevenueTab() {
    final server = ref.watch(selectedServerProvider);
    if (server == null) {
      return Center(child: Text('Select a server to view its revenue',
          style: TextStyle(color: KodaColors.text3)));
    }
    return _RevenueDashboardView(server: server);
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

  // Boost-count thresholds for the next level -- mirrors
  // Koda.Boosts.boost_level/1 server-side. Purely informational text
  // here; the server is the actual source of truth for the level.
  static const _levelThresholds = {0: 1, 1: 3, 2: 6, 3: 10, 4: 15};

  String get _emojiSlotText {
    final limit = _boostStatus?['emoji_slot_limit'] as int? ?? 10;
    return '$limit custom emoji slots';
  }

  String? get _nextLevelHint {
    final level = _boostStatus?['level'] as int? ?? 0;
    final count = _boostStatus?['count'] as int? ?? 0;
    final needed = _levelThresholds[level];
    if (needed == null) return null; // already at the top level
    final more = needed - count;
    final unlock = switch (level) {
      3 => ' and unlock a custom server background',
      4 => ' and unlock a custom server icon border',
      _ => '',
    };
    return '$more more boost${more == 1 ? '' : 's'} to reach level ${level + 1}$unlock';
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Center(
          child: CircularProgressIndicator(color: KodaColors.koda));
    }

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
                KodaColors.koda.withValues(alpha: 0.3),
                KodaColors.card,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: KodaColors.koda.withValues(alpha: 0.3)),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Icon(Icons.account_balance_outlined,
                  color: KodaColors.koda, size: 20),
              const SizedBox(width: 8),
              Text(widget.server['name'] as String? ?? 'Server',
                  style: TextStyle(color: KodaColors.text2, fontSize: 13)),
            ]),
            const SizedBox(height: 16),
            Text('$balance pts',
                style: TextStyle(color: KodaColors.text1,
                    fontSize: 36, fontWeight: FontWeight.w800)),
            Text('\$${balanceUsd.toStringAsFixed(2)} in activity',
                style: TextStyle(color: KodaColors.text3, fontSize: 13)),
            const SizedBox(height: 16),
            Text(
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
              Icon(Icons.rocket_launch_outlined, color: KodaColors.koda, size: 20),
              const SizedBox(width: 8),
              Text('Server Boosts',
                  style: TextStyle(color: KodaColors.text1,
                      fontWeight: FontWeight.w600, fontSize: 14)),
              const Spacer(),
              Text('Level ${_boostStatus?['level'] ?? 0}',
                  style: TextStyle(color: KodaColors.koda,
                      fontWeight: FontWeight.w700, fontSize: 13)),
            ]),
            const SizedBox(height: 4),
            Text('${_boostStatus?['count'] ?? 0} active boost${(_boostStatus?['count'] ?? 0) == 1 ? '' : 's'}'
                ' -- $_emojiSlotText',
                style: TextStyle(color: KodaColors.text3, fontSize: 12)),
            if (_nextLevelHint != null) ...[
              const SizedBox(height: 4),
              Text(_nextLevelHint!,
                  style: TextStyle(color: KodaColors.koda, fontSize: 11)),
            ],
            const SizedBox(height: 12),
            Text(
              _myTokenCount > 0
                  ? 'You have $_myTokenCount boost token${_myTokenCount == 1 ? '' : 's'} available.'
                  : 'Boost tokens come from a Pulse subscription (1/month). Subscribe on the Subscriptions tab to earn one.',
              style: TextStyle(color: KodaColors.text3, fontSize: 11),
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
            Text('Coming soon — Server upgrades',
                style: TextStyle(color: KodaColors.text1,
                    fontWeight: FontWeight.w600, fontSize: 14)),
            SizedBox(height: 8),
            Text('Spend server bank points on:\n• Custom server domain\n• Increased member limit\n• Priority support\n• Exclusive server badge',
                style: TextStyle(color: KodaColors.text3, fontSize: 13, height: 1.6)),
          ]),
        ),
      ],
    );
  }
}

// ── Revenue dashboard ────────────────────────────────────────────────────
//
// Detail beyond the plain balance every member sees on the Server Bank
// tab -- gated server-side to manage_marketplace, same authority as
// pricing tickets/products or connecting Printful.

class _RevenueDashboardView extends ConsumerStatefulWidget {
  final Map<String, dynamic> server;
  const _RevenueDashboardView({required this.server});
  @override
  ConsumerState<_RevenueDashboardView> createState() => _RevenueDashboardViewState();
}

class _RevenueDashboardViewState extends ConsumerState<_RevenueDashboardView> {
  bool _loading = true;
  bool _authorized = false;
  Map<String, dynamic>? _summary;
  List<Map<String, dynamic>> _points = [];
  List<Map<String, dynamic>> _transactions = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(covariant _RevenueDashboardView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.server['id'] != widget.server['id']) _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final serverId = widget.server['id'] as String;
    final user = ref.read(authProvider).user;
    final authorized = await hasServerPermission(widget.server, 'manage_marketplace',
        currentUserId: user?.id, isKodaAdmin: user?.isAdmin ?? false);
    if (!authorized) {
      if (!mounted) return;
      setState(() { _authorized = false; _loading = false; });
      return;
    }
    final results = await Future.wait([
      KodaApi.instance.getRevenueSummary(serverId),
      KodaApi.instance.getRevenueTimeseries(serverId),
      KodaApi.instance.getRevenueTransactions(serverId),
    ]);
    if (!mounted) return;
    setState(() {
      _authorized = true;
      _summary = results[0];
      _points = List<Map<String, dynamic>>.from(
          (results[1]?['points'] as List?) ?? []);
      _transactions = List<Map<String, dynamic>>.from(
          (results[2]?['transactions'] as List?) ?? []);
      _loading = false;
    });
  }

  String _sourceLabel(String type) {
    switch (type) {
      case 'tip': return 'Tips';
      case 'subscription': return 'Koda Subscriptions';
      case 'server_subscription': return 'Server Subscriptions';
      case 'digital_product': return 'Digital Goods';
      case 'stage_ticket': return 'Stage Tickets';
      case 'printful_order': return 'Merch Orders';
      default: return type;
    }
  }

  IconData _sourceIcon(String type) {
    switch (type) {
      case 'tip': return Icons.volunteer_activism_outlined;
      case 'subscription': return Icons.workspace_premium_outlined;
      case 'server_subscription': return Icons.card_membership_outlined;
      case 'digital_product': return Icons.inventory_2_outlined;
      case 'stage_ticket': return Icons.confirmation_num_outlined;
      case 'printful_order': return Icons.local_shipping_outlined;
      default: return Icons.circle_outlined;
    }
  }

  String _relativeDate(String iso) {
    try {
      final dt = parseServerTimestamp(iso);
      final diff = DateTime.now().difference(dt);
      if (diff.inMinutes < 1) return 'just now';
      if (diff.inHours < 1) return '${diff.inMinutes}m ago';
      if (diff.inDays < 1) return '${diff.inHours}h ago';
      if (diff.inDays < 7) return '${diff.inDays}d ago';
      return '${dt.month}/${dt.day}/${dt.year}';
    } catch (_) { return ''; }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Center(
          child: CircularProgressIndicator(color: KodaColors.koda));
    }

    if (!_authorized) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Only members who can manage the marketplace can view this server\'s revenue.',
            textAlign: TextAlign.center,
            style: TextStyle(color: KodaColors.text3, fontSize: 13),
          ),
        ),
      );
    }

    final balance = _summary?['balance'] as int? ?? 0;
    final lifetime = _summary?['lifetime_received'] as int? ?? 0;
    final breakdown = List<Map<String, dynamic>>.from(
        (_summary?['breakdown'] as List?) ?? []);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(children: [
          Expanded(child: _statCard('Balance', balance, KodaColors.koda)),
          const SizedBox(width: 12),
          Expanded(child: _statCard('Lifetime Earned', lifetime, KodaColors.mint)),
        ]),

        const SizedBox(height: 16),
        Text('Last 30 Days',
            style: TextStyle(color: KodaColors.text1,
                fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 10),
        _RevenueBarChart(points: _points),

        const SizedBox(height: 20),
        Text('Revenue by Source',
            style: TextStyle(color: KodaColors.text1,
                fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 10),
        if (breakdown.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text('No revenue yet.',
                style: TextStyle(color: KodaColors.text3, fontSize: 13)),
          )
        else
          ...breakdown.map((row) {
            final type = row['source_type'] as String? ?? 'other';
            final total = row['total'] as int? ?? 0;
            final count = row['count'] as int? ?? 0;
            final pct = lifetime > 0 ? (total / lifetime * 100) : 0.0;
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: KodaColors.card,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: KodaColors.border),
              ),
              child: Row(children: [
                Icon(_sourceIcon(type), size: 18, color: KodaColors.koda),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(_sourceLabel(type),
                        style: TextStyle(color: KodaColors.text1,
                            fontSize: 13, fontWeight: FontWeight.w600)),
                    Text('$count transaction${count == 1 ? '' : 's'}',
                        style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                  ]),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('\$${(total / 100).toStringAsFixed(2)}',
                      style: TextStyle(color: KodaColors.text1,
                          fontSize: 13, fontWeight: FontWeight.w700)),
                  Text('${pct.toStringAsFixed(0)}%',
                      style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                ]),
              ]),
            );
          }),

        const SizedBox(height: 20),
        Text('Recent Transactions',
            style: TextStyle(color: KodaColors.text1,
                fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 10),
        if (_transactions.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text('No transactions yet.',
                style: TextStyle(color: KodaColors.text3, fontSize: 13)),
          )
        else
          ..._transactions.map((t) {
            final type = t['source_type'] as String? ?? 'other';
            final amount = t['amount'] as int? ?? 0;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(children: [
                Icon(_sourceIcon(type), size: 14, color: KodaColors.text3),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(_sourceLabel(type),
                      style: TextStyle(color: KodaColors.text2, fontSize: 12)),
                ),
                Text('+\$${(amount / 100).toStringAsFixed(2)}',
                    style: TextStyle(color: KodaColors.mint,
                        fontSize: 12, fontWeight: FontWeight.w600)),
                const SizedBox(width: 10),
                Text(_relativeDate(t['inserted_at'] as String? ?? ''),
                    style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              ]),
            );
          }),

        const SizedBox(height: 20),
        VispBoostAdvisorPanel(serverId: widget.server['id'] as String),
      ],
    );
  }

  Widget _statCard(String label, int cents, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
        const SizedBox(height: 6),
        Text('\$${(cents / 100).toStringAsFixed(2)}',
            style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.w800)),
      ]),
    );
  }
}

/// Lightweight bar chart with no external dependency -- daily totals over
/// the trailing window, scaled to the tallest day. Horizontally scrollable
/// so a 30/90-day window stays legible instead of squeezing bars illegibly
/// thin on a narrow screen.
class _RevenueBarChart extends StatelessWidget {
  final List<Map<String, dynamic>> points;
  const _RevenueBarChart({required this.points});

  @override
  Widget build(BuildContext context) {
    if (points.isEmpty) {
      return SizedBox(
        height: 120,
        child: Center(child: Text('No activity yet',
            style: TextStyle(color: KodaColors.text3, fontSize: 12))),
      );
    }

    final maxTotal = points
        .map((p) => (p['total'] as int?) ?? 0)
        .fold<int>(0, (a, b) => a > b ? a : b);

    return SizedBox(
      height: 120,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: points.map((p) {
            final total = (p['total'] as int?) ?? 0;
            final frac = maxTotal > 0 ? total / maxTotal : 0.0;
            final date = p['date'] as String? ?? '';
            final day = date.length >= 10 ? date.substring(8, 10) : '';
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Tooltip(
                message: total > 0
                    ? '$date: \$${(total / 100).toStringAsFixed(2)}'
                    : date,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 8,
                      height: 4 + (frac * 84),
                      decoration: BoxDecoration(
                        color: total > 0
                            ? KodaColors.koda
                            : KodaColors.elevated,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 16,
                      child: Text(day,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: KodaColors.text3, fontSize: 8)),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

