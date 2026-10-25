// lib/features/parental/parental_dashboard_screen.dart
//
// Lists the accounts a parent/guardian has linked as children, lets
// them start a new one, and shows in-flight verifiable-parental-consent
// requests (see koda-server's Koda.Parental moduledoc) -- no child
// account exists until consent actually resolves, so "create a child
// account" here really means "start a consent request," not an
// immediate account. Per-child management (friends/servers/schedule/
// overrides) lives in child_detail_screen.dart.
//
// "Parent" throughout this screen's copy means parent OR any other
// authorized legal guardian -- never assumed to be narrower than that.

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/api.dart';
import '../../core/config.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';
import 'child_detail_screen.dart';

class ParentalDashboardScreen extends StatefulWidget {
  /// When true, renders without its own Scaffold/AppBar -- see
  /// marketplace_screen.dart's identical convention, used here to sit
  /// inline inside settings_screen.dart's Family section.
  final bool embedded;
  const ParentalDashboardScreen({super.key, this.embedded = false});

  @override
  State<ParentalDashboardScreen> createState() => _ParentalDashboardScreenState();
}

class _ParentalDashboardScreenState extends State<ParentalDashboardScreen> {
  List<Map<String, dynamic>> _children = [];
  List<Map<String, dynamic>> _requests = [];
  bool _loading = true;
  bool _creating = false;
  bool _uploading = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final children = await KodaApi.instance.listChildren();
    final requests = await KodaApi.instance.listConsentRequests();
    if (!mounted) return;
    setState(() {
      _children = children;
      // Approved requests are superseded by the real account showing
      // up in _children above -- no need to also show them here.
      _requests = requests.where((r) => r['status'] != 'approved').toList();
      _loading = false;
    });
  }

  Future<void> _openPrivacyPolicy() async {
    final uri = Uri.parse(KodaConfig.privacyUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _showCreateDialog() async {
    final t = AppLocalizations.of(context);
    final usernameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    String method = 'credit_card';
    bool attested = false;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(t.parentalDashboardCreateChildTitle, style: TextStyle(color: KodaColors.text1)),
          content: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              KodaTextField(controller: usernameCtrl, hintText: t.parentalDashboardUsernameHint, autofocus: true),
              const SizedBox(height: 10),
              KodaTextField(controller: emailCtrl, hintText: t.parentalDashboardEmailHint),
              const SizedBox(height: 10),
              KodaTextField(controller: passwordCtrl, hintText: t.parentalDashboardPasswordHint, obscureText: true),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(style: TextStyle(color: KodaColors.text3, fontSize: 11), children: [
                  TextSpan(text: t.parentalConsentPrivacyNoticePrefix),
                  TextSpan(
                    text: t.authPrivacyLink,
                    style: TextStyle(color: KodaColors.koda),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _openPrivacyPolicy(),
                  ),
                  TextSpan(text: t.parentalConsentPrivacyNoticeSuffix),
                ]),
              ),
              const SizedBox(height: 14),
              Text(t.parentalConsentMethodLabel,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11, fontWeight: FontWeight.w700)),
              _methodOption(
                selected: method == 'credit_card',
                title: t.parentalConsentMethodCardTitle,
                subtitle: t.parentalConsentMethodCardSubtitle,
                onTap: () => setDialogState(() => method = 'credit_card'),
              ),
              _methodOption(
                selected: method == 'signed_form',
                title: t.parentalConsentMethodFormTitle,
                subtitle: t.parentalConsentMethodFormSubtitle,
                onTap: () => setDialogState(() => method = 'signed_form'),
              ),
              const SizedBox(height: 8),
              Text(t.parentalDashboardCreateChildExplanation,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              const SizedBox(height: 8),
              CheckboxListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: KodaColors.koda,
                value: attested,
                title: Text(t.parentalConsentAttestation, style: TextStyle(color: KodaColors.text1, fontSize: 12)),
                onChanged: (v) => setDialogState(() => attested = v ?? false),
              ),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: Text(t.commonCancel)),
            TextButton(
              onPressed: attested ? () => Navigator.pop(dialogContext, true) : null,
              child: Text(t.commonContinue),
            ),
          ],
        ),
      ),
    );
    if (confirmed != true || !mounted) return;
    if (usernameCtrl.text.trim().isEmpty || emailCtrl.text.trim().isEmpty ||
        passwordCtrl.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(t.parentalDashboardValidationError)));
      return;
    }

    setState(() => _creating = true);
    final result = await KodaApi.instance.createConsentRequest(
      childUsername: usernameCtrl.text.trim(),
      childEmail: emailCtrl.text.trim(),
      childPassword: passwordCtrl.text,
      method: method,
    );
    if (!mounted) return;
    setState(() => _creating = false);

    if (result.request == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(t.parentalDashboardCreateChildFailed)));
      return;
    }

    await _load();
    if (!mounted) return;

    if (result.checkoutUrl != null) {
      await _openCheckout(result.checkoutUrl!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.parentalConsentUploadFormHint)));
    }
  }

  Future<void> _openCheckout(String url) async {
    final t = AppLocalizations.of(context);
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.parentalConsentFinishInBrowser)));
    }
  }

  Future<void> _uploadDocument(String requestId) async {
    final t = AppLocalizations.of(context);
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result == null || result.files.single.path == null) return;
    final path = result.files.single.path!;
    final ext = path.split('.').last.toLowerCase();
    final contentType = ext == 'pdf'
        ? 'application/pdf'
        : ext == 'png' ? 'image/png' : 'image/jpeg';

    setState(() => _uploading = true);
    final ok = await KodaApi.instance.uploadConsentDocument(requestId, File(path), contentType);
    if (!mounted) return;
    setState(() => _uploading = false);
    if (ok) {
      await _load();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.commonActionFailed)));
    }
  }

  Widget _methodOption({
    required bool selected,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              size: 18, color: selected ? KodaColors.koda : KodaColors.text3),
          const SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: TextStyle(color: KodaColors.text1, fontSize: 13)),
            Text(subtitle, style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          ])),
        ]),
      ),
    );
  }

  Widget _buildRequestRow(AppLocalizations t, Map<String, dynamic> r) {
    final method = r['method'] as String? ?? '';
    final status = r['status'] as String? ?? '';
    final username = r['child_username'] as String? ?? '';

    String statusLabel;
    Widget? action;
    switch (status) {
      case 'rejected':
        statusLabel = t.parentalConsentStatusRejected((r['review_reason'] as String?) ?? '');
        break;
      case 'expired':
        statusLabel = t.parentalConsentStatusExpired;
        break;
      default: // pending
        if (method == 'signed_form' && r['consent_document_key'] == null) {
          statusLabel = t.parentalConsentStatusAwaitingUpload;
          action = TextButton(
            onPressed: _uploading ? null : () => _uploadDocument(r['id'] as String),
            child: Text(t.parentalConsentUploadFormButton),
          );
        } else if (method == 'signed_form') {
          statusLabel = t.parentalConsentStatusAwaitingReview;
        } else {
          statusLabel = t.parentalConsentStatusAwaitingPayment;
        }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: KodaColors.border),
      ),
      child: Row(children: [
        Icon(Icons.hourglass_top, size: 16, color: KodaColors.text3),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(username, style: TextStyle(color: KodaColors.text1, fontSize: 13, fontWeight: FontWeight.w500)),
          Text(statusLabel, style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        ])),
        if (action != null) action,
      ]),
    );
  }

  Widget _buildBody() {
    final t = AppLocalizations.of(context);
    if (_loading) {
      return Center(child: CircularProgressIndicator(color: KodaColors.koda));
    }
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: KodaColors.koda,
            foregroundColor: Colors.black,
            minimumSize: const Size(double.infinity, 40),
          ),
          icon: _creating
              ? const SizedBox(width: 14, height: 14,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
              : const Icon(Icons.add, size: 18),
          label: Text(_creating ? t.parentalDashboardCreatingLabel : t.parentalDashboardCreateChildTitle),
          onPressed: _creating ? null : _showCreateDialog,
        ),
        if (_requests.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(t.parentalConsentPendingSectionTitle, style: TextStyle(color: KodaColors.text3,
              fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
          const SizedBox(height: 8),
          ..._requests.map((r) => _buildRequestRow(t, r)),
        ],
        const SizedBox(height: 16),
        if (_children.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(t.parentalDashboardNoChildren,
                textAlign: TextAlign.center,
                style: TextStyle(color: KodaColors.text3, fontSize: 13)),
          )
        else
          ..._children.map((child) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: KodaColors.card,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: KodaColors.border),
                ),
                child: ListTile(
                  leading: KodaAvatar(
                      username: child['username'] as String? ?? '?',
                      avatarUrl: child['avatar_url'] as String?, size: 36),
                  title: Text(child['username'] as String? ?? t.parentalDashboardUnknownUser,
                      style: TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w500)),
                  subtitle: Text(t.parentalDashboardSupervisedLabel,
                      style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                  trailing: Icon(Icons.chevron_right, color: KodaColors.text3),
                  onTap: () async {
                    await Navigator.push(context, MaterialPageRoute(
                        builder: (_) => ChildDetailScreen(child: child)));
                    if (mounted) _load();
                  },
                ),
              )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.embedded) return _buildBody();
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.parentalDashboardTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 16, fontWeight: FontWeight.w700)),
      ),
      body: _buildBody(),
    );
  }
}
