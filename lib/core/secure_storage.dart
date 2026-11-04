// lib/core/secure_storage.dart
//
// flutter_secure_storage-backed persistence for everything that must
// never sit in a plain-text file on disk: private key material, Double
// Ratchet session state, and TOFU-pinned peer identities. Backed by
// Windows Credential Manager / macOS Keychain / Android Keystore /
// Linux Secret Service depending on platform -- meaningfully stronger
// than the shared_preferences flat file the JWT (also moved here) used
// to live in.
//
// Windows concurrency note: flutter_secure_storage's Windows backend
// (the FFI implementation, package:flutter_secure_storage_windows's
// DpapiJsonFileMapStorage) keeps every key in ONE shared DPAPI-encrypted
// JSON file and does a full load-the-whole-file -> modify one key ->
// re-encrypt -> overwrite-the-whole-file on every single read, write,
// AND delete -- with no locking of its own. Two of those overlapping
// doesn't error, it just silently loses whichever change lost the
// race (the loser's save() overwrites the file with its own stale
// snapshot, clobbering whatever the winner just wrote) -- and a read
// that catches a write mid-flight can look like a corrupt file, which
// that package's load() responds to by deleting the file outright.
// This app fires plenty of storage calls from overlapping async chains
// (an unawaited ensureReady() distributing keys in the background
// while _load() is concurrently caching decrypted messages, for
// instance), so every call that touches [_storage] below is funneled
// through [_synchronized] to serialize them -- cheap on every other
// platform, and the only thing that makes Windows safe. Every other
// platform's backend (Keychain, Keystore-backed EncryptedSharedPreferences,
// libsecret) already treats each key as its own atomic native call
// rather than one shared blob, so this specific failure mode is
// Windows-only -- but the serialization costs nothing elsewhere and
// closes the door on it regardless of backend.
//
// Per-account scoping: key material and the device id are namespaced
// by [userId] below (loadKeyMaterial, saveKeyMaterial,
// removeOneTimePrekey, getOrCreateDeviceId) because this app allows
// signing into a *different* Koda account on the same install (a
// shared machine, or just switching accounts for testing) without
// reinstalling. Before this, both lived under one global key with no
// notion of "whose" -- the second account to ever launch on that
// install would see the first account's already-generated identity
// key material, silently adopt it as its own, and publish a server
// bundle built from a stranger's private key. Every account on a
// shared install now gets its own slot; _loadKeyMaterialRaw/
// _loadOrCreateDeviceId below handle the one-time migration for an
// install that predates this.

import 'dart:async';
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

// Pre-multi-account-aware keys -- every install before this scoping
// existed stored its one-and-only key material/device id here, global
// to the whole install rather than scoped to whichever account was
// using it. Only ever read now, as a one-time migration source for
// whichever account first asks after upgrading (see
// _loadKeyMaterialRaw/_loadOrCreateDeviceId below) -- never written to
// again.
const _legacyKeyMaterialKey = 'kcp_key_material_v1';
const _legacyDeviceIdKey = 'kcp_device_id';

String _keyMaterialKey(String userId) => 'kcp_key_material_v2_$userId';
String _deviceIdKeyFor(String userId) => 'kcp_device_id_v2_$userId';

const _tokenKey = 'koda_jwt_v1';
const _userIdKey = 'koda_user_id_v1';

/// One global queue every storage operation runs through, in order --
/// see this file's header. Not reentrant: a function running inside
/// [_synchronized] must call [_storage] directly (or another function
/// that does), never call back into [_synchronized] itself, or it
/// deadlocks waiting on a slot that can't open until it returns.
Future<void> _storageQueue = Future.value();

Future<T> _synchronized<T>(Future<T> Function() action) {
  final run = _storageQueue.then((_) => action());
  // Chain off a version that swallows the error, so one failed op
  // doesn't jam every later one behind a Future that never completes.
  _storageQueue = run.then((_) {}, onError: (_) {});
  return run;
}

/// [peerDeviceId] null selects the original (pre-multi-device) storage
/// key -- used only for legacy conversations that predate per-device
/// ratchet sessions (see dm_session_manager.dart's decryptReceived).
/// Every new session is keyed by device.
String _ratchetKey(String conversationId, [String? peerDeviceId]) =>
    peerDeviceId == null ? 'kcp_ratchet_$conversationId' : 'kcp_ratchet_${conversationId}_$peerDeviceId';
