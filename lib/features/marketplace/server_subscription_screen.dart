// lib/features/marketplace/server_subscription_screen.dart
//
// Two views:
// 1. Owner view — manage tiers (create/edit/delete), see subscriber counts
// 2. Member view — browse tiers, subscribe, see active subscription

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/api.dart';
import '../../core/checkout.dart';
import '../../core/theme.dart';
import '../../core/time_utils.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';

// Per-device display preference, off by default -- not every owner wants
// subscriber counts in their face constantly (small/new servers, or just
// personal taste), so it's opt-in rather than always shown. Not synced
// server-side, same "local window-chrome-style choice" convention as
// TrayService's close-to-tray setting.
const _kShowSubscriberCountsKey = 'koda_show_subscriber_counts';

class ServerSubscriptionScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic> server;
  final bool isOwner;
  const ServerSubscriptionScreen({
    super.key,
    required this.server,
    required this.isOwner,
  });
  @override
  ConsumerState<ServerSubscriptionScreen> createState() =>
      _ServerSubscriptionScreenState();
}

class _ServerSubscriptionScreenState
    extends ConsumerState<ServerSubscriptionScreen> {
  List<Map<String, dynamic>> _tiers = [];
  List<Map<String, dynamic>> _roles = [];
  Map<String, dynamic>? _mySubscription;
  bool _loading = true;
  bool _showSubscriberCounts = false;

  @override
  void initState() {
    super.initState();
    _load();
    _loadShowSubscriberCounts();
  }

  Future<void> _loadShowSubscriberCounts() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() => _showSubscriberCounts = prefs.getBool(_kShowSubscriberCountsKey) ?? false);
  }

  Future<void> _setShowSubscriberCounts(bool value) async {
    setState(() => _showSubscriberCounts = value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kShowSubscriberCountsKey, value);
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    if (widget.isOwner) {
      final results = await Future.wait([
        KodaApi.instance.getServerSubscriptionTiers(widget.server['id'] as String),
        KodaApi.instance.getRoles(widget.server['id'] as String),
      ]);
      if (!mounted) return;
      setState(() {
        _tiers = results[0];
        _roles = results[1];
        _loading = false;
      });
    } else {
      final data = await KodaApi.instance.getMyServerSubscription(
          widget.server['id'] as String);
      if (!mounted) return;
      setState(() {
        _tiers = List<Map<String, dynamic>>.from(data?['tiers'] ?? []);
        _mySubscription = data?['active_subscription'] as Map<String, dynamic>?;
        _loading = false;
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
        title: Text(
          widget.isOwner
              ? t.serverSubscriptionManageTitle
              : t.serverSubscriptionMemberTitle(widget.server['name'] as String? ?? ''),
          style: TextStyle(color: KodaColors.text1,
              fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          if (widget.isOwner && _tiers.length < 3)
            IconButton(
              icon: Icon(Icons.add, color: KodaColors.koda),
              tooltip: t.serverSubscriptionAddTierTooltip,
              onPressed: _showCreateTierDialog,
            ),
        ],
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : widget.isOwner
              ? _buildOwnerView()
              : _buildMemberView(),
    );
  }

  // ── Owner view ────────────────────────────────────────────────────────────

  Widget _buildOwnerView() {
    final t = AppLocalizations.of(context);
    if (_tiers.isEmpty) {
      return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.subscriptions_outlined,
              color: KodaColors.text3, size: 48),
          const SizedBox(height: 12),
          Text(t.serverSubscriptionNoTiersYet,
              style: TextStyle(color: KodaColors.text1, fontSize: 16,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(t.serverSubscriptionCreateUpTo3Tiers,
              style: TextStyle(color: KodaColors.text3, fontSize: 13)),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda,
                foregroundColor: Colors.black),
            icon: const Icon(Icons.add, size: 18),
            label: Text(t.serverSubscriptionCreateFirstTierButton),
            onPressed: _showCreateTierDialog,
          ),
        ]),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _tiers.length + 1,
      itemBuilder: (_, i) {
        if (i == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(children: [
              Expanded(
                child: Text(t.serverSubscriptionShowSubscriberCounts,
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
              ),
              Switch(
                value: _showSubscriberCounts,
                activeThumbColor: KodaColors.koda,
                onChanged: _setShowSubscriberCounts,
              ),
            ]),
          );
        }
        return _buildOwnerTierCard(_tiers[i - 1]);
      },
    );
  }

  Widget _buildOwnerTierCard(Map<String, dynamic> tier) {
    final t = AppLocalizations.of(context);
    final price = (tier['price_cents'] as int? ?? 0) / 100.0;
    final discount = tier['marketplace_discount_percent'] as int? ?? 0;
    final position = tier['position'] as int? ?? 1;
    final subscriberCount = tier['subscriber_count'] as int? ?? 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(children: [
        // Header
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: KodaColors.elevated,
            borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
          ),
          child: Row(children: [
            Container(
              width: 28, height: 28,
              decoration: BoxDecoration(
                color: KodaColors.koda.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Center(child: Text('$position',
                  style: TextStyle(color: KodaColors.koda,
                      fontWeight: FontWeight.w700))),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(tier['name'] as String? ?? '',
                  style: TextStyle(color: KodaColors.text1,
                      fontSize: 15, fontWeight: FontWeight.w700)),
            ),
            Text(t.serverSubscriptionPricePerMonth('\$${price.toStringAsFixed(2)}'),
                style: TextStyle(color: KodaColors.koda,
                    fontWeight: FontWeight.w600)),
          ]),
        ),

        // Details
        Padding(
          padding: const EdgeInsets.all(14),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (tier['description'] != null &&
                (tier['description'] as String).isNotEmpty) ...[
              Text(tier['description'] as String,
                  style: TextStyle(color: KodaColors.text2, fontSize: 13)),
              const SizedBox(height: 8),
            ],
            if (_showSubscriberCounts) ...[
              Row(children: [
                Icon(Icons.people_outline, size: 14, color: KodaColors.text3),
                const SizedBox(width: 4),
                Text(t.serverSubscriptionActiveSubscriberCount(subscriberCount),
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
              ]),
              const SizedBox(height: 8),
            ],
            Row(children: [
              if (tier['role_id'] != null) ...[
                Icon(Icons.badge_outlined, size: 14, color: KodaColors.text3),
                const SizedBox(width: 4),
                Text(t.serverSubscriptionRoleAutoAssigned,
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(width: 12),
              ],
              if (discount > 0) ...[
                Icon(Icons.local_offer_outlined,
                    size: 14, color: KodaColors.text3),
                const SizedBox(width: 4),
                Text(t.serverSubscriptionDiscountPercent(discount),
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
              ],
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: KodaColors.text2,
                    side: BorderSide(color: KodaColors.border),
                  ),
                  icon: const Icon(Icons.edit_outlined, size: 14),
                  label: Text(t.commonEdit),
                  onPressed: () => _showEditTierDialog(tier),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: KodaColors.accent,
                  side: BorderSide(color: KodaColors.accent),
                ),
                icon: const Icon(Icons.delete_outline, size: 14),
                label: Text(t.commonDelete),
                onPressed: () => _deleteTier(tier),
              ),
            ]),
          ]),
        ),
      ]),
    );
  }

  // ── Member view ───────────────────────────────────────────────────────────

  Widget _buildMemberView() {
    final t = AppLocalizations.of(context);
    if (_tiers.isEmpty) {
      return Center(child: Text(t.serverSubscriptionNoTiersMember,
          style: TextStyle(color: KodaColors.text3)));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Active subscription banner
        if (_mySubscription != null) ...[
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: KodaColors.koda.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: KodaColors.koda.withValues(alpha: 0.3)),
            ),
            child: Row(children: [
              Icon(Icons.check_circle, color: KodaColors.koda, size: 20),
              const SizedBox(width: 10),
              Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(t.serverSubscriptionActiveSubscriberBadge,
                    style: TextStyle(color: KodaColors.koda,
                        fontWeight: FontWeight.w600)),
                Text(t.serverSubscriptionExpiresOn(_formatDate(_mySubscription!['expires_at'])),
                    style: TextStyle(
                        color: KodaColors.text3, fontSize: 12)),
              ])),
            ]),
          ),
        ],

        // Tier cards
        ..._tiers.map((tier) => _buildMemberTierCard(tier)),
      ],
    );
  }

  Widget _buildMemberTierCard(Map<String, dynamic> tier) {
    final t = AppLocalizations.of(context);
    final price = (tier['price_cents'] as int? ?? 0) / 100.0;
    final discount = tier['marketplace_discount_percent'] as int? ?? 0;
    final isSubscribed = _mySubscription?['tier_id'] == tier['id'];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSubscribed ? KodaColors.koda : KodaColors.border,
          width: isSubscribed ? 2 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(
              child: Text(tier['name'] as String? ?? '',
                  style: TextStyle(color: KodaColors.text1,
                      fontSize: 16, fontWeight: FontWeight.w700)),
            ),
            Text(t.serverSubscriptionPricePerMonth('\$${price.toStringAsFixed(2)}'),
                style: TextStyle(color: KodaColors.koda,
                    fontSize: 16, fontWeight: FontWeight.w700)),
          ]),
          if (tier['description'] != null &&
              (tier['description'] as String).isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(tier['description'] as String,
                style: TextStyle(color: KodaColors.text2, fontSize: 13)),
          ],
          const SizedBox(height: 10),

          // Perks
          if (tier['role_id'] != null)
            _perkRow(Icons.badge_outlined, t.serverSubscriptionExclusiveRolePerk),
          if (discount > 0)
            _perkRow(Icons.local_offer_outlined,
                t.serverSubscriptionDiscountPerk(discount)),
          _perkRow(Icons.lock_open_outlined, t.serverSubscriptionSubscriberOnlyChannelsPerk),

          const SizedBox(height: 14),

          if (isSubscribed)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: KodaColors.koda.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(t.serverSubscriptionCurrentlySubscribed,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: KodaColors.koda,
                      fontWeight: FontWeight.w600)),
            )
          else
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 44),
              ),
              onPressed: () => _showSubscribeDialog(tier),
              child: Text(t.serverSubscriptionSubscribeForPrice('\$${price.toStringAsFixed(2)}')),
            ),
        ]),
      ),
    );
  }

  Widget _perkRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(children: [
        Icon(icon, size: 14, color: KodaColors.koda),
        const SizedBox(width: 6),
        Text(text, style: TextStyle(color: KodaColors.text2, fontSize: 12)),
      ]),
    );
  }

  // ── Dialogs ───────────────────────────────────────────────────────────────

  Future<void> _showCreateTierDialog() async {
    await _showTierDialog(null);
  }

  Future<void> _showEditTierDialog(Map<String, dynamic> tier) async {
    await _showTierDialog(tier);
  }

  Future<void> _showTierDialog(Map<String, dynamic>? existing) async {
    final t = AppLocalizations.of(context);
    final nameCtrl = TextEditingController(text: existing?['name'] ?? '');
    final descCtrl = TextEditingController(text: existing?['description'] ?? '');
    final priceCtrl = TextEditingController(
        text: existing != null
            ? ((existing['price_cents'] as int) / 100.0).toStringAsFixed(2)
            : '');
    int discount = existing?['marketplace_discount_percent'] as int? ?? 0;
    int position = existing?['position'] as int? ?? (_tiers.length + 1);
    String? selectedRoleId = existing?['role_id'] as String?;

    final saved = await showDialog<bool>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(existing == null ? t.serverSubscriptionCreateTierTitle : t.serverSubscriptionEditTierTitle,
              style: TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 360,
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                KodaTextField(controller: nameCtrl, hintText: t.serverSubscriptionTierNameHint, autofocus: true),
                const SizedBox(height: 10),
                KodaTextField(controller: descCtrl, hintText: t.serverSubscriptionDescriptionHint),
                const SizedBox(height: 10),
                KodaTextField(controller: priceCtrl, hintText: t.serverSubscriptionPriceHint),
                const SizedBox(height: 12),
                Text(t.serverSubscriptionDiscountLabel,
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 4),
                Row(children: [
                  Expanded(
                    child: Slider(
                      value: discount.toDouble(),
                      min: 0, max: 50, divisions: 10,
                      activeColor: KodaColors.koda,
                      onChanged: (v) => setDialogState(() => discount = v.round()),
                    ),
                  ),
                  Text('$discount%',
                      style: TextStyle(color: KodaColors.text1,
                          fontWeight: FontWeight.w600)),
                ]),
                const SizedBox(height: 8),
                Text(t.serverSubscriptionPositionLabel,
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 4),
                DropdownButton<int>(
                  value: position,
                  dropdownColor: KodaColors.card,
                  style: TextStyle(color: KodaColors.text1),
                  onChanged: (v) => setDialogState(() => position = v!),
                  items: [1, 2, 3].map((p) => DropdownMenuItem(
                    value: p,
                    child: Text(t.serverSubscriptionTierOption(p)),
                  )).toList(),
                ),
                const SizedBox(height: 12),
                Text(t.serverSubscriptionGrantsRoleLabel,
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 4),
                DropdownButton<String?>(
                  value: selectedRoleId,
                  isExpanded: true,
                  dropdownColor: KodaColors.card,
                  style: TextStyle(color: KodaColors.text1, fontSize: 13),
                  onChanged: (v) => setDialogState(() => selectedRoleId = v),
                  items: [
                    DropdownMenuItem<String?>(value: null, child: Text(t.commonNone)),
                    ..._roles.map((r) => DropdownMenuItem<String?>(
                          value: r['id'] as String,
                          child: Text(r['name'] as String? ?? t.serverSubscriptionRoleFallback),
                        )),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  t.serverSubscriptionRoleAutoAssignExplanation,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11),
                ),
              ]),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false),
                child: Text(t.commonCancel)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: KodaColors.koda,
                  foregroundColor: Colors.black),
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(existing == null ? t.commonCreate : t.commonSave),
            ),
          ],
        ),
      ),
    );

    if (saved != true) return;
    final price = double.tryParse(priceCtrl.text.trim());
    if (price == null || price <= 0 || nameCtrl.text.trim().isEmpty) return;
    final priceCents = (price * 100).round();

    if (existing == null) {
      final result = await KodaApi.instance.createServerSubscriptionTier(
        widget.server['id'] as String,
        {
          'name':                         nameCtrl.text.trim(),
          'description':                  descCtrl.text.trim(),
          'price_cents':                  priceCents,
          'marketplace_discount_percent': discount,
          'position':                     position,
          'role_id':                      selectedRoleId,
        },
      );
      if (result != null && mounted) {
        _load();
        if (result['owner_payable'] != true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(t.serverSubscriptionTierCreatedConnectStripe),
              duration: const Duration(seconds: 6)));
        }
      }
    } else {
      final ok = await KodaApi.instance.updateServerSubscriptionTier(
        existing['id'] as String,
        {
          'name':                         nameCtrl.text.trim(),
          'description':                  descCtrl.text.trim(),
          'price_cents':                  priceCents,
          'marketplace_discount_percent': discount,
          'position':                     position,
          'role_id':                      selectedRoleId,
        },
      );
      if (ok && mounted) _load();
    }
  }

  Future<void> _deleteTier(Map<String, dynamic> tier) async {
    final t = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.serverSubscriptionDeleteTierTitle,
            style: TextStyle(color: KodaColors.text1)),
        content: Text(t.serverSubscriptionDeleteTierConfirm(tier['name'] as String? ?? ''),
            style: TextStyle(color: KodaColors.text2)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false),
              child: Text(t.commonCancel)),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(t.commonDelete,
                style: TextStyle(color: KodaColors.accent)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    final ok = await KodaApi.instance.deleteServerSubscriptionTier(
        tier['id'] as String);
    if (ok && mounted) _load();
  }

  Future<void> _showSubscribeDialog(Map<String, dynamic> tier) async {
    final t = AppLocalizations.of(context);
    final price = (tier['price_cents'] as int? ?? 0) / 100.0;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.serverSubscriptionSubscribeToTierTitle(tier['name'] as String? ?? ''),
            style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: KodaColors.elevated,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(t.serverSubscriptionMonthlySubscriptionLabel,
                    style: TextStyle(color: KodaColors.text2)),
                Text('\$${price.toStringAsFixed(2)}',
                    style: TextStyle(color: KodaColors.text1,
                        fontWeight: FontWeight.w600)),
              ]),
              Divider(color: KodaColors.border, height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(t.serverSubscriptionServerBankEarnsLabel,
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                Text(t.serverSubscriptionPointsLabel(((tier['price_cents'] as int) * 0.05).round()),
                    style: TextStyle(color: KodaColors.koda, fontSize: 12)),
              ]),
            ]),
          ),
          const SizedBox(height: 10),
          Text(t.serverSubscriptionPaymentSecureNote,
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
            child: Text(t.serverSubscriptionSubscribeButton),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;
    final result = await KodaApi.instance.subscribeToServerTier(
        tier['id'] as String);

    final checkoutUrl = result?['checkout_url'] as String?;
    if (checkoutUrl == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(t.serverSubscriptionCheckoutStripeNotConnected)));
      }
      return;
    }

    if (!mounted) return;
    final messenger = ScaffoldMessenger.of(context);
    final paymentConfirmed = await launchCheckoutAndWait(context, ref,
        checkoutUrl: checkoutUrl,
        // No subscription record exists yet -- it's only created once
        // the webhook confirms -- so this matches loosely on
        // payment_type rather than a specific record id.
        matches: (data) =>
            data['payment_type'] == 'server_subscription');
    if (mounted) {
      messenger.showSnackBar(SnackBar(content: Text(paymentConfirmed
          ? t.serverSubscriptionSubscribed
          : t.serverSubscriptionSubscriptionPending)));
      _load();
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