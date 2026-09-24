// lib/shared/update_nudge.dart
//
// Shown once at startup when lib/core/version_check.dart finds a newer
// build than this one -- see main.dart's AuthGate for where this fires.
// Optional updates get a dismissible banner (suppressed for that exact
// version once dismissed, see VersionCheck.dismiss); a `required: true`
// response from the server (koda-server's VersionController, "set true
// to force update") gets a real non-dismissible dialog instead -- no
// barrier dismiss, no close button, matching what "force" should mean.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme.dart';
import '../core/version_check.dart';

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

class _UpdateDialog extends StatelessWidget {
  final VersionCheckResult result;
  final bool dismissible;
  const _UpdateDialog({required this.result, required this.dismissible});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: KodaColors.card,
      title: Row(children: [
        Icon(dismissible ? Icons.system_update_outlined : Icons.error_outline,
            color: dismissible ? KodaColors.koda : KodaColors.accent, size: 20),
        const SizedBox(width: 8),
        Text(dismissible ? 'Update Available' : 'Update Required',
            style: TextStyle(color: KodaColors.text1)),
      ]),
      content: SizedBox(
        width: 320,
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            dismissible
                ? 'Koda ${result.latestVersion} is available -- you\'re on an older build.'
                : 'This build is no longer supported. Update to Koda ${result.latestVersion} to keep using Koda.',
            style: TextStyle(color: KodaColors.text2, fontSize: 13),
          ),
          if (result.releaseNotes.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(result.releaseNotes, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
          ],
        ]),
      ),
      actions: [
        if (dismissible)
          TextButton(
            onPressed: () async {
              await VersionCheck.dismiss(result);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Later'),
          ),
        TextButton(
          onPressed: () => _openDownloadPage(result.downloadUrl),
          child: const Text('Download'),
        ),
      ],
    );
  }
}
