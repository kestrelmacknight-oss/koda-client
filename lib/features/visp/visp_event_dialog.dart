// lib/features/visp/visp_event_dialog.dart
//
// Visp: event creation from natural language, with smart walkthrough
// branching -- same conversational shape as visp_setup_dialog.dart
// (describe -> Visp asks up to 4 clarifying questions or proposes a
// final event, "Skip and generate now" always available). The one
// thing this preview has to get right that server-setup's doesn't: the
// resolved date/time is reformatted into the user's own *local* time
// before display -- Visp resolves "next Friday"/"tomorrow" against the
// device's local clock (see koda-server's Koda.Visp.Events), but small
// local models can still get date/time reasoning wrong, so seeing it
// spelled out in plain local terms before confirming is the actual
// safety net here, not decoration. Visp's avatar/kaomoji face follow the
// same mood-mapped pattern as visp_setup_dialog.dart -- see
// visp_avatar.dart.

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import 'visp_avatar.dart';
import 'visp_question_step.dart';

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
  String? _error;

  final List<Map<String, String>> _messages = [];
  String? _currentQuestion;
  List<String> _currentOptions = [];
  int _questionNumber = 0;
  int _maxQuestions = 4;
  Map<String, dynamic>? _plan;
  bool _showAvatar = true;

  static const _recurrenceLabels = {
    'none': 'One-time',
    'daily': 'Repeats daily',
    'weekly': 'Repeats weekly',
    'monthly': 'Repeats monthly',
  };

  VispMood get _mood {
    if (_error != null) return VispMood.error;
    if (_loading) return VispMood.thinking;
    if (_plan != null) return VispMood.planReady;
    if (_currentQuestion != null) return VispMood.asking;
    return VispMood.idle;
  }

  @override
  void initState() {
    super.initState();
    VispAvatarPrefs.isEnabled().then((v) {
      if (mounted) setState(() => _showAvatar = v);
    });
  }

  @override
  void dispose() {
    _promptCtrl.dispose();
    super.dispose();
  }

  Future<void> _startWalkthrough() async {
    final prompt = _promptCtrl.text.trim();
    if (prompt.isEmpty) return;
    _messages.add({'role': 'user', 'content': prompt});
    await _takeTurn();
  }

  Future<void> _answerQuestion(String answer) async {
    _messages.add({'role': 'user', 'content': answer});
    await _takeTurn();
  }

  Future<void> _skipToPlan() => _takeTurn(forcePlan: true);

  Future<void> _takeTurn({bool forcePlan = false}) async {
    setState(() { _loading = true; _error = null; });

    final result = await KodaApi.instance.planVispEvent(
      channelId: widget.channelId,
      messages: _messages,
      forcePlan: forcePlan,
    );
    if (!mounted) return;

    switch (result?['action']) {
      case 'ask':
        final question = result?['question'] as String?;
        if (question == null) {
          setState(() { _error = 'Visp could not generate an event.'; _loading = false; });
          return;
        }
        _messages.add({'role': 'assistant', 'content': jsonEncode({
          'action': 'ask', 'question': question, 'options': result?['options'] ?? [],
        })});
        setState(() {
          _currentQuestion = question;
          _currentOptions = List<String>.from(result?['options'] ?? []);
          _questionNumber = result?['question_number'] as int? ?? _questionNumber + 1;
          _maxQuestions = result?['max_questions'] as int? ?? _maxQuestions;
          _loading = false;
        });
        break;

      case 'plan':
        final plan = result?['plan'] as Map<String, dynamic>?;
        if (plan == null) {
          setState(() { _error = 'Visp could not generate an event.'; _loading = false; });
          return;
        }
        setState(() { _plan = plan; _currentQuestion = null; _loading = false; });
        break;

      default:
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

  void _startOver() => setState(() {
    _messages.clear();
    _currentQuestion = null;
    _currentOptions = [];
    _questionNumber = 0;
    _plan = null;
    _error = null;
    _promptCtrl.clear();
  });

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
    final question = _currentQuestion;

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
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                _showAvatar
                    ? VispAvatar(size: 44, mood: _mood)
                    : const Icon(Icons.auto_awesome, color: KodaColors.koda, size: 20),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text('Ask Visp to create an event',
                      style: TextStyle(color: KodaColors.text1, fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
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

              if (plan == null && question == null) ...[
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

              if (question != null && plan == null) ...[
                VispQuestionStep(
                  question: question,
                  options: _currentOptions,
                  questionNumber: _questionNumber,
                  maxQuestions: _maxQuestions,
                  loading: _loading,
                  onAnswer: _answerQuestion,
                  onSkip: _skipToPlan,
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
                      onPressed: _loading ? null : _startOver,
                      child: const Text('Start Over'),
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
              ] else if (question == null) ...[
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KodaColors.koda,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: _loading ? null : _startWalkthrough,
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
    final sources = List<String>.from(plan['sources'] ?? []);
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
        if (sources.isNotEmpty) ...[
          const SizedBox(height: 8),
          _sourcesRow(sources),
        ],
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

  // Which wiki articles (see koda-server's Koda.Wiki) Visp actually
  // grounded this plan in, if any -- lets the user check the source
  // rather than just trusting the model's claim.
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
