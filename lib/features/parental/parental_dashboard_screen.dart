// lib/features/parental/parental_dashboard_screen.dart
//
// Lists the accounts a parent has linked as children, and lets them
// create a new one. Per-child management (friends/servers/schedule/
// overrides) lives in child_detail_screen.dart.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
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
    final usernameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: const Text('Create Child Account', style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          KodaTextField(controller: usernameCtrl, hintText: 'Username'),
          const SizedBox(height: 10),
          KodaTextField(controller: emailCtrl, hintText: 'Email'),
          const SizedBox(height: 10),
          KodaTextField(controller: passwordCtrl, hintText: 'Password', obscureText: true),
          const SizedBox(height: 8),
          const Text(
            'This creates a fully supervised account: labeled channels are '
            'blocked, and you\'ll be able to set allowed hours and see (but '
            'not read) their friends and servers.',
            style: TextStyle(color: KodaColors.text3, fontSize: 11),
          ),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Create')),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    if (usernameCtrl.text.trim().isEmpty || emailCtrl.text.trim().isEmpty ||
        passwordCtrl.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Username, email, and an 8+ character password are required.')));
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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Could not create child account -- username/email may already be taken.')));
    }
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator(color: KodaColors.koda));
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
          label: Text(_creating ? 'Creating...' : 'Create Child Account'),
          onPressed: _creating ? null : _showCreateDialog,
        ),
        const SizedBox(height: 16),
        if (_children.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text('No linked accounts yet.',
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
                  title: Text(child['username'] as String? ?? 'Unknown',
                      style: const TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w500)),
                  subtitle: const Text('Supervised account',
                      style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                  trailing: const Icon(Icons.chevron_right, color: KodaColors.text3),
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
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: const Text('Family',
            style: TextStyle(color: KodaColors.text1, fontSize: 16, fontWeight: FontWeight.w700)),
      ),
      body: _buildBody(),
    );
  }
}
