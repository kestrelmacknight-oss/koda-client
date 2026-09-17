// lib/features/settings/device_test_screen.dart
//
// Briefly connects to a private, user-scoped LiveKit "self-test" room
// (see VoiceController.self_test_token) purely so device enumeration and
// testing work correctly -- audio output devices specifically don't show
// up in livekit_client's Hardware.enumerateDevices() until after a real
// room connection has happened at least once (a known SDK behavior, not
// a bug on our end). Selected devices persist into the user's voice
// settings, read back by the real voice_screen.dart on connect.

import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:livekit_client/livekit_client.dart' as lk;
// AudioFrameCapture/createAudioFrameCapture aren't re-exported from the
// package's public livekit_client.dart barrel (only the AudioFrame/
// AudioFormat data types are) even though the underlying native capture
// is real and working -- confirmed via the package's own CHANGELOG
// ("Added: Audio frame capture on Linux/Windows") and its native
// windows/livekit_plugin.cpp. Reaching into src/ directly is the only
// way to use it; flagged here since a future livekit_client version
// could reorganize this file without it being a breaking-export change.
import 'package:livekit_client/src/audio/audio_frame_capture.dart' as frame_capture;
import '../../core/api.dart';
import '../../core/pcm_wav.dart';
import '../../core/theme.dart';
import '../../core/providers.dart';

class DeviceTestScreen extends ConsumerStatefulWidget {
  const DeviceTestScreen({super.key});
  @override
  ConsumerState<DeviceTestScreen> createState() => _DeviceTestScreenState();
}

class _DeviceTestScreenState extends ConsumerState<DeviceTestScreen> {
  final lk.Room _room = lk.Room();
  bool _connecting = true;
  String? _error;

  List<lk.MediaDevice> _audioInputs = [];
  List<lk.MediaDevice> _audioOutputs = [];
  List<lk.MediaDevice> _videoInputs = [];

  lk.MediaDevice? _selectedAudioInput;
  lk.MediaDevice? _selectedAudioOutput;
  lk.MediaDevice? _selectedVideoInput;

  lk.LocalVideoTrack? _videoTrack;
  bool _cameraTesting = false;

  // Delayed self-listen: record a bounded clip via raw PCM capture, then
  // play it back -- not a continuous real-time monitor loop (that needs
  // seamless gapless audio queuing, a meaningfully harder problem).
  double _selfListenDelay = 1.5;
  bool _selfListenBusy = false;
  String _selfListenLabel = 'Test';

  @override
  void initState() {
    super.initState();
    _connect();
  }

  lk.MediaDevice? _findDevice(List<lk.MediaDevice> devices, String? id) {
    if (id == null) return null;
    for (final d in devices) {
      if (d.deviceId == id) return d;
    }
    return null;
  }

  Future<void> _connect() async {
    try {
      final result = await KodaApi.instance.getSelfTestVoiceToken();
      if (result == null) {
        if (mounted) setState(() { _connecting = false; _error = 'Could not get a test token.'; });
        return;
      }

      final settings = ref.read(voiceSettingsProvider);

      await _room.connect(result['url'] as String, result['token'] as String);

      await _room.localParticipant?.setMicrophoneEnabled(
        true,
        audioCaptureOptions: lk.AudioCaptureOptions(
          deviceId: settings.audioInputId,
          noiseSuppression: settings.noiseSuppression,
          echoCancellation: settings.echoCancellation,
          autoGainControl: settings.autoGainControl,
        ),
      );

      _room.addListener(_onRoomChange);

      await _loadDevices();

      if (mounted) setState(() => _connecting = false);
    } catch (e) {
      if (mounted) setState(() { _connecting = false; _error = e.toString(); });
    }
  }

  Future<void> _loadDevices() async {
    final inputs  = await lk.Hardware.instance.audioInputs();
    final outputs = await lk.Hardware.instance.audioOutputs();
    final cameras = await lk.Hardware.instance.videoInputs();
    if (!mounted) return;

    final settings = ref.read(voiceSettingsProvider);
    setState(() {
      _audioInputs  = inputs;
      _audioOutputs = outputs;
      _videoInputs  = cameras;
      _selectedAudioInput  = _findDevice(inputs, settings.audioInputId)
          ?? lk.Hardware.instance.selectedAudioInput;
      _selectedAudioOutput = _findDevice(outputs, settings.audioOutputId)
          ?? lk.Hardware.instance.selectedAudioOutput;
      _selectedVideoInput  = _findDevice(cameras, settings.videoInputId)
          ?? lk.Hardware.instance.selectedVideoInput;
    });
  }

  void _onRoomChange() {
    if (mounted) setState(() {});
  }