/// Each of a peer's devices has its own independent identity keypair
/// (see SecureStorage.getOrCreateDeviceId's doc on why), so TOFU pinning
/// -- and the safety number computed from a pinned identity -- is now
/// per (peer user, peer device), not per peer user alone. [deviceId]
/// null selects the original pre-multi-device key, used only to keep
/// legacy (pre-migration) pins meaningful for their existing single
/// session -- see dm_session_manager.dart.
String _pinnedIdentityKey(String userId, [String? deviceId]) =>
    deviceId == null ? 'kcp_pinned_identity_$userId' : 'kcp_pinned_identity_${userId}_$deviceId';
String _channelEpochKey(String channelId, int epoch) => 'kcp_chan_epoch_${channelId}_$epoch';
String _channelEpochsIndexKey(String channelId) => 'kcp_chan_epochs_$channelId';

/// Raw (unlocked) key-material load/save -- used both by the public,
/// locked saveKeyMaterial/loadKeyMaterial below and by other functions
/// here that need to read or write it as one step of their own
/// [_synchronized] block (removeOneTimePrekey, _loadOrCreateDeviceId).
Future<void> _saveKeyMaterialRaw(String userId, LocalKeyMaterial material) =>
    _storage.write(
        key: _keyMaterialKey(userId), value: jsonEncode(SecureStorage._materialToJson(material)));

