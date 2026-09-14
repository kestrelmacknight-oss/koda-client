// lib/core/permissions.dart
//
// One-off "does the current user have permission X for server Y" check,
// for screens reachable from more than one entry point (e.g. the home
// sidebar vs. Settings' embedded Billing tab) that therefore can't rely
// on a parent screen's already-computed permission state the way
// home_screen.dart's own _loadMyPermissions/_can() do for itself.
//
// Owner (or a site-wide Koda admin) always passes, matching every other
// permission check in this app -- see koda-server's
// Koda.Servers.member_can?/3, which this mirrors client-side for UI
// gating only. The server re-checks independently and is always the
// real authority; this just decides whether to show a button.

import 'api.dart';

Future<bool> hasServerPermission(
  Map<String, dynamic>? server,
  String permission, {
  required String? currentUserId,
  bool isKodaAdmin = false,
}) async {
  if (server == null || currentUserId == null) return false;
  if (server['owner_id'] == currentUserId || isKodaAdmin) return true;

  final serverId = server['id'] as String;
  final results = await Future.wait([
    KodaApi.instance.getMembers(serverId),
    KodaApi.instance.getRoles(serverId),
  ]);
  final members = results[0];
  final roles = results[1];

  final myMember = members
      .where((m) => m['user_id'] == currentUserId)
      .cast<Map<String, dynamic>?>()
      .firstOrNull;
  final myRoleIds = <String>{
    for (final r in (myMember?['roles'] as List? ?? [])) r['id'] as String,
  };

  for (final role in roles) {
    if (!myRoleIds.contains(role['id'])) continue;
    final perms = role['permissions'] as Map<String, dynamic>? ?? {};
    if (perms[permission] == true) return true;
  }
  return false;
}
