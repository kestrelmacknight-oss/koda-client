// lib/core/pcm_wav.dart
//
// Wraps raw PCM16 bytes (as captured by livekit_client's
// AudioFrameCapture, see device_test_screen.dart's delayed self-listen
// feature) in a standard 44-byte WAV header so just_audio can play them
// -- just_audio has no raw-PCM source, only file/URL/byte-stream sources
// with a real container format.

import 'dart:typed_data';

Uint8List wrapPcm16AsWav(Uint8List pcm, {required int sampleRate, required int channels}) {
  const bitsPerSample = 16;
  final byteRate = sampleRate * channels * bitsPerSample ~/ 8;
  final blockAlign = channels * bitsPerSample ~/ 8;
  final dataSize = pcm.length;
  final header = ByteData(44);

  void writeString(int offset, String s) {
    for (var i = 0; i < s.length; i++) {
      header.setUint8(offset + i, s.codeUnitAt(i));
    }
  }

  writeString(0, 'RIFF');
  header.setUint32(4, 36 + dataSize, Endian.little);
  writeString(8, 'WAVE');
  writeString(12, 'fmt ');
  header.setUint32(16, 16, Endian.little); // fmt chunk size
  header.setUint16(20, 1, Endian.little); // PCM
  header.setUint16(22, channels, Endian.little);
  header.setUint32(24, sampleRate, Endian.little);
  header.setUint32(28, byteRate, Endian.little);
  header.setUint16(32, blockAlign, Endian.little);
  header.setUint16(34, bitsPerSample, Endian.little);
  writeString(36, 'data');
  header.setUint32(40, dataSize, Endian.little);

  final wav = Uint8List(44 + dataSize);
  wav.setRange(0, 44, header.buffer.asUint8List());
  wav.setRange(44, 44 + dataSize, pcm);
  return wav;
}
