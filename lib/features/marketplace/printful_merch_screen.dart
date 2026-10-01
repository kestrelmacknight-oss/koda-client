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
import '../../core/merch_cart.dart';
import '../../core/permissions.dart';
import '../../core/providers.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/shipping_address_form.dart';
import '../../shared/widgets.dart';

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
  bool _isOwner = false;

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
    // Payout-recipient assignment is owner-only (see
    // printful_controller.ex's set_payout_recipient/2) -- deliberately
    // stricter than _canManageMarketplace above, which also covers
    // non-owner mods who hold manage_marketplace. widget.server only
    // carries owner_id when this screen was reached through a server's
    // own creator-management entry point, not from the platform-wide
    // Koda Marketplace browse screen -- so this is naturally false
    // there too, same as _canManageMarketplace.
    final isOwner = widget.server?['owner_id'] != null &&
        widget.server!['owner_id'] == user?.id;
    if (mounted) setState(() { _canManageMarketplace = canManage; _isOwner = isOwner; });
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
    // Captured before the `await` below, in case this widget is no longer
    // mounted by the time the request comes back.
    final t = AppLocalizations.of(context);
    final serverId = _serverId;
    if (serverId == null) return;
    setState(() => _syncing = true);
    final products = await KodaApi.instance.syncPrintfulCatalog(serverId);
    if (!mounted) return;
    setState(() => _syncing = false);
    if (products != null) {
      setState(() => _products = products);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.printfulMerchSyncedCount(products.length))));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.printfulMerchSyncFailed)));
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
    final t = AppLocalizations.of(context);
    if (_serverId == null) {
      return Center(child: Text(t.printfulMerchSelectServer,
          style: TextStyle(color: KodaColors.text3)));
    }

    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(children: [
          Expanded(
            child: Text(
              _creatorMode ? t.printfulMerchManageCatalogTitle : t.printfulMerchTitle,
              style: TextStyle(color: KodaColors.text1,
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          if (_creatorMode)
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: KodaColors.koda,
                side: BorderSide(color: KodaColors.koda),
              ),
              icon: _syncing
                  ? SizedBox(width: 14, height: 14,
                      child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                  : const Icon(Icons.sync, size: 16),
              label: Text(_syncing ? t.printfulMerchSyncingLabel : t.printfulMerchSyncCatalogButton),
              onPressed: _syncing ? null : _sync,
            ),
          if (!_creatorMode) _buildCartButton(),
          if (_canManageMarketplace)
            IconButton(
              icon: Icon(_creatorMode ? Icons.storefront_outlined : Icons.inventory_2_outlined,
                  color: KodaColors.text2),
              tooltip: _creatorMode ? t.printfulMerchSwitchToBrowseTooltip : t.printfulMerchManageTooltip,
              onPressed: _toggleCreatorMode,
            ),
        ]),
      ),
      Expanded(
        child: _loading
            ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
            : _buildList(),
      ),
    ]);
  }

  Widget _buildList() {
    final t = AppLocalizations.of(context);
    if (_products.isEmpty) {
      return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.storefront_outlined, color: KodaColors.text3, size: 48),
        const SizedBox(height: 12),
        Text(
          _creatorMode ? t.printfulMerchNothingSyncedYet : t.printfulMerchNoMerchAvailable,
          style: TextStyle(color: KodaColors.text1, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          _creatorMode
              ? t.printfulMerchSyncHint
              : t.printfulMerchCheckBackLater,
          style: TextStyle(color: KodaColors.text3, fontSize: 13),
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
    final t = AppLocalizations.of(context);
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 56, height: 56,
                child: product['thumbnail_url'] != null
                    ? Image.network(product['thumbnail_url'] as String, fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => ColoredBox(color: KodaColors.elevated))
                    : ColoredBox(color: KodaColors.elevated,
                        child: Icon(Icons.checkroom_outlined, color: KodaColors.text3)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(product['name'] as String? ?? '',
                    style: TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w600),
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text(
                  cheapest == null
                      ? t.printfulMerchOutOfStock
                      : t.printfulMerchFromPriceOptions(
                          formatMerchPrice(cheapest['retail_price_cents'] as int, cheapest['currency'] as String? ?? 'USD'),
                          inStock.length),
                  style: TextStyle(color: KodaColors.text3, fontSize: 12),
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
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    foregroundColor: KodaColors.koda, side: BorderSide(color: KodaColors.koda)),
                onPressed: cheapest == null ? null : () => _openProductDetail(product, inStock),
                child: Text(t.printfulMerchViewButton),
              ),
          ]),
          if (_creatorMode && _isOwner) ...[
            const Divider(height: 20),
            Row(children: [
              Icon(Icons.payments_outlined, size: 14, color: KodaColors.text3),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  product['payout_username'] != null
                      ? t.printfulMerchPayoutTo(product['payout_username'] as String)
                      : t.printfulMerchPayoutToYou,
                  style: TextStyle(color: KodaColors.text3, fontSize: 12),
                ),
              ),
              TextButton(
                onPressed: () => _showPayoutDialog(product),
                child: Text(t.printfulMerchPayoutChangeButton,
                    style: TextStyle(color: KodaColors.koda, fontSize: 12)),
              ),
            ]),
          ],
        ]),
      ),
    );
  }

  Future<void> _showPayoutDialog(Map<String, dynamic> product) async {
    final t = AppLocalizations.of(context);
    final serverId = _serverId;
    if (serverId == null) return;
    final ctrl = TextEditingController();
    Map<String, dynamic>? resolved;
    String? error;

    final confirmedUserId = await showDialog<String?>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(t.printfulMerchPayoutDialogTitle, style: TextStyle(color: KodaColors.text1)),
          content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(t.printfulMerchPayoutDialogBody,
                style: TextStyle(color: KodaColors.text3, fontSize: 12)),
            const SizedBox(height: 12),
            KodaTextField(controller: ctrl, hintText: t.printfulMerchPayoutUsernameHint),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () async {
                final user = await KodaApi.instance.getUserByUsername(ctrl.text.trim());
                setDialogState(() {
                  resolved = user;
                  error = user == null ? t.printfulMerchPayoutUserNotFound : null;
                });
              },
              child: Text(t.printfulMerchPayoutLookupButton),
            ),
            if (resolved != null)
              Text(t.printfulMerchPayoutResolvedAs(resolved!['username'] as String),
                  style: TextStyle(color: KodaColors.koda, fontSize: 12)),
            if (error != null)
              Text(error!, style: TextStyle(color: KodaColors.accent, fontSize: 12)),
          ]),
          actions: [
            if (product['payout_user_id'] != null)
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, ''),
                child: Text(t.printfulMerchPayoutResetButton,
                    style: TextStyle(color: KodaColors.accent)),
              ),
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, null),
              child: Text(t.commonCancel),
            ),
            TextButton(
              onPressed: resolved == null ? null : () => Navigator.pop(dialogContext, resolved!['id'] as String),
              child: Text(t.commonSave),
            ),
          ],
        ),
      ),
    );

    if (confirmedUserId == null || !mounted) return;
    // '' is the Reset sentinel -- null means cleared on the server.
    final payoutUserId = confirmedUserId.isEmpty ? null : confirmedUserId;
    final ok = await KodaApi.instance.setProductPayoutRecipient(serverId, product['id'] as String, payoutUserId);
    if (ok && mounted) {
      setState(() {
        product['payout_user_id'] = payoutUserId;
        product['payout_username'] = payoutUserId == null ? null : resolved?['username'];
      });
    }
  }

  Widget _buildCartButton() {
    return Consumer(builder: (context, ref, _) {
      final t = AppLocalizations.of(context);
      final cart = ref.watch(merchCartProvider);
      final count = cart.serverId == _serverId ? cart.totalItems : 0;
      return Stack(clipBehavior: Clip.none, children: [
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined, color: KodaColors.text2),
          tooltip: t.printfulMerchCartTooltip,
          onPressed: _openCart,
        ),
        if (count > 0)
          Positioned(
            right: 4, top: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              decoration: BoxDecoration(
                color: KodaColors.accent,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text('$count',
                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
            ),
          ),
      ]);
    });
  }

  Future<void> _openProductDetail(
      Map<String, dynamic> product, List<Map<String, dynamic>> inStockVariants) async {
    await showDialog(
      context: context,
      builder: (_) => _ProductDetailDialog(
        ref: ref,
        serverId: _serverId!,
        productName: product['name'] as String? ?? '',
        productThumbnailUrl: product['thumbnail_url'] as String?,
        variants: inStockVariants,
      ),
    );
  }

  Future<void> _openCart() async {
    await showDialog(
      context: context,
      builder: (_) => _CartDialog(ref: ref, serverId: _serverId!),
    );
  }
}

