// lib/core/socket.dart
//
// Singleton WebSocket service wrapping phoenix_socket.
// One persistent connection per session, established after login.
// Auto-reconnects if the socket drops while the app is running.

import 'package:flutter/foundation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'config.dart';

class KodaSocket {
  KodaSocket._();
  static final KodaSocket instance = KodaSocket._();

  PhoenixSocket? _socket;
  String? _token;
  final Map<String, PhoenixChannel> _channels = {};

  bool get isConnected => _socket?.isConnected == true;

  Future<void> connect(String token) async {
    _token = token;
    if (_socket?.isConnected == true) return;
    await _doConnect(token);
  }

  Future<void> _doConnect(String token) async {
    _socket?.close();
    _socket = PhoenixSocket(
      '${KodaConfig.wsBaseUrl}/websocket',
      socketOptions: PhoenixSocketOptions(
        params: {'token': token},
      ),
    );

    _socket!.openStream.listen((_) {
      debugPrint('[KodaSocket] Connected');
    });

    _socket!.closeStream.listen((_) {
      debugPrint('[KodaSocket] Disconnected');
      _channels.clear();
    });

    _socket!.errorStream.listen((e) {
      debugPrint('[KodaSocket] Error: $e');
    });

    await _socket!.connect();
  }

  /// Async version -- auto-reconnects if socket dropped, never throws.
  Future<PhoenixChannel?> channelAsync(String topic) async {
    if (_channels.containsKey(topic)) return _channels[topic];

    if (_socket?.isConnected != true) {
      if (_token == null) {
        debugPrint('[KodaSocket] No token stored, cannot reconnect');
        return null;
      }
      debugPrint('[KodaSocket] Reconnecting...');
      await _doConnect(_token!);
    }

    final ch = _socket!.addChannel(topic: topic);
    ch.join();
    _channels[topic] = ch;
    debugPrint('[KodaSocket] Joined $topic');
    return ch;
  }

  /// Synchronous version -- returns null if not connected instead of throwing.
  PhoenixChannel? channel(String topic) {
    if (_channels.containsKey(topic)) return _channels[topic];
    if (_socket?.isConnected != true) return null;
    final ch = _socket!.addChannel(topic: topic);
    ch.join();
    _channels[topic] = ch;
    return ch;
  }

  void push(String topic, String event, Map<String, dynamic> payload) {
    final ch = _channels[topic];
    if (ch != null) {
      ch.push(event, payload);
    }
  }

  void leave(String topic) {
    final ch = _channels.remove(topic);
    if (ch != null) {
      ch.leave();
      debugPrint('[KodaSocket] Left $topic');
    }
  }

  void disconnect() {
    for (final ch in _channels.values) {
      ch.leave();
    }
    _channels.clear();
    _socket?.close();
    _socket = null;
    _token = null;
    debugPrint('[KodaSocket] Disconnected and cleared');
  }
}
