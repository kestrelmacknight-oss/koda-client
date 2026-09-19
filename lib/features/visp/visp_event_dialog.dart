// lib/features/visp/visp_event_dialog.dart
//
// Visp: event creation from natural language. Same input -> preview ->
// confirm shape as visp_setup_dialog.dart. The one thing this preview
// has to get right that server-setup's doesn't: the resolved date/time
// is reformatted into the user's own *local* time before display --
// Visp resolves "next Friday"/"tomorrow" against the device's local
// clock (see koda-server's Koda.Visp.Events), but small local models
// can still get date/time reasoning wrong, so seeing it spelled out in
// plain local terms before confirming is the actual safety net here,
// not decoration.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/api.dart';
import '../../core/theme.dart';

Future<void> showVispEventDialog(
  BuildContext context, {
  required String channelId,
  required void Function(String eventId) onApplied,
}) {
  return showDialog(
    context: context,
    builder: (_) => VispEventDialog(channelId: channelId, onApplied: onApplied),
  );
}

class VispEventDialog extends StatefulWidget {
  final String channelId;
  final void Function(String eventId) onApplied;

  const VispEventDialog({super.key, required this.channelId, required this.onApplied});

  @override
  State<VispEventDialog> createState() => _VispEventDialogState();
}

class _VispEventDialogState extends State<VispEventDialog> {
  final _promptCtrl = TextEditingController();
  bool _loading = false;
  Map<String, dynamic>? _plan;
  String? _error;

  static const _recurrenceLabels = {
    'none': 'One-time',
    'daily': 'Repeats daily',
    'weekly': 'Repeats weekly',
    'monthly': 'Repeats monthly',
  };

  @override
  void dispose() {
    _promptCtrl.dispose();
    super.dispose();
  }

  Future<void> _generatePlan() async {
    final prompt = _promptCtrl.text.trim();
    if (prompt.isEmpty) return;
    setState(() { _loading = true; _error = null; _plan = null; });

    final result = await KodaApi.instance.planVispEvent(
      channelId: widget.channelId,
      prompt: prompt,
    );
    if (!mounted) return;

    final plan = result?['plan'] as Map<String, dynamic>?;
    if (plan != null) {
      setState(() { _plan = plan; _loading = false; });
    } else {
      setState(() {
        _error = result?['error'] as String? ?? 'Visp could not generate an event.';
        _loading = false;
      });
    }
  }

  Future<void> _applyPlan() async {
    final plan = _plan;
    if (plan == null) return;
    setState(() { _loading = true; _error = null; });

    final result = await KodaApi.instance.applyVispEventPlan(
      channelId: widget.channelId,
      plan: plan,
    );
    if (!mounted) return;

    final eventId = result?['event_id'] as String?;
    if (result?['ok'] == true && eventId != null) {
      Navigator.pop(context);
      widget.onApplied(eventId);
    } else {
      setState(() {
        _error = result?['error'] as String? ?? 'Could not create that event.';
        _loading = false;
      });
    }
  }

  void _regenerate() => setState(() { _plan = null; _error = null; });

  DateTime? _tryParseLocal(String? iso) {
    if (iso == null) return null;
    try {
      return DateTime.parse(iso).toLocal();
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final plan = _plan;

    return Dialog(
      backgroundColor: KodaColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const Icon(Icons.auto_awesome, color: KodaColors.koda, size: 20),
                const SizedBox(width: 10),
                const Text('Ask Visp to create an event',
                    style: TextStyle(color: KodaColors.text1, fontSize: 16,
                        fontWeight: FontWeight.w700)),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, size: 18, color: KodaColors.text3),
                  onPressed: () => Navigator.pop(context),
                ),
              ]),
              const SizedBox(height: 6),
              const Text(
                'Describe the event -- Visp will propose a title, date/time, and any other details.',
                style: TextStyle(color: KodaColors.text3, fontSize: 12),
              ),
              const SizedBox(height: 16),

              if (plan == null) ...[
                TextField(
                  controller: _promptCtrl,
                  maxLines: 3,
                  minLines: 3,
                  style: const TextStyle(color: KodaColors.text1, fontSize: 14),
                  decoration: const InputDecoration(
                    hintText: 'e.g. "Weekly D&D session every Friday at 7pm for about 3 hours"',
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Your description is sent to Visp (a self-hosted assistant -- '
                  'nothing leaves Koda\'s servers) to generate this plan.',
                  style: TextStyle(color: KodaColors.text3, fontSize: 11),
                ),
              ],

              if (_error != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: KodaColors.accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: KodaColors.accent.withValues(alpha: 0.3)),
                  ),
                  child: Text(_error!,
                      style: const TextStyle(color: KodaColors.accent, fontSize: 12)),
                ),
              ],

              if (plan != null) ...[
                const SizedBox(height: 6),
                _buildPreview(plan),
                const SizedBox(height: 20),
                Row(children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: KodaColors.text2,
                        side: const BorderSide(color: KodaColors.border),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: _loading ? null : _regenerate,
                      child: const Text('Try Again'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: KodaColors.koda,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: _loading ? null : _applyPlan,
                      child: _loading
                          ? const SizedBox(width: 18, height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                          : const Text('Create Event',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
                    ),
                  ),
                ]),
              ] else ...[
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KodaColors.koda,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: _loading ? null : _generatePlan,
                    icon: _loading
                        ? const SizedBox(width: 16, height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                        : const Icon(Icons.auto_awesome, size: 16, color: Colors.black),
                    label: Text(_loading ? 'Thinking...' : 'Generate Plan',
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreview(Map<String, dynamic> plan) {
    final startLocal = _tryParseLocal(plan['start_at'] as String?);
    final endLocal = _tryParseLocal(plan['end_at'] as String?);
    final recurrence = plan['recurrence'] as String? ?? 'none';
    final priceCents = plan['price_cents'] as int? ?? 0;
    final dateFmt = DateFormat('EEEE, MMM d, yyyy \'at\' h:mm a');

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: KodaColors.elevated,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(plan['title'] as String? ?? '',
            style: const TextStyle(color: KodaColors.text1, fontSize: 15, fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        Text(plan['summary'] as String? ?? '',
            style: const TextStyle(color: KodaColors.text2, fontSize: 12, height: 1.4)),
        const SizedBox(height: 10),
        _previewRow(Icons.event_outlined,
            startLocal != null
                ? dateFmt.format(startLocal)
                : 'Could not parse a date -- try rephrasing'),
        if (endLocal != null)
          _previewRow(Icons.event_available_outlined, 'Ends ${dateFmt.format(endLocal)}'),
        if (recurrence != 'none')
          _previewRow(Icons.repeat, _recurrenceLabels[recurrence] ?? recurrence),
        if (plan['location'] != null && (plan['location'] as String).isNotEmpty)
          _previewRow(Icons.place_outlined, plan['location'] as String),
        if (priceCents > 0)
          _previewRow(Icons.confirmation_number_outlined,
              '\$${(priceCents / 100).toStringAsFixed(2)} per ticket'),
      ]),
    );
  }

  Widget _previewRow(IconData icon, String text) => Padding(
    padding: const EdgeInsets.only(top: 6),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, size: 14, color: KodaColors.text3),
      const SizedBox(width: 6),
      Expanded(child: Text(text, style: const TextStyle(color: KodaColors.text2, fontSize: 12))),
    ]),
  );
}
