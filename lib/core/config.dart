// lib/core/config.dart
//
// Production configuration for Koda Alpha v0.34.
// Every URL and email address Koda needs lives here, and only here.
// Nothing from Fly.io belongs in this file or anywhere in this app —
// secrets (database URLs, Guardian keys, LiveKit keys) live exclusively
// in Phoenix's server-side environment variables. The client only ever
// needs to know these public addresses.

class KodaConfig {
  KodaConfig._();

  // ── API endpoints ──────────────────────────────────────────────────────
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.koda.fyi/api/v1',
  );

  static const String wsBaseUrl = String.fromEnvironment(
    'WS_BASE_URL',
    defaultValue: 'wss://api.koda.fyi/socket',
  );

  static const String voicePublicUrl = String.fromEnvironment(
    'VOICE_PUBLIC_URL',
    defaultValue: 'wss://voice.koda.fyi',
  );

  // ── App identity ───────────────────────────────────────────────────────
  static const String appName     = 'Koda';
  static const String appVersion  = '0.34.0';
  static const String buildLabel  = 'Alpha';
  static const String fullVersion = '$appName $buildLabel v$appVersion';
  static const String company     = 'GryphonHeart LLC';

  // ── Domain ─────────────────────────────────────────────────────────────
  static const String domain    = 'koda.fyi';
  static const String appUrl    = 'https://koda.fyi';
  static const String termsUrl  = 'https://koda.fyi/terms.html';
  static const String privacyUrl = 'https://koda.fyi/privacy.html';

  // ── Email addresses ────────────────────────────────────────────────────
  static const String supportEmail  = 'support@koda.fyi';
  static const String legalEmail    = 'legal@koda.fyi';
  static const String privacyEmail  = 'privacy@koda.fyi';
  static const String securityEmail = 'security@koda.fyi';
  static const String dmcaEmail     = 'dmca@koda.fyi';

  // ── Timeouts ───────────────────────────────────────────────────────────
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout    = Duration(seconds: 15);

  // ── Feature flags ──────────────────────────────────────────────────────
  // E2EE wiring point: a future build links the koda_protocol Rust crate
  // here and flips this to true once message encrypt/decrypt is hooked up.
  // This Alpha build sends message content as plain text over TLS.
  static const bool enableE2EE = false;

  // ── Local storage keys ─────────────────────────────────────────────────
  static const String tokenStorageKey = 'koda_auth_token';
}
