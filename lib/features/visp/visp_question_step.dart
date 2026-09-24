// lib/features/visp/visp_question_step.dart
//
// Shared "ask" step for Visp's smart walkthrough branching -- both
// visp_setup_dialog.dart and visp_event_dialog.dart render this when a
// turn comes back with action: "ask" instead of a final plan. A
// step-by-step wizard feel (one question at a time), not a chat thread:
// question text, quick-reply chips if Visp offered any, a free-text
// fallback that's always available even when chips are shown, a
// "Question N of 4" progress line, and a manual "Skip and generate now"
// escape hatch so an unsure local model can't stall the user
// indefinitely -- the real cap is enforced server-side (see
// Koda.Visp/Koda.Visp.Events), this is just always-available relief on
// top of that.

import 'package:flutter/material.dart';
import '../../core/theme.dart';

class VispQuestionStep extends StatefulWidget {
  final String question;
  final List<String> options;
  final int questionNumber;
  final int maxQuestions;
  final bool loading;
  final void Function(String answer) onAnswer;
  final VoidCallback onSkip;

  const VispQuestionStep({
    super.key,
    required this.question,
    required this.options,
    required this.questionNumber,
    required this.maxQuestions,
    required this.loading,
    required this.onAnswer,
    required this.onSkip,
  });

  @override
  State<VispQuestionStep> createState() => _VispQuestionStepState();
}

class _VispQuestionStepState extends State<VispQuestionStep> {
  final _answerCtrl = TextEditingController();

  @override
  void dispose() {
    _answerCtrl.dispose();
    super.dispose();
  }

  void _submitFreeText() {
    final text = _answerCtrl.text.trim();
    if (text.isEmpty) return;
    _answerCtrl.clear();
    widget.onAnswer(text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Question ${widget.questionNumber} of ${widget.maxQuestions}',
          style: TextStyle(color: KodaColors.text3, fontSize: 11, fontWeight: FontWeight.w600)),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: KodaColors.elevated,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: KodaColors.border),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.auto_awesome, size: 16, color: KodaColors.koda),
          const SizedBox(width: 10),
          Expanded(
            child: Text(widget.question,
                style: TextStyle(color: KodaColors.text1, fontSize: 14, height: 1.4)),
          ),
        ]),
      ),
      if (widget.options.isNotEmpty) ...[
        const SizedBox(height: 12),
        Wrap(spacing: 8, runSpacing: 8, children: widget.options.map((option) {
          return OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: KodaColors.text1,
              side: BorderSide(color: KodaColors.border),
            ),
            onPressed: widget.loading ? null : () => widget.onAnswer(option),
            child: Text(option),
          );
        }).toList()),
      ],
      const SizedBox(height: 14),
      Row(children: [
        Expanded(
          child: TextField(
            controller: _answerCtrl,
            enabled: !widget.loading,
            style: TextStyle(color: KodaColors.text1, fontSize: 14),
            decoration: const InputDecoration(
              hintText: 'Or type your own answer...',
              contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
            onSubmitted: (_) => _submitFreeText(),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: widget.loading
              ? SizedBox(width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
              : Icon(Icons.send, size: 18, color: KodaColors.koda),
          onPressed: widget.loading ? null : _submitFreeText,
        ),
      ]),
      const SizedBox(height: 8),
      Align(
        alignment: Alignment.centerLeft,
        child: TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: widget.loading ? null : widget.onSkip,
          child: Text('Skip and generate now',
              style: TextStyle(color: KodaColors.text3, fontSize: 12)),
        ),
      ),
    ]);
  }
}
