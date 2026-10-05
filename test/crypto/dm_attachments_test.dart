// test/crypto/dm_attachments_test.dart
//
// The DM message envelope (lib/core/crypto/dm_attachments.dart) is what
// carries an optional attachment's decryption key/nonce/content-type
// inside the already Double Ratchet-encrypted message content, instead
// of as a server-visible field. These are pure encode/decode tests --
// no network or secure storage involved -- covering the two things that
// actually matter: a round trip preserves the attachment metadata
// exactly, and old plaintext messages (sent before attachments existed)
// still decode correctly instead of erroring or getting corrupted.

import 'package:flutter_test/flutter_test.dart';
import 'package:koda/core/crypto/attachment_crypto.dart' show ForwardedFrom;
import 'package:koda/core/crypto/dm_attachments.dart';

void main() {
  group('DM message envelope', () {
    test('plain text with no attachment round-trips as bare text', () {
      final payload = encodeDmPayload('hello bob');
      expect(payload, 'hello bob'); // no envelope wrapping when there's nothing extra to carry

      final decoded = decodeDmPayload(payload);
      expect(decoded.text, 'hello bob');
      expect(decoded.attachment, isNull);
    });

    test('an attachment round-trips with all metadata intact', () {
      const meta = DmAttachmentMeta(
        url: 'https://cdn.koda.fyi/attachment/u1/123-abc',
        key: 'base64keybytes==',
        nonce: 'base64noncebytes==',
        contentType: 'image/png',
        fileName: 'screenshot.png',
      );
      final payload = encodeDmPayload('check this out', attachment: meta);
      final decoded = decodeDmPayload(payload);

      expect(decoded.text, 'check this out');
      expect(decoded.attachment, isNotNull);
      expect(decoded.attachment!.url, meta.url);
      expect(decoded.attachment!.key, meta.key);
      expect(decoded.attachment!.nonce, meta.nonce);
      expect(decoded.attachment!.contentType, meta.contentType);
      expect(decoded.attachment!.fileName, meta.fileName);
    });

    test('an attachment with empty text still round-trips', () {
      const meta = DmAttachmentMeta(
        url: 'https://cdn.koda.fyi/attachment/u1/456-def',
        key: 'k', nonce: 'n', contentType: 'application/pdf', fileName: 'doc.pdf',
      );
      final decoded = decodeDmPayload(encodeDmPayload('', attachment: meta));
      expect(decoded.text, '');
      expect(decoded.attachment!.fileName, 'doc.pdf');
    });

    test('legacy plain-text messages (pre-dating this envelope) decode as text, not JSON', () {
      const legacy = 'this was sent before attachments existed';
      final decoded = decodeDmPayload(legacy);
      expect(decoded.text, legacy);
      expect(decoded.attachment, isNull);
    });

    test('a message that happens to be valid JSON but not our envelope is treated as plain text', () {
      const raw = '{"foo": "bar"}';
      final decoded = decodeDmPayload(raw);
      expect(decoded.text, raw);
      expect(decoded.attachment, isNull);
    });

    test('forwarded_from round-trips alongside text and an attachment', () {
      const meta = DmAttachmentMeta(
        url: 'https://cdn.koda.fyi/attachment/u1/789-ghi',
        key: 'k', nonce: 'n', contentType: 'image/png', fileName: 'pic.png',
      );
      const forwardedFrom = ForwardedFrom(senderName: 'Alice', originalSentAt: '2026-01-01T00:00:00Z');
      final payload = encodeDmPayload('fwd text', attachment: meta, forwardedFrom: forwardedFrom);
      final decoded = decodeDmPayload(payload);

      expect(decoded.text, 'fwd text');
      expect(decoded.attachment!.fileName, 'pic.png');
      expect(decoded.forwardedFrom, isNotNull);
      expect(decoded.forwardedFrom!.senderName, 'Alice');
      expect(decoded.forwardedFrom!.originalSentAt, '2026-01-01T00:00:00Z');
    });

    test('forwarded_from with no attachment still wraps the envelope rather than staying a bare string', () {
      const forwardedFrom = ForwardedFrom(senderName: 'Bob', originalSentAt: '2026-01-01T00:00:00Z');
      final payload = encodeDmPayload('just text', forwardedFrom: forwardedFrom);
      expect(payload, isNot('just text')); // must wrap -- a bare string has nowhere to carry forwardedFrom

      final decoded = decodeDmPayload(payload);
      expect(decoded.text, 'just text');
      expect(decoded.attachment, isNull);
      expect(decoded.forwardedFrom!.senderName, 'Bob');
    });

    test('a message with no forwarded_from decodes with a null forwardedFrom', () {
      final decoded = decodeDmPayload(encodeDmPayload('plain', attachment: const DmAttachmentMeta(
          url: 'u', key: 'k', nonce: 'n', contentType: 'image/png', fileName: 'f')));
      expect(decoded.forwardedFrom, isNull);
    });
  });
}
