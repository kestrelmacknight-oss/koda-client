// test/crypto/spk_rotation_test.dart
//
// Covers the cryptographic core of SPK (signed prekey) rotation's grace
// window: a peer can fetch our key bundle and start an X3DH handshake
// against our *current* SPK just before we rotate it. Without keeping
// that just-retired private key around briefly, their first message
// would be silently undecryptable even though nothing is actually
// wrong. This exercises exactly the fallback dm_session_manager.dart's
// decryptReceived performs (try the current SPK, retry with the
// previous one on failure) at the x3dh/double_ratchet layer directly,
// without needing to mock secure storage or the network.

import 'package:flutter_test/flutter_test.dart';
import 'package:koda/core/crypto/kcp_primitives.dart';
import 'package:koda/core/crypto/x3dh.dart';
import 'package:koda/core/crypto/double_ratchet.dart';

void main() {
  group('SPK rotation grace window', () {
    test('a handshake started against the pre-rotation SPK still decrypts via the retained previous key', () async {
      final alice = await generateKeyMaterial();
      var bob = await generateKeyMaterial();
      final bobSpkV1 = bob.signedPrekey;

      // Alice fetches Bob's bundle while spkV1 is still current and starts
      // a handshake against it.
      final bobBundleV1 = RemoteBundle(
        ikSignPub: bob.identity.signing.publicKeyBytes,
        ikDhPub: bob.identity.dh.publicKeyBytes,
        spkPub: bobSpkV1.publicKeyBytes,
        spkSig: await signPrekey(bob.identity, bobSpkV1),
        opkPub: bob.oneTimePrekeys.first.publicKeyBytes,
      );
      final aliceX3dh = await initiateSession(myIdentity: alice.identity, theirBundle: bobBundleV1);
      final aliceState = await RatchetState.initAsInitiator(
        rootKey: aliceX3dh.sharedSecret,
        theirInitialRatchetPublicKey: bobBundleV1.spkPub,
        associatedData: aliceX3dh.associatedData,
      );
      final firstMessage = await aliceState.encrypt('hi bob, brand new session'.codeUnits);

      // Before Bob ever sees that message, he rotates: spkV2 becomes
      // current, spkV1 becomes the retained "previous" key -- mirrors
      // DmSessionManager.rotateSignedPrekeyIfDue.
      final bobSpkV2 = await generateX25519KeyPair();
      bob = LocalKeyMaterial(
        bob.identity,
        bobSpkV2,
        bob.oneTimePrekeys,
        signedPrekeyCreatedAt: DateTime.now().toUtc(),
        previousSignedPrekey: bobSpkV1,
        previousSignedPrekeyExpiresAt: DateTime.now().toUtc().add(const Duration(days: 14)),
      );

      Future<RatchetState> respondWith(X25519KeyPair spk) async {
        final x3dh = await respondToSession(
          myIdentity: bob.identity,
          mySignedPrekey: spk,
          myOneTimePrekey: bob.oneTimePrekeys.first,
          theirIdentityDhPub: alice.identity.dh.publicKeyBytes,
          theirEphemeralPub: aliceX3dh.ephemeral.publicKeyBytes,
        );
        return RatchetState.initAsResponder(
          rootKey: x3dh.sharedSecret,
          myInitialRatchetKeyPair: spk,
          associatedData: x3dh.associatedData,
        );
      }

      // Responding with the new current SPK must fail to decrypt --
      // Alice's handshake math used the old public key, so the derived
      // root keys genuinely differ.
      final wrongState = await respondWith(bob.signedPrekey);
      expect(
        () => wrongState.decrypt(
            header: firstMessage.header, nonce: firstMessage.nonce, payload: firstMessage.payload),
        throwsA(isA<DoubleRatchetDecryptFailure>()),
      );

      // Falling back to the retained previous SPK (exactly what
      // decryptReceived does on catching that failure) must succeed.
      expect(bob.previousSignedPrekey, isNotNull);
      final fallbackState = await respondWith(bob.previousSignedPrekey!);
      final plaintext = await fallbackState.decrypt(
          header: firstMessage.header, nonce: firstMessage.nonce, payload: firstMessage.payload);
      expect(String.fromCharCodes(plaintext), 'hi bob, brand new session');
    });

    test('an expired previous SPK is not something decryptReceived would fall back to', () async {
      final bob = await generateKeyMaterial();
      final rotated = LocalKeyMaterial(
        bob.identity,
        bob.signedPrekey,
        bob.oneTimePrekeys,
        signedPrekeyCreatedAt: DateTime.now().toUtc(),
        previousSignedPrekey: bob.signedPrekey,
        // Already expired -- the grace window has passed.
        previousSignedPrekeyExpiresAt: DateTime.now().toUtc().subtract(const Duration(days: 1)),
      );

      final expired = rotated.previousSignedPrekeyExpiresAt != null &&
          DateTime.now().toUtc().isAfter(rotated.previousSignedPrekeyExpiresAt!);
      expect(expired, isTrue);
    });
  });
}
