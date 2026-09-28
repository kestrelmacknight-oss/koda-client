// lib/core/language_options.dart
//
// The 24-language list this app supports for UI localization (see
// lib/l10n/) and for a server's primary_language setting -- one
// shared list so both pickers always agree, rather than maintaining
// the set twice. ISO 639-1 codes; names are each language's own
// native name (self-endonym), since that's what a speaker of that
// language actually looks for in a picker.

class KodaLanguageOption {
  final String code;
  final String nativeName;
  const KodaLanguageOption(this.code, this.nativeName);
}

const List<KodaLanguageOption> kodaLanguageOptions = [
  KodaLanguageOption('en', 'English'),
  KodaLanguageOption('es', 'Español'),
  KodaLanguageOption('fr', 'Français'),
  KodaLanguageOption('de', 'Deutsch'),
  KodaLanguageOption('pt', 'Português'),
  KodaLanguageOption('it', 'Italiano'),
  KodaLanguageOption('ja', '日本語'),
  KodaLanguageOption('ko', '한국어'),
  KodaLanguageOption('zh', '简体中文'),
  KodaLanguageOption('zh_Hant', '繁體中文'),
  KodaLanguageOption('ru', 'Русский'),
  KodaLanguageOption('ar', 'العربية'),
  KodaLanguageOption('hi', 'हिन्दी'),
  KodaLanguageOption('tr', 'Türkçe'),
  KodaLanguageOption('pl', 'Polski'),
  KodaLanguageOption('nl', 'Nederlands'),
  KodaLanguageOption('vi', 'Tiếng Việt'),
  KodaLanguageOption('th', 'ไทย'),
  KodaLanguageOption('id', 'Bahasa Indonesia'),
  KodaLanguageOption('uk', 'Українська'),
  KodaLanguageOption('sv', 'Svenska'),
  KodaLanguageOption('el', 'Ελληνικά'),
  KodaLanguageOption('cs', 'Čeština'),
  KodaLanguageOption('he', 'עברית'),
];

String kodaLanguageName(String code) =>
    kodaLanguageOptions
        .firstWhere((l) => l.code == code, orElse: () => const KodaLanguageOption('en', 'English'))
        .nativeName;