/// [userId] scopes this to one signed-in account -- see this file's
/// header on why that matters. Falls back to (and migrates) whatever a
/// pre-scoping install had under the old global key, exactly once: the
/// first account to read after upgrading adopts it as its own and the
/// legacy key is deleted, so a second account on the same install
/// correctly gets "no material yet" and generates its own, rather than
/// also adopting someone else's.
Future<LocalKeyMaterial?> _loadKeyMaterialRaw(String userId) async {
  final raw = await _storage.read(key: _keyMaterialKey(userId));
  if (raw != null) {
    return SecureStorage._materialFromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  final legacyRaw = await _storage.read(key: _legacyKeyMaterialKey);
  if (legacyRaw == null) return null;
  await _storage.write(key: _keyMaterialKey(userId), value: legacyRaw);
  await _storage.delete(key: _legacyKeyMaterialKey);
  return SecureStorage._materialFromJson(jsonDecode(legacyRaw) as Map<String, dynamic>);
}

Future<List<int>> _knownChannelEpochsRaw(String channelId) async {
  final raw = await _storage.read(key: _channelEpochsIndexKey(channelId));
  if (raw == null) return [];
  return (jsonDecode(raw) as List).cast<int>();
}

class SecureStorage {
  // ── Auth token ─────────────────────────────────────────────────────────
  // Same public shape as the old shared_preferences-backed KodaStorage so
  // api.dart didn't need to change.

  static Future<void> saveToken(String token) =>
      _synchronized(() => _storage.write(key: _tokenKey, value: token));

  static Future<String?> loadToken() =>
      _synchronized(() => _storage.read(key: _tokenKey));

  static Future<void> clearToken() =>
      _synchronized(() => _storage.delete(key: _tokenKey));

  // ── My own user id ───────────────────────────────────────────────────────
  // Kept alongside the token (set/cleared together by AuthNotifier, see
  // providers.dart) specifically so background_sync.dart's push
  // background handler -- which runs in its own isolate with no
  // Riverpod authProvider state at all -- has a way to know whose
  // messages it's decrypting.

  static Future<void> saveUserId(String userId) =>
      _synchronized(() => _storage.write(key: _userIdKey, value: userId));

  static Future<String?> loadUserId() =>
      _synchronized(() => _storage.read(key: _userIdKey));

  static Future<void> clearUserId() =>
      _synchronized(() => _storage.delete(key: _userIdKey));

  // ── My own key material (identity, signed prekey, one-time prekeys) ────
  // [userId] scopes every one of these to one signed-in account -- two
  // different Koda accounts used on the same install must never share
  // (or silently clobber) each other's private key material. See this
  // file's header and _loadKeyMaterialRaw's doc on the one-time
  // migration for installs that predate this scoping.

  static Future<void> saveKeyMaterial(String userId, LocalKeyMaterial material) =>
      _synchronized(() => _saveKeyMaterialRaw(userId, material));

  static Future<LocalKeyMaterial?> loadKeyMaterial(String userId) =>
      _synchronized(() => _loadKeyMaterialRaw(userId));

  /// Removes one consumed one-time prekey by its public key, mirroring
  /// the server having just popped the matching entry -- keeps the local
  /// store from accumulating private keys for prekeys nobody can hand
  /// out anymore, and more importantly stops it from ever being reused.
  /// Read-modify-write runs as one locked step so a concurrent key-
  /// material write from elsewhere can't land between the read and the
  /// write here and get silently discarded.
  static Future<void> removeOneTimePrekey(String userId, Uint8List publicKeyBytes) =>
      _synchronized(() async {
        final material = await _loadKeyMaterialRaw(userId);
        if (material == null) return;
        final remaining = material.oneTimePrekeys
            .where((k) => bytesToB64(k.publicKeyBytes) != bytesToB64(publicKeyBytes))
            .toList();
        if (remaining.length == material.oneTimePrekeys.length) return;
        await _saveKeyMaterialRaw(userId, LocalKeyMaterial(
          material.identity,
          material.signedPrekey,
          remaining,
          signedPrekeyCreatedAt: material.signedPrekeyCreatedAt,
          previousSignedPrekey: material.previousSignedPrekey,
          previousSignedPrekeyExpiresAt: material.previousSignedPrekeyExpiresAt,
        ));
      });

  // ── Device identity (multi-device E2EE, see Koda.Devices server-side) ──

  /// A random id generated once per (install, account) and never
  /// regenerated -- each device has its own independent X3DH identity
  /// keypair (no device-linking ceremony exists to transfer one
  /// securely between devices, so each has to generate its own; see
  /// PUSH_NOTIFICATIONS.md-style docs on why that's an accepted
  /// trade-off, not an oversight). Scoped per [userId] for the same
  /// reason key material is -- two different accounts signing into the
  /// same install are still, correctly, two independent devices as far
  /// as E2EE is concerned, even though they happen to share one
  /// physical machine (the server's own key_bundles/devices rows are
  /// already scoped by (user, device_id), so two accounts coincidentally
  /// holding the same device_id string causes no collision there).
  ///
  /// An *existing* single-account install (one that already has local
  /// key material, under the old unscoped key, the first time this runs
  /// on the per-account-aware client) deliberately adopts the fixed id
  /// "legacy" instead of a fresh random one -- matching the server-side
  /// migration's backfill default for pre-existing key_bundles rows
  /// (see 20260919000002_add_device_id_to_key_bundles.exs) -- so this
  /// device's next bundle upload updates that same row instead of
  /// orphaning it under a brand-new device id. Only the one account
  /// that migrates that legacy material (see _loadKeyMaterialRaw) ever
  /// sees hasExistingMaterial true here; a second account added to the
  /// same install later genuinely has none and gets a fresh random id,
  /// same as a second account on a brand-new install always did.
  // Memoized per user so concurrent callers (e.g. ensureMyKeysExist() and
  // encryptForSend()'s self-sync exclusion both call this independently
  // at launch) share one in-flight read-check-write instead of racing
  // it -- and the read-then-write itself now runs as one step of the
  // shared storage queue (see _synchronized), so even a caller outside
  // this memoized Future can't land a write between the read and the
  // write here.
  static final Map<String, Future<String>> _deviceIdFutures = {};

  static Future<String> getOrCreateDeviceId(String userId) =>
      _deviceIdFutures[userId] ??= _loadOrCreateDeviceId(userId);

  static Future<String> _loadOrCreateDeviceId(String userId) => _synchronized(() async {
        final existing = await _storage.read(key: _deviceIdKeyFor(userId));
        if (existing != null) return existing;

        // Migration: adopt whatever a pre-scoping install already had
        // under the old global device id key, for the one account that
        // also migrates the matching legacy key material (see
        // _loadKeyMaterialRaw) -- the device id has to follow whichever
        // key material it was always paired with, not get recomputed
        // from scratch, or an install that already had a real
        // (non-"legacy") random id would silently get relabeled and
        // orphan its existing server-side registration.
        final legacyDeviceId = await _storage.read(key: _legacyDeviceIdKey);
        if (legacyDeviceId != null) {
          await _storage.write(key: _deviceIdKeyFor(userId), value: legacyDeviceId);
          await _storage.delete(key: _legacyDeviceIdKey);
          return legacyDeviceId;
        }

        final hasExistingMaterial = await _loadKeyMaterialRaw(userId) != null;
        // Hex, not base64 -- this id is embedded directly in a URL path
        // segment (DELETE /devices/:device_id) server-side, so it needs to
        // be unambiguously URL-safe with zero encoding questions, not just
        // "safe enough" after stripping a couple of characters.
        final id = hasExistingMaterial ? 'legacy' : _toHex(randomBytes(16));
        await _storage.write(key: _deviceIdKeyFor(userId), value: id);
        return id;
      });

  // ── Per-conversation, per-peer-device Double Ratchet state ──────────────
  // peerDeviceId identifies which of the *other* participant's devices
  // this session is with -- a conversation now holds N independent
  // ratchet sessions, one per fan-out target (every device of the peer,
  // plus every one of this account's own *other* devices, for
  // self-sync). null selects the original single-session storage key,
  // used only to decrypt legacy history (see dm_session_manager.dart).

  static Future<void> saveRatchetState(String conversationId, RatchetState state, [String? peerDeviceId]) =>
      _synchronized(() => _storage.write(
          key: _ratchetKey(conversationId, peerDeviceId), value: jsonEncode(state.toJson())));

  static Future<RatchetState?> loadRatchetState(String conversationId, [String? peerDeviceId]) =>
      _synchronized(() async {
        final raw = await _storage.read(key: _ratchetKey(conversationId, peerDeviceId));
        if (raw == null) return null;
        return RatchetState.fromJson(jsonDecode(raw) as Map<String, dynamic>);
      });

  static Future<void> deleteRatchetState(String conversationId, [String? peerDeviceId]) =>
      _synchronized(() => _storage.delete(key: _ratchetKey(conversationId, peerDeviceId)));

  // ── Channel epoch keys ───────────────────────────────────────────────────
  // See lib/core/crypto/channel_epoch.dart and channel_key_manager.dart.
  // One symmetric key per (channel, epoch), plus a small index of which
  // epochs are actually known locally so the manager doesn't have to
  // probe epoch numbers one at a time to find what it already has.
  // Both writes below run as one locked step -- otherwise a concurrent
  // index write for a *different* channel/epoch landing between them
  // could lose this one's index update under the same whole-file-
  // overwrite race this file's header describes.

  static Future<void> saveChannelEpochKey(String channelId, int epoch, Uint8List key) =>
      _synchronized(() async {
        await _storage.write(key: _channelEpochKey(channelId, epoch), value: bytesToB64(key));
        final known = await _knownChannelEpochsRaw(channelId);
        if (!known.contains(epoch)) {
          known.add(epoch);
          known.sort();
          await _storage.write(key: _channelEpochsIndexKey(channelId), value: jsonEncode(known));
        }
      });

  static Future<Uint8List?> loadChannelEpochKey(String channelId, int epoch) =>
      _synchronized(() async {
        final raw = await _storage.read(key: _channelEpochKey(channelId, epoch));
        if (raw == null) return null;
        return b64ToBytes(raw);
      });

  /// The highest epoch this device actually holds the key for, or null
  /// if it doesn't have any yet (a brand-new install, or hasn't synced
  /// deliveries for this channel).
  static Future<int?> latestKnownChannelEpoch(String channelId) =>
      _synchronized(() async {
        final known = await _knownChannelEpochsRaw(channelId);
        if (known.isEmpty) return null;
        return known.last;
      });

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
      _synchronized(() => _storage.write(key: 'kcp_msg_$messageId', value: plaintext));

  static Future<String?> getCachedDecryptedContent(String messageId) =>
      _synchronized(() => _storage.read(key: 'kcp_msg_$messageId'));

  /// Invalidates a cached plaintext -- e.g. a message was just edited,
  /// so the old cached content is stale and must not keep masking the
  /// freshly-decrypted replacement on the next decryptMessages call.
  static Future<void> deleteCachedDecryptedContent(String messageId) =>
      _synchronized(() => _storage.delete(key: 'kcp_msg_$messageId'));

  // ── TOFU-pinned peer identities ─────────────────────────────────────────

  static Future<void> savePinnedIdentity(String userId, PinnedIdentity identity, [String? deviceId]) =>
      _synchronized(() => _storage.write(
          key: _pinnedIdentityKey(userId, deviceId), value: jsonEncode(identity.toJson())));

  static Future<PinnedIdentity?> loadPinnedIdentity(String userId, [String? deviceId]) =>
      _synchronized(() async {
        final raw = await _storage.read(key: _pinnedIdentityKey(userId, deviceId));
        if (raw == null) return null;
        return PinnedIdentity.fromJson(jsonDecode(raw) as Map<String, dynamic>);
      });

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

  static String _toHex(Uint8List bytes) =>
      bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
}
