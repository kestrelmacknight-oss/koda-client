// lib/features/visp/visp_setup_dialog.dart
//
// Visp: natural-language server setup, with smart walkthrough branching
// -- describe what you want, and Visp (a self-hosted model, see
// koda-server's Koda.Visp/Koda.Visp.Providers.Ollama) either asks ONE
// short clarifying question (with optional quick-reply chips, rendered
// via the shared VispQuestionStep) or proposes a final plan
// (roles/categories/channels, and with no serverId, a whole new
// server) for preview. Up to 4 clarifying rounds, or "Skip and
// generate now" at any point -- both enforced server-side, see
// Koda.Visp.take_turn/3. The conversation itself is just a plain
// {role, content} list resent in full each turn; this dialog is the
// only place that state lives, the server is stateless throughout.
// Visp's avatar (VispAvatar) and its kaomoji "face" (vispKaomoji,
// mood-mapped to this dialog's own loading/asking/plan/error state)
// show by default -- see visp_avatar.dart -- and fall back to the
// plain Icons.auto_awesome sparkle if the user's turned the avatar off
// in Settings > My Account (VispAvatarPrefs).

import 'dart:convert';
import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import 'visp_avatar.dart';
import 'visp_question_step.dart';

Future<void> showVispSetupDialog(
  BuildContext context, {
  String? serverId,
  required void Function(String serverId) onApplied,
}) {
  return showDialog(
    context: context,
    builder: (_) => VispSetupDialog(serverId: serverId, onApplied: onApplied),
  );
}

class VispSetupDialog extends StatefulWidget {
  final String? serverId;
  final void Function(String serverId) onApplied;

  const VispSetupDialog({super.key, this.serverId, required this.onApplied});

  @override
  State<VispSetupDialog> createState() => _VispSetupDialogState();
}

class _VispSetupDialogState extends State<VispSetupDialog> {
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

  bool get _isNewServer => widget.serverId == null;

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

    final result = await KodaApi.instance.planWithVisp(
      serverId: widget.serverId,
      messages: _messages,
      forcePlan: forcePlan,
    );
    if (!mounted) return;

    switch (result?['action']) {
      case 'ask':
        final question = result?['question'] as String?;
        if (question == null) {
          setState(() { _error = 'Visp could not generate a plan.'; _loading = false; });
          return;
        }
        // Round-trips this turn back to the server next call, exactly
        // as Koda.Visp's count_prior_asks/1 expects to decode it.
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
          setState(() { _error = 'Visp could not generate a plan.'; _loading = false; });
          return;
        }
        setState(() { _plan = plan; _currentQuestion = null; _loading = false; });
        break;

      default:
        setState(() {
          _error = result?['error'] as String? ?? 'Visp could not generate a plan.';
          _loading = false;
        });
    }
  }

  Future<void> _applyPlan() async {
    final plan = _plan;
    if (plan == null) return;
    setState(() { _loading = true; _error = null; });

    final result = await KodaApi.instance.applyVispPlan(
      serverId: widget.serverId,
      plan: plan,
    );
    if (!mounted) return;

    final serverId = result?['server_id'] as String?;
    if (result?['ok'] == true && serverId != null) {
      Navigator.pop(context);
      widget.onApplied(serverId);
    } else {
      setState(() {
        _error = result?['error'] as String? ?? 'Could not apply that plan.';
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

  @override
  Widget build(BuildContext context) {
    final plan = _plan;
    final question = _currentQuestion;

    return Dialog(
      backgroundColor: KodaColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
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
                Expanded(
                  child: Text(_isNewServer ? 'Describe your server to Visp' : 'Ask Visp to add to this server',
                      style: const TextStyle(color: KodaColors.text1, fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 18, color: KodaColors.text3),
                  onPressed: () => Navigator.pop(context),
                ),
              ]),
              const SizedBox(height: 6),
              Text(
                _isNewServer
                    ? 'Describe the server you want -- Visp will propose a name and a set of roles, categories, and channels.'
                    : 'Describe what you\'d like to add -- Visp will propose roles, categories, and channels to create.',
                style: const TextStyle(color: KodaColors.text3, fontSize: 12),
              ),
              const SizedBox(height: 16),

              if (plan == null && question == null) ...[
                TextField(
                  controller: _promptCtrl,
                  maxLines: 3,
                  minLines: 3,
                  style: const TextStyle(color: KodaColors.text1, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: _isNewServer
                        ? 'e.g. "A cozy server for my D&D group with voice channels for two tables"'
                        : 'e.g. "Add a couple more channels for our raid teams"',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
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
                          : Text(_isNewServer ? 'Create Server' : 'Add to Server',
                              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
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
    final server = plan['server'] as Map<String, dynamic>?;
    final roles = List<Map<String, dynamic>>.from(plan['roles'] ?? []);
    final categories = List<Map<String, dynamic>>.from(plan['categories'] ?? []);
    final channels = List<Map<String, dynamic>>.from(plan['channels'] ?? []);
    final sources = List<String>.from(plan['sources'] ?? []);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: KodaColors.elevated,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(plan['summary'] as String? ?? '',
            style: const TextStyle(color: KodaColors.text1, fontSize: 13, height: 1.4)),
        if (server != null) ...[
          const SizedBox(height: 10),
          _previewSection(Icons.dns_outlined, 'New server', [server['name'] as String? ?? '']),
        ],
        if (roles.isNotEmpty) ...[
          const SizedBox(height: 10),
          _previewSection(Icons.shield_outlined, '${roles.length} role${roles.length == 1 ? '' : 's'}',
              roles.map((r) => r['name'] as String? ?? '').toList()),
        ],
        if (categories.isNotEmpty) ...[
          const SizedBox(height: 10),
          _previewSection(Icons.folder_outlined,
              '${categories.length} categor${categories.length == 1 ? 'y' : 'ies'}',
              categories.map((c) => c['name'] as String? ?? '').toList()),
        ],
        if (channels.isNotEmpty) ...[
          const SizedBox(height: 10),
          _previewSection(Icons.tag, '${channels.length} channel${channels.length == 1 ? '' : 's'}',
              channels.map((c) => '${c['name']} (${c['type']})').toList()),
        ],
        if (sources.isNotEmpty) ...[
          const SizedBox(height: 12),
          _sourcesRow(sources),
        ],
      ]),
    );
  }

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

  Widget _previewSection(IconData icon, String title, List<String> items) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Icon(icon, size: 14, color: KodaColors.text3),
        const SizedBox(width: 6),
        Text(title, style: const TextStyle(color: KodaColors.text2, fontSize: 12,
            fontWeight: FontWeight.w600)),
      ]),
      const SizedBox(height: 4),
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(items.join(', '),
            style: const TextStyle(color: KodaColors.text3, fontSize: 11)),
      ),
    ]);
  }
}
