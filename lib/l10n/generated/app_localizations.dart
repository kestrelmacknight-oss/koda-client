import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('cs'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('he'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('sv'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')
  ];

  /// The app's name, shown as the window/tab title.
  ///
  /// In en, this message translates to:
  /// **'Koda'**
  String get appTitle;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get commonEdit;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// No description provided for @commonCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get commonCreate;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @commonDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get commonDone;

  /// No description provided for @commonDownload.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get commonDownload;

  /// No description provided for @commonDisconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get commonDisconnect;

  /// No description provided for @commonNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get commonNone;

  /// No description provided for @commonJoin.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get commonJoin;

  /// No description provided for @commonDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get commonDismiss;

  /// No description provided for @commonSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get commonSubmit;

  /// No description provided for @commonConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get commonConfirm;

  /// No description provided for @commonRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get commonRemove;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @commonOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// No description provided for @commonYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get commonYes;

  /// No description provided for @commonNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get commonNo;

  /// No description provided for @commonSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get commonSearch;

  /// No description provided for @commonSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get commonSettings;

  /// No description provided for @commonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get commonLoading;

  /// Settings nav entry for the language picker.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguageSection;

  /// Card title in Settings > Language.
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get settingsLanguageTitle;

  /// Option to follow the OS locale instead of picking one explicitly.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get settingsLanguageSystemDefault;

  /// Explains what this setting does and does not affect.
  ///
  /// In en, this message translates to:
  /// **'Choose the language Koda\'s own interface displays in. This is separate from any server\'s primary language, or the language you type messages in.'**
  String get settingsLanguageDescription;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get settingsSignOut;

  /// No description provided for @settingsSectionMyAccount.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get settingsSectionMyAccount;

  /// No description provided for @settingsSectionSecurity.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get settingsSectionSecurity;

  /// No description provided for @settingsSectionAccessibility.
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get settingsSectionAccessibility;

  /// No description provided for @settingsSectionBilling.
  ///
  /// In en, this message translates to:
  /// **'Billing'**
  String get settingsSectionBilling;

  /// No description provided for @settingsSectionFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get settingsSectionFamily;

  /// No description provided for @settingsSectionVoiceVideo.
  ///
  /// In en, this message translates to:
  /// **'Voice & Video'**
  String get settingsSectionVoiceVideo;

  /// No description provided for @settingsSectionDesktop.
  ///
  /// In en, this message translates to:
  /// **'Desktop'**
  String get settingsSectionDesktop;

  /// No description provided for @settingsSectionAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsSectionAbout;

  /// No description provided for @settingsTwoFactorTitle.
  ///
  /// In en, this message translates to:
  /// **'Two-Factor Authentication'**
  String get settingsTwoFactorTitle;

  /// No description provided for @settingsTwoFactorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add an authenticator app for extra security'**
  String get settingsTwoFactorSubtitle;

  /// No description provided for @settingsLinkedDevicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Linked Devices'**
  String get settingsLinkedDevicesTitle;

  /// No description provided for @settingsLinkedDevicesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'See and remove devices signed into this account'**
  String get settingsLinkedDevicesSubtitle;

  /// No description provided for @settingsContentFiltersTitle.
  ///
  /// In en, this message translates to:
  /// **'Content Filters'**
  String get settingsContentFiltersTitle;

  /// No description provided for @settingsContentFiltersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose how you want labeled content to appear'**
  String get settingsContentFiltersSubtitle;

  /// No description provided for @settingsDmFriendsOnlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Only allow DMs from friends'**
  String get settingsDmFriendsOnlyTitle;

  /// No description provided for @settingsDmFriendsOnlySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Non-friends cannot start a new conversation with you'**
  String get settingsDmFriendsOnlySubtitle;

  /// No description provided for @settingsDmPrivacyError.
  ///
  /// In en, this message translates to:
  /// **'Could not update DM privacy.'**
  String get settingsDmPrivacyError;

  /// No description provided for @settingsShowVispAvatarTitle.
  ///
  /// In en, this message translates to:
  /// **'Show Visp\'s avatar'**
  String get settingsShowVispAvatarTitle;

  /// No description provided for @settingsShowVispAvatarSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shows Visp\'s face and mood in its setup/event/advisor dialogs'**
  String get settingsShowVispAvatarSubtitle;

  /// No description provided for @settingsHighContrastTitle.
  ///
  /// In en, this message translates to:
  /// **'High Contrast'**
  String get settingsHighContrastTitle;

  /// No description provided for @settingsHighContrastSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pure black/white, high-contrast colors app-wide -- switching briefly reloads the current screen.'**
  String get settingsHighContrastSubtitle;

  /// No description provided for @settingsDyslexiaFontTitle.
  ///
  /// In en, this message translates to:
  /// **'Dyslexia-friendly font'**
  String get settingsDyslexiaFontTitle;

  /// No description provided for @settingsDyslexiaFontSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Switches body text to OpenDyslexic app-wide'**
  String get settingsDyslexiaFontSubtitle;

  /// No description provided for @settingsFontSizeTitle.
  ///
  /// In en, this message translates to:
  /// **'Font size'**
  String get settingsFontSizeTitle;

  /// No description provided for @settingsFontSizeSample.
  ///
  /// In en, this message translates to:
  /// **'The quick brown fox jumps over the lazy dog'**
  String get settingsFontSizeSample;

  /// No description provided for @settingsDensityTitle.
  ///
  /// In en, this message translates to:
  /// **'Density'**
  String get settingsDensityTitle;

  /// No description provided for @settingsDensityDescription.
  ///
  /// In en, this message translates to:
  /// **'Affects spacing on standard controls -- buttons, toggles, dialogs -- not every custom layout.'**
  String get settingsDensityDescription;

  /// No description provided for @settingsDensityCompact.
  ///
  /// In en, this message translates to:
  /// **'Compact'**
  String get settingsDensityCompact;

  /// No description provided for @settingsDensityStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get settingsDensityStandard;

  /// No description provided for @settingsDensityComfortable.
  ///
  /// In en, this message translates to:
  /// **'Comfortable'**
  String get settingsDensityComfortable;

  /// No description provided for @settingsStreamingTitle.
  ///
  /// In en, this message translates to:
  /// **'Streaming Accounts'**
  String get settingsStreamingTitle;

  /// No description provided for @settingsStreamingDescription.
  ///
  /// In en, this message translates to:
  /// **'Connect Twitch/YouTube so servers where you have the \"Announce When Live\" permission can automatically post when you go live or post a new video.'**
  String get settingsStreamingDescription;

  /// No description provided for @settingsStreamingConnected.
  ///
  /// In en, this message translates to:
  /// **'{platform} connected as {username}{liveSuffix}'**
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix);

  /// No description provided for @settingsStreamingNotConnected.
  ///
  /// In en, this message translates to:
  /// **'{platform} not connected'**
  String settingsStreamingNotConnected(String platform);

  /// No description provided for @settingsStreamingLiveSuffixTwitch.
  ///
  /// In en, this message translates to:
  /// **' -- live now'**
  String get settingsStreamingLiveSuffixTwitch;

  /// No description provided for @settingsStreamingLiveSuffixYoutube.
  ///
  /// In en, this message translates to:
  /// **' -- a new upload'**
  String get settingsStreamingLiveSuffixYoutube;

  /// No description provided for @settingsStreamingConnecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get settingsStreamingConnecting;

  /// No description provided for @settingsStreamingConnect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get settingsStreamingConnect;

  /// No description provided for @settingsAnnounceLiveTwitch.
  ///
  /// In en, this message translates to:
  /// **'Announce when I go live'**
  String get settingsAnnounceLiveTwitch;

  /// No description provided for @settingsAnnounceLiveYoutube.
  ///
  /// In en, this message translates to:
  /// **'Announce live streams and new uploads'**
  String get settingsAnnounceLiveYoutube;

  /// No description provided for @settingsRefreshStatus.
  ///
  /// In en, this message translates to:
  /// **'Already connected in your browser? Refresh status'**
  String get settingsRefreshStatus;

  /// No description provided for @settingsStreamingConnectError.
  ///
  /// In en, this message translates to:
  /// **'Could not start {platform} connection.'**
  String settingsStreamingConnectError(String platform);

  /// No description provided for @settingsStreamingFinishInBrowser.
  ///
  /// In en, this message translates to:
  /// **'Finish connecting in your browser, then come back and refresh.'**
  String get settingsStreamingFinishInBrowser;

  /// No description provided for @settingsThroneTitle.
  ///
  /// In en, this message translates to:
  /// **'Throne Webhook'**
  String get settingsThroneTitle;

  /// No description provided for @settingsThroneDescription.
  ///
  /// In en, this message translates to:
  /// **'Paste this URL into your Throne.com webhook settings to get notified in Koda whenever someone sends you a gift.'**
  String get settingsThroneDescription;

  /// No description provided for @settingsThroneGetUrl.
  ///
  /// In en, this message translates to:
  /// **'Get my webhook URL'**
  String get settingsThroneGetUrl;

  /// No description provided for @settingsThroneCopyTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get settingsThroneCopyTooltip;

  /// No description provided for @settingsThroneCopiedToast.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get settingsThroneCopiedToast;

  /// No description provided for @settingsThroneRegenerateTooltip.
  ///
  /// In en, this message translates to:
  /// **'Regenerate (invalidates the old URL)'**
  String get settingsThroneRegenerateTooltip;

  /// No description provided for @settingsThroneRegenerateConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Regenerate webhook URL?'**
  String get settingsThroneRegenerateConfirmTitle;

  /// No description provided for @settingsThroneRegenerateConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Your old URL will stop working, so update it in Throne.com afterward.'**
  String get settingsThroneRegenerateConfirmBody;

  /// No description provided for @settingsThroneRegenerate.
  ///
  /// In en, this message translates to:
  /// **'Regenerate'**
  String get settingsThroneRegenerate;

  /// No description provided for @settingsUploadPhoto.
  ///
  /// In en, this message translates to:
  /// **'Upload Photo'**
  String get settingsUploadPhoto;

  /// No description provided for @settingsOrPasteUrl.
  ///
  /// In en, this message translates to:
  /// **'or paste a URL below'**
  String get settingsOrPasteUrl;

  /// No description provided for @settingsAvatarUrlHint.
  ///
  /// In en, this message translates to:
  /// **'https://example.com/avatar.jpg'**
  String get settingsAvatarUrlHint;

  /// No description provided for @settingsAvatarUploadNote.
  ///
  /// In en, this message translates to:
  /// **'Image upload requires Cloudflare R2 — URL paste always works.'**
  String get settingsAvatarUploadNote;

  /// No description provided for @settingsDisplayNameLabel.
  ///
  /// In en, this message translates to:
  /// **'DISPLAY NAME'**
  String get settingsDisplayNameLabel;

  /// No description provided for @settingsDisplayNameHint.
  ///
  /// In en, this message translates to:
  /// **'Display name'**
  String get settingsDisplayNameHint;

  /// No description provided for @settingsBioLabel.
  ///
  /// In en, this message translates to:
  /// **'BIO'**
  String get settingsBioLabel;

  /// No description provided for @settingsBioHint.
  ///
  /// In en, this message translates to:
  /// **'Tell people a little about yourself'**
  String get settingsBioHint;

  /// No description provided for @settingsPronounsLabel.
  ///
  /// In en, this message translates to:
  /// **'PRONOUNS'**
  String get settingsPronounsLabel;

  /// No description provided for @settingsPronounsHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. they/them'**
  String get settingsPronounsHint;

  /// No description provided for @settingsShowPronounsTitle.
  ///
  /// In en, this message translates to:
  /// **'Show my pronouns to others'**
  String get settingsShowPronounsTitle;

  /// No description provided for @settingsShowPronounsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shown next to your name in chat, member lists, and voice'**
  String get settingsShowPronounsSubtitle;

  /// No description provided for @settingsStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'STATUS'**
  String get settingsStatusLabel;

  /// No description provided for @settingsCustomStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'CUSTOM STATUS'**
  String get settingsCustomStatusLabel;

  /// No description provided for @settingsCustomStatusHint.
  ///
  /// In en, this message translates to:
  /// **'What\'s on your mind?'**
  String get settingsCustomStatusHint;

  /// No description provided for @statusOnline.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get statusOnline;

  /// No description provided for @statusAway.
  ///
  /// In en, this message translates to:
  /// **'Away'**
  String get statusAway;

  /// No description provided for @statusDnd.
  ///
  /// In en, this message translates to:
  /// **'Do Not Disturb'**
  String get statusDnd;

  /// No description provided for @statusInvisible.
  ///
  /// In en, this message translates to:
  /// **'Invisible'**
  String get statusInvisible;

  /// No description provided for @settingsFamilyNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Parental controls aren\'t available on a supervised account.'**
  String get settingsFamilyNotAvailable;

  /// No description provided for @settingsAboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About Koda'**
  String get settingsAboutTitle;

  /// No description provided for @settingsAboutBuildLabel.
  ///
  /// In en, this message translates to:
  /// **'{buildLabel} v{version}'**
  String settingsAboutBuildLabel(String buildLabel, String version);

  /// No description provided for @settingsTermsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get settingsTermsTitle;

  /// No description provided for @settingsPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacyTitle;

  /// No description provided for @settingsSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get settingsSupportTitle;

  /// No description provided for @settingsReportSecurityTitle.
  ///
  /// In en, this message translates to:
  /// **'Report a Security Issue'**
  String get settingsReportSecurityTitle;

  /// No description provided for @settingsDesktopNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'These are desktop-only settings -- there\'s no window or system tray on this platform.'**
  String get settingsDesktopNotAvailable;

  /// No description provided for @settingsCloseToTrayTitle.
  ///
  /// In en, this message translates to:
  /// **'Close to system tray'**
  String get settingsCloseToTrayTitle;

  /// No description provided for @settingsCloseToTraySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Closing the window keeps Koda running in the background so you still get notifications -- turn this off to make closing the window actually quit.'**
  String get settingsCloseToTraySubtitle;

  /// No description provided for @authErrorEmailPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Email and password are required.'**
  String get authErrorEmailPasswordRequired;

  /// No description provided for @authErrorIncorrectCredentials.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password.'**
  String get authErrorIncorrectCredentials;

  /// No description provided for @authErrorMustAcceptTerms.
  ///
  /// In en, this message translates to:
  /// **'Please accept the Terms & Conditions.'**
  String get authErrorMustAcceptTerms;

  /// No description provided for @authErrorAllFieldsRequired.
  ///
  /// In en, this message translates to:
  /// **'All fields are required.'**
  String get authErrorAllFieldsRequired;

  /// No description provided for @authErrorPasswordsDontMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get authErrorPasswordsDontMatch;

  /// No description provided for @authErrorPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters.'**
  String get authErrorPasswordTooShort;

  /// No description provided for @authErrorRegistrationFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed. That email may already be in use.'**
  String get authErrorRegistrationFailed;

  /// No description provided for @authTabSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get authTabSignIn;

  /// No description provided for @authTabCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get authTabCreateAccount;

  /// No description provided for @authAgreementPrefix.
  ///
  /// In en, this message translates to:
  /// **'By using Koda you agree to our '**
  String get authAgreementPrefix;

  /// No description provided for @authTermsLink.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get authTermsLink;

  /// No description provided for @authAgreementMiddle.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get authAgreementMiddle;

  /// No description provided for @authPrivacyLink.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get authPrivacyLink;

  /// No description provided for @authAgreementSuffix.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get authAgreementSuffix;

  /// No description provided for @authEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get authEmailHint;

  /// No description provided for @authPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPasswordHint;

  /// No description provided for @authForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPassword;

  /// No description provided for @authSignInButton.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get authSignInButton;

  /// No description provided for @authUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get authUsernameHint;

  /// No description provided for @authConfirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get authConfirmPasswordHint;

  /// No description provided for @authAccessCodeHint.
  ///
  /// In en, this message translates to:
  /// **'Access code (if you have one)'**
  String get authAccessCodeHint;

  /// No description provided for @authAgreeToTerms.
  ///
  /// In en, this message translates to:
  /// **'I agree to the Terms & Conditions and Privacy Policy'**
  String get authAgreeToTerms;

  /// No description provided for @authCreateAccountButton.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get authCreateAccountButton;

  /// No description provided for @dmSafetyNumberChangedWarning.
  ///
  /// In en, this message translates to:
  /// **'This conversation\'s safety number changed -- verify it before sending.'**
  String get dmSafetyNumberChangedWarning;

  /// No description provided for @dmMessageNotSent.
  ///
  /// In en, this message translates to:
  /// **'Message not sent.'**
  String get dmMessageNotSent;

  /// No description provided for @dmEncryptMessageError.
  ///
  /// In en, this message translates to:
  /// **'Could not encrypt message: {error}'**
  String dmEncryptMessageError(String error);

  /// No description provided for @dmAttachmentUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Attachment upload failed.'**
  String get dmAttachmentUploadFailed;

  /// No description provided for @dmEncryptAttachmentError.
  ///
  /// In en, this message translates to:
  /// **'Could not encrypt attachment: {error}'**
  String dmEncryptAttachmentError(String error);

  /// No description provided for @dmReportMessage.
  ///
  /// In en, this message translates to:
  /// **'Report Message'**
  String get dmReportMessage;

  /// No description provided for @dmReportSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Report submitted.'**
  String get dmReportSubmitted;

  /// No description provided for @dmTitle.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get dmTitle;

  /// No description provided for @dmNewMessage.
  ///
  /// In en, this message translates to:
  /// **'New Message'**
  String get dmNewMessage;

  /// No description provided for @dmNoConversationsYet.
  ///
  /// In en, this message translates to:
  /// **'No conversations yet'**
  String get dmNoConversationsYet;

  /// No description provided for @dmSelectConversation.
  ///
  /// In en, this message translates to:
  /// **'Select a conversation'**
  String get dmSelectConversation;

  /// No description provided for @dmVerifySafetyNumberTooltip.
  ///
  /// In en, this message translates to:
  /// **'Verify Safety Number'**
  String get dmVerifySafetyNumberTooltip;

  /// No description provided for @dmSeenLabel.
  ///
  /// In en, this message translates to:
  /// **'Seen'**
  String get dmSeenLabel;

  /// No description provided for @dmMessageActionsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Message actions'**
  String get dmMessageActionsTooltip;

  /// No description provided for @dmRemoveAttachmentTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove attachment'**
  String get dmRemoveAttachmentTooltip;

  /// No description provided for @dmAttachFileTooltip.
  ///
  /// In en, this message translates to:
  /// **'Attach file'**
  String get dmAttachFileTooltip;

  /// No description provided for @dmMessageHint.
  ///
  /// In en, this message translates to:
  /// **'Message...'**
  String get dmMessageHint;

  /// No description provided for @dmSendMessageTooltip.
  ///
  /// In en, this message translates to:
  /// **'Send message'**
  String get dmSendMessageTooltip;

  /// No description provided for @dmNoFriendsYet.
  ///
  /// In en, this message translates to:
  /// **'No friends yet.\nSend a friend request to get started.'**
  String get dmNoFriendsYet;

  /// No description provided for @dmUnfriendTooltip.
  ///
  /// In en, this message translates to:
  /// **'Unfriend'**
  String get dmUnfriendTooltip;

  /// No description provided for @dmNoPendingRequests.
  ///
  /// In en, this message translates to:
  /// **'No pending friend requests.'**
  String get dmNoPendingRequests;

  /// No description provided for @dmIncomingRequestsLabel.
  ///
  /// In en, this message translates to:
  /// **'INCOMING'**
  String get dmIncomingRequestsLabel;

  /// No description provided for @dmSentRequestsLabel.
  ///
  /// In en, this message translates to:
  /// **'SENT'**
  String get dmSentRequestsLabel;

  /// No description provided for @dmAcceptTooltip.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get dmAcceptTooltip;

  /// No description provided for @dmDeclineTooltip.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get dmDeclineTooltip;

  /// No description provided for @dmPendingLabel.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get dmPendingLabel;

  /// No description provided for @dmNewMessageDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'New Message'**
  String get dmNewMessageDialogTitle;

  /// No description provided for @dmEnterUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter username'**
  String get dmEnterUsernameHint;

  /// No description provided for @dmOpenButton.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get dmOpenButton;

  /// No description provided for @dmSavedAttachment.
  ///
  /// In en, this message translates to:
  /// **'Saved {fileName}'**
  String dmSavedAttachment(String fileName);

  /// No description provided for @dmUnknownUser.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get dmUnknownUser;

  /// No description provided for @dmEndToEndEncryptedTooltip.
  ///
  /// In en, this message translates to:
  /// **'End-to-end encrypted'**
  String get dmEndToEndEncryptedTooltip;

  /// No description provided for @homeContentWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Content Warning'**
  String get homeContentWarningTitle;

  /// No description provided for @homeContentWarningBody.
  ///
  /// In en, this message translates to:
  /// **'This channel is flagged for: {labels}.\n\nChange this in Settings > Security > Content Filters.'**
  String homeContentWarningBody(String labels);

  /// No description provided for @homeViewAnyway.
  ///
  /// In en, this message translates to:
  /// **'View Anyway'**
  String get homeViewAnyway;

  /// No description provided for @homeCouldNotConnectVoice.
  ///
  /// In en, this message translates to:
  /// **'Could not connect to voice.'**
  String get homeCouldNotConnectVoice;

  /// No description provided for @homeVoiceChannelFull.
  ///
  /// In en, this message translates to:
  /// **'This voice channel is full.'**
  String get homeVoiceChannelFull;

  /// No description provided for @homeCreateServer.
  ///
  /// In en, this message translates to:
  /// **'Create Server'**
  String get homeCreateServer;

  /// No description provided for @homeJoinServer.
  ///
  /// In en, this message translates to:
  /// **'Join Server'**
  String get homeJoinServer;

  /// No description provided for @homeRedeemCode.
  ///
  /// In en, this message translates to:
  /// **'Redeem Code'**
  String get homeRedeemCode;

  /// No description provided for @homeJoinServerDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Join Server'**
  String get homeJoinServerDialogTitle;

  /// No description provided for @homeEnterInviteCode.
  ///
  /// In en, this message translates to:
  /// **'Enter an invite code or URL:'**
  String get homeEnterInviteCode;

  /// No description provided for @homeInviteCodeHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. XK9MP2'**
  String get homeInviteCodeHint;

  /// No description provided for @homeJoined.
  ///
  /// In en, this message translates to:
  /// **'Joined!'**
  String get homeJoined;

  /// No description provided for @homeInvalidInvite.
  ///
  /// In en, this message translates to:
  /// **'Invalid or expired invite code.'**
  String get homeInvalidInvite;

  /// No description provided for @homeJoinButton.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get homeJoinButton;

  /// No description provided for @homeRedeemCodeDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Redeem Code'**
  String get homeRedeemCodeDialogTitle;

  /// No description provided for @homeEnterBackerCode.
  ///
  /// In en, this message translates to:
  /// **'Enter your backer or reward code:'**
  String get homeEnterBackerCode;

  /// No description provided for @homeRewardCodeHint.
  ///
  /// In en, this message translates to:
  /// **'Reward code'**
  String get homeRewardCodeHint;

  /// No description provided for @homeCodeRedeemed.
  ///
  /// In en, this message translates to:
  /// **'Code redeemed! Your rewards have been applied.'**
  String get homeCodeRedeemed;

  /// No description provided for @homeInvalidRedeemCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid, expired, or already redeemed code.'**
  String get homeInvalidRedeemCode;

  /// No description provided for @homeRedeemButton.
  ///
  /// In en, this message translates to:
  /// **'Redeem'**
  String get homeRedeemButton;

  /// No description provided for @homeAreFriends.
  ///
  /// In en, this message translates to:
  /// **'You are friends'**
  String get homeAreFriends;

  /// No description provided for @homeAddFriend.
  ///
  /// In en, this message translates to:
  /// **'Add Friend'**
  String get homeAddFriend;

  /// No description provided for @homeFriendRequestSent.
  ///
  /// In en, this message translates to:
  /// **'Friend request sent to {username}!'**
  String homeFriendRequestSent(String username);

  /// No description provided for @homeMessageButton.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get homeMessageButton;

  /// No description provided for @homeSendTip.
  ///
  /// In en, this message translates to:
  /// **'Send Tip'**
  String get homeSendTip;

  /// No description provided for @homeSwitchToServer.
  ///
  /// In en, this message translates to:
  /// **'Switch to Server'**
  String get homeSwitchToServer;

  /// No description provided for @homeInvitePeople.
  ///
  /// In en, this message translates to:
  /// **'Invite People'**
  String get homeInvitePeople;

  /// No description provided for @homeServerSettingsMenuItem.
  ///
  /// In en, this message translates to:
  /// **'Server Settings'**
  String get homeServerSettingsMenuItem;

  /// No description provided for @homeLeaveServerMenuItem.
  ///
  /// In en, this message translates to:
  /// **'Leave Server'**
  String get homeLeaveServerMenuItem;

  /// No description provided for @homeLeaveServerConfirm.
  ///
  /// In en, this message translates to:
  /// **'Leave {serverName}? You can rejoin with an invite.'**
  String homeLeaveServerConfirm(String serverName);

  /// No description provided for @homeLeaveButton.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get homeLeaveButton;

  /// No description provided for @homeCreateAServer.
  ///
  /// In en, this message translates to:
  /// **'Create a server'**
  String get homeCreateAServer;

  /// No description provided for @homeServerNameHint.
  ///
  /// In en, this message translates to:
  /// **'Server name'**
  String get homeServerNameHint;

  /// No description provided for @homeDescribeToVisp.
  ///
  /// In en, this message translates to:
  /// **'Describe it to Visp instead'**
  String get homeDescribeToVisp;

  /// No description provided for @homeMarkAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark as Read'**
  String get homeMarkAsRead;

  /// No description provided for @homeEditChannel.
  ///
  /// In en, this message translates to:
  /// **'Edit Channel'**
  String get homeEditChannel;

  /// No description provided for @homeDeleteChannel.
  ///
  /// In en, this message translates to:
  /// **'Delete Channel'**
  String get homeDeleteChannel;

  /// No description provided for @homeDeleteChannelConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete #{channelName}? This cannot be undone.'**
  String homeDeleteChannelConfirm(String channelName);

  /// No description provided for @homeDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get homeDeleteButton;

  /// No description provided for @homeCreateChannelHere.
  ///
  /// In en, this message translates to:
  /// **'Create Channel Here'**
  String get homeCreateChannelHere;

  /// No description provided for @homeEditCategory.
  ///
  /// In en, this message translates to:
  /// **'Edit Category'**
  String get homeEditCategory;

  /// No description provided for @homeDeleteCategory.
  ///
  /// In en, this message translates to:
  /// **'Delete Category'**
  String get homeDeleteCategory;

  /// No description provided for @homeDeleteCategoryConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{categoryName}\"? Channels inside will become uncategorized.'**
  String homeDeleteCategoryConfirm(String categoryName);

  /// No description provided for @homeReplyAction.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get homeReplyAction;

  /// No description provided for @homeCreateThreadAction.
  ///
  /// In en, this message translates to:
  /// **'Create Thread'**
  String get homeCreateThreadAction;

  /// No description provided for @homeEditMessageAction.
  ///
  /// In en, this message translates to:
  /// **'Edit Message'**
  String get homeEditMessageAction;

  /// No description provided for @homeDeleteMessageAction.
  ///
  /// In en, this message translates to:
  /// **'Delete Message'**
  String get homeDeleteMessageAction;

  /// No description provided for @homePinMessageAction.
  ///
  /// In en, this message translates to:
  /// **'Pin Message'**
  String get homePinMessageAction;

  /// No description provided for @homeUnpinMessageAction.
  ///
  /// In en, this message translates to:
  /// **'Unpin Message'**
  String get homeUnpinMessageAction;

  /// No description provided for @homeReportMessageAction.
  ///
  /// In en, this message translates to:
  /// **'Report Message'**
  String get homeReportMessageAction;

  /// No description provided for @homeReportSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Report submitted.'**
  String get homeReportSubmitted;

  /// No description provided for @messageActionForward.
  ///
  /// In en, this message translates to:
  /// **'Forward'**
  String get messageActionForward;

  /// No description provided for @messageForwardedFromLabel.
  ///
  /// In en, this message translates to:
  /// **'Forwarded from {name}'**
  String messageForwardedFromLabel(String name);

  /// No description provided for @forwardDestinationPickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Forward message'**
  String get forwardDestinationPickerTitle;

  /// No description provided for @forwardDestinationPickerChannelsTab.
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get forwardDestinationPickerChannelsTab;

  /// No description provided for @forwardDestinationPickerDmsTab.
  ///
  /// In en, this message translates to:
  /// **'Direct Messages'**
  String get forwardDestinationPickerDmsTab;

  /// No description provided for @forwardDestinationPickerNoServers.
  ///
  /// In en, this message translates to:
  /// **'You\'re not in any servers yet.'**
  String get forwardDestinationPickerNoServers;

  /// No description provided for @forwardDestinationPickerNoChannels.
  ///
  /// In en, this message translates to:
  /// **'No text channels in this server.'**
  String get forwardDestinationPickerNoChannels;

  /// No description provided for @forwardDestinationPickerNoConversations.
  ///
  /// In en, this message translates to:
  /// **'No conversations yet.'**
  String get forwardDestinationPickerNoConversations;

  /// No description provided for @forwardSuccessToast.
  ///
  /// In en, this message translates to:
  /// **'Message forwarded.'**
  String get forwardSuccessToast;

  /// No description provided for @forwardFailedToast.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t forward the message -- try again.'**
  String get forwardFailedToast;

  /// No description provided for @homeAddReactionTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Reaction'**
  String get homeAddReactionTitle;

  /// No description provided for @homeThreadCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} thread} other{{count} threads}}'**
  String homeThreadCount(int count);

  /// No description provided for @homeCategoryOptionsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Category options'**
  String get homeCategoryOptionsTooltip;

  /// No description provided for @homeChannelOptionsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Channel options'**
  String get homeChannelOptionsTooltip;

  /// No description provided for @homeOpenVoiceChatTooltip.
  ///
  /// In en, this message translates to:
  /// **'Open chat'**
  String get homeOpenVoiceChatTooltip;

  /// No description provided for @homeMarketplaceLabel.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get homeMarketplaceLabel;

  /// No description provided for @homeSelectChannelPrompt.
  ///
  /// In en, this message translates to:
  /// **'Select a channel'**
  String get homeSelectChannelPrompt;

  /// No description provided for @homeSearchTooltip.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get homeSearchTooltip;

  /// No description provided for @homePinnedMessagesTooltip.
  ///
  /// In en, this message translates to:
  /// **'Pinned Messages'**
  String get homePinnedMessagesTooltip;

  /// No description provided for @homeWaitingForKey.
  ///
  /// In en, this message translates to:
  /// **'Waiting for the encryption key to arrive...'**
  String get homeWaitingForKey;

  /// No description provided for @homeUnableToDecrypt.
  ///
  /// In en, this message translates to:
  /// **'Unable to decrypt this message.'**
  String get homeUnableToDecrypt;

  /// No description provided for @homeMessageActionsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Message actions'**
  String get homeMessageActionsTooltip;

  /// No description provided for @homeCancelReplyTooltip.
  ///
  /// In en, this message translates to:
  /// **'Cancel reply'**
  String get homeCancelReplyTooltip;

  /// No description provided for @homeRemoveAttachmentTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove attachment'**
  String get homeRemoveAttachmentTooltip;

  /// No description provided for @homeAttachFileTooltip.
  ///
  /// In en, this message translates to:
  /// **'Attach file'**
  String get homeAttachFileTooltip;

  /// No description provided for @homeGifTooltip.
  ///
  /// In en, this message translates to:
  /// **'GIF'**
  String get homeGifTooltip;

  /// No description provided for @homeMessageHint.
  ///
  /// In en, this message translates to:
  /// **'Message #{channelName}'**
  String homeMessageHint(String channelName);

  /// No description provided for @homeSendMessageTooltip.
  ///
  /// In en, this message translates to:
  /// **'Send message'**
  String get homeSendMessageTooltip;

  /// No description provided for @homeEditMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Message'**
  String get homeEditMessageTitle;

  /// No description provided for @homeMessageLabel.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get homeMessageLabel;

  /// No description provided for @homePinnedMessagesTitle.
  ///
  /// In en, this message translates to:
  /// **'Pinned Messages'**
  String get homePinnedMessagesTitle;

  /// No description provided for @homeNoPinnedMessages.
  ///
  /// In en, this message translates to:
  /// **'No pinned messages'**
  String get homeNoPinnedMessages;

  /// No description provided for @homeUnpinTooltip.
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get homeUnpinTooltip;

  /// No description provided for @homeCreateThreadTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Thread'**
  String get homeCreateThreadTitle;

  /// No description provided for @homeThreadNameHint.
  ///
  /// In en, this message translates to:
  /// **'Thread name'**
  String get homeThreadNameHint;

  /// No description provided for @homeThreadCreated.
  ///
  /// In en, this message translates to:
  /// **'Thread \"{name}\" created!'**
  String homeThreadCreated(String name);

  /// No description provided for @homeCreateOrJoinTooltip.
  ///
  /// In en, this message translates to:
  /// **'Create or Join'**
  String get homeCreateOrJoinTooltip;

  /// No description provided for @homeKodaMarketplaceTooltip.
  ///
  /// In en, this message translates to:
  /// **'Koda Marketplace'**
  String get homeKodaMarketplaceTooltip;

  /// No description provided for @homeAdminPanelTooltip.
  ///
  /// In en, this message translates to:
  /// **'Admin Panel'**
  String get homeAdminPanelTooltip;

  /// No description provided for @homeServerSettingsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Server Settings'**
  String get homeServerSettingsTooltip;

  /// No description provided for @homeSettingsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get homeSettingsTooltip;

  /// No description provided for @homeContentWarningBadge.
  ///
  /// In en, this message translates to:
  /// **'Content warning'**
  String get homeContentWarningBadge;

  /// No description provided for @homeDirectMessagesTooltip.
  ///
  /// In en, this message translates to:
  /// **'Direct Messages'**
  String get homeDirectMessagesTooltip;

  /// No description provided for @homeReplyingTo.
  ///
  /// In en, this message translates to:
  /// **'Replying to {username}'**
  String homeReplyingTo(String username);

  /// No description provided for @homeAttachmentFallback.
  ///
  /// In en, this message translates to:
  /// **'Attachment'**
  String get homeAttachmentFallback;

  /// No description provided for @homeAttachmentUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Attachment upload failed.'**
  String get homeAttachmentUploadFailed;

  /// No description provided for @homeSavedAttachment.
  ///
  /// In en, this message translates to:
  /// **'Saved {fileName}'**
  String homeSavedAttachment(String fileName);

  /// No description provided for @serverConnectError.
  ///
  /// In en, this message translates to:
  /// **'Could not start {service} connection.'**
  String serverConnectError(String service);

  /// No description provided for @serverDisconnectPrintfulTitle.
  ///
  /// In en, this message translates to:
  /// **'Disconnect Printful?'**
  String get serverDisconnectPrintfulTitle;

  /// No description provided for @serverDisconnectPrintfulBody.
  ///
  /// In en, this message translates to:
  /// **'This server will no longer be able to fulfill merch orders until reconnected.'**
  String get serverDisconnectPrintfulBody;

  /// No description provided for @serverDisconnectTiltifyTitle.
  ///
  /// In en, this message translates to:
  /// **'Disconnect Tiltify?'**
  String get serverDisconnectTiltifyTitle;

  /// No description provided for @serverDisconnectTiltifyBody.
  ///
  /// In en, this message translates to:
  /// **'This server will stop showing its charity campaign\'s progress until reconnected.'**
  String get serverDisconnectTiltifyBody;

  /// No description provided for @serverNewRoleTitle.
  ///
  /// In en, this message translates to:
  /// **'New Role'**
  String get serverNewRoleTitle;

  /// No description provided for @serverEditRoleTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Role'**
  String get serverEditRoleTitle;

  /// No description provided for @serverColorSwatchLabel.
  ///
  /// In en, this message translates to:
  /// **'Color {hex}'**
  String serverColorSwatchLabel(String hex);

  /// No description provided for @permViewChannels.
  ///
  /// In en, this message translates to:
  /// **'View Channels'**
  String get permViewChannels;

  /// No description provided for @permSendMessages.
  ///
  /// In en, this message translates to:
  /// **'Send Messages'**
  String get permSendMessages;

  /// No description provided for @permConnectVoice.
  ///
  /// In en, this message translates to:
  /// **'Connect to Voice'**
  String get permConnectVoice;

  /// No description provided for @permManageServer.
  ///
  /// In en, this message translates to:
  /// **'Manage Server'**
  String get permManageServer;

  /// No description provided for @permManageChannels.
  ///
  /// In en, this message translates to:
  /// **'Manage Channels'**
  String get permManageChannels;

  /// No description provided for @permManageRoles.
  ///
  /// In en, this message translates to:
  /// **'Manage Roles'**
  String get permManageRoles;

  /// No description provided for @permManageMessages.
  ///
  /// In en, this message translates to:
  /// **'Manage Messages'**
  String get permManageMessages;

  /// No description provided for @permKickMembers.
  ///
  /// In en, this message translates to:
  /// **'Kick Members'**
  String get permKickMembers;

  /// No description provided for @permBanMembers.
  ///
  /// In en, this message translates to:
  /// **'Ban Members'**
  String get permBanMembers;

  /// No description provided for @permMuteMembers.
  ///
  /// In en, this message translates to:
  /// **'Mute Members'**
  String get permMuteMembers;

  /// No description provided for @permMentionEveryone.
  ///
  /// In en, this message translates to:
  /// **'Mention @everyone'**
  String get permMentionEveryone;

  /// No description provided for @permManageMarketplace.
  ///
  /// In en, this message translates to:
  /// **'Manage Marketplace'**
  String get permManageMarketplace;

  /// No description provided for @permAnnounceLive.
  ///
  /// In en, this message translates to:
  /// **'Announce When Live'**
  String get permAnnounceLive;

  /// No description provided for @permMoveMembers.
  ///
  /// In en, this message translates to:
  /// **'Move Members (Voice)'**
  String get permMoveMembers;

  /// No description provided for @serverRoleNameHint.
  ///
  /// In en, this message translates to:
  /// **'Role name'**
  String get serverRoleNameHint;

  /// No description provided for @serverColorLabel.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get serverColorLabel;

  /// No description provided for @serverPermissionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get serverPermissionsLabel;

  /// No description provided for @serverSelfAssignableTitle.
  ///
  /// In en, this message translates to:
  /// **'Self-assignable'**
  String get serverSelfAssignableTitle;

  /// No description provided for @serverSelfAssignableSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Members can assign this role themselves'**
  String get serverSelfAssignableSubtitle;

  /// No description provided for @serverDefaultRoleUndeletable.
  ///
  /// In en, this message translates to:
  /// **'The default role cannot be deleted.'**
  String get serverDefaultRoleUndeletable;

  /// No description provided for @serverDeleteRoleConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete role \"{roleName}\"?'**
  String serverDeleteRoleConfirm(String roleName);

  /// No description provided for @serverCouldNotDeleteRole.
  ///
  /// In en, this message translates to:
  /// **'Could not delete that role.'**
  String get serverCouldNotDeleteRole;

  /// No description provided for @serverMemberFallback.
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get serverMemberFallback;

  /// No description provided for @serverNoRolesYet.
  ///
  /// In en, this message translates to:
  /// **'No roles yet.'**
  String get serverNoRolesYet;

  /// No description provided for @serverRefreshStatus.
  ///
  /// In en, this message translates to:
  /// **'Already connected in your browser? Refresh status'**
  String get serverRefreshStatus;

  /// No description provided for @serverPrintfulConnected.
  ///
  /// In en, this message translates to:
  /// **'Printful Connected'**
  String get serverPrintfulConnected;

  /// No description provided for @serverPrintfulNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Printful Not Connected'**
  String get serverPrintfulNotConnected;

  /// No description provided for @serverPrintfulDescription.
  ///
  /// In en, this message translates to:
  /// **'Connect this server\'s Printful account to fulfill merch orders placed through Koda. Each server connects its own store.'**
  String get serverPrintfulDescription;

  /// No description provided for @serverConnecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get serverConnecting;

  /// No description provided for @serverConnectPrintful.
  ///
  /// In en, this message translates to:
  /// **'Connect Printful'**
  String get serverConnectPrintful;

  /// No description provided for @serverTiltifyConnected.
  ///
  /// In en, this message translates to:
  /// **'Tiltify Connected'**
  String get serverTiltifyConnected;

  /// No description provided for @serverTiltifyNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Tiltify Not Connected'**
  String get serverTiltifyNotConnected;

  /// No description provided for @serverTiltifyDescription.
  ///
  /// In en, this message translates to:
  /// **'Connect this server\'s Tiltify account to show a charity campaign\'s live progress to every member. Read-only -- Koda never posts or changes anything on Tiltify\'s side.'**
  String get serverTiltifyDescription;

  /// No description provided for @serverConnectTiltify.
  ///
  /// In en, this message translates to:
  /// **'Connect Tiltify'**
  String get serverConnectTiltify;

  /// No description provided for @serverNoTiltifyCampaigns.
  ///
  /// In en, this message translates to:
  /// **'No campaigns found on this Tiltify account.'**
  String get serverNoTiltifyCampaigns;

  /// No description provided for @serverPickCampaign.
  ///
  /// In en, this message translates to:
  /// **'Pick which campaign to display'**
  String get serverPickCampaign;

  /// No description provided for @serverUntitledCampaign.
  ///
  /// In en, this message translates to:
  /// **'Untitled campaign'**
  String get serverUntitledCampaign;

  /// No description provided for @serverCampaignProgress.
  ///
  /// In en, this message translates to:
  /// **'{currency} {raised} raised of {goal} goal'**
  String serverCampaignProgress(String currency, String raised, String goal);

  /// No description provided for @serverViewCampaign.
  ///
  /// In en, this message translates to:
  /// **'View campaign'**
  String get serverViewCampaign;

  /// No description provided for @serverRefreshButton.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get serverRefreshButton;

  /// No description provided for @serverUploadButton.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get serverUploadButton;

  /// No description provided for @serverEmojiSlotsUsed.
  ///
  /// In en, this message translates to:
  /// **'{used} / {limit} slots used -- boost level {level}'**
  String serverEmojiSlotsUsed(int used, int limit, int level);

  /// No description provided for @serverNoCustomEmoji.
  ///
  /// In en, this message translates to:
  /// **'No custom emoji yet.'**
  String get serverNoCustomEmoji;

  /// No description provided for @serverDeleteEmojiTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete emoji'**
  String get serverDeleteEmojiTooltip;

  /// No description provided for @serverUploadEmojiTitle.
  ///
  /// In en, this message translates to:
  /// **'Upload Emoji'**
  String get serverUploadEmojiTitle;

  /// No description provided for @serverEmojiNameHint.
  ///
  /// In en, this message translates to:
  /// **'name (letters, numbers, _)'**
  String get serverEmojiNameHint;

  /// No description provided for @serverChooseImage.
  ///
  /// In en, this message translates to:
  /// **'Choose Image'**
  String get serverChooseImage;

  /// No description provided for @serverCurrentBoostLevel.
  ///
  /// In en, this message translates to:
  /// **'Current boost level: {level}'**
  String serverCurrentBoostLevel(int level);

  /// No description provided for @serverBackgroundTitle.
  ///
  /// In en, this message translates to:
  /// **'Server Background'**
  String get serverBackgroundTitle;

  /// No description provided for @serverBackgroundDescription.
  ///
  /// In en, this message translates to:
  /// **'A custom background shown behind the channel view to everyone in this server.'**
  String get serverBackgroundDescription;

  /// No description provided for @serverBackgroundLockedHint.
  ///
  /// In en, this message translates to:
  /// **'Reach boost level 4 to unlock a custom background.'**
  String get serverBackgroundLockedHint;

  /// No description provided for @serverIconBorderTitle.
  ///
  /// In en, this message translates to:
  /// **'Server Icon Border'**
  String get serverIconBorderTitle;

  /// No description provided for @serverIconBorderDescription.
  ///
  /// In en, this message translates to:
  /// **'An accent border around this server\'s icon in every member\'s server list.'**
  String get serverIconBorderDescription;

  /// No description provided for @serverIconBorderLockedHint.
  ///
  /// In en, this message translates to:
  /// **'Reach boost level 5 to unlock a custom icon border.'**
  String get serverIconBorderLockedHint;

  /// No description provided for @serverBoostFromBank.
  ///
  /// In en, this message translates to:
  /// **'Boost this server from the Server Bank in Marketplace to raise its level.'**
  String get serverBoostFromBank;

  /// No description provided for @serverMarketplaceListingLabel.
  ///
  /// In en, this message translates to:
  /// **'MARKETPLACE LISTING'**
  String get serverMarketplaceListingLabel;

  /// No description provided for @serverListInMarketplace.
  ///
  /// In en, this message translates to:
  /// **'List in Koda Marketplace'**
  String get serverListInMarketplace;

  /// No description provided for @serverListInMarketplaceDescription.
  ///
  /// In en, this message translates to:
  /// **'Lists this server\'s store in the Koda Marketplace, with a chance at the weekly featured rotation. This is about shopping, not finding servers to join -- it has no effect on general server search.'**
  String get serverListInMarketplaceDescription;

  /// No description provided for @serverSocialLinkLabel.
  ///
  /// In en, this message translates to:
  /// **'Social / Invite Link (optional)'**
  String get serverSocialLinkLabel;

  /// No description provided for @serverSocialLinkHint.
  ///
  /// In en, this message translates to:
  /// **'https://...'**
  String get serverSocialLinkHint;

  /// No description provided for @serverSaveLinkButton.
  ///
  /// In en, this message translates to:
  /// **'Save Link'**
  String get serverSaveLinkButton;

  /// No description provided for @serverPricingLabel.
  ///
  /// In en, this message translates to:
  /// **'PRICING'**
  String get serverPricingLabel;

  /// No description provided for @serverPrimaryCurrencyLabel.
  ///
  /// In en, this message translates to:
  /// **'Primary Currency'**
  String get serverPrimaryCurrencyLabel;

  /// No description provided for @serverPrimaryCurrencyDescription.
  ///
  /// In en, this message translates to:
  /// **'Applies to Server Subscription tiers and Digital Goods prices you set for this server.'**
  String get serverPrimaryCurrencyDescription;

  /// No description provided for @serverPrimaryLanguageLabel.
  ///
  /// In en, this message translates to:
  /// **'Primary Language'**
  String get serverPrimaryLanguageLabel;

  /// No description provided for @serverPrimaryLanguageDescription.
  ///
  /// In en, this message translates to:
  /// **'Messages members post in a different language get a small language badge, compared against this setting.'**
  String get serverPrimaryLanguageDescription;

  /// No description provided for @serverMarketplaceLinkSaved.
  ///
  /// In en, this message translates to:
  /// **'Marketplace link saved.'**
  String get serverMarketplaceLinkSaved;

  /// No description provided for @serverIconUpdated.
  ///
  /// In en, this message translates to:
  /// **'Server icon updated!'**
  String get serverIconUpdated;

  /// No description provided for @serverTemplateImported.
  ///
  /// In en, this message translates to:
  /// **'Template imported!'**
  String get serverTemplateImported;

  /// No description provided for @serverImportFromDiscord.
  ///
  /// In en, this message translates to:
  /// **'Import from Discord'**
  String get serverImportFromDiscord;

  /// No description provided for @serverVispPlanLive.
  ///
  /// In en, this message translates to:
  /// **'Visp\'s plan is live!'**
  String get serverVispPlanLive;

  /// No description provided for @serverAskVisp.
  ///
  /// In en, this message translates to:
  /// **'Ask Visp'**
  String get serverAskVisp;

  /// No description provided for @serverAddCategoryButton.
  ///
  /// In en, this message translates to:
  /// **'Add Category'**
  String get serverAddCategoryButton;

  /// No description provided for @serverAddChannelHereTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add channel here'**
  String get serverAddChannelHereTooltip;

  /// No description provided for @serverRename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get serverRename;

  /// No description provided for @serverUncategorized.
  ///
  /// In en, this message translates to:
  /// **'UNCATEGORIZED'**
  String get serverUncategorized;

  /// No description provided for @serverAddChannel.
  ///
  /// In en, this message translates to:
  /// **'Add Channel'**
  String get serverAddChannel;

  /// No description provided for @serverEditRulesContent.
  ///
  /// In en, this message translates to:
  /// **'Edit Rules Content'**
  String get serverEditRulesContent;

  /// No description provided for @serverRulesContentHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your server rules here...'**
  String get serverRulesContentHint;

  /// No description provided for @serverRulesUpdated.
  ///
  /// In en, this message translates to:
  /// **'Rules updated!'**
  String get serverRulesUpdated;

  /// No description provided for @serverAddRole.
  ///
  /// In en, this message translates to:
  /// **'Add Role'**
  String get serverAddRole;

  /// No description provided for @serverDefaultRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'Default role'**
  String get serverDefaultRoleLabel;

  /// No description provided for @serverManageRolesTooltip.
  ///
  /// In en, this message translates to:
  /// **'Manage Roles'**
  String get serverManageRolesTooltip;

  /// No description provided for @serverMutedLabel.
  ///
  /// In en, this message translates to:
  /// **'Muted'**
  String get serverMutedLabel;

  /// No description provided for @serverExpandedLabel.
  ///
  /// In en, this message translates to:
  /// **'expanded'**
  String get serverExpandedLabel;

  /// No description provided for @serverCollapsedLabel.
  ///
  /// In en, this message translates to:
  /// **'collapsed'**
  String get serverCollapsedLabel;

  /// No description provided for @serverUnmute.
  ///
  /// In en, this message translates to:
  /// **'Unmute'**
  String get serverUnmute;

  /// No description provided for @serverMute.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get serverMute;

  /// No description provided for @serverKick.
  ///
  /// In en, this message translates to:
  /// **'Kick'**
  String get serverKick;

  /// No description provided for @serverBan.
  ///
  /// In en, this message translates to:
  /// **'Ban'**
  String get serverBan;

  /// No description provided for @serverBannedUsersLabel.
  ///
  /// In en, this message translates to:
  /// **'BANNED USERS — {count}'**
  String serverBannedUsersLabel(int count);

  /// No description provided for @serverNoBannedUsers.
  ///
  /// In en, this message translates to:
  /// **'No banned users.'**
  String get serverNoBannedUsers;

  /// No description provided for @serverUnban.
  ///
  /// In en, this message translates to:
  /// **'Unban'**
  String get serverUnban;

  /// No description provided for @serverMemberFallbackGeneric.
  ///
  /// In en, this message translates to:
  /// **'this member'**
  String get serverMemberFallbackGeneric;

  /// No description provided for @serverBanConfirm.
  ///
  /// In en, this message translates to:
  /// **'Ban {username} from {serverName}? They will not be able to rejoin without being unbanned.'**
  String serverBanConfirm(String username, String serverName);

  /// No description provided for @serverKickConfirm.
  ///
  /// In en, this message translates to:
  /// **'Kick {username} from {serverName}? They can rejoin with an invite.'**
  String serverKickConfirm(String username, String serverName);

  /// No description provided for @serverMuteDuration60Sec.
  ///
  /// In en, this message translates to:
  /// **'60 seconds'**
  String get serverMuteDuration60Sec;

  /// No description provided for @serverMuteDuration5Min.
  ///
  /// In en, this message translates to:
  /// **'5 minutes'**
  String get serverMuteDuration5Min;

  /// No description provided for @serverMuteDuration10Min.
  ///
  /// In en, this message translates to:
  /// **'10 minutes'**
  String get serverMuteDuration10Min;

  /// No description provided for @serverMuteDuration1Hour.
  ///
  /// In en, this message translates to:
  /// **'1 hour'**
  String get serverMuteDuration1Hour;

  /// No description provided for @serverMuteDuration1Day.
  ///
  /// In en, this message translates to:
  /// **'1 day'**
  String get serverMuteDuration1Day;

  /// No description provided for @serverMuteDuration1Week.
  ///
  /// In en, this message translates to:
  /// **'1 week'**
  String get serverMuteDuration1Week;

  /// No description provided for @serverCouldNotModerateMember.
  ///
  /// In en, this message translates to:
  /// **'Could not {action} {username}.'**
  String serverCouldNotModerateMember(String action, String username);

  /// No description provided for @serverMuteUserTitle.
  ///
  /// In en, this message translates to:
  /// **'Mute {username}'**
  String serverMuteUserTitle(String username);

  /// No description provided for @serverCouldNotMuteMember.
  ///
  /// In en, this message translates to:
  /// **'Could not mute {username}.'**
  String serverCouldNotMuteMember(String username);

  /// No description provided for @serverUnlockInvites.
  ///
  /// In en, this message translates to:
  /// **'Unlock Invites'**
  String get serverUnlockInvites;

  /// No description provided for @serverInvitesUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Invites unlocked.'**
  String get serverInvitesUnlocked;

  /// No description provided for @serverAuditLogDescription.
  ///
  /// In en, this message translates to:
  /// **'Tier 1 moderation activity -- kicks, bans, mutes, and automated flood/raid protection. Metadata only; never message content.'**
  String get serverAuditLogDescription;

  /// No description provided for @serverSystemActor.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get serverSystemActor;

  /// No description provided for @serverActionKicked.
  ///
  /// In en, this message translates to:
  /// **'kicked'**
  String get serverActionKicked;

  /// No description provided for @serverActionBanned.
  ///
  /// In en, this message translates to:
  /// **'banned'**
  String get serverActionBanned;

  /// No description provided for @serverActionUnbanned.
  ///
  /// In en, this message translates to:
  /// **'unbanned'**
  String get serverActionUnbanned;

  /// No description provided for @serverActionMuted.
  ///
  /// In en, this message translates to:
  /// **'muted'**
  String get serverActionMuted;

  /// No description provided for @serverActionUnmuted.
  ///
  /// In en, this message translates to:
  /// **'unmuted'**
  String get serverActionUnmuted;

  /// No description provided for @serverActionFloodDetected.
  ///
  /// In en, this message translates to:
  /// **'auto-muted for flooding'**
  String get serverActionFloodDetected;

  /// No description provided for @serverActionRaidLockdownEnabled.
  ///
  /// In en, this message translates to:
  /// **'locked invites (raid protection)'**
  String get serverActionRaidLockdownEnabled;

  /// No description provided for @serverActionRaidLockdownDisabled.
  ///
  /// In en, this message translates to:
  /// **'unlocked invites'**
  String get serverActionRaidLockdownDisabled;

  /// No description provided for @serverActionMoved.
  ///
  /// In en, this message translates to:
  /// **'moved'**
  String get serverActionMoved;

  /// No description provided for @serverUnknownAction.
  ///
  /// In en, this message translates to:
  /// **'unknown action'**
  String get serverUnknownAction;

  /// No description provided for @serverNoModerationActivity.
  ///
  /// In en, this message translates to:
  /// **'No moderation activity yet.'**
  String get serverNoModerationActivity;

  /// No description provided for @serverReportsDescription.
  ///
  /// In en, this message translates to:
  /// **'Messages reported by members of this server -- the reporter\'s own already-decrypted copy, disclosed by reporting.'**
  String get serverReportsDescription;

  /// No description provided for @serverNoPendingReports.
  ///
  /// In en, this message translates to:
  /// **'No pending reports.'**
  String get serverNoPendingReports;

  /// No description provided for @serverReportReasonOther.
  ///
  /// In en, this message translates to:
  /// **'other'**
  String get serverReportReasonOther;

  /// No description provided for @serverReportStatusActioned.
  ///
  /// In en, this message translates to:
  /// **'Actioned'**
  String get serverReportStatusActioned;

  /// No description provided for @serverReportStatusDismissed.
  ///
  /// In en, this message translates to:
  /// **'Dismissed'**
  String get serverReportStatusDismissed;

  /// No description provided for @serverResolvedLabel.
  ///
  /// In en, this message translates to:
  /// **'RESOLVED'**
  String get serverResolvedLabel;

  /// No description provided for @serverReportedBy.
  ///
  /// In en, this message translates to:
  /// **'Reported by {reporter} -- sent by {target}'**
  String serverReportedBy(String reporter, String target);

  /// No description provided for @serverReportNote.
  ///
  /// In en, this message translates to:
  /// **'Note: {note}'**
  String serverReportNote(String note);

  /// No description provided for @serverDismissButton.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get serverDismissButton;

  /// No description provided for @serverMarkActioned.
  ///
  /// In en, this message translates to:
  /// **'Mark Actioned'**
  String get serverMarkActioned;

  /// No description provided for @serverCreateInvite.
  ///
  /// In en, this message translates to:
  /// **'Create Invite'**
  String get serverCreateInvite;

  /// No description provided for @serverInviteCreatedTitle.
  ///
  /// In en, this message translates to:
  /// **'Invite Created'**
  String get serverInviteCreatedTitle;

  /// No description provided for @serverNoActiveInvites.
  ///
  /// In en, this message translates to:
  /// **'No active invites'**
  String get serverNoActiveInvites;

  /// No description provided for @serverUsesLabel.
  ///
  /// In en, this message translates to:
  /// **'Uses: {uses}'**
  String serverUsesLabel(String uses);

  /// No description provided for @serverDeleteInviteTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete invite'**
  String get serverDeleteInviteTooltip;

  /// No description provided for @serverChangeIconLabel.
  ///
  /// In en, this message translates to:
  /// **'Change server icon'**
  String get serverChangeIconLabel;

  /// No description provided for @serverFallbackName.
  ///
  /// In en, this message translates to:
  /// **'Server'**
  String get serverFallbackName;

  /// No description provided for @serverSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'{serverName} Settings'**
  String serverSettingsTitle(String serverName);

  /// No description provided for @serverTabChannels.
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get serverTabChannels;

  /// No description provided for @serverTabRoles.
  ///
  /// In en, this message translates to:
  /// **'Roles'**
  String get serverTabRoles;

  /// No description provided for @serverTabMembers.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get serverTabMembers;

  /// No description provided for @serverTabInvites.
  ///
  /// In en, this message translates to:
  /// **'Invites'**
  String get serverTabInvites;

  /// No description provided for @serverTabMerch.
  ///
  /// In en, this message translates to:
  /// **'Merch'**
  String get serverTabMerch;

  /// No description provided for @serverTabEmoji.
  ///
  /// In en, this message translates to:
  /// **'Emoji'**
  String get serverTabEmoji;

  /// No description provided for @serverTabCustomize.
  ///
  /// In en, this message translates to:
  /// **'Customize'**
  String get serverTabCustomize;

  /// No description provided for @serverTabAuditLog.
  ///
  /// In en, this message translates to:
  /// **'Audit Log'**
  String get serverTabAuditLog;

  /// No description provided for @serverTabReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get serverTabReports;

  /// No description provided for @serverTabThresholdMod.
  ///
  /// In en, this message translates to:
  /// **'Threshold Mod'**
  String get serverTabThresholdMod;

  /// No description provided for @serverTabCharity.
  ///
  /// In en, this message translates to:
  /// **'Charity'**
  String get serverTabCharity;

  /// No description provided for @homeCustomEmojiFallback.
  ///
  /// In en, this message translates to:
  /// **'custom emoji'**
  String get homeCustomEmojiFallback;

  /// No description provided for @homeReactionCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} reaction} other{{count} reactions}}'**
  String homeReactionCount(int count);

  /// No description provided for @homeReactionYouReacted.
  ///
  /// In en, this message translates to:
  /// **', you reacted, activate to remove'**
  String get homeReactionYouReacted;

  /// No description provided for @homeReactionActivateToAdd.
  ///
  /// In en, this message translates to:
  /// **', activate to add'**
  String get homeReactionActivateToAdd;

  /// No description provided for @homeAddReactionLabel.
  ///
  /// In en, this message translates to:
  /// **'Add reaction'**
  String get homeAddReactionLabel;

  /// No description provided for @homeViewProfile.
  ///
  /// In en, this message translates to:
  /// **'View {username}\'s profile'**
  String homeViewProfile(String username);

  /// No description provided for @homeMoveToVoiceChannel.
  ///
  /// In en, this message translates to:
  /// **'Move to voice channel…'**
  String get homeMoveToVoiceChannel;

  /// No description provided for @homeMoveVoiceChannelDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a voice channel'**
  String get homeMoveVoiceChannelDialogTitle;

  /// No description provided for @homeNoOtherVoiceChannels.
  ///
  /// In en, this message translates to:
  /// **'No other voice channels'**
  String get homeNoOtherVoiceChannels;

  /// No description provided for @homeMoveVoiceMemberSuccess.
  ///
  /// In en, this message translates to:
  /// **'Moved {username} to {channel}'**
  String homeMoveVoiceMemberSuccess(String username, String channel);

  /// No description provided for @homeMoveVoiceMemberError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t move {username}'**
  String homeMoveVoiceMemberError(String username);

  /// No description provided for @homeMovedToVoiceChannel.
  ///
  /// In en, this message translates to:
  /// **'You were moved to {channel}'**
  String homeMovedToVoiceChannel(String channel);

  /// No description provided for @homeJoinVoiceToTalkBanner.
  ///
  /// In en, this message translates to:
  /// **'Join {channel} to talk'**
  String homeJoinVoiceToTalkBanner(String channel);

  /// No description provided for @adminPanelTitle.
  ///
  /// In en, this message translates to:
  /// **'Admin Panel'**
  String get adminPanelTitle;

  /// No description provided for @adminTabBackerCodes.
  ///
  /// In en, this message translates to:
  /// **'Backer Codes'**
  String get adminTabBackerCodes;

  /// No description provided for @adminTabUsers.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get adminTabUsers;

  /// No description provided for @adminTabDmReports.
  ///
  /// In en, this message translates to:
  /// **'DM Reports'**
  String get adminTabDmReports;

  /// No description provided for @adminTabSpamFlags.
  ///
  /// In en, this message translates to:
  /// **'Spam Flags'**
  String get adminTabSpamFlags;

  /// No description provided for @adminTabWiki.
  ///
  /// In en, this message translates to:
  /// **'Wiki'**
  String get adminTabWiki;

  /// No description provided for @adminTabBoosts.
  ///
  /// In en, this message translates to:
  /// **'Boosts'**
  String get adminTabBoosts;

  /// No description provided for @adminCreateBackerCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Backer Code'**
  String get adminCreateBackerCodeTitle;

  /// No description provided for @adminCodeHint.
  ///
  /// In en, this message translates to:
  /// **'Code (leave blank to auto-generate)'**
  String get adminCodeHint;

  /// No description provided for @adminNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Note (e.g. \"Kickstarter Tier 2\")'**
  String get adminNoteHint;

  /// No description provided for @adminFlagsJsonHint.
  ///
  /// In en, this message translates to:
  /// **'Advanced: extra flags as JSON (optional)'**
  String get adminFlagsJsonHint;

  /// No description provided for @adminMaxUsesHint.
  ///
  /// In en, this message translates to:
  /// **'Max uses (leave blank = unlimited)'**
  String get adminMaxUsesHint;

  /// No description provided for @adminCodeCreatedTitle.
  ///
  /// In en, this message translates to:
  /// **'Code Created'**
  String get adminCodeCreatedTitle;

  /// No description provided for @adminCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Code:'**
  String get adminCodeLabel;

  /// No description provided for @adminCopyCodeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy code'**
  String get adminCopyCodeTooltip;

  /// No description provided for @adminFlagsValue.
  ///
  /// In en, this message translates to:
  /// **'Flags: {flags}'**
  String adminFlagsValue(String flags);

  /// No description provided for @adminBackerCodesHeader.
  ///
  /// In en, this message translates to:
  /// **'Backer & Reward Codes'**
  String get adminBackerCodesHeader;

  /// No description provided for @adminNewCodeButton.
  ///
  /// In en, this message translates to:
  /// **'New Code'**
  String get adminNewCodeButton;

  /// No description provided for @adminNoCodesYet.
  ///
  /// In en, this message translates to:
  /// **'No codes yet'**
  String get adminNoCodesYet;

  /// No description provided for @adminRewardsHeader.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get adminRewardsHeader;

  /// No description provided for @adminRewardAlphaBetaAccess.
  ///
  /// In en, this message translates to:
  /// **'Alpha/Beta Access + Alpha Spark Badge'**
  String get adminRewardAlphaBetaAccess;

  /// No description provided for @adminRewardLifetimePulse.
  ///
  /// In en, this message translates to:
  /// **'Lifetime Pulse + Founder Badge + Enhanced Bitrate'**
  String get adminRewardLifetimePulse;

  /// No description provided for @adminRewardMonthlyBoostTokenOne.
  ///
  /// In en, this message translates to:
  /// **'Monthly Server Boost Token (Enhanced Audio/Video)'**
  String get adminRewardMonthlyBoostTokenOne;

  /// No description provided for @adminRewardAnimatedFrameBundle.
  ///
  /// In en, this message translates to:
  /// **'Animated Profile Frame + Founders Hall + 2 Monthly Server Tokens'**
  String get adminRewardAnimatedFrameBundle;

  /// No description provided for @adminRewardTitanGlow.
  ///
  /// In en, this message translates to:
  /// **'Permanent \"Titan\" Username Glow'**
  String get adminRewardTitanGlow;

  /// No description provided for @adminRewardAnimatedFrame.
  ///
  /// In en, this message translates to:
  /// **'Animated Frame'**
  String get adminRewardAnimatedFrame;

  /// No description provided for @adminRewardFoundersHall.
  ///
  /// In en, this message translates to:
  /// **'Founders Hall'**
  String get adminRewardFoundersHall;

  /// No description provided for @adminRewardMonthlyBoostTokens.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 boost token/month} other{{count} boost tokens/month}}'**
  String adminRewardMonthlyBoostTokens(int count);

  /// No description provided for @adminRewardsNone.
  ///
  /// In en, this message translates to:
  /// **'No rewards'**
  String get adminRewardsNone;

  /// No description provided for @adminRegistrationOpenLabel.
  ///
  /// In en, this message translates to:
  /// **'Registration is open to everyone'**
  String get adminRegistrationOpenLabel;

  /// No description provided for @adminRegistrationInviteOnlyLabel.
  ///
  /// In en, this message translates to:
  /// **'Registration is invite-only (backer code required)'**
  String get adminRegistrationInviteOnlyLabel;

  /// No description provided for @adminUsesOfMax.
  ///
  /// In en, this message translates to:
  /// **'{uses} / {maxUses}'**
  String adminUsesOfMax(int uses, int maxUses);

  /// No description provided for @adminUsesCount.
  ///
  /// In en, this message translates to:
  /// **'{uses} uses'**
  String adminUsesCount(int uses);

  /// No description provided for @adminSearchUsersHint.
  ///
  /// In en, this message translates to:
  /// **'Search users by username...'**
  String get adminSearchUsersHint;

  /// No description provided for @adminSearchUsersPrompt.
  ///
  /// In en, this message translates to:
  /// **'Search for a user above'**
  String get adminSearchUsersPrompt;

  /// No description provided for @adminNoDmReports.
  ///
  /// In en, this message translates to:
  /// **'No DM reports.'**
  String get adminNoDmReports;

  /// No description provided for @adminResolvedLabel.
  ///
  /// In en, this message translates to:
  /// **'RESOLVED'**
  String get adminResolvedLabel;

  /// No description provided for @adminReasonOther.
  ///
  /// In en, this message translates to:
  /// **'other'**
  String get adminReasonOther;

  /// No description provided for @adminDmReportDetails.
  ///
  /// In en, this message translates to:
  /// **'Reporter: {reporterId}\nRevealed sender: {targetUserId}'**
  String adminDmReportDetails(String reporterId, String targetUserId);

  /// No description provided for @adminNoteValue.
  ///
  /// In en, this message translates to:
  /// **'Note: {note}'**
  String adminNoteValue(String note);

  /// No description provided for @adminDismissButton.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get adminDismissButton;

  /// No description provided for @adminMarkActionedButton.
  ///
  /// In en, this message translates to:
  /// **'Mark Actioned'**
  String get adminMarkActionedButton;

  /// No description provided for @adminStatusActioned.
  ///
  /// In en, this message translates to:
  /// **'Actioned'**
  String get adminStatusActioned;

  /// No description provided for @adminStatusDismissed.
  ///
  /// In en, this message translates to:
  /// **'Dismissed'**
  String get adminStatusDismissed;

  /// No description provided for @adminNoSpamFlags.
  ///
  /// In en, this message translates to:
  /// **'No spam flags.'**
  String get adminNoSpamFlags;

  /// No description provided for @adminFlagMassDmSpam.
  ///
  /// In en, this message translates to:
  /// **'Mass-DM spam'**
  String get adminFlagMassDmSpam;

  /// No description provided for @adminFlagRaidLockdown.
  ///
  /// In en, this message translates to:
  /// **'Raid lockdown'**
  String get adminFlagRaidLockdown;

  /// No description provided for @adminFlagBotBehavior.
  ///
  /// In en, this message translates to:
  /// **'Bot-like behavior'**
  String get adminFlagBotBehavior;

  /// No description provided for @adminFlagChannelFlooding.
  ///
  /// In en, this message translates to:
  /// **'Channel flooding'**
  String get adminFlagChannelFlooding;

  /// No description provided for @adminAutoEscalatedBadge.
  ///
  /// In en, this message translates to:
  /// **'AUTO-ESCALATED'**
  String get adminAutoEscalatedBadge;

  /// No description provided for @adminConfidenceLabel.
  ///
  /// In en, this message translates to:
  /// **'Confidence: {score}% ({label})'**
  String adminConfidenceLabel(String score, String label);

  /// No description provided for @adminFlagUserLine.
  ///
  /// In en, this message translates to:
  /// **'User: {userId}'**
  String adminFlagUserLine(String userId);

  /// No description provided for @adminFlagServerLine.
  ///
  /// In en, this message translates to:
  /// **'Server: {serverId}'**
  String adminFlagServerLine(String serverId);

  /// No description provided for @adminMutedJoiners.
  ///
  /// In en, this message translates to:
  /// **'{mutedCount} of {totalJoiners} joiners still muted'**
  String adminMutedJoiners(int mutedCount, int totalJoiners);

  /// No description provided for @adminNoJoinersMuted.
  ///
  /// In en, this message translates to:
  /// **'No joiners currently muted'**
  String get adminNoJoinersMuted;

  /// No description provided for @adminRestrictedUntil.
  ///
  /// In en, this message translates to:
  /// **'Currently restricted until {until}'**
  String adminRestrictedUntil(String until);

  /// No description provided for @adminNotCurrentlyRestricted.
  ///
  /// In en, this message translates to:
  /// **'Not currently restricted'**
  String get adminNotCurrentlyRestricted;

  /// No description provided for @adminDismissUndoButton.
  ///
  /// In en, this message translates to:
  /// **'Dismiss & Undo'**
  String get adminDismissUndoButton;

  /// No description provided for @adminConfirmRestrictButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm & Restrict'**
  String get adminConfirmRestrictButton;

  /// No description provided for @adminDeleteArticleTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete article?'**
  String get adminDeleteArticleTitle;

  /// No description provided for @adminDeleteArticleBody.
  ///
  /// In en, this message translates to:
  /// **'\"{title}\" will be removed from Visp\'s knowledge base.'**
  String adminDeleteArticleBody(String title);

  /// No description provided for @adminNewArticleTitle.
  ///
  /// In en, this message translates to:
  /// **'New Article'**
  String get adminNewArticleTitle;

  /// No description provided for @adminEditArticleTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Article'**
  String get adminEditArticleTitle;

  /// No description provided for @adminArticleTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get adminArticleTitleHint;

  /// No description provided for @adminArticleContentHint.
  ///
  /// In en, this message translates to:
  /// **'Article content (markdown)'**
  String get adminArticleContentHint;

  /// No description provided for @adminWikiArticlesHeader.
  ///
  /// In en, this message translates to:
  /// **'Wiki Articles'**
  String get adminWikiArticlesHeader;

  /// No description provided for @adminNoArticlesYet.
  ///
  /// In en, this message translates to:
  /// **'No articles yet'**
  String get adminNoArticlesYet;

  /// No description provided for @adminEditArticleTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit article'**
  String get adminEditArticleTooltip;

  /// No description provided for @adminDeleteArticleTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete article'**
  String get adminDeleteArticleTooltip;

  /// No description provided for @adminSearchServersHint.
  ///
  /// In en, this message translates to:
  /// **'Search servers by name...'**
  String get adminSearchServersHint;

  /// No description provided for @adminSearchServersPrompt.
  ///
  /// In en, this message translates to:
  /// **'Search for a server above'**
  String get adminSearchServersPrompt;

  /// No description provided for @adminGrantBoostsTitle.
  ///
  /// In en, this message translates to:
  /// **'Grant boosts to {serverName}'**
  String adminGrantBoostsTitle(String serverName);

  /// No description provided for @adminNumBoostsHint.
  ///
  /// In en, this message translates to:
  /// **'Number of boosts'**
  String get adminNumBoostsHint;

  /// No description provided for @adminGrantButton.
  ///
  /// In en, this message translates to:
  /// **'Grant'**
  String get adminGrantButton;

  /// No description provided for @adminPositiveNumberError.
  ///
  /// In en, this message translates to:
  /// **'Enter a positive whole number.'**
  String get adminPositiveNumberError;

  /// No description provided for @adminGrantBoostsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to grant boosts.'**
  String get adminGrantBoostsFailed;

  /// No description provided for @adminBoostsGranted.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{Granted {count} boost to {serverName} -- now level {level} ({activeCount} active).} other{Granted {count} boosts to {serverName} -- now level {level} ({activeCount} active).}}'**
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount);

  /// No description provided for @adminMemberCountLabel.
  ///
  /// In en, this message translates to:
  /// **'{count} members'**
  String adminMemberCountLabel(int count);

  /// No description provided for @adminGrantBoostsButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Grant Boosts'**
  String get adminGrantBoostsButtonLabel;

  /// No description provided for @parentalDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get parentalDashboardTitle;

  /// No description provided for @parentalDashboardCreateChildTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Child Account'**
  String get parentalDashboardCreateChildTitle;

  /// No description provided for @parentalDashboardUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get parentalDashboardUsernameHint;

  /// No description provided for @parentalDashboardEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get parentalDashboardEmailHint;

  /// No description provided for @parentalDashboardPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get parentalDashboardPasswordHint;

  /// No description provided for @parentalDashboardCreateChildExplanation.
  ///
  /// In en, this message translates to:
  /// **'This creates a fully supervised account: labeled channels are blocked, and you\'ll be able to set allowed hours and see (but not read) their friends and servers.'**
  String get parentalDashboardCreateChildExplanation;

  /// No description provided for @parentalDashboardValidationError.
  ///
  /// In en, this message translates to:
  /// **'Username, email, and an 8+ character password are required.'**
  String get parentalDashboardValidationError;

  /// No description provided for @parentalDashboardCreateChildFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not create child account -- username/email may already be taken.'**
  String get parentalDashboardCreateChildFailed;

  /// No description provided for @parentalDashboardCreatingLabel.
  ///
  /// In en, this message translates to:
  /// **'Creating...'**
  String get parentalDashboardCreatingLabel;

  /// No description provided for @parentalDashboardNoChildren.
  ///
  /// In en, this message translates to:
  /// **'No linked accounts yet.'**
  String get parentalDashboardNoChildren;

  /// No description provided for @parentalDashboardSupervisedLabel.
  ///
  /// In en, this message translates to:
  /// **'Supervised account'**
  String get parentalDashboardSupervisedLabel;

  /// No description provided for @parentalDashboardUnknownUser.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get parentalDashboardUnknownUser;

  /// No description provided for @childDetailFallbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Child account'**
  String get childDetailFallbackTitle;

  /// No description provided for @childDetailTabFriends.
  ///
  /// In en, this message translates to:
  /// **'Friends'**
  String get childDetailTabFriends;

  /// No description provided for @childDetailTabServers.
  ///
  /// In en, this message translates to:
  /// **'Servers'**
  String get childDetailTabServers;

  /// No description provided for @childDetailTabSchedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get childDetailTabSchedule;

  /// No description provided for @childDetailTabOverride.
  ///
  /// In en, this message translates to:
  /// **'Override'**
  String get childDetailTabOverride;

  /// No description provided for @childDetailNoFriends.
  ///
  /// In en, this message translates to:
  /// **'No friends.'**
  String get childDetailNoFriends;

  /// No description provided for @childDetailUnknownUser.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get childDetailUnknownUser;

  /// No description provided for @childDetailRemoveFriendTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove friend'**
  String get childDetailRemoveFriendTooltip;

  /// No description provided for @childDetailNoServers.
  ///
  /// In en, this message translates to:
  /// **'Not in any servers.'**
  String get childDetailNoServers;

  /// No description provided for @childDetailMemberCount.
  ///
  /// In en, this message translates to:
  /// **'{count} members'**
  String childDetailMemberCount(int count);

  /// No description provided for @childDetailRemoveServerTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove from server'**
  String get childDetailRemoveServerTooltip;

  /// No description provided for @childDetailRestrictAccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Restrict access to set hours'**
  String get childDetailRestrictAccessTitle;

  /// No description provided for @childDetailRestrictAccessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Off means unrestricted access at any time'**
  String get childDetailRestrictAccessSubtitle;

  /// No description provided for @childDetailTimezoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Timezone'**
  String get childDetailTimezoneLabel;

  /// No description provided for @childDetailMonday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get childDetailMonday;

  /// No description provided for @childDetailTuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get childDetailTuesday;

  /// No description provided for @childDetailWednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get childDetailWednesday;

  /// No description provided for @childDetailThursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get childDetailThursday;

  /// No description provided for @childDetailFriday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get childDetailFriday;

  /// No description provided for @childDetailSaturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get childDetailSaturday;

  /// No description provided for @childDetailSunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get childDetailSunday;

  /// No description provided for @childDetailNoAccessLabel.
  ///
  /// In en, this message translates to:
  /// **'No access'**
  String get childDetailNoAccessLabel;

  /// No description provided for @childDetailToLabel.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get childDetailToLabel;

  /// No description provided for @childDetailSavingLabel.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get childDetailSavingLabel;

  /// No description provided for @childDetailSaveScheduleButton.
  ///
  /// In en, this message translates to:
  /// **'Save Schedule'**
  String get childDetailSaveScheduleButton;

  /// No description provided for @childDetailScheduleSaved.
  ///
  /// In en, this message translates to:
  /// **'Schedule saved.'**
  String get childDetailScheduleSaved;

  /// No description provided for @childDetailOverrideExplanation.
  ///
  /// In en, this message translates to:
  /// **'Grant temporary access outside the normal schedule -- useful for a one-off exception without changing the weekly schedule.'**
  String get childDetailOverrideExplanation;

  /// No description provided for @childDetailReasonHint.
  ///
  /// In en, this message translates to:
  /// **'Reason (optional)'**
  String get childDetailReasonHint;

  /// No description provided for @childDetailPlusMinutes.
  ///
  /// In en, this message translates to:
  /// **'+{minutes} min'**
  String childDetailPlusMinutes(int minutes);

  /// No description provided for @childDetailPlusHours.
  ///
  /// In en, this message translates to:
  /// **'+{hours}h'**
  String childDetailPlusHours(int hours);

  /// No description provided for @childDetailRevokeOverrideButton.
  ///
  /// In en, this message translates to:
  /// **'Revoke Active Override'**
  String get childDetailRevokeOverrideButton;

  /// No description provided for @childDetailAccessGranted.
  ///
  /// In en, this message translates to:
  /// **'Temporary access granted.'**
  String get childDetailAccessGranted;

  /// No description provided for @childDetailOverrideRevoked.
  ///
  /// In en, this message translates to:
  /// **'Override revoked.'**
  String get childDetailOverrideRevoked;

  /// No description provided for @digitalGoodsTitle.
  ///
  /// In en, this message translates to:
  /// **'Digital Goods'**
  String get digitalGoodsTitle;

  /// No description provided for @digitalGoodsMyProductsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Products'**
  String get digitalGoodsMyProductsTitle;

  /// No description provided for @digitalGoodsManageProductsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Manage this server\'s products'**
  String get digitalGoodsManageProductsTooltip;

  /// No description provided for @digitalGoodsSwitchToBrowseTooltip.
  ///
  /// In en, this message translates to:
  /// **'Switch to Browse'**
  String get digitalGoodsSwitchToBrowseTooltip;

  /// No description provided for @digitalGoodsCreateProductTooltip.
  ///
  /// In en, this message translates to:
  /// **'Create product'**
  String get digitalGoodsCreateProductTooltip;

  /// No description provided for @digitalGoodsBrowseTab.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get digitalGoodsBrowseTab;

  /// No description provided for @digitalGoodsMyListingsTab.
  ///
  /// In en, this message translates to:
  /// **'My Listings'**
  String get digitalGoodsMyListingsTab;

  /// No description provided for @digitalGoodsMyPurchasesTab.
  ///
  /// In en, this message translates to:
  /// **'My Purchases'**
  String get digitalGoodsMyPurchasesTab;

  /// No description provided for @digitalGoodsNoProductsYet.
  ///
  /// In en, this message translates to:
  /// **'No products yet'**
  String get digitalGoodsNoProductsYet;

  /// No description provided for @digitalGoodsNoProductsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No products available'**
  String get digitalGoodsNoProductsAvailable;

  /// No description provided for @digitalGoodsCreateFirstProductHint.
  ///
  /// In en, this message translates to:
  /// **'Create your first product to start selling'**
  String get digitalGoodsCreateFirstProductHint;

  /// No description provided for @digitalGoodsCheckBackLater.
  ///
  /// In en, this message translates to:
  /// **'Check back later for digital goods'**
  String get digitalGoodsCheckBackLater;

  /// No description provided for @digitalGoodsCreateProductButton.
  ///
  /// In en, this message translates to:
  /// **'Create Product'**
  String get digitalGoodsCreateProductButton;

  /// No description provided for @digitalGoodsLicenseKeyBadge.
  ///
  /// In en, this message translates to:
  /// **'License Key'**
  String get digitalGoodsLicenseKeyBadge;

  /// No description provided for @digitalGoodsFileBadge.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get digitalGoodsFileBadge;

  /// No description provided for @digitalGoodsAllServersBadge.
  ///
  /// In en, this message translates to:
  /// **'All Servers'**
  String get digitalGoodsAllServersBadge;

  /// No description provided for @digitalGoodsFreeForYou.
  ///
  /// In en, this message translates to:
  /// **'Free for you'**
  String get digitalGoodsFreeForYou;

  /// No description provided for @digitalGoodsFreeLabel.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get digitalGoodsFreeLabel;

  /// No description provided for @digitalGoodsSoldCount.
  ///
  /// In en, this message translates to:
  /// **'{count} sold'**
  String digitalGoodsSoldCount(int count);

  /// No description provided for @digitalGoodsKeysButton.
  ///
  /// In en, this message translates to:
  /// **'Keys'**
  String get digitalGoodsKeysButton;

  /// No description provided for @digitalGoodsGetForFree.
  ///
  /// In en, this message translates to:
  /// **'Get for Free'**
  String get digitalGoodsGetForFree;

  /// No description provided for @digitalGoodsBuyForPrice.
  ///
  /// In en, this message translates to:
  /// **'Buy for {price}'**
  String digitalGoodsBuyForPrice(String price);

  /// No description provided for @digitalGoodsNoPurchasesYet.
  ///
  /// In en, this message translates to:
  /// **'No purchases yet'**
  String get digitalGoodsNoPurchasesYet;

  /// No description provided for @digitalGoodsUnknownProduct.
  ///
  /// In en, this message translates to:
  /// **'Unknown Product'**
  String get digitalGoodsUnknownProduct;

  /// No description provided for @digitalGoodsPurchasedOn.
  ///
  /// In en, this message translates to:
  /// **'Purchased on {date}'**
  String digitalGoodsPurchasedOn(String date);

  /// No description provided for @digitalGoodsCopyKeyTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy key'**
  String get digitalGoodsCopyKeyTooltip;

  /// No description provided for @digitalGoodsLicenseKeyCopied.
  ///
  /// In en, this message translates to:
  /// **'License key copied!'**
  String get digitalGoodsLicenseKeyCopied;

  /// No description provided for @digitalGoodsExpiresOn.
  ///
  /// In en, this message translates to:
  /// **'Expires {date}'**
  String digitalGoodsExpiresOn(String date);

  /// No description provided for @digitalGoodsYourLicenseKeyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your License Key'**
  String get digitalGoodsYourLicenseKeyTitle;

  /// No description provided for @digitalGoodsCopyKeyButton.
  ///
  /// In en, this message translates to:
  /// **'Copy Key'**
  String get digitalGoodsCopyKeyButton;

  /// No description provided for @digitalGoodsCheckoutStripeNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Could not start checkout -- this creator may not have connected Stripe yet.'**
  String get digitalGoodsCheckoutStripeNotConnected;

  /// No description provided for @digitalGoodsPurchaseComplete.
  ///
  /// In en, this message translates to:
  /// **'Purchase complete! Find it under My Purchases.'**
  String get digitalGoodsPurchaseComplete;

  /// No description provided for @digitalGoodsPurchasePending.
  ///
  /// In en, this message translates to:
  /// **'Still waiting on that payment -- it\'ll show up under My Purchases once completed.'**
  String get digitalGoodsPurchasePending;

  /// No description provided for @digitalGoodsCreateProductTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Product'**
  String get digitalGoodsCreateProductTitle;

  /// No description provided for @digitalGoodsEditProductTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get digitalGoodsEditProductTitle;

  /// No description provided for @digitalGoodsProductTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Product title'**
  String get digitalGoodsProductTitleHint;

  /// No description provided for @digitalGoodsDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get digitalGoodsDescriptionHint;

  /// No description provided for @digitalGoodsPriceHint.
  ///
  /// In en, this message translates to:
  /// **'Price in USD (leave empty for free)'**
  String get digitalGoodsPriceHint;

  /// No description provided for @digitalGoodsProductTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Product type'**
  String get digitalGoodsProductTypeLabel;

  /// No description provided for @digitalGoodsFileDownloadOption.
  ///
  /// In en, this message translates to:
  /// **'File download'**
  String get digitalGoodsFileDownloadOption;

  /// No description provided for @digitalGoodsLicenseKeyOption.
  ///
  /// In en, this message translates to:
  /// **'License key'**
  String get digitalGoodsLicenseKeyOption;

  /// No description provided for @digitalGoodsAvailabilityLabel.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get digitalGoodsAvailabilityLabel;

  /// No description provided for @digitalGoodsThisServerOnlyOption.
  ///
  /// In en, this message translates to:
  /// **'This server only'**
  String get digitalGoodsThisServerOnlyOption;

  /// No description provided for @digitalGoodsAllKodaServersOption.
  ///
  /// In en, this message translates to:
  /// **'All Koda servers'**
  String get digitalGoodsAllKodaServersOption;

  /// No description provided for @digitalGoodsAfterCreatingKeysHint.
  ///
  /// In en, this message translates to:
  /// **'After creating, use the \"Keys\" button to upload your license keys.'**
  String get digitalGoodsAfterCreatingKeysHint;

  /// No description provided for @digitalGoodsProductFileLabel.
  ///
  /// In en, this message translates to:
  /// **'Product file'**
  String get digitalGoodsProductFileLabel;

  /// No description provided for @digitalGoodsFileWithSize.
  ///
  /// In en, this message translates to:
  /// **'{fileName} ({sizeMb}MB)'**
  String digitalGoodsFileWithSize(String fileName, String sizeMb);

  /// No description provided for @digitalGoodsRemoveFileTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove file'**
  String get digitalGoodsRemoveFileTooltip;

  /// No description provided for @digitalGoodsUploadingLabel.
  ///
  /// In en, this message translates to:
  /// **'Uploading...'**
  String get digitalGoodsUploadingLabel;

  /// No description provided for @digitalGoodsChooseFileButton.
  ///
  /// In en, this message translates to:
  /// **'Choose File'**
  String get digitalGoodsChooseFileButton;

  /// No description provided for @digitalGoodsReplaceFileButton.
  ///
  /// In en, this message translates to:
  /// **'Replace File'**
  String get digitalGoodsReplaceFileButton;

  /// No description provided for @digitalGoodsChooseFileBeforeSaving.
  ///
  /// In en, this message translates to:
  /// **'Choose a file for this product before saving.'**
  String get digitalGoodsChooseFileBeforeSaving;

  /// No description provided for @digitalGoodsUploadLicenseKeysTitle.
  ///
  /// In en, this message translates to:
  /// **'Upload License Keys'**
  String get digitalGoodsUploadLicenseKeysTitle;

  /// No description provided for @digitalGoodsPasteKeysHint.
  ///
  /// In en, this message translates to:
  /// **'Paste one key per line:'**
  String get digitalGoodsPasteKeysHint;

  /// No description provided for @digitalGoodsKeyExampleHint.
  ///
  /// In en, this message translates to:
  /// **'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...'**
  String get digitalGoodsKeyExampleHint;

  /// No description provided for @digitalGoodsUploadKeysButton.
  ///
  /// In en, this message translates to:
  /// **'Upload Keys'**
  String get digitalGoodsUploadKeysButton;

  /// No description provided for @digitalGoodsLicenseKeysUploaded.
  ///
  /// In en, this message translates to:
  /// **'License keys uploaded!'**
  String get digitalGoodsLicenseKeysUploaded;

  /// No description provided for @serverSubscriptionManageTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Subscriptions'**
  String get serverSubscriptionManageTitle;

  /// No description provided for @serverSubscriptionMemberTitle.
  ///
  /// In en, this message translates to:
  /// **'{serverName} Subscriptions'**
  String serverSubscriptionMemberTitle(String serverName);

  /// No description provided for @serverSubscriptionAddTierTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add tier'**
  String get serverSubscriptionAddTierTooltip;

  /// No description provided for @serverSubscriptionNoTiersYet.
  ///
  /// In en, this message translates to:
  /// **'No subscription tiers yet'**
  String get serverSubscriptionNoTiersYet;

  /// No description provided for @serverSubscriptionCreateUpTo3Tiers.
  ///
  /// In en, this message translates to:
  /// **'Create up to 3 tiers for your community'**
  String get serverSubscriptionCreateUpTo3Tiers;

  /// No description provided for @serverSubscriptionCreateFirstTierButton.
  ///
  /// In en, this message translates to:
  /// **'Create First Tier'**
  String get serverSubscriptionCreateFirstTierButton;

  /// No description provided for @serverSubscriptionShowSubscriberCounts.
  ///
  /// In en, this message translates to:
  /// **'Show subscriber counts'**
  String get serverSubscriptionShowSubscriberCounts;

  /// No description provided for @serverSubscriptionPricePerMonth.
  ///
  /// In en, this message translates to:
  /// **'{price}/mo'**
  String serverSubscriptionPricePerMonth(String price);

  /// No description provided for @serverSubscriptionActiveSubscriberCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} active subscriber} other{{count} active subscribers}}'**
  String serverSubscriptionActiveSubscriberCount(int count);

  /// No description provided for @serverSubscriptionRoleAutoAssigned.
  ///
  /// In en, this message translates to:
  /// **'Role auto-assigned'**
  String get serverSubscriptionRoleAutoAssigned;

  /// No description provided for @serverSubscriptionDiscountPercent.
  ///
  /// In en, this message translates to:
  /// **'{discount}% marketplace discount'**
  String serverSubscriptionDiscountPercent(int discount);

  /// No description provided for @serverSubscriptionNoTiersMember.
  ///
  /// In en, this message translates to:
  /// **'This server has no subscription tiers'**
  String get serverSubscriptionNoTiersMember;

  /// No description provided for @serverSubscriptionActiveSubscriberBadge.
  ///
  /// In en, this message translates to:
  /// **'Active Subscriber'**
  String get serverSubscriptionActiveSubscriberBadge;

  /// No description provided for @serverSubscriptionExpiresOn.
  ///
  /// In en, this message translates to:
  /// **'Expires {date}'**
  String serverSubscriptionExpiresOn(String date);

  /// No description provided for @serverSubscriptionExclusiveRolePerk.
  ///
  /// In en, this message translates to:
  /// **'Exclusive subscriber role'**
  String get serverSubscriptionExclusiveRolePerk;

  /// No description provided for @serverSubscriptionDiscountPerk.
  ///
  /// In en, this message translates to:
  /// **'{discount}% off marketplace purchases'**
  String serverSubscriptionDiscountPerk(int discount);

  /// No description provided for @serverSubscriptionSubscriberOnlyChannelsPerk.
  ///
  /// In en, this message translates to:
  /// **'Subscriber-only channels'**
  String get serverSubscriptionSubscriberOnlyChannelsPerk;

  /// No description provided for @serverSubscriptionCurrentlySubscribed.
  ///
  /// In en, this message translates to:
  /// **'Currently Subscribed'**
  String get serverSubscriptionCurrentlySubscribed;

  /// No description provided for @serverSubscriptionSubscribeForPrice.
  ///
  /// In en, this message translates to:
  /// **'Subscribe for {price}/mo'**
  String serverSubscriptionSubscribeForPrice(String price);

  /// No description provided for @serverSubscriptionCreateTierTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Tier'**
  String get serverSubscriptionCreateTierTitle;

  /// No description provided for @serverSubscriptionEditTierTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Tier'**
  String get serverSubscriptionEditTierTitle;

  /// No description provided for @serverSubscriptionTierNameHint.
  ///
  /// In en, this message translates to:
  /// **'Tier name (e.g. Fan, Supporter, VIP)'**
  String get serverSubscriptionTierNameHint;

  /// No description provided for @serverSubscriptionDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get serverSubscriptionDescriptionHint;

  /// No description provided for @serverSubscriptionPriceHint.
  ///
  /// In en, this message translates to:
  /// **'Price per month (USD)'**
  String get serverSubscriptionPriceHint;

  /// No description provided for @serverSubscriptionDiscountLabel.
  ///
  /// In en, this message translates to:
  /// **'Marketplace discount %'**
  String get serverSubscriptionDiscountLabel;

  /// No description provided for @serverSubscriptionPositionLabel.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get serverSubscriptionPositionLabel;

  /// No description provided for @serverSubscriptionTierOption.
  ///
  /// In en, this message translates to:
  /// **'Tier {position}'**
  String serverSubscriptionTierOption(int position);

  /// No description provided for @serverSubscriptionGrantsRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'Grants role on subscribe — optional'**
  String get serverSubscriptionGrantsRoleLabel;

  /// No description provided for @serverSubscriptionRoleFallback.
  ///
  /// In en, this message translates to:
  /// **'role'**
  String get serverSubscriptionRoleFallback;

  /// No description provided for @serverSubscriptionRoleAutoAssignExplanation.
  ///
  /// In en, this message translates to:
  /// **'Automatically given to a member the moment they subscribe, and taken away the moment their subscription expires.'**
  String get serverSubscriptionRoleAutoAssignExplanation;

  /// No description provided for @serverSubscriptionTierCreatedConnectStripe.
  ///
  /// In en, this message translates to:
  /// **'Tier created -- connect Stripe under Marketplace → Creator before members can subscribe to it.'**
  String get serverSubscriptionTierCreatedConnectStripe;

  /// No description provided for @serverSubscriptionDeleteTierTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Tier'**
  String get serverSubscriptionDeleteTierTitle;

  /// No description provided for @serverSubscriptionDeleteTierConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{tierName}\"? Existing subscribers will keep access until expiry.'**
  String serverSubscriptionDeleteTierConfirm(String tierName);

  /// No description provided for @serverSubscriptionSubscribeToTierTitle.
  ///
  /// In en, this message translates to:
  /// **'Subscribe to {tierName}'**
  String serverSubscriptionSubscribeToTierTitle(String tierName);

  /// No description provided for @serverSubscriptionMonthlySubscriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Monthly subscription'**
  String get serverSubscriptionMonthlySubscriptionLabel;

  /// No description provided for @serverSubscriptionServerBankEarnsLabel.
  ///
  /// In en, this message translates to:
  /// **'Server bank earns'**
  String get serverSubscriptionServerBankEarnsLabel;

  /// No description provided for @serverSubscriptionPointsLabel.
  ///
  /// In en, this message translates to:
  /// **'{points} pts'**
  String serverSubscriptionPointsLabel(int points);

  /// No description provided for @serverSubscriptionPaymentSecureNote.
  ///
  /// In en, this message translates to:
  /// **'Payment processed securely by Stripe'**
  String get serverSubscriptionPaymentSecureNote;

  /// No description provided for @serverSubscriptionSubscribeButton.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get serverSubscriptionSubscribeButton;

  /// No description provided for @serverSubscriptionCheckoutStripeNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Could not start checkout -- this server\'s owner may not have connected Stripe yet.'**
  String get serverSubscriptionCheckoutStripeNotConnected;

  /// No description provided for @serverSubscriptionSubscribed.
  ///
  /// In en, this message translates to:
  /// **'Subscribed!'**
  String get serverSubscriptionSubscribed;

  /// No description provided for @serverSubscriptionSubscriptionPending.
  ///
  /// In en, this message translates to:
  /// **'Still waiting on that payment -- it\'ll activate once completed.'**
  String get serverSubscriptionSubscriptionPending;

  /// No description provided for @tipDialogTipUsernameTitle.
  ///
  /// In en, this message translates to:
  /// **'Tip {username}'**
  String tipDialogTipUsernameTitle(String username);

  /// No description provided for @tipDialogSelectAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Select amount'**
  String get tipDialogSelectAmountLabel;

  /// No description provided for @tipDialogMessageHint.
  ///
  /// In en, this message translates to:
  /// **'Add a message (optional)'**
  String get tipDialogMessageHint;

  /// No description provided for @tipDialogYouPayLabel.
  ///
  /// In en, this message translates to:
  /// **'You pay'**
  String get tipDialogYouPayLabel;

  /// No description provided for @tipDialogUserReceivesLabel.
  ///
  /// In en, this message translates to:
  /// **'{username} receives'**
  String tipDialogUserReceivesLabel(String username);

  /// No description provided for @tipDialogSendTipButton.
  ///
  /// In en, this message translates to:
  /// **'Send Tip'**
  String get tipDialogSendTipButton;

  /// No description provided for @tipDialogFailedToSendTip.
  ///
  /// In en, this message translates to:
  /// **'Failed to send tip. Creator may not be connected to Stripe.'**
  String get tipDialogFailedToSendTip;

  /// No description provided for @tipDialogCouldNotStartCheckout.
  ///
  /// In en, this message translates to:
  /// **'Could not start checkout. Try again in a moment.'**
  String get tipDialogCouldNotStartCheckout;

  /// No description provided for @tipDialogTipSent.
  ///
  /// In en, this message translates to:
  /// **'Tip sent!'**
  String get tipDialogTipSent;

  /// No description provided for @tipDialogTipPending.
  ///
  /// In en, this message translates to:
  /// **'Still waiting on that payment -- it\'ll go through once completed.'**
  String get tipDialogTipPending;

  /// No description provided for @tipDialogUnknownUser.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get tipDialogUnknownUser;

  /// No description provided for @marketplaceTitle.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get marketplaceTitle;

  /// No description provided for @marketplaceCreatorPayoutsTitle.
  ///
  /// In en, this message translates to:
  /// **'Creator Payouts'**
  String get marketplaceCreatorPayoutsTitle;

  /// No description provided for @marketplaceReceiveTipsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Receive tips directly via Stripe'**
  String get marketplaceReceiveTipsSubtitle;

  /// No description provided for @marketplaceTabServerBank.
  ///
  /// In en, this message translates to:
  /// **'Server Bank'**
  String get marketplaceTabServerBank;

  /// No description provided for @marketplaceTabDigitalGoods.
  ///
  /// In en, this message translates to:
  /// **'Digital Goods'**
  String get marketplaceTabDigitalGoods;

  /// No description provided for @marketplaceTabMerch.
  ///
  /// In en, this message translates to:
  /// **'Merch'**
  String get marketplaceTabMerch;

  /// No description provided for @marketplaceTabSubscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get marketplaceTabSubscription;

  /// No description provided for @marketplaceTabRevenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get marketplaceTabRevenue;

  /// No description provided for @marketplaceSelectServerSubscription.
  ///
  /// In en, this message translates to:
  /// **'Select a server to view its subscription'**
  String get marketplaceSelectServerSubscription;

  /// No description provided for @marketplaceSelectServerBank.
  ///
  /// In en, this message translates to:
  /// **'Select a server to view its bank'**
  String get marketplaceSelectServerBank;

  /// No description provided for @marketplaceSelectServerRevenue.
  ///
  /// In en, this message translates to:
  /// **'Select a server to view its revenue'**
  String get marketplaceSelectServerRevenue;

  /// No description provided for @marketplaceStripeAccountStatus.
  ///
  /// In en, this message translates to:
  /// **'Stripe account'**
  String get marketplaceStripeAccountStatus;

  /// No description provided for @marketplaceOnboardingCompleteStatus.
  ///
  /// In en, this message translates to:
  /// **'Onboarding complete'**
  String get marketplaceOnboardingCompleteStatus;

  /// No description provided for @marketplaceAcceptingPaymentsStatus.
  ///
  /// In en, this message translates to:
  /// **'Accepting payments'**
  String get marketplaceAcceptingPaymentsStatus;

  /// No description provided for @marketplaceConnectStripeButton.
  ///
  /// In en, this message translates to:
  /// **'Connect Stripe Account'**
  String get marketplaceConnectStripeButton;

  /// No description provided for @marketplaceCompleteStripeOnboardingButton.
  ///
  /// In en, this message translates to:
  /// **'Complete Stripe Onboarding'**
  String get marketplaceCompleteStripeOnboardingButton;

  /// No description provided for @marketplaceRefreshStatusButton.
  ///
  /// In en, this message translates to:
  /// **'Refresh Status'**
  String get marketplaceRefreshStatusButton;

  /// No description provided for @marketplaceReadyToReceiveTips.
  ///
  /// In en, this message translates to:
  /// **'You\'re ready to receive tips!'**
  String get marketplaceReadyToReceiveTips;

  /// No description provided for @marketplaceHowItWorksTitle.
  ///
  /// In en, this message translates to:
  /// **'How it works'**
  String get marketplaceHowItWorksTitle;

  /// No description provided for @marketplaceHowItWorksStep1.
  ///
  /// In en, this message translates to:
  /// **'Connect your Stripe account'**
  String get marketplaceHowItWorksStep1;

  /// No description provided for @marketplaceHowItWorksStep2.
  ///
  /// In en, this message translates to:
  /// **'Complete identity verification'**
  String get marketplaceHowItWorksStep2;

  /// No description provided for @marketplaceHowItWorksStep3.
  ///
  /// In en, this message translates to:
  /// **'Receive tips directly to your bank'**
  String get marketplaceHowItWorksStep3;

  /// No description provided for @marketplaceProcessingFeeNote.
  ///
  /// In en, this message translates to:
  /// **'Koda charges a 5% processing fee. The fee goes to your server\'s bank as points.'**
  String get marketplaceProcessingFeeNote;

  /// No description provided for @marketplaceOnlyManagersCanViewBank.
  ///
  /// In en, this message translates to:
  /// **'Only the server owner or someone with the Manage Marketplace permission can view the Server Bank.'**
  String get marketplaceOnlyManagersCanViewBank;

  /// No description provided for @marketplaceServerBoosted.
  ///
  /// In en, this message translates to:
  /// **'{serverName} boosted!'**
  String marketplaceServerBoosted(String serverName);

  /// No description provided for @marketplaceEmojiSlotsText.
  ///
  /// In en, this message translates to:
  /// **'{limit} custom emoji slots'**
  String marketplaceEmojiSlotsText(int limit);

  /// No description provided for @marketplaceServerFallback.
  ///
  /// In en, this message translates to:
  /// **'Server'**
  String get marketplaceServerFallback;

  /// No description provided for @marketplacePointsBalance.
  ///
  /// In en, this message translates to:
  /// **'{balance} pts'**
  String marketplacePointsBalance(int balance);

  /// No description provided for @marketplaceInActivity.
  ///
  /// In en, this message translates to:
  /// **'{amount} in activity'**
  String marketplaceInActivity(String amount);

  /// No description provided for @marketplacePointsEarnedExplanation.
  ///
  /// In en, this message translates to:
  /// **'Points are earned from the 5% processing fee on tips and subscriptions in this server. Use points to unlock server upgrades.'**
  String get marketplacePointsEarnedExplanation;

  /// No description provided for @marketplaceServerBoostsTitle.
  ///
  /// In en, this message translates to:
  /// **'Server Boosts'**
  String get marketplaceServerBoostsTitle;

  /// No description provided for @marketplaceLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String marketplaceLevelLabel(int level);

  /// No description provided for @marketplaceActiveBoostsSummary.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} active boost} other{{count} active boosts}} -- {emojiSlots}'**
  String marketplaceActiveBoostsSummary(int count, String emojiSlots);

  /// No description provided for @marketplaceMoreBoostsToReachLevel.
  ///
  /// In en, this message translates to:
  /// **'{more, plural, one{{more} more boost to reach level {level}} other{{more} more boosts to reach level {level}}}'**
  String marketplaceMoreBoostsToReachLevel(int more, int level);

  /// No description provided for @marketplaceUnlockBackgroundSuffix.
  ///
  /// In en, this message translates to:
  /// **' and unlock a custom server background'**
  String get marketplaceUnlockBackgroundSuffix;

  /// No description provided for @marketplaceUnlockIconBorderSuffix.
  ///
  /// In en, this message translates to:
  /// **' and unlock a custom server icon border'**
  String get marketplaceUnlockIconBorderSuffix;

  /// No description provided for @marketplaceYouHaveBoostTokens.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{You have {count} boost token available.} other{You have {count} boost tokens available.}}'**
  String marketplaceYouHaveBoostTokens(int count);

  /// No description provided for @marketplaceBoostTokensFromPulse.
  ///
  /// In en, this message translates to:
  /// **'Boost tokens come from a Pulse subscription (1/month). Subscribe on the Subscriptions tab to earn one.'**
  String get marketplaceBoostTokensFromPulse;

  /// No description provided for @marketplaceBoostingLabel.
  ///
  /// In en, this message translates to:
  /// **'Boosting...'**
  String get marketplaceBoostingLabel;

  /// No description provided for @marketplaceBoostThisServerButton.
  ///
  /// In en, this message translates to:
  /// **'Boost This Server'**
  String get marketplaceBoostThisServerButton;

  /// No description provided for @marketplaceComingSoonUpgradesTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming soon — Server upgrades'**
  String get marketplaceComingSoonUpgradesTitle;

  /// No description provided for @marketplaceSpendPointsList.
  ///
  /// In en, this message translates to:
  /// **'Spend server bank points on:\n• Custom server domain\n• Increased member limit\n• Priority support\n• Exclusive server badge'**
  String get marketplaceSpendPointsList;

  /// No description provided for @marketplaceSourceTip.
  ///
  /// In en, this message translates to:
  /// **'Tips'**
  String get marketplaceSourceTip;

  /// No description provided for @marketplaceSourceSubscription.
  ///
  /// In en, this message translates to:
  /// **'Koda Subscriptions'**
  String get marketplaceSourceSubscription;

  /// No description provided for @marketplaceSourceServerSubscription.
  ///
  /// In en, this message translates to:
  /// **'Server Subscriptions'**
  String get marketplaceSourceServerSubscription;

  /// No description provided for @marketplaceSourceDigitalProduct.
  ///
  /// In en, this message translates to:
  /// **'Digital Goods'**
  String get marketplaceSourceDigitalProduct;

  /// No description provided for @marketplaceSourceStageTicket.
  ///
  /// In en, this message translates to:
  /// **'Stage Tickets'**
  String get marketplaceSourceStageTicket;

  /// No description provided for @marketplaceSourcePrintfulOrder.
  ///
  /// In en, this message translates to:
  /// **'Merch Orders'**
  String get marketplaceSourcePrintfulOrder;

  /// No description provided for @marketplaceJustNow.
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get marketplaceJustNow;

  /// No description provided for @marketplaceMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m ago'**
  String marketplaceMinutesAgo(int minutes);

  /// No description provided for @marketplaceHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours}h ago'**
  String marketplaceHoursAgo(int hours);

  /// No description provided for @marketplaceDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days}d ago'**
  String marketplaceDaysAgo(int days);

  /// No description provided for @marketplaceOnlyManagersCanViewRevenue.
  ///
  /// In en, this message translates to:
  /// **'Only members who can manage the marketplace can view this server\'s revenue.'**
  String get marketplaceOnlyManagersCanViewRevenue;

  /// No description provided for @marketplaceBalanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get marketplaceBalanceLabel;

  /// No description provided for @marketplaceLifetimeEarnedLabel.
  ///
  /// In en, this message translates to:
  /// **'Lifetime Earned'**
  String get marketplaceLifetimeEarnedLabel;

  /// No description provided for @marketplaceLast30DaysTitle.
  ///
  /// In en, this message translates to:
  /// **'Last 30 Days'**
  String get marketplaceLast30DaysTitle;

  /// No description provided for @marketplaceRevenueBySourceTitle.
  ///
  /// In en, this message translates to:
  /// **'Revenue by Source'**
  String get marketplaceRevenueBySourceTitle;

  /// No description provided for @marketplaceNoRevenueYet.
  ///
  /// In en, this message translates to:
  /// **'No revenue yet.'**
  String get marketplaceNoRevenueYet;

  /// No description provided for @marketplaceTransactionCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} transaction} other{{count} transactions}}'**
  String marketplaceTransactionCount(int count);

  /// No description provided for @marketplaceRecentTransactionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get marketplaceRecentTransactionsTitle;

  /// No description provided for @marketplaceNoTransactionsYet.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet.'**
  String get marketplaceNoTransactionsYet;

  /// No description provided for @marketplaceNoActivityYet.
  ///
  /// In en, this message translates to:
  /// **'No activity yet'**
  String get marketplaceNoActivityYet;

  /// No description provided for @marketplaceBarTooltipWithAmount.
  ///
  /// In en, this message translates to:
  /// **'{date}: {amount}'**
  String marketplaceBarTooltipWithAmount(String date, String amount);

  /// No description provided for @printfulMerchSyncedCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{Synced {count} product from Printful} other{Synced {count} products from Printful}}'**
  String printfulMerchSyncedCount(int count);

  /// No description provided for @printfulMerchSyncFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not sync with Printful -- check the connection in Merch settings.'**
  String get printfulMerchSyncFailed;

  /// No description provided for @printfulMerchSelectServer.
  ///
  /// In en, this message translates to:
  /// **'Select a server to view its merch'**
  String get printfulMerchSelectServer;

  /// No description provided for @printfulMerchManageCatalogTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Merch Catalog'**
  String get printfulMerchManageCatalogTitle;

  /// No description provided for @printfulMerchTitle.
  ///
  /// In en, this message translates to:
  /// **'Merch'**
  String get printfulMerchTitle;

  /// No description provided for @printfulMerchSyncingLabel.
  ///
  /// In en, this message translates to:
  /// **'Syncing...'**
  String get printfulMerchSyncingLabel;

  /// No description provided for @printfulMerchSyncCatalogButton.
  ///
  /// In en, this message translates to:
  /// **'Sync Catalog'**
  String get printfulMerchSyncCatalogButton;

  /// No description provided for @printfulMerchSwitchToBrowseTooltip.
  ///
  /// In en, this message translates to:
  /// **'Switch to Browse'**
  String get printfulMerchSwitchToBrowseTooltip;

  /// No description provided for @printfulMerchManageTooltip.
  ///
  /// In en, this message translates to:
  /// **'Manage this server\'s merch'**
  String get printfulMerchManageTooltip;

  /// No description provided for @printfulMerchNothingSyncedYet.
  ///
  /// In en, this message translates to:
  /// **'Nothing synced yet'**
  String get printfulMerchNothingSyncedYet;

  /// No description provided for @printfulMerchNoMerchAvailable.
  ///
  /// In en, this message translates to:
  /// **'No merch available yet'**
  String get printfulMerchNoMerchAvailable;

  /// No description provided for @printfulMerchSyncHint.
  ///
  /// In en, this message translates to:
  /// **'Sync your Printful store to pull in your product catalog'**
  String get printfulMerchSyncHint;

  /// No description provided for @printfulMerchCheckBackLater.
  ///
  /// In en, this message translates to:
  /// **'Check back later for merch from this server'**
  String get printfulMerchCheckBackLater;

  /// No description provided for @printfulMerchOutOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of stock'**
  String get printfulMerchOutOfStock;

  /// No description provided for @printfulMerchFromPriceOptions.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{From {price} • {count} option} other{From {price} • {count} options}}'**
  String printfulMerchFromPriceOptions(String price, int count);

  /// No description provided for @printfulMerchViewButton.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get printfulMerchViewButton;

  /// No description provided for @printfulMerchPayoutTo.
  ///
  /// In en, this message translates to:
  /// **'Payout to: {username}'**
  String printfulMerchPayoutTo(String username);

  /// No description provided for @printfulMerchPayoutToYou.
  ///
  /// In en, this message translates to:
  /// **'Payout to: you'**
  String get printfulMerchPayoutToYou;

  /// No description provided for @printfulMerchPayoutChangeButton.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get printfulMerchPayoutChangeButton;

  /// No description provided for @printfulMerchPayoutDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Payout Recipient'**
  String get printfulMerchPayoutDialogTitle;

  /// No description provided for @printfulMerchPayoutDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Route this item\'s share of order proceeds to another user instead of yourself -- they\'ll need their own Stripe account connected and onboarded before anyone can buy it.'**
  String get printfulMerchPayoutDialogBody;

  /// No description provided for @printfulMerchPayoutUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get printfulMerchPayoutUsernameHint;

  /// No description provided for @printfulMerchPayoutLookupButton.
  ///
  /// In en, this message translates to:
  /// **'Look Up'**
  String get printfulMerchPayoutLookupButton;

  /// No description provided for @printfulMerchPayoutUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'No user found with that username.'**
  String get printfulMerchPayoutUserNotFound;

  /// No description provided for @printfulMerchPayoutResolvedAs.
  ///
  /// In en, this message translates to:
  /// **'Found: {username}'**
  String printfulMerchPayoutResolvedAs(String username);

  /// No description provided for @printfulMerchPayoutResetButton.
  ///
  /// In en, this message translates to:
  /// **'Reset to Me'**
  String get printfulMerchPayoutResetButton;

  /// No description provided for @printfulMerchCartTooltip.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get printfulMerchCartTooltip;

  /// No description provided for @printfulMerchAddedToCart.
  ///
  /// In en, this message translates to:
  /// **'Added {productName} to cart'**
  String printfulMerchAddedToCart(String productName);

  /// No description provided for @printfulMerchQuantityLabel.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get printfulMerchQuantityLabel;

  /// No description provided for @printfulMerchDecreaseQuantityTooltip.
  ///
  /// In en, this message translates to:
  /// **'Decrease quantity'**
  String get printfulMerchDecreaseQuantityTooltip;

  /// No description provided for @printfulMerchIncreaseQuantityTooltip.
  ///
  /// In en, this message translates to:
  /// **'Increase quantity'**
  String get printfulMerchIncreaseQuantityTooltip;

  /// No description provided for @printfulMerchAddToCartButton.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get printfulMerchAddToCartButton;

  /// No description provided for @printfulMerchOptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Option'**
  String get printfulMerchOptionLabel;

  /// No description provided for @printfulMerchVariantPriceOption.
  ///
  /// In en, this message translates to:
  /// **'{name} -- {price}'**
  String printfulMerchVariantPriceOption(String name, String price);

  /// No description provided for @printfulMerchStyleLabel.
  ///
  /// In en, this message translates to:
  /// **'Style'**
  String get printfulMerchStyleLabel;

  /// No description provided for @printfulMerchSizeLabel.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get printfulMerchSizeLabel;

  /// No description provided for @printfulMerchYourCartTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Cart'**
  String get printfulMerchYourCartTitle;

  /// No description provided for @printfulMerchCartEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty.'**
  String get printfulMerchCartEmpty;

  /// No description provided for @printfulMerchSubtotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get printfulMerchSubtotalLabel;

  /// No description provided for @printfulMerchCheckoutLabel.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get printfulMerchCheckoutLabel;

  /// No description provided for @printfulMerchRemoveFromCartTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove from cart'**
  String get printfulMerchRemoveFromCartTooltip;

  /// No description provided for @printfulMerchFillShippingAddressFirst.
  ///
  /// In en, this message translates to:
  /// **'Fill in your shipping address first.'**
  String get printfulMerchFillShippingAddressFirst;

  /// No description provided for @printfulMerchCouldNotGetShippingRates.
  ///
  /// In en, this message translates to:
  /// **'Could not get shipping rates for that address.'**
  String get printfulMerchCouldNotGetShippingRates;

  /// No description provided for @printfulMerchCouldNotStartCheckout.
  ///
  /// In en, this message translates to:
  /// **'Could not start checkout. Try again in a moment.'**
  String get printfulMerchCouldNotStartCheckout;

  /// No description provided for @printfulMerchOrderPlaced.
  ///
  /// In en, this message translates to:
  /// **'Order placed!'**
  String get printfulMerchOrderPlaced;

  /// No description provided for @printfulMerchOrderPending.
  ///
  /// In en, this message translates to:
  /// **'Still waiting on that payment -- it\'ll be placed once completed.'**
  String get printfulMerchOrderPending;

  /// No description provided for @printfulMerchShippingSpeedLabel.
  ///
  /// In en, this message translates to:
  /// **'Shipping speed'**
  String get printfulMerchShippingSpeedLabel;

  /// No description provided for @printfulMerchBusinessDaysRange.
  ///
  /// In en, this message translates to:
  /// **'{min}-{max} business days'**
  String printfulMerchBusinessDaysRange(int min, int max);

  /// No description provided for @printfulMerchGetShippingQuoteButton.
  ///
  /// In en, this message translates to:
  /// **'Get Shipping Quote'**
  String get printfulMerchGetShippingQuoteButton;

  /// No description provided for @printfulMerchPayButton.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get printfulMerchPayButton;

  /// No description provided for @kodaMarketplaceTitle.
  ///
  /// In en, this message translates to:
  /// **'Koda Marketplace'**
  String get kodaMarketplaceTitle;

  /// No description provided for @kodaMarketplaceTabSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get kodaMarketplaceTabSubscriptions;

  /// No description provided for @kodaMarketplaceTabBoosts.
  ///
  /// In en, this message translates to:
  /// **'Boosts'**
  String get kodaMarketplaceTabBoosts;

  /// No description provided for @kodaMarketplaceTabDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get kodaMarketplaceTabDiscover;

  /// No description provided for @kodaMarketplaceTierFreeName.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get kodaMarketplaceTierFreeName;

  /// No description provided for @kodaMarketplaceTierSparkName.
  ///
  /// In en, this message translates to:
  /// **'Spark'**
  String get kodaMarketplaceTierSparkName;

  /// No description provided for @kodaMarketplaceTierPulseName.
  ///
  /// In en, this message translates to:
  /// **'Pulse'**
  String get kodaMarketplaceTierPulseName;

  /// No description provided for @kodaMarketplaceExpiresOn.
  ///
  /// In en, this message translates to:
  /// **'Expires {date}'**
  String kodaMarketplaceExpiresOn(String date);

  /// No description provided for @kodaMarketplaceUpgradeForPerks.
  ///
  /// In en, this message translates to:
  /// **'Upgrade for exclusive perks'**
  String get kodaMarketplaceUpgradeForPerks;

  /// No description provided for @kodaMarketplaceBoostTokensAvailable.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} boost token available} other{{count} boost tokens available}}'**
  String kodaMarketplaceBoostTokensAvailable(int count);

  /// No description provided for @kodaMarketplaceGiftTokenHint.
  ///
  /// In en, this message translates to:
  /// **'Gift a token to any server you\'re in from its Server Bank tab'**
  String get kodaMarketplaceGiftTokenHint;

  /// No description provided for @kodaMarketplaceSparkPerkAvatarFrame.
  ///
  /// In en, this message translates to:
  /// **'Custom avatar frame'**
  String get kodaMarketplaceSparkPerkAvatarFrame;

  /// No description provided for @kodaMarketplaceSparkPerkBadge.
  ///
  /// In en, this message translates to:
  /// **'Spark badge on profile'**
  String get kodaMarketplaceSparkPerkBadge;

  /// No description provided for @kodaMarketplaceSparkPerkFileLimit.
  ///
  /// In en, this message translates to:
  /// **'Increased file upload limit (50MB)'**
  String get kodaMarketplaceSparkPerkFileLimit;

  /// No description provided for @kodaMarketplaceSparkPerkVoiceQuality.
  ///
  /// In en, this message translates to:
  /// **'Priority voice quality'**
  String get kodaMarketplaceSparkPerkVoiceQuality;

  /// No description provided for @kodaMarketplacePulsePerkEverythingInSpark.
  ///
  /// In en, this message translates to:
  /// **'Everything in Spark'**
  String get kodaMarketplacePulsePerkEverythingInSpark;

  /// No description provided for @kodaMarketplacePulsePerkAnimatedFrame.
  ///
  /// In en, this message translates to:
  /// **'Animated avatar frame'**
  String get kodaMarketplacePulsePerkAnimatedFrame;

  /// No description provided for @kodaMarketplacePulsePerkBadge.
  ///
  /// In en, this message translates to:
  /// **'Pulse badge on profile'**
  String get kodaMarketplacePulsePerkBadge;

  /// No description provided for @kodaMarketplacePulsePerkFileLimit.
  ///
  /// In en, this message translates to:
  /// **'100MB file upload limit'**
  String get kodaMarketplacePulsePerkFileLimit;

  /// No description provided for @kodaMarketplacePulsePerkBoostToken.
  ///
  /// In en, this message translates to:
  /// **'1 server boost token per month'**
  String get kodaMarketplacePulsePerkBoostToken;

  /// No description provided for @kodaMarketplacePricePerMonth.
  ///
  /// In en, this message translates to:
  /// **'{price}/mo'**
  String kodaMarketplacePricePerMonth(String price);

  /// No description provided for @kodaMarketplaceCurrentPlanLabel.
  ///
  /// In en, this message translates to:
  /// **'Current Plan'**
  String get kodaMarketplaceCurrentPlanLabel;

  /// No description provided for @kodaMarketplaceGetTierButton.
  ///
  /// In en, this message translates to:
  /// **'Get {name}'**
  String kodaMarketplaceGetTierButton(String name);

  /// No description provided for @kodaMarketplaceGiftTierButton.
  ///
  /// In en, this message translates to:
  /// **'Gift {name}'**
  String kodaMarketplaceGiftTierButton(String name);

  /// No description provided for @kodaMarketplaceGiftTierTitle.
  ///
  /// In en, this message translates to:
  /// **'Gift {tier}'**
  String kodaMarketplaceGiftTierTitle(String tier);

  /// No description provided for @kodaMarketplaceSubscribeTierTitle.
  ///
  /// In en, this message translates to:
  /// **'Subscribe to {tier}'**
  String kodaMarketplaceSubscribeTierTitle(String tier);

  /// No description provided for @kodaMarketplaceGiftUsernameLabel.
  ///
  /// In en, this message translates to:
  /// **'Gift username:'**
  String get kodaMarketplaceGiftUsernameLabel;

  /// No description provided for @kodaMarketplaceUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get kodaMarketplaceUsernameHint;

  /// No description provided for @kodaMarketplaceSubscriptionRowLabel.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get kodaMarketplaceSubscriptionRowLabel;

  /// No description provided for @kodaMarketplaceTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get kodaMarketplaceTotalLabel;

  /// No description provided for @kodaMarketplacePaymentSecureNote.
  ///
  /// In en, this message translates to:
  /// **'Payment processed securely by Stripe'**
  String get kodaMarketplacePaymentSecureNote;

  /// No description provided for @kodaMarketplaceProceedToPaymentButton.
  ///
  /// In en, this message translates to:
  /// **'Proceed to Payment'**
  String get kodaMarketplaceProceedToPaymentButton;

  /// No description provided for @kodaMarketplaceUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get kodaMarketplaceUserNotFound;

  /// No description provided for @kodaMarketplaceCouldNotStartCheckout.
  ///
  /// In en, this message translates to:
  /// **'Could not start checkout. Try again in a moment.'**
  String get kodaMarketplaceCouldNotStartCheckout;

  /// No description provided for @kodaMarketplaceSubscriptionActive.
  ///
  /// In en, this message translates to:
  /// **'Subscription active!'**
  String get kodaMarketplaceSubscriptionActive;

  /// No description provided for @kodaMarketplaceSubscriptionPending.
  ///
  /// In en, this message translates to:
  /// **'Still waiting on that payment -- it\'ll activate once completed.'**
  String get kodaMarketplaceSubscriptionPending;

  /// No description provided for @kodaMarketplaceBoostPurchased.
  ///
  /// In en, this message translates to:
  /// **'Boost purchased!'**
  String get kodaMarketplaceBoostPurchased;

  /// No description provided for @kodaMarketplaceBoostPending.
  ///
  /// In en, this message translates to:
  /// **'Still waiting on that payment -- it\'ll be ready once completed.'**
  String get kodaMarketplaceBoostPending;

  /// No description provided for @kodaMarketplaceTokenCountAvailable.
  ///
  /// In en, this message translates to:
  /// **'{count} available'**
  String kodaMarketplaceTokenCountAvailable(int count);

  /// No description provided for @kodaMarketplaceBuyABoostTitle.
  ///
  /// In en, this message translates to:
  /// **'Buy a Boost'**
  String get kodaMarketplaceBuyABoostTitle;

  /// No description provided for @kodaMarketplaceBoostPurchaseExplanation.
  ///
  /// In en, this message translates to:
  /// **'A one-time purchase -- Pulse subscribers also get one free token every renewal, which stays the better deal if you boost regularly.'**
  String get kodaMarketplaceBoostPurchaseExplanation;

  /// No description provided for @kodaMarketplaceBuyABoostButton.
  ///
  /// In en, this message translates to:
  /// **'Buy a Boost -- {price}'**
  String kodaMarketplaceBuyABoostButton(String price);

  /// No description provided for @kodaMarketplaceDiscoverEmptyState.
  ///
  /// In en, this message translates to:
  /// **'No servers have opted into the Koda Marketplace yet. Server owners can turn this on in their server\'s Customize settings.'**
  String get kodaMarketplaceDiscoverEmptyState;

  /// No description provided for @kodaMarketplaceFeaturedThisWeekHeader.
  ///
  /// In en, this message translates to:
  /// **'FEATURED THIS WEEK'**
  String get kodaMarketplaceFeaturedThisWeekHeader;

  /// No description provided for @kodaMarketplaceAllListedServersHeader.
  ///
  /// In en, this message translates to:
  /// **'ALL LISTED SERVERS'**
  String get kodaMarketplaceAllListedServersHeader;

  /// No description provided for @kodaMarketplaceFeaturedItemsHeader.
  ///
  /// In en, this message translates to:
  /// **'FEATURED ITEMS'**
  String get kodaMarketplaceFeaturedItemsHeader;

  /// No description provided for @kodaMarketplaceAllItemsHeader.
  ///
  /// In en, this message translates to:
  /// **'ALL ITEMS'**
  String get kodaMarketplaceAllItemsHeader;

  /// No description provided for @kodaMarketplaceServerFallback.
  ///
  /// In en, this message translates to:
  /// **'Server'**
  String get kodaMarketplaceServerFallback;

  /// No description provided for @kodaMarketplaceMemberCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} member} other{{count} members}}'**
  String kodaMarketplaceMemberCount(int count);

  /// No description provided for @kodaMarketplaceVisitStore.
  ///
  /// In en, this message translates to:
  /// **'Visit Store'**
  String get kodaMarketplaceVisitStore;

  /// No description provided for @calendarFallbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendarFallbackTitle;

  /// No description provided for @calendarAskVispTooltip.
  ///
  /// In en, this message translates to:
  /// **'Ask Visp'**
  String get calendarAskVispTooltip;

  /// No description provided for @calendarCreateEventTooltip.
  ///
  /// In en, this message translates to:
  /// **'Create Event'**
  String get calendarCreateEventTooltip;

  /// No description provided for @calendarPreviousMonthTooltip.
  ///
  /// In en, this message translates to:
  /// **'Previous month'**
  String get calendarPreviousMonthTooltip;

  /// No description provided for @calendarNextMonthTooltip.
  ///
  /// In en, this message translates to:
  /// **'Next month'**
  String get calendarNextMonthTooltip;

  /// No description provided for @calendarTodayButton.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get calendarTodayButton;

  /// No description provided for @calendarWeekdaySun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get calendarWeekdaySun;

  /// No description provided for @calendarWeekdayMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get calendarWeekdayMon;

  /// No description provided for @calendarWeekdayTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get calendarWeekdayTue;

  /// No description provided for @calendarWeekdayWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get calendarWeekdayWed;

  /// No description provided for @calendarWeekdayThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get calendarWeekdayThu;

  /// No description provided for @calendarWeekdayFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get calendarWeekdayFri;

  /// No description provided for @calendarWeekdaySat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get calendarWeekdaySat;

  /// No description provided for @calendarTodaySuffix.
  ///
  /// In en, this message translates to:
  /// **', today'**
  String get calendarTodaySuffix;

  /// No description provided for @calendarEventCountSuffix.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{, {count} event} other{, {count} events}}'**
  String calendarEventCountSuffix(int count);

  /// No description provided for @calendarSelectADay.
  ///
  /// In en, this message translates to:
  /// **'Select a day'**
  String get calendarSelectADay;

  /// No description provided for @calendarNoEvents.
  ///
  /// In en, this message translates to:
  /// **'No events'**
  String get calendarNoEvents;

  /// No description provided for @calendarSubscribeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get calendarSubscribeTooltip;

  /// No description provided for @calendarUnsubscribeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Unsubscribe'**
  String get calendarUnsubscribeTooltip;

  /// No description provided for @calendarRepeatsLabel.
  ///
  /// In en, this message translates to:
  /// **'Repeats {recurrence}'**
  String calendarRepeatsLabel(String recurrence);

  /// No description provided for @calendarTicketOwned.
  ///
  /// In en, this message translates to:
  /// **'Ticket owned'**
  String get calendarTicketOwned;

  /// No description provided for @calendarTicketPrice.
  ///
  /// In en, this message translates to:
  /// **'{price} ticket'**
  String calendarTicketPrice(String price);

  /// No description provided for @calendarDeleteEventTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Event'**
  String get calendarDeleteEventTitle;

  /// No description provided for @calendarDeleteEventConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{title}\"? This cannot be undone.'**
  String calendarDeleteEventConfirm(String title);

  /// No description provided for @calendarEditEventTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Event'**
  String get calendarEditEventTitle;

  /// No description provided for @calendarCreateEventTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Event'**
  String get calendarCreateEventTitle;

  /// No description provided for @calendarEventTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Event title'**
  String get calendarEventTitleHint;

  /// No description provided for @calendarDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get calendarDescriptionHint;

  /// No description provided for @calendarLocationHint.
  ///
  /// In en, this message translates to:
  /// **'Location (optional)'**
  String get calendarLocationHint;

  /// No description provided for @calendarStartLabel.
  ///
  /// In en, this message translates to:
  /// **'Start ({timezone})'**
  String calendarStartLabel(String timezone);

  /// No description provided for @calendarStartDateTimeSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'Start date and time, {formatted}'**
  String calendarStartDateTimeSemanticLabel(String formatted);

  /// No description provided for @calendarEndOptionalLabel.
  ///
  /// In en, this message translates to:
  /// **'End — optional ({timezone})'**
  String calendarEndOptionalLabel(String timezone);

  /// No description provided for @calendarEndDateTimeSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'End date and time, {formatted}'**
  String calendarEndDateTimeSemanticLabel(String formatted);

  /// No description provided for @calendarNotSetLabel.
  ///
  /// In en, this message translates to:
  /// **'not set'**
  String get calendarNotSetLabel;

  /// No description provided for @calendarTapToSetEndTime.
  ///
  /// In en, this message translates to:
  /// **'Tap to set end time'**
  String get calendarTapToSetEndTime;

  /// No description provided for @calendarRecurrenceLabel.
  ///
  /// In en, this message translates to:
  /// **'Recurrence'**
  String get calendarRecurrenceLabel;

  /// No description provided for @calendarRecurrenceNone.
  ///
  /// In en, this message translates to:
  /// **'Does not repeat'**
  String get calendarRecurrenceNone;

  /// No description provided for @calendarRecurrenceDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get calendarRecurrenceDaily;

  /// No description provided for @calendarRecurrenceWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get calendarRecurrenceWeekly;

  /// No description provided for @calendarRecurrenceMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get calendarRecurrenceMonthly;

  /// No description provided for @calendarColorLabel.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get calendarColorLabel;

  /// No description provided for @calendarColorSwatchLabel.
  ///
  /// In en, this message translates to:
  /// **'Color {hex}'**
  String calendarColorSwatchLabel(String hex);

  /// No description provided for @calendarTicketPriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Ticket price — optional'**
  String get calendarTicketPriceLabel;

  /// No description provided for @calendarLinkStageChannelLabel.
  ///
  /// In en, this message translates to:
  /// **'Link to stage channel — optional'**
  String get calendarLinkStageChannelLabel;

  /// No description provided for @calendarStageChannelFallback.
  ///
  /// In en, this message translates to:
  /// **'stage'**
  String get calendarStageChannelFallback;

  /// No description provided for @discordImportFetchError.
  ///
  /// In en, this message translates to:
  /// **'Could not fetch template.'**
  String get discordImportFetchError;

  /// No description provided for @discordImportApplyError.
  ///
  /// In en, this message translates to:
  /// **'Failed to apply template. Please try again.'**
  String get discordImportApplyError;

  /// No description provided for @discordImportTitle.
  ///
  /// In en, this message translates to:
  /// **'Import Discord Template'**
  String get discordImportTitle;

  /// No description provided for @discordImportDescription.
  ///
  /// In en, this message translates to:
  /// **'Paste a discord.new link or template code to import roles, categories, and channels into this server.'**
  String get discordImportDescription;

  /// No description provided for @discordImportCodeHint.
  ///
  /// In en, this message translates to:
  /// **'discord.new/ABC123 or template code'**
  String get discordImportCodeHint;

  /// No description provided for @discordImportPreviewButton.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get discordImportPreviewButton;

  /// No description provided for @discordImportTemplateFallback.
  ///
  /// In en, this message translates to:
  /// **'Template'**
  String get discordImportTemplateFallback;

  /// No description provided for @discordImportRolesCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} role} other{{count} roles}}'**
  String discordImportRolesCount(int count);

  /// No description provided for @discordImportCategoriesCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} category} other{{count} categories}}'**
  String discordImportCategoriesCount(int count);

  /// No description provided for @discordImportChannelsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} channel} other{{count} channels}}'**
  String discordImportChannelsCount(int count);

  /// No description provided for @discordImportReplaceStructureLabel.
  ///
  /// In en, this message translates to:
  /// **'REPLACE EXISTING STRUCTURE'**
  String get discordImportReplaceStructureLabel;

  /// No description provided for @discordImportReplaceWarning.
  ///
  /// In en, this message translates to:
  /// **'All existing channels, categories and roles will be permanently deleted.'**
  String get discordImportReplaceWarning;

  /// No description provided for @discordImportAddDescription.
  ///
  /// In en, this message translates to:
  /// **'Template will be added to your existing server structure.'**
  String get discordImportAddDescription;

  /// No description provided for @discordImportReplaceConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Replace server structure?'**
  String get discordImportReplaceConfirmTitle;

  /// No description provided for @discordImportReplaceConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete ALL existing channels, categories, and roles before importing. This cannot be undone.'**
  String get discordImportReplaceConfirmBody;

  /// No description provided for @discordImportYesReplace.
  ///
  /// In en, this message translates to:
  /// **'Yes, Replace'**
  String get discordImportYesReplace;

  /// No description provided for @discordImportReplaceAndImportButton.
  ///
  /// In en, this message translates to:
  /// **'Replace & Import Template'**
  String get discordImportReplaceAndImportButton;

  /// No description provided for @discordImportAddToServerButton.
  ///
  /// In en, this message translates to:
  /// **'Add Template to Server'**
  String get discordImportAddToServerButton;

  /// No description provided for @thresholdModConfigureTitle.
  ///
  /// In en, this message translates to:
  /// **'Configure Threshold Moderation'**
  String get thresholdModConfigureTitle;

  /// No description provided for @thresholdModConfigureExplanation.
  ///
  /// In en, this message translates to:
  /// **'Pick trusted moderators and how many of them must agree before any of them can decrypt one epoch of a channel\'s history. Not even you get a unilateral key -- you\'re only exempt if you\'re also in this list.'**
  String get thresholdModConfigureExplanation;

  /// No description provided for @thresholdModThresholdLabel.
  ///
  /// In en, this message translates to:
  /// **'Threshold:'**
  String get thresholdModThresholdLabel;

  /// No description provided for @thresholdModDecreaseThresholdTooltip.
  ///
  /// In en, this message translates to:
  /// **'Decrease threshold'**
  String get thresholdModDecreaseThresholdTooltip;

  /// No description provided for @thresholdModIncreaseThresholdTooltip.
  ///
  /// In en, this message translates to:
  /// **'Increase threshold'**
  String get thresholdModIncreaseThresholdTooltip;

  /// No description provided for @thresholdModOfModeratorsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{of {count} moderator} other{of {count} moderators}}'**
  String thresholdModOfModeratorsCount(int count);

  /// No description provided for @thresholdModRequestDecryptTitle.
  ///
  /// In en, this message translates to:
  /// **'Request Threshold Decrypt'**
  String get thresholdModRequestDecryptTitle;

  /// No description provided for @thresholdModChannelLabel.
  ///
  /// In en, this message translates to:
  /// **'Channel'**
  String get thresholdModChannelLabel;

  /// No description provided for @thresholdModReasonHint.
  ///
  /// In en, this message translates to:
  /// **'Reason -- shown to every designated moderator'**
  String get thresholdModReasonHint;

  /// No description provided for @thresholdModRequestButton.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get thresholdModRequestButton;

  /// No description provided for @thresholdModShareRelayed.
  ///
  /// In en, this message translates to:
  /// **'Share relayed to the requester.'**
  String get thresholdModShareRelayed;

  /// No description provided for @thresholdModNotEnoughShares.
  ///
  /// In en, this message translates to:
  /// **'Not enough shares relayed yet -- try again once more moderators have relayed theirs.'**
  String get thresholdModNotEnoughShares;

  /// No description provided for @thresholdModEpochMessagesTitle.
  ///
  /// In en, this message translates to:
  /// **'Epoch {epoch} -- {count, plural, one{{count} message} other{{count} messages}}'**
  String thresholdModEpochMessagesTitle(int epoch, int count);

  /// No description provided for @thresholdModNoDecryptableMessages.
  ///
  /// In en, this message translates to:
  /// **'No decryptable messages in this epoch.'**
  String get thresholdModNoDecryptableMessages;

  /// No description provided for @thresholdModExplanation.
  ///
  /// In en, this message translates to:
  /// **'Real decryption of a channel\'s history, gated on multiple designated moderators actively agreeing -- never one person alone, not even the server owner. Only ever unlocks one whole epoch (everything sent since the last membership change), never a single message.'**
  String get thresholdModExplanation;

  /// No description provided for @thresholdModEnabledStatus.
  ///
  /// In en, this message translates to:
  /// **'Enabled -- {count} moderators, threshold {threshold}'**
  String thresholdModEnabledStatus(int count, int threshold);

  /// No description provided for @thresholdModNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'Not configured'**
  String get thresholdModNotConfigured;

  /// No description provided for @thresholdModReconfigureButton.
  ///
  /// In en, this message translates to:
  /// **'Reconfigure'**
  String get thresholdModReconfigureButton;

  /// No description provided for @thresholdModEnableButton.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get thresholdModEnableButton;

  /// No description provided for @thresholdModNotEnabledForServer.
  ///
  /// In en, this message translates to:
  /// **'Threshold moderation is not enabled for this server.'**
  String get thresholdModNotEnabledForServer;

  /// No description provided for @thresholdModEnabledNotDesignated.
  ///
  /// In en, this message translates to:
  /// **'Enabled for this server. You are not one of the designated moderators.'**
  String get thresholdModEnabledNotDesignated;

  /// No description provided for @thresholdModRequestsLabel.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get thresholdModRequestsLabel;

  /// No description provided for @thresholdModRequestDecryptButton.
  ///
  /// In en, this message translates to:
  /// **'Request Decrypt'**
  String get thresholdModRequestDecryptButton;

  /// No description provided for @thresholdModNoActiveRequests.
  ///
  /// In en, this message translates to:
  /// **'No active requests.'**
  String get thresholdModNoActiveRequests;

  /// No description provided for @thresholdModRequestRowLabel.
  ///
  /// In en, this message translates to:
  /// **'#{channelName} -- epoch {epoch} -- {status}'**
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status);

  /// No description provided for @thresholdModStatusPending.
  ///
  /// In en, this message translates to:
  /// **'pending'**
  String get thresholdModStatusPending;

  /// No description provided for @thresholdModStatusApproved.
  ///
  /// In en, this message translates to:
  /// **'approved'**
  String get thresholdModStatusApproved;

  /// No description provided for @thresholdModApproveButton.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get thresholdModApproveButton;

  /// No description provided for @thresholdModRelayShareButton.
  ///
  /// In en, this message translates to:
  /// **'Relay My Share'**
  String get thresholdModRelayShareButton;

  /// No description provided for @thresholdModTryReconstructButton.
  ///
  /// In en, this message translates to:
  /// **'Try Reconstruct'**
  String get thresholdModTryReconstructButton;

  /// No description provided for @roleSelectNoRolesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No self-assignable roles available.'**
  String get roleSelectNoRolesAvailable;

  /// No description provided for @roleSelectInstructions.
  ///
  /// In en, this message translates to:
  /// **'Select the roles you want. Tap a role to add or remove it.'**
  String get roleSelectInstructions;

  /// No description provided for @rulesScreenAcceptError.
  ///
  /// In en, this message translates to:
  /// **'Could not accept rules. Try again.'**
  String get rulesScreenAcceptError;

  /// No description provided for @rulesScreenSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Server Rules'**
  String get rulesScreenSubtitle;

  /// No description provided for @rulesScreenScrollToRead.
  ///
  /// In en, this message translates to:
  /// **'Scroll down to read all rules'**
  String get rulesScreenScrollToRead;

  /// No description provided for @rulesScreenAcceptDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'By clicking Accept, you agree to follow these rules.\nViolations may result in removal from the server.'**
  String get rulesScreenAcceptDisclaimer;

  /// No description provided for @rulesScreenAcceptButton.
  ///
  /// In en, this message translates to:
  /// **'I Accept the Rules'**
  String get rulesScreenAcceptButton;

  /// No description provided for @rulesScreenReadAllToContinue.
  ///
  /// In en, this message translates to:
  /// **'Read all rules to continue'**
  String get rulesScreenReadAllToContinue;

  /// No description provided for @galleryNewPostTitle.
  ///
  /// In en, this message translates to:
  /// **'New Post'**
  String get galleryNewPostTitle;

  /// No description provided for @galleryChooseFileButton.
  ///
  /// In en, this message translates to:
  /// **'Choose File'**
  String get galleryChooseFileButton;

  /// No description provided for @galleryOrDivider.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get galleryOrDivider;

  /// No description provided for @galleryPasteUrlHint.
  ///
  /// In en, this message translates to:
  /// **'Paste image/video URL'**
  String get galleryPasteUrlHint;

  /// No description provided for @galleryTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get galleryTypeLabel;

  /// No description provided for @galleryImageOption.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get galleryImageOption;

  /// No description provided for @galleryVideoOption.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get galleryVideoOption;

  /// No description provided for @galleryCaptionHint.
  ///
  /// In en, this message translates to:
  /// **'Caption (optional)'**
  String get galleryCaptionHint;

  /// No description provided for @galleryPostButton.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get galleryPostButton;

  /// No description provided for @galleryNewCollectionTitle.
  ///
  /// In en, this message translates to:
  /// **'New Collection'**
  String get galleryNewCollectionTitle;

  /// No description provided for @galleryCollectionNameHint.
  ///
  /// In en, this message translates to:
  /// **'Collection name'**
  String get galleryCollectionNameHint;

  /// No description provided for @galleryDeleteCollectionConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{collectionName}\"? Posts inside will become uncollected.'**
  String galleryDeleteCollectionConfirm(String collectionName);

  /// No description provided for @galleryFeedTab.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get galleryFeedTab;

  /// No description provided for @galleryCollectionsTab.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get galleryCollectionsTab;

  /// No description provided for @galleryNoPostsYet.
  ///
  /// In en, this message translates to:
  /// **'No posts yet'**
  String get galleryNoPostsYet;

  /// No description provided for @galleryNoCollectionsYet.
  ///
  /// In en, this message translates to:
  /// **'No collections yet'**
  String get galleryNoCollectionsYet;

  /// No description provided for @gallerySelectACollection.
  ///
  /// In en, this message translates to:
  /// **'Select a collection'**
  String get gallerySelectACollection;

  /// No description provided for @galleryNoPostsInCollection.
  ///
  /// In en, this message translates to:
  /// **'No posts in this collection'**
  String get galleryNoPostsInCollection;

  /// No description provided for @galleryAddPostButton.
  ///
  /// In en, this message translates to:
  /// **'Add Post'**
  String get galleryAddPostButton;

  /// No description provided for @voiceScreenScreenShareFailed.
  ///
  /// In en, this message translates to:
  /// **'Screen share failed: {error}'**
  String voiceScreenScreenShareFailed(String error);

  /// No description provided for @voiceScreenUsersVolumeTitle.
  ///
  /// In en, this message translates to:
  /// **'{username}\'s Volume'**
  String voiceScreenUsersVolumeTitle(String username);

  /// No description provided for @voiceScreenVolumeOnlyAffectsYou.
  ///
  /// In en, this message translates to:
  /// **'Only affects what you hear -- this device, this call.'**
  String get voiceScreenVolumeOnlyAffectsYou;

  /// No description provided for @voiceScreenResetVolumeButton.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get voiceScreenResetVolumeButton;

  /// No description provided for @voiceScreenCouldNotConnect.
  ///
  /// In en, this message translates to:
  /// **'Could not connect: {error}'**
  String voiceScreenCouldNotConnect(String error);

  /// No description provided for @voiceScreenYourScreenTapFullscreen.
  ///
  /// In en, this message translates to:
  /// **'Your screen, tap to view full-screen'**
  String get voiceScreenYourScreenTapFullscreen;

  /// No description provided for @voiceScreenYourScreenLabel.
  ///
  /// In en, this message translates to:
  /// **'Your screen'**
  String get voiceScreenYourScreenLabel;

  /// No description provided for @voiceScreenTapToClose.
  ///
  /// In en, this message translates to:
  /// **'Tap to close'**
  String get voiceScreenTapToClose;

  /// No description provided for @voiceScreenParticipantYouLabel.
  ///
  /// In en, this message translates to:
  /// **'{name} (you)'**
  String voiceScreenParticipantYouLabel(String name);

  /// No description provided for @voiceScreenSpeakingSuffix.
  ///
  /// In en, this message translates to:
  /// **', speaking'**
  String get voiceScreenSpeakingSuffix;

  /// No description provided for @voiceScreenCameraOnSuffix.
  ///
  /// In en, this message translates to:
  /// **', camera on'**
  String get voiceScreenCameraOnSuffix;

  /// No description provided for @voiceScreenActivateToPopOut.
  ///
  /// In en, this message translates to:
  /// **', activate to pop out'**
  String get voiceScreenActivateToPopOut;

  /// No description provided for @voiceScreenShowVarmTooltip.
  ///
  /// In en, this message translates to:
  /// **'Show VARM'**
  String get voiceScreenShowVarmTooltip;

  /// No description provided for @voiceScreenHideVarmTooltip.
  ///
  /// In en, this message translates to:
  /// **'Hide VARM'**
  String get voiceScreenHideVarmTooltip;

  /// No description provided for @voiceScreenShowChatTooltip.
  ///
  /// In en, this message translates to:
  /// **'Show Chat'**
  String get voiceScreenShowChatTooltip;

  /// No description provided for @voiceScreenHideChatTooltip.
  ///
  /// In en, this message translates to:
  /// **'Hide Chat'**
  String get voiceScreenHideChatTooltip;

  /// No description provided for @voiceScreenStartCameraTooltip.
  ///
  /// In en, this message translates to:
  /// **'Start camera'**
  String get voiceScreenStartCameraTooltip;

  /// No description provided for @voiceScreenStopCameraTooltip.
  ///
  /// In en, this message translates to:
  /// **'Stop camera'**
  String get voiceScreenStopCameraTooltip;

  /// No description provided for @voiceScreenShareScreenTooltip.
  ///
  /// In en, this message translates to:
  /// **'Share screen'**
  String get voiceScreenShareScreenTooltip;

  /// No description provided for @voiceScreenStopSharingTooltip.
  ///
  /// In en, this message translates to:
  /// **'Stop sharing'**
  String get voiceScreenStopSharingTooltip;

  /// No description provided for @voiceScreenPopOutTooltip.
  ///
  /// In en, this message translates to:
  /// **'Pop out voice to separate window'**
  String get voiceScreenPopOutTooltip;

  /// No description provided for @voiceScreenCouldNotPopOut.
  ///
  /// In en, this message translates to:
  /// **'Could not pop out voice.'**
  String get voiceScreenCouldNotPopOut;

  /// No description provided for @voiceScreenLeaveVoiceTooltip.
  ///
  /// In en, this message translates to:
  /// **'Leave Voice'**
  String get voiceScreenLeaveVoiceTooltip;

  /// No description provided for @voiceScreenPinTooltip.
  ///
  /// In en, this message translates to:
  /// **'Pin (keep open)'**
  String get voiceScreenPinTooltip;

  /// No description provided for @voiceScreenUnpinTooltip.
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get voiceScreenUnpinTooltip;

  /// No description provided for @voiceScreenSizeSmall.
  ///
  /// In en, this message translates to:
  /// **'Small (320x180)'**
  String get voiceScreenSizeSmall;

  /// No description provided for @voiceScreenSizeMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium (480x270)'**
  String get voiceScreenSizeMedium;

  /// No description provided for @voiceScreenSizeLarge.
  ///
  /// In en, this message translates to:
  /// **'Large (640x360)'**
  String get voiceScreenSizeLarge;

  /// No description provided for @voiceScreenSizeXl.
  ///
  /// In en, this message translates to:
  /// **'XL (960x540)'**
  String get voiceScreenSizeXl;

  /// No description provided for @voiceBarConnectedSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'{channelName}, {count} connected'**
  String voiceBarConnectedSemanticLabel(String channelName, int count);

  /// No description provided for @voiceBarSpeakingSuffix.
  ///
  /// In en, this message translates to:
  /// **', you are speaking'**
  String get voiceBarSpeakingSuffix;

  /// No description provided for @voiceBarConnectedTapToExpand.
  ///
  /// In en, this message translates to:
  /// **'{count} connected · tap to expand'**
  String voiceBarConnectedTapToExpand(int count);

  /// No description provided for @voiceBarStartCameraTooltip.
  ///
  /// In en, this message translates to:
  /// **'Start camera'**
  String get voiceBarStartCameraTooltip;

  /// No description provided for @voiceBarStopCameraTooltip.
  ///
  /// In en, this message translates to:
  /// **'Stop camera'**
  String get voiceBarStopCameraTooltip;

  /// No description provided for @voiceBarLeaveVoiceTooltip.
  ///
  /// In en, this message translates to:
  /// **'Leave Voice'**
  String get voiceBarLeaveVoiceTooltip;

  /// No description provided for @popOutVideoFallbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Voice'**
  String get popOutVideoFallbackTitle;

  /// No description provided for @popOutVideoMissingTokenError.
  ///
  /// In en, this message translates to:
  /// **'Missing token or URL'**
  String get popOutVideoMissingTokenError;

  /// No description provided for @popOutVideoConnectionTimedOut.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out after 15 seconds'**
  String get popOutVideoConnectionTimedOut;

  /// No description provided for @popOutVideoErrorLabel.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String popOutVideoErrorLabel(String error);

  /// No description provided for @popOutVideoNoParticipants.
  ///
  /// In en, this message translates to:
  /// **'No participants'**
  String get popOutVideoNoParticipants;

  /// No description provided for @varmWidgetLabel.
  ///
  /// In en, this message translates to:
  /// **'VARM'**
  String get varmWidgetLabel;

  /// No description provided for @stageFallbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Stage'**
  String get stageFallbackTitle;

  /// No description provided for @stageCouldNotJoin.
  ///
  /// In en, this message translates to:
  /// **'Could not join stage.'**
  String get stageCouldNotJoin;

  /// No description provided for @stageThisStageFallback.
  ///
  /// In en, this message translates to:
  /// **'This stage'**
  String get stageThisStageFallback;

  /// No description provided for @stageRequiresTicketToJoin.
  ///
  /// In en, this message translates to:
  /// **'requires a ticket to join'**
  String get stageRequiresTicketToJoin;

  /// No description provided for @stagePleaseWaitLabel.
  ///
  /// In en, this message translates to:
  /// **'Please wait...'**
  String get stagePleaseWaitLabel;

  /// No description provided for @stageGetFreeTicketButton.
  ///
  /// In en, this message translates to:
  /// **'Get Free Ticket'**
  String get stageGetFreeTicketButton;

  /// No description provided for @stageBuyTicketButton.
  ///
  /// In en, this message translates to:
  /// **'Buy Ticket -- {price}'**
  String stageBuyTicketButton(String price);

  /// No description provided for @stageNotNowButton.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get stageNotNowButton;

  /// No description provided for @stageCouldNotStartTicketPurchase.
  ///
  /// In en, this message translates to:
  /// **'Could not start ticket purchase.'**
  String get stageCouldNotStartTicketPurchase;

  /// No description provided for @stagePaymentStillPendingTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Still waiting on that payment -- try joining again once it\'s confirmed.'**
  String get stagePaymentStillPendingTryAgain;

  /// No description provided for @stageSpeakerBadge.
  ///
  /// In en, this message translates to:
  /// **'Speaker'**
  String get stageSpeakerBadge;

  /// No description provided for @stageListenerBadge.
  ///
  /// In en, this message translates to:
  /// **'Listener'**
  String get stageListenerBadge;

  /// No description provided for @stageCouldNotJoinWithError.
  ///
  /// In en, this message translates to:
  /// **'Could not join: {error}'**
  String stageCouldNotJoinWithError(String error);

  /// No description provided for @stageSpeakersHeader.
  ///
  /// In en, this message translates to:
  /// **'SPEAKERS'**
  String get stageSpeakersHeader;

  /// No description provided for @stageRaisedHandsHeader.
  ///
  /// In en, this message translates to:
  /// **'RAISED HANDS'**
  String get stageRaisedHandsHeader;

  /// No description provided for @stageAllowButton.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get stageAllowButton;

  /// No description provided for @stageIgnoreButton.
  ///
  /// In en, this message translates to:
  /// **'Ignore'**
  String get stageIgnoreButton;

  /// No description provided for @stageListenersHeader.
  ///
  /// In en, this message translates to:
  /// **'LISTENERS'**
  String get stageListenersHeader;

  /// No description provided for @stageRaiseHandTooltip.
  ///
  /// In en, this message translates to:
  /// **'Raise hand'**
  String get stageRaiseHandTooltip;

  /// No description provided for @stageLowerHandTooltip.
  ///
  /// In en, this message translates to:
  /// **'Lower hand'**
  String get stageLowerHandTooltip;

  /// No description provided for @stageLeaveStageTooltip.
  ///
  /// In en, this message translates to:
  /// **'Leave Stage'**
  String get stageLeaveStageTooltip;

  /// No description provided for @stageYouSuffixLabel.
  ///
  /// In en, this message translates to:
  /// **'{name} (you)'**
  String stageYouSuffixLabel(String name);

  /// No description provided for @stageMoveToListenersButton.
  ///
  /// In en, this message translates to:
  /// **'Move to listeners'**
  String get stageMoveToListenersButton;

  /// No description provided for @stageYouFallbackName.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get stageYouFallbackName;

  /// No description provided for @widgetsAvatarSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'Avatar for {username}'**
  String widgetsAvatarSemanticLabel(String username);

  /// No description provided for @channelEditDialogNewTitle.
  ///
  /// In en, this message translates to:
  /// **'New Channel'**
  String get channelEditDialogNewTitle;

  /// No description provided for @channelEditDialogEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Channel'**
  String get channelEditDialogEditTitle;

  /// No description provided for @channelEditDialogNameHint.
  ///
  /// In en, this message translates to:
  /// **'Channel name'**
  String get channelEditDialogNameHint;

  /// No description provided for @channelEditDialogDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Topic (optional)'**
  String get channelEditDialogDescriptionHint;

  /// No description provided for @channelEditDialogTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get channelEditDialogTypeLabel;

  /// No description provided for @channelEditDialogTypeText.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get channelEditDialogTypeText;

  /// No description provided for @channelEditDialogTypeVoice.
  ///
  /// In en, this message translates to:
  /// **'Voice'**
  String get channelEditDialogTypeVoice;

  /// No description provided for @channelEditDialogTypeGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get channelEditDialogTypeGallery;

  /// No description provided for @channelEditDialogTypeStage.
  ///
  /// In en, this message translates to:
  /// **'Stage'**
  String get channelEditDialogTypeStage;

  /// No description provided for @channelEditDialogTypeRules.
  ///
  /// In en, this message translates to:
  /// **'Rules'**
  String get channelEditDialogTypeRules;

  /// No description provided for @channelEditDialogTypeRoleSelection.
  ///
  /// In en, this message translates to:
  /// **'Role Selection'**
  String get channelEditDialogTypeRoleSelection;

  /// No description provided for @channelEditDialogTypeCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get channelEditDialogTypeCalendar;

  /// No description provided for @channelEditDialogAnnouncementTitle.
  ///
  /// In en, this message translates to:
  /// **'Announcement channel'**
  String get channelEditDialogAnnouncementTitle;

  /// No description provided for @channelEditDialogAnnouncementSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Only members who can manage messages may post'**
  String get channelEditDialogAnnouncementSubtitle;

  /// No description provided for @channelEditDialogLiveAnnouncementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Post live-stream & upload announcements here'**
  String get channelEditDialogLiveAnnouncementsTitle;

  /// No description provided for @channelEditDialogLiveAnnouncementsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Auto-posts when a member with the \"Announce when live\" permission goes live on Twitch, or posts a new YouTube video'**
  String get channelEditDialogLiveAnnouncementsSubtitle;

  /// No description provided for @channelEditDialogNotifyRolesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notify these roles when posted (optional)'**
  String get channelEditDialogNotifyRolesLabel;

  /// No description provided for @channelEditDialogSlowmodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Slowmode'**
  String get channelEditDialogSlowmodeLabel;

  /// No description provided for @channelEditDialogSlowmodeOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get channelEditDialogSlowmodeOff;

  /// No description provided for @channelEditDialogUserLimitLabel.
  ///
  /// In en, this message translates to:
  /// **'User Limit'**
  String get channelEditDialogUserLimitLabel;

  /// No description provided for @channelEditDialogUserLimitOff.
  ///
  /// In en, this message translates to:
  /// **'No limit'**
  String get channelEditDialogUserLimitOff;

  /// No description provided for @channelEditDialogCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get channelEditDialogCategoryLabel;

  /// No description provided for @channelEditDialogNoCategory.
  ///
  /// In en, this message translates to:
  /// **'No category'**
  String get channelEditDialogNoCategory;

  /// No description provided for @channelEditDialogRoleAccessLabel.
  ///
  /// In en, this message translates to:
  /// **'Role Access (leave empty for all)'**
  String get channelEditDialogRoleAccessLabel;

  /// No description provided for @channelEditDialogContentLabelsLabel.
  ///
  /// In en, this message translates to:
  /// **'Content Labels'**
  String get channelEditDialogContentLabelsLabel;

  /// No description provided for @channelEditDialogContentLabelsDescription.
  ///
  /// In en, this message translates to:
  /// **'Flags this channel for members\' content filters; hard-blocked for supervised accounts'**
  String get channelEditDialogContentLabelsDescription;

  /// No description provided for @categoryEditDialogNewTitle.
  ///
  /// In en, this message translates to:
  /// **'New Category'**
  String get categoryEditDialogNewTitle;

  /// No description provided for @categoryEditDialogEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Category'**
  String get categoryEditDialogEditTitle;

  /// No description provided for @categoryEditDialogNameHint.
  ///
  /// In en, this message translates to:
  /// **'Category name'**
  String get categoryEditDialogNameHint;

  /// No description provided for @categoryEditDialogRoleAccessLabel.
  ///
  /// In en, this message translates to:
  /// **'Role Access (leave empty for all)'**
  String get categoryEditDialogRoleAccessLabel;

  /// No description provided for @memberPanelHeaderLabel.
  ///
  /// In en, this message translates to:
  /// **'Members — {count} online'**
  String memberPanelHeaderLabel(int count);

  /// No description provided for @memberPanelRefreshTooltip.
  ///
  /// In en, this message translates to:
  /// **'Refresh member list'**
  String get memberPanelRefreshTooltip;

  /// No description provided for @memberPanelMemberCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} member} other{{count} members}}'**
  String memberPanelMemberCount(int count);

  /// No description provided for @memberPanelOfflineLabel.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get memberPanelOfflineLabel;

  /// No description provided for @memberPanelTierSuffix.
  ///
  /// In en, this message translates to:
  /// **', {tier} tier'**
  String memberPanelTierSuffix(String tier);

  /// No description provided for @memberPanelUnknownUser.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get memberPanelUnknownUser;

  /// No description provided for @memberPanelModerationActionsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Moderation actions'**
  String get memberPanelModerationActionsTooltip;

  /// No description provided for @reportDialogReasonSpam.
  ///
  /// In en, this message translates to:
  /// **'Spam'**
  String get reportDialogReasonSpam;

  /// No description provided for @reportDialogReasonHarassment.
  ///
  /// In en, this message translates to:
  /// **'Harassment or abuse'**
  String get reportDialogReasonHarassment;

  /// No description provided for @reportDialogReasonIllegal.
  ///
  /// In en, this message translates to:
  /// **'Illegal content'**
  String get reportDialogReasonIllegal;

  /// No description provided for @reportDialogReasonOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get reportDialogReasonOther;

  /// No description provided for @reportDialogReasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reportDialogReasonLabel;

  /// No description provided for @reportDialogNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Anything else moderators should know? (optional)'**
  String get reportDialogNoteHint;

  /// No description provided for @reportDialogDisclosureNote.
  ///
  /// In en, this message translates to:
  /// **'The message content shown to you and who sent it will be shared with this server\'s moderators.'**
  String get reportDialogDisclosureNote;

  /// No description provided for @reportDialogSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Submit Report'**
  String get reportDialogSubmitButton;

  /// No description provided for @reportDialogSubmitError.
  ///
  /// In en, this message translates to:
  /// **'Could not submit report.'**
  String get reportDialogSubmitError;

  /// No description provided for @notificationBellTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationBellTitle;

  /// No description provided for @notificationBellMarkAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get notificationBellMarkAllRead;

  /// No description provided for @notificationBellEmptyState.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get notificationBellEmptyState;

  /// No description provided for @notificationBellUnreadLabel.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get notificationBellUnreadLabel;

  /// No description provided for @invitePreviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Server Invite'**
  String get invitePreviewTitle;

  /// No description provided for @invitePreviewInvalidOrExpired.
  ///
  /// In en, this message translates to:
  /// **'Invalid or expired invite.'**
  String get invitePreviewInvalidOrExpired;

  /// No description provided for @invitePreviewCouldNotJoin.
  ///
  /// In en, this message translates to:
  /// **'Could not join server.'**
  String get invitePreviewCouldNotJoin;

  /// No description provided for @invitePreviewUnknownServer.
  ///
  /// In en, this message translates to:
  /// **'Unknown server'**
  String get invitePreviewUnknownServer;

  /// No description provided for @shippingAddressFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get shippingAddressFullNameHint;

  /// No description provided for @shippingAddressLine1Hint.
  ///
  /// In en, this message translates to:
  /// **'Address line 1'**
  String get shippingAddressLine1Hint;

  /// No description provided for @shippingAddressLine2Hint.
  ///
  /// In en, this message translates to:
  /// **'Address line 2 (optional)'**
  String get shippingAddressLine2Hint;

  /// No description provided for @shippingAddressCityHint.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get shippingAddressCityHint;

  /// No description provided for @shippingAddressStateHint.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get shippingAddressStateHint;

  /// No description provided for @shippingAddressZipHint.
  ///
  /// In en, this message translates to:
  /// **'ZIP / postal code'**
  String get shippingAddressZipHint;

  /// No description provided for @shippingAddressCountryCodeHint.
  ///
  /// In en, this message translates to:
  /// **'Country code (e.g. US)'**
  String get shippingAddressCountryCodeHint;

  /// No description provided for @shippingAddressPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'Phone (optional)'**
  String get shippingAddressPhoneHint;

  /// No description provided for @shippingAddressPrivacyNote.
  ///
  /// In en, this message translates to:
  /// **'Used only to ship this order -- see Printful\'s own privacy policy for how they handle it once the order is placed.'**
  String get shippingAddressPrivacyNote;

  /// No description provided for @updateNudgeAvailableTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get updateNudgeAvailableTitle;

  /// No description provided for @updateNudgeRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Required'**
  String get updateNudgeRequiredTitle;

  /// No description provided for @updateNudgeAvailableBody.
  ///
  /// In en, this message translates to:
  /// **'Koda {version} is available -- you\'re on an older build.'**
  String updateNudgeAvailableBody(String version);

  /// No description provided for @updateNudgeRequiredBody.
  ///
  /// In en, this message translates to:
  /// **'This build is no longer supported. Update to Koda {version} to keep using Koda.'**
  String updateNudgeRequiredBody(String version);

  /// No description provided for @updateNudgeLaterButton.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get updateNudgeLaterButton;

  /// No description provided for @tierBadgeSparkSubscriber.
  ///
  /// In en, this message translates to:
  /// **'Spark subscriber'**
  String get tierBadgeSparkSubscriber;

  /// No description provided for @tierBadgePulseSubscriber.
  ///
  /// In en, this message translates to:
  /// **'Pulse subscriber'**
  String get tierBadgePulseSubscriber;

  /// No description provided for @tierBadgeAlphaSpark.
  ///
  /// In en, this message translates to:
  /// **'Alpha Spark'**
  String get tierBadgeAlphaSpark;

  /// No description provided for @tierBadgeFounder.
  ///
  /// In en, this message translates to:
  /// **'Founder'**
  String get tierBadgeFounder;

  /// No description provided for @foundersHallTitle.
  ///
  /// In en, this message translates to:
  /// **'Founders Hall'**
  String get foundersHallTitle;

  /// No description provided for @foundersHallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The earliest backers who helped make Koda possible.'**
  String get foundersHallSubtitle;

  /// No description provided for @foundersHallEmptyState.
  ///
  /// In en, this message translates to:
  /// **'No founders yet.'**
  String get foundersHallEmptyState;

  /// No description provided for @settingsFoundersHallTitle.
  ///
  /// In en, this message translates to:
  /// **'Founders Hall'**
  String get settingsFoundersHallTitle;

  /// No description provided for @settingsFoundersHallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'See who helped build Koda'**
  String get settingsFoundersHallSubtitle;

  /// No description provided for @vispAvatarInDevelopment.
  ///
  /// In en, this message translates to:
  /// **'IN DEVELOPMENT'**
  String get vispAvatarInDevelopment;

  /// No description provided for @vispBoostAdvisorCouldNotAnswer.
  ///
  /// In en, this message translates to:
  /// **'Visp could not put together an answer.'**
  String get vispBoostAdvisorCouldNotAnswer;

  /// No description provided for @vispBoostAdvisorTitle.
  ///
  /// In en, this message translates to:
  /// **'Ask Visp: Boost ROI Advisor'**
  String get vispBoostAdvisorTitle;

  /// No description provided for @vispBoostAdvisorFollowUpHint.
  ///
  /// In en, this message translates to:
  /// **'Ask a follow-up...'**
  String get vispBoostAdvisorFollowUpHint;

  /// No description provided for @vispBoostAdvisorSendTooltip.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get vispBoostAdvisorSendTooltip;

  /// No description provided for @vispBoostAdvisorBasedOn.
  ///
  /// In en, this message translates to:
  /// **'Based on:'**
  String get vispBoostAdvisorBasedOn;

  /// No description provided for @vispEventDialogCouldNotGenerate.
  ///
  /// In en, this message translates to:
  /// **'Visp could not generate an event.'**
  String get vispEventDialogCouldNotGenerate;

  /// No description provided for @vispEventDialogCouldNotCreate.
  ///
  /// In en, this message translates to:
  /// **'Could not create that event.'**
  String get vispEventDialogCouldNotCreate;

  /// No description provided for @vispEventDialogRecurrenceNone.
  ///
  /// In en, this message translates to:
  /// **'One-time'**
  String get vispEventDialogRecurrenceNone;

  /// No description provided for @vispEventDialogRecurrenceDaily.
  ///
  /// In en, this message translates to:
  /// **'Repeats daily'**
  String get vispEventDialogRecurrenceDaily;

  /// No description provided for @vispEventDialogRecurrenceWeekly.
  ///
  /// In en, this message translates to:
  /// **'Repeats weekly'**
  String get vispEventDialogRecurrenceWeekly;

  /// No description provided for @vispEventDialogRecurrenceMonthly.
  ///
  /// In en, this message translates to:
  /// **'Repeats monthly'**
  String get vispEventDialogRecurrenceMonthly;

  /// No description provided for @vispEventDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Ask Visp to create an event'**
  String get vispEventDialogTitle;

  /// No description provided for @vispEventDialogDescription.
  ///
  /// In en, this message translates to:
  /// **'Describe the event -- Visp will propose a title, date/time, and any other details.'**
  String get vispEventDialogDescription;

  /// No description provided for @vispEventDialogPromptHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. \"Weekly D&D session every Friday at 7pm for about 3 hours\"'**
  String get vispEventDialogPromptHint;

  /// No description provided for @vispEventDialogPrivacyNote.
  ///
  /// In en, this message translates to:
  /// **'Your description is sent to Visp (a self-hosted assistant -- nothing leaves Koda\'s servers) to generate this plan.'**
  String get vispEventDialogPrivacyNote;

  /// No description provided for @vispEventDialogStartOver.
  ///
  /// In en, this message translates to:
  /// **'Start Over'**
  String get vispEventDialogStartOver;

  /// No description provided for @vispEventDialogCreateEvent.
  ///
  /// In en, this message translates to:
  /// **'Create Event'**
  String get vispEventDialogCreateEvent;

  /// No description provided for @vispEventDialogThinking.
  ///
  /// In en, this message translates to:
  /// **'Thinking...'**
  String get vispEventDialogThinking;

  /// No description provided for @vispEventDialogGeneratePlan.
  ///
  /// In en, this message translates to:
  /// **'Generate Plan'**
  String get vispEventDialogGeneratePlan;

  /// No description provided for @vispEventDialogCouldNotParseDate.
  ///
  /// In en, this message translates to:
  /// **'Could not parse a date -- try rephrasing'**
  String get vispEventDialogCouldNotParseDate;

  /// No description provided for @vispEventDialogEndsLabel.
  ///
  /// In en, this message translates to:
  /// **'Ends {ends}'**
  String vispEventDialogEndsLabel(String ends);

  /// No description provided for @vispEventDialogPricePerTicket.
  ///
  /// In en, this message translates to:
  /// **'{price} per ticket'**
  String vispEventDialogPricePerTicket(String price);

  /// No description provided for @vispEventDialogBasedOn.
  ///
  /// In en, this message translates to:
  /// **'Based on:'**
  String get vispEventDialogBasedOn;

  /// No description provided for @vispQuestionStepProgress.
  ///
  /// In en, this message translates to:
  /// **'Question {questionNumber} of {maxQuestions}'**
  String vispQuestionStepProgress(int questionNumber, int maxQuestions);

  /// No description provided for @vispQuestionStepAnswerHint.
  ///
  /// In en, this message translates to:
  /// **'Or type your own answer...'**
  String get vispQuestionStepAnswerHint;

  /// No description provided for @vispQuestionStepSendTooltip.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get vispQuestionStepSendTooltip;

  /// No description provided for @vispQuestionStepSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip and generate now'**
  String get vispQuestionStepSkip;

  /// No description provided for @vispSetupDialogCouldNotGeneratePlan.
  ///
  /// In en, this message translates to:
  /// **'Visp could not generate a plan.'**
  String get vispSetupDialogCouldNotGeneratePlan;

  /// No description provided for @vispSetupDialogCouldNotApplyPlan.
  ///
  /// In en, this message translates to:
  /// **'Could not apply that plan.'**
  String get vispSetupDialogCouldNotApplyPlan;

  /// No description provided for @vispSetupDialogTitleNew.
  ///
  /// In en, this message translates to:
  /// **'Describe your server to Visp'**
  String get vispSetupDialogTitleNew;

  /// No description provided for @vispSetupDialogTitleExisting.
  ///
  /// In en, this message translates to:
  /// **'Ask Visp to add to this server'**
  String get vispSetupDialogTitleExisting;

  /// No description provided for @vispSetupDialogDescriptionNew.
  ///
  /// In en, this message translates to:
  /// **'Describe the server you want -- Visp will propose a name and a set of roles, categories, and channels.'**
  String get vispSetupDialogDescriptionNew;

  /// No description provided for @vispSetupDialogDescriptionExisting.
  ///
  /// In en, this message translates to:
  /// **'Describe what you\'d like to add -- Visp will propose roles, categories, and channels to create.'**
  String get vispSetupDialogDescriptionExisting;

  /// No description provided for @vispSetupDialogPromptHintNew.
  ///
  /// In en, this message translates to:
  /// **'e.g. \"A cozy server for my D&D group with voice channels for two tables\"'**
  String get vispSetupDialogPromptHintNew;

  /// No description provided for @vispSetupDialogPromptHintExisting.
  ///
  /// In en, this message translates to:
  /// **'e.g. \"Add a couple more channels for our raid teams\"'**
  String get vispSetupDialogPromptHintExisting;

  /// No description provided for @vispSetupDialogPrivacyNote.
  ///
  /// In en, this message translates to:
  /// **'Your description is sent to Visp (a self-hosted assistant -- nothing leaves Koda\'s servers) to generate this plan.'**
  String get vispSetupDialogPrivacyNote;

  /// No description provided for @vispSetupDialogStartOver.
  ///
  /// In en, this message translates to:
  /// **'Start Over'**
  String get vispSetupDialogStartOver;

  /// No description provided for @vispSetupDialogCreateServer.
  ///
  /// In en, this message translates to:
  /// **'Create Server'**
  String get vispSetupDialogCreateServer;

  /// No description provided for @vispSetupDialogAddToServer.
  ///
  /// In en, this message translates to:
  /// **'Add to Server'**
  String get vispSetupDialogAddToServer;

  /// No description provided for @vispSetupDialogThinking.
  ///
  /// In en, this message translates to:
  /// **'Thinking...'**
  String get vispSetupDialogThinking;

  /// No description provided for @vispSetupDialogGeneratePlan.
  ///
  /// In en, this message translates to:
  /// **'Generate Plan'**
  String get vispSetupDialogGeneratePlan;

  /// No description provided for @vispSetupDialogNewServerLabel.
  ///
  /// In en, this message translates to:
  /// **'New server'**
  String get vispSetupDialogNewServerLabel;

  /// No description provided for @vispSetupDialogRoleCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} role} other{{count} roles}}'**
  String vispSetupDialogRoleCount(int count);

  /// No description provided for @vispSetupDialogCategoryCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} category} other{{count} categories}}'**
  String vispSetupDialogCategoryCount(int count);

  /// No description provided for @vispSetupDialogChannelCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} channel} other{{count} channels}}'**
  String vispSetupDialogChannelCount(int count);

  /// No description provided for @vispSetupDialogBasedOn.
  ///
  /// In en, this message translates to:
  /// **'Based on:'**
  String get vispSetupDialogBasedOn;

  /// No description provided for @childLockoutTitle.
  ///
  /// In en, this message translates to:
  /// **'It\'s outside your allowed hours'**
  String get childLockoutTitle;

  /// No description provided for @childLockoutBody.
  ///
  /// In en, this message translates to:
  /// **'A parent or guardian has set times this account can use Koda. Ask them for more time, or check back during your next allowed window.'**
  String get childLockoutBody;

  /// No description provided for @childLockoutLogOutButton.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get childLockoutLogOutButton;

  /// No description provided for @forcePasswordChangeError.
  ///
  /// In en, this message translates to:
  /// **'Could not update password. Try again.'**
  String get forcePasswordChangeError;

  /// No description provided for @forcePasswordChangeWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {username}'**
  String forcePasswordChangeWelcome(String username);

  /// No description provided for @forcePasswordChangeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your account requires a new password before you can continue.'**
  String get forcePasswordChangeSubtitle;

  /// No description provided for @forcePasswordChangeNewPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get forcePasswordChangeNewPasswordHint;

  /// No description provided for @forcePasswordChangeConfirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get forcePasswordChangeConfirmPasswordHint;

  /// No description provided for @forcePasswordChangeReqLength.
  ///
  /// In en, this message translates to:
  /// **'At least 12 characters'**
  String get forcePasswordChangeReqLength;

  /// No description provided for @forcePasswordChangeReqUpper.
  ///
  /// In en, this message translates to:
  /// **'One uppercase letter'**
  String get forcePasswordChangeReqUpper;

  /// No description provided for @forcePasswordChangeReqLower.
  ///
  /// In en, this message translates to:
  /// **'One lowercase letter'**
  String get forcePasswordChangeReqLower;

  /// No description provided for @forcePasswordChangeReqDigit.
  ///
  /// In en, this message translates to:
  /// **'One number'**
  String get forcePasswordChangeReqDigit;

  /// No description provided for @forcePasswordChangeReqMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords match'**
  String get forcePasswordChangeReqMatch;

  /// No description provided for @forcePasswordChangeSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Set New Password'**
  String get forcePasswordChangeSubmitButton;

  /// No description provided for @forgotPasswordEnterEmailError.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address.'**
  String get forgotPasswordEnterEmailError;

  /// No description provided for @forgotPasswordCodeSentInfo.
  ///
  /// In en, this message translates to:
  /// **'If that account exists, a reset code has been sent.'**
  String get forgotPasswordCodeSentInfo;

  /// No description provided for @forgotPasswordEnterCodeError.
  ///
  /// In en, this message translates to:
  /// **'Enter the code and a password of at least 8 characters.'**
  String get forgotPasswordEnterCodeError;

  /// No description provided for @forgotPasswordInvalidCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid or expired code.'**
  String get forgotPasswordInvalidCode;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get forgotPasswordEmailHint;

  /// No description provided for @forgotPasswordSendCodeButton.
  ///
  /// In en, this message translates to:
  /// **'Send reset code'**
  String get forgotPasswordSendCodeButton;

  /// No description provided for @forgotPasswordCodeHint.
  ///
  /// In en, this message translates to:
  /// **'6-digit code'**
  String get forgotPasswordCodeHint;

  /// No description provided for @forgotPasswordNewPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get forgotPasswordNewPasswordHint;

  /// No description provided for @forgotPasswordSetNewPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Set new password'**
  String get forgotPasswordSetNewPasswordButton;

  /// No description provided for @verifyEmailEnterCodeError.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code from your email.'**
  String get verifyEmailEnterCodeError;

  /// No description provided for @verifyEmailInvalidCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid or expired code.'**
  String get verifyEmailInvalidCode;

  /// No description provided for @verifyEmailResentInfo.
  ///
  /// In en, this message translates to:
  /// **'A new code has been sent to {email}.'**
  String verifyEmailResentInfo(String email);

  /// No description provided for @verifyEmailResendFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not resend right now.'**
  String get verifyEmailResendFailed;

  /// No description provided for @verifyEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get verifyEmailTitle;

  /// No description provided for @verifyEmailSentCode.
  ///
  /// In en, this message translates to:
  /// **'We sent a 6-digit code to {email}'**
  String verifyEmailSentCode(String email);

  /// No description provided for @verifyEmailCodeHint.
  ///
  /// In en, this message translates to:
  /// **'000000'**
  String get verifyEmailCodeHint;

  /// No description provided for @verifyEmailVerifyButton.
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get verifyEmailVerifyButton;

  /// No description provided for @verifyEmailResendButton.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get verifyEmailResendButton;

  /// No description provided for @safetyNumberKeysNotSetUp.
  ///
  /// In en, this message translates to:
  /// **'Your own keys haven\'t been set up yet.'**
  String get safetyNumberKeysNotSetUp;

  /// No description provided for @safetyNumberNoKeyBundle.
  ///
  /// In en, this message translates to:
  /// **'{peerName} has no key bundle yet.'**
  String safetyNumberNoKeyBundle(String peerName);

  /// No description provided for @safetyNumberComputeError.
  ///
  /// In en, this message translates to:
  /// **'Could not compute safety number: {error}'**
  String safetyNumberComputeError(String error);

  /// No description provided for @safetyNumberDeviceGone.
  ///
  /// In en, this message translates to:
  /// **'{peerName} no longer has that device.'**
  String safetyNumberDeviceGone(String peerName);

  /// No description provided for @safetyNumberAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Safety Number with {peerName}'**
  String safetyNumberAppBarTitle(String peerName);

  /// No description provided for @safetyNumberInstructions.
  ///
  /// In en, this message translates to:
  /// **'Compare this number with {peerName} through another channel -- in person, a phone call, anywhere other than this chat. If it matches on both sides, you\'re talking to who you think you\'re talking to.'**
  String safetyNumberInstructions(String peerName);

  /// No description provided for @safetyNumberMultiDeviceNote.
  ///
  /// In en, this message translates to:
  /// **'{peerName} has {count} devices, each with its own safety number -- verifying one doesn\'t cover the others.'**
  String safetyNumberMultiDeviceNote(String peerName, int count);

  /// No description provided for @safetyNumberDeviceLabel.
  ///
  /// In en, this message translates to:
  /// **'Device {number}'**
  String safetyNumberDeviceLabel(int number);

  /// No description provided for @safetyNumberMarkVerifiedButton.
  ///
  /// In en, this message translates to:
  /// **'Mark as Verified'**
  String get safetyNumberMarkVerifiedButton;

  /// No description provided for @contentFiltersDescription.
  ///
  /// In en, this message translates to:
  /// **'Servers can flag channels with content labels. Choose how you want labeled channels to behave -- this is your own preference and never affects what anyone else sees.'**
  String get contentFiltersDescription;

  /// No description provided for @contentFiltersLabelAdult.
  ///
  /// In en, this message translates to:
  /// **'Adult content'**
  String get contentFiltersLabelAdult;

  /// No description provided for @contentFiltersLabelSuggestive.
  ///
  /// In en, this message translates to:
  /// **'Suggestive'**
  String get contentFiltersLabelSuggestive;

  /// No description provided for @contentFiltersLabelGraphic.
  ///
  /// In en, this message translates to:
  /// **'Graphic media'**
  String get contentFiltersLabelGraphic;

  /// No description provided for @contentFiltersLabelNudity.
  ///
  /// In en, this message translates to:
  /// **'Non-sexual nudity'**
  String get contentFiltersLabelNudity;

  /// No description provided for @contentFiltersDescAdult.
  ///
  /// In en, this message translates to:
  /// **'Sexually explicit content'**
  String get contentFiltersDescAdult;

  /// No description provided for @contentFiltersDescSuggestive.
  ///
  /// In en, this message translates to:
  /// **'Sexually suggestive but not explicit content'**
  String get contentFiltersDescSuggestive;

  /// No description provided for @contentFiltersDescGraphic.
  ///
  /// In en, this message translates to:
  /// **'Violence or gore'**
  String get contentFiltersDescGraphic;

  /// No description provided for @contentFiltersDescNudity.
  ///
  /// In en, this message translates to:
  /// **'Nudity in a non-sexual context'**
  String get contentFiltersDescNudity;

  /// No description provided for @contentFiltersHide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get contentFiltersHide;

  /// No description provided for @contentFiltersWarn.
  ///
  /// In en, this message translates to:
  /// **'Warn'**
  String get contentFiltersWarn;

  /// No description provided for @contentFiltersShow.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get contentFiltersShow;

  /// No description provided for @deviceTestCouldNotGetToken.
  ///
  /// In en, this message translates to:
  /// **'Could not get a test token.'**
  String get deviceTestCouldNotGetToken;

  /// No description provided for @deviceTestLabelTest.
  ///
  /// In en, this message translates to:
  /// **'Test'**
  String get deviceTestLabelTest;

  /// No description provided for @deviceTestLabelRecording.
  ///
  /// In en, this message translates to:
  /// **'Recording...'**
  String get deviceTestLabelRecording;

  /// No description provided for @deviceTestLabelPlayingBack.
  ///
  /// In en, this message translates to:
  /// **'Playing back...'**
  String get deviceTestLabelPlayingBack;

  /// No description provided for @deviceTestCouldNotStartCamera.
  ///
  /// In en, this message translates to:
  /// **'Could not start camera: {error}'**
  String deviceTestCouldNotStartCamera(String error);

  /// No description provided for @deviceTestTitle.
  ///
  /// In en, this message translates to:
  /// **'Test Devices'**
  String get deviceTestTitle;

  /// No description provided for @deviceTestCouldNotConnect.
  ///
  /// In en, this message translates to:
  /// **'Could not connect: {error}'**
  String deviceTestCouldNotConnect(String error);

  /// No description provided for @deviceTestMicrophoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Microphone'**
  String get deviceTestMicrophoneLabel;

  /// No description provided for @deviceTestHearYourselfLabel.
  ///
  /// In en, this message translates to:
  /// **'Hear Yourself (Delayed)'**
  String get deviceTestHearYourselfLabel;

  /// No description provided for @deviceTestSpeakerOutputLabel.
  ///
  /// In en, this message translates to:
  /// **'Speaker / Output'**
  String get deviceTestSpeakerOutputLabel;

  /// No description provided for @deviceTestCameraLabel.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get deviceTestCameraLabel;

  /// No description provided for @deviceTestSystemDefault.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get deviceTestSystemDefault;

  /// No description provided for @deviceTestHearYourselfHint.
  ///
  /// In en, this message translates to:
  /// **'Talk, then hear a {seconds}s clip play back'**
  String deviceTestHearYourselfHint(String seconds);

  /// No description provided for @deviceTestSecondsLabel.
  ///
  /// In en, this message translates to:
  /// **'{seconds}s'**
  String deviceTestSecondsLabel(String seconds);

  /// No description provided for @deviceTestCameraPreviewOff.
  ///
  /// In en, this message translates to:
  /// **'Camera preview off'**
  String get deviceTestCameraPreviewOff;

  /// No description provided for @deviceTestStopCameraButton.
  ///
  /// In en, this message translates to:
  /// **'Stop Camera Test'**
  String get deviceTestStopCameraButton;

  /// No description provided for @deviceTestTestCameraButton.
  ///
  /// In en, this message translates to:
  /// **'Test Camera'**
  String get deviceTestTestCameraButton;

  /// No description provided for @deviceTestInputLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Input level'**
  String get deviceTestInputLevelLabel;

  /// No description provided for @devicesScreenRemoveConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove this device?'**
  String get devicesScreenRemoveConfirmTitle;

  /// No description provided for @devicesScreenRemoveConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'It will need to sign in again, and any messages sent to it while removed won\'t reach it after -- Double Ratchet sessions don\'t retroactively fill in gaps.'**
  String get devicesScreenRemoveConfirmBody;

  /// No description provided for @devicesScreenRemoveFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not remove that device.'**
  String get devicesScreenRemoveFailed;

  /// No description provided for @devicesScreenNeverActive.
  ///
  /// In en, this message translates to:
  /// **'Never active'**
  String get devicesScreenNeverActive;

  /// No description provided for @devicesScreenActiveDate.
  ///
  /// In en, this message translates to:
  /// **'Active {date}'**
  String devicesScreenActiveDate(String date);

  /// No description provided for @devicesScreenDescription.
  ///
  /// In en, this message translates to:
  /// **'Each device you sign into has its own encryption identity -- a message sent to you reaches every device below. Remove one you don\'t use or don\'t recognize.'**
  String get devicesScreenDescription;

  /// No description provided for @devicesScreenNoDevicesFound.
  ///
  /// In en, this message translates to:
  /// **'No devices found.'**
  String get devicesScreenNoDevicesFound;

  /// No description provided for @devicesScreenUnknownDevice.
  ///
  /// In en, this message translates to:
  /// **'Unknown device'**
  String get devicesScreenUnknownDevice;

  /// No description provided for @devicesScreenThisDeviceBadge.
  ///
  /// In en, this message translates to:
  /// **'This device'**
  String get devicesScreenThisDeviceBadge;

  /// No description provided for @devicesScreenRemoveDeviceTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove device'**
  String get devicesScreenRemoveDeviceTooltip;

  /// No description provided for @totpSetupInvalidCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid code. Try again.'**
  String get totpSetupInvalidCode;

  /// No description provided for @totpSetupEnabledMessage.
  ///
  /// In en, this message translates to:
  /// **'Two-factor authentication is enabled.'**
  String get totpSetupEnabledMessage;

  /// No description provided for @totpSetupScanInstructions.
  ///
  /// In en, this message translates to:
  /// **'Scan this secret into your authenticator app (Google Authenticator, 1Password, Authy):'**
  String get totpSetupScanInstructions;

  /// No description provided for @totpSetupCodeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter 6-digit code to confirm'**
  String get totpSetupCodeHint;

  /// No description provided for @totpSetupVerifyButton.
  ///
  /// In en, this message translates to:
  /// **'Verify & Enable'**
  String get totpSetupVerifyButton;

  /// No description provided for @voiceVideoSettingsPushToTalkLabel.
  ///
  /// In en, this message translates to:
  /// **'Push to Talk'**
  String get voiceVideoSettingsPushToTalkLabel;

  /// No description provided for @voiceVideoSettingsPressAnyKeyHint.
  ///
  /// In en, this message translates to:
  /// **'Press any key to bind it...'**
  String get voiceVideoSettingsPressAnyKeyHint;

  /// No description provided for @voiceVideoSettingsTestDevicesButton.
  ///
  /// In en, this message translates to:
  /// **'Test Devices'**
  String get voiceVideoSettingsTestDevicesButton;

  /// No description provided for @voiceVideoSettingsSectionVoiceProcessing.
  ///
  /// In en, this message translates to:
  /// **'Voice Processing'**
  String get voiceVideoSettingsSectionVoiceProcessing;

  /// No description provided for @voiceVideoSettingsNoiseSuppressionTitle.
  ///
  /// In en, this message translates to:
  /// **'Noise Suppression'**
  String get voiceVideoSettingsNoiseSuppressionTitle;

  /// No description provided for @voiceVideoSettingsNoiseSuppressionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reduce background noise on your mic'**
  String get voiceVideoSettingsNoiseSuppressionSubtitle;

  /// No description provided for @voiceVideoSettingsDeepNoiseSuppressionTitle.
  ///
  /// In en, this message translates to:
  /// **'Deep Noise Suppression (Windows)'**
  String get voiceVideoSettingsDeepNoiseSuppressionTitle;

  /// No description provided for @voiceVideoSettingsDeepNoiseSuppressionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Real-time AI noise removal, stronger than standard suppression -- replaces it when on'**
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle;

  /// No description provided for @voiceVideoSettingsEchoCancellationTitle.
  ///
  /// In en, this message translates to:
  /// **'Echo Cancellation'**
  String get voiceVideoSettingsEchoCancellationTitle;

  /// No description provided for @voiceVideoSettingsEchoCancellationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Prevent your own audio from echoing back'**
  String get voiceVideoSettingsEchoCancellationSubtitle;

  /// No description provided for @voiceVideoSettingsAutoGainTitle.
  ///
  /// In en, this message translates to:
  /// **'Auto Gain Control'**
  String get voiceVideoSettingsAutoGainTitle;

  /// No description provided for @voiceVideoSettingsAutoGainSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Automatically balance mic volume (loudness normalization)'**
  String get voiceVideoSettingsAutoGainSubtitle;

  /// No description provided for @voiceVideoSettingsAutoDuckingTitle.
  ///
  /// In en, this message translates to:
  /// **'Auto-Ducking'**
  String get voiceVideoSettingsAutoDuckingTitle;

  /// No description provided for @voiceVideoSettingsAutoDuckingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Lower other participants\' volume while you\'re talking'**
  String get voiceVideoSettingsAutoDuckingSubtitle;

  /// No description provided for @voiceVideoSettingsHighPassTitle.
  ///
  /// In en, this message translates to:
  /// **'High-Pass Filter'**
  String get voiceVideoSettingsHighPassTitle;

  /// No description provided for @voiceVideoSettingsHighPassSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Cut low-frequency rumble (fans, AC, desk bumps)'**
  String get voiceVideoSettingsHighPassSubtitle;

  /// No description provided for @voiceVideoSettingsTypingNoiseTitle.
  ///
  /// In en, this message translates to:
  /// **'Typing Noise Detection'**
  String get voiceVideoSettingsTypingNoiseTitle;

  /// No description provided for @voiceVideoSettingsTypingNoiseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Suppress keyboard clatter picked up by your mic'**
  String get voiceVideoSettingsTypingNoiseSubtitle;

  /// No description provided for @voiceVideoSettingsVoiceIsolationTitle.
  ///
  /// In en, this message translates to:
  /// **'Voice Isolation'**
  String get voiceVideoSettingsVoiceIsolationTitle;

  /// No description provided for @voiceVideoSettingsVoiceIsolationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Focus on your voice, filtering out other people and sounds nearby'**
  String get voiceVideoSettingsVoiceIsolationSubtitle;

  /// No description provided for @voiceVideoSettingsSectionMicBoost.
  ///
  /// In en, this message translates to:
  /// **'Mic Boost'**
  String get voiceVideoSettingsSectionMicBoost;

  /// No description provided for @voiceVideoSettingsEnableBoostTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable Boost'**
  String get voiceVideoSettingsEnableBoostTitle;

  /// No description provided for @voiceVideoSettingsEnableBoostSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Preamp gain for a quiet or distant mic -- applied before EQ'**
  String get voiceVideoSettingsEnableBoostSubtitle;

  /// No description provided for @voiceVideoSettingsBandBoost.
  ///
  /// In en, this message translates to:
  /// **'Boost'**
  String get voiceVideoSettingsBandBoost;

  /// No description provided for @voiceVideoSettingsSectionMicEq.
  ///
  /// In en, this message translates to:
  /// **'Mic EQ'**
  String get voiceVideoSettingsSectionMicEq;

  /// No description provided for @voiceVideoSettingsEnableEqTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable EQ'**
  String get voiceVideoSettingsEnableEqTitle;

  /// No description provided for @voiceVideoSettingsEnableEqSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shape your mic before it reaches other people'**
  String get voiceVideoSettingsEnableEqSubtitle;

  /// No description provided for @voiceVideoSettingsBandBass.
  ///
  /// In en, this message translates to:
  /// **'Bass'**
  String get voiceVideoSettingsBandBass;

  /// No description provided for @voiceVideoSettingsBandMid.
  ///
  /// In en, this message translates to:
  /// **'Mid'**
  String get voiceVideoSettingsBandMid;

  /// No description provided for @voiceVideoSettingsBandTreble.
  ///
  /// In en, this message translates to:
  /// **'Treble'**
  String get voiceVideoSettingsBandTreble;

  /// No description provided for @voiceVideoSettingsSectionVad.
  ///
  /// In en, this message translates to:
  /// **'Voice Activity Detection (VOX)'**
  String get voiceVideoSettingsSectionVad;

  /// No description provided for @voiceVideoSettingsEnableVoxTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable VOX'**
  String get voiceVideoSettingsEnableVoxTitle;

  /// No description provided for @voiceVideoSettingsEnableVoxSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Only transmit when you\'re actually speaking'**
  String get voiceVideoSettingsEnableVoxSubtitle;

  /// No description provided for @voiceVideoSettingsSensitivityLabel.
  ///
  /// In en, this message translates to:
  /// **'Sensitivity'**
  String get voiceVideoSettingsSensitivityLabel;

  /// No description provided for @voiceVideoSettingsVadHint.
  ///
  /// In en, this message translates to:
  /// **'Lower = picks up quieter sounds. Higher = only louder speech triggers transmission.'**
  String get voiceVideoSettingsVadHint;

  /// No description provided for @voiceVideoSettingsBoundKeyLabel.
  ///
  /// In en, this message translates to:
  /// **'Bound key'**
  String get voiceVideoSettingsBoundKeyLabel;

  /// No description provided for @voiceVideoSettingsKeyNotSet.
  ///
  /// In en, this message translates to:
  /// **'Not set — mic stays live whenever unmuted'**
  String get voiceVideoSettingsKeyNotSet;

  /// No description provided for @voiceVideoSettingsClearButton.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get voiceVideoSettingsClearButton;

  /// No description provided for @voiceVideoSettingsSetKeyButton.
  ///
  /// In en, this message translates to:
  /// **'Set Key'**
  String get voiceVideoSettingsSetKeyButton;

  /// No description provided for @voiceVideoSettingsChangeButton.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get voiceVideoSettingsChangeButton;

  /// No description provided for @voiceVideoSettingsPushToTalkExplanation.
  ///
  /// In en, this message translates to:
  /// **'When a key is bound, your mic transmits only while you hold that key down. This takes priority over VOX while you\'re in a voice channel.'**
  String get voiceVideoSettingsPushToTalkExplanation;

  /// No description provided for @voiceVideoSettingsSectionVarm.
  ///
  /// In en, this message translates to:
  /// **'VARM - Virtual Avatar Reactive Model'**
  String get voiceVideoSettingsSectionVarm;

  /// No description provided for @voiceVideoSettingsVarmDescription.
  ///
  /// In en, this message translates to:
  /// **'Upload two images that swap when you speak. Visible only to you.'**
  String get voiceVideoSettingsVarmDescription;

  /// No description provided for @voiceVideoSettingsVarmSilentLabel.
  ///
  /// In en, this message translates to:
  /// **'Silent'**
  String get voiceVideoSettingsVarmSilentLabel;

  /// No description provided for @voiceVideoSettingsVarmTalkingLabel.
  ///
  /// In en, this message translates to:
  /// **'Talking'**
  String get voiceVideoSettingsVarmTalkingLabel;

  /// No description provided for @voiceVideoSettingsSpeakingThresholdLabel.
  ///
  /// In en, this message translates to:
  /// **'Speaking threshold'**
  String get voiceVideoSettingsSpeakingThresholdLabel;

  /// No description provided for @voiceVideoSettingsVarmThresholdHint.
  ///
  /// In en, this message translates to:
  /// **'Lower = switches to talking image more easily.'**
  String get voiceVideoSettingsVarmThresholdHint;

  /// No description provided for @voiceVideoSettingsRemoveVarmButton.
  ///
  /// In en, this message translates to:
  /// **'Remove VARM'**
  String get voiceVideoSettingsRemoveVarmButton;

  /// No description provided for @gifPickerNoGifsFound.
  ///
  /// In en, this message translates to:
  /// **'No GIFs found'**
  String get gifPickerNoGifsFound;

  /// No description provided for @gifPickerSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search GIFs...'**
  String get gifPickerSearchHint;

  /// No description provided for @messageSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search this channel...'**
  String get messageSearchHint;

  /// No description provided for @messageSearchTooltip.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get messageSearchTooltip;

  /// No description provided for @messageSearchInitialHint.
  ///
  /// In en, this message translates to:
  /// **'Searches messages already loaded on this device -- older history gets fetched (and decrypted locally) as you scan further back.'**
  String get messageSearchInitialHint;

  /// No description provided for @messageSearchNoMatches.
  ///
  /// In en, this message translates to:
  /// **'No matches'**
  String get messageSearchNoMatches;

  /// No description provided for @messageSearchStartOfHistory.
  ///
  /// In en, this message translates to:
  /// **'Start of channel history'**
  String get messageSearchStartOfHistory;

  /// No description provided for @messageSearchFurtherBackButton.
  ///
  /// In en, this message translates to:
  /// **'Search further back'**
  String get messageSearchFurtherBackButton;

  /// No description provided for @messageSearchUnknownAuthor.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get messageSearchUnknownAuthor;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'cs',
        'de',
        'el',
        'en',
        'es',
        'fr',
        'he',
        'hi',
        'id',
        'it',
        'ja',
        'ko',
        'nl',
        'pl',
        'pt',
        'ru',
        'sv',
        'th',
        'tr',
        'uk',
        'vi',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'sv':
      return AppLocalizationsSv();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