// ── Product detail + variant picker ─────────────────────────────────────────

/// Attempts to split every variant's name into (style, size) on the
/// common Printful sync-variant naming convention ("Style / Size" or
/// "Color / Size"). Returns null if the split isn't clean --
/// inconsistent part counts, or fewer than 2 variants -- so callers
/// fall back to a flat list rather than showing a misleading grid.
class _VariantGrid {
  final List<String> styles;
  final List<String> sizes;
  final Map<String, Map<String, dynamic>> _byKey; // "style|size" -> variant
  _VariantGrid(this.styles, this.sizes, this._byKey);

  Map<String, dynamic>? variantFor(String style, String size) => _byKey['$style|$size'];
}

_VariantGrid? _parseVariantGrid(List<Map<String, dynamic>> variants) {
  if (variants.length < 2) return null;
  final parts = variants
      .map((v) => (v['name'] as String? ?? '').split(' / ').map((s) => s.trim()).toList())
      .toList();
  final partCount = parts.first.length;
  if (partCount < 2 || parts.any((p) => p.length != partCount)) return null;

  final styles = <String>[];
  final sizes = <String>[];
  final byKey = <String, Map<String, dynamic>>{};
  for (var i = 0; i < variants.length; i++) {
    final p = parts[i];
    final size = p.last;
    final style = p.sublist(0, p.length - 1).join(' / ');
    if (!styles.contains(style)) styles.add(style);
    if (!sizes.contains(size)) sizes.add(size);
    byKey['$style|$size'] = variants[i];
  }
  return _VariantGrid(styles, sizes, byKey);
}

