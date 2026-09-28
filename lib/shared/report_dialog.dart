// lib/shared/report_dialog.dart
//
// Tier 2 moderation ("content moderation with user consent" -- see
// koda-server's Koda.Reports) -- reporting a message discloses content
// this device already has decrypted to display it, plus (for DMs)
// unmasks the real sender via the sealed-sender reveal already built.
// Right-click a message to bring this up, same convention as the
// member-moderation menu (member_panel.dart) and the voice call's
// per-participant volume dialog (voice_screen.dart).

import 'package:flutter/material.dart';
import '../core/api.dart';
import '../core/theme.dart';
import '../l10n/generated/app_localizations.dart';

class _ReasonOption {
  final String value;
  // Internal lookup value stays fixed; the display label is looked up
  // from AppLocalizations per-build (see _reasonLabels below) since it
  // needs a BuildContext to localize.
  const _ReasonOption(this.value);
}

const _reasons = [
  _ReasonOption('spam'),
  _ReasonOption('harassment'),
  _ReasonOption('illegal'),
  _ReasonOption('other'),
];

Map<String, String> _reasonLabels(AppLocalizations t) => {
      'spam': t.reportDialogReasonSpam,
      'harassment': t.reportDialogReasonHarassment,
      'illegal': t.reportDialogReasonIllegal,
      'other': t.reportDialogReasonOther,
    };

/// Shows the report dialog for a channel message. [disclosedContent] must
/// be the caller's own already-decrypted copy of the message -- never
/// re-fetched here. Returns true if a report was actually submitted.
Future<bool> showReportChannelMessageDialog(
  BuildContext context, {
  required String channelId,
  required String messageId,
  required String disclosedContent,
}) =>
    showDialog<bool>(
      context: context,
      builder: (_) => _ReportDialog(
        onSubmit: (reason, note) => KodaApi.instance.reportChannelMessage(
          channelId, messageId,
          reason: reason, note: note, disclosedContent: disclosedContent,
        ),
      ),
    ).then((v) => v ?? false);

/// Same as above, for a DM message.
Future<bool> showReportDmMessageDialog(
  BuildContext context, {
  required String messageId,
  required String disclosedContent,
}) =>
    showDialog<bool>(
      context: context,
      builder: (_) => _ReportDialog(
        onSubmit: (reason, note) => KodaApi.instance.reportDmMessage(
          messageId,
          reason: reason, note: note, disclosedContent: disclosedContent,
        ),
      ),
    ).then((v) => v ?? false);

class _ReportDialog extends StatefulWidget {
  final Future<Map<String, dynamic>?> Function(String reason, String? note) onSubmit;
  const _ReportDialog({required this.onSubmit});
  @override
  State<_ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<_ReportDialog> {
  String _reason = _reasons.first.value;
  final _noteCtrl = TextEditingController();
  bool _submitting = false;
  String? _error;

  @override
  void dispose() {
    _noteCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    // Captured before the await below, so we don't touch a
    // possibly-unmounted context afterward.
    final t = AppLocalizations.of(context);
    setState(() { _submitting = true; _error = null; });
    final result = await widget.onSubmit(_reason, _noteCtrl.text.trim().isEmpty ? null : _noteCtrl.text.trim());
    if (!mounted) return;
    if (result != null) {
      Navigator.pop(context, true);
    } else {
      setState(() { _submitting = false; _error = t.reportDialogSubmitError; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final reasonLabels = _reasonLabels(t);
    return AlertDialog(
      backgroundColor: KodaColors.card,
      // Reuses the home/dm "Report Message" action's own key -- this
      // dialog is shared between both message-actions menus and shows
      // the exact same title text either way.
      title: Text(t.homeReportMessageAction, style: TextStyle(color: KodaColors.text1)),
      content: SizedBox(
        width: 320,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(t.reportDialogReasonLabel, style: TextStyle(color: KodaColors.text2, fontSize: 12)),
          ),
          const SizedBox(height: 6),
          ..._reasons.map((r) {
            final selected = _reason == r.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: GestureDetector(
                onTap: () => setState(() => _reason = r.value),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: selected ? KodaColors.koda.withValues(alpha: 0.2) : KodaColors.elevated,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: selected ? KodaColors.koda : KodaColors.border),
                  ),
                  child: Text(reasonLabels[r.value] ?? r.value,
                      style: TextStyle(
                          color: selected ? KodaColors.koda : KodaColors.text1, fontSize: 13)),
                ),
              ),
            );
          }),
          const SizedBox(height: 8),
          TextField(
            controller: _noteCtrl,
            maxLines: 3,
            style: TextStyle(color: KodaColors.text1, fontSize: 13),
            decoration: InputDecoration(
              hintText: t.reportDialogNoteHint,
              hintStyle: TextStyle(color: KodaColors.text3, fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            t.reportDialogDisclosureNote,
            style: TextStyle(color: KodaColors.text3, fontSize: 11),
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(_error!, style: TextStyle(color: KodaColors.accent, fontSize: 12)),
          ],
        ]),
      ),
      actions: [
        TextButton(
          onPressed: _submitting ? null : () => Navigator.pop(context, false),
          child: Text(t.commonCancel),
        ),
        TextButton(
          onPressed: _submitting ? null : _submit,
          child: _submitting
              ? SizedBox(
                  width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
              : Text(t.reportDialogSubmitButton),
        ),
      ],
    );
  }
}