  Future<void> _selectAudioInput(lk.MediaDevice device) async {
    await lk.Hardware.instance.selectAudioInput(device);
    if (!mounted) return;
    setState(() => _selectedAudioInput = device);
    _saveDevice(audioInputId: device.deviceId);
  }

  Future<void> _selectAudioOutput(lk.MediaDevice device) async {
    await lk.Hardware.instance.selectAudioOutput(device);
    if (!mounted) return;
    setState(() => _selectedAudioOutput = device);
    _saveDevice(audioOutputId: device.deviceId);
  }

  Future<void> _selectVideoInput(lk.MediaDevice device) async {
    setState(() => _selectedVideoInput = device);
    _saveDevice(videoInputId: device.deviceId);
    if (_cameraTesting) {
      await _stopCameraTest();
      await _startCameraTest();
    }
  }

  Future<void> _saveDevice({String? audioInputId, String? audioOutputId, String? videoInputId}) async {
    final current = ref.read(voiceSettingsProvider);
    final updated = current.copyWith(
      audioInputId:  audioInputId  ?? current.audioInputId,
      audioOutputId: audioOutputId ?? current.audioOutputId,
      videoInputId:  videoInputId  ?? current.videoInputId,
    );
    ref.read(voiceSettingsProvider.notifier).setAll(updated);

    final full = await KodaApi.instance.getSettings();
    final merged = {...full, 'voice': updated.toJson()};
    await KodaApi.instance.putSettings(merged);
  }