class _ProductDetailDialog extends StatefulWidget {
  final WidgetRef ref;
  final String serverId;
  final String productName;
  final String? productThumbnailUrl;
  final List<Map<String, dynamic>> variants;
  const _ProductDetailDialog({
    required this.ref,
    required this.serverId,
    required this.productName,
    required this.productThumbnailUrl,
    required this.variants,
  });

  @override
  State<_ProductDetailDialog> createState() => _ProductDetailDialogState();
}

class _ProductDetailDialogState extends State<_ProductDetailDialog> {
  late Map<String, dynamic> _selectedVariant = widget.variants.first;
  int _quantity = 1;
  _VariantGrid? _grid;
  String? _selectedStyle;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    _grid = _parseVariantGrid(widget.variants);
    final grid = _grid;
    if (grid != null) {
      // Start the chips in sync with whichever variant is initially
      // selected, rather than defaulting to the grid's first style/size.
      for (final style in grid.styles) {
        for (final size in grid.sizes) {
          if (grid.variantFor(style, size)?['id'] == _selectedVariant['id']) {
            _selectedStyle = style;
            _selectedSize = size;
          }
        }
      }
    }
  }

  void _pickStyle(String style) {
    setState(() {
      _selectedStyle = style;
      final v = _grid!.variantFor(style, _selectedSize ?? '');
      if (v != null) _selectedVariant = v;
    });
  }

  void _pickSize(String size) {
    setState(() {
      _selectedSize = size;
      final v = _grid!.variantFor(_selectedStyle ?? '', size);
      if (v != null) _selectedVariant = v;
    });
  }

  void _addToCart() {
    // Captured before `Navigator.pop` below invalidates this context.
    final t = AppLocalizations.of(context);
    widget.ref.read(merchCartProvider.notifier).addItem(
          serverId: widget.serverId,
          variantId: _selectedVariant['id'] as String,
          productName: widget.productName,
          variantName: _selectedVariant['name'] as String? ?? '',
          imageUrl: (_selectedVariant['image_url'] as String?) ?? widget.productThumbnailUrl,
          unitPriceCents: _selectedVariant['retail_price_cents'] as int,
          currency: _selectedVariant['currency'] as String? ?? 'USD',
          quantity: _quantity,
        );
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.printfulMerchAddedToCart(widget.productName))));
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final imageUrl = (_selectedVariant['image_url'] as String?) ?? widget.productThumbnailUrl;
    final priceText = formatMerchPrice(_selectedVariant['retail_price_cents'] as int,
        _selectedVariant['currency'] as String? ?? 'USD');

    return Dialog(
      backgroundColor: KodaColors.card,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420, maxHeight: 640),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 1,
                child: imageUrl != null
                    ? Image.network(imageUrl, fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => ColoredBox(color: KodaColors.elevated,
                            child: Icon(Icons.checkroom_outlined, color: KodaColors.text3, size: 48)))
                    : ColoredBox(color: KodaColors.elevated,
                        child: Icon(Icons.checkroom_outlined, color: KodaColors.text3, size: 48)),
              ),
            ),
            const SizedBox(height: 16),
            Text(widget.productName,
                style: TextStyle(color: KodaColors.text1, fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(priceText,
                style: TextStyle(color: KodaColors.koda, fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            if (widget.variants.length > 1) _buildVariantPicker(),
            const SizedBox(height: 16),
            Text(t.printfulMerchQuantityLabel, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
            const SizedBox(height: 4),
            Row(children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline, color: KodaColors.text2),
                tooltip: t.printfulMerchDecreaseQuantityTooltip,
                onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
              ),
              Text('$_quantity', style: TextStyle(color: KodaColors.text1, fontSize: 14)),
              IconButton(
                icon: Icon(Icons.add_circle_outline, color: KodaColors.text2),
                tooltip: t.printfulMerchIncreaseQuantityTooltip,
                onPressed: () => setState(() => _quantity++),
              ),
            ]),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(foregroundColor: KodaColors.text2),
                  onPressed: () => Navigator.pop(context),
                  child: Text(t.commonCancel),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
                  onPressed: _addToCart,
                  child: Text(t.printfulMerchAddToCartButton),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }

  Widget _buildVariantPicker() {
    final t = AppLocalizations.of(context);
    final grid = _grid;
    if (grid == null) {
      // Fallback for products whose variant names don't split cleanly
      // into style/size -- same flat dropdown the app already had.
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(t.printfulMerchOptionLabel, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
        const SizedBox(height: 4),
        DropdownButton<String>(
          value: _selectedVariant['id'] as String,
          dropdownColor: KodaColors.card,
          isExpanded: true,
          style: TextStyle(color: KodaColors.text1, fontSize: 13),
          onChanged: (id) => setState(() =>
              _selectedVariant = widget.variants.firstWhere((v) => v['id'] == id)),
          items: widget.variants.map((v) => DropdownMenuItem(
                value: v['id'] as String,
                child: Text(t.printfulMerchVariantPriceOption(v['name'] as String? ?? '',
                    formatMerchPrice(v['retail_price_cents'] as int, v['currency'] as String? ?? 'USD'))),
              )).toList(),
        ),
      ]);
    }

    Widget chipRow(String label, List<String> options, String? selectedValue,
        bool Function(String) isAvailable, void Function(String) onPick) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
        const SizedBox(height: 6),
        Wrap(spacing: 8, runSpacing: 8, children: options.map((opt) {
          final selected = selectedValue == opt;
          final available = isAvailable(opt);
          return ChoiceChip(
            label: Text(opt),
            selected: selected,
            onSelected: available ? (_) => onPick(opt) : null,
            selectedColor: KodaColors.koda,
            backgroundColor: KodaColors.elevated,
            labelStyle: TextStyle(
                color: selected ? Colors.black : (available ? KodaColors.text1 : KodaColors.text3),
                fontSize: 12),
          );
        }).toList()),
        const SizedBox(height: 12),
      ]);
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (grid.styles.length > 1)
        chipRow(t.printfulMerchStyleLabel, grid.styles, _selectedStyle,
            (style) => grid.variantFor(style, _selectedSize ?? '') != null, _pickStyle),
      if (grid.sizes.length > 1)
        chipRow(t.printfulMerchSizeLabel, grid.sizes, _selectedSize,
            (size) => grid.variantFor(_selectedStyle ?? '', size) != null, _pickSize),
    ]);
  }
}

