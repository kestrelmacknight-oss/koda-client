// lib/core/providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api.dart';
class KodaUser {
  final String id;
  final String username;
  final String email;
  final String? avatarUrl;
  final bool isAdmin;
  final bool emailVerified;
  final bool friendsOnlyDms;
  final String kodaTier; // 'free' | 'spark' | 'pulse' -- see lib/shared/tier_badge.dart
  final String accountType; // 'standard' | 'child' -- see lib/features/parental
  KodaUser({
    required this.id,
    required this.username,
    required this.email,
    this.avatarUrl,
    this.isAdmin = false,
    this.emailVerified = false,
    this.friendsOnlyDms = false,
    this.kodaTier = 'free',
    this.accountType = 'standard',
  });
  factory KodaUser.fromJson(Map<String, dynamic> j) => KodaUser(
        id:             j['id'] as String,
        username:       j['username'] as String,
        email:          j['email'] as String,
        avatarUrl:      j['avatar_url'] as String?,
        isAdmin:        j['is_admin'] as bool? ?? false,
        emailVerified:  j['email_verified'] as bool? ?? false,
        friendsOnlyDms: j['friends_only_dms'] as bool? ?? false,
        kodaTier:       j['koda_tier'] as String? ?? 'free',
        accountType:    j['account_type'] as String? ?? 'standard',
      );
  bool get isChild => accountType == 'child';
  KodaUser copyWith({bool? friendsOnlyDms, String? kodaTier}) => KodaUser(
        id: id, username: username, email: email, avatarUrl: avatarUrl,
        isAdmin: isAdmin, emailVerified: emailVerified,
        friendsOnlyDms: friendsOnlyDms ?? this.friendsOnlyDms,
        kodaTier: kodaTier ?? this.kodaTier,
        accountType: accountType,
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
  void setFriendsOnlyDms(bool value) {
    final user = state.user;
    if (user == null) return;
    state = state.copyWith(user: user.copyWith(friendsOnlyDms: value));
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

// Which DM conversation (if any) is currently on screen -- set/cleared by
// dm_screen.dart. home_screen.dart's live-notification handler reads this
// to suppress a toast/tray popup for a DM the user is already looking at
// (channels use their own local _activeChannelId for the same purpose,
// no provider needed there since the check happens in the same widget).
final activeConversationProvider = StateProvider<String?>((ref) => null);

// A server's custom emoji (see Koda.Emoji, lib/shared/custom_emoji.dart)
// -- cached per server so the reaction picker, the composer's shortcode
// autocomplete, and the emoji-management tab in server_settings_screen.dart
// all share one fetch instead of each hitting the API independently.
// Invalidate with `ref.invalidate(serverEmojiProvider(serverId))` after
// an upload/delete so every consumer picks up the change.
final serverEmojiProvider =
    FutureProvider.family<List<Map<String, dynamic>>, String>((ref, serverId) {
  return KodaApi.instance.getServerEmoji(serverId);
});

// -- Voice & video settings --------------------------------------------------
// Pure state holder, same convention as AuthNotifier above -- the settings
// screen itself calls KodaApi.getSettings()/putSettings() directly and
// pushes results in, rather than the notifier making API calls itself.

class VoiceSettings {
  final bool noiseSuppression;
  final bool echoCancellation;
  final bool autoGainControl;
  // Real WebRTC capture constraints (see AudioCaptureOptions in
  // lib/core/voice_session.dart) -- distinct from VOX/PTT below, which
  // are gated client-side rather than passed to WebRTC at all.
  final bool highPassFilter;
  final bool typingNoiseDetection;
  final bool voiceIsolation;
  // Not a WebRTC capture constraint like the above -- gated client-side
  // by VoiceActivityController, which lowers other participants'
  // playback volume (Helper.setVolume) while local audioLevel is above
  // vadThreshold. See voice_activity_controller.dart for the actual tick.
  final bool autoDucking;
  final bool vadEnabled;
  final double vadThreshold;
  final String? pushToTalkKey;
  final String? audioInputId;
  final String? audioOutputId;
  final String? videoInputId;
  final String? varmSilentUrl;
  final String? varmTalkingUrl;
  final double varmThreshold;

  const VoiceSettings({
    this.noiseSuppression = true,
    this.echoCancellation = true,
    this.autoGainControl = true,
    this.highPassFilter = false,
    this.typingNoiseDetection = true,
    this.voiceIsolation = true,
    this.autoDucking = false,
    this.vadEnabled = false,
    this.vadThreshold = 0.05,
    this.pushToTalkKey,
    this.audioInputId,
    this.audioOutputId,
    this.videoInputId,
    this.varmSilentUrl,
    this.varmTalkingUrl,
    this.varmThreshold = 0.1,
  });

  bool get varmEnabled => varmSilentUrl != null && varmTalkingUrl != null;

  factory VoiceSettings.fromJson(Map<String, dynamic> j) => VoiceSettings(
        noiseSuppression:      j['noise_suppression'] as bool? ?? true,
        echoCancellation:      j['echo_cancellation'] as bool? ?? true,
        autoGainControl:       j['auto_gain_control'] as bool? ?? true,
        highPassFilter:        j['high_pass_filter'] as bool? ?? false,
        typingNoiseDetection:  j['typing_noise_detection'] as bool? ?? true,
        voiceIsolation:        j['voice_isolation'] as bool? ?? true,
        autoDucking:           j['auto_ducking'] as bool? ?? false,
        vadEnabled:            j['vad_enabled'] as bool? ?? false,
        vadThreshold:          (j['vad_threshold'] as num?)?.toDouble() ?? 0.05,
        pushToTalkKey:         j['push_to_talk_key'] as String?,
        audioInputId:          j['audio_input_id'] as String?,
        audioOutputId:         j['audio_output_id'] as String?,
        videoInputId:          j['video_input_id'] as String?,
        varmSilentUrl:         j['varm_silent_url'] as String?,
        varmTalkingUrl:        j['varm_talking_url'] as String?,
        varmThreshold:         (j['varm_threshold'] as num?)?.toDouble() ?? 0.1,
      );

  Map<String, dynamic> toJson() => {
        'noise_suppression':      noiseSuppression,
        'echo_cancellation':      echoCancellation,
        'auto_gain_control':      autoGainControl,
        'high_pass_filter':       highPassFilter,
        'typing_noise_detection': typingNoiseDetection,
        'voice_isolation':        voiceIsolation,
        'auto_ducking':           autoDucking,
        'vad_enabled':            vadEnabled,
        'vad_threshold':          vadThreshold,
        'push_to_talk_key':       pushToTalkKey,
        'audio_input_id':         audioInputId,
        'audio_output_id':        audioOutputId,
        'video_input_id':         videoInputId,
        'varm_silent_url':        varmSilentUrl,
        'varm_talking_url':       varmTalkingUrl,
        'varm_threshold':         varmThreshold,
      };

  VoiceSettings copyWith({
    bool? noiseSuppression,
    bool? echoCancellation,
    bool? autoGainControl,
    bool? highPassFilter,
    bool? typingNoiseDetection,
    bool? voiceIsolation,
    bool? autoDucking,
    bool? vadEnabled,
    double? vadThreshold,
    String? pushToTalkKey,
    bool clearPushToTalkKey = false,
    String? audioInputId,
    String? audioOutputId,
    String? videoInputId,
    String? varmSilentUrl,
    String? varmTalkingUrl,
    double? varmThreshold,
    bool clearVarm = false,
  }) => VoiceSettings(
        noiseSuppression:     noiseSuppression ?? this.noiseSuppression,
        echoCancellation:     echoCancellation ?? this.echoCancellation,
        autoGainControl:      autoGainControl ?? this.autoGainControl,
        highPassFilter:       highPassFilter ?? this.highPassFilter,
        typingNoiseDetection: typingNoiseDetection ?? this.typingNoiseDetection,
        voiceIsolation:       voiceIsolation ?? this.voiceIsolation,
        autoDucking:          autoDucking ?? this.autoDucking,
        vadEnabled:           vadEnabled ?? this.vadEnabled,
        vadThreshold:         vadThreshold ?? this.vadThreshold,
        pushToTalkKey:        clearPushToTalkKey ? null : (pushToTalkKey ?? this.pushToTalkKey),
        audioInputId:         audioInputId ?? this.audioInputId,
        audioOutputId:        audioOutputId ?? this.audioOutputId,
        videoInputId:         videoInputId ?? this.videoInputId,
        varmSilentUrl:        clearVarm ? null : (varmSilentUrl ?? this.varmSilentUrl),
        varmTalkingUrl:       clearVarm ? null : (varmTalkingUrl ?? this.varmTalkingUrl),
        varmThreshold:        varmThreshold ?? this.varmThreshold,
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


