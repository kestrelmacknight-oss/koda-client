// lib/core/platform.dart
//
// desktop_multi_window and window_manager only ship platform
// implementations for Windows/macOS/Linux -- calling either on
// Android/iOS throws MissingPluginException, so any code path that uses
// them (or other desktop-only affordances like screen-source picking)
// must be gated behind this check.

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

bool get isDesktop =>
    !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
