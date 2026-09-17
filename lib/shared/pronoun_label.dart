// lib/shared/pronoun_label.dart
//
// Appends pronouns to a username wherever it's displayed -- server
// visibility is already enforced at the source (Koda.Auth.public_pronouns/1
// omits the key entirely unless the user opted in), so this only ever
// needs to check whether the key is present, never a separate toggle.

/// [user] is whatever "who is this" map the call site already has
/// (a message author, a member row, a voice participant's metadata --
/// anything carrying a 'pronouns' key). Returns username unchanged if
/// pronouns aren't present.
String withPronouns(String username, Map<String, dynamic>? user) {
  final pronouns = (user?['pronouns'] as String?)?.trim();
  if (pronouns == null || pronouns.isEmpty) return username;
  return '$username ($pronouns)';
}
