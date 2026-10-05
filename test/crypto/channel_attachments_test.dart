// test/crypto/channel_attachments_test.dart
//
// The channel message envelope (lib/core/crypto/channel_attachments.dart)
// is what carries an optional attachment's decryption key/nonce/
// content-type inside the already epoch-key-encrypted message content,
// instead of as a server-visible field -- the channel equivalent of
// dm_attachments_test.dart. These are pure encode/decode tests -- no
// network or secure storage involved -- covering the two things that
// actually matter: a round trip preserves the attachment metadata
// exactly, and old plaintext messages (sent before attachment encryption
// existed) still decode correctly instead of erroring or getting
// corrupted.

import 'package:flutter_test/flutter_test.dart';
import 'package:koda/core/crypto/attachment_crypto.dart';
import 'package:koda/core/crypto/channel_attachments.dart';

void main() {
  group('Channel message envelope', () {
    test('plain text with no attachment round-trips as bare text', () {
      final payload = encodeChannelPayload('hello channel');
      expect(payload, 'hello channel'); // no envelope wrapping when there's nothing extra to carry

      final decoded = decodeChannelPayload(payload);
      expect(decoded.text, 'hello channel');
      expect(decoded.attachment, isNull);
    });

    test('an attachment round-trips with all metadata intact', () {
      const meta = EncryptedAttachmentMeta(
        url: 'https://cdn.koda.fyi/attachment/u1/123-abc',
        key: 'base64keybytes==',
        nonce: 'base64noncebytes==',
        contentType: 'image/png',
        fileName: 'screenshot.png',
      );
      final payload = encodeChannelPayload('check this out', attachment: meta);
      final decoded = decodeChannelPayload(payload);

      expect(decoded.text, 'check this out');
      expect(decoded.attachment, isNotNull);
      expect(decoded.attachment!.url, meta.url);
      expect(decoded.attachment!.key, meta.key);
      expect(decoded.attachment!.nonce, meta.nonce);
      expect(decoded.attachment!.contentType, meta.contentType);
      expect(decoded.attachment!.fileName, meta.fileName);
    });

    test('an attachment with empty text still round-trips', () {
      const meta = EncryptedAttachmentMeta(
        url: 'https://cdn.koda.fyi/attachment/u1/456-def',
        key: 'k', nonce: 'n', contentType: 'application/pdf', fileName: 'doc.pdf',
      );
      final decoded = decodeChannelPayload(encodeChannelPayload('', attachment: meta));
      expect(decoded.text, '');
      expect(decoded.attachment!.fileName, 'doc.pdf');
    });

    test('legacy plain-text messages (pre-dating this envelope) decode as text, not JSON', () {
      const legacy = 'this was sent before attachment encryption existed';
      final decoded = decodeChannelPayload(legacy);
      expect(decoded.text, legacy);
      expect(decoded.attachment, isNull);
    });

    test('a message that happens to be valid JSON but not our envelope is treated as plain text', () {
      const raw = '{"foo": "bar"}';
      final decoded = decodeChannelPayload(raw);
      expect(decoded.text, raw);
      expect(decoded.attachment, isNull);
    });

    test('forwarded_from round-trips alongside text and an attachment', () {
      const meta = EncryptedAttachmentMeta(
        url: 'https://cdn.koda.fyi/attachment/u1/789-ghi',
        key: 'k', nonce: 'n', contentType: 'image/png', fileName: 'pic.png',
      );
      const forwardedFrom = ForwardedFrom(senderName: 'Alice', originalSentAt: '2026-01-01T00:00:00Z');
      final payload = encodeChannelPayload('fwd text', attachment: meta, forwardedFrom: forwardedFrom);
      final decoded = decodeChannelPayload(payload);

      expect(decoded.text, 'fwd text');
      expect(decoded.attachment!.fileName, 'pic.png');
      expect(decoded.forwardedFrom, isNotNull);
      expect(decoded.forwardedFrom!.senderName, 'Alice');
      expect(decoded.forwardedFrom!.originalSentAt, '2026-01-01T00:00:00Z');
    });

    test('forwarded_from with no attachment still wraps the envelope rather than staying a bare string', () {
      const forwardedFrom = ForwardedFrom(senderName: 'Bob', originalSentAt: '2026-01-01T00:00:00Z');
      final payload = encodeChannelPayload('just text', forwardedFrom: forwardedFrom);
      expect(payload, isNot('just text')); // must wrap -- a bare string has nowhere to carry forwardedFrom

      final decoded = decodeChannelPayload(payload);
      expect(decoded.text, 'just text');
      expect(decoded.attachment, isNull);
      expect(decoded.forwardedFrom!.senderName, 'Bob');
    });

    test('a message with no forwarded_from decodes with a null forwardedFrom', () {
      final decoded = decodeChannelPayload(encodeChannelPayload('plain', attachment: const EncryptedAttachmentMeta(
          url: 'u', key: 'k', nonce: 'n', contentType: 'image/png', fileName: 'f')));
      expect(decoded.forwardedFrom, isNull);
    });

    test('a DM envelope is not mistaken for a channel envelope', () {
      // Different discriminator key (koda_dm_v1 vs koda_channel_v1) --
      // decodeChannelPayload must not cross-decode the other envelope
      // type, or a DM ciphertext leaked into a channel path (or vice
      // versa) would render as garbled JSON text instead of failing
      // safely as plain text.
      const dmLike = '{"koda_dm_v1": true, "text": "hi", "attachment": null}';
      final decoded = decodeChannelPayload(dmLike);
      expect(decoded.text, dmLike);
      expect(decoded.attachment, isNull);
    });
  });
}
