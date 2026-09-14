// lib/core/secure_storage.dart
//
// flutter_secure_storage-backed persistence for everything that must
// never sit in a plain-text file on disk: private key material, Double
// Ratchet session state, and TOFU-pinned peer identities. Backed by
// Windows Credential Manager / macOS Keychain / Android Keystore /
// Linux Secret Service depending on platform -- meaningfully stronger
// than the shared_preferences flat file the JWT (also moved here) used
// to live in.

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'crypto/kcp_primitives.dart';
import 'crypto/x3dh.dart';
import 'crypto/double_ratchet.dart';
import 'crypto/safety_number.dart';

const _storage = FlutterSecureStorage(
  aOptions: AndroidOptions(encryptedSharedPreferences: true),
);

const _keyMaterialKey = 'kcp_key_material_v1';
const _tokenKey = 'koda_jwt_v1';

String _ratchetKey(String conversationId) => 'kcp_ratchet_$conversationId';
String _pinnedIdentityKey(String userId) => 'kcp_pinned_identity_$userId';

class SecureStorage {
  // ── Auth token ─────────────────────────────────────────────────────────
  // Same public shape as the old shared_preferences-backed KodaStorage so
  // api.dart didn't need to change.

  static Future<void> saveToken(String token) => _storage.write(key: _tokenKey, value: token);

  static Future<String?> loadToken() => _storage.read(key: _tokenKey);

  static Future<void> clearToken() => _storage.delete(key: _tokenKey);

  // ── My own key material (identity, signed prekey, one-time prekeys) ────

  static Future<void> saveKeyMaterial(LocalKeyMaterial material) async {
    await _storage.write(key: _keyMaterialKey, value: jsonEncode(_materialToJson(material)));
  }

