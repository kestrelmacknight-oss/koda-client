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
  const KodaApiResult({this.data, this.statusCode, this.errorCode});
  bool get ok => data != null;
  bool get isOutsideAllowedHours => errorCode == 'outside_allowed_hours';
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

  Future<Map<String, dynamic>?> sendMessage(
      String channelId, String content, {
        bool encrypted = false,
        String? replyToId,
        String? attachmentUrl,
        String? attachmentContentType,
      }) async {
    try {
      final res = await _dio.post('/channels/$channelId/messages',
          data: {
            'content': content,
            'encrypted': encrypted,
            if (replyToId != null) 'reply_to_id': replyToId,
            if (attachmentUrl != null) 'attachment_url': attachmentUrl,
            if (attachmentContentType != null) 'attachment_content_type': attachmentContentType,
          });
      return res.data['message'] as Map<String, dynamic>;
    } catch (e) { _log('sendMessage', e); return null; }
  }

  Future<Map<String, dynamic>?> editMessage(
      String channelId, String messageId, String content) async {
    try {
      final res = await _dio.patch('/channels/$channelId/messages/$messageId',
          data: {'content': content});
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

  Future<Map<String, dynamic>?> fetchKeyBundle(String userId) async {
    try {
      final res = await _dio.get('/keys/bundle/$userId');
      return res.data['bundle'] as Map<String, dynamic>?;
    } catch (e) { _log('fetchKeyBundle', e); return null; }
  }

  // ── Stage channels ────────────────────────────────────────────────────────

  Future<Map<String, dynamic>?> joinStage(String channelId) async {
    try {
      final res = await _dio.post('/channels/$channelId/stage/join');
      return res.data as Map<String, dynamic>;
    } catch (e) { _log('joinStage', e); return null; }
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

  Future<List<Map<String, dynamic>>> getDmMessages(String conversationId) async {
    try {
      final res = await _dio.get('/dms/$conversationId/messages');
      return List<Map<String, dynamic>>.from(res.data['messages'] ?? []);
    } catch (e) { _log('getDmMessages', e); return []; }
  }

  Future<Map<String, dynamic>?> sendDmMessage(
      String conversationId, String content, {
        bool encrypted = false,
        String? ratchetKey,
        int? msgNumber,
        int? prevChain,
        String? nonce,
        Map<String, dynamic>? x3dhHeader,
      }) async {
    try {
      final res = await _dio.post('/dms/$conversationId/messages', data: {
        'content': content,
        'encrypted': encrypted,
        if (ratchetKey != null) 'ratchet_key': ratchetKey,
        if (msgNumber != null) 'msg_number': msgNumber,
        if (prevChain != null) 'prev_chain': prevChain,
        if (nonce != null) 'nonce': nonce,
        if (x3dhHeader != null) 'x3dh_header': x3dhHeader,
      });
      return res.data['message'] as Map<String, dynamic>;
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
    String? status,
  }) async {
    try {
      final res = await _dio.patch('/users/me', data: {
        if (displayName != null) 'display_name': displayName,
        if (avatarUrl   != null) 'avatar_url':   avatarUrl,
        if (bio         != null) 'bio':          bio,
        if (status      != null) 'status':       status,
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

  Future<List<Map<String, dynamic>>> getEvents(String channelId) async {
    try {
      final res = await _dio.get('/channels/$channelId/events');
      return List<Map<String, dynamic>>.from(res.data['events'] ?? []);
    } catch (e) { _log('getEvents', e); return []; }
  }

  Future<Map<String, dynamic>?> createEvent(String channelId, Map<String, dynamic> data) async {
    try {
      final res = await _dio.post('/channels/$channelId/events', data: data);
      return res.data['event'] as Map<String, dynamic>;
    } catch (e) { _log('createEvent', e); return null; }
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

  // -- Server subscriptions ----------------------------------------------------

  Future<List<Map<String, dynamic>>> getServerSubscriptionTiers(String serverId) async {
    try {
      final res = await _dio.get('/servers/$serverId/subscription-tiers');
      return List<Map<String, dynamic>>.from(res.data['tiers'] ?? []);
    } catch (e) { _log('getServerSubscriptionTiers', e); return []; }
  }

  Future<Map<String, dynamic>?> createServerSubscriptionTier(String serverId, Map<String, dynamic> data) async {
    try {
      final res = await _dio.post('/servers/$serverId/subscription-tiers', data: data);
      return res.data['tier'] as Map<String, dynamic>;
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

}







