// lib/features/marketplace/printful_merch_screen.dart
//
// Printful merch: browse + buy a creator's synced catalog (buyer mode),
// or sync from Printful and publish/unpublish products (creator mode).
// Mirrors DigitalGoodsScreen's creatorMode shape. Pricing always mirrors
// whatever retail price is set in the creator's own Printful dashboard --
// this screen never lets anyone edit it. Fulfillment order placement and
// the 95/5 Stripe Connect split happen server-side
// (Koda.Printful.create_order_intent/5); this screen only collects the
// cart + shipping address and hands off to Stripe Checkout the same way
// every other paid flow in this app does (see launchCheckoutAndWait).

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api.dart';
import '../../core/checkout.dart';
import '../../core/permissions.dart';
import '../../core/providers.dart';
import '../../core/theme.dart';
import '../../shared/shipping_address_form.dart';

class PrintfulMerchScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic>? server;
  final bool creatorMode;
  const PrintfulMerchScreen({super.key, this.server, this.creatorMode = false});
  @override
  ConsumerState<PrintfulMerchScreen> createState() => _PrintfulMerchScreenState();
}

class _PrintfulMerchScreenState extends ConsumerState<PrintfulMerchScreen> {
  List<Map<String, dynamic>> _products = [];
  bool _loading = true;
  bool _syncing = false;
  late bool _creatorMode = widget.creatorMode;
  bool _canManageMarketplace = false;

  String? get _serverId => widget.server?['id'] as String?;

  @override
  void initState() {
    super.initState();
    _load();
    _loadPermission();
  }

  Future<void> _loadPermission() async {
    final user = ref.read(authProvider).user;
    final canManage = await hasServerPermission(widget.server, 'manage_marketplace',
        currentUserId: user?.id, isKodaAdmin: user?.isAdmin ?? false);
    if (mounted) setState(() => _canManageMarketplace = canManage);
  }

  Future<void> _load() async {
    final serverId = _serverId;
    if (serverId == null) { setState(() => _loading = false); return; }
    setState(() => _loading = true);
    final products = _creatorMode
        ? await KodaApi.instance.getPrintfulCatalog(serverId)
        : await KodaApi.instance.getPrintfulMerch(serverId);
    if (!mounted) return;
    setState(() { _products = products; _loading = false; });
  }

  void _toggleCreatorMode() {
    setState(() => _creatorMode = !_creatorMode);
    _load();
  }

  Future<void> _sync() async {
    final serverId = _serverId;
    if (serverId == null) return;
    setState(() => _syncing = true);
    final products = await KodaApi.instance.syncPrintfulCatalog(serverId);
    if (!mounted) return;
    setState(() => _syncing = false);
    if (products != null) {
      setState(() => _products = products);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Synced ${products.length} product${products.length == 1 ? '' : 's'} from Printful')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not sync with Printful -- check the connection in Merch settings.')));
    }
  }

  Future<void> _togglePublish(Map<String, dynamic> product) async {
    final serverId = _serverId;
    if (serverId == null) return;
    final next = product['published'] != true;
    final ok = await KodaApi.instance.setPrintfulProductPublished(
        serverId, product['id'] as String, next);
    if (ok && mounted) {
      setState(() => product['published'] = next);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_serverId == null) {
      return const Center(child: Text('Select a server to view its merch',
          style: TextStyle(color: KodaColors.text3)));
    }

    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(children: [
          Expanded(
            child: Text(
              _creatorMode ? 'Manage Merch Catalog' : 'Merch',
              style: const TextStyle(color: KodaColors.text1,
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          if (_creatorMode)
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: KodaColors.koda,
                side: const BorderSide(color: KodaColors.koda),
              ),
              icon: _syncing
                  ? const SizedBox(width: 14, height: 14,
                      child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                  : const Icon(Icons.sync, size: 16),
              label: Text(_syncing ? 'Syncing...' : 'Sync Catalog'),
              onPressed: _syncing ? null : _sync,
            ),
          if (_canManageMarketplace)
            IconButton(
              icon: Icon(_creatorMode ? Icons.storefront_outlined : Icons.inventory_2_outlined,
                  color: KodaColors.text2),
              tooltip: _creatorMode ? 'Switch to Browse' : 'Manage this server\'s merch',
              onPressed: _toggleCreatorMode,
            ),
        ]),
      ),
      Expanded(
        child: _loading
            ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
            : _buildList(),
      ),
    ]);
  }

  Widget _buildList() {
    if (_products.isEmpty) {
      return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.storefront_outlined, color: KodaColors.text3, size: 48),
        const SizedBox(height: 12),
        Text(
          _creatorMode ? 'Nothing synced yet' : 'No merch available yet',
          style: const TextStyle(color: KodaColors.text1, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          _creatorMode
              ? 'Sync your Printful store to pull in your product catalog'
              : 'Check back later for merch from this server',
          style: const TextStyle(color: KodaColors.text3, fontSize: 13),
        ),
      ]));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _products.length,
      itemBuilder: (_, i) => _buildProductCard(_products[i]),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    final variants = List<Map<String, dynamic>>.from(product['variants'] ?? []);
    final inStock = variants.where((v) => v['in_stock'] == true).toList();
    final cheapest = inStock.isEmpty ? null : inStock.reduce((a, b) =>
        (a['retail_price_cents'] as int) <= (b['retail_price_cents'] as int) ? a : b);
    final published = product['published'] == true;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: KodaColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 56, height: 56,
              child: product['thumbnail_url'] != null
                  ? Image.network(product['thumbnail_url'] as String, fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const ColoredBox(color: KodaColors.elevated))
                  : const ColoredBox(color: KodaColors.elevated,
                      child: Icon(Icons.checkroom_outlined, color: KodaColors.text3)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(product['name'] as String? ?? '',
                  style: const TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w600),
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Text(
                cheapest == null
                    ? 'Out of stock'
                    : 'From \$${((cheapest['retail_price_cents'] as int) / 100).toStringAsFixed(2)} • ${inStock.length} option${inStock.length == 1 ? '' : 's'}',
                style: const TextStyle(color: KodaColors.text3, fontSize: 12),
              ),
            ]),
          ),
          const SizedBox(width: 8),
          if (_creatorMode)
            Switch(
              value: published,
              activeThumbColor: KodaColors.koda,
              onChanged: (_) => _togglePublish(product),
            )
          else
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
              onPressed: cheapest == null ? null : () => _openPurchaseDialog(product, inStock),
              child: const Text('Buy'),
            ),
        ]),
      ),
    );
  }

  Future<void> _openPurchaseDialog(
      Map<String, dynamic> product, List<Map<String, dynamic>> inStockVariants) async {
    await showDialog(
      context: context,
      builder: (_) => _PurchaseDialog(
        ref: ref,
        serverId: _serverId!,
        productName: product['name'] as String? ?? '',
        variants: inStockVariants,
      ),
    );
  }
}

