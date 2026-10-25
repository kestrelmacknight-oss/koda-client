// lib/shared/update_nudge.dart
//
// Shown once at startup when lib/core/version_check.dart finds a newer
// build than this one -- see main.dart's AuthGate for where this fires.
// Optional updates get a dismissible banner (suppressed for that exact
// version once dismissed, see VersionCheck.dismiss); a `required: true`
// response from the server (koda-server's VersionController, "set true
// to force update") gets a real non-dismissible dialog instead -- no
// barrier dismiss, no close button, matching what "force" should mean.
//
// On Windows, when the server supplied both a direct installer URL and
// its expected checksum, the primary button becomes "Update Now" and
// downloads + verifies + launches the installer itself (self_update.dart)
// -- still only ever on an explicit tap, never automatic. Every other
// platform (and Windows without a verifiable download) keeps the
// original behavior: open the browser to the download page.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/self_update.dart';
import '../core/theme.dart';
import '../core/version_check.dart';
import '../l10n/generated/app_localizations.dart';

Future<void> _openDownloadPage(String url) async {
  final uri = Uri.tryParse(url);
  if (uri != null && await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

/// Call once at startup (see main.dart) -- shows nothing if there's no
/// update, the check failed, or the user already dismissed this exact
/// version.
Future<void> maybeShowUpdateNudge(BuildContext context) async {
  final result = await VersionCheck.check();
  if (result == null) return;
  if (!await VersionCheck.shouldShow(result)) return;
  if (!context.mounted) return;

  if (result.required) {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: _UpdateDialog(result: result, dismissible: false),
      ),
    );
  } else {
    await showDialog(
      context: context,
      builder: (_) => _UpdateDialog(result: result, dismissible: true),
    );
  }
}

class _UpdateDialog extends StatefulWidget {
  final VersionCheckResult result;
  final bool dismissible;
  const _UpdateDialog({required this.result, required this.dismissible});

  @override
  State<_UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<_UpdateDialog> {
  SelfUpdateStep? _step;
  double? _progress;
  String? _error;

  bool get _busy => _step != null;

  Future<void> _updateNow() async {
    final result = widget.result;
    setState(() { _error = null; _step = SelfUpdateStep.downloading; _progress = 0; });
    try {
      await SelfUpdate.downloadAndLaunch(
        result.platformDownloadUrl!,
        result.platformSha256!,
        onProgress: (step, progress) {
          if (mounted) setState(() { _step = step; _progress = progress; });
        },
      );
      // downloadAndLaunch exits the process on success -- nothing below
      // this line runs in the happy path.
    } on SelfUpdateException {
      if (mounted) setState(() { _step = null; _error = AppLocalizations.of(context).updateNudgeFailed; });
    } catch (_) {
      if (mounted) setState(() { _step = null; _error = AppLocalizations.of(context).updateNudgeFailed; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final result = widget.result;
    final canSelfUpdate = SelfUpdate.canSelfUpdate(
        platformDownloadUrl: result.platformDownloadUrl, platformSha256: result.platformSha256);

    return AlertDialog(
      backgroundColor: KodaColors.card,
      title: Row(children: [
        Icon(widget.dismissible ? Icons.system_update_outlined : Icons.error_outline,
            color: widget.dismissible ? KodaColors.koda : KodaColors.accent, size: 20),
        const SizedBox(width: 8),
        Text(widget.dismissible ? t.updateNudgeAvailableTitle : t.updateNudgeRequiredTitle,
            style: TextStyle(color: KodaColors.text1)),
      ]),
      content: SizedBox(
        width: 320,
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.dismissible
                ? t.updateNudgeAvailableBody(result.latestVersion)
                : t.updateNudgeRequiredBody(result.latestVersion),
            style: TextStyle(color: KodaColors.text2, fontSize: 13),
          ),
          if (result.releaseNotes.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(result.releaseNotes, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
          ],
          if (_busy) ...[
            const SizedBox(height: 14),
            LinearProgressIndicator(
              value: _step == SelfUpdateStep.downloading ? _progress : null,
              color: KodaColors.koda,
              backgroundColor: KodaColors.elevated,
            ),
            const SizedBox(height: 6),
            Text(_statusLabel(t), style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          ],
          if (_error != null) ...[
            const SizedBox(height: 10),
            Text(_error!, style: const TextStyle(color: Colors.redAccent, fontSize: 12)),
          ],
        ]),
      ),
      actions: [
        if (widget.dismissible && !_busy)
          TextButton(
            onPressed: () async {
              await VersionCheck.dismiss(result);
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(t.updateNudgeLaterButton),
          ),
        if (canSelfUpdate)
          TextButton(
            onPressed: _busy ? null : _updateNow,
            child: Text(t.updateNudgeUpdateNowButton),
          )
        else
          TextButton(
            onPressed: () => _openDownloadPage(result.downloadUrl),
            child: Text(t.commonDownload),
          ),
      ],
    );
  }

  String _statusLabel(AppLocalizations t) {
    switch (_step) {
      case SelfUpdateStep.downloading:
        return t.updateNudgeDownloading(((_progress ?? 0) * 100).round());
      case SelfUpdateStep.verifying:
        return t.updateNudgeVerifying;
      case SelfUpdateStep.launching:
        return t.updateNudgeLaunching;
      case null:
        return '';
    }
  }
}