  Future<void> _startCameraTest() async {
    try {
      final track = await lk.LocalVideoTrack.createCameraTrack(
        lk.CameraCaptureOptions(deviceId: _selectedVideoInput?.deviceId),
      );
      if (!mounted) {
        await track.dispose();
        return;
      }
      setState(() {
        _videoTrack = track;
        _cameraTesting = true;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not start camera: $e')));
      }
    }
  }

  Future<void> _stopCameraTest() async {
    final track = _videoTrack;
    setState(() {
      _videoTrack = null;
      _cameraTesting = false;
    });
    if (track != null) await track.dispose();
  }

  Future<void> _testSelfListen() async {
    if (_selfListenBusy) return;
    final track = _room.localParticipant?.audioTrackPublications.firstOrNull?.track;
    if (track == null) return;

    setState(() { _selfListenBusy = true; _selfListenLabel = 'Recording...'; });

    const sampleRate = 24000;
    const channels = 1;
    final targetBytes = (sampleRate * channels * 2 * _selfListenDelay).round(); // Int16 = 2 bytes/sample

    final capture = frame_capture.createAudioFrameCapture();
    final chunks = <int>[];
    final completer = Completer<void>();
    final sub = capture.frameStream.listen((frame) {
      chunks.addAll(frame.data);
      if (chunks.length >= targetBytes && !completer.isCompleted) completer.complete();
    });

    final started = await capture.start(
      track: track.mediaStreamTrack,
      rendererId: 'self-listen-${DateTime.now().microsecondsSinceEpoch}',
      sampleRate: sampleRate,
      channels: channels,
      format: lk.AudioFormat.Int16,
    );

    if (!started) {
      await sub.cancel();
      await capture.stop();
      if (mounted) setState(() { _selfListenBusy = false; _selfListenLabel = 'Test'; });
      return;
    }

    // Safety timeout in case frames stop arriving for some reason --
    // never leave the button stuck on "Recording...".
    await completer.future.timeout(
      Duration(seconds: _selfListenDelay.ceil() + 5),
      onTimeout: () {},
    );
    await sub.cancel();
    await capture.stop();

    if (!mounted || chunks.isEmpty) {
      if (mounted) setState(() { _selfListenBusy = false; _selfListenLabel = 'Test'; });
      return;
    }

    setState(() => _selfListenLabel = 'Playing back...');
    final wav = wrapPcm16AsWav(Uint8List.fromList(chunks), sampleRate: sampleRate, channels: channels);
    final player = AudioPlayer();
    try {
      await player.setAudioSource(_BytesAudioSource(wav));
      await player.play();
      await player.playerStateStream.firstWhere((s) => s.processingState == ProcessingState.completed);
    } catch (_) {
      // Best-effort -- a playback failure just ends the test early.
    } finally {
      await player.dispose();
    }

    if (mounted) setState(() { _selfListenBusy = false; _selfListenLabel = 'Test'; });
  }

  @override
  void dispose() {
    _room.removeListener(_onRoomChange);
    _videoTrack?.dispose();
    _room.disconnect();
    _room.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final level = _room.localParticipant?.audioLevel ?? 0.0;

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: const Text('Test Devices', style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: _connecting
          ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _error != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text('Could not connect: $_error',
                        style: const TextStyle(color: KodaColors.accent), textAlign: TextAlign.center),
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    _sectionLabel('Microphone'),
                    _deviceDropdown(
                      devices: _audioInputs,
                      selected: _selectedAudioInput,
                      onSelect: _selectAudioInput,
                      placeholder: 'System default',
                    ),
                    const SizedBox(height: 10),
                    _levelMeter(level),
                    const SizedBox(height: 24),

                    _sectionLabel('Hear Yourself (Delayed)'),
                    Text('Talk, then hear a ${_selfListenDelay.toStringAsFixed(1)}s clip play back',
                        style: const TextStyle(color: KodaColors.text3, fontSize: 12)),
                    Slider(
                      value: _selfListenDelay,
                      min: 0.5,
                      max: 5.0,
                      divisions: 9,
                      activeColor: KodaColors.koda,
                      label: '${_selfListenDelay.toStringAsFixed(1)}s',
                      onChanged: _selfListenBusy
                          ? null
                          : (v) => setState(() => _selfListenDelay = v),
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 40)),
                      icon: _selfListenBusy
                          ? const SizedBox(width: 14, height: 14,
                              child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                          : const Icon(Icons.hearing, size: 16),
                      label: Text(_selfListenLabel),
                      onPressed: _selfListenBusy ? null : _testSelfListen,
                    ),
                    const SizedBox(height: 24),

                    _sectionLabel('Speaker / Output'),
                    _deviceDropdown(
                      devices: _audioOutputs,
                      selected: _selectedAudioOutput,
                      onSelect: _selectAudioOutput,
                      placeholder: 'System default',
                    ),
                    const SizedBox(height: 24),

                    _sectionLabel('Camera'),
                    _deviceDropdown(
                      devices: _videoInputs,
                      selected: _selectedVideoInput,
                      onSelect: _selectVideoInput,
                      placeholder: 'System default',
                    ),
                    const SizedBox(height: 10),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: KodaColors.card,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: KodaColors.border),
                        ),
                        child: _videoTrack != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: lk.VideoTrackRenderer(_videoTrack!),
                              )
                            : const Center(
                                child: Text('Camera preview off',
                                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                              ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton.icon(
                      onPressed: _cameraTesting ? _stopCameraTest : _startCameraTest,
                      icon: Icon(_cameraTesting ? Icons.videocam_off : Icons.videocam, size: 16),
                      label: Text(_cameraTesting ? 'Stop Camera Test' : 'Test Camera'),
                    ),
                  ],
                ),
    );
  }

  Widget _sectionLabel(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text.toUpperCase(),
            style: const TextStyle(
                color: KodaColors.text3, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1)),
      );

  Widget _deviceDropdown({
    required List<lk.MediaDevice> devices,
    required lk.MediaDevice? selected,
    required ValueChanged<lk.MediaDevice> onSelect,
    required String placeholder,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: KodaColors.border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          dropdownColor: KodaColors.card,
          value: selected?.deviceId,
          hint: Text(placeholder, style: const TextStyle(color: KodaColors.text3, fontSize: 13)),
          items: devices.map((d) => DropdownMenuItem(
                value: d.deviceId,
                child: Text(d.label.isNotEmpty ? d.label : d.deviceId,
                    style: const TextStyle(color: KodaColors.text1, fontSize: 13),
                    overflow: TextOverflow.ellipsis),
              )).toList(),
          onChanged: (id) {
            if (id == null) return;
            final device = _findDevice(devices, id);
            if (device != null) onSelect(device);
          },
        ),
      ),
    );
  }

  Widget _levelMeter(double level) {
    final clamped = level.clamp(0.0, 1.0);
    Color barColor = KodaColors.mint;
    if (clamped > 0.75) {
      barColor = KodaColors.accent;
    } else if (clamped > 0.4) {
      barColor = KodaColors.gold;
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Input level', style: TextStyle(color: KodaColors.text3, fontSize: 11)),
      const SizedBox(height: 4),
      ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: clamped,
          minHeight: 10,
          backgroundColor: KodaColors.border,
          color: barColor,
        ),
      ),
    ]);
  }
}

/// just_audio has no raw-PCM/in-memory source, only file/URL/byte-stream
/// sources with a real container format -- this serves the WAV bytes
/// wrapPcm16AsWav produces as a single-chunk stream.
class _BytesAudioSource extends StreamAudioSource {
  final Uint8List _bytes;
  _BytesAudioSource(this._bytes) : super(tag: 'self-listen');

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    start ??= 0;
    end ??= _bytes.length;
    return StreamAudioResponse(
      sourceLength: _bytes.length,
      contentLength: end - start,
      offset: start,
      stream: Stream.value(_bytes.sublist(start, end)),
      contentType: 'audio/wav',
    );
  }
}