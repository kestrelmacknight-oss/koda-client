// lib/features/marketplace/server_subscription_screen.dart
//
// Two views:
// 1. Owner view — manage tiers (create/edit/delete), see subscriber counts
// 2. Member view — browse tiers, subscribe, see active subscription

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api.dart';
import '../../core/providers.dart';
import '../../core/theme.dart';
import '../../shared/widgets.dart';

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
  Map<String, dynamic>? _mySubscription;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    if (widget.isOwner) {
      final tiers = await KodaApi.instance.getServerSubscriptionTiers(
          widget.server['id'] as String);
      if (!mounted) return;
      setState(() { _tiers = tiers; _loading = false; });
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
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(
          widget.isOwner
              ? 'Manage Subscriptions'
              : '${widget.server['name']} Subscriptions',
          style: const TextStyle(color: KodaColors.text1,
              fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          if (widget.isOwner && _tiers.length < 3)
            IconButton(
              icon: const Icon(Icons.add, color: KodaColors.koda),
              tooltip: 'Add tier',
              onPressed: _showCreateTierDialog,
            ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : widget.isOwner
              ? _buildOwnerView()
              : _buildMemberView(),
    );
  }

  // ── Owner view ────────────────────────────────────────────────────────────

  Widget _buildOwnerView() {
    if (_tiers.isEmpty) {
      return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.subscriptions_outlined,
              color: KodaColors.text3, size: 48),
          const SizedBox(height: 12),
          const Text('No subscription tiers yet',
              style: TextStyle(color: KodaColors.text1, fontSize: 16,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Text('Create up to 3 tiers for your community',
              style: TextStyle(color: KodaColors.text3, fontSize: 13)),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda,
                foregroundColor: Colors.black),
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Create First Tier'),
            onPressed: _showCreateTierDialog,
          ),
        ]),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _tiers.length,
      itemBuilder: (_, i) => _buildOwnerTierCard(_tiers[i]),
    );
  }

  Widget _buildOwnerTierCard(Map<String, dynamic> tier) {
    final price = (tier['price_cents'] as int? ?? 0) / 100.0;
    final discount = tier['marketplace_discount_percent'] as int? ?? 0;
    final position = tier['position'] as int? ?? 1;

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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
          ),
          child: Row(children: [
            Container(
              width: 28, height: 28,
              decoration: BoxDecoration(
                color: KodaColors.koda.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(child: Text('$position',
                  style: const TextStyle(color: KodaColors.koda,
                      fontWeight: FontWeight.w700))),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(tier['name'] as String? ?? '',
                  style: const TextStyle(color: KodaColors.text1,
                      fontSize: 15, fontWeight: FontWeight.w700)),
            ),
            Text('\$${price.toStringAsFixed(2)}/mo',
                style: const TextStyle(color: KodaColors.koda,
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
                  style: const TextStyle(color: KodaColors.text2, fontSize: 13)),
              const SizedBox(height: 8),
            ],
            Row(children: [
              if (tier['role_id'] != null) ...[
                const Icon(Icons.badge_outlined, size: 14, color: KodaColors.text3),
                const SizedBox(width: 4),
                const Text('Role auto-assigned',
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(width: 12),
              ],
              if (discount > 0) ...[
                const Icon(Icons.local_offer_outlined,
                    size: 14, color: KodaColors.text3),
                const SizedBox(width: 4),
                Text('$discount% marketplace discount',
                    style: const TextStyle(color: KodaColors.text3, fontSize: 12)),
              ],
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: KodaColors.text2,
                    side: const BorderSide(color: KodaColors.border),
                  ),
                  icon: const Icon(Icons.edit_outlined, size: 14),
                  label: const Text('Edit'),
                  onPressed: () => _showEditTierDialog(tier),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: KodaColors.accent,
                  side: const BorderSide(color: KodaColors.accent),
                ),
                icon: const Icon(Icons.delete_outline, size: 14),
                label: const Text('Delete'),
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
    if (_tiers.isEmpty) {
      return const Center(child: Text('This server has no subscription tiers',
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
              color: KodaColors.koda.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: KodaColors.koda.withOpacity(0.3)),
            ),
            child: Row(children: [
              const Icon(Icons.check_circle, color: KodaColors.koda, size: 20),
              const SizedBox(width: 10),
              Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Active Subscriber',
                    style: TextStyle(color: KodaColors.koda,
                        fontWeight: FontWeight.w600)),
                Text('Expires ${_formatDate(_mySubscription!['expires_at'])}',
                    style: const TextStyle(
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
                  style: const TextStyle(color: KodaColors.text1,
                      fontSize: 16, fontWeight: FontWeight.w700)),
            ),
            Text('\$${price.toStringAsFixed(2)}/mo',
                style: const TextStyle(color: KodaColors.koda,
                    fontSize: 16, fontWeight: FontWeight.w700)),
          ]),
          if (tier['description'] != null &&
              (tier['description'] as String).isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(tier['description'] as String,
                style: const TextStyle(color: KodaColors.text2, fontSize: 13)),
          ],
          const SizedBox(height: 10),

          // Perks
          if (tier['role_id'] != null)
            _perkRow(Icons.badge_outlined, 'Exclusive subscriber role'),
          if (discount > 0)
            _perkRow(Icons.local_offer_outlined,
                '$discount% off marketplace purchases'),
          _perkRow(Icons.lock_open_outlined, 'Subscriber-only channels'),

          const SizedBox(height: 14),

          if (isSubscribed)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: KodaColors.koda.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Currently Subscribed',
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
              child: Text('Subscribe for \$${price.toStringAsFixed(2)}/mo'),
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
        Text(text, style: const TextStyle(color: KodaColors.text2, fontSize: 12)),
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
    final nameCtrl = TextEditingController(text: existing?['name'] ?? '');
    final descCtrl = TextEditingController(text: existing?['description'] ?? '');
    final priceCtrl = TextEditingController(
        text: existing != null
            ? ((existing['price_cents'] as int) / 100.0).toStringAsFixed(2)
            : '');
    int discount = existing?['marketplace_discount_percent'] as int? ?? 0;
    int position = existing?['position'] as int? ?? (_tiers.length + 1);

    final saved = await showDialog<bool>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(existing == null ? 'Create Tier' : 'Edit Tier',
              style: const TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 360,
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                KodaTextField(controller: nameCtrl, hintText: 'Tier name (e.g. Fan, Supporter, VIP)'),
                const SizedBox(height: 10),
                KodaTextField(controller: descCtrl, hintText: 'Description (optional)'),
                const SizedBox(height: 10),
                KodaTextField(controller: priceCtrl, hintText: 'Price per month (USD)'),
                const SizedBox(height: 12),
                const Text('Marketplace discount %',
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
                      style: const TextStyle(color: KodaColors.text1,
                          fontWeight: FontWeight.w600)),
                ]),
                const SizedBox(height: 8),
                const Text('Position',
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 4),
                DropdownButton<int>(
                  value: position,
                  dropdownColor: KodaColors.card,
                  style: const TextStyle(color: KodaColors.text1),
                  onChanged: (v) => setDialogState(() => position = v!),
                  items: [1, 2, 3].map((p) => DropdownMenuItem(
                    value: p,
                    child: Text('Tier $p'),
                  )).toList(),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Tip: Assign a role in server settings to automatically grant subscribers access to subscriber-only channels.',
                  style: TextStyle(color: KodaColors.text3, fontSize: 11),
                ),
              ]),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: KodaColors.koda,
                  foregroundColor: Colors.black),
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(existing == null ? 'Create' : 'Save'),
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
      final tier = await KodaApi.instance.createServerSubscriptionTier(
        widget.server['id'] as String,
        {
          'name':                         nameCtrl.text.trim(),
          'description':                  descCtrl.text.trim(),
          'price_cents':                  priceCents,
          'marketplace_discount_percent': discount,
          'position':                     position,
        },
      );
      if (tier != null && mounted) _load();
    } else {
      final ok = await KodaApi.instance.updateServerSubscriptionTier(
        existing['id'] as String,
        {
          'name':                         nameCtrl.text.trim(),
          'description':                  descCtrl.text.trim(),
          'price_cents':                  priceCents,
          'marketplace_discount_percent': discount,
          'position':                     position,
        },
      );
      if (ok && mounted) _load();
    }
  }

  Future<void> _deleteTier(Map<String, dynamic> tier) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: const Text('Delete Tier',
            style: TextStyle(color: KodaColors.text1)),
        content: Text('Delete "${tier['name']}"? Existing subscribers will keep access until expiry.',
            style: const TextStyle(color: KodaColors.text2)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete',
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
    final price = (tier['price_cents'] as int? ?? 0) / 100.0;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text('Subscribe to ${tier['name']}',
            style: const TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: KodaColors.elevated,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Monthly subscription',
                    style: TextStyle(color: KodaColors.text2)),
                Text('\$${price.toStringAsFixed(2)}',
                    style: const TextStyle(color: KodaColors.text1,
                        fontWeight: FontWeight.w600)),
              ]),
              const Divider(color: KodaColors.border, height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Server bank earns',
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                Text('${((tier['price_cents'] as int) * 0.05).round()} pts',
                    style: const TextStyle(color: KodaColors.koda, fontSize: 12)),
              ]),
            ]),
          ),
          const SizedBox(height: 10),
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
            child: const Text('Subscribe'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;
    final result = await KodaApi.instance.subscribeToServerTier(
        tier['id'] as String);
    if (result != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Subscription initiated — Stripe payment coming soon')));
      _load();
    }
  }

  String _formatDate(dynamic raw) {
    if (raw == null) return '';
    try {
      final dt = DateTime.parse(raw.toString()).toLocal();
      return '${dt.month}/${dt.day}/${dt.year}';
    } catch (_) { return ''; }
  }
}