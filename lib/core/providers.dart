// lib/core/providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
class KodaUser {
  final String id;
  final String username;
  final String email;
  final String? avatarUrl;
  final bool isAdmin;
  final bool emailVerified;
  KodaUser({
    required this.id,
    required this.username,
    required this.email,
    this.avatarUrl,
    this.isAdmin = false,
    this.emailVerified = false,
  });
  factory KodaUser.fromJson(Map<String, dynamic> j) => KodaUser(
        id:            j['id'] as String,
        username:      j['username'] as String,
        email:         j['email'] as String,
        avatarUrl:     j['avatar_url'] as String?,
        isAdmin:       j['is_admin'] as bool? ?? false,
        emailVerified: j['email_verified'] as bool? ?? false,
      );
}
class AuthState {
  final KodaUser? user;
  final bool mustChangePassword;
  final bool loading;
  const AuthState({
    this.user,
    this.mustChangePassword = false,
    this.loading = true,
  });
  AuthState copyWith({KodaUser? user, bool? mustChangePassword, bool? loading}) =>
      AuthState(
        user: user ?? this.user,
        mustChangePassword: mustChangePassword ?? this.mustChangePassword,
        loading: loading ?? this.loading,
      );
}
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());
  void setUser(Map<String, dynamic> json) {
    state = state.copyWith(user: KodaUser.fromJson(json), loading: false);
  }
  void setMustChangePassword(bool value) {
    state = state.copyWith(mustChangePassword: value);
  }
  void doneLoading() {
    state = state.copyWith(loading: false);
  }
  void clear() {
    state = const AuthState(loading: false);
  }
}
final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());
// Currently selected server/channel (simple navigation state for the
// home screen -- no routing package needed for a single-window desktop app)
final selectedServerProvider = StateProvider<Map<String, dynamic>?>((ref) => null);
final selectedChannelProvider = StateProvider<Map<String, dynamic>?>((ref) => null);

// -- Voice & video settings --------------------------------------------------
// Pure state holder, same convention as AuthNotifier above -- the settings
// screen itself calls KodaApi.getSettings()/putSettings() directly and
// pushes results in, rather than the notifier making API calls itself.

class VoiceSettings {
  final bool noiseSuppression;
  final bool echoCancellation;
  final bool autoGainControl;
  final bool vadEnabled;
  final double vadThreshold; // 0.0 - 1.0
  final String? pushToTalkKey; // null = push-to-talk off, mic always live
  final String? audioInputId;  // null = system default
  final String? audioOutputId; // null = system default
  final String? videoInputId;  // null = system default

  const VoiceSettings({
    this.noiseSuppression = true,
    this.echoCancellation = true,
    this.autoGainControl = true,
    this.vadEnabled = false,
    this.vadThreshold = 0.05,
    this.pushToTalkKey,
    this.audioInputId,
    this.audioOutputId,
    this.videoInputId,
  });

  factory VoiceSettings.fromJson(Map<String, dynamic> j) => VoiceSettings(
        noiseSuppression: j['noise_suppression'] as bool? ?? true,
        echoCancellation: j['echo_cancellation'] as bool? ?? true,
        autoGainControl:  j['auto_gain_control'] as bool? ?? true,
        vadEnabled:       j['vad_enabled'] as bool? ?? false,
        vadThreshold:     (j['vad_threshold'] as num?)?.toDouble() ?? 0.05,
        pushToTalkKey:    j['push_to_talk_key'] as String?,
        audioInputId:     j['audio_input_id'] as String?,
        audioOutputId:    j['audio_output_id'] as String?,
        videoInputId:     j['video_input_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'noise_suppression': noiseSuppression,
        'echo_cancellation': echoCancellation,
        'auto_gain_control': autoGainControl,
        'vad_enabled':       vadEnabled,
        'vad_threshold':     vadThreshold,
        'push_to_talk_key':  pushToTalkKey,
        'audio_input_id':    audioInputId,
        'audio_output_id':   audioOutputId,
        'video_input_id':    videoInputId,
      };

  VoiceSettings copyWith({
    bool? noiseSuppression,
    bool? echoCancellation,
    bool? autoGainControl,
    bool? vadEnabled,
    double? vadThreshold,
    String? pushToTalkKey,
    bool clearPushToTalkKey = false,
    String? audioInputId,
    String? audioOutputId,
    String? videoInputId,
  }) => VoiceSettings(
        noiseSuppression: noiseSuppression ?? this.noiseSuppression,
        echoCancellation: echoCancellation ?? this.echoCancellation,
        autoGainControl:  autoGainControl ?? this.autoGainControl,
        vadEnabled:       vadEnabled ?? this.vadEnabled,
        vadThreshold:     vadThreshold ?? this.vadThreshold,
        pushToTalkKey: clearPushToTalkKey ? null : (pushToTalkKey ?? this.pushToTalkKey),
        audioInputId:  audioInputId ?? this.audioInputId,
        audioOutputId: audioOutputId ?? this.audioOutputId,
        videoInputId:  videoInputId ?? this.videoInputId,
      );
}

class VoiceSettingsNotifier extends StateNotifier<VoiceSettings> {
  VoiceSettingsNotifier() : super(const VoiceSettings());

  void setAll(VoiceSettings settings) => state = settings;

  void update(VoiceSettings Function(VoiceSettings) updater) {
    state = updater(state);
  }
}

final voiceSettingsProvider =
    StateNotifierProvider<VoiceSettingsNotifier, VoiceSettings>(
        (ref) => VoiceSettingsNotifier());
