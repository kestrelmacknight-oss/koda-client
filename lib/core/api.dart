// lib/core/api.dart
//
// Koda API client -- production build targeting api.koda.fyi exclusively.
// No demo fallbacks: this is a live Alpha client. Failures surface as
// empty results or null so the UI can show a real connection error
// rather than fabricated content.

import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'config.dart';
import 'storage.dart';

/// Typed outcome for the handful of calls where "null on any failure"
/// (this file's normal convention) isn't enough -- specifically login()
/// and me(), which need to tell "wrong password" apart from "valid
/// session, but a child account outside its allowed hours" (see
/// lib/features/auth/child_lockout_screen.dart). Every other method
/// keeps the plain null-on-error convention; this is deliberately not a
/// blanket replacement.
class KodaApiResult<T> {
  final T? data;
  final int? statusCode;
  final String? errorCode; // e.g. "outside_allowed_hours", "invalid_credentials"
  // The full error response body, for callers that need more than just
  // errorCode -- e.g. joinStage's "ticket_required" carries the event
  // (price, title) that needs a ticket, not just the bare code.
  final Map<String, dynamic>? errorBody;
  const KodaApiResult({this.data, this.statusCode, this.errorCode, this.errorBody});
  bool get ok => data != null;
  bool get isOutsideAllowedHours => errorCode == 'outside_allowed_hours';
}

class StartEpochResult {
  final int epoch;
  final bool created;
  const StartEpochResult({required this.epoch, required this.created});
}

