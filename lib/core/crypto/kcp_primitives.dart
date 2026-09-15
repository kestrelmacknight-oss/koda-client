// lib/core/crypto/kcp_primitives.dart
//
// Thin, well-documented wrappers over package:cryptography for the
// specific primitives KCP (Koda's X3DH + Double Ratchet implementation)
// needs. Pure-Dart algorithms only (no cryptography_flutter) -- this
// avoids native plugin registration entirely, which matters a lot in
// this codebase specifically: several real crashes this project has had
// came from desktop-only native plugins running unconditionally on the
// wrong platform. Pure Dart sidesteps that whole bug class across
// Windows/macOS/Linux/Android.
//
// Algorithm choices (Signal's actual production choices, not a
// homebrew design): X25519 for ECDH, Ed25519 for signing, AES-256-GCM
// for authenticated encryption, HKDF-SHA256 / HMAC-SHA256 for key
// derivation.

import 'dart:convert';
import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';

final x25519 = X25519();
final ed25519 = Ed25519();
final aesGcm256 = AesGcm.with256bits();

String bytesToB64(List<int> bytes) => base64Encode(bytes);
Uint8List b64ToBytes(String s) => base64Decode(s);

/// A 32-byte X25519 keypair, with both halves kept as raw bytes for easy
/// (de)serialization to/from secure storage and the wire.
class X25519KeyPair {
  final Uint8List privateKeyBytes;
  final Uint8List publicKeyBytes;
  const X25519KeyPair(this.privateKeyBytes, this.publicKeyBytes);

  SimpleKeyPair toCryptoKeyPair() => SimpleKeyPairData(
        privateKeyBytes,
        publicKey: SimplePublicKey(publicKeyBytes, type: KeyPairType.x25519),
        type: KeyPairType.x25519,
      );
}

class Ed25519KeyPair {
  final Uint8List privateKeyBytes;
  final Uint8List publicKeyBytes;
  const Ed25519KeyPair(this.privateKeyBytes, this.publicKeyBytes);

  SimpleKeyPair toCryptoKeyPair() => SimpleKeyPairData(
        privateKeyBytes,
        publicKey: SimplePublicKey(publicKeyBytes, type: KeyPairType.ed25519),
        type: KeyPairType.ed25519,
      );
}

Future<X25519KeyPair> generateX25519KeyPair() async {
  final kp = await x25519.newKeyPair();
  final priv = await kp.extractPrivateKeyBytes();
  final pub = await kp.extractPublicKey();
  return X25519KeyPair(Uint8List.fromList(priv), Uint8List.fromList(pub.bytes));
}

Future<Ed25519KeyPair> generateEd25519KeyPair() async {
  final kp = await ed25519.newKeyPair();
  final priv = await kp.extractPrivateKeyBytes();
  final pub = await kp.extractPublicKey();
  return Ed25519KeyPair(Uint8List.fromList(priv), Uint8List.fromList(pub.bytes));
}

/// Raw X25519 Diffie-Hellman: our private key x their public key -> shared
/// secret bytes. Used directly as HKDF input keying material -- never used
/// as an encryption key on its own.
Future<Uint8List> dh(X25519KeyPair ours, Uint8List theirPublicKeyBytes) async {
  final shared = await x25519.sharedSecretKey(
    keyPair: ours.toCryptoKeyPair(),
    remotePublicKey: SimplePublicKey(theirPublicKeyBytes, type: KeyPairType.x25519),
  );
  final data = await shared.extract();
  return Uint8List.fromList(data.bytes);
}

Future<Uint8List> ed25519Sign(Ed25519KeyPair signer, List<int> message) async {
  final sig = await ed25519.sign(message, keyPair: signer.toCryptoKeyPair());
  return Uint8List.fromList(sig.bytes);
}

Future<bool> ed25519Verify(
    Uint8List signerPublicKeyBytes, List<int> message, Uint8List signatureBytes) async {
  final publicKey = SimplePublicKey(signerPublicKeyBytes, type: KeyPairType.ed25519);
  try {
    return await ed25519.verify(message,
        signature: Signature(signatureBytes, publicKey: publicKey));
  } catch (_) {
    // A malformed signature/key should fail closed, not throw past the caller.
    return false;
  }
}

/// HKDF-SHA256. `salt` is HKDF's salt parameter (this library calls it
/// `nonce` -- same thing, different name).
Future<Uint8List> hkdfSha256({
  required List<int> ikm,
  required List<int> salt,
  required String info,
  required int outputLength,
}) async {
  final key = await Hkdf(hmac: Hmac.sha256(), outputLength: outputLength).deriveKey(
    secretKey: SecretKeyData(ikm),
    nonce: salt,
    info: utf8.encode(info),
  );
  return Uint8List.fromList(await key.extractBytes());
}

Future<Uint8List> hmacSha256(List<int> key, List<int> message) async {
  final mac = await Hmac.sha256().calculateMac(message, secretKey: SecretKeyData(key));
  return Uint8List.fromList(mac.bytes);
}

const _aesGcmTagLength = 16; // AES-GCM's authentication tag is always 128 bits.
const _aesGcmNonceLength = 12; // 96 bits, the standard/recommended GCM nonce size.

Uint8List randomNonce() {
  final rnd = SecretKeyData.random(length: _aesGcmNonceLength);
  return Uint8List.fromList(rnd.bytes);
}

/// Cryptographically random bytes of the given length -- for anything
/// that isn't specifically a GCM nonce (e.g. a fresh symmetric key).
Uint8List randomBytes(int length) {
  final rnd = SecretKeyData.random(length: length);
  return Uint8List.fromList(rnd.bytes);
}

/// Encrypts with AES-256-GCM. Returns ciphertext with the auth tag
/// appended (`cipherText ++ tag`), which is the wire format's single
/// `payload` field -- there's no separate MAC field on the wire, so the
/// tag has to travel bundled with the ciphertext.
Future<Uint8List> aesGcmEncrypt({
  required Uint8List key,
  required Uint8List nonce,
  required List<int> plaintext,
  List<int> aad = const [],
}) async {
  final box = await aesGcm256.encrypt(plaintext,
      secretKey: SecretKeyData(key), nonce: nonce, aad: aad);
  return Uint8List.fromList(box.cipherText + box.mac.bytes);
}

/// Inverse of [aesGcmEncrypt]. Throws if authentication fails (tampered
/// ciphertext, wrong key, or wrong AAD) -- callers must not catch this
/// and silently fall back to anything; a failed decrypt must surface as
/// "unable to decrypt this message," never as plaintext.
Future<Uint8List> aesGcmDecrypt({
  required Uint8List key,
  required Uint8List nonce,
  required Uint8List payload,
  List<int> aad = const [],
}) async {
  if (payload.length < _aesGcmTagLength) {
    throw ArgumentError('Ciphertext shorter than the AES-GCM tag -- not a valid payload.');
  }
  final cipherText = payload.sublist(0, payload.length - _aesGcmTagLength);
  final tag = payload.sublist(payload.length - _aesGcmTagLength);
  final clear = await aesGcm256.decrypt(
    SecretBox(cipherText, nonce: nonce, mac: Mac(tag)),
    secretKey: SecretKeyData(key),
    aad: aad,
  );
  return Uint8List.fromList(clear);
}
