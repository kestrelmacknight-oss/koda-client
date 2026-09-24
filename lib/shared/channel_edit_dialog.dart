// lib/shared/channel_edit_dialog.dart
//
// The full channel create/edit dialog (type, category, announcement
// toggle, role access) -- shared so the channel right-click menu in
// home_screen.dart and the Channels tab in server_settings_screen.dart
// don't maintain two different, drifting copies of the same form. This
// used to only exist in server settings; the sidebar's own "Edit
// Channel" opened a rename-only dialog with none of the rest.

import 'package:flutter/material.dart';
import '../core/api.dart';
import '../core/theme.dart';
import '../features/settings/content_filters_screen.dart' show kContentLabels, kContentLabelNames;
import 'widgets.dart';

Future<void> showChannelEditDialog(
  BuildContext context, {
  required String serverId,
  required List<Map<String, dynamic>> categories,
  required List<Map<String, dynamic>> roles,
  Map<String, dynamic>? existing,
  String? categoryId,
  required VoidCallback onSaved,
}) async {
  final nameController = TextEditingController(text: existing?['name'] ?? '');
  String type = existing?['type'] ?? 'text';
  String? selectedCategoryId = existing?['category_id'] ?? categoryId;
  bool isReadOnly = existing?['is_read_only'] == true;
  bool liveAnnouncements = existing?['live_announcements'] == true;
  final allowedRoleIds = List<String>.from(existing?['allowed_role_ids'] ?? []);
  final selectedRoleIds = List<String>.from(allowedRoleIds);
  final announcementRoleIds = List<String>.from(existing?['announcement_role_ids'] ?? []);
  final selectedLabels = List<String>.from(existing?['content_labels'] ?? []);

  final saved = await showDialog<bool>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setDialogState) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(existing == null ? 'New Channel' : 'Edit Channel',
            style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 340,
          height: 400,
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              KodaTextField(controller: nameController, hintText: 'Channel name'),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: type,
                dropdownColor: KodaColors.card,
                decoration: const InputDecoration(labelText: 'Type'),
                items: const [
                  DropdownMenuItem(value: 'text', child: Text('Text')),
                  DropdownMenuItem(value: 'voice', child: Text('Voice')),
                  DropdownMenuItem(value: 'gallery', child: Text('Gallery')),
                  DropdownMenuItem(value: 'stage', child: Text('Stage')),
                  DropdownMenuItem(value: 'rules', child: Text('Rules')),
                  DropdownMenuItem(value: 'role-select', child: Text('Role Selection')),
                  DropdownMenuItem(value: 'calendar', child: Text('Calendar')),
                ],
                onChanged: (v) => setDialogState(() => type = v ?? 'text'),
              ),
              if (type == 'text') ...[
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Announcement channel',
                      style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                  subtitle: Text('Only members who can manage messages may post',
                      style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                  value: isReadOnly,
                  activeColor: KodaColors.koda,
                  onChanged: (v) => setDialogState(() => isReadOnly = v ?? false),
                ),
                if (isReadOnly)
                  CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text('Post live-stream & upload announcements here',
                        style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                    subtitle: Text(
                        'Auto-posts when a member with the "Announce when live" '
                        'permission goes live on Twitch, or posts a new YouTube video',
                        style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                    value: liveAnnouncements,
                    activeColor: KodaColors.koda,
                    onChanged: (v) => setDialogState(() => liveAnnouncements = v ?? false),
                  ),
                if (isReadOnly && roles.isNotEmpty) ...[
                  Text('Notify these roles when posted (optional)',
                      style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                  const SizedBox(height: 4),
                  ...roles.where((r) => r['is_default'] != true).map((role) {
                    final roleId = role['id'] as String;
                    final isSelected = announcementRoleIds.contains(roleId);
                    return CheckboxListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(role['name'] as String? ?? '',
                          style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                      value: isSelected,
                      activeColor: KodaColors.koda,
                      onChanged: (v) => setDialogState(() {
                        if (v == true) {
                          announcementRoleIds.add(roleId);
                        } else {
                          announcementRoleIds.remove(roleId);
                        }
                      }),
                    );
                  }),
                ],
              ],
              const SizedBox(height: 12),
              DropdownButtonFormField<String?>(
                initialValue: selectedCategoryId,
                dropdownColor: KodaColors.card,
                decoration: const InputDecoration(labelText: 'Category'),
                items: [
                  const DropdownMenuItem(value: null, child: Text('No category')),
                  ...categories.map((c) => DropdownMenuItem(
                      value: c['id'] as String, child: Text(c['name']))),
                ],
                onChanged: (v) => setDialogState(() => selectedCategoryId = v),
              ),
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
              if (existing != null) ...[
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Content Labels',
                      style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                ),
                Text(
                  'Flags this channel for members\' content filters; hard-blocked for supervised accounts',
                  style: TextStyle(color: KodaColors.text3, fontSize: 10),
                ),
                const SizedBox(height: 4),
                ...kContentLabels.map((label) {
                  final isSelected = selectedLabels.contains(label);
                  return CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(kContentLabelNames[label] ?? label,
                        style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                    value: isSelected,
                    activeColor: KodaColors.koda,
                    onChanged: (v) => setDialogState(() {
                      if (v == true) {
                        selectedLabels.add(label);
                      } else {
                        selectedLabels.remove(label);
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

  if (saved != true || nameController.text.trim().isEmpty) return;
  final name = nameController.text.trim();
  if (existing == null) {
    final created = await KodaApi.instance.createChannel(
        serverId: serverId, name: name, type: type, categoryId: selectedCategoryId,
        isReadOnly: isReadOnly);
    if (created != null && selectedRoleIds.isNotEmpty) {
      await KodaApi.instance.setChannelAllowedRoles(created['id'] as String, selectedRoleIds);
    }
  } else {
    await KodaApi.instance.updateChannel(existing['id'], {
      'name': name, 'type': type, 'category_id': selectedCategoryId,
      'is_read_only': isReadOnly, 'content_labels': selectedLabels,
      'announcement_role_ids': announcementRoleIds,
      'live_announcements': liveAnnouncements,
    });
    await KodaApi.instance.setChannelAllowedRoles(existing['id'] as String, selectedRoleIds);
  }
  onSaved();
}
