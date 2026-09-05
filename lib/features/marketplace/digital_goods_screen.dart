// lib/features/marketplace/digital_goods_screen.dart
//
// Digital products listing — browse, purchase, download.
// Creator view: create/manage products, upload license keys.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/api.dart';
import '../../core/providers.dart';
import '../../core/theme.dart';
import '../../shared/widgets.dart';

class DigitalGoodsScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic>? server;
  final bool creatorMode;
  const DigitalGoodsScreen({super.key, this.server, this.creatorMode = false});
  @override
  ConsumerState<DigitalGoodsScreen> createState() => _DigitalGoodsScreenState();
}

class _DigitalGoodsScreenState extends ConsumerState<DigitalGoodsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> _myPurchases = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: widget.creatorMode ? 2 : 2, vsync: this);
    _load();
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final user = ref.read(authProvider).user;
    final products = await KodaApi.instance.getProducts(
      serverId: widget.server?['id'] as String?,
      creatorId: widget.creatorMode ? user?.id : null,
    );
    final purchases = await KodaApi.instance.getMyPurchases();
    if (!mounted) return;
    setState(() {
      _products = products;
      _myPurchases = purchases;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(
          widget.creatorMode ? 'My Products' : 'Digital Goods',
          style: const TextStyle(color: KodaColors.text1,
              fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          if (widget.creatorMode)
            IconButton(
              icon: const Icon(Icons.add, color: KodaColors.koda),
              onPressed: _showCreateProductDialog,
            ),
        ],
        bottom: TabBar(
          controller: _tabs,
          indicatorColor: KodaColors.koda,
          labelColor: KodaColors.text1,
          unselectedLabelColor: KodaColors.text3,
          tabs: [
            Tab(text: widget.creatorMode ? 'My Listings' : 'Browse'),
            const Tab(text: 'My Purchases'),
          ],
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : TabBarView(
              controller: _tabs,
              children: [
                _buildProductsTab(),
                _buildPurchasesTab(),
              ],
            ),
    );
  }

  // ── Products tab ──────────────────────────────────────────────────────────

  Widget _buildProductsTab() {
    if (_products.isEmpty) {
      return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.storefront_outlined, color: KodaColors.text3, size: 48),
        const SizedBox(height: 12),
        Text(
          widget.creatorMode ? 'No products yet' : 'No products available',
          style: const TextStyle(color: KodaColors.text1, fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          widget.creatorMode
              ? 'Create your first product to start selling'
              : 'Check back later for digital goods',
          style: const TextStyle(color: KodaColors.text3, fontSize: 13),
        ),
        if (widget.creatorMode) ...[
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda,
                foregroundColor: Colors.black),
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Create Product'),
            onPressed: _showCreateProductDialog,
          ),
        ],
      ]));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _products.length,
      itemBuilder: (_, i) => _buildProductCard(_products[i]),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    final price = (product['price_cents'] as int? ?? 0) / 100.0;
    final isFree = product['price_cents'] == 0;
    final freeForYou = product['free_for_you'] == true;
    final alreadyPurchased = product['already_purchased'] == true;
    final type = product['product_type'] as String? ?? 'file';
    final scope = product['scope'] as String? ?? 'server';

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
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: KodaColors.koda.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                type == 'license_key' ? Icons.key_outlined : Icons.download_outlined,
                color: KodaColors.koda, size: 20,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(product['title'] as String? ?? '',
                  style: const TextStyle(color: KodaColors.text1,
                      fontSize: 14, fontWeight: FontWeight.w600)),
              Row(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: KodaColors.elevated,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    type == 'license_key' ? 'License Key' : 'File',
                    style: const TextStyle(color: KodaColors.text3, fontSize: 10),
                  ),
                ),
                if (scope == 'creator') ...[
                  const SizedBox(width: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: KodaColors.elevated,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('All Servers',
                        style: TextStyle(color: KodaColors.text3, fontSize: 10)),
                  ),
                ],
              ]),
            ])),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              if (freeForYou)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: KodaColors.koda.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('Free for you',
                      style: TextStyle(color: KodaColors.koda,
                          fontSize: 11, fontWeight: FontWeight.w600)),
                )
              else if (isFree)
                const Text('Free', style: TextStyle(color: KodaColors.koda,
                    fontSize: 15, fontWeight: FontWeight.w700))
              else
                Text('\$${price.toStringAsFixed(2)}',
                    style: const TextStyle(color: KodaColors.text1,
                        fontSize: 15, fontWeight: FontWeight.w700)),
              if (product['purchase_count'] != null)
                Text('${product['purchase_count']} sold',
                    style: const TextStyle(color: KodaColors.text3, fontSize: 11)),
            ]),
          ]),

          if (product['description'] != null &&
              (product['description'] as String).isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(product['description'] as String,
                style: const TextStyle(color: KodaColors.text2, fontSize: 12),
                maxLines: 2, overflow: TextOverflow.ellipsis),
          ],

          const SizedBox(height: 12),

          Row(children: [
            if (widget.creatorMode) ...[
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: KodaColors.text2,
                    side: const BorderSide(color: KodaColors.border),
                  ),
                  icon: const Icon(Icons.edit_outlined, size: 14),
                  label: const Text('Edit'),
                  onPressed: () => _showEditProductDialog(product),
                ),
              ),
              const SizedBox(width: 8),
              if (type == 'license_key')
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: KodaColors.koda,
                    side: const BorderSide(color: KodaColors.koda),
                  ),
                  icon: const Icon(Icons.key_outlined, size: 14),
                  label: const Text('Keys'),
                  onPressed: () => _showLicenseKeysDialog(product),
                ),
            ] else ...[
              if (alreadyPurchased)
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KodaColors.elevated,
                      foregroundColor: KodaColors.koda,
                    ),
                    icon: const Icon(Icons.download_outlined, size: 16),
                    label: const Text('Download'),
                    onPressed: () => _downloadPurchase(product['id'] as String),
                  ),
                )
              else
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KodaColors.koda,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => _purchaseProduct(product),
                    child: Text(
                      isFree || freeForYou
                          ? 'Get for Free'
                          : 'Buy for \$${price.toStringAsFixed(2)}',
                    ),
                  ),
                ),
            ],
          ]),
        ]),
      ),
    );
  }

  // ── Purchases tab ─────────────────────────────────────────────────────────

  Widget _buildPurchasesTab() {
    if (_myPurchases.isEmpty) {
      return const Center(child: Text('No purchases yet',
          style: TextStyle(color: KodaColors.text3)));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _myPurchases.length,
      itemBuilder: (_, i) {
        final purchase = _myPurchases[i];
        final product = purchase['product'] as Map<String, dynamic>?;
        final token = purchase['download_token'] as String?;
        final key = purchase['license_key'] as String?;
        final expires = purchase['download_expires_at'] as String?;

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: KodaColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: KodaColors.border),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(product?['title'] as String? ?? 'Unknown Product',
                style: const TextStyle(color: KodaColors.text1,
                    fontWeight: FontWeight.w600, fontSize: 13)),
            const SizedBox(height: 4),
            Text('Purchased on ${_formatDate(purchase['purchased_at'])}',
                style: const TextStyle(color: KodaColors.text3, fontSize: 11)),

            if (key != null) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: KodaColors.elevated,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(children: [
                  const Icon(Icons.key_outlined, size: 14, color: KodaColors.koda),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(key,
                        style: const TextStyle(color: KodaColors.text1,
                            fontFamily: 'monospace', fontSize: 12)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy_outlined, size: 14,
                        color: KodaColors.text3),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: key));
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('License key copied')));
                    },
                  ),
                ]),
              ),
            ],

            if (token != null) ...[
              const SizedBox(height: 8),
              Row(children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KodaColors.koda,
                      foregroundColor: Colors.black,
                    ),
                    icon: const Icon(Icons.download_outlined, size: 16),
                    label: const Text('Download'),
                    onPressed: () => _downloadWithToken(token),
                  ),
                ),
                if (expires != null) ...[
                  const SizedBox(width: 8),
                  Text('Expires ${_formatDate(expires)}',
                      style: const TextStyle(color: KodaColors.text3, fontSize: 10)),
                ],
              ]),
            ],
          ]),
        );
      },
    );
  }

  // ── Actions ───────────────────────────────────────────────────────────────

  Future<void> _purchaseProduct(Map<String, dynamic> product) async {
    final result = await KodaApi.instance.purchaseProduct(
        product['id'] as String);
    if (result == null || !mounted) return;

    if (result['free'] == true) {
      // Free — got download token directly
      final token = result['download_token'] as String?;
      final key = result['license_key'] as String?;
      if (key != null) {
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: KodaColors.card,
            title: const Text('Your License Key',
                style: TextStyle(color: KodaColors.text1)),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: KodaColors.elevated,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(key,
                    style: const TextStyle(color: KodaColors.koda,
                        fontFamily: 'monospace', fontSize: 14)),
              ),
            ]),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context),
                  child: const Text('Close')),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: KodaColors.koda,
                    foregroundColor: Colors.black),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: key));
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('License key copied!')));
                },
                child: const Text('Copy Key'),
              ),
            ],
          ),
        );
      } else if (token != null) {
        await _downloadWithToken(token);
      }
      _load();
    } else {
      // Paid — Stripe payment needed
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Stripe payment coming soon')));
    }
  }

  Future<void> _downloadPurchase(String productId) async {
    final purchase = _myPurchases.firstWhere(
      (p) => (p['product'] as Map<String, dynamic>?)?['id'] == productId,
      orElse: () => {},
    );
    final token = purchase['download_token'] as String?;
    if (token != null) await _downloadWithToken(token);
  }

  Future<void> _downloadWithToken(String token) async {
    final url = Uri.parse('https://api.koda.fyi/api/v1/downloads/$token');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _showCreateProductDialog() async {
    await _showProductDialog(null);
  }

  Future<void> _showEditProductDialog(Map<String, dynamic> product) async {
    await _showProductDialog(product);
  }

  Future<void> _showProductDialog(Map<String, dynamic>? existing) async {
    final titleCtrl = TextEditingController(text: existing?['title'] ?? '');
    final descCtrl = TextEditingController(text: existing?['description'] ?? '');
    final priceCtrl = TextEditingController(
        text: existing != null && existing['price_cents'] != 0
            ? ((existing['price_cents'] as int) / 100.0).toStringAsFixed(2)
            : '');
    String type = existing?['product_type'] ?? 'file';
    String scope = existing?['scope'] ?? 'server';

    final saved = await showDialog<bool>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(existing == null ? 'Create Product' : 'Edit Product',
              style: const TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 380,
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                KodaTextField(controller: titleCtrl, hintText: 'Product title'),
                const SizedBox(height: 10),
                KodaTextField(controller: descCtrl,
                    hintText: 'Description (optional)'),
                const SizedBox(height: 10),
                KodaTextField(controller: priceCtrl,
                    hintText: 'Price in USD (leave empty for free)'),
                const SizedBox(height: 12),

                const Text('Product type',
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 4),
                DropdownButton<String>(
                  value: type,
                  dropdownColor: KodaColors.card,
                  style: const TextStyle(color: KodaColors.text1, fontSize: 13),
                  onChanged: (v) => setDialogState(() => type = v!),
                  items: const [
                    DropdownMenuItem(value: 'file', child: Text('File download')),
                    DropdownMenuItem(value: 'license_key',
                        child: Text('License key')),
                  ],
                ),
                const SizedBox(height: 8),

                const Text('Availability',
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 4),
                DropdownButton<String>(
                  value: scope,
                  dropdownColor: KodaColors.card,
                  style: const TextStyle(color: KodaColors.text1, fontSize: 13),
                  onChanged: (v) => setDialogState(() => scope = v!),
                  items: const [
                    DropdownMenuItem(value: 'server',
                        child: Text('This server only')),
                    DropdownMenuItem(value: 'creator',
                        child: Text('All Koda servers')),
                  ],
                ),

                if (type == 'license_key') ...[
                  const SizedBox(height: 8),
                  const Text(
                    'After creating, use the "Keys" button to upload your license keys.',
                    style: TextStyle(color: KodaColors.text3, fontSize: 11),
                  ),
                ],
                if (type == 'file') ...[
                  const SizedBox(height: 8),
                  const Text(
                    'File upload coming soon — enter a direct file URL for now.',
                    style: TextStyle(color: KodaColors.text3, fontSize: 11),
                  ),
                ],
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

    if (saved != true || titleCtrl.text.trim().isEmpty) return;
    final price = double.tryParse(priceCtrl.text.trim());
    final priceCents = price != null ? (price * 100).round() : 0;
    final user = ref.read(authProvider).user;

    if (existing == null) {
      final product = await KodaApi.instance.createProduct({
        'title':        titleCtrl.text.trim(),
        'description':  descCtrl.text.trim(),
        'price_cents':  priceCents,
        'product_type': type,
        'scope':        scope,
        'server_id':    widget.server?['id'],
        'creator_id':   user?.id,
      });
      if (product != null && mounted) _load();
    } else {
      final ok = await KodaApi.instance.updateProduct(
        existing['id'] as String,
        {
          'title':       titleCtrl.text.trim(),
          'description': descCtrl.text.trim(),
          'price_cents': priceCents,
          'scope':       scope,
        },
      );
      if (ok && mounted) _load();
    }
  }

  Future<void> _showLicenseKeysDialog(Map<String, dynamic> product) async {
    final ctrl = TextEditingController();
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: const Text('Upload License Keys',
            style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 380,
          child: Column(mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Paste one key per line:',
                style: TextStyle(color: KodaColors.text3, fontSize: 12)),
            const SizedBox(height: 8),
            TextField(
              controller: ctrl,
              maxLines: 8,
              style: const TextStyle(color: KodaColors.text1,
                  fontFamily: 'monospace', fontSize: 12),
              decoration: InputDecoration(
                filled: true,
                fillColor: KodaColors.elevated,
                hintText: 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...',
                hintStyle: const TextStyle(color: KodaColors.text3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: KodaColors.border),
                ),
              ),
            ),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda,
                foregroundColor: Colors.black),
            onPressed: () async {
              if (ctrl.text.trim().isEmpty) return;
              final ok = await KodaApi.instance.addLicenseKeys(
                  product['id'] as String, ctrl.text.trim());
              if (ok && mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('License keys uploaded!')));
              }
            },
            child: const Text('Upload Keys'),
          ),
        ],
      ),
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