// ── Cart ─────────────────────────────────────────────────────────────────

class _CartDialog extends StatelessWidget {
  final WidgetRef ref;
  final String serverId;
  const _CartDialog({required this.ref, required this.serverId});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final cart = ref.watch(merchCartProvider);
    final items = cart.serverId == serverId ? cart.items : <CartItem>[];

    return AlertDialog(
      backgroundColor: KodaColors.card,
      title: Text(t.printfulMerchYourCartTitle, style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      content: SizedBox(
        width: 380,
        child: items.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(t.printfulMerchCartEmpty, style: TextStyle(color: KodaColors.text3)),
              )
            : Column(mainAxisSize: MainAxisSize.min, children: [
                ...items.map((item) => _buildCartRow(t, item)),
                const Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(t.printfulMerchSubtotalLabel, style: TextStyle(color: KodaColors.text2, fontSize: 13)),
                  // One Printful store has one currency -- every line in
                  // this (single-store, see merch_cart.dart) cart shares it.
                  Text(formatMerchPrice(cart.subtotalCents, items.first.currency),
                      style: TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w700)),
                ]),
              ]),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(t.commonClose)),
        if (items.isNotEmpty)
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) => _CheckoutDialog(ref: ref, serverId: serverId, items: items),
              );
            },
            child: Text(t.printfulMerchCheckoutLabel),
          ),
      ],
    );
  }

  Widget _buildCartRow(AppLocalizations t, CartItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: SizedBox(
            width: 40, height: 40,
            child: item.imageUrl != null
                ? Image.network(item.imageUrl!, fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => ColoredBox(color: KodaColors.elevated))
                : ColoredBox(color: KodaColors.elevated,
                    child: Icon(Icons.checkroom_outlined, size: 16, color: KodaColors.text3)),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(item.productName,
                style: TextStyle(color: KodaColors.text1, fontSize: 13),
                maxLines: 1, overflow: TextOverflow.ellipsis),
            Text(item.variantName, style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          ]),
        ),
        IconButton(
          icon: Icon(Icons.remove_circle_outline, size: 18, color: KodaColors.text2),
          tooltip: t.printfulMerchDecreaseQuantityTooltip,
          onPressed: item.quantity > 1
              ? () => ref.read(merchCartProvider.notifier).updateQuantity(item.variantId, item.quantity - 1)
              : null,
        ),
        Text('${item.quantity}', style: TextStyle(color: KodaColors.text1, fontSize: 13)),
        IconButton(
          icon: Icon(Icons.add_circle_outline, size: 18, color: KodaColors.text2),
          tooltip: t.printfulMerchIncreaseQuantityTooltip,
          onPressed: () => ref.read(merchCartProvider.notifier).updateQuantity(item.variantId, item.quantity + 1),
        ),
        IconButton(
          icon: Icon(Icons.delete_outline, size: 18, color: KodaColors.accent),
          tooltip: t.printfulMerchRemoveFromCartTooltip,
          onPressed: () => ref.read(merchCartProvider.notifier).removeItem(item.variantId),
        ),
      ]),
    );
  }
}