// ── Purchase flow ──────────────────────────────────────────────────────────
//
// Own StatefulWidget (not an inline dialog closure) since it walks
// through several real steps with their own state: pick variant/qty ->
// enter shipping address -> get a real Printful shipping quote -> pick a
// rate -> pay. Each step's result (variant, address, rate) is real data
// the next step depends on, not just UI toggles.

enum _PurchaseStep { selectVariant, address, rates, placing }

class _PurchaseDialog extends StatefulWidget {
  final WidgetRef ref;
  final String serverId;
  final String productName;
  final List<Map<String, dynamic>> variants;
  const _PurchaseDialog({
    required this.ref,
    required this.serverId,
    required this.productName,
    required this.variants,
  });

  @override
  State<_PurchaseDialog> createState() => _PurchaseDialogState();
}

class _PurchaseDialogState extends State<_PurchaseDialog> {
  _PurchaseStep _step = _PurchaseStep.selectVariant;
  late Map<String, dynamic> _selectedVariant = widget.variants.first;
  int _quantity = 1;
  Map<String, dynamic> _address = {};
  List<Map<String, dynamic>> _rates = [];
  Map<String, dynamic>? _selectedRate;
  bool _loading = false;
  String? _error;

  List<Map<String, dynamic>> get _items => [
        {'variant_id': _selectedVariant['id'], 'quantity': _quantity},
      ];

  Future<void> _getRates() async {
    if (!ShippingAddressForm.isComplete(_address)) {
      setState(() => _error = 'Fill in your shipping address first.');
      return;
    }
    setState(() { _loading = true; _error = null; });
    final rates = await KodaApi.instance.getPrintfulShippingRates(
        widget.serverId, _items, _address);
    if (!mounted) return;
    setState(() {
      _loading = false;
      if (rates == null || rates.isEmpty) {
        _error = 'Could not get shipping rates for that address.';
      } else {
        _rates = rates;
        _selectedRate = rates.first;
        _step = _PurchaseStep.rates;
      }
    });
  }

