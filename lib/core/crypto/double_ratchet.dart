// lib/core/crypto/double_ratchet.dart
//
// The Double Ratchet algorithm (Signal's construction) -- combines a
// per-message symmetric-key ratchet (forward secrecy: each message key
// is derived from and then discarded from the previous one) with a
// Diffie-Hellman ratchet (post-compromise security: a compromised chain
// key stops being useful once either side sends after generating a
// fresh DH keypair). Reference: https://signal.org/docs/specifications/doubleratchet/
//
// State must be persisted (see secure_storage.dart) across app restarts,
// or messages sent/received while the app was closed become permanently
// undecryptable.

import 'dart:typed_data';
import 'kcp_primitives.dart';

/// Cap on how many message keys a single receive can derive when
/// catching up a skipped range. Without this, a malformed or malicious
/// header claiming a huge message number forces deriving huge numbers of
/// keys -- a cheap DoS. Matches libsignal's default.
const maxSkippedKeys = 1000;

/// How many skipped keys to retain across a conversation before evicting
/// the oldest. Bounds storage; a message that arrives later than this
/// many messages after being skipped is treated as undecryptable, same
/// tradeoff Signal's reference implementation makes.
const maxStoredSkippedKeys = 2000;

class RatchetHeader {
  final Uint8List ratchetKey; // sender's current DH ratchet public key
  final int msgNumber; // Ns at send time
  final int prevChain; // length of the sender's previous sending chain (PN)
  const RatchetHeader(this.ratchetKey, this.msgNumber, this.prevChain);

  /// Bound into the AES-GCM AAD so a server (or anyone else) can't alter
  /// the header without the receiver noticing -- the header is
  /// authenticated even though, like all Double Ratchet implementations,
  /// it travels in the clear alongside the ciphertext.
  Uint8List bytesForAad() {
    final b = BytesBuilder();
    b.add(ratchetKey);
    b.add(_be32(msgNumber));
    b.add(_be32(prevChain));
    return b.toBytes();
  }
}

Uint8List _be32(int n) => Uint8List(4)..buffer.asByteData().setUint32(0, n, Endian.big);

class SkippedKeyId {
  final String ratchetKeyB64;
  final int msgNumber;
  const SkippedKeyId(this.ratchetKeyB64, this.msgNumber);
  String get storageKey => '$ratchetKeyB64:$msgNumber';
}

class DoubleRatchetDecryptFailure implements Exception {
  final String message;
  const DoubleRatchetDecryptFailure(this.message);
  @override
  String toString() => 'DoubleRatchetDecryptFailure: $message';
}

class RatchetState {
  Uint8List rootKey;
  X25519KeyPair dhSelf;
  Uint8List? dhRemote;
  Uint8List? sendingChainKey;
  Uint8List? receivingChainKey;
  int ns;
  int nr;
  int pn;
  final Uint8List associatedData; // from X3DH; constant for the session's lifetime
  // Ordered oldest-first so eviction can just drop from the front.
  final Map<String, Uint8List> skippedKeys;

  RatchetState({
    required this.rootKey,
    required this.dhSelf,
    required this.associatedData,
    this.dhRemote,
    this.sendingChainKey,
    this.receivingChainKey,
    this.ns = 0,
    this.nr = 0,
    this.pn = 0,
    Map<String, Uint8List>? skippedKeys,
  }) : skippedKeys = skippedKeys ?? {};

  /// Alice's side, right after X3DH: she already knows Bob's initial
  /// ratchet public key (his SPK), so she can derive a sending chain and
  /// encrypt message 0 without waiting for a reply.
  static Future<RatchetState> initAsInitiator({
    required Uint8List rootKey,
    required Uint8List theirInitialRatchetPublicKey,
    required Uint8List associatedData,
  }) async {
    final dhSelf = await generateX25519KeyPair();
    final dhOut = await dh(dhSelf, theirInitialRatchetPublicKey);
    final derived = await hkdfSha256(
        ikm: dhOut, salt: rootKey, info: 'KodaDR-RootKey', outputLength: 64);
    return RatchetState(
      rootKey: derived.sublist(0, 32),
      dhSelf: dhSelf,
      dhRemote: theirInitialRatchetPublicKey,
      sendingChainKey: derived.sublist(32, 64),
      associatedData: associatedData,
    );
  }