// ── Checkout flow ──────────────────────────────────────────────────────────
//
// Own StatefulWidget (not an inline dialog closure) since it walks
// through several real steps with their own state: enter shipping
// address -> get a real Printful shipping quote -> pick a rate -> pay.
// Each step's result (address, rate) is real data the next step
// depends on, not just UI toggles. Seeded from the cart's items --
// variant/quantity selection already happened in _ProductDetailDialog.

enum _CheckoutStep { address, rates, placing }

class _CheckoutDialog extends StatefulWidget {
  final WidgetRef ref;
  final String serverId;
  final List<CartItem> items;
  const _CheckoutDialog({
    required this.ref,
    required this.serverId,
    required this.items,
  });

  @override
  State<_CheckoutDialog> createState() => _CheckoutDialogState();
}

class _CheckoutDialogState extends State<_CheckoutDialog> {
  _CheckoutStep _step = _CheckoutStep.address;
  Map<String, dynamic> _address = {};
  List<Map<String, dynamic>> _rates = [];
  Map<String, dynamic>? _selectedRate;
  bool _loading = false;
  String? _error;

  List<Map<String, dynamic>> get _items => widget.items.map((i) => i.toOrderItem()).toList();

  Future<void> _getRates() async {
    // Captured before the `await` below, in case this widget is no longer
    // mounted by the time the request comes back.
    final t = AppLocalizations.of(context);
    if (!ShippingAddressForm.isComplete(_address)) {
      setState(() => _error = t.printfulMerchFillShippingAddressFirst);
      return;
    }
    setState(() { _loading = true; _error = null; });
    final rates = await KodaApi.instance.getPrintfulShippingRates(
        widget.serverId, _items, _address);
    if (!mounted) return;
    setState(() {
      _loading = false;
      if (rates == null || rates.isEmpty) {
        _error = t.printfulMerchCouldNotGetShippingRates;
      } else {
        _rates = rates;
        _selectedRate = rates.first;
        _step = _CheckoutStep.rates;
      }
    });
  }

