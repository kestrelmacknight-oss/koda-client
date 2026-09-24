// lib/shared/category_edit_dialog.dart
//
// Shared category create/edit dialog (name, role access) -- same
// reasoning as channel_edit_dialog.dart: one copy instead of drifting
// duplicates between server settings and the sidebar's own right-click.

import 'package:flutter/material.dart';
import '../core/api.dart';
import '../core/theme.dart';
import 'widgets.dart';

Future<void> showCategoryEditDialog(
  BuildContext context, {
  required String serverId,
  required List<Map<String, dynamic>> roles,
  Map<String, dynamic>? existing,
  required VoidCallback onSaved,
}) async {
  final controller = TextEditingController(text: existing?['name'] ?? '');
  final selectedRoleIds = List<String>.from(existing?['allowed_role_ids'] ?? []);

  final saved = await showDialog<bool>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setDialogState) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(existing == null ? 'New Category' : 'Edit Category',
            style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 340,
          height: 360,
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              KodaTextField(controller: controller, hintText: 'Category name'),
              if (roles.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text('Role Access (leave empty for all)',
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 6),
                ...roles.where((r) => r['is_default'] != true).map((role) {
                  final roleId = role['id'] as String;
                  final isSelected = selectedRoleIds.contains(roleId);
                  return CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(role['name'] as String? ?? '',
                        style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                    value: isSelected,
                    activeColor: KodaColors.koda,
                    onChanged: (v) => setDialogState(() {
                      if (v == true) {
                        selectedRoleIds.add(roleId);
                      } else {
                        selectedRoleIds.remove(roleId);
                      }
                    }),
                  );
                }),
              ],
            ]),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Save')),
        ],
      ),
    ),
  );
  if (saved != true || controller.text.trim().isEmpty) return;
  final name = controller.text.trim();
  if (existing == null) {
    final created = await KodaApi.instance.createCategory(serverId, name);
    if (created != null && selectedRoleIds.isNotEmpty) {
      await KodaApi.instance.setCategoryAllowedRoles(created['id'] as String, selectedRoleIds);
    }
  } else {
    await KodaApi.instance.updateCategory(existing['id'], name);
    await KodaApi.instance.setCategoryAllowedRoles(existing['id'] as String, selectedRoleIds);
  }
  onSaved();
}
