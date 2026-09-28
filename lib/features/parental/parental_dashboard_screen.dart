// lib/features/parental/parental_dashboard_screen.dart
//
// Lists the accounts a parent has linked as children, and lets them
// create a new one. Per-child management (friends/servers/schedule/
// overrides) lives in child_detail_screen.dart.

import 'package:flutter/material.dart';
import '../../core/api.dart';
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
  bool _loading = true;
  bool _creating = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final children = await KodaApi.instance.listChildren();
    if (!mounted) return;
    setState(() { _children = children; _loading = false; });
  }

  Future<void> _showCreateDialog() async {
    final t = AppLocalizations.of(context);
    final usernameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.parentalDashboardCreateChildTitle, style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          KodaTextField(controller: usernameCtrl, hintText: t.parentalDashboardUsernameHint, autofocus: true),
          const SizedBox(height: 10),
          KodaTextField(controller: emailCtrl, hintText: t.parentalDashboardEmailHint),
          const SizedBox(height: 10),
          KodaTextField(controller: passwordCtrl, hintText: t.parentalDashboardPasswordHint, obscureText: true),
          const SizedBox(height: 8),
          Text(
            t.parentalDashboardCreateChildExplanation,
            style: TextStyle(color: KodaColors.text3, fontSize: 11),
          ),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(t.commonCreate)),
        ],
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
    final child = await KodaApi.instance.createChildAccount(
      username: usernameCtrl.text.trim(),
      email: emailCtrl.text.trim(),
      password: passwordCtrl.text,
    );
    if (!mounted) return;
    setState(() => _creating = false);
    if (child != null) {
      _load();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(t.parentalDashboardCreateChildFailed)));
    }
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
                  onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (_) => ChildDetailScreen(child: child))),
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
