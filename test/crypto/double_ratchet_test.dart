// test/crypto/double_ratchet_test.dart
//
// End-to-end round trip of the real crypto: X3DH handshake between two
// simulated parties, then Double Ratchet message exchange covering the
// cases that actually exercise the algorithm (not just "one message
// works") -- alternating senders (forces DH ratchet steps), several
// messages in a row on one chain (symmetric ratchet), and an
// out-of-order delivery (skipped-key derivation). A tampered ciphertext
// must fail to decrypt rather than silently succeeding.

import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:koda/core/crypto/x3dh.dart';
import 'package:koda/core/crypto/double_ratchet.dart';

void main() {
  group('X3DH + Double Ratchet', () {
    late LocalKeyMaterial alice;
    late LocalKeyMaterial bob;

    setUp(() async {
      alice = await generateKeyMaterial();
      bob = await generateKeyMaterial();
    });

    Future<(RatchetState, RatchetState)> establishSession() async {
      final bobSpkSig = await signPrekey(bob.identity, bob.signedPrekey);
      final bobOpk = bob.oneTimePrekeys.first;
      final bobBundle = RemoteBundle(
        ikSignPub: bob.identity.signing.publicKeyBytes,
        ikDhPub: bob.identity.dh.publicKeyBytes,
        spkPub: bob.signedPrekey.publicKeyBytes,
        spkSig: bobSpkSig,
        opkPub: bobOpk.publicKeyBytes,
      );

      final aliceX3dh = await initiateSession(myIdentity: alice.identity, theirBundle: bobBundle);
      final aliceState = await RatchetState.initAsInitiator(
        rootKey: aliceX3dh.sharedSecret,
        theirInitialRatchetPublicKey: bobBundle.spkPub,
        associatedData: aliceX3dh.associatedData,
      );

      // Alice's first message would carry this as x3dh_header.
      final theirIdentityDhPub = alice.identity.dh.publicKeyBytes;
      final theirEphemeralPub = aliceX3dh.ephemeral.publicKeyBytes;

      final bobX3dh = await respondToSession(
        myIdentity: bob.identity,
        mySignedPrekey: bob.signedPrekey,
        myOneTimePrekey: bobOpk,
        theirIdentityDhPub: theirIdentityDhPub,
        theirEphemeralPub: theirEphemeralPub,
      );
      final bobState = RatchetState.initAsResponder(
        rootKey: bobX3dh.sharedSecret,
        myInitialRatchetKeyPair: bob.signedPrekey,
        associatedData: bobX3dh.associatedData,
      );

      // Both sides must derive the same shared secret and AD independently.
      expect(aliceX3dh.sharedSecret, equals(bobX3dh.sharedSecret));
      expect(aliceX3dh.associatedData, equals(bobX3dh.associatedData));

      return (aliceState, bobState);
    }

    test('rejects a bundle with an invalid SPK signature', () async {
      final bobBundle = RemoteBundle(
        ikSignPub: bob.identity.signing.publicKeyBytes,
        ikDhPub: bob.identity.dh.publicKeyBytes,
        spkPub: bob.signedPrekey.publicKeyBytes,
        spkSig: await signPrekey(alice.identity, bob.signedPrekey), // wrong signer
        opkPub: bob.oneTimePrekeys.first.publicKeyBytes,
      );
      expect(
        () => initiateSession(myIdentity: alice.identity, theirBundle: bobBundle),
        throwsA(isA<X3dhHandshakeInvalid>()),
      );
    });

    test('first message: Alice to Bob, decrypts to the original plaintext', () async {
      final (aliceState, bobState) = await establishSession();

      final enc = await aliceState.encrypt('hello bob'.codeUnits);
      final plaintext = await bobState.decrypt(
        header: enc.header,
        nonce: enc.nonce,
        payload: enc.payload,
      );
      expect(String.fromCharCodes(plaintext), 'hello bob');
    });

    test('alternating senders forces DH ratchet steps both ways', () async {
      final (aliceState, bobState) = await establishSession();

      final m1 = await aliceState.encrypt('hi'.codeUnits);
      expect(String.fromCharCodes(
              await bobState.decrypt(header: m1.header, nonce: m1.nonce, payload: m1.payload)),
          'hi');

      final m2 = await bobState.encrypt('hey alice'.codeUnits);
      expect(String.fromCharCodes(
              await aliceState.decrypt(header: m2.header, nonce: m2.nonce, payload: m2.payload)),
          'hey alice');

      final m3 = await aliceState.encrypt('how are you'.codeUnits);
      expect(String.fromCharCodes(
              await bobState.decrypt(header: m3.header, nonce: m3.nonce, payload: m3.payload)),
          'how are you');

      // Bob just decrypted m3, so he should have ratcheted forward to
      // recognize Alice's current sending key as her latest.
      expect(bobState.dhRemote, equals(aliceState.dhSelf.publicKeyBytes));
    });

    test('several messages in a row on one chain (symmetric ratchet)', () async {
      final (aliceState, bobState) = await establishSession();
      for (var i = 0; i < 5; i++) {
        final enc = await aliceState.encrypt('message $i'.codeUnits);
        final plaintext = await bobState.decrypt(
            header: enc.header, nonce: enc.nonce, payload: enc.payload);
        expect(String.fromCharCodes(plaintext), 'message $i');
      }
    });

    test('out-of-order delivery derives skipped keys correctly', () async {
      final (aliceState, bobState) = await establishSession();

      final m0 = await aliceState.encrypt('zero'.codeUnits);
      final m1 = await aliceState.encrypt('one'.codeUnits);
      final m2 = await aliceState.encrypt('two'.codeUnits);

      // Bob receives them out of order: 2, then 0, then 1.
      expect(String.fromCharCodes(
              await bobState.decrypt(header: m2.header, nonce: m2.nonce, payload: m2.payload)),
          'two');
      expect(String.fromCharCodes(
              await bobState.decrypt(header: m0.header, nonce: m0.nonce, payload: m0.payload)),
          'zero');
      expect(String.fromCharCodes(
              await bobState.decrypt(header: m1.header, nonce: m1.nonce, payload: m1.payload)),
          'one');
    });

    test('a tampered ciphertext fails to decrypt rather than returning garbage', () async {
      final (aliceState, bobState) = await establishSession();
      final enc = await aliceState.encrypt('do not tamper with me'.codeUnits);
      final tampered = Uint8ListCopy.withFlippedByte(enc.payload);

      expect(
        () => bobState.decrypt(header: enc.header, nonce: enc.nonce, payload: tampered),
        throwsA(isA<DoubleRatchetDecryptFailure>()),
      );
    });
  });
}

/// Test-only helper -- flips the last byte so the AES-GCM tag no longer verifies.
class Uint8ListCopy {
  static Uint8List withFlippedByte(List<int> bytes) {
    final copy = Uint8List.fromList(bytes);
    copy[copy.length - 1] ^= 0xFF;
    return copy;
  }
}