  /// Bob's side: his initial ratchet keypair *is* his signed-prekey
  /// keypair (already has the private half). No chain keys exist yet --
  /// the first DH ratchet step happens automatically the moment Alice's
  /// first message arrives (decrypt() sees dhRemote == null and steps).
  static RatchetState initAsResponder({
    required Uint8List rootKey,
    required X25519KeyPair myInitialRatchetKeyPair,
    required Uint8List associatedData,
  }) =>
      RatchetState(
        rootKey: rootKey,
        dhSelf: myInitialRatchetKeyPair,
        associatedData: associatedData,
      );

  RatchetHeader get _currentSendHeader => RatchetHeader(dhSelf.publicKeyBytes, ns, pn);

  Future<({RatchetHeader header, Uint8List nonce, Uint8List payload})> encrypt(
      List<int> plaintext) async {
    if (sendingChainKey == null) {
      throw StateError('No sending chain yet -- responder must receive before it can reply.');
    }
    final mk = await hmacSha256(sendingChainKey!, [0x01]);
    sendingChainKey = await hmacSha256(sendingChainKey!, [0x02]);

    final header = _currentSendHeader;
    ns += 1;

    final aesKey =
        await hkdfSha256(ikm: mk, salt: const [], info: 'KodaDR-MsgKey', outputLength: 32);
    final nonce = randomNonce();
    final aad = Uint8List.fromList([...associatedData, ...header.bytesForAad()]);
    final payload =
        await aesGcmEncrypt(key: aesKey, nonce: nonce, plaintext: plaintext, aad: aad);
    return (header: header, nonce: nonce, payload: payload);
  }

  Future<Uint8List> decrypt({
    required RatchetHeader header,
    required Uint8List nonce,
    required Uint8List payload,
  }) async {
    final skippedId = SkippedKeyId(bytesToB64(header.ratchetKey), header.msgNumber);
    final skipped = skippedKeys[skippedId.storageKey];
    if (skipped != null) {
      skippedKeys.remove(skippedId.storageKey); // forward secrecy: use once, then discard
      return _decryptWithMessageKey(skipped, header, nonce, payload);
    }

    if (dhRemote == null || !_bytesEqual(header.ratchetKey, dhRemote!)) {
      await _skipReceivingKeysUpTo(header.prevChain);
      await _dhRatchetStep(header.ratchetKey);
    }
    await _skipReceivingKeysUpTo(header.msgNumber);

    if (receivingChainKey == null) {
      throw const DoubleRatchetDecryptFailure('No receiving chain established.');
    }
    final mk = await hmacSha256(receivingChainKey!, [0x01]);
    receivingChainKey = await hmacSha256(receivingChainKey!, [0x02]);
    nr += 1;

    return _decryptWithMessageKey(mk, header, nonce, payload);
  }

  Future<Uint8List> _decryptWithMessageKey(
      Uint8List mk, RatchetHeader header, Uint8List nonce, Uint8List payload) async {
    final aesKey =
        await hkdfSha256(ikm: mk, salt: const [], info: 'KodaDR-MsgKey', outputLength: 32);
    final aad = Uint8List.fromList([...associatedData, ...header.bytesForAad()]);
    try {
      return await aesGcmDecrypt(key: aesKey, nonce: nonce, payload: payload, aad: aad);
    } catch (e) {
      // Fail closed: never fall back to returning the raw/undecrypted
      // payload. A message that doesn't verify must surface as
      // undecryptable, not as plaintext.
      throw DoubleRatchetDecryptFailure('Authentication failed: $e');
    }
  }

