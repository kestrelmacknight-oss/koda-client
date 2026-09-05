// lib/features/marketplace/tip_dialog.dart
//
// Tip dialog — shown from user profile popup.
// Calculates split, shows preview, initiates Stripe payment.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api.dart';
import '../../core/providers.dart';
import '../../core/theme.dart';
import '../../shared/widgets.dart';

class TipDialog extends ConsumerStatefulWidget {
  final Map<String, dynamic> recipient;
  final String? serverId;
  const TipDialog({super.key, required this.recipient, this.serverId});
  @override
  ConsumerState<TipDialog> createState() => _TipDialogState();
}

class _TipDialogState extends ConsumerState<TipDialog> {
  final _messageCtrl = TextEditingController();
  int _selectedAmount = 100; // cents
  Map<String, dynamic>? _preview;
  bool _loadingPreview = false;
  bool _sending = false;

  final _amounts = [
    {'label': '\$1', 'cents': 100},
    {'label': '\$5', 'cents': 500},
    {'label': '\$10', 'cents': 1000},
    {'label': '\$25', 'cents': 2500},
  ];

  @override
  void initState() {
    super.initState();
    _loadPreview();
  }

  @override
  void dispose() {
    _messageCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadPreview() async {
    setState(() => _loadingPreview = true);
    final preview = await KodaApi.instance.getTipPreview(
        widget.recipient['id'] as String, _selectedAmount);
    if (!mounted) return;
    setState(() { _preview = preview; _loadingPreview = false; });
  }

  Future<void> _sendTip() async {
    setState(() => _sending = true);
    final server = ref.read(selectedServerProvider);
    final result = await KodaApi.instance.createTip(
      widget.recipient['id'] as String,
      _selectedAmount,
      widget.serverId ?? server?['id'] as String? ?? '',
      message: _messageCtrl.text.trim().isEmpty ? null : _messageCtrl.text.trim(),
    );
    if (!mounted) return;
    setState(() => _sending = false);

    if (result != null) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tip initiated — Stripe payment coming soon')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send tip. Creator may not be connected to Stripe.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final username = widget.recipient['username'] as String? ?? 'Unknown';

    return AlertDialog(
      backgroundColor: KodaColors.card,
      title: Row(children: [
        const Icon(Icons.volunteer_activism, color: KodaColors.koda, size: 20),
        const SizedBox(width: 8),
        Text('Tip $username',
            style: const TextStyle(color: KodaColors.text1, fontSize: 16)),
      ]),
      content: SizedBox(
        width: 340,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // Amount selector
          const Text('Select amount',
              style: TextStyle(color: KodaColors.text3, fontSize: 12)),
          const SizedBox(height: 8),
          Row(children: _amounts.map((a) {
            final selected = _selectedAmount == a['cents'] as int;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: GestureDetector(
                  onTap: () {
                    setState(() => _selectedAmount = a['cents'] as int);
                    _loadPreview();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: selected
                          ? KodaColors.koda.withOpacity(0.2)
                          : KodaColors.elevated,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selected
                            ? KodaColors.koda
                            : KodaColors.border,
                      ),
                    ),
                    child: Text(a['label'] as String,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: selected ? KodaColors.koda : KodaColors.text2,
                            fontWeight: selected ? FontWeight.w700 : FontWeight.normal,
                            fontSize: 13)),
                  ),
                ),
              ),
            );
          }).toList()),
          const SizedBox(height: 12),

          // Message
          KodaTextField(
            controller: _messageCtrl,
            hintText: 'Add a message (optional)',
          ),
          const SizedBox(height: 12),

          // Preview
          if (_loadingPreview)
            const Center(child: CircularProgressIndicator(
                color: KodaColors.koda, strokeWidth: 2))
          else if (_preview != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: KodaColors.elevated,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(children: [
                _previewRow('You pay',
                    '\$${(_selectedAmount / 100).toStringAsFixed(2)}'),
                const SizedBox(height: 4),
                _previewRow('$username receives',
                    '\$${((_preview!['creator_amount_cents'] as int) / 100).toStringAsFixed(2)}'),
                const Divider(color: KodaColors.border, height: 12),
                _previewRow('Processing fee (5%)',
                    '\$${((_preview!['fee_cents'] as int) / 100).toStringAsFixed(2)}',
                    small: true),
                _previewRow('Server bank earns',
                    '${_preview!['points_credited']} pts',
                    small: true, color: KodaColors.koda),
              ]),
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
          onPressed: _sending ? null : _sendTip,
          child: _sending
              ? const SizedBox(width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2,
                      color: Colors.black))
              : const Text('Send Tip'),
        ),
      ],
    );
  }

  Widget _previewRow(String label, String value,
      {bool small = false, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(
            color: small ? KodaColors.text3 : KodaColors.text2,
            fontSize: small ? 11 : 13)),
        Text(value, style: TextStyle(
            color: color ?? (small ? KodaColors.text3 : KodaColors.text1),
            fontSize: small ? 11 : 13,
            fontWeight: small ? FontWeight.normal : FontWeight.w600)),
      ],
    );
  }
}
