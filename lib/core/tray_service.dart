// lib/core/tray_service.dart
//
// Persistent system tray icon + close-to-tray behavior (Windows/macOS/
// Linux only, see platform.dart's isDesktop -- mobile has no window or
// tray concept at all). Left-click restores the window; right-click
// shows Open/Quit. Closing the window (the X button) hides to tray
// instead of quitting by default -- matches Discord/Slack/Teams
// convention -- but that's a real preference stored locally (not
// synced through the account settings blob: this is a per-installation
// window-chrome choice, not something that belongs on other devices),
// toggleable in Settings > Desktop.

import 'dart:io' show Platform;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'platform.dart';

const _closeToTrayKey = 'koda_close_to_tray';

class TrayService with TrayListener, WindowListener {
  TrayService._();
  static final TrayService instance = TrayService._();

  bool _initialized = false;

  /// Defaults to true (close-to-tray) -- see this file's header for why
  /// that's the chosen default, and Settings > Desktop for the toggle.
  Future<bool> getCloseToTrayEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_closeToTrayKey) ?? true;
  }

  /// Also immediately re-arms/disarms window_manager's own close
  /// interception, so flipping this in Settings takes effect without
  /// needing a restart.
  Future<void> setCloseToTrayEnabled(bool value) async {
    if (!isDesktop) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_closeToTrayKey, value);
    await windowManager.setPreventClose(value);
  }

  /// Call once at startup (see main.dart) -- a no-op on mobile, and
  /// never allowed to throw past this: a broken tray icon (unsupported
  /// platform quirk, a missing asset) must never block the app from
  /// starting, same reasoning as push_notifications.dart's init().
  Future<void> init() async {
    if (!isDesktop || _initialized) return;
    _initialized = true;

    trayManager.addListener(this);
    windowManager.addListener(this);

    try {
      final iconPath =
          Platform.isWindows ? 'assets/tray/tray_icon.ico' : 'assets/tray/tray_icon.png';
      await trayManager.setIcon(iconPath);
      await trayManager.setToolTip('Koda');
      await trayManager.setContextMenu(Menu(items: [
        MenuItem(key: 'show', label: 'Open Koda', onClick: (_) => _showWindow()),
        MenuItem.separator(),
        MenuItem(key: 'quit', label: 'Quit Koda', onClick: (_) => _quit()),
      ]));
    } catch (_) {}

    await windowManager.setPreventClose(await getCloseToTrayEnabled());
  }

  Future<void> _showWindow() async {
    await windowManager.show();
    await windowManager.focus();
  }

  Future<void> _quit() async {
    // Disarm interception first -- otherwise this deliberate quit would
    // just hide the window again via onWindowClose below.
    await windowManager.setPreventClose(false);
    await windowManager.close();
  }

  @override
  void onTrayIconMouseDown() => _showWindow();

  @override
  void onTrayIconRightMouseDown() => trayManager.popUpContextMenu();

  @override
  void onWindowClose() async {
    if (await windowManager.isPreventClose()) {
      await windowManager.hide();
    }
  }
}