  Future<void> _skipReceivingKeysUpTo(int until) async {
    if (receivingChainKey == null) return; // nothing to catch up yet (pre-first-DH-step)
    if (until - nr > maxSkippedKeys) {
      throw const DoubleRatchetDecryptFailure(
          'Refusing to derive an unreasonable number of skipped message keys.');
    }
    final dhRemoteB64 = bytesToB64(dhRemote!);
    while (nr < until) {
      final mk = await hmacSha256(receivingChainKey!, [0x01]);
      receivingChainKey = await hmacSha256(receivingChainKey!, [0x02]);
      skippedKeys['$dhRemoteB64:$nr'] = mk;
      nr += 1;
    }
    _evictOldSkippedKeysIfNeeded();
  }

  void _evictOldSkippedKeysIfNeeded() {
    while (skippedKeys.length > maxStoredSkippedKeys) {
      skippedKeys.remove(skippedKeys.keys.first);
    }
  }

  Future<void> _dhRatchetStep(Uint8List theirNewRatchetPublicKey) async {
    pn = ns;
    ns = 0;
    nr = 0;
    dhRemote = theirNewRatchetPublicKey;

    final dhOut1 = await dh(dhSelf, dhRemote!);
    final derived1 = await hkdfSha256(
        ikm: dhOut1, salt: rootKey, info: 'KodaDR-RootKey', outputLength: 64);
    rootKey = derived1.sublist(0, 32);
    receivingChainKey = derived1.sublist(32, 64);

    dhSelf = await generateX25519KeyPair();
    final dhOut2 = await dh(dhSelf, dhRemote!);
    final derived2 = await hkdfSha256(
        ikm: dhOut2, salt: rootKey, info: 'KodaDR-RootKey', outputLength: 64);
    rootKey = derived2.sublist(0, 32);
    sendingChainKey = derived2.sublist(32, 64);
  }

  Map<String, dynamic> toJson() => {
        'root_key': bytesToB64(rootKey),
        'dh_self_priv': bytesToB64(dhSelf.privateKeyBytes),
        'dh_self_pub':  bytesToB64(dhSelf.publicKeyBytes),
        'dh_remote': dhRemote != null ? bytesToB64(dhRemote!) : null,
        'sending_chain_key':   sendingChainKey != null ? bytesToB64(sendingChainKey!) : null,
        'receiving_chain_key': receivingChainKey != null ? bytesToB64(receivingChainKey!) : null,
        'ns': ns, 'nr': nr, 'pn': pn,
        'associated_data': bytesToB64(associatedData),
        'skipped_keys': skippedKeys.map((k, v) => MapEntry(k, bytesToB64(v))),
      };

  static RatchetState fromJson(Map<String, dynamic> j) => RatchetState(
        rootKey: b64ToBytes(j['root_key'] as String),
        dhSelf: X25519KeyPair(
          b64ToBytes(j['dh_self_priv'] as String),
          b64ToBytes(j['dh_self_pub'] as String),
        ),
        dhRemote: j['dh_remote'] != null ? b64ToBytes(j['dh_remote'] as String) : null,
        sendingChainKey:
            j['sending_chain_key'] != null ? b64ToBytes(j['sending_chain_key'] as String) : null,
        receivingChainKey: j['receiving_chain_key'] != null
            ? b64ToBytes(j['receiving_chain_key'] as String)
            : null,
        ns: j['ns'] as int,
        nr: j['nr'] as int,
        pn: j['pn'] as int,
        associatedData: b64ToBytes(j['associated_data'] as String),
        skippedKeys: (j['skipped_keys'] as Map<String, dynamic>? ?? {})
            .map((k, v) => MapEntry(k, b64ToBytes(v as String))),
      );
}

bool _bytesEqual(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