  Future<void> _pay() async {
    // Captured before `Navigator.pop` below invalidates this context.
    final t = AppLocalizations.of(context);
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
      setState(() => _error = t.printfulMerchCouldNotStartCheckout);
      return;
    }

    final rootContext = Navigator.of(context, rootNavigator: true).context;
    final messenger = ScaffoldMessenger.of(context);
    Navigator.pop(context);
    if (!rootContext.mounted) return;

    final confirmed = await launchCheckoutAndWait(rootContext, widget.ref,
        checkoutUrl: checkoutUrl,
        matches: (data) => data['payment_type'] == 'printful_order' && data['order_id'] == orderId);
    if (confirmed) widget.ref.read(merchCartProvider.notifier).clear();
    messenger.showSnackBar(SnackBar(content: Text(confirmed
        ? t.printfulMerchOrderPlaced
        : t.printfulMerchOrderPending)));
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return AlertDialog(
      backgroundColor: KodaColors.card,
      title: Text(t.printfulMerchCheckoutLabel, style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      content: SizedBox(width: 360, child: _buildStep(t)),
      actions: _buildActions(t),
    );
  }

  Widget _buildStep(AppLocalizations t) {
    switch (_step) {
      case _CheckoutStep.address:
        return SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            ShippingAddressForm(onChanged: (a) => _address = a),
            if (_error != null) _buildError(),
          ]),
        );
      case _CheckoutStep.rates:
      case _CheckoutStep.placing:
        return _buildRatesStep(t);
    }
  }

  Widget _buildRatesStep(AppLocalizations t) {
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(t.printfulMerchShippingSpeedLabel, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
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
                        style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                    if (r['min_delivery_days'] != null)
                      Text(t.printfulMerchBusinessDaysRange(
                              r['min_delivery_days'] as int, r['max_delivery_days'] as int),
                          style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                  ]),
                ),
                Text(formatMerchPrice(r['rate_cents'] as int, r['currency'] as String? ?? 'USD'),
                    style: TextStyle(color: KodaColors.text1, fontSize: 13, fontWeight: FontWeight.w600)),
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
        child: Text(_error!, style: TextStyle(color: KodaColors.accent, fontSize: 12)),
      );

  List<Widget> _buildActions(AppLocalizations t) {
    final cancel = TextButton(
      onPressed: _loading ? null : () => Navigator.pop(context),
      child: Text(t.commonCancel),
    );

    switch (_step) {
      case _CheckoutStep.address:
        return [cancel, ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
          onPressed: _loading ? null : _getRates,
          child: _loading
              ? const SizedBox(width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
              : Text(t.printfulMerchGetShippingQuoteButton),
        )];
      case _CheckoutStep.rates:
      case _CheckoutStep.placing:
        return [cancel, ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
          onPressed: _loading || _selectedRate == null ? null : _pay,
          child: _loading
              ? const SizedBox(width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
              : Text(t.printfulMerchPayButton),
        )];
    }
  }
}