  Future<void> _pay() async {
    final rate = _selectedRate;
    if (rate == null) return;
    setState(() { _loading = true; _error = null; });
    final result = await KodaApi.instance.createPrintfulOrder(
        widget.serverId, _items, _address, rate['id'] as String);
    if (!mounted) return;
    setState(() => _loading = false);

    final checkoutUrl = result?['checkout_url'] as String?;
    final orderId = result?['order_id'] as String?;
    if (checkoutUrl == null || orderId == null) {
      setState(() => _error = 'Could not start checkout. Try again in a moment.');
      return;
    }

    final rootContext = Navigator.of(context, rootNavigator: true).context;
    final messenger = ScaffoldMessenger.of(context);
    Navigator.pop(context);
    if (!rootContext.mounted) return;

    final confirmed = await launchCheckoutAndWait(rootContext, widget.ref,
        checkoutUrl: checkoutUrl,
        matches: (data) => data['payment_type'] == 'printful_order' && data['order_id'] == orderId);
    messenger.showSnackBar(SnackBar(content: Text(confirmed
        ? 'Order placed!'
        : 'Still waiting on that payment -- it\'ll be placed once completed.')));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: KodaColors.card,
      title: Text(widget.productName,
          style: const TextStyle(color: KodaColors.text1, fontSize: 16)),
      content: SizedBox(width: 360, child: _buildStep()),
      actions: _buildActions(),
    );
  }

  Widget _buildStep() {
    switch (_step) {
      case _PurchaseStep.selectVariant:
        return _buildVariantStep();
      case _PurchaseStep.address:
        return SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            ShippingAddressForm(onChanged: (a) => _address = a),
            if (_error != null) _buildError(),
          ]),
        );
      case _PurchaseStep.rates:
      case _PurchaseStep.placing:
        return _buildRatesStep();
    }
  }

  Widget _buildVariantStep() {
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Option', style: TextStyle(color: KodaColors.text3, fontSize: 12)),
      const SizedBox(height: 4),
      DropdownButton<String>(
        value: _selectedVariant['id'] as String,
        dropdownColor: KodaColors.card,
        isExpanded: true,
        style: const TextStyle(color: KodaColors.text1, fontSize: 13),
        onChanged: (id) => setState(() =>
            _selectedVariant = widget.variants.firstWhere((v) => v['id'] == id)),
        items: widget.variants.map((v) => DropdownMenuItem(
              value: v['id'] as String,
              child: Text('${v['name']} -- \$${((v['retail_price_cents'] as int) / 100).toStringAsFixed(2)}'),
            )).toList(),
      ),
      const SizedBox(height: 12),
      const Text('Quantity', style: TextStyle(color: KodaColors.text3, fontSize: 12)),
      const SizedBox(height: 4),
      Row(children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline, color: KodaColors.text2),
          onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
        ),
        Text('$_quantity', style: const TextStyle(color: KodaColors.text1, fontSize: 14)),
        IconButton(
          icon: const Icon(Icons.add_circle_outline, color: KodaColors.text2),
          onPressed: () => setState(() => _quantity++),
        ),
      ]),
    ]);
  }

  Widget _buildRatesStep() {
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Shipping speed', style: TextStyle(color: KodaColors.text3, fontSize: 12)),
      const SizedBox(height: 6),
      ..._rates.map((r) {
        final selected = _selectedRate?['id'] == r['id'];
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: GestureDetector(
            onTap: () => setState(() => _selectedRate = r),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: selected ? KodaColors.koda.withValues(alpha: 0.12) : KodaColors.elevated,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: selected ? KodaColors.koda : KodaColors.border),
              ),
              child: Row(children: [
                Icon(selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    size: 18, color: selected ? KodaColors.koda : KodaColors.text3),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(r['name'] as String? ?? '',
                        style: const TextStyle(color: KodaColors.text1, fontSize: 13)),
                    if (r['min_delivery_days'] != null)
                      Text('${r['min_delivery_days']}-${r['max_delivery_days']} business days',
                          style: const TextStyle(color: KodaColors.text3, fontSize: 11)),
                  ]),
                ),
                Text('\$${((r['rate_cents'] as int) / 100).toStringAsFixed(2)}',
                    style: const TextStyle(color: KodaColors.text1, fontSize: 13, fontWeight: FontWeight.w600)),
              ]),
            ),
          ),
        );
      }),
      if (_error != null) _buildError(),
    ]);
  }

  Widget _buildError() => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(_error!, style: const TextStyle(color: KodaColors.accent, fontSize: 12)),
      );

  List<Widget> _buildActions() {
    final cancel = TextButton(
      onPressed: _loading ? null : () => Navigator.pop(context),
      child: const Text('Cancel'),
    );

    switch (_step) {
      case _PurchaseStep.selectVariant:
        return [cancel, ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
          onPressed: () => setState(() => _step = _PurchaseStep.address),
          child: const Text('Next: Shipping'),
        )];
      case _PurchaseStep.address:
        return [cancel, ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
          onPressed: _loading ? null : _getRates,
          child: _loading
              ? const SizedBox(width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
              : const Text('Get Shipping Quote'),
        )];
      case _PurchaseStep.rates:
      case _PurchaseStep.placing:
        return [cancel, ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
          onPressed: _loading || _selectedRate == null ? null : _pay,
          child: _loading
              ? const SizedBox(width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
              : const Text('Pay'),
        )];
    }
  }
}
