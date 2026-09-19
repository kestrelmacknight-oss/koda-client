// lib/features/visp/visp_boost_advisor_panel.dart
//
// Boost ROI advisor -- a read-only Visp panel embedded at the bottom of
// the Revenue dashboard (see marketplace_screen.dart's
// _RevenueDashboardView). Unlike visp_setup_dialog.dart/
// visp_event_dialog.dart, there's no ask/plan branching and nothing to
// preview-then-apply: every turn is a narrative answer over this
// server's real numbers (see koda-server's Koda.Visp.BoostAdvisor),
// optionally citing wiki articles the same "Based on: ..." way the other
// two Visp surfaces do. A default question fires automatically on first
// load; a free-text field lets the owner ask follow-ups in the same
// conversation.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';

const _kDefaultQuestion = 'How is my boosting and marketplace revenue doing?';

class VispBoostAdvisorPanel extends StatefulWidget {
  final String serverId;
  const VispBoostAdvisorPanel({super.key, required this.serverId});

  @override
  State<VispBoostAdvisorPanel> createState() => _VispBoostAdvisorPanelState();
}

class _VispBoostAdvisorPanelState extends State<VispBoostAdvisorPanel> {
  final _followUpCtrl = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _loading = false;
  String? _error;
  Map<String, dynamic>? _lastAdvice;

  @override
  void initState() {
    super.initState();
    _ask(_kDefaultQuestion);
  }

  @override
  void dispose() {
    _followUpCtrl.dispose();
    super.dispose();
  }

  Future<void> _ask(String question) async {
    _messages.add({'role': 'user', 'content': question});
    setState(() { _loading = true; _error = null; });

    final result = await KodaApi.instance.askVispBoostAdvice(
      serverId: widget.serverId,
      messages: _messages,
    );
    if (!mounted) return;

    final narrative = result?['narrative'] as String?;
    if (result?['error'] != null || narrative == null) {
      setState(() {
        _error = result?['error'] as String? ?? 'Visp could not put together an answer.';
        _loading = false;
      });
      return;
    }

    // Round-tripped as plain text (not the raw JSON turn) -- there's no
    // ask/plan branching or question-cap counting for the server to
    // decode here, unlike Koda.Visp/Koda.Visp.Events, so the narrative
    // itself is the most natural conversational history to resend.
    _messages.add({'role': 'assistant', 'content': narrative});
    setState(() { _lastAdvice = result; _loading = false; });
  }

  void _submitFollowUp() {
    final text = _followUpCtrl.text.trim();
    if (text.isEmpty || _loading) return;
    _followUpCtrl.clear();
    _ask(text);
  }

  @override
  Widget build(BuildContext context) {
    final advice = _lastAdvice;
    final recommendations = List<String>.from(advice?['recommendations'] ?? []);
    final sources = List<String>.from(advice?['sources'] ?? []);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: KodaColors.elevated,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(children: [
          Icon(Icons.auto_awesome, size: 16, color: KodaColors.koda),
          SizedBox(width: 8),
          Text('Ask Visp: Boost ROI Advisor',
              style: TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w700)),
        ]),
        const SizedBox(height: 12),

        if (_loading && advice == null)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(child: CircularProgressIndicator(color: KodaColors.koda, strokeWidth: 2)),
          ),

        if (_error != null) ...[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: KodaColors.accent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: KodaColors.accent.withValues(alpha: 0.3)),
            ),
            child: Text(_error!, style: const TextStyle(color: KodaColors.accent, fontSize: 12)),
          ),
          const SizedBox(height: 8),
        ],

        if (advice != null) ...[
          Text(advice['headline'] as String? ?? '',
              style: const TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(advice['narrative'] as String? ?? '',
              style: const TextStyle(color: KodaColors.text2, fontSize: 13, height: 1.4)),

          if (recommendations.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...recommendations.map((r) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(Icons.arrow_right, size: 16, color: KodaColors.koda),
                    ),
                    Expanded(
                      child: Text(r, style: const TextStyle(color: KodaColors.text2, fontSize: 12)),
                    ),
                  ]),
                )),
          ],

          if (sources.isNotEmpty) ...[
            const SizedBox(height: 10),
            _sourcesRow(sources),
          ],
        ],

        const SizedBox(height: 14),
        Row(children: [
          Expanded(
            child: TextField(
              controller: _followUpCtrl,
              enabled: !_loading,
              style: const TextStyle(color: KodaColors.text1, fontSize: 13),
              decoration: const InputDecoration(
                hintText: 'Ask a follow-up...',
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
              onSubmitted: (_) => _submitFollowUp(),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: _loading
                ? const SizedBox(width: 16, height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                : const Icon(Icons.send, size: 18, color: KodaColors.koda),
            onPressed: _loading ? null : _submitFollowUp,
          ),
        ]),
      ]),
    );
  }

  // Same "Based on: ..." chip treatment as visp_setup_dialog.dart/
  // visp_event_dialog.dart's citation rows.
  Widget _sourcesRow(List<String> sources) {
    return Wrap(spacing: 6, runSpacing: 6, crossAxisAlignment: WrapCrossAlignment.center, children: [
      const Icon(Icons.menu_book_outlined, size: 12, color: KodaColors.text3),
      const Text('Based on:', style: TextStyle(color: KodaColors.text3, fontSize: 11)),
      ...sources.map((title) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: KodaColors.koda.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(title, style: const TextStyle(color: KodaColors.koda, fontSize: 11)),
          )),
    ]);
  }
}
