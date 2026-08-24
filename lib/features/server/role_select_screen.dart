// lib/features/server/role_select_screen.dart
//
// Shown when a user selects a role-select channel.
// Displays self-assignable roles as cards the user can toggle on/off.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';

class RoleSelectScreen extends StatefulWidget {
  final String serverId;
  final String channelName;

  const RoleSelectScreen({
    super.key,
    required this.serverId,
    required this.channelName,
  });

  @override
  State<RoleSelectScreen> createState() => _RoleSelectScreenState();
}

class _RoleSelectScreenState extends State<RoleSelectScreen> {
  List<Map<String, dynamic>> _roles = [];
  Set<String> _assigned = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final roles = await KodaApi.instance.getAssignableRoles(widget.serverId);
    if (!mounted) return;
    setState(() { _roles = roles; _loading = false; });
  }

  Future<void> _toggle(Map<String, dynamic> role) async {
    final id = role['id'] as String;
    final isAssigned = _assigned.contains(id);

    final ok = isAssigned
        ? await KodaApi.instance.unassignRoleFromSelf(widget.serverId, id)
        : await KodaApi.instance.assignRoleToSelf(widget.serverId, id);

    if (ok && mounted) {
      setState(() {
        if (isAssigned) {
          _assigned.remove(id);
        } else {
          _assigned.add(id);
        }
      });
    }
  }

  Color _roleColor(int colorInt) {
    if (colorInt == 0) return KodaColors.text3;
    return Color(0xFF000000 | colorInt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Row(children: [
          const Icon(Icons.badge_outlined, color: KodaColors.koda, size: 18),
          const SizedBox(width: 8),
          Text(widget.channelName,
              style: const TextStyle(color: KodaColors.text1, fontSize: 15)),
        ]),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _roles.isEmpty
              ? const Center(
                  child: Text('No self-assignable roles available.',
                      style: TextStyle(color: KodaColors.text3)))
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    const Text(
                      'Select the roles you want. Tap a role to add or remove it.',
                      style: TextStyle(color: KodaColors.text3, fontSize: 13),
                    ),
                    const SizedBox(height: 16),
                    ..._roles.map((role) {
                      final id = role['id'] as String;
                      final name = role['name'] as String? ?? '';
                      final color = _roleColor(role['color'] as int? ?? 0);
                      final isAssigned = _assigned.contains(id);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: isAssigned
                              ? color.withOpacity(0.12)
                              : KodaColors.card,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isAssigned
                                ? color.withOpacity(0.5)
                                : KodaColors.border,
                            width: isAssigned ? 1.5 : 1,
                          ),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 14, height: 14,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          title: Text(name,
                              style: TextStyle(
                                  color: isAssigned ? color : KodaColors.text1,
                                  fontWeight: isAssigned
                                      ? FontWeight.w700
                                      : FontWeight.w500)),
                          trailing: Icon(
                            isAssigned
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: isAssigned ? color : KodaColors.text3,
                            size: 20,
                          ),
                          onTap: () => _toggle(role),
                        ),
                      );
                    }).toList(),
                  ],
                ),
    );
  }
}