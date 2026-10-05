// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'ביטול';

  @override
  String get commonSave => 'שמירה';

  @override
  String get commonEdit => 'עריכה';

  @override
  String get commonDelete => 'מחיקה';

  @override
  String get commonCreate => 'יצירה';

  @override
  String get commonClose => 'סגירה';

  @override
  String get commonDone => 'סיום';

  @override
  String get commonDownload => 'הורדה';

  @override
  String get commonDisconnect => 'ניתוק';

  @override
  String get commonNone => 'ללא';

  @override
  String get commonJoin => 'הצטרפות';

  @override
  String get commonDismiss => 'התעלמות';

  @override
  String get commonSubmit => 'שליחה';

  @override
  String get commonConfirm => 'אישור';

  @override
  String get commonRemove => 'הסרה';

  @override
  String get commonRetry => 'ניסיון נוסף';

  @override
  String get commonOk => 'אישור';

  @override
  String get commonYes => 'כן';

  @override
  String get commonNo => 'לא';

  @override
  String get commonSearch => 'חיפוש';

  @override
  String get commonSettings => 'הגדרות';

  @override
  String get commonLoading => 'טוען...';

  @override
  String get settingsLanguageSection => 'שפה';

  @override
  String get settingsLanguageTitle => 'שפת האפליקציה';

  @override
  String get settingsLanguageSystemDefault => 'ברירת מחדל של המערכת';

  @override
  String get settingsLanguageDescription =>
      'בחרו את השפה שבה ממשק Koda עצמו מוצג. זה נפרד מהשפה הראשית של כל שרת, או מהשפה שבה אתם כותבים הודעות.';

  @override
  String get settingsTitle => 'הגדרות';

  @override
  String get settingsSignOut => 'התנתקות';

  @override
  String get settingsSectionMyAccount => 'החשבון שלי';

  @override
  String get settingsSectionSecurity => 'אבטחה';

  @override
  String get settingsSectionAccessibility => 'נגישות';

  @override
  String get settingsSectionBilling => 'חיוב';

  @override
  String get settingsSectionFamily => 'משפחה';

  @override
  String get settingsSectionVoiceVideo => 'קול ווידאו';

  @override
  String get settingsSectionDesktop => 'מחשב שולחני';

  @override
  String get settingsSectionAbout => 'אודות';

  @override
  String get settingsTwoFactorTitle => 'אימות דו-שלבי';

  @override
  String get settingsTwoFactorSubtitle => 'הוסיפו אפליקציית אימות לאבטחה נוספת';

  @override
  String get settingsLinkedDevicesTitle => 'מכשירים מקושרים';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'צפו והסירו מכשירים המחוברים לחשבון זה';

  @override
  String get settingsContentFiltersTitle => 'מסנני תוכן';

  @override
  String get settingsContentFiltersSubtitle => 'בחרו כיצד יוצג תוכן מסומן';

  @override
  String get settingsDmFriendsOnlyTitle => 'אפשרו הודעות פרטיות רק מחברים';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'מי שאינם חברים לא יוכלו לפתוח איתכם שיחה חדשה';

  @override
  String get settingsDmPrivacyError =>
      'לא ניתן היה לעדכן את פרטיות ההודעות הפרטיות.';

  @override
  String get settingsShowVispAvatarTitle => 'הצגת האווטאר של Visp';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'מציג את הפנים ומצב הרוח של Visp בתיבות הדו-שיח של ההגדרה, האירועים והייעוץ שלו';

  @override
  String get settingsHighContrastTitle => 'ניגודיות גבוהה';

  @override
  String get settingsHighContrastSubtitle =>
      'צבעים שחור/לבן טהורים בניגודיות גבוהה בכל האפליקציה -- המעבר טוען מחדש בקצרה את המסך הנוכחי.';

  @override
  String get settingsDyslexiaFontTitle => 'גופן ידידותי לדיסלקציה';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'מחליף את טקסט הגוף ל-OpenDyslexic בכל האפליקציה';

  @override
  String get settingsFontSizeTitle => 'גודל גופן';

  @override
  String get settingsFontSizeSample => 'דג סקרן שט בים מאוכזב ולפתע מצא חברה';

  @override
  String get settingsDensityTitle => 'צפיפות';

  @override
  String get settingsDensityDescription =>
      'משפיע על המרווחים בפקדים סטנדרטיים -- כפתורים, מתגים, תיבות דו-שיח -- לא על כל פריסה מותאמת אישית.';

  @override
  String get settingsDensityCompact => 'צפופה';

  @override
  String get settingsDensityStandard => 'רגילה';

  @override
  String get settingsDensityComfortable => 'נוחה';

  @override
  String get settingsStreamingTitle => 'חשבונות שידור';

  @override
  String get settingsStreamingDescription =>
      'חברו את Twitch/YouTube כדי ששרתים שבהם יש לכם את ההרשאה \"הכרזה בעת שידור חי\" יוכלו לפרסם אוטומטית כשאתם משדרים חי או מעלים סרטון חדש.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform מחובר בתור $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform לא מחובר';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- משדר עכשיו';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- העלאה חדשה';

  @override
  String get settingsStreamingConnecting => 'מתחבר...';

  @override
  String get settingsStreamingConnect => 'חיבור';

  @override
  String get settingsAnnounceLiveTwitch => 'הכריזו כשאני משדר חי';

  @override
  String get settingsAnnounceLiveYoutube =>
      'הכריזו על שידורים חיים והעלאות חדשות';

  @override
  String get settingsRefreshStatus => 'כבר מחוברים בדפדפן? רעננו את הסטטוס';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'לא ניתן היה להתחיל את חיבור $platform.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'סיימו את החיבור בדפדפן שלכם, ואז חזרו ורעננו.';

  @override
  String get settingsThroneTitle => 'Webhook של Throne';

  @override
  String get settingsThroneDescription =>
      'הדביקו כתובת URL זו בהגדרות ה-webhook של Throne.com כדי לקבל התראות ב-Koda בכל פעם שמישהו שולח לכם מתנה.';

  @override
  String get settingsThroneGetUrl => 'קבלת כתובת ה-webhook שלי';

  @override
  String get settingsThroneCopyTooltip => 'העתקה';

  @override
  String get settingsThroneCopiedToast => 'הועתק ללוח';

  @override
  String get settingsThroneRegenerateTooltip =>
      'יצירה מחדש (מבטל את הכתובת הישנה)';

  @override
  String get settingsThroneRegenerateConfirmTitle =>
      'ליצור מחדש את כתובת ה-webhook?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'הכתובת הישנה שלכם תפסיק לעבוד, אז עדכנו אותה לאחר מכן ב-Throne.com.';

  @override
  String get settingsThroneRegenerate => 'יצירה מחדש';

  @override
  String get settingsUploadPhoto => 'העלאת תמונה';

  @override
  String get settingsOrPasteUrl => 'או הדביקו כתובת URL למטה';

  @override
  String get settingsAvatarUrlHint => 'https://example.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'העלאת תמונה דורשת Cloudflare R2 — הדבקת כתובת URL עובדת תמיד.';

  @override
  String get settingsDisplayNameLabel => 'שם תצוגה';

  @override
  String get settingsDisplayNameHint => 'שם תצוגה';

  @override
  String get settingsBioLabel => 'אודות';

  @override
  String get settingsBioHint => 'ספרו לאחרים קצת על עצמכם';

  @override
  String get settingsPronounsLabel => 'כינויי גוף';

  @override
  String get settingsPronounsHint => 'למשל הוא/שלו';

  @override
  String get settingsShowPronounsTitle => 'הצגת כינויי הגוף שלי לאחרים';

  @override
  String get settingsShowPronounsSubtitle =>
      'מוצגים ליד השם שלכם בצ\'אט, ברשימות חברים ובקול';

  @override
  String get settingsStatusLabel => 'סטטוס';

  @override
  String get settingsCustomStatusLabel => 'סטטוס מותאם אישית';

  @override
  String get settingsCustomStatusHint => 'מה קורה?';

  @override
  String get statusOnline => 'מקוון';

  @override
  String get statusAway => 'לא נמצא';

  @override
  String get statusDnd => 'נא לא להפריע';

  @override
  String get statusInvisible => 'בלתי נראה';

  @override
  String get settingsFamilyNotAvailable =>
      'בקרת הורים אינה זמינה בחשבון בפיקוח.';

  @override
  String get settingsAboutTitle => 'אודות Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'תנאים והגבלות';

  @override
  String get settingsPrivacyTitle => 'מדיניות פרטיות';

  @override
  String get settingsSupportTitle => 'תמיכה';

  @override
  String get settingsReportSecurityTitle => 'דיווח על בעיית אבטחה';

  @override
  String get settingsDesktopNotAvailable =>
      'אלו הגדרות ייעודיות למחשב שולחני -- אין חלון או מגש מערכת בפלטפורמה זו.';

  @override
  String get settingsCloseToTrayTitle => 'סגירה למגש המערכת';

  @override
  String get settingsCloseToTraySubtitle =>
      'סגירת החלון משאירה את Koda פועלת ברקע כך שתמשיכו לקבל התראות -- כבו זאת כדי שסגירת החלון תסגור בפועל את האפליקציה.';

  @override
  String get authErrorEmailPasswordRequired => 'נדרשים דוא\"ל וסיסמה.';

  @override
  String get authErrorIncorrectCredentials => 'דוא\"ל או סיסמה שגויים.';

  @override
  String get authErrorMustAcceptTerms => 'יש לאשר את התנאים וההגבלות.';

  @override
  String get authErrorAllFieldsRequired => 'כל השדות נדרשים.';

  @override
  String get authErrorPasswordsDontMatch => 'הסיסמאות אינן תואמות.';

  @override
  String get authErrorPasswordTooShort => 'הסיסמה חייבת להכיל לפחות 8 תווים.';

  @override
  String get authErrorRegistrationFailed =>
      'ההרשמה נכשלה. ייתכן שכתובת הדוא\"ל כבר בשימוש.';

  @override
  String get authTabSignIn => 'התחברות';

  @override
  String get authTabCreateAccount => 'יצירת חשבון';

  @override
  String get authAgreementPrefix => 'השימוש ב-Koda מהווה הסכמה ל';

  @override
  String get authTermsLink => 'תנאים ולהגבלות';

  @override
  String get authAgreementMiddle => ' ול';

  @override
  String get authPrivacyLink => 'מדיניות הפרטיות';

  @override
  String get authAgreementSuffix => ' שלנו.';

  @override
  String get authEmailHint => 'כתובת דוא\"ל';

  @override
  String get authPasswordHint => 'סיסמה';

  @override
  String get authForgotPassword => 'שכחתם סיסמה?';

  @override
  String get authSignInButton => 'התחברות';

  @override
  String get authUsernameHint => 'שם משתמש';

  @override
  String get authConfirmPasswordHint => 'אימות סיסמה';

  @override
  String get authAccessCodeHint => 'קוד גישה (אם יש לך)';

  @override
  String get authAgreeToTerms =>
      'אני מסכים/ה לתנאים ולהגבלות ולמדיניות הפרטיות';

  @override
  String get authCreateAccountButton => 'יצירת חשבון';

  @override
  String get dmSafetyNumberChangedWarning =>
      'מספר האבטחה של שיחה זו השתנה -- אמתו אותו לפני השליחה.';

  @override
  String get dmMessageNotSent => 'ההודעה לא נשלחה.';

  @override
  String dmEncryptMessageError(String error) {
    return 'לא ניתן היה להצפין את ההודעה: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'העלאת הקובץ המצורף נכשלה.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'לא ניתן היה להצפין את הקובץ המצורף: $error';
  }

  @override
  String get dmReportMessage => 'דיווח על הודעה';

  @override
  String get dmReportSubmitted => 'הדיווח נשלח.';

  @override
  String get dmTitle => 'הודעות';

  @override
  String get dmNewMessage => 'הודעה חדשה';

  @override
  String get dmNoConversationsYet => 'אין עדיין שיחות';

  @override
  String get dmSelectConversation => 'בחרו שיחה';

  @override
  String get dmVerifySafetyNumberTooltip => 'אימות מספר אבטחה';

  @override
  String get dmSeenLabel => 'נצפה';

  @override
  String get dmMessageActionsTooltip => 'פעולות הודעה';

  @override
  String get dmRemoveAttachmentTooltip => 'הסרת קובץ מצורף';

  @override
  String get dmAttachFileTooltip => 'צירוף קובץ';

  @override
  String get dmMessageHint => 'הודעה...';

  @override
  String get dmSendMessageTooltip => 'שליחת הודעה';

  @override
  String get dmNoFriendsYet => 'אין עדיין חברים.\nשלחו בקשת חברות כדי להתחיל.';

  @override
  String get dmUnfriendTooltip => 'הסרת חברות';

  @override
  String get dmNoPendingRequests => 'אין בקשות חברות ממתינות.';

  @override
  String get dmIncomingRequestsLabel => 'נכנסות';

  @override
  String get dmSentRequestsLabel => 'נשלחו';

  @override
  String get dmAcceptTooltip => 'קבלה';

  @override
  String get dmDeclineTooltip => 'דחייה';

  @override
  String get dmPendingLabel => 'ממתין';

  @override
  String get dmNewMessageDialogTitle => 'הודעה חדשה';

  @override
  String get dmEnterUsernameHint => 'הזינו שם משתמש';

  @override
  String get dmOpenButton => 'פתיחה';

  @override
  String dmSavedAttachment(String fileName) {
    return '$fileName נשמר';
  }

  @override
  String get dmUnknownUser => 'לא ידוע';

  @override
  String get dmEndToEndEncryptedTooltip => 'מוצפן מקצה לקצה';

  @override
  String get homeContentWarningTitle => 'אזהרת תוכן';

  @override
  String homeContentWarningBody(String labels) {
    return 'ערוץ זה מסומן בגין: $labels.\n\nניתן לשנות זאת בהגדרות > אבטחה > מסנני תוכן.';
  }

  @override
  String get homeViewAnyway => 'הצגה בכל זאת';

  @override
  String get homeCouldNotConnectVoice => 'לא ניתן היה להתחבר לערוץ קולי.';

  @override
  String get homeVoiceChannelFull => 'ערוץ קולי זה מלא.';

  @override
  String get homeCreateServer => 'יצירת שרת';

  @override
  String get homeJoinServer => 'הצטרפות לשרת';

  @override
  String get homeRedeemCode => 'מימוש קוד';

  @override
  String get homeJoinServerDialogTitle => 'הצטרפות לשרת';

  @override
  String get homeEnterInviteCode => 'הזינו קוד הזמנה או כתובת URL:';

  @override
  String get homeInviteCodeHint => 'למשל XK9MP2';

  @override
  String get homeJoined => 'הצטרפתם!';

  @override
  String get homeInvalidInvite => 'קוד הזמנה לא תקין או שפג תוקפו.';

  @override
  String get homeJoinButton => 'הצטרפות';

  @override
  String get homeRedeemCodeDialogTitle => 'מימוש קוד';

  @override
  String get homeEnterBackerCode => 'הזינו את קוד התומך או קוד הפרס שלכם:';

  @override
  String get homeRewardCodeHint => 'קוד פרס';

  @override
  String get homeCodeRedeemed => 'הקוד מומש! הפרסים שלכם הוחלו.';

  @override
  String get homeInvalidRedeemCode => 'קוד לא תקין, שפג תוקפו, או שכבר מומש.';

  @override
  String get homeRedeemButton => 'מימוש';

  @override
  String get homeAreFriends => 'אתם חברים';

  @override
  String get homeAddFriend => 'הוספת חבר';

  @override
  String homeFriendRequestSent(String username) {
    return 'בקשת חברות נשלחה אל $username!';
  }

  @override
  String get homeMessageButton => 'הודעה';

  @override
  String get homeSendTip => 'שליחת טיפ';

  @override
  String get homeSwitchToServer => 'מעבר לשרת';

  @override
  String get homeInvitePeople => 'הזמנת אנשים';

  @override
  String get homeServerSettingsMenuItem => 'הגדרות שרת';

  @override
  String get homeLeaveServerMenuItem => 'עזיבת השרת';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return 'לעזוב את $serverName? תוכלו להצטרף שוב באמצעות הזמנה.';
  }

  @override
  String get homeLeaveButton => 'עזיבה';

  @override
  String get homeCreateAServer => 'יצירת שרת';

  @override
  String get homeServerNameHint => 'שם השרת';

  @override
  String get homeDescribeToVisp => 'לתאר זאת ל-Visp במקום';

  @override
  String get homeMarkAsRead => 'סימון כנקרא';

  @override
  String get homeEditChannel => 'עריכת ערוץ';

  @override
  String get homeDeleteChannel => 'מחיקת ערוץ';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return 'למחוק את #$channelName? לא ניתן לבטל פעולה זו.';
  }

  @override
  String get homeDeleteButton => 'מחיקה';

  @override
  String get homeCreateChannelHere => 'יצירת ערוץ כאן';

  @override
  String get homeEditCategory => 'עריכת קטגוריה';

  @override
  String get homeDeleteCategory => 'מחיקת קטגוריה';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return 'למחוק את \"$categoryName\"? הערוצים בתוכה יהפכו לחסרי קטגוריה.';
  }

  @override
  String get homeReplyAction => 'תגובה';

  @override
  String get homeCreateThreadAction => 'יצירת שרשור';

  @override
  String get homeEditMessageAction => 'עריכת הודעה';

  @override
  String get homeDeleteMessageAction => 'מחיקת הודעה';

  @override
  String get homePinMessageAction => 'נעיצת הודעה';

  @override
  String get homeUnpinMessageAction => 'ביטול נעיצת הודעה';

  @override
  String get homeReportMessageAction => 'דיווח על הודעה';

  @override
  String get homeReportSubmitted => 'הדיווח נשלח.';

  @override
  String get messageActionForward => 'העבר הלאה';

  @override
  String messageForwardedFromLabel(String name) {
    return 'הועבר מאת $name';
  }

  @override
  String get forwardDestinationPickerTitle => 'העברת הודעה';

  @override
  String get forwardDestinationPickerChannelsTab => 'ערוצים';

  @override
  String get forwardDestinationPickerDmsTab => 'הודעות ישירות';

  @override
  String get forwardDestinationPickerNoServers => 'אינך חבר באף שרת עדיין.';

  @override
  String get forwardDestinationPickerNoChannels => 'אין ערוצי טקסט בשרת זה.';

  @override
  String get forwardDestinationPickerNoConversations => 'אין עדיין שיחות.';

  @override
  String get forwardSuccessToast => 'ההודעה הועברה.';

  @override
  String get forwardFailedToast => 'לא ניתן היה להעביר את ההודעה -- נסה שוב.';

  @override
  String get homeAddReactionTitle => 'הוספת תגובה';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count שרשורים',
      many: '$count שרשורים',
      two: '$count שרשורים',
      one: 'שרשור אחד',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'אפשרויות קטגוריה';

  @override
  String get homeChannelOptionsTooltip => 'אפשרויות ערוץ';

  @override
  String get homeOpenVoiceChatTooltip => 'פתיחת צ\'אט';

  @override
  String get homeMarketplaceLabel => 'שוק';

  @override
  String get homeSelectChannelPrompt => 'בחרו ערוץ';

  @override
  String get homeSearchTooltip => 'חיפוש';

  @override
  String get homePinnedMessagesTooltip => 'הודעות נעוצות';

  @override
  String get homeWaitingForKey => 'ממתין להגעת מפתח ההצפנה...';

  @override
  String get homeUnableToDecrypt => 'לא ניתן לפענח הודעה זו.';

  @override
  String get homeMessageActionsTooltip => 'פעולות הודעה';

  @override
  String get homeCancelReplyTooltip => 'ביטול תגובה';

  @override
  String get homeRemoveAttachmentTooltip => 'הסרת קובץ מצורף';

  @override
  String get homeAttachFileTooltip => 'צירוף קובץ';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'הודעה אל #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'שליחת הודעה';

  @override
  String get homeEditMessageTitle => 'עריכת הודעה';

  @override
  String get homeMessageLabel => 'הודעה';

  @override
  String get homePinnedMessagesTitle => 'הודעות נעוצות';

  @override
  String get homeNoPinnedMessages => 'אין הודעות נעוצות';

  @override
  String get homeUnpinTooltip => 'ביטול נעיצה';

  @override
  String get homeCreateThreadTitle => 'יצירת שרשור';

  @override
  String get homeThreadNameHint => 'שם השרשור';

  @override
  String homeThreadCreated(String name) {
    return 'השרשור \"$name\" נוצר!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'יצירה או הצטרפות';

  @override
  String get homeKodaMarketplaceTooltip => 'השוק של Koda';

  @override
  String get homeAdminPanelTooltip => 'פאנל ניהול';

  @override
  String get homeServerSettingsTooltip => 'הגדרות שרת';

  @override
  String get homeSettingsTooltip => 'הגדרות';

  @override
  String get homeContentWarningBadge => 'אזהרת תוכן';

  @override
  String get homeDirectMessagesTooltip => 'הודעות פרטיות';

  @override
  String homeReplyingTo(String username) {
    return 'משיבים ל-$username';
  }

  @override
  String get homeAttachmentFallback => 'קובץ מצורף';

  @override
  String get homeAttachmentUploadFailed => 'העלאת הקובץ המצורף נכשלה.';

  @override
  String homeSavedAttachment(String fileName) {
    return '$fileName נשמר';
  }

  @override
  String serverConnectError(String service) {
    return 'לא ניתן היה להתחיל את חיבור $service.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'לנתק את Printful?';

  @override
  String get serverDisconnectPrintfulBody =>
      'שרת זה לא יוכל עוד למלא הזמנות מרצ\' עד שיחובר מחדש.';

  @override
  String get serverDisconnectTiltifyTitle => 'לנתק את Tiltify?';

  @override
  String get serverDisconnectTiltifyBody =>
      'שרת זה יפסיק להציג את ההתקדמות של מסע התרמת הצדקה שלו עד שיחובר מחדש.';

  @override
  String get serverNewRoleTitle => 'תפקיד חדש';

  @override
  String get serverEditRoleTitle => 'עריכת תפקיד';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'צבע $hex';
  }

  @override
  String get permViewChannels => 'צפייה בערוצים';

  @override
  String get permSendMessages => 'שליחת הודעות';

  @override
  String get permConnectVoice => 'התחברות לערוץ קולי';

  @override
  String get permManageServer => 'ניהול השרת';

  @override
  String get permManageChannels => 'ניהול ערוצים';

  @override
  String get permManageRoles => 'ניהול תפקידים';

  @override
  String get permManageMessages => 'ניהול הודעות';

  @override
  String get permKickMembers => 'הרחקת חברים';

  @override
  String get permBanMembers => 'חסימת חברים';

  @override
  String get permMuteMembers => 'השתקת חברים';

  @override
  String get permMentionEveryone => 'אזכור @everyone';

  @override
  String get permManageMarketplace => 'ניהול השוק';

  @override
  String get permAnnounceLive => 'הכרזה בעת שידור חי';

  @override
  String get permMoveMembers => 'העברת חברים (קול)';

  @override
  String get serverRoleNameHint => 'שם התפקיד';

  @override
  String get serverColorLabel => 'צבע';

  @override
  String get serverPermissionsLabel => 'הרשאות';

  @override
  String get serverSelfAssignableTitle => 'ניתן להקצאה עצמית';

  @override
  String get serverSelfAssignableSubtitle =>
      'חברים יכולים להקצות לעצמם תפקיד זה';

  @override
  String get serverDefaultRoleUndeletable =>
      'לא ניתן למחוק את תפקיד ברירת המחדל.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'למחוק את התפקיד \"$roleName\"?';
  }

  @override
  String get serverCouldNotDeleteRole => 'לא ניתן היה למחוק את התפקיד הזה.';

  @override
  String get serverMemberFallback => 'חבר';

  @override
  String get serverNoRolesYet => 'אין עדיין תפקידים.';

  @override
  String get serverRefreshStatus => 'כבר מחוברים בדפדפן? רעננו את הסטטוס';

  @override
  String get serverPrintfulConnected => 'Printful מחובר';

  @override
  String get serverPrintfulNotConnected => 'Printful לא מחובר';

  @override
  String get serverPrintfulDescription =>
      'חברו את חשבון ה-Printful של שרת זה כדי למלא הזמנות מרצ\' שבוצעו דרך Koda. כל שרת מחבר חנות משלו.';

  @override
  String get serverConnecting => 'מתחבר...';

  @override
  String get serverConnectPrintful => 'חיבור Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify מחובר';

  @override
  String get serverTiltifyNotConnected => 'Tiltify לא מחובר';

  @override
  String get serverTiltifyDescription =>
      'חברו את חשבון ה-Tiltify של שרת זה כדי להציג לכל החברים את ההתקדמות בזמן אמת של מסע התרמת צדקה. לקריאה בלבד -- Koda לעולם לא מפרסמת או משנה דבר בצד של Tiltify.';

  @override
  String get serverConnectTiltify => 'חיבור Tiltify';

  @override
  String get serverNoTiltifyCampaigns => 'לא נמצאו מסעות בחשבון Tiltify זה.';

  @override
  String get serverPickCampaign => 'בחרו איזה מסע יוצג';

  @override
  String get serverUntitledCampaign => 'מסע ללא שם';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return 'נאספו $currency $raised מתוך יעד של $goal';
  }

  @override
  String get serverViewCampaign => 'הצגת המסע';

  @override
  String get serverRefreshButton => 'רענון';

  @override
  String get serverUploadButton => 'העלאה';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '$used / $limit משבצות בשימוש -- רמת חיזוק $level';
  }

  @override
  String get serverNoCustomEmoji => 'אין עדיין אימוג\'ים מותאמים אישית.';

  @override
  String get serverDeleteEmojiTooltip => 'מחיקת אימוג\'י';

  @override
  String get serverUploadEmojiTitle => 'העלאת אימוג\'י';

  @override
  String get serverEmojiNameHint => 'שם (אותיות, ספרות, _)';

  @override
  String get serverChooseImage => 'בחירת תמונה';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'רמת חיזוק נוכחית: $level';
  }

  @override
  String get serverBackgroundTitle => 'רקע השרת';

  @override
  String get serverBackgroundDescription =>
      'רקע מותאם אישית המוצג מאחורי תצוגת הערוצים לכל מי שנמצא בשרת זה.';

  @override
  String get serverBackgroundLockedHint =>
      'הגיעו לרמת חיזוק 4 כדי לפתוח רקע מותאם אישית.';

  @override
  String get serverIconBorderTitle => 'מסגרת סמל השרת';

  @override
  String get serverIconBorderDescription =>
      'מסגרת הדגשה סביב סמל השרת הזה ברשימת השרתים של כל חבר.';

  @override
  String get serverIconBorderLockedHint =>
      'הגיעו לרמת חיזוק 5 כדי לפתוח מסגרת סמל מותאמת אישית.';

  @override
  String get serverBoostFromBank =>
      'חזקו שרת זה מתוך בנק השרת בשוק כדי להעלות את רמתו.';

  @override
  String get serverMarketplaceListingLabel => 'רישום בשוק';

  @override
  String get serverListInMarketplace => 'רישום בשוק של Koda';

  @override
  String get serverListInMarketplaceDescription =>
      'מציג את החנות של השרת הזה ב-Koda Marketplace, עם סיכוי להופיע בסבב הפריטים המומלצים השבועי. זה קשור לקניות, לא למציאת שרתים להצטרפות -- אין לכך השפעה על חיפוש שרתים כללי.';

  @override
  String get serverSocialLinkLabel => 'קישור חברתי / קישור הזמנה (אופציונלי)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'שמירת קישור';

  @override
  String get serverPricingLabel => 'תמחור';

  @override
  String get serverPrimaryCurrencyLabel => 'מטבע ראשי';

  @override
  String get serverPrimaryCurrencyDescription =>
      'חל על רמות המנוי לשרת ועל מחירי הטובין הדיגיטליים שאתם מגדירים עבור שרת זה.';

  @override
  String get serverPrimaryLanguageLabel => 'שפה ראשית';

  @override
  String get serverPrimaryLanguageDescription =>
      'הודעות שחברים מפרסמים בשפה אחרת מקבלות תג שפה קטן, בהשוואה להגדרה זו.';

  @override
  String get serverMarketplaceLinkSaved => 'קישור השוק נשמר.';

  @override
  String get serverIconUpdated => 'סמל השרת עודכן!';

  @override
  String get serverTemplateImported => 'התבנית יובאה!';

  @override
  String get serverImportFromDiscord => 'ייבוא מ-Discord';

  @override
  String get serverVispPlanLive => 'התוכנית של Visp מוכנה!';

  @override
  String get serverAskVisp => 'לשאול את Visp';

  @override
  String get serverAddCategoryButton => 'הוספת קטגוריה';

  @override
  String get serverAddChannelHereTooltip => 'הוספת ערוץ כאן';

  @override
  String get serverRename => 'שינוי שם';

  @override
  String get serverUncategorized => 'ללא קטגוריה';

  @override
  String get serverAddChannel => 'הוספת ערוץ';

  @override
  String get serverEditRulesContent => 'עריכת תוכן הכללים';

  @override
  String get serverRulesContentHint => 'הזינו כאן את כללי השרת שלכם...';

  @override
  String get serverRulesUpdated => 'הכללים עודכנו!';

  @override
  String get serverAddRole => 'הוספת תפקיד';

  @override
  String get serverDefaultRoleLabel => 'תפקיד ברירת מחדל';

  @override
  String get serverManageRolesTooltip => 'ניהול תפקידים';

  @override
  String get serverMutedLabel => 'מושתק';

  @override
  String get serverExpandedLabel => 'מורחב';

  @override
  String get serverCollapsedLabel => 'מכווץ';

  @override
  String get serverUnmute => 'ביטול השתקה';

  @override
  String get serverMute => 'השתקה';

  @override
  String get serverKick => 'הרחקה';

  @override
  String get serverBan => 'חסימה';

  @override
  String serverBannedUsersLabel(int count) {
    return 'משתמשים חסומים — $count';
  }

  @override
  String get serverNoBannedUsers => 'אין משתמשים חסומים.';

  @override
  String get serverUnban => 'ביטול חסימה';

  @override
  String get serverMemberFallbackGeneric => 'חבר זה';

  @override
  String serverBanConfirm(String username, String serverName) {
    return 'לחסום את $username מ-$serverName? הוא/היא לא יוכלו להצטרף שוב בלי שהחסימה תבוטל.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return 'להרחיק את $username מ-$serverName? הוא/היא יוכלו להצטרף שוב באמצעות הזמנה.';
  }

  @override
  String get serverMuteDuration60Sec => '60 שניות';

  @override
  String get serverMuteDuration5Min => '5 דקות';

  @override
  String get serverMuteDuration10Min => '10 דקות';

  @override
  String get serverMuteDuration1Hour => 'שעה אחת';

  @override
  String get serverMuteDuration1Day => 'יום אחד';

  @override
  String get serverMuteDuration1Week => 'שבוע אחד';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'לא ניתן היה לבצע \"$action\" עבור $username.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return 'השתקת $username';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'לא ניתן היה להשתיק את $username.';
  }

  @override
  String get serverUnlockInvites => 'שחרור נעילת הזמנות';

  @override
  String get serverInvitesUnlocked => 'נעילת ההזמנות שוחררה.';

  @override
  String get serverAuditLogDescription =>
      'פעילות מודרציה מדרגה 1 -- הרחקות, חסימות, השתקות והגנה אוטומטית מפני הצפה/פשיטות. מטא-דאטה בלבד; לעולם לא תוכן ההודעות.';

  @override
  String get serverSystemActor => 'מערכת';

  @override
  String get serverActionKicked => 'הורחק/ה';

  @override
  String get serverActionBanned => 'נחסם/ה';

  @override
  String get serverActionUnbanned => 'חסימתו/ה בוטלה';

  @override
  String get serverActionMuted => 'הושתק/ה';

  @override
  String get serverActionUnmuted => 'השתקתו/ה בוטלה';

  @override
  String get serverActionFloodDetected => 'הושתק/ה אוטומטית בשל הצפה';

  @override
  String get serverActionRaidLockdownEnabled =>
      'נעל/ה הזמנות (הגנה מפני פשיטה)';

  @override
  String get serverActionRaidLockdownDisabled => 'שחרר/ה נעילת הזמנות';

  @override
  String get serverActionMoved => 'הועבר/ה';

  @override
  String get serverUnknownAction => 'פעולה לא ידועה';

  @override
  String get serverNoModerationActivity => 'אין עדיין פעילות מודרציה.';

  @override
  String get serverReportsDescription =>
      'הודעות שדווחו על ידי חברי שרת זה -- העותק המפוענח כבר של המדווח/ת עצמו/ה, שנחשף באמצעות הדיווח.';

  @override
  String get serverNoPendingReports => 'אין דיווחים ממתינים.';

  @override
  String get serverReportReasonOther => 'אחר';

  @override
  String get serverReportStatusActioned => 'טופל';

  @override
  String get serverReportStatusDismissed => 'נדחה';

  @override
  String get serverResolvedLabel => 'טופלו';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'דווח על ידי $reporter -- נשלח על ידי $target';
  }

  @override
  String serverReportNote(String note) {
    return 'הערה: $note';
  }

  @override
  String get serverDismissButton => 'דחייה';

  @override
  String get serverMarkActioned => 'סימון כטופל';

  @override
  String get serverCreateInvite => 'יצירת הזמנה';

  @override
  String get serverInviteCreatedTitle => 'ההזמנה נוצרה';

  @override
  String get serverNoActiveInvites => 'אין הזמנות פעילות';

  @override
  String serverUsesLabel(String uses) {
    return 'שימושים: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'מחיקת הזמנה';

  @override
  String get serverChangeIconLabel => 'שינוי סמל השרת';

  @override
  String get serverFallbackName => 'שרת';

  @override
  String serverSettingsTitle(String serverName) {
    return 'הגדרות $serverName';
  }

  @override
  String get serverTabChannels => 'ערוצים';

  @override
  String get serverTabRoles => 'תפקידים';

  @override
  String get serverTabMembers => 'חברים';

  @override
  String get serverTabInvites => 'הזמנות';

  @override
  String get serverTabMerch => 'מרצ\'נדייז';

  @override
  String get serverTabEmoji => 'אימוג\'ים';

  @override
  String get serverTabCustomize => 'התאמה אישית';

  @override
  String get serverTabAuditLog => 'יומן ביקורת';

  @override
  String get serverTabReports => 'דיווחים';

  @override
  String get serverTabThresholdMod => 'מודרציית סף';

  @override
  String get serverTabCharity => 'צדקה';

  @override
  String get homeCustomEmojiFallback => 'אימוג\'י מותאם אישית';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תגובות',
      many: '$count תגובות',
      two: '$count תגובות',
      one: 'תגובה אחת',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted => ', הגבתם, הפעילו כדי להסיר';

  @override
  String get homeReactionActivateToAdd => ', הפעילו כדי להוסיף';

  @override
  String get homeAddReactionLabel => 'הוספת תגובה';

  @override
  String homeViewProfile(String username) {
    return 'הצגת הפרופיל של $username';
  }

  @override
  String get homeMoveToVoiceChannel => 'העבר לערוץ קולי…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'בחר ערוץ קולי';

  @override
  String get homeNoOtherVoiceChannels => 'אין ערוצים קוליים אחרים';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username נמצא כעת בערוץ $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'לא ניתן להעביר את $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'הועברת לערוץ $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'הצטרפו ל-$channel כדי לדבר';
  }

  @override
  String get adminPanelTitle => 'פאנל ניהול';

  @override
  String get adminTabBackerCodes => 'קודי תומכים';

  @override
  String get adminTabUsers => 'משתמשים';

  @override
  String get adminTabDmReports => 'דיווחי הודעות פרטיות';

  @override
  String get adminTabSpamFlags => 'דגלי ספאם';

  @override
  String get adminTabWiki => 'ויקי';

  @override
  String get adminTabBoosts => 'בוסטים';

  @override
  String get adminCreateBackerCodeTitle => 'יצירת קוד תומך';

  @override
  String get adminCodeHint => 'קוד (השאירו ריק ליצירה אוטומטית)';

  @override
  String get adminNoteHint => 'הערה (למשל \"Kickstarter Tier 2\")';

  @override
  String get adminFlagsJsonHint =>
      'דגלים כ-JSON, למשל \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint =>
      'מספר שימושים מקסימלי (השאירו ריק = ללא הגבלה)';

  @override
  String get adminCodeCreatedTitle => 'הקוד נוצר';

  @override
  String get adminCodeLabel => 'קוד:';

  @override
  String get adminCopyCodeTooltip => 'העתקת קוד';

  @override
  String adminFlagsValue(String flags) {
    return 'דגלים: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'קודי תומכים ותגמולים';

  @override
  String get adminNewCodeButton => 'קוד חדש';

  @override
  String get adminNoCodesYet => 'אין עדיין קודים';

  @override
  String get adminRewardsHeader => 'תגמולים';

  @override
  String get adminRewardAlphaBetaAccess => 'גישת אלפא/בטא + תג Alpha Spark';

  @override
  String get adminRewardLifetimePulse =>
      'מעמד Pulse לכל החיים + תג Founder + קצב סיביות משופר לצמיד';

  @override
  String get adminRewardMonthlyBoostTokenOne =>
      'אסימון חיזוק שרת חודשי (אודיו/וידאו משופרים)';

  @override
  String get adminRewardAnimatedFrameBundle =>
      'מסגרת פרופיל מונפשת + היכל המייסדים + 2 אסימוני שרת חודשיים';

  @override
  String get adminRewardTitanGlow => 'זוהר שם משתמש \"Titan\" קבוע';

  @override
  String get adminRewardAnimatedFrame => 'מסגרת מונפשת';

  @override
  String get adminRewardFoundersHall => 'היכל המייסדים';

  @override
  String adminRewardMonthlyBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count אסימוני חיזוק לחודש',
      one: 'אסימון חיזוק אחד לחודש',
    );
    return '$_temp0';
  }

  @override
  String get adminRewardsNone => 'אין תגמולים';

  @override
  String get adminRegistrationOpenLabel => 'ההרשמה פתוחה לכולם';

  @override
  String get adminRegistrationInviteOnlyLabel =>
      'ההרשמה היא בהזמנה בלבד (נדרש קוד תומך)';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses שימושים';
  }

  @override
  String get adminSearchUsersHint => 'חיפוש משתמשים לפי שם משתמש...';

  @override
  String get adminSearchUsersPrompt => 'חפשו משתמש למעלה';

  @override
  String get adminNoDmReports => 'אין דיווחי הודעות פרטיות.';

  @override
  String get adminResolvedLabel => 'טופל';

  @override
  String get adminReasonOther => 'אחר';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'מדווח/ת: $reporterId\nשולח/ת שנחשף/ה: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'הערה: $note';
  }

  @override
  String get adminDismissButton => 'התעלמות';

  @override
  String get adminMarkActionedButton => 'סימון כטופל';

  @override
  String get adminStatusActioned => 'טופל/ה';

  @override
  String get adminStatusDismissed => 'נדחה/תה';

  @override
  String get adminNoSpamFlags => 'אין דגלי ספאם.';

  @override
  String get adminFlagMassDmSpam => 'ספאם המוני בהודעות פרטיות';

  @override
  String get adminFlagRaidLockdown => 'נעילה עקב פשיטה';

  @override
  String get adminFlagBotBehavior => 'התנהגות דמוית בוט';

  @override
  String get adminFlagChannelFlooding => 'הצפת ערוץ';

  @override
  String get adminAutoEscalatedBadge => 'הוסלם אוטומטית';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'רמת ביטחון: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'משתמש/ת: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'שרת: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount מתוך $totalJoiners מצטרפים חדשים עדיין מושתקים';
  }

  @override
  String get adminNoJoinersMuted => 'אין כרגע מצטרפים חדשים מושתקים';

  @override
  String adminRestrictedUntil(String until) {
    return 'מוגבל כרגע עד $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'לא מוגבל כרגע';

  @override
  String get adminDismissUndoButton => 'התעלמות וביטול';

  @override
  String get adminConfirmRestrictButton => 'אישור והגבלה';

  @override
  String get adminDeleteArticleTitle => 'למחוק את המאמר?';

  @override
  String adminDeleteArticleBody(String title) {
    return '\"$title\" יוסר ממאגר הידע של Visp.';
  }

  @override
  String get adminNewArticleTitle => 'מאמר חדש';

  @override
  String get adminEditArticleTitle => 'עריכת מאמר';

  @override
  String get adminArticleTitleHint => 'כותרת';

  @override
  String get adminArticleContentHint => 'תוכן המאמר (markdown)';

  @override
  String get adminWikiArticlesHeader => 'מאמרי ויקי';

  @override
  String get adminNoArticlesYet => 'אין עדיין מאמרים';

  @override
  String get adminEditArticleTooltip => 'עריכת מאמר';

  @override
  String get adminDeleteArticleTooltip => 'מחיקת מאמר';

  @override
  String get adminSearchServersHint => 'חיפוש שרתים לפי שם...';

  @override
  String get adminSearchServersPrompt => 'חפשו שרת למעלה';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'הענקת בוסטים לשרת $serverName';
  }

  @override
  String get adminNumBoostsHint => 'מספר בוסטים';

  @override
  String get adminGrantButton => 'הענקה';

  @override
  String get adminPositiveNumberError => 'הזינו מספר שלם חיובי.';

  @override
  String get adminGrantBoostsFailed => 'הענקת הבוסטים נכשלה.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'הוענקו $count בוסטים לשרת $serverName -- כעת רמה $level ($activeCount פעילים).',
      many:
          'הוענקו $count בוסטים לשרת $serverName -- כעת רמה $level ($activeCount פעילים).',
      two:
          'הוענקו $count בוסטים לשרת $serverName -- כעת רמה $level ($activeCount פעילים).',
      one:
          'הוענק בוסט אחד לשרת $serverName -- כעת רמה $level ($activeCount פעילים).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count חברים';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'הענקת בוסטים';

  @override
  String get parentalDashboardTitle => 'משפחה';

  @override
  String get parentalDashboardCreateChildTitle => 'יצירת חשבון ילד/ה';

  @override
  String get parentalDashboardUsernameHint => 'שם משתמש';

  @override
  String get parentalDashboardEmailHint => 'אימייל';

  @override
  String get parentalDashboardPasswordHint => 'סיסמה';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'פעולה זו יוצרת חשבון מפוקח באופן מלא: ערוצים מתויגים ייחסמו, ותוכלו להגדיר שעות מותרות ולראות (אך לא לקרוא) את החברים והשרתים שלהם.';

  @override
  String get parentalDashboardValidationError =>
      'נדרשים שם משתמש, אימייל וסיסמה בת 8 תווים לפחות.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'לא ניתן היה ליצור את חשבון הילד/ה -- ייתכן ששם המשתמש/האימייל כבר תפוסים.';

  @override
  String get parentalDashboardCreatingLabel => 'יוצר...';

  @override
  String get parentalDashboardNoChildren => 'אין עדיין חשבונות מקושרים.';

  @override
  String get parentalDashboardSupervisedLabel => 'חשבון מפוקח';

  @override
  String get parentalDashboardUnknownUser => 'לא ידוע';

  @override
  String get childDetailFallbackTitle => 'חשבון ילד/ה';

  @override
  String get childDetailTabFriends => 'חברים';

  @override
  String get childDetailTabServers => 'שרתים';

  @override
  String get childDetailTabSchedule => 'לוח זמנים';

  @override
  String get childDetailTabOverride => 'חריגה';

  @override
  String get childDetailNoFriends => 'אין חברים.';

  @override
  String get childDetailUnknownUser => 'לא ידוע';

  @override
  String get childDetailRemoveFriendTooltip => 'הסרת חבר/ה';

  @override
  String get childDetailNoServers => 'לא נמצא/ת באף שרת.';

  @override
  String childDetailMemberCount(int count) {
    return '$count חברים';
  }

  @override
  String get childDetailRemoveServerTooltip => 'הסרה מהשרת';

  @override
  String get childDetailRestrictAccessTitle => 'הגבלת גישה לשעות קבועות';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'כיבוי משמעו גישה בלתי מוגבלת בכל עת';

  @override
  String get childDetailTimezoneLabel => 'אזור זמן';

  @override
  String get childDetailMonday => 'יום שני';

  @override
  String get childDetailTuesday => 'יום שלישי';

  @override
  String get childDetailWednesday => 'יום רביעי';

  @override
  String get childDetailThursday => 'יום חמישי';

  @override
  String get childDetailFriday => 'יום שישי';

  @override
  String get childDetailSaturday => 'שבת';

  @override
  String get childDetailSunday => 'יום ראשון';

  @override
  String get childDetailNoAccessLabel => 'ללא גישה';

  @override
  String get childDetailToLabel => 'עד';

  @override
  String get childDetailSavingLabel => 'שומר...';

  @override
  String get childDetailSaveScheduleButton => 'שמירת לוח הזמנים';

  @override
  String get childDetailScheduleSaved => 'לוח הזמנים נשמר.';

  @override
  String get childDetailOverrideExplanation =>
      'הענקת גישה זמנית מחוץ ללוח הזמנים הרגיל -- שימושי לחריגה חד-פעמית בלי לשנות את לוח הזמנים השבועי.';

  @override
  String get childDetailReasonHint => 'סיבה (אופציונלי)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes דקות';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours שעות';
  }

  @override
  String get childDetailRevokeOverrideButton => 'ביטול החריגה הפעילה';

  @override
  String get childDetailAccessGranted => 'ניתנה גישה זמנית.';

  @override
  String get childDetailOverrideRevoked => 'החריגה בוטלה.';

  @override
  String get digitalGoodsTitle => 'מוצרים דיגיטליים';

  @override
  String get digitalGoodsMyProductsTitle => 'המוצרים שלי';

  @override
  String get digitalGoodsManageProductsTooltip => 'ניהול המוצרים של השרת הזה';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'מעבר לעיון';

  @override
  String get digitalGoodsCreateProductTooltip => 'יצירת מוצר';

  @override
  String get digitalGoodsBrowseTab => 'עיון';

  @override
  String get digitalGoodsMyListingsTab => 'הרשומות שלי';

  @override
  String get digitalGoodsMyPurchasesTab => 'הרכישות שלי';

  @override
  String get digitalGoodsNoProductsYet => 'אין עדיין מוצרים';

  @override
  String get digitalGoodsNoProductsAvailable => 'אין מוצרים זמינים';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'צרו את המוצר הראשון שלכם כדי להתחיל למכור';

  @override
  String get digitalGoodsCheckBackLater =>
      'בקרו שוב מאוחר יותר למוצרים דיגיטליים';

  @override
  String get digitalGoodsCreateProductButton => 'יצירת מוצר';

  @override
  String get digitalGoodsLicenseKeyBadge => 'מפתח רישיון';

  @override
  String get digitalGoodsFileBadge => 'קובץ';

  @override
  String get digitalGoodsAllServersBadge => 'כל השרתים';

  @override
  String get digitalGoodsFreeForYou => 'חינם עבורך';

  @override
  String get digitalGoodsFreeLabel => 'חינם';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count נמכרו';
  }

  @override
  String get digitalGoodsKeysButton => 'מפתחות';

  @override
  String get digitalGoodsGetForFree => 'קבלה בחינם';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'רכישה תמורת $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'אין עדיין רכישות';

  @override
  String get digitalGoodsUnknownProduct => 'מוצר לא ידוע';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'נרכש בתאריך $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'העתקת מפתח';

  @override
  String get digitalGoodsLicenseKeyCopied => 'מפתח הרישיון הועתק!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'פג תוקף בתאריך $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'מפתח הרישיון שלך';

  @override
  String get digitalGoodsCopyKeyButton => 'העתקת מפתח';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'לא ניתן היה להתחיל את התשלום -- ייתכן שהיוצר/ת הזה/ו עדיין לא חיבר/ה את Stripe.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'הרכישה הושלמה! תמצאו אותה תחת הרכישות שלי.';

  @override
  String get digitalGoodsPurchasePending =>
      'עדיין ממתינים לתשלום -- הוא יופיע תחת הרכישות שלי לאחר השלמתו.';

  @override
  String get digitalGoodsCreateProductTitle => 'יצירת מוצר';

  @override
  String get digitalGoodsEditProductTitle => 'עריכת מוצר';

  @override
  String get digitalGoodsProductTitleHint => 'כותרת המוצר';

  @override
  String get digitalGoodsDescriptionHint => 'תיאור (אופציונלי)';

  @override
  String get digitalGoodsPriceHint => 'מחיר בדולרים (השאירו ריק בשביל חינם)';

  @override
  String get digitalGoodsProductTypeLabel => 'סוג המוצר';

  @override
  String get digitalGoodsFileDownloadOption => 'הורדת קובץ';

  @override
  String get digitalGoodsLicenseKeyOption => 'מפתח רישיון';

  @override
  String get digitalGoodsAvailabilityLabel => 'זמינות';

  @override
  String get digitalGoodsThisServerOnlyOption => 'שרת זה בלבד';

  @override
  String get digitalGoodsAllKodaServersOption => 'כל שרתי Koda';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'לאחר היצירה, השתמשו בכפתור \"מפתחות\" כדי להעלות את מפתחות הרישיון שלכם.';

  @override
  String get digitalGoodsProductFileLabel => 'קובץ המוצר';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName (${sizeMb}MB)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'הסרת קובץ';

  @override
  String get digitalGoodsUploadingLabel => 'מעלה...';

  @override
  String get digitalGoodsChooseFileButton => 'בחירת קובץ';

  @override
  String get digitalGoodsReplaceFileButton => 'החלפת קובץ';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'בחרו קובץ עבור מוצר זה לפני השמירה.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'העלאת מפתחות רישיון';

  @override
  String get digitalGoodsPasteKeysHint => 'הדביקו מפתח אחד בכל שורה:';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'העלאת מפתחות';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'מפתחות הרישיון הועלו!';

  @override
  String get serverSubscriptionManageTitle => 'ניהול מנויים';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return 'מנויי $serverName';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'הוספת דרגה';

  @override
  String get serverSubscriptionNoTiersYet => 'אין עדיין דרגות מנוי';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'צרו עד 3 דרגות עבור הקהילה שלכם';

  @override
  String get serverSubscriptionCreateFirstTierButton => 'יצירת הדרגה הראשונה';

  @override
  String get serverSubscriptionShowSubscriberCounts => 'הצגת מספר המנויים';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/חודש';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count מנויים פעילים',
      many: '$count מנויים פעילים',
      two: '$count מנויים פעילים',
      one: 'מנוי פעיל אחד',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned => 'התפקיד מוקצה אוטומטית';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return 'הנחה של $discount% בשוק';
  }

  @override
  String get serverSubscriptionNoTiersMember => 'לשרת זה אין דרגות מנוי';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'מנוי/ה פעיל/ה';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'פג תוקף בתאריך $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk => 'תפקיד מנוי בלעדי';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return 'הנחה של $discount% על רכישות בשוק';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'ערוצים למנויים בלבד';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'מנוי/ה כרגע';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'הרשמה למנוי תמורת $price/חודש';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'יצירת דרגה';

  @override
  String get serverSubscriptionEditTierTitle => 'עריכת דרגה';

  @override
  String get serverSubscriptionTierNameHint =>
      'שם הדרגה (למשל מעריץ, תומך, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'תיאור (אופציונלי)';

  @override
  String get serverSubscriptionPriceHint => 'מחיר לחודש (בדולרים)';

  @override
  String get serverSubscriptionDiscountLabel => 'אחוז הנחה בשוק';

  @override
  String get serverSubscriptionPositionLabel => 'מיקום';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'דרגה $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'מעניק תפקיד עם ההרשמה — אופציונלי';

  @override
  String get serverSubscriptionRoleFallback => 'תפקיד';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'מוענק אוטומטית לחבר/ה ברגע ההרשמה למנוי, ונלקח ברגע שהמנוי פג.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'הדרגה נוצרה -- חברו את Stripe תחת שוק ← יוצר לפני שחברים יוכלו להירשם אליה.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'מחיקת דרגה';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return 'למחוק את \"$tierName\"? מנויים קיימים ישמרו על הגישה עד לפקיעת התוקף.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'הרשמה למנוי $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel => 'מנוי חודשי';

  @override
  String get serverSubscriptionServerBankEarnsLabel => 'בנק השרת מרוויח';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points נקודות';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'התשלום מעובד באופן מאובטח על ידי Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'הרשמה למנוי';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'לא ניתן היה להתחיל את התשלום -- ייתכן שבעל/ת השרת עדיין לא חיבר/ה את Stripe.';

  @override
  String get serverSubscriptionSubscribed => 'נרשמתם למנוי!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'עדיין ממתינים לתשלום -- הוא יופעל לאחר השלמתו.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'מתן טיפ ל-$username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'בחירת סכום';

  @override
  String get tipDialogMessageHint => 'הוספת הודעה (אופציונלי)';

  @override
  String get tipDialogYouPayLabel => 'אתם משלמים';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username מקבל/ת';
  }

  @override
  String get tipDialogSendTipButton => 'שליחת טיפ';

  @override
  String get tipDialogFailedToSendTip =>
      'שליחת הטיפ נכשלה. ייתכן שהיוצר/ת אינו/ה מחובר/ת ל-Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'לא ניתן היה להתחיל את התשלום. נסו שוב בעוד רגע.';

  @override
  String get tipDialogTipSent => 'הטיפ נשלח!';

  @override
  String get tipDialogTipPending =>
      'עדיין ממתינים לתשלום -- הוא יעבור לאחר השלמתו.';

  @override
  String get tipDialogUnknownUser => 'לא ידוע';

  @override
  String get marketplaceTitle => 'שוק';

  @override
  String get marketplaceCreatorPayoutsTitle => 'תשלומים ליוצרים';

  @override
  String get marketplaceReceiveTipsSubtitle => 'קבלו טיפים ישירות דרך Stripe';

  @override
  String get marketplaceTabServerBank => 'בנק השרת';

  @override
  String get marketplaceTabDigitalGoods => 'מוצרים דיגיטליים';

  @override
  String get marketplaceTabMerch => 'מרצ\'נדייז';

  @override
  String get marketplaceTabSubscription => 'מנוי';

  @override
  String get marketplaceTabRevenue => 'הכנסות';

  @override
  String get marketplaceSelectServerSubscription =>
      'בחרו שרת כדי לצפות במנוי שלו';

  @override
  String get marketplaceSelectServerBank => 'בחרו שרת כדי לצפות בבנק שלו';

  @override
  String get marketplaceSelectServerRevenue => 'בחרו שרת כדי לצפות בהכנסות שלו';

  @override
  String get marketplaceStripeAccountStatus => 'חשבון Stripe';

  @override
  String get marketplaceOnboardingCompleteStatus => 'ההרשמה הושלמה';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'מקבל תשלומים';

  @override
  String get marketplaceConnectStripeButton => 'חיבור חשבון Stripe';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'השלמת הרשמה ל-Stripe';

  @override
  String get marketplaceRefreshStatusButton => 'רענון סטטוס';

  @override
  String get marketplaceReadyToReceiveTips => 'אתם מוכנים לקבל טיפים!';

  @override
  String get marketplaceHowItWorksTitle => 'איך זה עובד';

  @override
  String get marketplaceHowItWorksStep1 => 'חברו את חשבון ה-Stripe שלכם';

  @override
  String get marketplaceHowItWorksStep2 => 'השלימו אימות זהות';

  @override
  String get marketplaceHowItWorksStep3 => 'קבלו טיפים ישירות לחשבון הבנק שלכם';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda גובה עמלת עיבוד של 5%. העמלה מועברת לבנק השרת שלכם כנקודות.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'רק בעל/ת השרת או מי שיש לו/ה הרשאת ניהול השוק יכולים לצפות בבנק השרת.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName חוזק!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit משבצות לאימוג\'ים מותאמים אישית';
  }

  @override
  String get marketplaceServerFallback => 'שרת';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance נקודות';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount בפעילות';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'נקודות מתקבלות מעמלת העיבוד של 5% על טיפים ומנויים בשרת זה. השתמשו בנקודות כדי לפתוח שדרוגי שרת.';

  @override
  String get marketplaceServerBoostsTitle => 'חיזוקי שרת';

  @override
  String marketplaceLevelLabel(int level) {
    return 'רמה $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count חיזוקים פעילים',
      many: '$count חיזוקים פעילים',
      two: '$count חיזוקים פעילים',
      one: 'חיזוק פעיל אחד',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: 'עוד $more חיזוקים כדי להגיע לרמה $level',
      many: 'עוד $more חיזוקים כדי להגיע לרמה $level',
      two: 'עוד $more חיזוקים כדי להגיע לרמה $level',
      one: 'עוד $more חיזוק כדי להגיע לרמה $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix => ' ולפתוח רקע שרת מותאם אישית';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' ולפתוח מסגרת סמל שרת מותאמת אישית';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'יש לכם $count אסימוני חיזוק זמינים.',
      many: 'יש לכם $count אסימוני חיזוק זמינים.',
      two: 'יש לכם $count אסימוני חיזוק זמינים.',
      one: 'יש לכם אסימון חיזוק אחד זמין.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'אסימוני חיזוק מגיעים ממנוי Pulse (אחד בחודש). הירשמו למנוי בלשונית המנויים כדי לקבל אחד.';

  @override
  String get marketplaceBoostingLabel => 'מחזק...';

  @override
  String get marketplaceBoostThisServerButton => 'חיזוק שרת זה';

  @override
  String get marketplaceComingSoonUpgradesTitle => 'בקרוב — שדרוגי שרת';

  @override
  String get marketplaceSpendPointsList =>
      'הוציאו את נקודות בנק השרת על:\n• דומיין מותאם אישית לשרת\n• הגדלת מגבלת החברים\n• תמיכה בעדיפות\n• תג שרת בלעדי';

  @override
  String get marketplaceSourceTip => 'טיפים';

  @override
  String get marketplaceSourceSubscription => 'מנויי Koda';

  @override
  String get marketplaceSourceServerSubscription => 'מנויי שרת';

  @override
  String get marketplaceSourceDigitalProduct => 'מוצרים דיגיטליים';

  @override
  String get marketplaceSourceStageTicket => 'כרטיסי Stage';

  @override
  String get marketplaceSourcePrintfulOrder => 'הזמנות מרצ\'נדייז';

  @override
  String get marketplaceJustNow => 'ממש עכשיו';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return 'לפני $minutes דק\'';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return 'לפני $hours שע\'';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return 'לפני $days ימ\'';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'רק חברים שיכולים לנהל את השוק יכולים לצפות בהכנסות של שרת זה.';

  @override
  String get marketplaceBalanceLabel => 'יתרה';

  @override
  String get marketplaceLifetimeEarnedLabel => 'סך הכול הורווח';

  @override
  String get marketplaceLast30DaysTitle => '30 הימים האחרונים';

  @override
  String get marketplaceRevenueBySourceTitle => 'הכנסות לפי מקור';

  @override
  String get marketplaceNoRevenueYet => 'אין עדיין הכנסות.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count עסקאות',
      many: '$count עסקאות',
      two: '$count עסקאות',
      one: 'עסקה אחת',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'עסקאות אחרונות';

  @override
  String get marketplaceNoTransactionsYet => 'אין עדיין עסקאות.';

  @override
  String get marketplaceNoActivityYet => 'אין עדיין פעילות';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'סונכרנו $count מוצרים מ-Printful',
      many: 'סונכרנו $count מוצרים מ-Printful',
      two: 'סונכרנו $count מוצרים מ-Printful',
      one: 'סונכרן מוצר אחד מ-Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'לא ניתן היה לסנכרן עם Printful -- בדקו את החיבור בהגדרות המרצ\'נדייז.';

  @override
  String get printfulMerchSelectServer => 'בחרו שרת כדי לצפות במרצ\'נדייז שלו';

  @override
  String get printfulMerchManageCatalogTitle => 'ניהול קטלוג מרצ\'נדייז';

  @override
  String get printfulMerchTitle => 'מרצ\'נדייז';

  @override
  String get printfulMerchSyncingLabel => 'מסנכרן...';

  @override
  String get printfulMerchSyncCatalogButton => 'סנכרון קטלוג';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'מעבר לעיון';

  @override
  String get printfulMerchManageTooltip => 'ניהול המרצ\'נדייז של שרת זה';

  @override
  String get printfulMerchNothingSyncedYet => 'עדיין לא סונכרן דבר';

  @override
  String get printfulMerchNoMerchAvailable => 'אין עדיין מרצ\'נדייז זמין';

  @override
  String get printfulMerchSyncHint =>
      'סנכרנו את חנות ה-Printful שלכם כדי לייבא את קטלוג המוצרים שלכם';

  @override
  String get printfulMerchCheckBackLater =>
      'בדקו שוב מאוחר יותר למרצ\'נדייז מהשרת הזה';

  @override
  String get printfulMerchOutOfStock => 'אזל מהמלאי';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'מ-$price • $count אפשרויות',
      many: 'מ-$price • $count אפשרויות',
      two: 'מ-$price • $count אפשרויות',
      one: 'מ-$price • אפשרות אחת',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'הצגה';

  @override
  String printfulMerchPayoutTo(String username) {
    return 'תשלום ל: $username';
  }

  @override
  String get printfulMerchPayoutToYou => 'תשלום ל: אתה';

  @override
  String get printfulMerchPayoutChangeButton => 'שינוי';

  @override
  String get printfulMerchPayoutDialogTitle => 'מקבל התשלום';

  @override
  String get printfulMerchPayoutDialogBody =>
      'נתב את חלקו של פריט זה מהכנסות ההזמנה למשתמש אחר במקומך -- הוא יצטרך לחבר ולהשלים את תהליך ה-Stripe שלו לפני שמישהו יוכל לרכוש אותו.';

  @override
  String get printfulMerchPayoutUsernameHint => 'שם משתמש';

  @override
  String get printfulMerchPayoutLookupButton => 'חיפוש';

  @override
  String get printfulMerchPayoutUserNotFound => 'לא נמצא משתמש בשם זה.';

  @override
  String printfulMerchPayoutResolvedAs(String username) {
    return 'נמצא: $username';
  }

  @override
  String get printfulMerchPayoutResetButton => 'איפוס אליי';

  @override
  String get printfulMerchCartTooltip => 'עגלה';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productName נוסף לעגלה';
  }

  @override
  String get printfulMerchQuantityLabel => 'כמות';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'הפחתת כמות';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'הגדלת כמות';

  @override
  String get printfulMerchAddToCartButton => 'הוספה לעגלה';

  @override
  String get printfulMerchOptionLabel => 'אפשרות';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'סגנון';

  @override
  String get printfulMerchSizeLabel => 'מידה';

  @override
  String get printfulMerchYourCartTitle => 'העגלה שלך';

  @override
  String get printfulMerchCartEmpty => 'העגלה שלך ריקה.';

  @override
  String get printfulMerchSubtotalLabel => 'סכום ביניים';

  @override
  String get printfulMerchCheckoutLabel => 'קופה';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'הסרה מהעגלה';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'מלאו קודם את כתובת המשלוח שלכם.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'לא ניתן היה לקבל תעריפי משלוח לכתובת זו.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'לא ניתן היה להתחיל את התשלום. נסו שוב בעוד רגע.';

  @override
  String get printfulMerchOrderPlaced => 'ההזמנה נשלחה!';

  @override
  String get printfulMerchOrderPending =>
      'עדיין ממתינים לתשלום -- ההזמנה תישלח לאחר השלמתו.';

  @override
  String get printfulMerchShippingSpeedLabel => 'מהירות משלוח';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max ימי עסקים';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => 'קבלת הצעת מחיר למשלוח';

  @override
  String get printfulMerchPayButton => 'תשלום';

  @override
  String get kodaMarketplaceTitle => 'השוק של Koda';

  @override
  String get kodaMarketplaceTabSubscriptions => 'מנויים';

  @override
  String get kodaMarketplaceTabBoosts => 'חיזוקים';

  @override
  String get kodaMarketplaceTabDiscover => 'גילוי';

  @override
  String get kodaMarketplaceTierFreeName => 'חינם';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'פג תוקף בתאריך $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks => 'שדרגו לטובת הטבות בלעדיות';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count אסימוני חיזוק זמינים',
      many: '$count אסימוני חיזוק זמינים',
      two: '$count אסימוני חיזוק זמינים',
      one: 'אסימון חיזוק אחד זמין',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'תרמו אסימון לכל שרת שאתם חברים בו מלשונית בנק השרת שלו';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => 'מסגרת אווטאר מותאמת אישית';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'תג Spark בפרופיל';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'מגבלת העלאת קבצים מוגדלת (50MB)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality => 'איכות קול בעדיפות';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'כל מה שיש ב-Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => 'מסגרת אווטאר מונפשת';

  @override
  String get kodaMarketplacePulsePerkBadge => 'תג Pulse בפרופיל';

  @override
  String get kodaMarketplacePulsePerkFileLimit => 'מגבלת העלאת קבצים של 100MB';

  @override
  String get kodaMarketplacePulsePerkBoostToken => 'אסימון חיזוק שרת אחד בחודש';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/חודש';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'התוכנית הנוכחית';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'קבלת $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return 'תרומת $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return 'תרומת $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'הרשמה למנוי $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel => 'שם המשתמש של מקבל המתנה:';

  @override
  String get kodaMarketplaceUsernameHint => 'שם משתמש';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'מנוי';

  @override
  String get kodaMarketplaceTotalLabel => 'סך הכול';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'התשלום מעובד באופן מאובטח על ידי Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'מעבר לתשלום';

  @override
  String get kodaMarketplaceUserNotFound => 'המשתמש לא נמצא';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'לא ניתן היה להתחיל את התשלום. נסו שוב בעוד רגע.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'המנוי פעיל!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'עדיין ממתינים לתשלום -- הוא יופעל לאחר השלמתו.';

  @override
  String get kodaMarketplaceBoostPurchased => 'החיזוק נרכש!';

  @override
  String get kodaMarketplaceBoostPending =>
      'עדיין ממתינים לתשלום -- הוא יהיה מוכן לאחר השלמתו.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count זמינים';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'רכישת חיזוק';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'רכישה חד-פעמית -- מנויי Pulse מקבלים גם אסימון אחד חינם בכל חידוש, מה שנשאר העסקה המשתלמת יותר אם אתם מחזקים באופן קבוע.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'רכישת חיזוק -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'עדיין אף שרת לא בחר להצטרף לשוק של Koda. בעלי שרתים יכולים להפעיל זאת בהגדרות ההתאמה האישית של השרת שלהם.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => 'מומלץ השבוע';

  @override
  String get kodaMarketplaceAllListedServersHeader => 'כל השרתים הרשומים';

  @override
  String get kodaMarketplaceFeaturedItemsHeader => 'פריטים מומלצים';

  @override
  String get kodaMarketplaceAllItemsHeader => 'כל הפריטים';

  @override
  String get kodaMarketplaceServerFallback => 'שרת';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count חברים',
      many: '$count חברים',
      two: '$count חברים',
      one: 'חבר אחד',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceVisitStore => 'בקר בחנות';

  @override
  String get calendarFallbackTitle => 'לוח שנה';

  @override
  String get calendarAskVispTooltip => 'לשאול את Visp';

  @override
  String get calendarCreateEventTooltip => 'יצירת אירוע';

  @override
  String get calendarPreviousMonthTooltip => 'חודש קודם';

  @override
  String get calendarNextMonthTooltip => 'חודש הבא';

  @override
  String get calendarTodayButton => 'היום';

  @override
  String get calendarWeekdaySun => 'א\'';

  @override
  String get calendarWeekdayMon => 'ב\'';

  @override
  String get calendarWeekdayTue => 'ג\'';

  @override
  String get calendarWeekdayWed => 'ד\'';

  @override
  String get calendarWeekdayThu => 'ה\'';

  @override
  String get calendarWeekdayFri => 'ו\'';

  @override
  String get calendarWeekdaySat => 'ש\'';

  @override
  String get calendarTodaySuffix => ', היום';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count אירועים',
      many: ', $count אירועים',
      two: ', $count אירועים',
      one: ', אירוע אחד',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'בחרו יום';

  @override
  String get calendarNoEvents => 'אין אירועים';

  @override
  String get calendarSubscribeTooltip => 'מנוי';

  @override
  String get calendarUnsubscribeTooltip => 'ביטול מנוי';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'חוזר $recurrence';
  }

  @override
  String get calendarTicketOwned => 'כרטיס בבעלותך';

  @override
  String calendarTicketPrice(String price) {
    return 'כרטיס $price';
  }

  @override
  String get calendarDeleteEventTitle => 'מחיקת אירוע';

  @override
  String calendarDeleteEventConfirm(String title) {
    return 'למחוק את \"$title\"? לא ניתן לבטל פעולה זו.';
  }

  @override
  String get calendarEditEventTitle => 'עריכת אירוע';

  @override
  String get calendarCreateEventTitle => 'יצירת אירוע';

  @override
  String get calendarEventTitleHint => 'כותרת האירוע';

  @override
  String get calendarDescriptionHint => 'תיאור (אופציונלי)';

  @override
  String get calendarLocationHint => 'מיקום (אופציונלי)';

  @override
  String calendarStartLabel(String timezone) {
    return 'התחלה ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'תאריך ושעת התחלה, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'סיום — אופציונלי ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'תאריך ושעת סיום, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'לא הוגדר';

  @override
  String get calendarTapToSetEndTime => 'הקישו כדי להגדיר שעת סיום';

  @override
  String get calendarRecurrenceLabel => 'חזרתיות';

  @override
  String get calendarRecurrenceNone => 'לא חוזר';

  @override
  String get calendarRecurrenceDaily => 'יומי';

  @override
  String get calendarRecurrenceWeekly => 'שבועי';

  @override
  String get calendarRecurrenceMonthly => 'חודשי';

  @override
  String get calendarColorLabel => 'צבע';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'צבע $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'מחיר כרטיס — אופציונלי';

  @override
  String get calendarLinkStageChannelLabel => 'קישור לערוץ Stage — אופציונלי';

  @override
  String get calendarStageChannelFallback => 'Stage';

  @override
  String get discordImportFetchError => 'לא ניתן היה לאחזר את התבנית.';

  @override
  String get discordImportApplyError => 'החלת התבנית נכשלה. נסו שוב.';

  @override
  String get discordImportTitle => 'ייבוא תבנית Discord';

  @override
  String get discordImportDescription =>
      'הדביקו קישור discord.new או קוד תבנית כדי לייבא תפקידים, קטגוריות וערוצים לשרת זה.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 או קוד תבנית';

  @override
  String get discordImportPreviewButton => 'תצוגה מקדימה';

  @override
  String get discordImportTemplateFallback => 'תבנית';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תפקידים',
      many: '$count תפקידים',
      two: '$count תפקידים',
      one: 'תפקיד אחד',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קטגוריות',
      many: '$count קטגוריות',
      two: '$count קטגוריות',
      one: 'קטגוריה אחת',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ערוצים',
      many: '$count ערוצים',
      two: '$count ערוצים',
      one: 'ערוץ אחד',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel => 'החלפת המבנה הקיים';

  @override
  String get discordImportReplaceWarning =>
      'כל הערוצים, הקטגוריות והתפקידים הקיימים יימחקו לצמיתות.';

  @override
  String get discordImportAddDescription =>
      'התבנית תתווסף למבנה השרת הקיים שלכם.';

  @override
  String get discordImportReplaceConfirmTitle => 'להחליף את מבנה השרת?';

  @override
  String get discordImportReplaceConfirmBody =>
      'פעולה זו תמחק לצמיתות את כל הערוצים, הקטגוריות והתפקידים הקיימים לפני הייבוא. לא ניתן לבטל פעולה זו.';

  @override
  String get discordImportYesReplace => 'כן, החלפה';

  @override
  String get discordImportReplaceAndImportButton => 'החלפה וייבוא תבנית';

  @override
  String get discordImportAddToServerButton => 'הוספת תבנית לשרת';

  @override
  String get thresholdModConfigureTitle => 'הגדרת מודרציית סף';

  @override
  String get thresholdModConfigureExplanation =>
      'בחרו מודרטורים מהימנים וכמה מהם צריכים להסכים לפני שמישהו מהם יוכל לפענח תקופה אחת בהיסטוריית ערוץ. אפילו לכם אין מפתח חד-צדדי -- אתם פטורים רק אם גם אתם נמצאים ברשימה הזו.';

  @override
  String get thresholdModThresholdLabel => 'סף:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'הפחתת הסף';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'הגדלת הסף';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'מתוך $count מודרטורים',
      many: 'מתוך $count מודרטורים',
      two: 'מתוך $count מודרטורים',
      one: 'מתוך מודרטור אחד',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle => 'בקשת פענוח סף';

  @override
  String get thresholdModChannelLabel => 'ערוץ';

  @override
  String get thresholdModReasonHint => 'סיבה -- תוצג לכל מודרטור מיועד';

  @override
  String get thresholdModRequestButton => 'בקשה';

  @override
  String get thresholdModShareRelayed => 'החלק הועבר למבקש/ת.';

  @override
  String get thresholdModNotEnoughShares =>
      'עדיין לא הועברו מספיק חלקים -- נסו שוב לאחר שיותר מודרטורים יעבירו את שלהם.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count הודעות',
      many: '$count הודעות',
      two: '$count הודעות',
      one: 'הודעה אחת',
    );
    return 'תקופה $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'אין הודעות ניתנות לפענוח בתקופה זו.';

  @override
  String get thresholdModExplanation =>
      'פענוח אמיתי של היסטוריית ערוץ, המותנה בהסכמה פעילה של מספר מודרטורים מיועדים -- לעולם לא אדם אחד לבדו, אפילו לא בעל/ת השרת. תמיד נפתחת תקופה שלמה אחת בלבד (כל מה שנשלח מאז שינוי החברות האחרון), לעולם לא הודעה בודדת.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'מופעל -- $count מודרטורים, סף $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'לא מוגדר';

  @override
  String get thresholdModReconfigureButton => 'הגדרה מחדש';

  @override
  String get thresholdModEnableButton => 'הפעלה';

  @override
  String get thresholdModNotEnabledForServer =>
      'מודרציית סף אינה מופעלת עבור שרת זה.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'מופעלת עבור שרת זה. אינכם אחד מהמודרטורים המיועדים.';

  @override
  String get thresholdModRequestsLabel => 'בקשות';

  @override
  String get thresholdModRequestDecryptButton => 'בקשת פענוח';

  @override
  String get thresholdModNoActiveRequests => 'אין בקשות פעילות.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- תקופה $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'ממתין';

  @override
  String get thresholdModStatusApproved => 'אושר';

  @override
  String get thresholdModApproveButton => 'אישור';

  @override
  String get thresholdModRelayShareButton => 'העברת החלק שלי';

  @override
  String get thresholdModTryReconstructButton => 'ניסיון שחזור';

  @override
  String get roleSelectNoRolesAvailable => 'אין תפקידים זמינים להקצאה עצמית.';

  @override
  String get roleSelectInstructions =>
      'בחרו את התפקידים הרצויים. הקישו על תפקיד כדי להוסיף או להסיר אותו.';

  @override
  String get rulesScreenAcceptError => 'לא ניתן היה לאשר את הכללים. נסו שוב.';

  @override
  String get rulesScreenSubtitle => 'כללי השרת';

  @override
  String get rulesScreenScrollToRead => 'גללו למטה כדי לקרוא את כל הכללים';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'בלחיצה על אישור, אתם מסכימים לפעול לפי כללים אלה.\nהפרות עלולות לגרום להסרה מהשרת.';

  @override
  String get rulesScreenAcceptButton => 'אני מאשר/ת את הכללים';

  @override
  String get rulesScreenReadAllToContinue => 'קראו את כל הכללים כדי להמשיך';

  @override
  String get galleryNewPostTitle => 'פוסט חדש';

  @override
  String get galleryChooseFileButton => 'בחירת קובץ';

  @override
  String get galleryOrDivider => 'או';

  @override
  String get galleryPasteUrlHint => 'הדביקו כתובת URL של תמונה/וידאו';

  @override
  String get galleryTypeLabel => 'סוג';

  @override
  String get galleryImageOption => 'תמונה';

  @override
  String get galleryVideoOption => 'וידאו';

  @override
  String get galleryCaptionHint => 'כיתוב (אופציונלי)';

  @override
  String get galleryPostButton => 'פרסום';

  @override
  String get galleryNewCollectionTitle => 'אוסף חדש';

  @override
  String get galleryCollectionNameHint => 'שם האוסף';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return 'למחוק את \"$collectionName\"? הפוסטים בתוכו יהפכו לבלתי משויכים לאוסף.';
  }

  @override
  String get galleryFeedTab => 'פיד';

  @override
  String get galleryCollectionsTab => 'אוספים';

  @override
  String get galleryNoPostsYet => 'אין עדיין פוסטים';

  @override
  String get galleryNoCollectionsYet => 'אין עדיין אוספים';

  @override
  String get gallerySelectACollection => 'בחרו אוסף';

  @override
  String get galleryNoPostsInCollection => 'אין פוסטים באוסף זה';

  @override
  String get galleryAddPostButton => 'הוספת פוסט';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'שיתוף המסך נכשל: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return 'עוצמת הקול של $username';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'משפיע רק על מה ששומעים אתם -- המכשיר הזה, השיחה הזו.';

  @override
  String get voiceScreenResetVolumeButton => 'איפוס';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'לא ניתן היה להתחבר: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'המסך שלכם, הקישו כדי לצפות במסך מלא';

  @override
  String get voiceScreenYourScreenLabel => 'המסך שלכם';

  @override
  String get voiceScreenTapToClose => 'הקישו כדי לסגור';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (אתם)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', מדבר/ת';

  @override
  String get voiceScreenCameraOnSuffix => ', מצלמה פועלת';

  @override
  String get voiceScreenActivateToPopOut => ', הפעילו כדי לפתוח בחלון נפרד';

  @override
  String get voiceScreenShowVarmTooltip => 'הצגת VARM';

  @override
  String get voiceScreenHideVarmTooltip => 'הסתרת VARM';

  @override
  String get voiceScreenShowChatTooltip => 'הצגת צ\'אט';

  @override
  String get voiceScreenHideChatTooltip => 'הסתרת צ\'אט';

  @override
  String get voiceScreenStartCameraTooltip => 'הפעלת מצלמה';

  @override
  String get voiceScreenStopCameraTooltip => 'כיבוי מצלמה';

  @override
  String get voiceScreenShareScreenTooltip => 'שיתוף מסך';

  @override
  String get voiceScreenStopSharingTooltip => 'הפסקת שיתוף';

  @override
  String get voiceScreenPopOutTooltip => 'פתיחת השיחה בחלון נפרד';

  @override
  String get voiceScreenCouldNotPopOut =>
      'לא ניתן היה לפתוח את השיחה בחלון נפרד.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'עזיבת הערוץ הקולי';

  @override
  String get voiceScreenPinTooltip => 'נעיצה (השארה פתוחה)';

  @override
  String get voiceScreenUnpinTooltip => 'ביטול נעיצה';

  @override
  String get voiceScreenSizeSmall => 'קטן (320x180)';

  @override
  String get voiceScreenSizeMedium => 'בינוני (480x270)';

  @override
  String get voiceScreenSizeLarge => 'גדול (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, $count מחוברים';
  }

  @override
  String get voiceBarSpeakingSuffix => ', אתם מדברים';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count מחוברים · הקישו כדי להרחיב';
  }

  @override
  String get voiceBarStartCameraTooltip => 'הפעלת מצלמה';

  @override
  String get voiceBarStopCameraTooltip => 'כיבוי מצלמה';

  @override
  String get voiceBarLeaveVoiceTooltip => 'עזיבת הערוץ הקולי';

  @override
  String get popOutVideoFallbackTitle => 'קול';

  @override
  String get popOutVideoMissingTokenError => 'חסר טוקן או כתובת URL';

  @override
  String get popOutVideoConnectionTimedOut =>
      'תם הזמן הקצוב לחיבור לאחר 15 שניות';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'שגיאה: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'אין משתתפים';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Stage';

  @override
  String get stageCouldNotJoin => 'לא ניתן היה להצטרף ל-Stage.';

  @override
  String get stageThisStageFallback => 'ה-Stage הזה';

  @override
  String get stageRequiresTicketToJoin => 'דורש כרטיס כדי להצטרף';

  @override
  String get stagePleaseWaitLabel => 'אנא המתינו...';

  @override
  String get stageGetFreeTicketButton => 'קבלת כרטיס בחינם';

  @override
  String stageBuyTicketButton(String price) {
    return 'רכישת כרטיס -- $price';
  }

  @override
  String get stageNotNowButton => 'לא כרגע';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'לא ניתן היה להתחיל את רכישת הכרטיס.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'עדיין ממתינים לתשלום -- נסו להצטרף שוב לאחר שיאושר.';

  @override
  String get stageSpeakerBadge => 'דובר/ת';

  @override
  String get stageListenerBadge => 'מאזין/ה';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'לא ניתן היה להצטרף: $error';
  }

  @override
  String get stageSpeakersHeader => 'דוברים';

  @override
  String get stageRaisedHandsHeader => 'ידיים מורמות';

  @override
  String get stageAllowButton => 'אישור';

  @override
  String get stageIgnoreButton => 'התעלמות';

  @override
  String get stageListenersHeader => 'מאזינים';

  @override
  String get stageRaiseHandTooltip => 'הרמת יד';

  @override
  String get stageLowerHandTooltip => 'הורדת יד';

  @override
  String get stageLeaveStageTooltip => 'עזיבת Stage';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (אתם)';
  }

  @override
  String get stageMoveToListenersButton => 'העברה למאזינים';

  @override
  String get stageYouFallbackName => 'אתם';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'אווטאר של $username';
  }

  @override
  String get channelEditDialogNewTitle => 'ערוץ חדש';

  @override
  String get channelEditDialogEditTitle => 'עריכת ערוץ';

  @override
  String get channelEditDialogNameHint => 'שם הערוץ';

  @override
  String get channelEditDialogDescriptionHint => 'נושא (אופציונלי)';

  @override
  String get channelEditDialogTypeLabel => 'סוג';

  @override
  String get channelEditDialogTypeText => 'טקסט';

  @override
  String get channelEditDialogTypeVoice => 'קול';

  @override
  String get channelEditDialogTypeGallery => 'גלריה';

  @override
  String get channelEditDialogTypeStage => 'Stage';

  @override
  String get channelEditDialogTypeRules => 'כללים';

  @override
  String get channelEditDialogTypeRoleSelection => 'בחירת תפקיד';

  @override
  String get channelEditDialogTypeCalendar => 'לוח שנה';

  @override
  String get channelEditDialogAnnouncementTitle => 'ערוץ הכרזות';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'רק חברים שיכולים לנהל הודעות יכולים לפרסם';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'פרסמו כאן הכרזות על שידורים חיים והעלאות';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'מפרסם אוטומטית כאשר חבר/ה עם הרשאת \"הכרזה בעת שידור חי\" משדר/ת בשידור חי ב-Twitch, או מפרסם/ת סרטון YouTube חדש';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'התראה לתפקידים אלה עם הפרסום (אופציונלי)';

  @override
  String get channelEditDialogSlowmodeLabel => 'מצב איטי';

  @override
  String get channelEditDialogSlowmodeOff => 'כבוי';

  @override
  String get channelEditDialogUserLimitLabel => 'מגבלת משתמשים';

  @override
  String get channelEditDialogUserLimitOff => 'ללא הגבלה';

  @override
  String get channelEditDialogCategoryLabel => 'קטגוריה';

  @override
  String get channelEditDialogNoCategory => 'ללא קטגוריה';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'גישה לפי תפקיד (השאירו ריק עבור כולם)';

  @override
  String get channelEditDialogContentLabelsLabel => 'תוויות תוכן';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'מסמן ערוץ זה עבור מסנני התוכן של החברים; חסום לחלוטין עבור חשבונות מפוקחים';

  @override
  String get categoryEditDialogNewTitle => 'קטגוריה חדשה';

  @override
  String get categoryEditDialogEditTitle => 'עריכת קטגוריה';

  @override
  String get categoryEditDialogNameHint => 'שם הקטגוריה';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'גישה לפי תפקיד (השאירו ריק עבור כולם)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'חברים — $count מחוברים';
  }

  @override
  String get memberPanelRefreshTooltip => 'רענון רשימת החברים';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count חברים',
      many: '$count חברים',
      two: '$count חברים',
      one: 'חבר אחד',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'לא מקוון';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', דרגת $tier';
  }

  @override
  String get memberPanelUnknownUser => 'לא ידוע';

  @override
  String get memberPanelModerationActionsTooltip => 'פעולות מודרציה';

  @override
  String get reportDialogReasonSpam => 'ספאם';

  @override
  String get reportDialogReasonHarassment => 'הטרדה או התעללות';

  @override
  String get reportDialogReasonIllegal => 'תוכן בלתי חוקי';

  @override
  String get reportDialogReasonOther => 'אחר';

  @override
  String get reportDialogReasonLabel => 'סיבה';

  @override
  String get reportDialogNoteHint =>
      'משהו נוסף שהמודרטורים צריכים לדעת? (אופציונלי)';

  @override
  String get reportDialogDisclosureNote =>
      'תוכן ההודעה המוצג לכם ומי ששלח אותה ישותפו עם המודרטורים של שרת זה.';

  @override
  String get reportDialogSubmitButton => 'שליחת דיווח';

  @override
  String get reportDialogSubmitError => 'לא ניתן היה לשלוח את הדיווח.';

  @override
  String get notificationBellTitle => 'התראות';

  @override
  String get notificationBellMarkAllRead => 'סימון הכול כנקרא';

  @override
  String get notificationBellEmptyState => 'אין עדיין התראות';

  @override
  String get notificationBellUnreadLabel => 'לא נקרא';

  @override
  String get invitePreviewTitle => 'הזמנה לשרת';

  @override
  String get invitePreviewInvalidOrExpired => 'הזמנה לא תקפה או שפג תוקפה.';

  @override
  String get invitePreviewCouldNotJoin => 'לא ניתן היה להצטרף לשרת.';

  @override
  String get invitePreviewUnknownServer => 'שרת לא ידוע';

  @override
  String get shippingAddressFullNameHint => 'שם מלא';

  @override
  String get shippingAddressLine1Hint => 'כתובת, שורה 1';

  @override
  String get shippingAddressLine2Hint => 'כתובת, שורה 2 (אופציונלי)';

  @override
  String get shippingAddressCityHint => 'עיר';

  @override
  String get shippingAddressStateHint => 'מדינה/מחוז';

  @override
  String get shippingAddressZipHint => 'מיקוד';

  @override
  String get shippingAddressCountryCodeHint => 'קוד מדינה (למשל US)';

  @override
  String get shippingAddressPhoneHint => 'טלפון (אופציונלי)';

  @override
  String get shippingAddressPrivacyNote =>
      'משמש רק למשלוח הזמנה זו -- למידע על אופן הטיפול לאחר ביצוע ההזמנה, עיינו במדיניות הפרטיות של Printful עצמה.';

  @override
  String get updateNudgeAvailableTitle => 'עדכון זמין';

  @override
  String get updateNudgeRequiredTitle => 'נדרש עדכון';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $version זמינה -- אתם משתמשים בגרסה ישנה יותר.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'גרסה זו כבר אינה נתמכת. עדכנו ל-Koda $version כדי להמשיך להשתמש ב-Koda.';
  }

  @override
  String get updateNudgeLaterButton => 'מאוחר יותר';

  @override
  String get tierBadgeSparkSubscriber => 'מנוי/ת Spark';

  @override
  String get tierBadgePulseSubscriber => 'מנוי/ת Pulse';

  @override
  String get tierBadgeAlphaSpark => 'Alpha Spark';

  @override
  String get tierBadgeFounder => 'Founder';

  @override
  String get foundersHallTitle => 'היכל המייסדים';

  @override
  String get foundersHallSubtitle => 'התומכים המוקדמים ביותר שאפשרו את Koda.';

  @override
  String get foundersHallEmptyState => 'אין עדיין מייסדים.';

  @override
  String get settingsFoundersHallTitle => 'היכל המייסדים';

  @override
  String get settingsFoundersHallSubtitle => 'ראה מי עזר לבנות את Koda';

  @override
  String get vispAvatarInDevelopment => 'בפיתוח';

  @override
  String get vispBoostAdvisorCouldNotAnswer => 'Visp לא הצליח לגבש תשובה.';

  @override
  String get vispBoostAdvisorTitle => 'לשאול את Visp: יועץ ROI לחיזוקים';

  @override
  String get vispBoostAdvisorFollowUpHint => 'שאלו שאלת המשך...';

  @override
  String get vispBoostAdvisorSendTooltip => 'שליחה';

  @override
  String get vispBoostAdvisorBasedOn => 'בהתבסס על:';

  @override
  String get vispEventDialogCouldNotGenerate => 'Visp לא הצליח ליצור אירוע.';

  @override
  String get vispEventDialogCouldNotCreate =>
      'לא ניתן היה ליצור את האירוע הזה.';

  @override
  String get vispEventDialogRecurrenceNone => 'חד-פעמי';

  @override
  String get vispEventDialogRecurrenceDaily => 'חוזר מדי יום';

  @override
  String get vispEventDialogRecurrenceWeekly => 'חוזר מדי שבוע';

  @override
  String get vispEventDialogRecurrenceMonthly => 'חוזר מדי חודש';

  @override
  String get vispEventDialogTitle => 'לבקש מ-Visp ליצור אירוע';

  @override
  String get vispEventDialogDescription =>
      'תארו את האירוע -- Visp יציע כותרת, תאריך/שעה, וכל פרט נוסף.';

  @override
  String get vispEventDialogPromptHint =>
      'למשל \"מפגש D&D שבועי בכל יום שישי בשעה 19:00 למשך כ-3 שעות\"';

  @override
  String get vispEventDialogPrivacyNote =>
      'התיאור שלכם נשלח אל Visp (עוזר עצמאי-אירוח -- שום דבר לא יוצא משרתי Koda) כדי לייצר את התוכנית הזו.';

  @override
  String get vispEventDialogStartOver => 'התחלה מחדש';

  @override
  String get vispEventDialogCreateEvent => 'יצירת אירוע';

  @override
  String get vispEventDialogThinking => 'חושב...';

  @override
  String get vispEventDialogGeneratePlan => 'יצירת תוכנית';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'לא ניתן היה לזהות תאריך -- נסו לנסח מחדש';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'מסתיים $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price לכרטיס';
  }

  @override
  String get vispEventDialogBasedOn => 'בהתבסס על:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'שאלה $questionNumber מתוך $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'או הקלידו תשובה משלכם...';

  @override
  String get vispQuestionStepSendTooltip => 'שליחה';

  @override
  String get vispQuestionStepSkip => 'דילוג ויצירה עכשיו';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp לא הצליח ליצור תוכנית.';

  @override
  String get vispSetupDialogCouldNotApplyPlan =>
      'לא ניתן היה להחיל את התוכנית הזו.';

  @override
  String get vispSetupDialogTitleNew => 'תארו את השרת שלכם ל-Visp';

  @override
  String get vispSetupDialogTitleExisting => 'לבקש מ-Visp להוסיף לשרת זה';

  @override
  String get vispSetupDialogDescriptionNew =>
      'תארו את השרת שאתם רוצים -- Visp יציע שם וקבוצה של תפקידים, קטגוריות וערוצים.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'תארו מה הייתם רוצים להוסיף -- Visp יציע תפקידים, קטגוריות וערוצים ליצירה.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'למשל \"שרת נעים לקבוצת ה-D&D שלי עם ערוצים קוליים לשני שולחנות\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'למשל \"הוסיפו עוד כמה ערוצים לצוותי הריידים שלנו\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      'התיאור שלכם נשלח אל Visp (עוזר עצמאי-אירוח -- שום דבר לא יוצא משרתי Koda) כדי לייצר את התוכנית הזו.';

  @override
  String get vispSetupDialogStartOver => 'התחלה מחדש';

  @override
  String get vispSetupDialogCreateServer => 'יצירת שרת';

  @override
  String get vispSetupDialogAddToServer => 'הוספה לשרת';

  @override
  String get vispSetupDialogThinking => 'חושב...';

  @override
  String get vispSetupDialogGeneratePlan => 'יצירת תוכנית';

  @override
  String get vispSetupDialogNewServerLabel => 'שרת חדש';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תפקידים',
      many: '$count תפקידים',
      two: '$count תפקידים',
      one: 'תפקיד אחד',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קטגוריות',
      many: '$count קטגוריות',
      two: '$count קטגוריות',
      one: 'קטגוריה אחת',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ערוצים',
      many: '$count ערוצים',
      two: '$count ערוצים',
      one: 'ערוץ אחד',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'בהתבסס על:';

  @override
  String get childLockoutTitle => 'אתם מחוץ לשעות המותרות שלכם';

  @override
  String get childLockoutBody =>
      'הורה או אפוטרופוס הגדיר/ה זמנים שבהם חשבון זה יכול להשתמש ב-Koda. בקשו מהם זמן נוסף, או חזרו במהלך החלון המותר הבא שלכם.';

  @override
  String get childLockoutLogOutButton => 'התנתקות';

  @override
  String get forcePasswordChangeError =>
      'לא ניתן היה לעדכן את הסיסמה. נסו שוב.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'ברוכים הבאים, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'החשבון שלכם דורש סיסמה חדשה לפני שתוכלו להמשיך.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'סיסמה חדשה';

  @override
  String get forcePasswordChangeConfirmPasswordHint => 'אימות הסיסמה החדשה';

  @override
  String get forcePasswordChangeReqLength => 'לפחות 12 תווים';

  @override
  String get forcePasswordChangeReqUpper => 'אות גדולה אחת (A-Z)';

  @override
  String get forcePasswordChangeReqLower => 'אות קטנה אחת (a-z)';

  @override
  String get forcePasswordChangeReqDigit => 'ספרה אחת';

  @override
  String get forcePasswordChangeReqMatch => 'הסיסמאות תואמות';

  @override
  String get forcePasswordChangeSubmitButton => 'הגדרת סיסמה חדשה';

  @override
  String get forgotPasswordEnterEmailError => 'הזינו את כתובת האימייל שלכם.';

  @override
  String get forgotPasswordCodeSentInfo => 'אם החשבון קיים, נשלח קוד איפוס.';

  @override
  String get forgotPasswordEnterCodeError =>
      'הזינו את הקוד וסיסמה בת 8 תווים לפחות.';

  @override
  String get forgotPasswordInvalidCode => 'קוד לא תקף או שפג תוקפו.';

  @override
  String get forgotPasswordTitle => 'איפוס סיסמה';

  @override
  String get forgotPasswordEmailHint => 'כתובת אימייל';

  @override
  String get forgotPasswordSendCodeButton => 'שליחת קוד איפוס';

  @override
  String get forgotPasswordCodeHint => 'קוד בן 6 ספרות';

  @override
  String get forgotPasswordNewPasswordHint => 'סיסמה חדשה';

  @override
  String get forgotPasswordSetNewPasswordButton => 'הגדרת סיסמה חדשה';

  @override
  String get verifyEmailEnterCodeError =>
      'הזינו את הקוד בן 6 הספרות מהאימייל שלכם.';

  @override
  String get verifyEmailInvalidCode => 'קוד לא תקף או שפג תוקפו.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'קוד חדש נשלח אל $email.';
  }

  @override
  String get verifyEmailResendFailed => 'לא ניתן היה לשלוח מחדש כרגע.';

  @override
  String get verifyEmailTitle => 'בדקו את האימייל שלכם';

  @override
  String verifyEmailSentCode(String email) {
    return 'שלחנו קוד בן 6 ספרות אל $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'אימות אימייל';

  @override
  String get verifyEmailResendButton => 'שליחת הקוד מחדש';

  @override
  String get safetyNumberKeysNotSetUp => 'המפתחות שלכם עצמכם עדיין לא הוגדרו.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return 'ל-$peerName עדיין אין חבילת מפתחות.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'לא ניתן היה לחשב מספר אבטחה: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return 'ל-$peerName כבר אין את המכשיר הזה.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'מספר אבטחה עם $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'השוו את המספר הזה עם $peerName דרך ערוץ אחר -- פנים אל פנים, שיחת טלפון, בכל מקום מלבד הצ\'אט הזה. אם הוא תואם בשני הצדדים, אתם מדברים עם מי שאתם חושבים שאתם מדברים איתו.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return 'ל-$peerName יש $count מכשירים, כל אחד עם מספר אבטחה משלו -- אימות של אחד אינו מכסה את השאר.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'מכשיר $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'סימון כמאומת';

  @override
  String get contentFiltersDescription =>
      'שרתים יכולים לסמן ערוצים בתוויות תוכן. בחרו כיצד ברצונכם שערוצים מתויגים יתנהגו -- זו העדפה אישית שלכם בלבד ואינה משפיעה לעולם על מה שמישהו אחר רואה.';

  @override
  String get contentFiltersLabelAdult => 'תוכן למבוגרים';

  @override
  String get contentFiltersLabelSuggestive => 'מרמז מינית';

  @override
  String get contentFiltersLabelGraphic => 'תוכן גרפי';

  @override
  String get contentFiltersLabelNudity => 'עירום לא מיני';

  @override
  String get contentFiltersDescAdult => 'תוכן מיני מפורש';

  @override
  String get contentFiltersDescSuggestive => 'תוכן בעל רמיזה מינית שאינו מפורש';

  @override
  String get contentFiltersDescGraphic => 'אלימות או זוועה';

  @override
  String get contentFiltersDescNudity => 'עירום בהקשר לא מיני';

  @override
  String get contentFiltersHide => 'הסתרה';

  @override
  String get contentFiltersWarn => 'אזהרה';

  @override
  String get contentFiltersShow => 'הצגה';

  @override
  String get deviceTestCouldNotGetToken => 'לא ניתן היה לקבל טוקן בדיקה.';

  @override
  String get deviceTestLabelTest => 'בדיקה';

  @override
  String get deviceTestLabelRecording => 'מקליט...';

  @override
  String get deviceTestLabelPlayingBack => 'מנגן בחזרה...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'לא ניתן היה להפעיל את המצלמה: $error';
  }

  @override
  String get deviceTestTitle => 'בדיקת מכשירים';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'לא ניתן היה להתחבר: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'מיקרופון';

  @override
  String get deviceTestHearYourselfLabel => 'שמיעה עצמית (בהשהיה)';

  @override
  String get deviceTestSpeakerOutputLabel => 'רמקול / פלט';

  @override
  String get deviceTestCameraLabel => 'מצלמה';

  @override
  String get deviceTestSystemDefault => 'ברירת המחדל של המערכת';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'דברו, ולאחר מכן שמעו קטע של $seconds שניות מתנגן בחזרה';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '$seconds שנ\'';
  }

  @override
  String get deviceTestCameraPreviewOff => 'תצוגה מקדימה של המצלמה כבויה';

  @override
  String get deviceTestStopCameraButton => 'עצירת בדיקת המצלמה';

  @override
  String get deviceTestTestCameraButton => 'בדיקת מצלמה';

  @override
  String get deviceTestInputLevelLabel => 'רמת קלט';

  @override
  String get devicesScreenRemoveConfirmTitle => 'להסיר את המכשיר הזה?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'הוא יצטרך להתחבר מחדש, וכל הודעה שתישלח אליו בזמן שהוסר לא תגיע אליו לאחר מכן -- הפעלות Double Ratchet אינן ממלאות פערים באופן רטרואקטיבי.';

  @override
  String get devicesScreenRemoveFailed => 'לא ניתן היה להסיר את המכשיר הזה.';

  @override
  String get devicesScreenNeverActive => 'מעולם לא היה פעיל';

  @override
  String devicesScreenActiveDate(String date) {
    return 'פעיל $date';
  }

  @override
  String get devicesScreenDescription =>
      'לכל מכשיר שאתם מתחברים אליו יש זהות הצפנה משלו -- הודעה שנשלחת אליכם מגיעה לכל מכשיר ברשימה למטה. הסירו מכשיר שאינכם משתמשים בו או לא מזהים.';

  @override
  String get devicesScreenNoDevicesFound => 'לא נמצאו מכשירים.';

  @override
  String get devicesScreenUnknownDevice => 'מכשיר לא ידוע';

  @override
  String get devicesScreenThisDeviceBadge => 'מכשיר זה';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'הסרת מכשיר';

  @override
  String get totpSetupInvalidCode => 'קוד לא תקף. נסו שוב.';

  @override
  String get totpSetupEnabledMessage => 'האימות הדו-שלבי מופעל.';

  @override
  String get totpSetupScanInstructions =>
      'סרקו את הקוד הסודי הזה לתוך אפליקציית האימות שלכם (Google Authenticator, 1Password, Authy):';

  @override
  String get totpSetupCodeHint => 'הזינו קוד בן 6 ספרות לאישור';

  @override
  String get totpSetupVerifyButton => 'אימות והפעלה';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'לחיצה לדיבור';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'לחצו על כל מקש כדי לשייך אותו...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'בדיקת מכשירים';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'עיבוד קול';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'השתקת רעשים';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'מפחית רעשי רקע במיקרופון שלכם';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'השתקת רעשים מתקדמת (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'הסרת רעשים בזמן אמת באמצעות בינה מלאכותית, חזקה יותר מההשתקה הרגילה -- מחליפה אותה כשהיא פעילה';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'ביטול הד';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'מונע מהשמע שלכם לחזור כהד';

  @override
  String get voiceVideoSettingsAutoGainTitle => 'בקרת רווח אוטומטית';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'מאזן אוטומטית את עוצמת המיקרופון (נרמול עוצמת קול)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'השתקה אוטומטית של אחרים';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'מנמיך את עוצמת הקול של משתתפים אחרים כשאתם מדברים';

  @override
  String get voiceVideoSettingsHighPassTitle => 'מסנן מעבר-גבוה';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'חותך רעש בתדר נמוך (מאווררים, מיזוג אוויר, מכות בשולחן)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle => 'זיהוי רעש הקלדה';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'משתיק רעשי הקלדה שנקלטים על ידי המיקרופון שלכם';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'בידוד קול';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'מתמקד בקול שלכם, ומסנן אנשים וקולות אחרים בקרבת מקום';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'הגברת מיקרופון';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'הפעלת הגברה';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'הגברת טרום-מגבר עבור מיקרופון שקט או רחוק -- מוחלת לפני ה-EQ';

  @override
  String get voiceVideoSettingsBandBoost => 'הגברה';

  @override
  String get voiceVideoSettingsSectionMicEq => 'EQ למיקרופון';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'הפעלת EQ';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'מעצב את המיקרופון שלכם לפני שהוא מגיע לאנשים אחרים';

  @override
  String get voiceVideoSettingsBandBass => 'באס';

  @override
  String get voiceVideoSettingsBandMid => 'אמצע';

  @override
  String get voiceVideoSettingsBandTreble => 'טרבל';

  @override
  String get voiceVideoSettingsSectionVad => 'זיהוי פעילות קולית (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'הפעלת VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle => 'משדר רק כשאתם באמת מדברים';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'רגישות';

  @override
  String get voiceVideoSettingsVadHint =>
      'נמוך יותר = קולט קולות שקטים יותר. גבוה יותר = רק דיבור חזק יותר מפעיל שידור.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'מקש משויך';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'לא הוגדר — המיקרופון נשאר פעיל כל עוד אינו מושתק';

  @override
  String get voiceVideoSettingsClearButton => 'ניקוי';

  @override
  String get voiceVideoSettingsSetKeyButton => 'הגדרת מקש';

  @override
  String get voiceVideoSettingsChangeButton => 'שינוי';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'כאשר מקש משויך, המיקרופון שלכם משדר רק בזמן שאתם מחזיקים את המקש הזה לחוץ. לכך יש עדיפות על פני VOX כל עוד אתם בערוץ קולי.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - מודל אווטאר וירטואלי מגיב';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'העלו שתי תמונות שמתחלפות כשאתם מדברים. גלוי רק לכם.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'שקט';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'מדבר';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'סף דיבור';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'נמוך יותר = עובר לתמונת הדיבור ביתר קלות.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'הסרת VARM';

  @override
  String get gifPickerNoGifsFound => 'לא נמצאו GIF';

  @override
  String get gifPickerSearchHint => 'חיפוש GIF...';

  @override
  String get messageSearchHint => 'חיפוש בערוץ זה...';

  @override
  String get messageSearchTooltip => 'חיפוש';

  @override
  String get messageSearchInitialHint =>
      'מחפש בהודעות שכבר נטענו במכשיר זה -- היסטוריה ישנה יותר נשלפת (ומפוענחת מקומית) ככל שאתם גוללים אחורה.';

  @override
  String get messageSearchNoMatches => 'אין תוצאות';

  @override
  String get messageSearchStartOfHistory => 'תחילת היסטוריית הערוץ';

  @override
  String get messageSearchFurtherBackButton => 'חיפוש רחוק יותר אחורה';

  @override
  String get messageSearchUnknownAuthor => 'לא ידוע';
}
