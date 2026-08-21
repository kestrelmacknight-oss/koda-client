// lib/core/api.dart
//
// Koda API client -- production build targeting api.koda.fyi exclusively.
// No demo fallbacks: this is a live Alpha client. Failures surface as
// empty results or null so the UI can show a real connection error
// rather than fabricated content.

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'config.dart';
import 'storage.dart';

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

  void setToken(String token) {
    _token = token;
    KodaStorage.saveToken(token);
  }

  Future<void> loadStoredToken() async {
    _token = await KodaStorage.loadToken();
  }

  bool get hasToken => _token != null;

  // ── Auth ─────────────────────────────────────────────────────────────

  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      final res = await _dio.post('/auth/login',
          data: {'email': email, 'password': password});
      return res.data as Map<String, dynamic>;
    } on DioException catch (e) {
      _log('login', e);
      return null;
    }
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

  Future<Map<String, dynamic>?> me() async {
    try {
      final res = await _dio.get('/auth/me');
      return res.data as Map<String, dynamic>;
    } catch (_) { return null; }
  }

  Future<bool> verifyEmail(String code) async {
    try {
      await _dio.post('/auth/verify_email', data: {'code': code});
      return true;
    } catch (_) { return false; }
  }

  Future<bool> resendVerification() async {
    try {
      await _dio.post('/auth/verify_email/resend');
      return true;
    } catch (_) { return false; }
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
  }) async {
    try {
      final res = await _dio.post('/servers/$serverId/channels', data: {
        'name': name,
        'type': type,
        if (categoryId != null) 'category_id': categoryId,
      });
      return res.data['channel'] as Map<String, dynamic>;
    } catch (e) { _log('createChannel', e); return null; }
  }

  // ── Messages ─────────────────────────────────────────────────────────

  Future<List<Map<String, dynamic>>> getMessages(String channelId) async {
    try {
      final res = await _dio.get('/channels/$channelId/messages');
      return List<Map<String, dynamic>>.from(res.data['messages'] ?? []);
    } catch (e) { _log('getMessages', e); return []; }
  }

  Future<Map<String, dynamic>?> sendMessage(
      String channelId, String content, {bool encrypted = false}) async {
    try {
      final res = await _dio.post('/channels/$channelId/messages',
          data: {'content': content, 'encrypted': encrypted});
      return res.data['message'] as Map<String, dynamic>;
    } catch (e) { _log('sendMessage', e); return null; }
  }

  // ── Voice ────────────────────────────────────────────────────────────

  Future<Map<String, dynamic>?> getVoiceToken(String channelId) async {
    try {
      final res = await _dio.get('/channels/$channelId/voice/token');
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
  }) async {
    try {
      final bytes = await file.readAsBytes();
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
    } catch (e) { _log('uploadFile', e); return null; }
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
      String conversationId, String content) async {
    try {
      final res = await _dio.post('/dms/$conversationId/messages',
          data: {'content': content});
      return res.data['message'] as Map<String, dynamic>;
    } catch (e) { _log('sendDmMessage', e); return null; }
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

  // ── Errors ───────────────────────────────────────────────────────────

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