  static Future<LocalKeyMaterial?> loadKeyMaterial() async {
    final raw = await _storage.read(key: _keyMaterialKey);
    if (raw == null) return null;
    return _materialFromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  /// Removes one consumed one-time prekey by its public key, mirroring
  /// the server having just popped the matching entry -- keeps the local
  /// store from accumulating private keys for prekeys nobody can hand
  /// out anymore, and more importantly stops it from ever being reused.
  static Future<void> removeOneTimePrekey(Uint8List publicKeyBytes) async {
    final material = await loadKeyMaterial();
    if (material == null) return;
    final remaining = material.oneTimePrekeys
        .where((k) => bytesToB64(k.publicKeyBytes) != bytesToB64(publicKeyBytes))
        .toList();
    if (remaining.length == material.oneTimePrekeys.length) return;
    await saveKeyMaterial(LocalKeyMaterial(
      material.identity,
      material.signedPrekey,
      remaining,
      signedPrekeyCreatedAt: material.signedPrekeyCreatedAt,
      previousSignedPrekey: material.previousSignedPrekey,
      previousSignedPrekeyExpiresAt: material.previousSignedPrekeyExpiresAt,
    ));
  }

  // ── Per-conversation Double Ratchet state ───────────────────────────────

  static Future<void> saveRatchetState(String conversationId, RatchetState state) =>
      _storage.write(key: _ratchetKey(conversationId), value: jsonEncode(state.toJson()));

  static Future<RatchetState?> loadRatchetState(String conversationId) async {
    final raw = await _storage.read(key: _ratchetKey(conversationId));
    if (raw == null) return null;
    return RatchetState.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  static Future<void> deleteRatchetState(String conversationId) =>
      _storage.delete(key: _ratchetKey(conversationId));

  // ── Decrypted-content cache ─────────────────────────────────────────────
  // Double Ratchet is forward-secret by design: once a message key is
  // used (receiving) or the sending chain advances past it (sending),
  // that plaintext cannot be re-derived from ratchet state again -- not
  // even by the person who sent it. That's the whole point (a
  // compromised-later device can't decrypt past traffic), but it means
  // *something* has to remember plaintext for the chat UI to redisplay
  // history after a restart. This is that something: content is cached
  // here the moment it's known (on send, and right after a successful
  // decrypt), keyed by message id.
  //
  // A dedicated local database would scale to a large history better
  // than the platform keychain/credential-manager backends this uses --
  // acceptable for now, worth revisiting if conversation history grows
  // large.

  static Future<void> cacheDecryptedContent(String messageId, String plaintext) =>
      _storage.write(key: 'kcp_msg_$messageId', value: plaintext);

  static Future<String?> getCachedDecryptedContent(String messageId) =>
      _storage.read(key: 'kcp_msg_$messageId');

  // ── TOFU-pinned peer identities ─────────────────────────────────────────

  static Future<void> savePinnedIdentity(String userId, PinnedIdentity identity) =>
      _storage.write(key: _pinnedIdentityKey(userId), value: jsonEncode(identity.toJson()));

  static Future<PinnedIdentity?> loadPinnedIdentity(String userId) async {
    final raw = await _storage.read(key: _pinnedIdentityKey(userId));
    if (raw == null) return null;
    return PinnedIdentity.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  // ── Serialization helpers ───────────────────────────────────────────────

  static Map<String, dynamic> _materialToJson(LocalKeyMaterial m) => {
        'identity': {
          'signing': {
            'priv': bytesToB64(m.identity.signing.privateKeyBytes),
            'pub':  bytesToB64(m.identity.signing.publicKeyBytes),
          },
          'dh': {
            'priv': bytesToB64(m.identity.dh.privateKeyBytes),
            'pub':  bytesToB64(m.identity.dh.publicKeyBytes),
          },
        },
        'signed_prekey': {
          'priv': bytesToB64(m.signedPrekey.privateKeyBytes),
          'pub':  bytesToB64(m.signedPrekey.publicKeyBytes),
        },
        'signed_prekey_created_at': m.signedPrekeyCreatedAt.toIso8601String(),
        if (m.previousSignedPrekey != null)
          'previous_signed_prekey': {
            'priv': bytesToB64(m.previousSignedPrekey!.privateKeyBytes),
            'pub':  bytesToB64(m.previousSignedPrekey!.publicKeyBytes),
          },
        if (m.previousSignedPrekeyExpiresAt != null)
          'previous_signed_prekey_expires_at':
              m.previousSignedPrekeyExpiresAt!.toIso8601String(),
        'one_time_prekeys': m.oneTimePrekeys
            .map((k) => {'priv': bytesToB64(k.privateKeyBytes), 'pub': bytesToB64(k.publicKeyBytes)})
            .toList(),
      };

  static LocalKeyMaterial _materialFromJson(Map<String, dynamic> j) {
    X25519KeyPair x25519From(Map<String, dynamic> k) =>
        X25519KeyPair(b64ToBytes(k['priv'] as String), b64ToBytes(k['pub'] as String));
    Ed25519KeyPair ed25519From(Map<String, dynamic> k) =>
        Ed25519KeyPair(b64ToBytes(k['priv'] as String), b64ToBytes(k['pub'] as String));

    final identityJson = j['identity'] as Map<String, dynamic>;
    final createdAtRaw = j['signed_prekey_created_at'] as String?;
    final previousJson = j['previous_signed_prekey'] as Map<String, dynamic>?;
    final previousExpiresRaw = j['previous_signed_prekey_expires_at'] as String?;
    return LocalKeyMaterial(
      IdentityKeyPair(
        ed25519From(identityJson['signing'] as Map<String, dynamic>),
        x25519From(identityJson['dh'] as Map<String, dynamic>),
      ),
      x25519From(j['signed_prekey'] as Map<String, dynamic>),
      (j['one_time_prekeys'] as List)
          .map((k) => x25519From(k as Map<String, dynamic>))
          .toList(),
      // Older locally-stored bundles predate SPK rotation and have no
      // timestamp -- treat as "just created" so rotation waits a full
      // interval from first launch after the update, rather than
      // rotating immediately for every existing install.
      signedPrekeyCreatedAt:
          createdAtRaw != null ? DateTime.parse(createdAtRaw) : DateTime.now().toUtc(),
      previousSignedPrekey: previousJson != null ? x25519From(previousJson) : null,
      previousSignedPrekeyExpiresAt:
          previousExpiresRaw != null ? DateTime.parse(previousExpiresRaw) : null,
    );
  }
}