class KodaApi {
  KodaApi._() {
    _dio = Dio(BaseOptions(
      baseUrl:        KodaConfig.apiBaseUrl,
      connectTimeout: KodaConfig.connectTimeout,
      receiveTimeout: KodaConfig.receiveTimeout,
      sendTimeout:    KodaConfig.sendTimeout,
      headers: {
        'Content-Type':  'application/json',
        'Accept':        'application/json',
        'X-App-Version': KodaConfig.appVersion,
      },
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (_token != null) {
          options.headers['Authorization'] = 'Bearer $_token';
        }
        handler.next(options);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          _token = null;
          KodaStorage.clearToken();
        } else if (error.response?.statusCode == 403 &&
            _errorCodeOf(error) == 'outside_allowed_hours') {
          // The token itself is still valid -- this is a child account
          // outside its allowed hours, not an auth failure, so the
          // session is left intact. Broadcast so the app can route to
          // the lockout screen regardless of which call tripped this.
          _lockoutController.add(null);
        }
        handler.next(error);
      },
    ));

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: false, responseBody: false, error: true,
        logPrint: (o) => debugPrint('[KodaApi] $o'),
      ));
    }
  }

  static final KodaApi instance = KodaApi._();
  late final Dio _dio;
  String? _token;

  final _lockoutController = StreamController<void>.broadcast();
  /// Fires whenever any request comes back 403 "outside_allowed_hours" --
  /// listened to at the app root (see main.dart's AuthGate) to route to
  /// the child lockout screen regardless of which call noticed it.
  Stream<void> get lockoutStream => _lockoutController.stream;

  String? _errorCodeOf(DioException error) {
    final data = error.response?.data;
    return data is Map ? data['error'] as String? : null;
  }

  void setToken(String token) {
    _token = token;
    KodaStorage.saveToken(token);
  }

  Future<void> loadStoredToken() async {
    _token = await KodaStorage.loadToken();
  }

  bool get hasToken => _token != null;

  // ── Auth ─────────────────────────────────────────────────────────────

  Future<KodaApiResult<Map<String, dynamic>>> login(String email, String password) async {
    try {
      final res = await _dio.post('/auth/login',
          data: {'email': email, 'password': password});
      return KodaApiResult(data: res.data as Map<String, dynamic>, statusCode: res.statusCode);
    } on DioException catch (e) {
      _log('login', e);
      return KodaApiResult(statusCode: e.response?.statusCode, errorCode: _errorCodeOf(e));
    }
  }

  Future<bool> verifyEmail(String code, [String userId = '']) async {
    try {
      await _dio.post('/auth/verify_email',
          data: {'code': code, 'user_id': userId});
      return true;
    } catch (e) { _log('verifyEmail', e); return false; }
  }

  Future<bool> resendVerification() async {
    try {
      await _dio.post('/auth/verify_email/resend');
      return true;
    } catch (e) { _log('resendVerification', e); return false; }
  }

  Future<Map<String, dynamic>?> register({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      final res = await _dio.post('/auth/register', data: {
        'username': username, 'email': email, 'password': password,
        'password_confirmation': password,
      });
      return res.data as Map<String, dynamic>;
    } on DioException catch (e) {
      _log('register', e);
      return null;
    }
  }

  Future<void> logout() async {
    try { await _dio.delete('/auth/logout'); } catch (_) {}
    _token = null;
    await KodaStorage.clearToken();
  }

  Future<KodaApiResult<Map<String, dynamic>>> me() async {
    try {
      final res = await _dio.get('/auth/me');
      return KodaApiResult(data: res.data as Map<String, dynamic>, statusCode: res.statusCode);
    } on DioException catch (e) {
      return KodaApiResult(statusCode: e.response?.statusCode, errorCode: _errorCodeOf(e));
    } catch (_) {
      return const KodaApiResult();
    }
  }


  Future<bool> requestPasswordReset(String email) async {
    try {
      await _dio.post('/auth/password/reset', data: {'email': email});
      return true;
    } catch (_) { return false; }
  }

  Future<bool> confirmPasswordReset({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    try {
      await _dio.post('/auth/password/confirm', data: {
        'email': email, 'code': code, 'new_password': newPassword,
      });
      return true;
    } catch (_) { return false; }
  }

  Future<Map<String, dynamic>?> forceChangePassword({
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final res = await _dio.post('/auth/password/force_change', data: {
        'password': password, 'password_confirmation': passwordConfirmation,
      });
      return res.data as Map<String, dynamic>;
    } catch (_) { return null; }
  }

  Future<Map<String, dynamic>?> totpSetup() async {
    try {
      final res = await _dio.post('/auth/totp/setup');
      return res.data as Map<String, dynamic>;
    } catch (_) { return null; }
  }

  Future<bool> totpVerify(String code) async {
    try {
      await _dio.post('/auth/totp/verify', data: {'code': code});
      return true;
    } catch (_) { return false; }
  }

  // ── Servers ──────────────────────────────────────────────────────────

  Future<List<Map<String, dynamic>>> getServers() async {
    try {
      final res = await _dio.get('/servers');
      return List<Map<String, dynamic>>.from(res.data['servers'] ?? []);
    } catch (e) { _log('getServers', e); return []; }
  }

  Future<Map<String, dynamic>?> createServer({
    required String name,
    String? description,
  }) async {
    try {
      final res = await _dio.post('/servers',
          data: {'name': name, 'description': description});
      return res.data['server'] as Map<String, dynamic>;
    } catch (e) { _log('createServer', e); return null; }
  }

  // ── Channels ─────────────────────────────────────────────────────────

  Future<List<Map<String, dynamic>>> getChannels(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/channels');
      return List<Map<String, dynamic>>.from(res.data['channels'] ?? []);
    } catch (e) { _log('getChannels', e); return []; }
  }

  Future<Map<String, dynamic>?> createChannel({
    required String serverId,
    required String name,
    String type = 'text',
    String? categoryId,
    bool isReadOnly = false,
    bool isSubscriberOnly = false,
  }) async {
    try {
      final res = await _dio.post('/servers/$serverId/channels', data: {
        'name': name,
        'type': type,
        'is_read_only': isReadOnly,
        'is_subscriber_only': isSubscriberOnly,
        if (categoryId != null) 'category_id': categoryId,
      });
      return res.data['channel'] as Map<String, dynamic>;
    } catch (e) { _log('createChannel', e); return null; }
  }

  // ── Messages ─────────────────────────────────────────────────────────

  Future<List<Map<String, dynamic>>> getMessages(String channelId, {String? beforeId}) async {
    try {
      final res = await _dio.get('/channels/$channelId/messages',
          queryParameters: beforeId != null ? {'before': beforeId} : null);
      return List<Map<String, dynamic>>.from(res.data['messages'] ?? []);
    } catch (e) { _log('getMessages', e); return []; }
  }

  Future<KodaApiResult<Map<String, dynamic>>> sendMessage(
      String channelId, String content, {
        bool encrypted = false,
        String? replyToId,
        String? attachmentUrl,
        String? attachmentContentType,
        int? epoch,
        String? nonce,
        List<String>? mentionedUserIds,
        List<String>? mentionedRoleIds,
        bool mentionEveryone = false,
      }) async {
    try {
      final res = await _dio.post('/channels/$channelId/messages',
          data: {
            'content': content,
            'encrypted': encrypted,
            if (replyToId != null) 'reply_to_id': replyToId,
            if (epoch != null) 'epoch': epoch,
            if (nonce != null) 'nonce': nonce,
            if (mentionedUserIds != null) 'mentioned_user_ids': mentionedUserIds,
            if (mentionedRoleIds != null) 'mentioned_role_ids': mentionedRoleIds,
            'mention_everyone': mentionEveryone,
            if (attachmentUrl != null) 'attachment_url': attachmentUrl,
            if (attachmentContentType != null) 'attachment_content_type': attachmentContentType,
          });
      return KodaApiResult(data: res.data['message'] as Map<String, dynamic>);
    } catch (e) {
      _log('sendMessage', e);
      final statusCode = e is DioException ? e.response?.statusCode : null;
      return KodaApiResult(
        statusCode: statusCode,
        errorCode: statusCode == 429 ? 'rate_limited' : null,
      );
    }
  }

  Future<Map<String, dynamic>?> editMessage(
      String channelId, String messageId, String content, {String? nonce}) async {
    try {
      final res = await _dio.patch('/channels/$channelId/messages/$messageId',
          data: {'content': content, if (nonce != null) 'nonce': nonce});
      return res.data['message'] as Map<String, dynamic>;
    } catch (e) { _log('editMessage', e); return null; }
  }

  Future<bool> setLinkPreview(String channelId, String messageId,
      Map<String, String> preview) async {
    try {
      await _dio.patch('/channels/$channelId/messages/$messageId/link_preview',
          data: {'link_preview': preview});
      return true;
    } catch (e) { _log('setLinkPreview', e); return false; }
  }

  Future<bool> pinMessage(String channelId, String messageId) async {
    try {
      await _dio.post('/channels/$channelId/messages/$messageId/pin');
      return true;
    } catch (e) { _log('pinMessage', e); return false; }
  }

  Future<bool> unpinMessage(String channelId, String messageId) async {
    try {
      await _dio.delete('/channels/$channelId/messages/$messageId/pin');
      return true;
    } catch (e) { _log('unpinMessage', e); return false; }
  }

  Future<List<Map<String, dynamic>>> getPinnedMessages(String channelId) async {
    try {
      final res = await _dio.get('/channels/$channelId/pins');
      return List<Map<String, dynamic>>.from(res.data['messages'] ?? []);
    } catch (e) { _log('getPinnedMessages', e); return []; }
  }

  // Both return a typed result (rather than the usual empty-list-on-error
  // convention) because an empty list here is genuinely ambiguous -- it
  // could mean "no GIFs matched" or "GIPHY_API_KEY isn't configured/the
  // upstream call failed," and those need visibly different UI (see
  // gif_picker_dialog.dart). The server already distinguishes these
  // (GiphyController: 503 "not configured" vs 502 "failed") -- this was
  // previously being silently discarded by a bare catch-all here.
  Future<KodaApiResult<List<Map<String, dynamic>>>> searchGifs(String query) async {
    try {
      final res = await _dio.get('/gifs/search', queryParameters: {'q': query});
      final gifs = List<Map<String, dynamic>>.from(res.data['gifs'] ?? []);
      return KodaApiResult(data: gifs, statusCode: res.statusCode);
    } on DioException catch (e) {
      _log('searchGifs', e);
      return KodaApiResult(statusCode: e.response?.statusCode, errorCode: _giphyErrorOf(e));
    }
  }

  Future<KodaApiResult<List<Map<String, dynamic>>>> getTrendingGifs() async {
    try {
      final res = await _dio.get('/gifs/trending');
      final gifs = List<Map<String, dynamic>>.from(res.data['gifs'] ?? []);
      return KodaApiResult(data: gifs, statusCode: res.statusCode);
    } on DioException catch (e) {
      _log('getTrendingGifs', e);
      return KodaApiResult(statusCode: e.response?.statusCode, errorCode: _giphyErrorOf(e));
    }
  }

  String? _giphyErrorOf(DioException e) {
    final data = e.response?.data;
    return data is Map ? data['error'] as String? : null;
  }

  // ── Voice ────────────────────────────────────────────────────────────

  Future<Map<String, dynamic>?> getVoiceToken(String channelId, {bool viewer = false}) async {
    try {
      final res = await _dio.get('/channels/$channelId/voice/token',
          queryParameters: viewer ? {'viewer': 'true'} : null);
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getVoiceToken', e); return null; }
  }

  Future<Map<String, dynamic>?> getSelfTestVoiceToken() async {
    try {
      final res = await _dio.get('/voice/self_test_token');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getSelfTestVoiceToken', e); return null; }
  }

  // ── Uploads ───────────────────────────────────────────────────────────────

  /// Uploads a file through the Koda server to R2.
  /// Returns the cdn_url on success, null on failure.
  Future<String?> uploadFile({
    required File file,
    required String uploadType,
    required String contentType,
    // Digital product files can be up to 100MB (see Koda.Upload's
    // per-type size limits server-side) -- the default 15s send timeout
    // is tuned for small avatar/attachment uploads and isn't enough for
    // that, so callers of large uploads need to pass a longer one.
    Duration? sendTimeout,
  }) async {
    try {
      final bytes = await file.readAsBytes();
      final res = await _dio.post(
        '/uploads',
        data: bytes,
        options: Options(
          contentType: contentType,
          sendTimeout: sendTimeout,
          receiveTimeout: sendTimeout,
          headers: {
            'X-Upload-Type': uploadType,
            'Content-Length': bytes.length,
          },
        ),
      );
      return res.data['cdn_url'] as String?;
    } catch (e) { _log('uploadFile', e); return null; }
  }

  /// Same endpoint as [uploadFile], for callers that already have bytes
  /// in memory (e.g. encrypted attachment ciphertext) rather than a File
  /// on disk.
  Future<String?> uploadBytes({
    required List<int> bytes,
    required String uploadType,
    required String contentType,
  }) async {
    try {
      final res = await _dio.post(
        '/uploads',
        data: bytes,
        options: Options(
          contentType: contentType,
          headers: {
            'X-Upload-Type': uploadType,
            'Content-Length': bytes.length,
          },
        ),
      );
      return res.data['cdn_url'] as String?;
    } catch (e) { _log('uploadBytes', e); return null; }
  }

  /// Fetches raw bytes from an absolute URL (e.g. a CDN attachment URL),
  /// for callers that will decrypt the response themselves. Uses a bare
  /// Dio instance rather than [_dio]: the CDN lives on a different host
  /// than the API, and [_dio]'s interceptor attaches the session's
  /// bearer token to every request -- that must never be sent cross-origin
  /// to a plain object-storage host that doesn't need it.
  Future<List<int>?> downloadRawBytes(String url) async {
    try {
      final res = await Dio().get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      return res.data;
    } catch (e) { _log('downloadRawBytes', e); return null; }
  }

  // ── Invites ───────────────────────────────────────────────────────────────

  Future<Map<String, dynamic>?> createInvite(String serverId,
      {int? maxUses, String? expiresAt}) async {
    try {
      final res = await _dio.post('/servers/$serverId/invites', data: {
        if (maxUses != null) 'max_uses': maxUses,
        if (expiresAt != null) 'expires_at': expiresAt,
      });
      return res.data['invite'] as Map<String, dynamic>;
    } catch (e) { _log('createInvite', e); return null; }
  }

  Future<List<Map<String, dynamic>>> listInvites(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/invites');
      return List<Map<String, dynamic>>.from(res.data['invites'] ?? []);
    } catch (e) { _log('listInvites', e); return []; }
  }

  Future<bool> deleteInvite(String serverId, String code) async {
    try {
      await _dio.delete('/servers/$serverId/invites/$code');
      return true;
    } catch (e) { _log('deleteInvite', e); return false; }
  }

  /// Public preview of an invite -- no auth required, this is what a deep
  /// link (see lib/core/deep_links.dart) hits before the user has decided
  /// to join, same as tapping a Discord invite link before you're a member.
  Future<Map<String, dynamic>?> getInvitePreview(String code) async {
    try {
      final res = await _dio.get('/invite/$code');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getInvitePreview', e); return null; }
  }

  Future<Map<String, dynamic>?> redeemInvite(String code) async {
    try {
      final res = await _dio.post('/invites/$code/redeem');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('redeemInvite', e); return null; }
  }

  Future<Map<String, dynamic>?> redeemBackerCode(String code) async {
    try {
      final res = await _dio.post('/backer_codes/$code/redeem');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('redeemBackerCode', e); return null; }
  }

  // ── Reports (Tier 2 -- see koda-server's Koda.Reports) ─────────────────────
  //
  // disclosedContent is always the caller's own already-decrypted copy of
  // the message (it's on screen already, that's what's being reported) --
  // never re-fetched or re-decrypted here. The server can't decrypt it
  // either; this call is what discloses it.

  Future<Map<String, dynamic>?> reportChannelMessage(String channelId, String messageId,
      {required String reason, String? note, required String disclosedContent}) async {
    try {
      final res = await _dio.post('/channels/$channelId/messages/$messageId/report', data: {
        'reason': reason,
        if (note != null) 'note': note,
        'disclosed_content': disclosedContent,
      });
      return res.data['report'] as Map<String, dynamic>;
    } catch (e) { _log('reportChannelMessage', e); return null; }
  }

  Future<Map<String, dynamic>?> reportDmMessage(String messageId,
      {required String reason, String? note, required String disclosedContent}) async {
    try {
      final res = await _dio.post('/dm_messages/$messageId/report', data: {
        'reason': reason,
        if (note != null) 'note': note,
        'disclosed_content': disclosedContent,
      });
      return res.data['report'] as Map<String, dynamic>;
    } catch (e) { _log('reportDmMessage', e); return null; }
  }

  Future<List<Map<String, dynamic>>> getServerReports(String serverId, {String? status}) async {
    try {
      final res = await _dio.get('/servers/$serverId/reports',
          queryParameters: status != null ? {'status': status} : null);
      return List<Map<String, dynamic>>.from(res.data['reports'] ?? []);
    } catch (e) { _log('getServerReports', e); return []; }
  }

  /// Platform-admin-only -- DM reports have no server to have moderators
  /// of, see koda-server's Koda.Reports.list_dm_reports/1.
  Future<List<Map<String, dynamic>>> getDmReports({String? status}) async {
    try {
      final res = await _dio.get('/admin/dm_reports',
          queryParameters: status != null ? {'status': status} : null);
      return List<Map<String, dynamic>>.from(res.data['reports'] ?? []);
    } catch (e) { _log('getDmReports', e); return []; }
  }

  Future<bool> resolveReport(String reportId, String status, {String? moderationAction}) async {
    try {
      await _dio.post('/reports/$reportId/resolve', data: {
        'status': status,
        if (moderationAction != null) 'moderation_action': moderationAction,
      });
      return true;
    } catch (e) { _log('resolveReport', e); return false; }
  }

  /// Platform-admin-only, system-generated spam flags (dm_fanout +
  /// channel_flood in one queue) -- see koda-server's
  /// Koda.Moderation.list_spam_flags/1.
  Future<List<Map<String, dynamic>>> getSpamFlags({String? status}) async {
    try {
      final res = await _dio.get('/admin/spam_flags',
          queryParameters: status != null ? {'status': status} : null);
      return List<Map<String, dynamic>>.from(res.data['flags'] ?? []);
    } catch (e) { _log('getSpamFlags', e); return []; }
  }

  /// `status` is 'actioned' (applies the harder restriction -- see
  /// koda-server's Koda.Moderation.resolve_spam_flag/3) or 'dismissed'.
  Future<bool> resolveSpamFlag(String flagId, String status) async {
    try {
      await _dio.post('/spam_flags/$flagId/resolve', data: {'status': status});
      return true;
    } catch (e) { _log('resolveSpamFlag', e); return false; }
  }

  // ── Moderation ────────────────────────────────────────────────────────────

  Future<bool> deleteMessage(String channelId, String messageId,
      {String? bucket}) async {
    try {
      final params = bucket != null ? '?bucket=$bucket' : '';
      await _dio.delete('/channels/$channelId/messages/$messageId$params');
      return true;
    } catch (e) { _log('deleteMessage', e); return false; }
  }

  Future<bool> kickMember(String serverId, String userId) async {
    try {
      await _dio.delete('/servers/$serverId/members/$userId/kick');
      return true;
    } catch (e) { _log('kickMember', e); return false; }
  }

  Future<bool> banMember(String serverId, String userId) async {
    try {
      await _dio.post('/servers/$serverId/members/$userId/ban');
      return true;
    } catch (e) { _log('banMember', e); return false; }
  }

  Future<bool> unbanMember(String serverId, String userId) async {
    try {
      await _dio.delete('/servers/$serverId/members/$userId/ban');
      return true;
    } catch (e) { _log('unbanMember', e); return false; }
  }

  Future<bool> muteMember(String serverId, String userId,
      {int durationSeconds = 600, String? reason}) async {
    try {
      await _dio.post('/servers/$serverId/members/$userId/mute',
          data: {'duration_seconds': durationSeconds, if (reason != null) 'reason': reason});
      return true;
    } catch (e) { _log('muteMember', e); return false; }
  }

  Future<bool> unmuteMember(String serverId, String userId) async {
    try {
      await _dio.delete('/servers/$serverId/members/$userId/mute');
      return true;
    } catch (e) { _log('unmuteMember', e); return false; }
  }

  Future<bool> unlockInvites(String serverId) async {
    try {
      await _dio.post('/servers/$serverId/invites/unlock');
      return true;
    } catch (e) { _log('unlockInvites', e); return false; }
  }

  Future<List<Map<String, dynamic>>> getAuditLog(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/audit-log');
      return List<Map<String, dynamic>>.from(res.data['actions'] ?? []);
    } catch (e) { _log('getAuditLog', e); return []; }
  }

  Future<List<Map<String, dynamic>>> listBans(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/bans');
      return List<Map<String, dynamic>>.from(res.data['bans'] ?? []);
    } catch (e) { _log('listBans', e); return []; }
  }

  Future<List<Map<String, dynamic>>> getBans(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/bans');
      return List<Map<String, dynamic>>.from(res.data['bans'] ?? []);
    } catch (e) { _log('getBans', e); return []; }
  }

  // ── E2EE key bundles ──────────────────────────────────────────────────────

  Future<bool> hasKeyBundle() async {
    try {
      final res = await _dio.get('/keys/bundle/status');
      return res.data['has_bundle'] as bool? ?? false;
    } catch (e) { _log('hasKeyBundle', e); return false; }
  }

  Future<bool> uploadKeyBundle(Map<String, dynamic> bundle) async {
    try {
      await _dio.put('/keys/bundle', data: bundle);
      return true;
    } catch (e) { _log('uploadKeyBundle', e); return false; }
  }

  /// One specific device's bundle -- side-effecting (consumes one of
  /// that device's one-time prekeys), so only call this for a device
  /// you don't already hold a Double Ratchet session with (see
  /// getDeviceIdsFor, the non-side-effecting way to find out which
  /// device_ids exist before deciding which ones are actually new).
  Future<Map<String, dynamic>?> fetchKeyBundle(String userId, String deviceId) async {
    try {
      final res = await _dio.get('/keys/bundle/$userId', queryParameters: {'device_id': deviceId});
      return res.data['bundle'] as Map<String, dynamic>?;
    } catch (e) { _log('fetchKeyBundle', e); return null; }
  }

  // ── Multi-device registry ─────────────────────────────────────────────────

  /// This account's own devices (name, last active) -- for the "Linked
  /// Devices" settings screen and, filtered to exclude this install's
  /// own id, the self-sync fan-out target list.
  Future<List<Map<String, dynamic>>> getMyDevices() async {
    try {
      final res = await _dio.get('/devices/mine');
      return List<Map<String, dynamic>>.from(res.data['devices'] ?? []);
    } catch (e) { _log('getMyDevices', e); return []; }
  }

  /// Just the device_ids [userId] currently has -- not side-effecting,
  /// unlike fetchKeyBundle. Fan-out encryption calls this first (for
  /// both the recipient and, separately, the sender's own account) to
  /// figure out which device_ids are worth an X3DH handshake for.
  Future<List<String>> getDeviceIdsFor(String userId) async {
    try {
      final res = await _dio.get('/devices/user/$userId');
      final devices = List<Map<String, dynamic>>.from(res.data['devices'] ?? []);
      return devices.map((d) => d['device_id'] as String).toList();
    } catch (e) { _log('getDeviceIdsFor', e); return []; }
  }

  Future<bool> removeDevice(String deviceId) async {
    try {
      await _dio.delete('/devices/$deviceId');
      return true;
    } catch (e) { _log('removeDevice', e); return false; }
  }

  // ── Channel group encryption ────────────────────────────────────────────
  // See lib/core/crypto/channel_key_manager.dart for how these are used
  // together, and koda-server's Koda.ChannelCrypto for the server side.

  /// The channel's current epoch. 0 means it's never been encrypted.
  Future<int?> getChannelEpoch(String channelId) async {
    try {
      final res = await _dio.get('/channels/$channelId/epoch');
      return res.data['epoch'] as int?;
    } catch (e) { _log('getChannelEpoch', e); return null; }
  }

  /// Starts a new epoch (bootstrap, or a post-departure rotation).
  /// `created` is false if another client's request won the race to
  /// establish this epoch first -- the caller must NOT generate its own
  /// key in that case, only wait for a delivery of the winner's.
  Future<StartEpochResult?> startChannelEpoch(String channelId) async {
    try {
      final res = await _dio.post('/channels/$channelId/epoch');
      return StartEpochResult(
        epoch: res.data['epoch'] as int,
        created: res.data['created'] as bool? ?? false,
      );
    } catch (e) { _log('startChannelEpoch', e); return null; }
  }

  Future<List<String>> getPendingEpochRecipients(String channelId, int epoch) async {
    try {
      final res = await _dio.get('/channels/$channelId/epoch/$epoch/pending');
      return List<String>.from(res.data['user_ids'] ?? []);
    } catch (e) { _log('getPendingEpochRecipients', e); return []; }
  }

  /// Uploads this sender's encrypted copies of one epoch's key, one per
  /// recipient. Each entry is `{recipient_id, content, ratchet_key,
  /// msg_number, prev_chain, nonce, x3dh_header?}` -- the same envelope
  /// shape DmSessionManager.encryptForSend produces.
  Future<bool> deliverChannelEpochKeys(
      String channelId, int epoch, List<Map<String, dynamic>> deliveries) async {
    try {
      await _dio.post('/channels/$channelId/epoch/deliveries',
          data: {'epoch': epoch, 'deliveries': deliveries});
      return true;
    } catch (e) { _log('deliverChannelEpochKeys', e); return false; }
  }

  Future<List<Map<String, dynamic>>> getMyChannelDeliveries(String channelId) async {
    try {
      final res = await _dio.get('/channels/$channelId/epoch/my_deliveries');
      return List<Map<String, dynamic>>.from(res.data['deliveries'] ?? []);
    } catch (e) { _log('getMyChannelDeliveries', e); return []; }
  }

  // ── Threshold moderator decryption (Tier 3) ─────────────────────────────
  // See lib/core/crypto/threshold_moderation_manager.dart for how these
  // are used together, and koda-server's Koda.ThresholdModeration for
  // the server side. Same envelope-delivery shape as channel group
  // encryption above, just carrying Shamir shares instead of the real
  // epoch key -- see lib/core/crypto/shamir.dart.

  /// Null if Tier 3 has never been configured for this server. Readable
  /// by any member -- it names the moderator group, not any secret.
  Future<Map<String, dynamic>?> getThresholdModerationConfig(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/threshold_moderation');
      return res.data['config'] as Map<String, dynamic>?;
    } catch (e) { _log('getThresholdModerationConfig', e); return null; }
  }

  /// Server owner only. Only takes effect for epochs generated after
  /// this call -- see Koda.ThresholdModeration.set_config's doc comment.
  Future<Map<String, dynamic>?> setThresholdModerationConfig(
      String serverId, List<String> moderatorIds, int threshold, {bool enabled = true}) async {
    try {
      final res = await _dio.put('/servers/$serverId/threshold_moderation', data: {
        'moderator_ids': moderatorIds,
        'threshold': threshold,
        'enabled': enabled,
      });
      return res.data['config'] as Map<String, dynamic>?;
    } catch (e) { _log('setThresholdModerationConfig', e); return null; }
  }

  Future<List<String>> getPendingThresholdShareRecipients(String channelId, int epoch) async {
    try {
      final res = await _dio.get('/channels/$channelId/epoch/$epoch/threshold_shares/pending');
      return List<String>.from(res.data['moderator_ids'] ?? []);
    } catch (e) { _log('getPendingThresholdShareRecipients', e); return []; }
  }

  /// Each entry is `{moderator_id, share_index, content, ratchet_key,
  /// msg_number, prev_chain, nonce, x3dh_header?}`.
  Future<bool> deliverThresholdShares(
      String channelId, int epoch, List<Map<String, dynamic>> shares) async {
    try {
      await _dio.post('/channels/$channelId/epoch/threshold_shares',
          data: {'epoch': epoch, 'shares': shares});
      return true;
    } catch (e) { _log('deliverThresholdShares', e); return false; }
  }

  Future<List<Map<String, dynamic>>> getMyThresholdShares(String channelId) async {
    try {
      final res = await _dio.get('/channels/$channelId/epoch/my_threshold_shares');
      return List<Map<String, dynamic>>.from(res.data['shares'] ?? []);
    } catch (e) { _log('getMyThresholdShares', e); return []; }
  }

  /// Requests a threshold decrypt of one channel epoch -- designated
  /// moderators only. The requester's own initiation counts as their
  /// first approval.
  Future<Map<String, dynamic>?> createThresholdDecryptRequest(
      String channelId, int epoch, String reason) async {
    try {
      final res = await _dio.post(
          '/channels/$channelId/epoch/$epoch/threshold_decrypt_requests',
          data: {'reason': reason});
      return res.data['request'] as Map<String, dynamic>?;
    } catch (e) { _log('createThresholdDecryptRequest', e); return null; }
  }

  /// Pending/approved requests for a server -- designated moderators only.
  Future<List<Map<String, dynamic>>> getThresholdDecryptRequests(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/threshold_decrypt_requests');
      return List<Map<String, dynamic>>.from(res.data['requests'] ?? []);
    } catch (e) { _log('getThresholdDecryptRequests', e); return []; }
  }

  Future<Map<String, dynamic>?> approveThresholdDecryptRequest(String requestId) async {
    try {
      final res = await _dio.post('/threshold_decrypt_requests/$requestId/approve');
      return res.data['request'] as Map<String, dynamic>?;
    } catch (e) { _log('approveThresholdDecryptRequest', e); return null; }
  }

  /// Bookkeeping only -- call once this device has actually reconstructed
  /// the epoch key locally.
  Future<bool> completeThresholdDecryptRequest(String requestId) async {
    try {
      await _dio.post('/threshold_decrypt_requests/$requestId/complete');
      return true;
    } catch (e) { _log('completeThresholdDecryptRequest', e); return false; }
  }

  /// An approving moderator relays their decrypted-then-re-encrypted
  /// share to the requester -- same envelope shape as everything else
  /// in this section.
  Future<bool> relayThresholdShare(String requestId, Map<String, dynamic> envelope) async {
    try {
      await _dio.post('/threshold_decrypt_requests/$requestId/share_relays', data: envelope);
      return true;
    } catch (e) { _log('relayThresholdShare', e); return false; }
  }

  /// The requester polls this for shares relayed to them so far.
  Future<List<Map<String, dynamic>>> getThresholdShareRelays(String requestId) async {
    try {
      final res = await _dio.get('/threshold_decrypt_requests/$requestId/share_relays');
      return List<Map<String, dynamic>>.from(res.data['relays'] ?? []);
    } catch (e) { _log('getThresholdShareRelays', e); return []; }
  }

  // ── Stage channels ────────────────────────────────────────────────────────

  /// errorCode is "ticket_required" when this stage has a currently-live
  /// paid event the caller hasn't bought a ticket for -- the event
  /// itself (price, title) rides along in the response body.
  Future<KodaApiResult<Map<String, dynamic>>> joinStage(String channelId) async {
    try {
      final res = await _dio.post('/channels/$channelId/stage/join');
      return KodaApiResult(data: res.data as Map<String, dynamic>, statusCode: res.statusCode);
    } on DioException catch (e) {
      _log('joinStage', e);
      final body = e.response?.data;
      return KodaApiResult(
        statusCode: e.response?.statusCode,
        errorCode: body is Map ? body['error'] as String? : null,
        errorBody: body is Map<String, dynamic> ? body : null,
      );
    }
  }

  Future<bool> raiseHand(String channelId) async {
    try {
      await _dio.post('/channels/$channelId/stage/raise_hand');
      return true;
    } catch (e) { _log('raiseHand', e); return false; }
  }

  Future<bool> lowerHand(String channelId) async {
    try {
      await _dio.post('/channels/$channelId/stage/lower_hand');
      return true;
    } catch (e) { _log('lowerHand', e); return false; }
  }

  Future<bool> grantSpeaker(String channelId, String userId) async {
    try {
      await _dio.post('/channels/$channelId/stage/grant/$userId');
      return true;
    } catch (e) { _log('grantSpeaker', e); return false; }
  }

  Future<bool> revokeSpeaker(String channelId, String userId) async {
    try {
      await _dio.delete('/channels/$channelId/stage/grant/$userId');
      return true;
    } catch (e) { _log('revokeSpeaker', e); return false; }
  }

  // ── Gallery ───────────────────────────────────────────────────────────────

  Future<List<Map<String, dynamic>>> getGalleryCollections(String channelId) async {
    try {
      final res = await _dio.get('/channels/$channelId/gallery/collections');
      return List<Map<String, dynamic>>.from(res.data['collections'] ?? []);
    } catch (e) { _log('getGalleryCollections', e); return []; }
  }

  Future<Map<String, dynamic>?> createGalleryCollection(
      String channelId, Map<String, dynamic> data) async {
    try {
      final res = await _dio.post('/channels/$channelId/gallery/collections', data: data);
      return res.data['collection'] as Map<String, dynamic>;
    } catch (e) { _log('createGalleryCollection', e); return null; }
  }

  Future<Map<String, dynamic>?> updateGalleryCollection(
      String collectionId, Map<String, dynamic> data) async {
    try {
      final res = await _dio.patch('/gallery/collections/$collectionId', data: data);
      return res.data['collection'] as Map<String, dynamic>;
    } catch (e) { _log('updateGalleryCollection', e); return null; }
  }

  Future<bool> deleteGalleryCollection(String collectionId) async {
    try {
      await _dio.delete('/gallery/collections/$collectionId');
      return true;
    } catch (e) { _log('deleteGalleryCollection', e); return false; }
  }

  Future<List<Map<String, dynamic>>> getGalleryPosts(String channelId,
      {String? before}) async {
    try {
      final res = await _dio.get('/channels/$channelId/gallery/posts',
          queryParameters: before != null ? {'before': before} : {});
      return List<Map<String, dynamic>>.from(res.data['posts'] ?? []);
    } catch (e) { _log('getGalleryPosts', e); return []; }
  }

  Future<List<Map<String, dynamic>>> getCollectionPosts(String collectionId) async {
    try {
      final res = await _dio.get('/gallery/collections/$collectionId/posts');
      return List<Map<String, dynamic>>.from(res.data['posts'] ?? []);
    } catch (e) { _log('getCollectionPosts', e); return []; }
  }

  Future<Map<String, dynamic>?> createGalleryPost(
      String channelId, Map<String, dynamic> data) async {
    try {
      final res = await _dio.post('/channels/$channelId/gallery/posts', data: data);
      return res.data['post'] as Map<String, dynamic>;
    } catch (e) { _log('createGalleryPost', e); return null; }
  }

  Future<bool> deleteGalleryPost(String postId) async {
    try {
      await _dio.delete('/gallery/posts/$postId');
      return true;
    } catch (e) { _log('deleteGalleryPost', e); return false; }
  }

  Future<List<Map<String, dynamic>>> getDmConversations() async {
    try {
      final res = await _dio.get('/dms/conversations');
      return List<Map<String, dynamic>>.from(res.data['conversations'] ?? []);
    } catch (e) { _log('getDmConversations', e); return []; }
  }

  // Opens or retrieves an existing DM conversation with another user.
  // Returns the conversation id.
  Future<String?> openDmConversation(String userId) async {
    try {
      final res = await _dio.post('/dms/conversations', data: {'user_id': userId});
      return res.data['conversation']['id'] as String?;
    } catch (e) { _log('openDmConversation', e); return null; }
  }

  /// [myDeviceId] scopes the result to deliveries addressed to this
  /// device plus every legacy (pre-multi-device) row -- see
  /// Koda.Chat.get_dm_messages/3 server-side.
  Future<List<Map<String, dynamic>>> getDmMessages(String conversationId, String myDeviceId) async {
    try {
      final res = await _dio.get('/dms/$conversationId/messages',
          queryParameters: {'device_id': myDeviceId});
      return List<Map<String, dynamic>>.from(res.data['messages'] ?? []);
    } catch (e) { _log('getDmMessages', e); return []; }
  }

  /// Fan-out send: [deliveries] is one map per target device (see
  /// dm_session_manager.dart's encryptForSend), each already fully
  /// shaped for the wire -- content/ratchet_key/msg_number/prev_chain/
  /// nonce/sender_device_id/recipient_device_id, plus x3dh_header on a
  /// session-establishing delivery. Returns the shared
  /// message_group_id on success.
  Future<String?> sendDmMessage(
      String conversationId, String messageGroupId, List<Map<String, dynamic>> deliveries) async {
    try {
      final res = await _dio.post('/dms/$conversationId/messages', data: {
        'message_group_id': messageGroupId,
        'deliveries': deliveries,
      });
      return res.data['message_group_id'] as String?;
    } catch (e) { _log('sendDmMessage', e); return null; }
  }

  Future<bool> markDmRead(String conversationId) async {
    try {
      await _dio.post('/dms/$conversationId/read');
      return true;
    } catch (e) { _log('markDmRead', e); return false; }
  }

  Future<String?> getDmPeerLastReadAt(String conversationId) async {
    try {
      final res = await _dio.get('/dms/$conversationId/read_state');
      return res.data['peer_last_read_at'] as String?;
    } catch (e) { _log('getDmPeerLastReadAt', e); return null; }
  }

  Future<bool> markChannelRead(String channelId) async {
    try {
      await _dio.post('/channels/$channelId/read');
      return true;
    } catch (e) { _log('markChannelRead', e); return false; }
  }

  /// {channels: {channel_id: count}, dms: {conversation_id: count}}
  Future<Map<String, dynamic>> getUnreadCounts() async {
    try {
      final res = await _dio.get('/unread_counts');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getUnreadCounts', e); return {'channels': {}, 'dms': {}}; }
  }

  // -- Admin -----------------------------------------------------------------

  Future<List<Map<String, dynamic>>> listBackerCodes() async {
    try {
      final res = await _dio.get('/backer_codes');
      return List<Map<String, dynamic>>.from(res.data['backer_codes'] ?? []);
    } catch (e) { _log('listBackerCodes', e); return []; }
  }

  Future<Map<String, dynamic>?> createBackerCode({
    String? code, Map<String, dynamic>? flags,
    String? note, int? maxUses}) async {
    try {
      final res = await _dio.post('/backer_codes', data: {
        if (code != null)    'code':     code,
        if (flags != null)   'flags':    flags,
        if (note != null)    'note':     note,
        if (maxUses != null) 'max_uses': maxUses,
      });
      return res.data['backer_code'] as Map<String, dynamic>;
    } catch (e) { _log('createBackerCode', e); return null; }
  }

  Future<List<Map<String, dynamic>>> searchUsers(String query) async {
    try {
      final res = await _dio.get('/admin/users/search',
          queryParameters: {'q': query});
      return List<Map<String, dynamic>>.from(res.data['users'] ?? []);
    } catch (e) { _log('searchUsers', e); return []; }
  }


  // ── Discovery ────────────────────────────────────────────────────────

  Future<List<Map<String, dynamic>>> discoverServers({String? query}) async {
    try {
      final res = await _dio.get('/discover',
          queryParameters: {if (query?.isNotEmpty == true) 'q': query});
      return List<Map<String, dynamic>>.from(res.data['servers'] ?? []);
    } catch (_) { return []; }
  }

  Future<Map<String, dynamic>?> updateProfile({
    String? displayName,
    String? avatarUrl,
    String? bio,
    String? pronouns,
    bool? showPronouns,
    String? status,
  }) async {
    try {
      final res = await _dio.patch('/users/me', data: {
        if (displayName  != null) 'display_name':  displayName,
        if (avatarUrl    != null) 'avatar_url':    avatarUrl,
        if (bio           != null) 'bio':           bio,
        if (pronouns      != null) 'pronouns':      pronouns,
        if (showPronouns  != null) 'show_pronouns': showPronouns,
        if (status        != null) 'status':        status,
      });
      return res.data['user'] as Map<String, dynamic>;
    } catch (e) { _log('updateProfile', e); return null; }
  }

  // ── Settings ─────────────────────────────────────────────────────────

  Future<Map<String, dynamic>> getSettings() async {
    try {
      final res = await _dio.get('/users/me/settings');
      return res.data['settings'] as Map<String, dynamic>? ?? {};
    } catch (e) { _log('getSettings', e); return {}; }
  }

  // Sends the complete, already-merged settings object -- the server
  // stores it wholesale rather than attempting any merge of its own.
  Future<Map<String, dynamic>> putSettings(Map<String, dynamic> settings) async {
    try {
      final res = await _dio.patch('/users/me/settings', data: {'settings': settings});
      return res.data['settings'] as Map<String, dynamic>? ?? settings;
    } catch (e) { _log('putSettings', e); return settings; }
  }

  Future<List<Map<String, dynamic>>> getMembers(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/members');
      return List<Map<String, dynamic>>.from(res.data['members'] ?? []);
    } catch (e) { _log('getMembers', e); return []; }
  }

  Future<Map<String, dynamic>?> updateServer(
      String serverId, Map<String, dynamic> data) async {
    try {
      final res = await _dio.patch('/servers/$serverId', data: data);
      return res.data['server'] as Map<String, dynamic>;
    } catch (e) { _log('updateServer', e); return null; }
  }

  Future<bool> deleteServer(String serverId) async {
    try {
      await _dio.delete('/servers/$serverId');
      return true;
    } catch (e) { _log('deleteServer', e); return false; }
  }

  Future<Map<String, dynamic>?> updateChannel(
      String channelId, Map<String, dynamic> data) async {
    try {
      final res = await _dio.patch('/channels/$channelId', data: data);
      return res.data['channel'] as Map<String, dynamic>;
    } catch (e) { _log('updateChannel', e); return null; }
  }

  Future<bool> deleteChannel(String channelId) async {
    try {
      await _dio.delete('/channels/$channelId');
      return true;
    } catch (e) { _log('deleteChannel', e); return false; }
  }

  Future<bool> leaveServer(String serverId) async {
    try {
      await _dio.delete('/servers/$serverId/members');
      return true;
    } catch (e) { _log('leaveServer', e); return false; }
  }

  // ── Categories ───────────────────────────────────────────────────────

  Future<List<Map<String, dynamic>>> getCategories(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/categories');
      return List<Map<String, dynamic>>.from(res.data['categories'] ?? []);
    } catch (e) { _log('getCategories', e); return []; }
  }

  Future<Map<String, dynamic>?> createCategory(String serverId, String name) async {
    try {
      final res = await _dio.post('/servers/$serverId/categories', data: {'name': name});
      return res.data['category'] as Map<String, dynamic>;
    } catch (e) { _log('createCategory', e); return null; }
  }

  Future<Map<String, dynamic>?> updateCategory(String categoryId, String name) async {
    try {
      final res = await _dio.patch('/categories/$categoryId', data: {'name': name});
      return res.data['category'] as Map<String, dynamic>;
    } catch (e) { _log('updateCategory', e); return null; }
  }

  Future<bool> deleteCategory(String categoryId) async {
    try {
      await _dio.delete('/categories/$categoryId');
      return true;
    } catch (e) { _log('deleteCategory', e); return false; }
  }

  // ── Roles ────────────────────────────────────────────────────────────

  Future<List<Map<String, dynamic>>> getRoles(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/roles');
      return List<Map<String, dynamic>>.from(res.data['roles'] ?? []);
    } catch (e) { _log('getRoles', e); return []; }
  }

  Future<Map<String, dynamic>?> createRole(
      String serverId, Map<String, dynamic> data) async {
    try {
      final res = await _dio.post('/servers/$serverId/roles', data: data);
      return res.data['role'] as Map<String, dynamic>;
    } catch (e) { _log('createRole', e); return null; }
  }

  Future<Map<String, dynamic>?> updateRole(
      String roleId, Map<String, dynamic> data) async {
    try {
      final res = await _dio.patch('/roles/$roleId', data: data);
      return res.data['role'] as Map<String, dynamic>;
    } catch (e) { _log('updateRole', e); return null; }
  }

  Future<bool> deleteRole(String roleId) async {
    try {
      await _dio.delete('/roles/$roleId');
      return true;
    } catch (e) { _log('deleteRole', e); return false; }
  }

  Future<bool> assignRole(String memberId, String roleId) async {
    try {
      await _dio.post('/members/$memberId/roles/$roleId');
      return true;
    } catch (e) { _log('assignRole', e); return false; }
  }

  Future<bool> unassignRole(String memberId, String roleId) async {
    try {
      await _dio.delete('/members/$memberId/roles/$roleId');
      return true;
    } catch (e) { _log('unassignRole', e); return false; }
  }

  // -- Rules & self-assignable roles ------------------------------------------

  Future<Map<String, dynamic>?> getServerRules(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/rules');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getServerRules', e); return null; }
  }

  Future<bool> acceptRules(String serverId) async {
    try {
      await _dio.post('/servers/$serverId/rules/accept');
      return true;
    } catch (e) { _log('acceptRules', e); return false; }
  }

  Future<bool> updateRules(String serverId, String content) async {
    try {
      await _dio.put('/servers/$serverId/rules', data: {'content': content});
      return true;
    } catch (e) { _log('updateRules', e); return false; }
  }

  Future<List<Map<String, dynamic>>> getAssignableRoles(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/roles/assignable');
      return List<Map<String, dynamic>>.from(res.data['roles'] ?? []);
    } catch (e) { _log('getAssignableRoles', e); return []; }
  }

  Future<bool> assignRoleToSelf(String serverId, String roleId) async {
    try {
      await _dio.post('/servers/$serverId/roles/$roleId/assign');
      return true;
    } catch (e) { _log('assignRoleToSelf', e); return false; }
  }

  Future<bool> unassignRoleFromSelf(String serverId, String roleId) async {
    try {
      await _dio.delete('/servers/$serverId/roles/$roleId/assign');
      return true;
    } catch (e) { _log('unassignRoleFromSelf', e); return false; }
  }

  // ── Errors ───────────────────────────────────────────────────────────

  // -- Channel permissions ---------------------------------------------------

  Future<List<String>> getChannelAllowedRoles(String channelId) async {
    try {
      final res = await _dio.get('/channels/$channelId/roles');
      return List<String>.from(res.data['allowed_role_ids'] ?? []);
    } catch (e) { _log('getChannelAllowedRoles', e); return []; }
  }

  Future<bool> setChannelAllowedRoles(String channelId, List<String> roleIds) async {
    try {
      await _dio.put('/channels/$channelId/roles', data: {'role_ids': roleIds});
      return true;
    } catch (e) { _log('setChannelAllowedRoles', e); return false; }
  }

  // -- Category permissions --------------------------------------------------

  Future<List<String>> getCategoryAllowedRoles(String categoryId) async {
    try {
      final res = await _dio.get('/categories/$categoryId/roles');
      return List<String>.from(res.data['allowed_role_ids'] ?? []);
    } catch (e) { _log('getCategoryAllowedRoles', e); return []; }
  }

  Future<bool> setCategoryAllowedRoles(String categoryId, List<String> roleIds) async {
    try {
      await _dio.put('/categories/$categoryId/roles', data: {'role_ids': roleIds});
      return true;
    } catch (e) { _log('setCategoryAllowedRoles', e); return false; }
  }

  // -- Friends -----------------------------------------------------------------

  Future<List<Map<String, dynamic>>> getFriends() async {
    try {
      final res = await _dio.get('/friends');
      return List<Map<String, dynamic>>.from(res.data['friends'] ?? []);
    } catch (e) { _log('getFriends', e); return []; }
  }

  Future<Map<String, dynamic>?> getFriendRequests() async {
    try {
      final res = await _dio.get('/friends/pending');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getFriendRequests', e); return null; }
  }

  Future<bool> sendFriendRequest(String userId, {String? message}) async {
    try {
      await _dio.post('/friends/$userId/request',
          data: {'message': message});
      return true;
    } catch (e) { _log('sendFriendRequest', e); return false; }
  }

  Future<bool> acceptFriendRequest(String userId) async {
    try {
      await _dio.post('/friends/$userId/accept');
      return true;
    } catch (e) { _log('acceptFriendRequest', e); return false; }
  }

  Future<bool> declineFriendRequest(String userId) async {
    try {
      await _dio.delete('/friends/$userId/decline');
      return true;
    } catch (e) { _log('declineFriendRequest', e); return false; }
  }

  Future<bool> unfriend(String userId) async {
    try {
      await _dio.delete('/friends/$userId');
      return true;
    } catch (e) { _log('unfriend', e); return false; }
  }

  Future<Map<String, dynamic>?> getFriendStatus(String userId) async {
    try {
      final res = await _dio.get('/friends/status/$userId');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getFriendStatus', e); return null; }
  }

  Future<String?> getThroneWebhookUrl() async {
    try {
      final res = await _dio.get('/throne/webhook_url');
      return res.data['webhook_url'] as String?;
    } catch (e) { _log('getThroneWebhookUrl', e); return null; }
  }

  Future<String?> regenerateThroneWebhookUrl() async {
    try {
      final res = await _dio.post('/throne/webhook_url/regenerate');
      return res.data['webhook_url'] as String?;
    } catch (e) { _log('regenerateThroneWebhookUrl', e); return null; }
  }

  Future<bool> updateDmPrivacy(bool friendsOnly) async {
    try {
      await _dio.patch('/friends/privacy',
          data: {'friends_only_dms': friendsOnly});
      return true;
    } catch (e) { _log('updateDmPrivacy', e); return false; }
  }

  Future<List<Map<String, dynamic>>> getConversations() async {
    try {
      final res = await _dio.get('/dms/conversations');
      return List<Map<String, dynamic>>.from(res.data['conversations'] ?? []);
    } catch (e) { _log('getConversations', e); return []; }
  }

  Future<Map<String, dynamic>?> getOrCreateConversation(String userId) async {
    try {
      final res = await _dio.post('/dms/conversations', data: {'user_id': userId});
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getOrCreateConversation', e); return null; }
  }

  Future<Map<String, dynamic>?> getUserByUsername(String username) async {
    try {
      final res = await _dio.get('/users/search', queryParameters: {'username': username});
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getUserByUsername', e); return null; }
  }

  // -- Version check ------------------------------------------------------------
  
  Future<Map<String, dynamic>?> checkVersion() async {
    try {
      final res = await _dio.get('/version');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('checkVersion', e); return null; }
  }

  // -- Notifications ------------------------------------------------------------

  Future<Map<String, dynamic>?> getNotifications({bool unreadOnly = false}) async {
    try {
      final res = await _dio.get('/notifications',
          queryParameters: unreadOnly ? {'unread_only': true} : {});
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getNotifications', e); return null; }
  }

  Future<bool> markNotificationRead(String id) async {
    try {
      await _dio.post('/notifications/$id/read');
      return true;
    } catch (e) { _log('markNotificationRead', e); return false; }
  }

  Future<bool> markAllNotificationsRead() async {
    try {
      await _dio.post('/notifications/read_all');
      return true;
    } catch (e) { _log('markAllNotificationsRead', e); return false; }
  }

  // -- Mobile push device registration (see lib/core/push_notifications.dart) --

  /// [deviceId] ties this push token to a Koda.Devices row (see
  /// SecureStorage.getOrCreateDeviceId) so removing a device from the
  /// "Linked Devices" settings screen also stops push to it in the same
  /// action -- optional (server column is nullable) so this still works
  /// before that concept exists on a given call site.
  Future<bool> registerPushToken(String token, String platform, {String? deviceId}) async {
    try {
      await _dio.post('/push_tokens', data: {
        'token': token,
        'platform': platform,
        if (deviceId != null) 'device_id': deviceId,
      });
      return true;
    } catch (e) { _log('registerPushToken', e); return false; }
  }

  Future<bool> unregisterPushToken(String token) async {
    try {
      await _dio.delete('/push_tokens', data: {'token': token});
      return true;
    } catch (e) { _log('unregisterPushToken', e); return false; }
  }

  // -- Threads ------------------------------------------------------------------

  Future<Map<String, dynamic>?> createThread({
    required String channelId,
    required String messageId,
    required String name,
  }) async {
    try {
      final res = await _dio.post('/channels/$channelId/threads',
          data: {'message_id': messageId, 'name': name});
      return res.data['channel'] as Map<String, dynamic>;
    } catch (e) { _log('createThread', e); return null; }
  }

  // -- Reactions ----------------------------------------------------------------

  Future<List<Map<String, dynamic>>?> addReaction(String messageId, String emoji) async {
    try {
      final res = await _dio.post('/messages/$messageId/reactions',
          data: {'emoji': emoji});
      return List<Map<String, dynamic>>.from(res.data['reactions'] ?? []);
    } catch (e) { _log('addReaction', e); return null; }
  }

  Future<List<Map<String, dynamic>>?> removeReaction(String messageId, String emoji) async {
    try {
      final res = await _dio.delete('/messages/$messageId/reactions/$emoji');
      return List<Map<String, dynamic>>.from(res.data['reactions'] ?? []);
    } catch (e) { _log('removeReaction', e); return null; }
  }

  // -- Events / Calendar --------------------------------------------------------

  /// [from]/[to] scope the window recurring events are expanded within
  /// -- each occurrence of a "weekly"/"daily"/"monthly" event within
  /// that range comes back as its own entry (same event `id`, its own
  /// `start_at`/`end_at`), not just the series' original date. Omit
  /// both for the server's default (roughly a year centered on now).
  Future<List<Map<String, dynamic>>> getEvents(String channelId,
      {DateTime? from, DateTime? to}) async {
    try {
      final res = await _dio.get('/channels/$channelId/events', queryParameters: {
        if (from != null) 'from': from.toUtc().toIso8601String(),
        if (to != null) 'to': to.toUtc().toIso8601String(),
      });
      return List<Map<String, dynamic>>.from(res.data['events'] ?? []);
    } catch (e) { _log('getEvents', e); return []; }
  }

  Future<Map<String, dynamic>?> createEvent(String channelId, Map<String, dynamic> data) async {
    try {
      final res = await _dio.post('/channels/$channelId/events', data: data);
      return res.data['event'] as Map<String, dynamic>;
    } catch (e) { _log('createEvent', e); return null; }
  }

  /// Advances an event-creation walkthrough by one turn -- [messages] is
  /// the full conversation so far (`[{'role': 'user'|'assistant',
  /// 'content': '...'}, ...]`, growing with each call); this endpoint
  /// itself is stateless. Bundles the device's current local time +
  /// timezone offset automatically so Visp can resolve "next Friday"/
  /// "tomorrow" against the same "now" the user is actually looking at
  /// (see koda-server's Koda.Visp.Events for why this can't just be
  /// left to the model). [forcePlan] is the "skip and generate now"
  /// escape hatch. Returns `{'action': 'ask', 'question':, 'options':,
  /// 'question_number':, 'max_questions':}`, `{'action': 'plan', 'plan':
  /// {...}}`, or `{'error': '...'}` on failure.
  Future<Map<String, dynamic>?> planVispEvent({
    required String channelId,
    required List<Map<String, String>> messages,
    bool forcePlan = false,
  }) async {
    try {
      final now = DateTime.now();
      final res = await _dio.post('/channels/$channelId/visp/event_plan', data: {
        'messages': messages,
        'force_plan': forcePlan,
        'client_now': now.toIso8601String(),
        'client_tz_offset_minutes': now.timeZoneOffset.inMinutes,
      });
      return res.data as Map<String, dynamic>;
    } on DioException catch (e) {
      _log('planVispEvent', e);
      return {'error': _errorCodeOf(e) ?? 'Visp is unavailable right now.'};
    }
  }

  /// Applies a previously-previewed event [plan] (the exact map returned
  /// under `plan` by [planVispEvent]). Returns `{'ok': true, 'event_id': '...'}`
  /// on success or `{'error': '...'}` on failure.
  Future<Map<String, dynamic>?> applyVispEventPlan({required String channelId, required Map<String, dynamic> plan}) async {
    try {
      final res = await _dio.post('/channels/$channelId/visp/event_apply', data: {'plan': plan});
      return res.data as Map<String, dynamic>;
    } on DioException catch (e) {
      _log('applyVispEventPlan', e);
      return {'error': _errorCodeOf(e) ?? 'Could not apply that plan.'};
    }
  }

  Future<bool> updateEvent(String eventId, Map<String, dynamic> data) async {
    try {
      await _dio.patch('/events/$eventId', data: data);
      return true;
    } catch (e) { _log('updateEvent', e); return false; }
  }

  Future<bool> deleteEvent(String eventId) async {
    try {
      await _dio.delete('/events/$eventId');
      return true;
    } catch (e) { _log('deleteEvent', e); return false; }
  }

  Future<bool> subscribeToEvent(String eventId) async {
    try {
      await _dio.post('/events/$eventId/subscribe');
      return true;
    } catch (e) { _log('subscribeToEvent', e); return false; }
  }

  Future<bool> unsubscribeFromEvent(String eventId) async {
    try {
      await _dio.delete('/events/$eventId/subscribe');
      return true;
    } catch (e) { _log('unsubscribeFromEvent', e); return false; }
  }

  /// Buys (or claims, if free) a ticket for a calendar event linked to
  /// a stage channel. Returns the response map directly (rather than
  /// null-on-error) since callers need to branch on `free` vs
  /// `client_secret` either way; null just means the request failed.
  Future<Map<String, dynamic>?> purchaseEventTicket(String eventId) async {
    try {
      final res = await _dio.post('/events/$eventId/tickets');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('purchaseEventTicket', e); return null; }
  }

  // -- Marketplace --------------------------------------------------------------

  Future<Map<String, dynamic>?> getConnectAccount() async {
    try {
      final res = await _dio.get('/marketplace/connect');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getConnectAccount', e); return null; }
  }

  Future<Map<String, dynamic>?> createConnectAccount() async {
    try {
      final res = await _dio.post('/marketplace/connect');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('createConnectAccount', e); return null; }
  }

  Future<Map<String, dynamic>?> getOnboardingUrl() async {
    try {
      final res = await _dio.post('/marketplace/connect/onboarding-url');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getOnboardingUrl', e); return null; }
  }

  Future<Map<String, dynamic>?> syncConnectAccount() async {
    try {
      final res = await _dio.post('/marketplace/connect/sync');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('syncConnectAccount', e); return null; }
  }

  Future<Map<String, dynamic>?> getTipPreview(String toUserId, int amountCents) async {
    try {
      final res = await _dio.get('/marketplace/tip/preview',
          queryParameters: {'to_user_id': toUserId, 'amount_cents': amountCents});
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getTipPreview', e); return null; }
  }

  Future<Map<String, dynamic>?> createTip(String toUserId, int amountCents,
      String serverId, {String? message}) async {
    try {
      final res = await _dio.post('/marketplace/tips', data: {
        'to_user_id':   toUserId,
        'amount_cents': amountCents,
        'server_id':    serverId,
        if (message != null) 'message': message,
      });
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('createTip', e); return null; }
  }

  Future<Map<String, dynamic>?> getSubscriptionInfo() async {
    try {
      final res = await _dio.get('/marketplace/subscription');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getSubscriptionInfo', e); return null; }
  }

  Future<Map<String, dynamic>?> createSubscription(String tier,
      {String? serverId, String? giftedToUserId}) async {
    try {
      final res = await _dio.post('/marketplace/subscription', data: {
        'tier': tier,
        if (serverId != null) 'server_id': serverId,
        if (giftedToUserId != null) 'gifted_to_user_id': giftedToUserId,
      });
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('createSubscription', e); return null; }
  }

  Future<Map<String, dynamic>?> getServerBank(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/bank');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getServerBank', e); return null; }
  }

  /// Balance, lifetime total, and an all-time breakdown by source
  /// (tips/subscriptions/tickets/digital goods) -- gated server-side to
  /// manage_marketplace, unlike the plain balance every member can see.
  Future<Map<String, dynamic>?> getRevenueSummary(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/revenue/summary');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getRevenueSummary', e); return null; }
  }

  Future<Map<String, dynamic>?> getRevenueTimeseries(String serverId, {int days = 30}) async {
    try {
      final res = await _dio.get('/servers/$serverId/revenue/timeseries',
          queryParameters: {'days': days});
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getRevenueTimeseries', e); return null; }
  }

  Future<Map<String, dynamic>?> getRevenueTransactions(String serverId,
      {int limit = 50, DateTime? before}) async {
    try {
      final res = await _dio.get('/servers/$serverId/revenue/transactions',
          queryParameters: {
            'limit': limit,
            if (before != null) 'before': before.toUtc().toIso8601String(),
          });
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getRevenueTransactions', e); return null; }
  }

  /// Boost ROI advisor -- a read-only Visp narrative over this server's
  /// real revenue/boost/subscriber numbers (see koda-server's
  /// Koda.Visp.BoostAdvisor). [messages] is the full conversation so far,
  /// same shape/statelessness as [planWithVisp], but every turn here
  /// returns a narrative answer directly -- no 'action'/'plan' branching,
  /// and no companion "apply" call since there's nothing to create.
  /// Returns `{'headline':, 'narrative':, 'recommendations': [...],
  /// 'sources': [...]}` or `{'error': '...'}` on failure.
  Future<Map<String, dynamic>?> askVispBoostAdvice({
    required String serverId,
    required List<Map<String, String>> messages,
  }) async {
    try {
      final res = await _dio.post('/servers/$serverId/visp/boost_advice',
          data: {'messages': messages});
      return res.data as Map<String, dynamic>;
    } on DioException catch (e) {
      _log('askVispBoostAdvice', e);
      return {'error': _errorCodeOf(e) ?? 'Visp is unavailable right now.'};
    }
  }

  // -- Printful (per-server merch fulfillment) ---------------------------------

  /// Returns the URL to open in a browser to start connecting this
  /// server's Printful store -- the OAuth handshake itself happens
  /// server-side (see koda-server's PrintfulController.callback/2).
  Future<String?> connectPrintful(String serverId) async {
    try {
      final res = await _dio.post('/servers/$serverId/printful/connect');
      return res.data['authorize_url'] as String?;
    } catch (e) { _log('connectPrintful', e); return null; }
  }

  Future<bool> getPrintfulStatus(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/printful/status');
      return res.data['connected'] as bool? ?? false;
    } catch (e) { _log('getPrintfulStatus', e); return false; }
  }

  Future<bool> disconnectPrintful(String serverId) async {
    try {
      await _dio.delete('/servers/$serverId/printful');
      return true;
    } catch (e) { _log('disconnectPrintful', e); return false; }
  }

  /// Re-pulls the connected store's live catalog from Printful and
  /// returns it (creator-facing -- includes unpublished products).
  Future<List<Map<String, dynamic>>?> syncPrintfulCatalog(String serverId) async {
    try {
      final res = await _dio.post('/servers/$serverId/printful/sync');
      return List<Map<String, dynamic>>.from(res.data['products'] ?? []);
    } catch (e) { _log('syncPrintfulCatalog', e); return null; }
  }

  /// Every synced product regardless of publish state (creator-facing).
  Future<List<Map<String, dynamic>>> getPrintfulCatalog(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/printful/catalog');
      return List<Map<String, dynamic>>.from(res.data['products'] ?? []);
    } catch (e) { _log('getPrintfulCatalog', e); return []; }
  }

  /// Published products only, for the buyer-facing storefront.
  Future<List<Map<String, dynamic>>> getPrintfulMerch(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/printful/merch');
      return List<Map<String, dynamic>>.from(res.data['products'] ?? []);
    } catch (e) { _log('getPrintfulMerch', e); return []; }
  }

  Future<bool> setPrintfulProductPublished(
      String serverId, String productId, bool published) async {
    try {
      await _dio.patch('/servers/$serverId/printful/products/$productId/publish',
          data: {'published': published});
      return true;
    } catch (e) { _log('setPrintfulProductPublished', e); return false; }
  }

  /// Real shipping-rate options from Printful for a cart + address --
  /// no order is created yet. `items` is `[{'variant_id': ..., 'quantity': ...}]`.
  Future<List<Map<String, dynamic>>?> getPrintfulShippingRates(
      String serverId, List<Map<String, dynamic>> items, Map<String, dynamic> address) async {
    try {
      final res = await _dio.post('/servers/$serverId/printful/shipping-rates',
          data: {'items': items, 'address': address});
      return List<Map<String, dynamic>>.from(res.data['rates'] ?? []);
    } catch (e) { _log('getPrintfulShippingRates', e); return null; }
  }

  /// Places a real Printful draft order to get the authoritative total
  /// and opens a Stripe Checkout session for it. Returns
  /// {checkout_url, order_id} -- order_id is what launchCheckoutAndWait's
  /// `matches` predicate checks the confirmation notification against,
  /// same pattern as purchaseEventTicket/createTip.
  Future<Map<String, dynamic>?> createPrintfulOrder(String serverId,
      List<Map<String, dynamic>> items, Map<String, dynamic> address, String shippingOptionId) async {
    try {
      final res = await _dio.post('/servers/$serverId/printful/orders', data: {
        'items': items,
        'address': address,
        'shipping_option_id': shippingOptionId,
      });
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('createPrintfulOrder', e); return null; }
  }

  // -- Twitch (per-user account connection, EventSub live detection) -----------

  /// Returns the URL to open in a browser to start connecting your Twitch
  /// account -- the OAuth handshake itself happens server-side (see
  /// koda-server's TwitchController.callback/2). Per-user, not per-server
  /// -- your connected account follows you across every server you're in.
  Future<String?> connectTwitch() async {
    try {
      final res = await _dio.post('/users/me/twitch/connect');
      return res.data['authorize_url'] as String?;
    } catch (e) { _log('connectTwitch', e); return null; }
  }

  Future<Map<String, dynamic>?> getTwitchStatus() async {
    try {
      final res = await _dio.get('/users/me/twitch/status');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getTwitchStatus', e); return null; }
  }

  Future<bool> disconnectTwitch() async {
    try {
      await _dio.delete('/users/me/twitch');
      return true;
    } catch (e) { _log('disconnectTwitch', e); return false; }
  }

  /// Per-user opt-out -- lets someone stop their stream being announced
  /// without needing a role change from a server admin.
  Future<bool> setTwitchAnnounceEnabled(bool enabled) async {
    try {
      await _dio.patch('/users/me/twitch', data: {'announce_enabled': enabled});
      return true;
    } catch (e) { _log('setTwitchAnnounceEnabled', e); return false; }
  }

  // -- YouTube (per-user account connection, polled live + upload detection) --

  /// Returns the URL to open in a browser to start connecting your
  /// YouTube account -- the OAuth handshake itself happens server-side
  /// (see koda-server's YoutubeController.callback/2).
  Future<String?> connectYoutube() async {
    try {
      final res = await _dio.post('/users/me/youtube/connect');
      return res.data['authorize_url'] as String?;
    } catch (e) { _log('connectYoutube', e); return null; }
  }

  Future<Map<String, dynamic>?> getYoutubeStatus() async {
    try {
      final res = await _dio.get('/users/me/youtube/status');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getYoutubeStatus', e); return null; }
  }

  Future<bool> disconnectYoutube() async {
    try {
      await _dio.delete('/users/me/youtube');
      return true;
    } catch (e) { _log('disconnectYoutube', e); return false; }
  }

  /// Per-user opt-out -- covers both live-stream and new-upload
  /// announcements, same single toggle as Twitch's.
  Future<bool> setYoutubeAnnounceEnabled(bool enabled) async {
    try {
      await _dio.patch('/users/me/youtube', data: {'announce_enabled': enabled});
      return true;
    } catch (e) { _log('setYoutubeAnnounceEnabled', e); return false; }
  }

  // -- Tiltify (per-server charity campaign display) ---------------------------

  /// Returns the URL to open in a browser to start connecting this
  /// server's Tiltify campaign -- the OAuth handshake itself happens
  /// server-side (see koda-server's TiltifyController.callback/2).
  Future<String?> connectTiltify(String serverId) async {
    try {
      final res = await _dio.post('/servers/$serverId/tiltify/connect');
      return res.data['authorize_url'] as String?;
    } catch (e) { _log('connectTiltify', e); return null; }
  }

  /// Full owner-facing status -- connected flag plus the cached campaign
  /// snapshot (title/raised/goal/currency), same fields every member
  /// already gets for free via the server's own `tiltify` JSON key, but
  /// fetched fresh on demand for the management screen.
  Future<Map<String, dynamic>?> getTiltifyStatus(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/tiltify/status');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getTiltifyStatus', e); return null; }
  }

  /// Every campaign visible to the connected Tiltify account -- shown
  /// once, right after connect, so the owner can pick which one this
  /// server displays.
  Future<List<Map<String, dynamic>>?> getTiltifyCampaigns(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/tiltify/campaigns');
      return List<Map<String, dynamic>>.from(res.data['campaigns'] ?? []);
    } catch (e) { _log('getTiltifyCampaigns', e); return null; }
  }

  Future<bool> selectTiltifyCampaign(String serverId, String campaignId) async {
    try {
      await _dio.put('/servers/$serverId/tiltify/campaign',
          data: {'campaign_id': campaignId});
      return true;
    } catch (e) { _log('selectTiltifyCampaign', e); return false; }
  }

  Future<bool> disconnectTiltify(String serverId) async {
    try {
      await _dio.delete('/servers/$serverId/tiltify');
      return true;
    } catch (e) { _log('disconnectTiltify', e); return false; }
  }

  // -- Server boosting (Pulse subscriber perk) ---------------------------------

  Future<List<Map<String, dynamic>>> getMyBoostTokens() async {
    try {
      final res = await _dio.get('/boost_tokens');
      return List<Map<String, dynamic>>.from(res.data['tokens'] ?? []);
    } catch (e) { _log('getMyBoostTokens', e); return []; }
  }

  Future<Map<String, dynamic>?> getServerBoostStatus(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/boost_status');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getServerBoostStatus', e); return null; }
  }

  /// Redeems one of the caller's available boost tokens on [serverId].
  /// Returns the error code ("no_tokens_available", etc.) on failure so
  /// the UI can show a specific message, or null on success.
  Future<String?> boostServer(String serverId) async {
    try {
      await _dio.post('/servers/$serverId/boost');
      return null;
    } on DioException catch (e) {
      final err = e.response?.data is Map ? e.response?.data['error'] as String? : null;
      return err ?? 'Could not boost this server.';
    } catch (e) { _log('boostServer', e); return 'Could not boost this server.'; }
  }

  // -- Custom server emoji (boost-level-gated slots, see Koda.Emoji) -----------

  Future<List<Map<String, dynamic>>> getServerEmoji(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/emoji');
      return List<Map<String, dynamic>>.from(res.data['emoji'] ?? []);
    } catch (e) { _log('getServerEmoji', e); return []; }
  }

  /// Returns the error message ("Name must be 2-32 letters...", "out of
  /// custom emoji slots...") on failure so the UI can show it directly,
  /// or null on success.
  Future<String?> createServerEmoji(String serverId, String name, String imageUrl) async {
    try {
      await _dio.post('/servers/$serverId/emoji',
          data: {'name': name, 'image_url': imageUrl});
      return null;
    } on DioException catch (e) {
      final err = e.response?.data is Map ? e.response?.data['error'] as String? : null;
      return err ?? 'Could not add this emoji.';
    } catch (e) { _log('createServerEmoji', e); return 'Could not add this emoji.'; }
  }

  Future<bool> deleteServerEmoji(String serverId, String emojiId) async {
    try {
      await _dio.delete('/servers/$serverId/emoji/$emojiId');
      return true;
    } catch (e) { _log('deleteServerEmoji', e); return false; }
  }

  // -- Boost-level-gated server cosmetics (Koda.Servers.update_cosmetics/3) ----

  /// [backgroundUrl]/[iconBorderColor] are only sent if non-null, and
  /// the server silently drops whichever key the server's current boost
  /// level hasn't unlocked -- callers should still gate the UI on
  /// getServerBoostStatus's cosmetics_unlocked/icon_border_unlocked so
  /// there's no dead control to tap in the first place.
  Future<Map<String, dynamic>?> updateServerCosmetics(
    String serverId, {
    String? backgroundUrl,
    String? iconBorderColor,
  }) async {
    try {
      final res = await _dio.patch('/servers/$serverId/cosmetics', data: {
        if (backgroundUrl != null) 'background_url': backgroundUrl,
        if (iconBorderColor != null) 'icon_border_color': iconBorderColor,
      });
      return res.data['server'] as Map<String, dynamic>?;
    } catch (e) { _log('updateServerCosmetics', e); return null; }
  }

  // -- Server subscriptions ----------------------------------------------------

  Future<List<Map<String, dynamic>>> getServerSubscriptionTiers(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/subscription-tiers');
      return List<Map<String, dynamic>>.from(res.data['tiers'] ?? []);
    } catch (e) { _log('getServerSubscriptionTiers', e); return []; }
  }

  /// Returns the raw response ({'tier': {...}, 'owner_payable': bool}),
  /// not just the tier -- owner_payable tells the caller whether members
  /// can actually pay into this tier yet (the server owner needs Stripe
  /// Connect set up), so a UI can warn immediately instead of members
  /// hitting a checkout error later.
  Future<Map<String, dynamic>?> createServerSubscriptionTier(String serverId, Map<String, dynamic> data) async {
    try {
      final res = await _dio.post('/servers/$serverId/subscription-tiers', data: data);
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('createServerSubscriptionTier', e); return null; }
  }

  Future<bool> updateServerSubscriptionTier(String tierId, Map<String, dynamic> data) async {
    try {
      await _dio.patch('/subscription-tiers/$tierId', data: data);
      return true;
    } catch (e) { _log('updateServerSubscriptionTier', e); return false; }
  }

  Future<bool> deleteServerSubscriptionTier(String tierId) async {
    try {
      await _dio.delete('/subscription-tiers/$tierId');
      return true;
    } catch (e) { _log('deleteServerSubscriptionTier', e); return false; }
  }

  Future<Map<String, dynamic>?> getMyServerSubscription(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/my-subscription');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getMyServerSubscription', e); return null; }
  }

  Future<Map<String, dynamic>?> subscribeToServerTier(String tierId) async {
    try {
      final res = await _dio.post('/subscription-tiers/$tierId/subscribe');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('subscribeToServerTier', e); return null; }
  }

  // -- Digital products ---------------------------------------------------------

  Future<List<Map<String, dynamic>>> getProducts({String? serverId, String? creatorId}) async {
    try {
      final params = <String, dynamic>{};
      if (serverId != null) params['server_id'] = serverId;
      if (creatorId != null) params['creator_id'] = creatorId;
      final res = await _dio.get('/products', queryParameters: params);
      return List<Map<String, dynamic>>.from(res.data['products'] ?? []);
    } catch (e) { _log('getProducts', e); return []; }
  }

  Future<Map<String, dynamic>?> getProduct(String id) async {
    try {
      final res = await _dio.get('/products/$id');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('getProduct', e); return null; }
  }

  Future<Map<String, dynamic>?> createProduct(Map<String, dynamic> data) async {
    try {
      final res = await _dio.post('/products', data: data);
      return res.data['product'] as Map<String, dynamic>;
    } catch (e) { _log('createProduct', e); return null; }
  }

  Future<bool> updateProduct(String id, Map<String, dynamic> data) async {
    try {
      await _dio.patch('/products/$id', data: data);
      return true;
    } catch (e) { _log('updateProduct', e); return false; }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      await _dio.delete('/products/$id');
      return true;
    } catch (e) { _log('deleteProduct', e); return false; }
  }

  Future<bool> addLicenseKeys(String productId, String keys) async {
    try {
      await _dio.post('/products/$productId/license-keys', data: {'keys': keys});
      return true;
    } catch (e) { _log('addLicenseKeys', e); return false; }
  }

  Future<Map<String, dynamic>?> purchaseProduct(String productId) async {
    try {
      final res = await _dio.post('/products/$productId/purchase');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('purchaseProduct', e); return null; }
  }

  Future<List<Map<String, dynamic>>> getMyPurchases() async {
    try {
      final res = await _dio.get('/products/purchases');
      return List<Map<String, dynamic>>.from(res.data['purchases'] ?? []);
    } catch (e) { _log('getMyPurchases', e); return []; }
  }

  // -- Reordering --------------------------------------------------------------

  Future<bool> reorderChannels(String serverId, List<Map<String, dynamic>> order) async {
    try {
      await _dio.post('/servers/$serverId/channels/reorder', data: {'order': order});
      return true;
    } catch (e) { _log('reorderChannels', e); return false; }
  }

  Future<bool> reorderCategories(String serverId, List<Map<String, dynamic>> order) async {
    try {
      await _dio.post('/servers/$serverId/categories/reorder', data: {'order': order});
      return true;
    } catch (e) { _log('reorderCategories', e); return false; }
  }

  Future<List<Map<String, dynamic>>> getServerPresence(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/presence');
      return List<Map<String, dynamic>>.from(res.data['presence'] ?? []);
    } catch (e) { _log('getServerPresence', e); return []; }
  }

  // -- Parental controls --------------------------------------------------------
  // Structural visibility (friends/servers) + schedule management for a
  // parent's linked child account -- never message content. See
  // koda-server's Koda.Parental / ParentalController.

  Future<Map<String, dynamic>?> createChildAccount({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final res = await _dio.post('/parental/children', data: {
        'username': username, 'email': email, 'password': password,
        'password_confirmation': password,
      });
      return res.data['child'] as Map<String, dynamic>?;
    } catch (e) { _log('createChildAccount', e); return null; }
  }

  Future<List<Map<String, dynamic>>> listChildren() async {
    try {
      final res = await _dio.get('/parental/children');
      return List<Map<String, dynamic>>.from(res.data['children'] ?? []);
    } catch (e) { _log('listChildren', e); return []; }
  }

  Future<List<Map<String, dynamic>>> childFriends(String childId) async {
    try {
      final res = await _dio.get('/parental/children/$childId/friends');
      return List<Map<String, dynamic>>.from(res.data['friends'] ?? []);
    } catch (e) { _log('childFriends', e); return []; }
  }

  Future<bool> removeChildFriend(String childId, String friendId) async {
    try {
      await _dio.delete('/parental/children/$childId/friends/$friendId');
      return true;
    } catch (e) { _log('removeChildFriend', e); return false; }
  }

  Future<List<Map<String, dynamic>>> childServers(String childId) async {
    try {
      final res = await _dio.get('/parental/children/$childId/servers');
      return List<Map<String, dynamic>>.from(res.data['servers'] ?? []);
    } catch (e) { _log('childServers', e); return []; }
  }

  Future<bool> removeChildFromServer(String childId, String serverId) async {
    try {
      await _dio.delete('/parental/children/$childId/servers/$serverId');
      return true;
    } catch (e) { _log('removeChildFromServer', e); return false; }
  }

  Future<Map<String, dynamic>?> getChildSchedule(String childId) async {
    try {
      final res = await _dio.get('/parental/children/$childId/schedule');
      return res.data['schedule'] as Map<String, dynamic>?;
    } catch (e) { _log('getChildSchedule', e); return null; }
  }

  Future<Map<String, dynamic>?> putChildSchedule(
    String childId, {
    required String timezone,
    required Map<String, dynamic> windows,
  }) async {
    try {
      final res = await _dio.put('/parental/children/$childId/schedule',
          data: {'timezone': timezone, 'windows': windows});
      return res.data['schedule'] as Map<String, dynamic>?;
    } catch (e) { _log('putChildSchedule', e); return null; }
  }

  /// Removes the schedule restriction entirely -- distinct from saving
  /// empty windows, which the server treats as "always blocked" since
  /// the row would still exist. This is how a parent goes back to
  /// unrestricted access.
  Future<bool> deleteChildSchedule(String childId) async {
    try {
      await _dio.delete('/parental/children/$childId/schedule');
      return true;
    } catch (e) { _log('deleteChildSchedule', e); return false; }
  }

  /// Grants a temporary override. Pass exactly one of [durationMinutes]
  /// or [expiresAt].
  Future<Map<String, dynamic>?> createOverride(
    String childId, {
    int? durationMinutes,
    DateTime? expiresAt,
    String? reason,
  }) async {
    try {
      final res = await _dio.post('/parental/children/$childId/override', data: {
        if (durationMinutes != null) 'duration_minutes': durationMinutes,
        if (expiresAt != null) 'expires_at': expiresAt.toUtc().toIso8601String(),
        if (reason != null) 'reason': reason,
      });
      return res.data['override'] as Map<String, dynamic>?;
    } catch (e) { _log('createOverride', e); return null; }
  }

  Future<bool> deleteOverride(String childId) async {
    try {
      await _dio.delete('/parental/children/$childId/override');
      return true;
    } catch (e) { _log('deleteOverride', e); return false; }
  }

  void _log(String method, Object e) {
    if (kDebugMode) debugPrint('[KodaApi] $method failed: $e');
  }
  // -- Discord import ---------------------------------------------------------

  Future<Map<String, dynamic>?> previewDiscordTemplate(String code) async {
    try {
      final res = await _dio.post('/import/discord/preview', data: {'code': code});
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('previewDiscordTemplate', e); return null; }
  }

  Future<bool> applyDiscordTemplate({
    required String serverId,
    required String code,
    bool replace = false,
  }) async {
    try {
      await _dio.post('/servers/$serverId/import/discord',
          data: {'code': code, 'replace': replace});
      return true;
    } catch (e) { _log('applyDiscordTemplate', e); return false; }
  }

  // -- Visp (natural-language server setup, self-hosted -- see koda-server's
  // Koda.Visp / VispController) ------------------------------------------------

  /// Advances a server-setup walkthrough by one turn -- [messages] is
  /// the full conversation so far (`[{'role': 'user'|'assistant',
  /// 'content': '...'}, ...]`, growing with each call); this endpoint
  /// itself is stateless. [serverId] absent means "propose a brand-new
  /// server"; present means "propose additions to that existing
  /// server". [forcePlan] is the "skip and generate now" escape hatch.
  /// Returns `{'action': 'ask', 'question':, 'options':,
  /// 'question_number':, 'max_questions':}`, `{'action': 'plan', 'plan':
  /// {...}}`, or `{'error': '...'}` on failure so the dialog can show a
  /// specific message (rate-limited, malformed plan, etc.).
  Future<Map<String, dynamic>?> planWithVisp({
    String? serverId,
    required List<Map<String, String>> messages,
    bool forcePlan = false,
  }) async {
    try {
      final res = await _dio.post('/visp/plan', data: {
        'messages': messages,
        'force_plan': forcePlan,
        if (serverId != null) 'server_id': serverId,
      });
      return res.data as Map<String, dynamic>;
    } on DioException catch (e) {
      _log('planWithVisp', e);
      return {'error': _errorCodeOf(e) ?? 'Visp is unavailable right now.'};
    }
  }

  /// Applies a previously-previewed [plan] (the exact map returned under
  /// `plan` by [planWithVisp]). Returns `{'ok': true, 'server_id': '...'}`
  /// on success or `{'error': '...'}` on failure.
  Future<Map<String, dynamic>?> applyVispPlan({String? serverId, required Map<String, dynamic> plan}) async {
    try {
      final res = await _dio.post('/visp/apply', data: {
        'plan': plan,
        if (serverId != null) 'server_id': serverId,
      });
      return res.data as Map<String, dynamic>;
    } on DioException catch (e) {
      _log('applyVispPlan', e);
      return {'error': _errorCodeOf(e) ?? 'Could not apply that plan.'};
    }
  }

  // -- Wiki (Visp's retrieval-grounding corpus + koda.fyi doc source --
  // see koda-server's Koda.Wiki / WikiController) -- admin-only. -------------

  Future<List<Map<String, dynamic>>> listWikiArticles() async {
    try {
      final res = await _dio.get('/admin/wiki');
      return List<Map<String, dynamic>>.from(res.data['articles'] ?? []);
    } catch (e) { _log('listWikiArticles', e); return []; }
  }

  Future<Map<String, dynamic>?> createWikiArticle({
    required String title,
    required String content,
    required String category,
    String? slug,
  }) async {
    try {
      final res = await _dio.post('/admin/wiki', data: {
        'title': title,
        'content': content,
        'category': category,
        if (slug != null) 'slug': slug,
      });
      return res.data['article'] as Map<String, dynamic>;
    } catch (e) { _log('createWikiArticle', e); return null; }
  }

  Future<Map<String, dynamic>?> updateWikiArticle(
      String id, Map<String, dynamic> data) async {
    try {
      final res = await _dio.patch('/admin/wiki/$id', data: data);
      return res.data['article'] as Map<String, dynamic>;
    } catch (e) { _log('updateWikiArticle', e); return null; }
  }

  Future<bool> deleteWikiArticle(String id) async {
    try {
      await _dio.delete('/admin/wiki/$id');
      return true;
    } catch (e) { _log('deleteWikiArticle', e); return false; }
  }

}







