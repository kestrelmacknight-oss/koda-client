// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonEdit => 'تعديل';

  @override
  String get commonDelete => 'حذف';

  @override
  String get commonCreate => 'إنشاء';

  @override
  String get commonClose => 'إغلاق';

  @override
  String get commonDone => 'تم';

  @override
  String get commonDownload => 'تنزيل';

  @override
  String get commonDisconnect => 'قطع الاتصال';

  @override
  String get commonNone => 'بلا';

  @override
  String get commonJoin => 'انضمام';

  @override
  String get commonDismiss => 'تجاهل';

  @override
  String get commonSubmit => 'إرسال';

  @override
  String get commonConfirm => 'تأكيد';

  @override
  String get commonRemove => 'إزالة';

  @override
  String get commonRetry => 'إعادة المحاولة';

  @override
  String get commonOk => 'موافق';

  @override
  String get commonYes => 'نعم';

  @override
  String get commonNo => 'لا';

  @override
  String get commonSearch => 'بحث';

  @override
  String get commonSettings => 'الإعدادات';

  @override
  String get commonLoading => 'جارٍ التحميل...';

  @override
  String get settingsLanguageSection => 'اللغة';

  @override
  String get settingsLanguageTitle => 'لغة التطبيق';

  @override
  String get settingsLanguageSystemDefault => 'افتراضي النظام';

  @override
  String get settingsLanguageDescription =>
      'اختر اللغة التي تُعرض بها واجهة Koda. هذا منفصل عن اللغة الأساسية لأي خادم، أو اللغة التي تكتب بها رسائلك.';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsSignOut => 'تسجيل الخروج';

  @override
  String get settingsSectionMyAccount => 'حسابي';

  @override
  String get settingsSectionSecurity => 'الأمان';

  @override
  String get settingsSectionAccessibility => 'إمكانية الوصول';

  @override
  String get settingsSectionBilling => 'الفوترة';

  @override
  String get settingsSectionFamily => 'العائلة';

  @override
  String get settingsSectionVoiceVideo => 'الصوت والفيديو';

  @override
  String get settingsSectionDesktop => 'سطح المكتب';

  @override
  String get settingsSectionAbout => 'حول التطبيق';

  @override
  String get settingsTwoFactorTitle => 'المصادقة الثنائية';

  @override
  String get settingsTwoFactorSubtitle => 'أضف تطبيق مصادقة لمزيد من الأمان';

  @override
  String get settingsLinkedDevicesTitle => 'الأجهزة المرتبطة';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'عرض الأجهزة المسجّلة الدخول إلى هذا الحساب وإزالتها';

  @override
  String get settingsContentFiltersTitle => 'مرشحات المحتوى';

  @override
  String get settingsContentFiltersSubtitle =>
      'اختر كيف تريد ظهور المحتوى المصنّف';

  @override
  String get settingsDmFriendsOnlyTitle =>
      'السماح بالرسائل المباشرة من الأصدقاء فقط';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'لا يمكن لغير الأصدقاء بدء محادثة جديدة معك';

  @override
  String get settingsDmPrivacyError => 'تعذّر تحديث خصوصية الرسائل المباشرة.';

  @override
  String get settingsShowVispAvatarTitle => 'إظهار صورة Visp الرمزية';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'يعرض وجه Visp ومزاجه في نوافذ الإعداد والأحداث والاستشارة';

  @override
  String get settingsHighContrastTitle => 'تباين عالٍ';

  @override
  String get settingsHighContrastSubtitle =>
      'ألوان أبيض وأسود خالصة عالية التباين في جميع أنحاء التطبيق -- التبديل يعيد تحميل الشاشة الحالية للحظة.';

  @override
  String get settingsDyslexiaFontTitle => 'خط مناسب لعسر القراءة';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'يبدّل نص المحتوى إلى خط OpenDyslexic في جميع أنحاء التطبيق';

  @override
  String get settingsFontSizeTitle => 'حجم الخط';

  @override
  String get settingsFontSizeSample => 'نص تجريبي لعرض حجم الخط وشكله بوضوح';

  @override
  String get settingsDensityTitle => 'الكثافة';

  @override
  String get settingsDensityDescription =>
      'يؤثر في تباعد عناصر التحكم القياسية -- الأزرار والمفاتيح والنوافذ -- وليس كل تخطيط مخصص.';

  @override
  String get settingsDensityCompact => 'مضغوطة';

  @override
  String get settingsDensityStandard => 'قياسية';

  @override
  String get settingsDensityComfortable => 'مريحة';

  @override
  String get settingsStreamingTitle => 'حسابات البث';

  @override
  String get settingsStreamingDescription =>
      'اربط Twitch أو YouTube حتى تتمكن الخوادم التي تملك فيها صلاحية \"الإعلان عند البث المباشر\" من النشر تلقائيًا عند بدء بثك المباشر أو نشر فيديو جديد.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform متصل باسم $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform غير متصل';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- يبث الآن';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- رفع جديد';

  @override
  String get settingsStreamingConnecting => 'جارٍ الاتصال...';

  @override
  String get settingsStreamingConnect => 'اتصال';

  @override
  String get settingsAnnounceLiveTwitch => 'الإعلان عند بدء بثي المباشر';

  @override
  String get settingsAnnounceLiveYoutube =>
      'الإعلان عن البث المباشر والرفعات الجديدة';

  @override
  String get settingsRefreshStatus =>
      'هل اتصلت بالفعل من المتصفح؟ تحديث الحالة';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'تعذّر بدء الاتصال بـ $platform.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'أكمل الاتصال في متصفحك، ثم عد وحدّث الحالة.';

  @override
  String get settingsThroneTitle => 'ويب هوك Throne';

  @override
  String get settingsThroneDescription =>
      'الصق هذا الرابط في إعدادات ويب هوك Throne.com لتصلك إشعارات في Koda كلما أرسل لك أحد هدية.';

  @override
  String get settingsThroneGetUrl => 'الحصول على رابط الويب هوك الخاص بي';

  @override
  String get settingsThroneCopyTooltip => 'نسخ';

  @override
  String get settingsThroneCopiedToast => 'تم النسخ إلى الحافظة';

  @override
  String get settingsThroneRegenerateTooltip =>
      'إعادة الإنشاء (يبطل الرابط القديم)';

  @override
  String get settingsThroneRegenerateConfirmTitle =>
      'إعادة إنشاء رابط الويب هوك؟';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'سيتوقف رابطك القديم عن العمل، لذا حدّثه لاحقًا في Throne.com.';

  @override
  String get settingsThroneRegenerate => 'إعادة الإنشاء';

  @override
  String get settingsUploadPhoto => 'رفع صورة';

  @override
  String get settingsOrPasteUrl => 'أو الصق رابطًا أدناه';

  @override
  String get settingsAvatarUrlHint => 'https://example.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'رفع الصور يتطلب Cloudflare R2 — لصق الرابط يعمل دائمًا.';

  @override
  String get settingsDisplayNameLabel => 'الاسم المعروض';

  @override
  String get settingsDisplayNameHint => 'الاسم المعروض';

  @override
  String get settingsBioLabel => 'نبذة';

  @override
  String get settingsBioHint => 'أخبر الآخرين قليلًا عن نفسك';

  @override
  String get settingsPronounsLabel => 'الضمائر';

  @override
  String get settingsPronounsHint => 'مثال: هي/هو';

  @override
  String get settingsShowPronounsTitle => 'إظهار ضمائري للآخرين';

  @override
  String get settingsShowPronounsSubtitle =>
      'تظهر بجانب اسمك في الدردشة وقوائم الأعضاء والصوت';

  @override
  String get settingsStatusLabel => 'الحالة';

  @override
  String get statusOnline => 'متصل';

  @override
  String get statusAway => 'بعيد';

  @override
  String get statusDnd => 'عدم الإزعاج';

  @override
  String get statusInvisible => 'مخفي';

  @override
  String get settingsFamilyNotAvailable =>
      'أدوات الرقابة الأبوية غير متاحة على حساب خاضع للإشراف.';

  @override
  String get settingsAboutTitle => 'حول Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'الشروط والأحكام';

  @override
  String get settingsPrivacyTitle => 'سياسة الخصوصية';

  @override
  String get settingsSupportTitle => 'الدعم';

  @override
  String get settingsReportSecurityTitle => 'الإبلاغ عن مشكلة أمنية';

  @override
  String get settingsDesktopNotAvailable =>
      'هذه إعدادات خاصة بسطح المكتب فقط -- لا توجد نافذة أو علبة نظام على هذه المنصة.';

  @override
  String get settingsCloseToTrayTitle => 'التصغير إلى علبة النظام';

  @override
  String get settingsCloseToTraySubtitle =>
      'يؤدي إغلاق النافذة إلى إبقاء Koda يعمل في الخلفية حتى تستمر في تلقي الإشعارات -- أوقف هذا الخيار لجعل إغلاق النافذة يُنهي التطبيق فعليًا.';

  @override
  String get authErrorEmailPasswordRequired =>
      'البريد الإلكتروني وكلمة المرور مطلوبان.';

  @override
  String get authErrorIncorrectCredentials =>
      'بريد إلكتروني أو كلمة مرور غير صحيحة.';

  @override
  String get authErrorMustAcceptTerms => 'يرجى قبول الشروط والأحكام.';

  @override
  String get authErrorAllFieldsRequired => 'جميع الحقول مطلوبة.';

  @override
  String get authErrorPasswordsDontMatch => 'كلمتا المرور غير متطابقتين.';

  @override
  String get authErrorPasswordTooShort => 'يجب ألا تقل كلمة المرور عن 8 أحرف.';

  @override
  String get authErrorRegistrationFailed =>
      'فشل التسجيل. قد يكون هذا البريد الإلكتروني مستخدمًا بالفعل.';

  @override
  String get authTabSignIn => 'تسجيل الدخول';

  @override
  String get authTabCreateAccount => 'إنشاء حساب';

  @override
  String get authAgreementPrefix => 'باستخدامك Koda فإنك توافق على ';

  @override
  String get authTermsLink => 'الشروط والأحكام';

  @override
  String get authAgreementMiddle => ' و';

  @override
  String get authPrivacyLink => 'سياسة الخصوصية';

  @override
  String get authAgreementSuffix => '.';

  @override
  String get authEmailHint => 'البريد الإلكتروني';

  @override
  String get authPasswordHint => 'كلمة المرور';

  @override
  String get authForgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get authSignInButton => 'تسجيل الدخول';

  @override
  String get authUsernameHint => 'اسم المستخدم';

  @override
  String get authConfirmPasswordHint => 'تأكيد كلمة المرور';

  @override
  String get authAgreeToTerms => 'أوافق على الشروط والأحكام وسياسة الخصوصية';

  @override
  String get authCreateAccountButton => 'إنشاء حساب';

  @override
  String get dmSafetyNumberChangedWarning =>
      'تغيّر رقم الأمان لهذه المحادثة -- تحقق منه قبل الإرسال.';

  @override
  String get dmMessageNotSent => 'لم يتم إرسال الرسالة.';

  @override
  String dmEncryptMessageError(String error) {
    return 'تعذّر تشفير الرسالة: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'فشل رفع المرفق.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'تعذّر تشفير المرفق: $error';
  }

  @override
  String get dmReportMessage => 'الإبلاغ عن الرسالة';

  @override
  String get dmReportSubmitted => 'تم إرسال البلاغ.';

  @override
  String get dmTitle => 'الرسائل';

  @override
  String get dmNewMessage => 'رسالة جديدة';

  @override
  String get dmNoConversationsYet => 'لا توجد محادثات بعد';

  @override
  String get dmSelectConversation => 'اختر محادثة';

  @override
  String get dmVerifySafetyNumberTooltip => 'التحقق من رقم الأمان';

  @override
  String get dmSeenLabel => 'تمت المشاهدة';

  @override
  String get dmMessageActionsTooltip => 'إجراءات الرسالة';

  @override
  String get dmRemoveAttachmentTooltip => 'إزالة المرفق';

  @override
  String get dmAttachFileTooltip => 'إرفاق ملف';

  @override
  String get dmMessageHint => 'رسالة...';

  @override
  String get dmSendMessageTooltip => 'إرسال الرسالة';

  @override
  String get dmNoFriendsYet => 'لا يوجد أصدقاء بعد.\nأرسل طلب صداقة للبدء.';

  @override
  String get dmUnfriendTooltip => 'إلغاء الصداقة';

  @override
  String get dmNoPendingRequests => 'لا توجد طلبات صداقة معلّقة.';

  @override
  String get dmIncomingRequestsLabel => 'الواردة';

  @override
  String get dmSentRequestsLabel => 'المرسلة';

  @override
  String get dmAcceptTooltip => 'قبول';

  @override
  String get dmDeclineTooltip => 'رفض';

  @override
  String get dmPendingLabel => 'معلّق';

  @override
  String get dmNewMessageDialogTitle => 'رسالة جديدة';

  @override
  String get dmEnterUsernameHint => 'أدخل اسم المستخدم';

  @override
  String get dmOpenButton => 'فتح';

  @override
  String dmSavedAttachment(String fileName) {
    return 'تم حفظ $fileName';
  }

  @override
  String get dmUnknownUser => 'غير معروف';

  @override
  String get dmEndToEndEncryptedTooltip => 'مشفّر من طرف إلى طرف';

  @override
  String get homeContentWarningTitle => 'تحذير من المحتوى';

  @override
  String homeContentWarningBody(String labels) {
    return 'هذه القناة موسومة بـ: $labels.\n\nيمكنك تغيير هذا في الإعدادات > الأمان > مرشحات المحتوى.';
  }

  @override
  String get homeViewAnyway => 'عرضه على أي حال';

  @override
  String get homeCouldNotConnectVoice => 'تعذّر الاتصال بالصوت.';

  @override
  String get homeCreateServer => 'إنشاء خادم';

  @override
  String get homeJoinServer => 'الانضمام إلى خادم';

  @override
  String get homeRedeemCode => 'استبدال رمز';

  @override
  String get homeJoinServerDialogTitle => 'الانضمام إلى خادم';

  @override
  String get homeEnterInviteCode => 'أدخل رمز دعوة أو رابطًا:';

  @override
  String get homeInviteCodeHint => 'مثال: XK9MP2';

  @override
  String get homeJoined => 'تم الانضمام!';

  @override
  String get homeInvalidInvite => 'رمز الدعوة غير صالح أو منتهي الصلاحية.';

  @override
  String get homeJoinButton => 'انضمام';

  @override
  String get homeRedeemCodeDialogTitle => 'استبدال رمز';

  @override
  String get homeEnterBackerCode => 'أدخل رمز الداعم أو المكافأة الخاص بك:';

  @override
  String get homeRewardCodeHint => 'رمز المكافأة';

  @override
  String get homeCodeRedeemed => 'تم استبدال الرمز! تم تطبيق مكافآتك.';

  @override
  String get homeInvalidRedeemCode =>
      'رمز غير صالح أو منتهي الصلاحية أو مُستخدم مسبقًا.';

  @override
  String get homeRedeemButton => 'استبدال';

  @override
  String get homeAreFriends => 'أنتما صديقان';

  @override
  String get homeAddFriend => 'إضافة صديق';

  @override
  String homeFriendRequestSent(String username) {
    return 'تم إرسال طلب صداقة إلى $username!';
  }

  @override
  String get homeMessageButton => 'رسالة';

  @override
  String get homeSendTip => 'إرسال إكرامية';

  @override
  String get homeSwitchToServer => 'التبديل إلى الخادم';

  @override
  String get homeInvitePeople => 'دعوة أشخاص';

  @override
  String get homeServerSettingsMenuItem => 'إعدادات الخادم';

  @override
  String get homeLeaveServerMenuItem => 'مغادرة الخادم';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return 'مغادرة $serverName؟ يمكنك العودة إليه لاحقًا بدعوة.';
  }

  @override
  String get homeLeaveButton => 'مغادرة';

  @override
  String get homeCreateAServer => 'إنشاء خادم';

  @override
  String get homeServerNameHint => 'اسم الخادم';

  @override
  String get homeDescribeToVisp => 'صِفه لـ Visp بدلًا من ذلك';

  @override
  String get homeMarkAsRead => 'التعليم كمقروء';

  @override
  String get homeEditChannel => 'تعديل القناة';

  @override
  String get homeDeleteChannel => 'حذف القناة';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return 'حذف #$channelName؟ لا يمكن التراجع عن هذا.';
  }

  @override
  String get homeDeleteButton => 'حذف';

  @override
  String get homeCreateChannelHere => 'إنشاء قناة هنا';

  @override
  String get homeEditCategory => 'تعديل الفئة';

  @override
  String get homeDeleteCategory => 'حذف الفئة';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return 'حذف \"$categoryName\"؟ ستصبح القنوات بداخلها بلا فئة.';
  }

  @override
  String get homeReplyAction => 'رد';

  @override
  String get homeCreateThreadAction => 'إنشاء مناقشة';

  @override
  String get homeEditMessageAction => 'تعديل الرسالة';

  @override
  String get homeDeleteMessageAction => 'حذف الرسالة';

  @override
  String get homePinMessageAction => 'تثبيت الرسالة';

  @override
  String get homeUnpinMessageAction => 'إلغاء تثبيت الرسالة';

  @override
  String get homeReportMessageAction => 'الإبلاغ عن الرسالة';

  @override
  String get homeReportSubmitted => 'تم إرسال البلاغ.';

  @override
  String get homeAddReactionTitle => 'إضافة تفاعل';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مناقشة',
      many: '$count مناقشة',
      few: '$count مناقشات',
      two: 'مناقشتان',
      one: 'مناقشة واحدة',
      zero: '$count مناقشة',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'خيارات الفئة';

  @override
  String get homeChannelOptionsTooltip => 'خيارات القناة';

  @override
  String get homeOpenVoiceChatTooltip => 'فتح الدردشة';

  @override
  String get homeMarketplaceLabel => 'المتجر';

  @override
  String get homeSelectChannelPrompt => 'اختر قناة';

  @override
  String get homeSearchTooltip => 'بحث';

  @override
  String get homePinnedMessagesTooltip => 'الرسائل المثبتة';

  @override
  String get homeWaitingForKey => 'في انتظار وصول مفتاح التشفير...';

  @override
  String get homeUnableToDecrypt => 'تعذّر فك تشفير هذه الرسالة.';

  @override
  String get homeMessageActionsTooltip => 'إجراءات الرسالة';

  @override
  String get homeCancelReplyTooltip => 'إلغاء الرد';

  @override
  String get homeRemoveAttachmentTooltip => 'إزالة المرفق';

  @override
  String get homeAttachFileTooltip => 'إرفاق ملف';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'رسالة #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'إرسال الرسالة';

  @override
  String get homeEditMessageTitle => 'تعديل الرسالة';

  @override
  String get homeMessageLabel => 'الرسالة';

  @override
  String get homePinnedMessagesTitle => 'الرسائل المثبتة';

  @override
  String get homeNoPinnedMessages => 'لا توجد رسائل مثبتة';

  @override
  String get homeUnpinTooltip => 'إلغاء التثبيت';

  @override
  String get homeCreateThreadTitle => 'إنشاء مناقشة';

  @override
  String get homeThreadNameHint => 'اسم المناقشة';

  @override
  String homeThreadCreated(String name) {
    return 'تم إنشاء المناقشة \"$name\"!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'إنشاء أو انضمام';

  @override
  String get homeKodaMarketplaceTooltip => 'متجر Koda';

  @override
  String get homeAdminPanelTooltip => 'لوحة الإدارة';

  @override
  String get homeServerSettingsTooltip => 'إعدادات الخادم';

  @override
  String get homeSettingsTooltip => 'الإعدادات';

  @override
  String get homeContentWarningBadge => 'تحذير من المحتوى';

  @override
  String get homeDirectMessagesTooltip => 'الرسائل المباشرة';

  @override
  String homeReplyingTo(String username) {
    return 'الرد على $username';
  }

  @override
  String get homeAttachmentFallback => 'مرفق';

  @override
  String serverConnectError(String service) {
    return 'تعذّر بدء الاتصال بـ $service.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'قطع الاتصال بـ Printful؟';

  @override
  String get serverDisconnectPrintfulBody =>
      'لن يتمكن هذا الخادم من تنفيذ طلبات المنتجات حتى إعادة الاتصال.';

  @override
  String get serverDisconnectTiltifyTitle => 'قطع الاتصال بـ Tiltify؟';

  @override
  String get serverDisconnectTiltifyBody =>
      'سيتوقف هذا الخادم عن عرض تقدّم حملته الخيرية حتى إعادة الاتصال.';

  @override
  String get serverNewRoleTitle => 'دور جديد';

  @override
  String get serverEditRoleTitle => 'تعديل الدور';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'اللون $hex';
  }

  @override
  String get permViewChannels => 'عرض القنوات';

  @override
  String get permSendMessages => 'إرسال الرسائل';

  @override
  String get permConnectVoice => 'الاتصال بالصوت';

  @override
  String get permManageServer => 'إدارة الخادم';

  @override
  String get permManageChannels => 'إدارة القنوات';

  @override
  String get permManageRoles => 'إدارة الأدوار';

  @override
  String get permManageMessages => 'إدارة الرسائل';

  @override
  String get permKickMembers => 'طرد الأعضاء';

  @override
  String get permBanMembers => 'حظر الأعضاء';

  @override
  String get permMuteMembers => 'كتم الأعضاء';

  @override
  String get permMentionEveryone => 'ذكر @everyone';

  @override
  String get permManageMarketplace => 'إدارة المتجر';

  @override
  String get permAnnounceLive => 'الإعلان عند البث المباشر';

  @override
  String get permMoveMembers => 'نقل الأعضاء (صوت)';

  @override
  String get serverRoleNameHint => 'اسم الدور';

  @override
  String get serverColorLabel => 'اللون';

  @override
  String get serverPermissionsLabel => 'الصلاحيات';

  @override
  String get serverSelfAssignableTitle => 'قابل للتعيين الذاتي';

  @override
  String get serverSelfAssignableSubtitle =>
      'يمكن للأعضاء تعيين هذا الدور لأنفسهم';

  @override
  String get serverDefaultRoleUndeletable => 'لا يمكن حذف الدور الافتراضي.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'حذف الدور \"$roleName\"؟';
  }

  @override
  String get serverCouldNotDeleteRole => 'تعذّر حذف هذا الدور.';

  @override
  String get serverMemberFallback => 'عضو';

  @override
  String get serverNoRolesYet => 'لا توجد أدوار بعد.';

  @override
  String get serverRefreshStatus => 'هل اتصلت بالفعل من المتصفح؟ تحديث الحالة';

  @override
  String get serverPrintfulConnected => 'Printful متصل';

  @override
  String get serverPrintfulNotConnected => 'Printful غير متصل';

  @override
  String get serverPrintfulDescription =>
      'اربط حساب Printful الخاص بهذا الخادم لتنفيذ طلبات المنتجات التي تتم عبر Koda. يربط كل خادم متجره الخاص.';

  @override
  String get serverConnecting => 'جارٍ الاتصال...';

  @override
  String get serverConnectPrintful => 'اتصال بـ Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify متصل';

  @override
  String get serverTiltifyNotConnected => 'Tiltify غير متصل';

  @override
  String get serverTiltifyDescription =>
      'اربط حساب Tiltify الخاص بهذا الخادم لعرض تقدّم الحملة الخيرية مباشرةً لجميع الأعضاء. للقراءة فقط -- لا ينشر Koda أو يغيّر أي شيء في جانب Tiltify.';

  @override
  String get serverConnectTiltify => 'اتصال بـ Tiltify';

  @override
  String get serverNoTiltifyCampaigns =>
      'لم يتم العثور على حملات في حساب Tiltify هذا.';

  @override
  String get serverPickCampaign => 'اختر الحملة المراد عرضها';

  @override
  String get serverUntitledCampaign => 'حملة بلا عنوان';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return 'تم جمع $currency $raised من أصل هدف $goal';
  }

  @override
  String get serverViewCampaign => 'عرض الحملة';

  @override
  String get serverRefreshButton => 'تحديث';

  @override
  String get serverUploadButton => 'رفع';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return 'تم استخدام $used / $limit من الخانات -- مستوى التعزيز $level';
  }

  @override
  String get serverNoCustomEmoji => 'لا توجد إيموجي مخصصة بعد.';

  @override
  String get serverDeleteEmojiTooltip => 'حذف الإيموجي';

  @override
  String get serverUploadEmojiTitle => 'رفع إيموجي';

  @override
  String get serverEmojiNameHint => 'الاسم (أحرف وأرقام و_)';

  @override
  String get serverChooseImage => 'اختيار صورة';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'مستوى التعزيز الحالي: $level';
  }

  @override
  String get serverBackgroundTitle => 'خلفية الخادم';

  @override
  String get serverBackgroundDescription =>
      'خلفية مخصصة تُعرض خلف عرض القنوات لجميع أعضاء هذا الخادم.';

  @override
  String get serverBackgroundLockedHint =>
      'يلزم الوصول إلى مستوى التعزيز 4 لفتح خلفية مخصصة.';

  @override
  String get serverIconBorderTitle => 'إطار أيقونة الخادم';

  @override
  String get serverIconBorderDescription =>
      'إطار مميز حول أيقونة هذا الخادم في قائمة خوادم كل عضو.';

  @override
  String get serverIconBorderLockedHint =>
      'يلزم الوصول إلى مستوى التعزيز 5 لفتح إطار أيقونة مخصص.';

  @override
  String get serverBoostFromBank =>
      'عزّز هذا الخادم من بنك الخادم في المتجر لرفع مستواه.';

  @override
  String get serverMarketplaceListingLabel => 'الإدراج في المتجر';

  @override
  String get serverListInMarketplace => 'الإدراج في متجر Koda';

  @override
  String get serverListInMarketplaceDescription =>
      'يُدرج هذا الخادم في علامة تبويب الاستكشاف على مستوى المنصة، مع فرصة للظهور في التدوير الأسبوعي المميز. هذا منفصل عن إمكانية الانضمام العامة للخادم.';

  @override
  String get serverSocialLinkLabel => 'رابط اجتماعي / دعوة (اختياري)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'حفظ الرابط';

  @override
  String get serverPricingLabel => 'التسعير';

  @override
  String get serverPrimaryCurrencyLabel => 'العملة الأساسية';

  @override
  String get serverPrimaryCurrencyDescription =>
      'تُطبَّق على مستويات اشتراك الخادم وأسعار المنتجات الرقمية التي تحدّدها لهذا الخادم.';

  @override
  String get serverPrimaryLanguageLabel => 'اللغة الأساسية';

  @override
  String get serverPrimaryLanguageDescription =>
      'تحصل الرسائل التي ينشرها الأعضاء بلغة مختلفة على شارة لغة صغيرة، بالمقارنة مع هذا الإعداد.';

  @override
  String get serverMarketplaceLinkSaved => 'تم حفظ رابط المتجر.';

  @override
  String get serverIconUpdated => 'تم تحديث أيقونة الخادم!';

  @override
  String get serverTemplateImported => 'تم استيراد القالب!';

  @override
  String get serverImportFromDiscord => 'الاستيراد من Discord';

  @override
  String get serverVispPlanLive => 'خطة Visp جاهزة الآن!';

  @override
  String get serverAskVisp => 'اسأل Visp';

  @override
  String get serverAddCategoryButton => 'إضافة فئة';

  @override
  String get serverAddChannelHereTooltip => 'إضافة قناة هنا';

  @override
  String get serverRename => 'إعادة تسمية';

  @override
  String get serverUncategorized => 'بلا فئة';

  @override
  String get serverAddChannel => 'إضافة قناة';

  @override
  String get serverEditRulesContent => 'تعديل محتوى القواعد';

  @override
  String get serverRulesContentHint => 'أدخل قواعد خادمك هنا...';

  @override
  String get serverRulesUpdated => 'تم تحديث القواعد!';

  @override
  String get serverAddRole => 'إضافة دور';

  @override
  String get serverDefaultRoleLabel => 'الدور الافتراضي';

  @override
  String get serverManageRolesTooltip => 'إدارة الأدوار';

  @override
  String get serverMutedLabel => 'مكتوم';

  @override
  String get serverExpandedLabel => 'موسّع';

  @override
  String get serverCollapsedLabel => 'مطوي';

  @override
  String get serverUnmute => 'إلغاء الكتم';

  @override
  String get serverMute => 'كتم';

  @override
  String get serverKick => 'طرد';

  @override
  String get serverBan => 'حظر';

  @override
  String serverBannedUsersLabel(int count) {
    return 'المستخدمون المحظورون — $count';
  }

  @override
  String get serverNoBannedUsers => 'لا يوجد مستخدمون محظورون.';

  @override
  String get serverUnban => 'إلغاء الحظر';

  @override
  String get serverMemberFallbackGeneric => 'هذا العضو';

  @override
  String serverBanConfirm(String username, String serverName) {
    return 'حظر $username من $serverName؟ لن يتمكن من العودة إلا بعد إلغاء حظره.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return 'طرد $username من $serverName؟ يمكنه العودة بدعوة.';
  }

  @override
  String get serverMuteDuration60Sec => '60 ثانية';

  @override
  String get serverMuteDuration5Min => '5 دقائق';

  @override
  String get serverMuteDuration10Min => '10 دقائق';

  @override
  String get serverMuteDuration1Hour => 'ساعة واحدة';

  @override
  String get serverMuteDuration1Day => 'يوم واحد';

  @override
  String get serverMuteDuration1Week => 'أسبوع واحد';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'تعذّر تنفيذ الإجراء \"$action\" على $username.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return 'كتم $username';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'تعذّر كتم $username.';
  }

  @override
  String get serverUnlockInvites => 'فتح الدعوات';

  @override
  String get serverInvitesUnlocked => 'تم فتح الدعوات.';

  @override
  String get serverAuditLogDescription =>
      'نشاط الإشراف من المستوى 1 -- الطرد والحظر والكتم والحماية التلقائية من الفيضان/الغارات. بيانات وصفية فقط؛ لا يشمل أبدًا محتوى الرسائل.';

  @override
  String get serverSystemActor => 'النظام';

  @override
  String get serverActionKicked => 'طرد';

  @override
  String get serverActionBanned => 'حظر';

  @override
  String get serverActionUnbanned => 'ألغى حظر';

  @override
  String get serverActionMuted => 'كتم';

  @override
  String get serverActionUnmuted => 'ألغى كتم';

  @override
  String get serverActionFloodDetected => 'تم كتمه تلقائيًا بسبب الفيضان';

  @override
  String get serverActionRaidLockdownEnabled =>
      'أقفل الدعوات (حماية من الغارات)';

  @override
  String get serverActionRaidLockdownDisabled => 'فتح الدعوات';

  @override
  String get serverActionMoved => 'نقل';

  @override
  String get serverUnknownAction => 'إجراء غير معروف';

  @override
  String get serverNoModerationActivity => 'لا يوجد نشاط إشراف بعد.';

  @override
  String get serverReportsDescription =>
      'رسائل أبلغ عنها أعضاء هذا الخادم -- النسخة التي سبق فك تشفيرها من المُبلِّغ نفسه، والتي كُشفت عند تقديم البلاغ.';

  @override
  String get serverNoPendingReports => 'لا توجد بلاغات معلّقة.';

  @override
  String get serverReportReasonOther => 'أخرى';

  @override
  String get serverReportStatusActioned => 'تم اتخاذ إجراء';

  @override
  String get serverReportStatusDismissed => 'تم الرفض';

  @override
  String get serverResolvedLabel => 'تم الحل';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'أبلغ عنه $reporter -- أُرسل بواسطة $target';
  }

  @override
  String serverReportNote(String note) {
    return 'ملاحظة: $note';
  }

  @override
  String get serverDismissButton => 'رفض';

  @override
  String get serverMarkActioned => 'التعليم كمُعالَج';

  @override
  String get serverCreateInvite => 'إنشاء دعوة';

  @override
  String get serverInviteCreatedTitle => 'تم إنشاء الدعوة';

  @override
  String get serverNoActiveInvites => 'لا توجد دعوات نشطة';

  @override
  String serverUsesLabel(String uses) {
    return 'مرات الاستخدام: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'حذف الدعوة';

  @override
  String get serverChangeIconLabel => 'تغيير أيقونة الخادم';

  @override
  String get serverFallbackName => 'خادم';

  @override
  String serverSettingsTitle(String serverName) {
    return 'إعدادات $serverName';
  }

  @override
  String get serverTabChannels => 'القنوات';

  @override
  String get serverTabRoles => 'الأدوار';

  @override
  String get serverTabMembers => 'الأعضاء';

  @override
  String get serverTabInvites => 'الدعوات';

  @override
  String get serverTabMerch => 'المنتجات';

  @override
  String get serverTabEmoji => 'الإيموجي';

  @override
  String get serverTabCustomize => 'التخصيص';

  @override
  String get serverTabAuditLog => 'سجل التدقيق';

  @override
  String get serverTabReports => 'البلاغات';

  @override
  String get serverTabThresholdMod => 'الإشراف بالعتبة';

  @override
  String get serverTabCharity => 'الأعمال الخيرية';

  @override
  String get homeCustomEmojiFallback => 'إيموجي مخصصة';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تفاعل',
      many: '$count تفاعلاً',
      few: '$count تفاعلات',
      two: 'تفاعلان',
      one: 'تفاعل واحد',
      zero: '$count تفاعل',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted => '، لقد تفاعلت، فعّل للإزالة';

  @override
  String get homeReactionActivateToAdd => '، فعّل للإضافة';

  @override
  String get homeAddReactionLabel => 'إضافة تفاعل';

  @override
  String homeViewProfile(String username) {
    return 'عرض ملف $username الشخصي';
  }

  @override
  String get homeMoveToVoiceChannel => 'النقل إلى قناة صوتية…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'اختر قناة صوتية';

  @override
  String get homeNoOtherVoiceChannels => 'لا توجد قنوات صوتية أخرى';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return 'تم نقل $username إلى $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'تعذّر نقل $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'تم نقلك إلى $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'انضم إلى $channel للتحدث';
  }

  @override
  String get adminPanelTitle => 'لوحة الإدارة';

  @override
  String get adminTabBackerCodes => 'رموز الداعمين';

  @override
  String get adminTabUsers => 'المستخدمون';

  @override
  String get adminTabDmReports => 'بلاغات الرسائل المباشرة';

  @override
  String get adminTabSpamFlags => 'أعلام السبام';

  @override
  String get adminTabWiki => 'الويكي';

  @override
  String get adminTabBoosts => 'التعزيزات';

  @override
  String get adminCreateBackerCodeTitle => 'إنشاء رمز داعم';

  @override
  String get adminCodeHint => 'الرمز (اتركه فارغًا للإنشاء التلقائي)';

  @override
  String get adminNoteHint => 'ملاحظة (مثال: \"Kickstarter Tier 2\")';

  @override
  String get adminFlagsJsonHint =>
      'الأعلام بصيغة JSON، مثال \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint =>
      'الحد الأقصى للاستخدامات (اتركه فارغًا = غير محدود)';

  @override
  String get adminCodeCreatedTitle => 'تم إنشاء الرمز';

  @override
  String get adminCodeLabel => 'الرمز:';

  @override
  String get adminCopyCodeTooltip => 'نسخ الرمز';

  @override
  String adminFlagsValue(String flags) {
    return 'الأعلام: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'رموز الداعمين والمكافآت';

  @override
  String get adminNewCodeButton => 'رمز جديد';

  @override
  String get adminNoCodesYet => 'لا توجد رموز بعد';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses استخدامًا';
  }

  @override
  String get adminSearchUsersHint => 'البحث عن المستخدمين بالاسم...';

  @override
  String get adminSearchUsersPrompt => 'ابحث عن مستخدم أعلاه';

  @override
  String get adminNoDmReports => 'لا توجد بلاغات رسائل مباشرة.';

  @override
  String get adminResolvedLabel => 'تم الحل';

  @override
  String get adminReasonOther => 'أخرى';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'المُبلِّغ: $reporterId\\nالمرسل المكشوف عنه: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'ملاحظة: $note';
  }

  @override
  String get adminDismissButton => 'رفض';

  @override
  String get adminMarkActionedButton => 'التعليم كمُعالَج';

  @override
  String get adminStatusActioned => 'تم اتخاذ إجراء';

  @override
  String get adminStatusDismissed => 'تم الرفض';

  @override
  String get adminNoSpamFlags => 'لا توجد أعلام سبام.';

  @override
  String get adminFlagMassDmSpam => 'سبام رسائل مباشرة جماعي';

  @override
  String get adminFlagRaidLockdown => 'إغلاق بسبب غارة';

  @override
  String get adminFlagBotBehavior => 'سلوك يشبه البوت';

  @override
  String get adminFlagChannelFlooding => 'إغراق القناة';

  @override
  String get adminAutoEscalatedBadge => 'تصعيد تلقائي';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'الثقة: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'المستخدم: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'الخادم: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount من $totalJoiners من المنضمين لا يزالون مكتومين';
  }

  @override
  String get adminNoJoinersMuted => 'لا يوجد منضمون مكتومون حاليًا';

  @override
  String adminRestrictedUntil(String until) {
    return 'مقيَّد حاليًا حتى $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'غير مقيَّد حاليًا';

  @override
  String get adminDismissUndoButton => 'رفض وتراجع';

  @override
  String get adminConfirmRestrictButton => 'تأكيد وتقييد';

  @override
  String get adminDeleteArticleTitle => 'حذف المقالة؟';

  @override
  String adminDeleteArticleBody(String title) {
    return 'سيتم إزالة \"$title\" من قاعدة معرفة Visp.';
  }

  @override
  String get adminNewArticleTitle => 'مقالة جديدة';

  @override
  String get adminEditArticleTitle => 'تعديل المقالة';

  @override
  String get adminArticleTitleHint => 'العنوان';

  @override
  String get adminArticleContentHint => 'محتوى المقالة (ماركداون)';

  @override
  String get adminWikiArticlesHeader => 'مقالات الويكي';

  @override
  String get adminNoArticlesYet => 'لا توجد مقالات بعد';

  @override
  String get adminEditArticleTooltip => 'تعديل المقالة';

  @override
  String get adminDeleteArticleTooltip => 'حذف المقالة';

  @override
  String get adminSearchServersHint => 'البحث عن الخوادم بالاسم...';

  @override
  String get adminSearchServersPrompt => 'ابحث عن خادم أعلاه';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'منح تعزيزات لـ $serverName';
  }

  @override
  String get adminNumBoostsHint => 'عدد التعزيزات';

  @override
  String get adminGrantButton => 'منح';

  @override
  String get adminPositiveNumberError => 'أدخل رقمًا صحيحًا موجبًا.';

  @override
  String get adminGrantBoostsFailed => 'فشل منح التعزيزات.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'تم منح $count تعزيز لـ $serverName -- الآن في المستوى $level ($activeCount نشط).',
      many:
          'تم منح $count تعزيزًا لـ $serverName -- الآن في المستوى $level ($activeCount نشط).',
      few:
          'تم منح $count تعزيزات لـ $serverName -- الآن في المستوى $level ($activeCount نشط).',
      two:
          'تم منح تعزيزين لـ $serverName -- الآن في المستوى $level ($activeCount نشط).',
      one:
          'تم منح تعزيز واحد لـ $serverName -- الآن في المستوى $level ($activeCount نشط).',
      zero:
          'لم يتم منح أي تعزيزات لـ $serverName -- الآن في المستوى $level ($activeCount نشط).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count عضو';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'منح تعزيزات';

  @override
  String get parentalDashboardTitle => 'العائلة';

  @override
  String get parentalDashboardCreateChildTitle => 'إنشاء حساب طفل';

  @override
  String get parentalDashboardUsernameHint => 'اسم المستخدم';

  @override
  String get parentalDashboardEmailHint => 'البريد الإلكتروني';

  @override
  String get parentalDashboardPasswordHint => 'كلمة المرور';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'هذا ينشئ حسابًا خاضعًا للإشراف الكامل: تُحظر القنوات المصنّفة، وستتمكن من تحديد الساعات المسموح بها ورؤية (دون قراءة) أصدقائهم وخوادمهم.';

  @override
  String get parentalDashboardValidationError =>
      'اسم المستخدم والبريد الإلكتروني وكلمة مرور من 8 أحرف على الأقل مطلوبة.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'تعذّر إنشاء حساب الطفل -- قد يكون اسم المستخدم أو البريد الإلكتروني مستخدمًا بالفعل.';

  @override
  String get parentalDashboardCreatingLabel => 'جارٍ الإنشاء...';

  @override
  String get parentalDashboardNoChildren => 'لا توجد حسابات مرتبطة بعد.';

  @override
  String get parentalDashboardSupervisedLabel => 'حساب خاضع للإشراف';

  @override
  String get parentalDashboardUnknownUser => 'غير معروف';

  @override
  String get childDetailFallbackTitle => 'حساب الطفل';

  @override
  String get childDetailTabFriends => 'الأصدقاء';

  @override
  String get childDetailTabServers => 'الخوادم';

  @override
  String get childDetailTabSchedule => 'الجدول';

  @override
  String get childDetailTabOverride => 'استثناء';

  @override
  String get childDetailNoFriends => 'لا يوجد أصدقاء.';

  @override
  String get childDetailUnknownUser => 'غير معروف';

  @override
  String get childDetailRemoveFriendTooltip => 'إزالة الصديق';

  @override
  String get childDetailNoServers => 'غير منضم إلى أي خادم.';

  @override
  String childDetailMemberCount(int count) {
    return '$count عضو';
  }

  @override
  String get childDetailRemoveServerTooltip => 'إزالة من الخادم';

  @override
  String get childDetailRestrictAccessTitle => 'تقييد الوصول بساعات محددة';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'الإيقاف يعني وصولًا غير مقيَّد في أي وقت';

  @override
  String get childDetailTimezoneLabel => 'المنطقة الزمنية';

  @override
  String get childDetailMonday => 'الاثنين';

  @override
  String get childDetailTuesday => 'الثلاثاء';

  @override
  String get childDetailWednesday => 'الأربعاء';

  @override
  String get childDetailThursday => 'الخميس';

  @override
  String get childDetailFriday => 'الجمعة';

  @override
  String get childDetailSaturday => 'السبت';

  @override
  String get childDetailSunday => 'الأحد';

  @override
  String get childDetailNoAccessLabel => 'لا يوجد وصول';

  @override
  String get childDetailToLabel => 'إلى';

  @override
  String get childDetailSavingLabel => 'جارٍ الحفظ...';

  @override
  String get childDetailSaveScheduleButton => 'حفظ الجدول';

  @override
  String get childDetailScheduleSaved => 'تم حفظ الجدول.';

  @override
  String get childDetailOverrideExplanation =>
      'امنح وصولًا مؤقتًا خارج الجدول المعتاد -- مفيد لاستثناء لمرة واحدة دون تغيير الجدول الأسبوعي.';

  @override
  String get childDetailReasonHint => 'السبب (اختياري)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes دقيقة';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours ساعة';
  }

  @override
  String get childDetailRevokeOverrideButton => 'إلغاء الاستثناء النشط';

  @override
  String get childDetailAccessGranted => 'تم منح وصول مؤقت.';

  @override
  String get childDetailOverrideRevoked => 'تم إلغاء الاستثناء.';

  @override
  String get digitalGoodsTitle => 'المنتجات الرقمية';

  @override
  String get digitalGoodsMyProductsTitle => 'منتجاتي';

  @override
  String get digitalGoodsManageProductsTooltip => 'إدارة منتجات هذا الخادم';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'التبديل إلى التصفح';

  @override
  String get digitalGoodsCreateProductTooltip => 'إنشاء منتج';

  @override
  String get digitalGoodsBrowseTab => 'تصفح';

  @override
  String get digitalGoodsMyListingsTab => 'قوائمي';

  @override
  String get digitalGoodsMyPurchasesTab => 'مشترياتي';

  @override
  String get digitalGoodsNoProductsYet => 'لا توجد منتجات بعد';

  @override
  String get digitalGoodsNoProductsAvailable => 'لا توجد منتجات متاحة';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'أنشئ منتجك الأول لتبدأ البيع';

  @override
  String get digitalGoodsCheckBackLater =>
      'عد لاحقًا للاطلاع على المنتجات الرقمية';

  @override
  String get digitalGoodsCreateProductButton => 'إنشاء منتج';

  @override
  String get digitalGoodsLicenseKeyBadge => 'مفتاح ترخيص';

  @override
  String get digitalGoodsFileBadge => 'ملف';

  @override
  String get digitalGoodsAllServersBadge => 'جميع الخوادم';

  @override
  String get digitalGoodsFreeForYou => 'مجاني لك';

  @override
  String get digitalGoodsFreeLabel => 'مجاني';

  @override
  String digitalGoodsSoldCount(int count) {
    return 'تم بيع $count';
  }

  @override
  String get digitalGoodsKeysButton => 'المفاتيح';

  @override
  String get digitalGoodsGetForFree => 'احصل عليه مجانًا';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'شراء مقابل $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'لا توجد مشتريات بعد';

  @override
  String get digitalGoodsUnknownProduct => 'منتج غير معروف';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'تم الشراء في $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'نسخ المفتاح';

  @override
  String get digitalGoodsLicenseKeyCopied => 'تم نسخ مفتاح الترخيص!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'تنتهي الصلاحية في $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'مفتاح الترخيص الخاص بك';

  @override
  String get digitalGoodsCopyKeyButton => 'نسخ المفتاح';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'تعذّر بدء الدفع -- قد لا يكون هذا المنشئ قد ربط Stripe بعد.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'اكتملت عملية الشراء! ابحث عنها ضمن مشترياتي.';

  @override
  String get digitalGoodsPurchasePending =>
      'لا يزال بانتظار الدفع -- سيظهر ضمن مشترياتي بمجرد اكتماله.';

  @override
  String get digitalGoodsCreateProductTitle => 'إنشاء منتج';

  @override
  String get digitalGoodsEditProductTitle => 'تعديل المنتج';

  @override
  String get digitalGoodsProductTitleHint => 'عنوان المنتج';

  @override
  String get digitalGoodsDescriptionHint => 'الوصف (اختياري)';

  @override
  String get digitalGoodsPriceHint =>
      'السعر بالدولار الأمريكي (اتركه فارغًا ليكون مجانيًا)';

  @override
  String get digitalGoodsProductTypeLabel => 'نوع المنتج';

  @override
  String get digitalGoodsFileDownloadOption => 'تنزيل ملف';

  @override
  String get digitalGoodsLicenseKeyOption => 'مفتاح ترخيص';

  @override
  String get digitalGoodsAvailabilityLabel => 'التوفر';

  @override
  String get digitalGoodsThisServerOnlyOption => 'هذا الخادم فقط';

  @override
  String get digitalGoodsAllKodaServersOption => 'جميع خوادم Koda';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'بعد الإنشاء، استخدم زر \"المفاتيح\" لرفع مفاتيح الترخيص الخاصة بك.';

  @override
  String get digitalGoodsProductFileLabel => 'ملف المنتج';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName ($sizeMb ميجابايت)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'إزالة الملف';

  @override
  String get digitalGoodsUploadingLabel => 'جارٍ الرفع...';

  @override
  String get digitalGoodsChooseFileButton => 'اختيار ملف';

  @override
  String get digitalGoodsReplaceFileButton => 'استبدال الملف';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'اختر ملفًا لهذا المنتج قبل الحفظ.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'رفع مفاتيح الترخيص';

  @override
  String get digitalGoodsPasteKeysHint => 'الصق مفتاحًا واحدًا في كل سطر:';

  @override
  String get digitalGoodsKeyExampleHint =>
      'KEY-XXXX-XXXX\\nKEY-YYYY-YYYY\\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'رفع المفاتيح';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'تم رفع مفاتيح الترخيص!';

  @override
  String get serverSubscriptionManageTitle => 'إدارة الاشتراكات';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return 'اشتراكات $serverName';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'إضافة مستوى';

  @override
  String get serverSubscriptionNoTiersYet => 'لا توجد مستويات اشتراك بعد';

  @override
  String get serverSubscriptionCreateUpTo3Tiers => 'أنشئ حتى 3 مستويات لمجتمعك';

  @override
  String get serverSubscriptionCreateFirstTierButton => 'إنشاء المستوى الأول';

  @override
  String get serverSubscriptionShowSubscriberCounts => 'إظهار عدد المشتركين';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/شهريًا';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مشترك نشط',
      many: '$count مشتركًا نشطًا',
      few: '$count مشتركين نشطين',
      two: 'مشتركان نشطان',
      one: 'مشترك نشط واحد',
      zero: 'لا مشتركون نشطون',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned => 'يُمنح الدور تلقائيًا';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return 'خصم $discount% في المتجر';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'لا يوجد لدى هذا الخادم مستويات اشتراك';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'مشترك نشط';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'تنتهي الصلاحية في $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk => 'دور حصري للمشتركين';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return 'خصم $discount% على مشتريات المتجر';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'قنوات خاصة بالمشتركين فقط';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'مُشترِك حاليًا';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'اشترك مقابل $price/شهريًا';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'إنشاء مستوى';

  @override
  String get serverSubscriptionEditTierTitle => 'تعديل المستوى';

  @override
  String get serverSubscriptionTierNameHint =>
      'اسم المستوى (مثال: مُعجب، داعم، VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'الوصف (اختياري)';

  @override
  String get serverSubscriptionPriceHint => 'السعر شهريًا (بالدولار الأمريكي)';

  @override
  String get serverSubscriptionDiscountLabel => 'نسبة خصم المتجر %';

  @override
  String get serverSubscriptionPositionLabel => 'الترتيب';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'المستوى $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'يمنح دورًا عند الاشتراك — اختياري';

  @override
  String get serverSubscriptionRoleFallback => 'دور';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'يُمنح تلقائيًا للعضو لحظة اشتراكه، ويُسحب لحظة انتهاء اشتراكه.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'تم إنشاء المستوى -- اربط Stripe ضمن المتجر ← المنشئ قبل أن يتمكن الأعضاء من الاشتراك فيه.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'حذف المستوى';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return 'حذف \"$tierName\"؟ سيحتفظ المشتركون الحاليون بالوصول حتى انتهاء الصلاحية.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'الاشتراك في $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel => 'اشتراك شهري';

  @override
  String get serverSubscriptionServerBankEarnsLabel => 'يكسب بنك الخادم';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points نقطة';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'تتم معالجة الدفع بأمان بواسطة Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'اشتراك';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'تعذّر بدء الدفع -- قد لا يكون مالك هذا الخادم قد ربط Stripe بعد.';

  @override
  String get serverSubscriptionSubscribed => 'تم الاشتراك!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'لا يزال بانتظار الدفع -- سيُفعَّل بمجرد اكتماله.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'إكرامية لـ $username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'اختر المبلغ';

  @override
  String get tipDialogMessageHint => 'أضف رسالة (اختياري)';

  @override
  String get tipDialogYouPayLabel => 'تدفع';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return 'يستلم $username';
  }

  @override
  String get tipDialogSendTipButton => 'إرسال إكرامية';

  @override
  String get tipDialogFailedToSendTip =>
      'فشل إرسال الإكرامية. قد لا يكون المنشئ متصلًا بـ Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'تعذّر بدء الدفع. حاول مرة أخرى بعد قليل.';

  @override
  String get tipDialogTipSent => 'تم إرسال الإكرامية!';

  @override
  String get tipDialogTipPending =>
      'لا يزال بانتظار الدفع -- سيتم إتمامه بمجرد اكتماله.';

  @override
  String get tipDialogUnknownUser => 'غير معروف';

  @override
  String get marketplaceTitle => 'المتجر';

  @override
  String get marketplaceCreatorPayoutsTitle => 'مدفوعات المنشئين';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'استلم الإكراميات مباشرة عبر Stripe';

  @override
  String get marketplaceTabServerBank => 'بنك الخادم';

  @override
  String get marketplaceTabDigitalGoods => 'المنتجات الرقمية';

  @override
  String get marketplaceTabMerch => 'المنتجات';

  @override
  String get marketplaceTabSubscription => 'الاشتراك';

  @override
  String get marketplaceTabRevenue => 'الإيرادات';

  @override
  String get marketplaceSelectServerSubscription => 'اختر خادمًا لعرض اشتراكه';

  @override
  String get marketplaceSelectServerBank => 'اختر خادمًا لعرض بنكه';

  @override
  String get marketplaceSelectServerRevenue => 'اختر خادمًا لعرض إيراداته';

  @override
  String get marketplaceStripeAccountStatus => 'حساب Stripe';

  @override
  String get marketplaceOnboardingCompleteStatus => 'التسجيل مكتمل';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'يقبل الدفعات';

  @override
  String get marketplaceConnectStripeButton => 'ربط حساب Stripe';

  @override
  String get marketplaceCompleteStripeOnboardingButton => 'إكمال تسجيل Stripe';

  @override
  String get marketplaceRefreshStatusButton => 'تحديث الحالة';

  @override
  String get marketplaceReadyToReceiveTips => 'أنت جاهز لاستلام الإكراميات!';

  @override
  String get marketplaceHowItWorksTitle => 'كيف يعمل';

  @override
  String get marketplaceHowItWorksStep1 => 'اربط حساب Stripe الخاص بك';

  @override
  String get marketplaceHowItWorksStep2 => 'أكمل التحقق من الهوية';

  @override
  String get marketplaceHowItWorksStep3 =>
      'استلم الإكراميات مباشرة في حسابك المصرفي';

  @override
  String get marketplaceProcessingFeeNote =>
      'تفرض Koda رسوم معالجة بنسبة 5%. تذهب هذه الرسوم إلى بنك خادمك كنقاط.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'يمكن لمالك الخادم فقط أو لمن يملك صلاحية «إدارة المتجر» عرض بنك الخادم.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return 'تم تعزيز $serverName!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit فتحة إيموجي مخصصة';
  }

  @override
  String get marketplaceServerFallback => 'الخادم';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance نقطة';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount من النشاط';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'تُكتسب النقاط من رسوم المعالجة بنسبة 5% على الإكراميات والاشتراكات في هذا الخادم. استخدم النقاط لفتح ترقيات الخادم.';

  @override
  String get marketplaceServerBoostsTitle => 'تعزيزات الخادم';

  @override
  String marketplaceLevelLabel(int level) {
    return 'المستوى $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تعزيز نشط',
      many: '$count تعزيزًا نشطًا',
      few: '$count تعزيزات نشطة',
      two: 'تعزيزان نشطان',
      one: 'تعزيز نشط واحد',
      zero: 'لا تعزيزات نشطة',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: '$more تعزيز إضافي للوصول إلى المستوى $level',
      many: '$more تعزيزًا إضافيًا للوصول إلى المستوى $level',
      few: '$more تعزيزات إضافية للوصول إلى المستوى $level',
      two: 'تعزيزان إضافيان للوصول إلى المستوى $level',
      one: 'تعزيز واحد إضافي للوصول إلى المستوى $level',
      zero: 'لا حاجة لتعزيزات إضافية للوصول إلى المستوى $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix => ' ويفتح خلفية مخصصة للخادم';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' ويفتح إطار أيقونة مخصصًا للخادم';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'لديك $count رمز تعزيز متاح.',
      many: 'لديك $count رمزًا للتعزيز متاحًا.',
      few: 'لديك $count رموز تعزيز متاحة.',
      two: 'لديك رمزا تعزيز متاحان.',
      one: 'لديك رمز تعزيز واحد متاح.',
      zero: 'ليس لديك أي رموز تعزيز متاحة.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'تأتي رموز التعزيز من اشتراك Pulse (واحد شهريًا). اشترك من تبويب الاشتراكات للحصول على واحد.';

  @override
  String get marketplaceBoostingLabel => 'جارٍ التعزيز...';

  @override
  String get marketplaceBoostThisServerButton => 'عزّز هذا الخادم';

  @override
  String get marketplaceComingSoonUpgradesTitle => 'قريبًا — ترقيات الخادم';

  @override
  String get marketplaceSpendPointsList =>
      'أنفق نقاط بنك الخادم على:\n• نطاق مخصص للخادم\n• حد أعضاء أعلى\n• دعم ذو أولوية\n• شارة خادم حصرية';

  @override
  String get marketplaceSourceTip => 'الإكراميات';

  @override
  String get marketplaceSourceSubscription => 'اشتراكات Koda';

  @override
  String get marketplaceSourceServerSubscription => 'اشتراكات الخادم';

  @override
  String get marketplaceSourceDigitalProduct => 'المنتجات الرقمية';

  @override
  String get marketplaceSourceStageTicket => 'تذاكر المسرح';

  @override
  String get marketplaceSourcePrintfulOrder => 'طلبات المنتجات';

  @override
  String get marketplaceJustNow => 'الآن';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return 'منذ $minutes د';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return 'منذ $hours س';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return 'منذ $days ي';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'يمكن للأعضاء القادرين على إدارة المتجر فقط عرض إيرادات هذا الخادم.';

  @override
  String get marketplaceBalanceLabel => 'الرصيد';

  @override
  String get marketplaceLifetimeEarnedLabel => 'إجمالي الأرباح';

  @override
  String get marketplaceLast30DaysTitle => 'آخر 30 يومًا';

  @override
  String get marketplaceRevenueBySourceTitle => 'الإيرادات حسب المصدر';

  @override
  String get marketplaceNoRevenueYet => 'لا توجد إيرادات بعد.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count معاملة',
      many: '$count معاملة',
      few: '$count معاملات',
      two: 'معاملتان',
      one: 'معاملة واحدة',
      zero: 'لا معاملات',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'المعاملات الأخيرة';

  @override
  String get marketplaceNoTransactionsYet => 'لا توجد معاملات بعد.';

  @override
  String get marketplaceNoActivityYet => 'لا يوجد نشاط بعد';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تمت مزامنة $count منتج من Printful',
      many: 'تمت مزامنة $count منتجًا من Printful',
      few: 'تمت مزامنة $count منتجات من Printful',
      two: 'تمت مزامنة منتجين من Printful',
      one: 'تمت مزامنة منتج واحد من Printful',
      zero: 'لم تتم مزامنة أي منتجات من Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'تعذّرت المزامنة مع Printful -- تحقق من الاتصال في إعدادات المنتجات.';

  @override
  String get printfulMerchSelectServer => 'اختر خادمًا لعرض منتجاته';

  @override
  String get printfulMerchManageCatalogTitle => 'إدارة كتالوج المنتجات';

  @override
  String get printfulMerchTitle => 'المنتجات';

  @override
  String get printfulMerchSyncingLabel => 'جارٍ المزامنة...';

  @override
  String get printfulMerchSyncCatalogButton => 'مزامنة الكتالوج';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'التبديل إلى التصفح';

  @override
  String get printfulMerchManageTooltip => 'إدارة منتجات هذا الخادم';

  @override
  String get printfulMerchNothingSyncedYet => 'لم تتم مزامنة أي شيء بعد';

  @override
  String get printfulMerchNoMerchAvailable => 'لا توجد منتجات متاحة بعد';

  @override
  String get printfulMerchSyncHint =>
      'زامن متجر Printful الخاص بك لجلب كتالوج منتجاتك';

  @override
  String get printfulMerchCheckBackLater =>
      'عد لاحقًا للاطلاع على منتجات هذا الخادم';

  @override
  String get printfulMerchOutOfStock => 'غير متوفر';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ابتداءً من $price • $count خيار',
      many: 'ابتداءً من $price • $count خيارًا',
      few: 'ابتداءً من $price • $count خيارات',
      two: 'ابتداءً من $price • خياران',
      one: 'ابتداءً من $price • خيار واحد',
      zero: 'ابتداءً من $price',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'عرض';

  @override
  String get printfulMerchCartTooltip => 'السلة';

  @override
  String printfulMerchAddedToCart(String productName) {
    return 'تمت إضافة $productName إلى السلة';
  }

  @override
  String get printfulMerchQuantityLabel => 'الكمية';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'إنقاص الكمية';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'زيادة الكمية';

  @override
  String get printfulMerchAddToCartButton => 'أضف إلى السلة';

  @override
  String get printfulMerchOptionLabel => 'الخيار';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'النمط';

  @override
  String get printfulMerchSizeLabel => 'المقاس';

  @override
  String get printfulMerchYourCartTitle => 'سلتك';

  @override
  String get printfulMerchCartEmpty => 'سلتك فارغة.';

  @override
  String get printfulMerchSubtotalLabel => 'المجموع الفرعي';

  @override
  String get printfulMerchCheckoutLabel => 'الدفع';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'إزالة من السلة';

  @override
  String get printfulMerchFillShippingAddressFirst => 'املأ عنوان الشحن أولاً.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'تعذّر الحصول على أسعار الشحن لهذا العنوان.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'تعذّر بدء الدفع. حاول مرة أخرى بعد قليل.';

  @override
  String get printfulMerchOrderPlaced => 'تم تقديم الطلب!';

  @override
  String get printfulMerchOrderPending =>
      'لا تزال الدفعة قيد الانتظار -- سيُقدَّم الطلب بمجرد اكتمالها.';

  @override
  String get printfulMerchShippingSpeedLabel => 'سرعة الشحن';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max يوم عمل';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => 'احصل على عرض شحن';

  @override
  String get printfulMerchPayButton => 'ادفع';

  @override
  String get kodaMarketplaceTitle => 'متجر Koda';

  @override
  String get kodaMarketplaceTabSubscriptions => 'الاشتراكات';

  @override
  String get kodaMarketplaceTabBoosts => 'التعزيزات';

  @override
  String get kodaMarketplaceTabDiscover => 'استكشف';

  @override
  String get kodaMarketplaceTierFreeName => 'مجاني';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'تنتهي الصلاحية $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks =>
      'قم بالترقية للحصول على مزايا حصرية';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count رمز تعزيز متاح',
      many: '$count رمزًا للتعزيز متاحًا',
      few: '$count رموز تعزيز متاحة',
      two: 'رمزا تعزيز متاحان',
      one: 'رمز تعزيز واحد متاح',
      zero: 'لا رموز تعزيز متاحة',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'أهدِ رمزًا لأي خادم أنت عضو فيه من تبويب بنك الخادم الخاص به';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => 'إطار صورة رمزية مخصص';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'شارة Spark في الملف الشخصي';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'حد أعلى لرفع الملفات (50 ميجابايت)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality => 'جودة صوت ذات أولوية';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'كل ما في Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => 'إطار صورة رمزية متحرك';

  @override
  String get kodaMarketplacePulsePerkBadge => 'شارة Pulse في الملف الشخصي';

  @override
  String get kodaMarketplacePulsePerkFileLimit => 'حد رفع الملفات 100 ميجابايت';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      'رمز تعزيز واحد للخادم شهريًا';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/شهريًا';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'الخطة الحالية';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'احصل على $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return 'أهدِ $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return 'إهداء $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'الاشتراك في $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel => 'اسم مستخدم المُهدى إليه:';

  @override
  String get kodaMarketplaceUsernameHint => 'اسم المستخدم';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'الاشتراك';

  @override
  String get kodaMarketplaceTotalLabel => 'الإجمالي';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'تتم معالجة الدفع بأمان عبر Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'المتابعة إلى الدفع';

  @override
  String get kodaMarketplaceUserNotFound => 'المستخدم غير موجود';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'تعذّر بدء الدفع. حاول مرة أخرى بعد قليل.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'الاشتراك نشط!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'لا تزال الدفعة قيد الانتظار -- سيُفعَّل بمجرد اكتمالها.';

  @override
  String get kodaMarketplaceBoostPurchased => 'تم شراء التعزيز!';

  @override
  String get kodaMarketplaceBoostPending =>
      'لا تزال الدفعة قيد الانتظار -- سيكون جاهزًا بمجرد اكتمالها.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count متاح';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'شراء تعزيز';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'عملية شراء لمرة واحدة -- يحصل مشتركو Pulse أيضًا على رمز مجاني واحد مع كل تجديد، وهو ما يبقى الخيار الأفضل إذا كنت تعزّز بانتظام.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'شراء تعزيز -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'لم ينضم أي خادم بعد إلى متجر Koda. يمكن لأصحاب الخوادم تفعيل ذلك في إعدادات تخصيص خادمهم.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => 'المميز هذا الأسبوع';

  @override
  String get kodaMarketplaceAllListedServersHeader => 'جميع الخوادم المدرجة';

  @override
  String get kodaMarketplaceServerFallback => 'الخادم';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عضو',
      many: '$count عضوًا',
      few: '$count أعضاء',
      two: 'عضوان',
      one: 'عضو واحد',
      zero: 'لا أعضاء',
    );
    return '$_temp0';
  }

  @override
  String get calendarFallbackTitle => 'التقويم';

  @override
  String get calendarAskVispTooltip => 'اسأل Visp';

  @override
  String get calendarCreateEventTooltip => 'إنشاء حدث';

  @override
  String get calendarPreviousMonthTooltip => 'الشهر السابق';

  @override
  String get calendarNextMonthTooltip => 'الشهر التالي';

  @override
  String get calendarTodayButton => 'اليوم';

  @override
  String get calendarWeekdaySun => 'أحد';

  @override
  String get calendarWeekdayMon => 'اثنين';

  @override
  String get calendarWeekdayTue => 'ثلاثاء';

  @override
  String get calendarWeekdayWed => 'أربعاء';

  @override
  String get calendarWeekdayThu => 'خميس';

  @override
  String get calendarWeekdayFri => 'جمعة';

  @override
  String get calendarWeekdaySat => 'سبت';

  @override
  String get calendarTodaySuffix => '، اليوم';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '، $count حدث',
      many: '، $count حدثًا',
      few: '، $count أحداث',
      two: '، حدثان',
      one: '، حدث واحد',
      zero: '، لا أحداث',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'اختر يومًا';

  @override
  String get calendarNoEvents => 'لا توجد أحداث';

  @override
  String get calendarSubscribeTooltip => 'اشترك';

  @override
  String get calendarUnsubscribeTooltip => 'ألغِ الاشتراك';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'يتكرر $recurrence';
  }

  @override
  String get calendarTicketOwned => 'التذكرة مملوكة';

  @override
  String calendarTicketPrice(String price) {
    return 'تذكرة بـ $price';
  }

  @override
  String get calendarDeleteEventTitle => 'حذف الحدث';

  @override
  String calendarDeleteEventConfirm(String title) {
    return 'حذف \"$title\"؟ لا يمكن التراجع عن هذا.';
  }

  @override
  String get calendarEditEventTitle => 'تعديل الحدث';

  @override
  String get calendarCreateEventTitle => 'إنشاء حدث';

  @override
  String get calendarEventTitleHint => 'عنوان الحدث';

  @override
  String get calendarDescriptionHint => 'الوصف (اختياري)';

  @override
  String get calendarLocationHint => 'الموقع (اختياري)';

  @override
  String calendarStartLabel(String timezone) {
    return 'البداية ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'تاريخ ووقت البداية، $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'النهاية — اختياري ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'تاريخ ووقت النهاية، $formatted';
  }

  @override
  String get calendarNotSetLabel => 'غير محدد';

  @override
  String get calendarTapToSetEndTime => 'اضغط لتحديد وقت النهاية';

  @override
  String get calendarRecurrenceLabel => 'التكرار';

  @override
  String get calendarRecurrenceNone => 'لا يتكرر';

  @override
  String get calendarRecurrenceDaily => 'يوميًا';

  @override
  String get calendarRecurrenceWeekly => 'أسبوعيًا';

  @override
  String get calendarRecurrenceMonthly => 'شهريًا';

  @override
  String get calendarColorLabel => 'اللون';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'اللون $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'سعر التذكرة — اختياري';

  @override
  String get calendarLinkStageChannelLabel => 'الربط بقناة المسرح — اختياري';

  @override
  String get calendarStageChannelFallback => 'المسرح';

  @override
  String get discordImportFetchError => 'تعذّر جلب القالب.';

  @override
  String get discordImportApplyError => 'فشل تطبيق القالب. حاول مرة أخرى.';

  @override
  String get discordImportTitle => 'استيراد قالب Discord';

  @override
  String get discordImportDescription =>
      'الصق رابط discord.new أو رمز القالب لاستيراد الأدوار والفئات والقنوات إلى هذا الخادم.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 أو رمز القالب';

  @override
  String get discordImportPreviewButton => 'معاينة';

  @override
  String get discordImportTemplateFallback => 'القالب';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دور',
      many: '$count دورًا',
      few: '$count أدوار',
      two: 'دوران',
      one: 'دور واحد',
      zero: 'لا أدوار',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فئة',
      many: '$count فئة',
      few: '$count فئات',
      two: 'فئتان',
      one: 'فئة واحدة',
      zero: 'لا فئات',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count قناة',
      many: '$count قناة',
      few: '$count قنوات',
      two: 'قناتان',
      one: 'قناة واحدة',
      zero: 'لا قنوات',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel => 'استبدال البنية الحالية';

  @override
  String get discordImportReplaceWarning =>
      'سيتم حذف جميع القنوات والفئات والأدوار الحالية نهائيًا.';

  @override
  String get discordImportAddDescription =>
      'سيُضاف القالب إلى بنية خادمك الحالية.';

  @override
  String get discordImportReplaceConfirmTitle => 'استبدال بنية الخادم؟';

  @override
  String get discordImportReplaceConfirmBody =>
      'سيؤدي هذا إلى حذف جميع القنوات والفئات والأدوار الحالية نهائيًا قبل الاستيراد. لا يمكن التراجع عن هذا.';

  @override
  String get discordImportYesReplace => 'نعم، استبدال';

  @override
  String get discordImportReplaceAndImportButton => 'استبدال واستيراد القالب';

  @override
  String get discordImportAddToServerButton => 'إضافة القالب إلى الخادم';

  @override
  String get thresholdModConfigureTitle => 'إعداد الإشراف بالعتبة';

  @override
  String get thresholdModConfigureExplanation =>
      'اختر المشرفين الموثوقين وعدد من يجب أن يوافق منهم قبل أن يتمكن أي منهم من فك تشفير حقبة واحدة من سجل القناة. لا يملك حتى أنت مفتاحًا منفردًا -- أنت مستثنى فقط إذا كنت أيضًا ضمن هذه القائمة.';

  @override
  String get thresholdModThresholdLabel => 'العتبة:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'تقليل العتبة';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'زيادة العتبة';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'من أصل $count مشرف',
      many: 'من أصل $count مشرفًا',
      few: 'من أصل $count مشرفين',
      two: 'من أصل مشرفين اثنين',
      one: 'من أصل مشرف واحد',
      zero: 'من أصل لا مشرفين',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle => 'طلب فك تشفير بالعتبة';

  @override
  String get thresholdModChannelLabel => 'القناة';

  @override
  String get thresholdModReasonHint => 'السبب -- يُعرض على كل مشرف معيّن';

  @override
  String get thresholdModRequestButton => 'طلب';

  @override
  String get thresholdModShareRelayed => 'تم إرسال الحصة إلى مقدّم الطلب.';

  @override
  String get thresholdModNotEnoughShares =>
      'لم يتم إرسال حصص كافية بعد -- حاول مرة أخرى بعد أن يرسل المزيد من المشرفين حصصهم.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count رسالة',
      many: '$count رسالة',
      few: '$count رسائل',
      two: 'رسالتان',
      one: 'رسالة واحدة',
      zero: 'لا رسائل',
    );
    return 'الحقبة $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'لا توجد رسائل قابلة لفك التشفير في هذه الحقبة.';

  @override
  String get thresholdModExplanation =>
      'فك تشفير حقيقي لسجل القناة، مشروط بموافقة نشطة من عدة مشرفين معيّنين -- أبدًا من شخص واحد بمفرده، ولا حتى مالك الخادم. لا يفتح أبدًا سوى حقبة واحدة كاملة (كل ما أُرسل منذ آخر تغيير في العضوية)، وليس رسالة واحدة أبدًا.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'مُفعّل -- $count مشرفين، العتبة $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'غير مُعد';

  @override
  String get thresholdModReconfigureButton => 'إعادة الإعداد';

  @override
  String get thresholdModEnableButton => 'تفعيل';

  @override
  String get thresholdModNotEnabledForServer =>
      'الإشراف بالعتبة غير مفعّل لهذا الخادم.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'مفعّل لهذا الخادم. أنت لست من ضمن المشرفين المعيّنين.';

  @override
  String get thresholdModRequestsLabel => 'الطلبات';

  @override
  String get thresholdModRequestDecryptButton => 'طلب فك التشفير';

  @override
  String get thresholdModNoActiveRequests => 'لا توجد طلبات نشطة.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- الحقبة $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'قيد الانتظار';

  @override
  String get thresholdModStatusApproved => 'تمت الموافقة';

  @override
  String get thresholdModApproveButton => 'موافقة';

  @override
  String get thresholdModRelayShareButton => 'إرسال حصتي';

  @override
  String get thresholdModTryReconstructButton => 'محاولة إعادة البناء';

  @override
  String get roleSelectNoRolesAvailable =>
      'لا توجد أدوار قابلة للتعيين الذاتي متاحة.';

  @override
  String get roleSelectInstructions =>
      'اختر الأدوار التي تريدها. اضغط على دور لإضافته أو إزالته.';

  @override
  String get rulesScreenAcceptError => 'تعذّر قبول القواعد. حاول مرة أخرى.';

  @override
  String get rulesScreenSubtitle => 'قواعد الخادم';

  @override
  String get rulesScreenScrollToRead => 'مرّر لأسفل لقراءة جميع القواعد';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'بالنقر على «قبول»، فإنك توافق على اتباع هذه القواعد.\nقد تؤدي المخالفات إلى الإزالة من الخادم.';

  @override
  String get rulesScreenAcceptButton => 'أوافق على القواعد';

  @override
  String get rulesScreenReadAllToContinue => 'اقرأ جميع القواعد للمتابعة';

  @override
  String get galleryNewPostTitle => 'منشور جديد';

  @override
  String get galleryChooseFileButton => 'اختيار ملف';

  @override
  String get galleryOrDivider => 'أو';

  @override
  String get galleryPasteUrlHint => 'الصق رابط صورة/فيديو';

  @override
  String get galleryTypeLabel => 'النوع';

  @override
  String get galleryImageOption => 'صورة';

  @override
  String get galleryVideoOption => 'فيديو';

  @override
  String get galleryCaptionHint => 'التعليق (اختياري)';

  @override
  String get galleryPostButton => 'نشر';

  @override
  String get galleryNewCollectionTitle => 'مجموعة جديدة';

  @override
  String get galleryCollectionNameHint => 'اسم المجموعة';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return 'حذف \"$collectionName\"؟ ستصبح المنشورات بداخلها غير مجمّعة.';
  }

  @override
  String get galleryFeedTab => 'التغذية';

  @override
  String get galleryCollectionsTab => 'المجموعات';

  @override
  String get galleryNoPostsYet => 'لا توجد منشورات بعد';

  @override
  String get galleryNoCollectionsYet => 'لا توجد مجموعات بعد';

  @override
  String get gallerySelectACollection => 'اختر مجموعة';

  @override
  String get galleryNoPostsInCollection => 'لا توجد منشورات في هذه المجموعة';

  @override
  String get galleryAddPostButton => 'إضافة منشور';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'فشلت مشاركة الشاشة: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return 'مستوى صوت $username';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'يؤثر فقط على ما تسمعه أنت -- هذا الجهاز، هذه المكالمة.';

  @override
  String get voiceScreenResetVolumeButton => 'إعادة تعيين';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'تعذّر الاتصال: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'شاشتك، اضغط للعرض بملء الشاشة';

  @override
  String get voiceScreenYourScreenLabel => 'شاشتك';

  @override
  String get voiceScreenTapToClose => 'اضغط للإغلاق';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (أنت)';
  }

  @override
  String get voiceScreenSpeakingSuffix => '، يتحدث';

  @override
  String get voiceScreenCameraOnSuffix => '، الكاميرا قيد التشغيل';

  @override
  String get voiceScreenActivateToPopOut => '، فعّل لفتحه في نافذة منفصلة';

  @override
  String get voiceScreenShowVarmTooltip => 'إظهار VARM';

  @override
  String get voiceScreenHideVarmTooltip => 'إخفاء VARM';

  @override
  String get voiceScreenShowChatTooltip => 'إظهار الدردشة';

  @override
  String get voiceScreenHideChatTooltip => 'إخفاء الدردشة';

  @override
  String get voiceScreenStartCameraTooltip => 'تشغيل الكاميرا';

  @override
  String get voiceScreenStopCameraTooltip => 'إيقاف الكاميرا';

  @override
  String get voiceScreenShareScreenTooltip => 'مشاركة الشاشة';

  @override
  String get voiceScreenStopSharingTooltip => 'إيقاف المشاركة';

  @override
  String get voiceScreenPopOutTooltip => 'فتح الصوت في نافذة منفصلة';

  @override
  String get voiceScreenCouldNotPopOut => 'تعذّر فتح الصوت في نافذة منفصلة.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'مغادرة المكالمة الصوتية';

  @override
  String get voiceScreenPinTooltip => 'تثبيت (إبقاؤه مفتوحًا)';

  @override
  String get voiceScreenUnpinTooltip => 'إلغاء التثبيت';

  @override
  String get voiceScreenSizeSmall => 'صغير (320×180)';

  @override
  String get voiceScreenSizeMedium => 'متوسط (480×270)';

  @override
  String get voiceScreenSizeLarge => 'كبير (640×360)';

  @override
  String get voiceScreenSizeXl => 'كبير جدًا (960×540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName، $count متصل';
  }

  @override
  String get voiceBarSpeakingSuffix => '، أنت تتحدث';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count متصل · اضغط للتوسيع';
  }

  @override
  String get voiceBarStartCameraTooltip => 'تشغيل الكاميرا';

  @override
  String get voiceBarStopCameraTooltip => 'إيقاف الكاميرا';

  @override
  String get voiceBarLeaveVoiceTooltip => 'مغادرة المكالمة الصوتية';

  @override
  String get popOutVideoFallbackTitle => 'صوت';

  @override
  String get popOutVideoMissingTokenError => 'الرمز أو الرابط مفقود';

  @override
  String get popOutVideoConnectionTimedOut => 'انتهت مهلة الاتصال بعد 15 ثانية';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'خطأ: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'لا يوجد مشاركون';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'المسرح';

  @override
  String get stageCouldNotJoin => 'تعذّر الانضمام إلى المسرح.';

  @override
  String get stageThisStageFallback => 'هذا المسرح';

  @override
  String get stageRequiresTicketToJoin => 'يتطلب تذكرة للانضمام';

  @override
  String get stagePleaseWaitLabel => 'يرجى الانتظار...';

  @override
  String get stageGetFreeTicketButton => 'احصل على تذكرة مجانية';

  @override
  String stageBuyTicketButton(String price) {
    return 'شراء تذكرة -- $price';
  }

  @override
  String get stageNotNowButton => 'ليس الآن';

  @override
  String get stageCouldNotStartTicketPurchase => 'تعذّر بدء شراء التذكرة.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'لا تزال الدفعة قيد الانتظار -- حاول الانضمام مرة أخرى بعد تأكيدها.';

  @override
  String get stageSpeakerBadge => 'متحدث';

  @override
  String get stageListenerBadge => 'مستمع';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'تعذّر الانضمام: $error';
  }

  @override
  String get stageSpeakersHeader => 'المتحدثون';

  @override
  String get stageRaisedHandsHeader => 'الأيادي المرفوعة';

  @override
  String get stageAllowButton => 'السماح';

  @override
  String get stageIgnoreButton => 'تجاهل';

  @override
  String get stageListenersHeader => 'المستمعون';

  @override
  String get stageRaiseHandTooltip => 'رفع اليد';

  @override
  String get stageLowerHandTooltip => 'خفض اليد';

  @override
  String get stageLeaveStageTooltip => 'مغادرة المسرح';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (أنت)';
  }

  @override
  String get stageMoveToListenersButton => 'النقل إلى المستمعين';

  @override
  String get stageYouFallbackName => 'أنت';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'الصورة الرمزية لـ $username';
  }

  @override
  String get channelEditDialogNewTitle => 'قناة جديدة';

  @override
  String get channelEditDialogEditTitle => 'تعديل القناة';

  @override
  String get channelEditDialogNameHint => 'اسم القناة';

  @override
  String get channelEditDialogTypeLabel => 'النوع';

  @override
  String get channelEditDialogTypeText => 'نصية';

  @override
  String get channelEditDialogTypeVoice => 'صوتية';

  @override
  String get channelEditDialogTypeGallery => 'معرض';

  @override
  String get channelEditDialogTypeStage => 'مسرح';

  @override
  String get channelEditDialogTypeRules => 'قواعد';

  @override
  String get channelEditDialogTypeRoleSelection => 'اختيار الأدوار';

  @override
  String get channelEditDialogTypeCalendar => 'تقويم';

  @override
  String get channelEditDialogAnnouncementTitle => 'قناة إعلانات';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'يمكن للأعضاء القادرين على إدارة الرسائل فقط النشر';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'انشر هنا إعلانات البث المباشر ورفع الفيديوهات';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'يُنشر تلقائيًا عندما يبدأ عضو لديه صلاحية \"الإعلان عند البث المباشر\" بثًا مباشرًا على Twitch، أو ينشر فيديو جديدًا على YouTube';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'إشعار هذه الأدوار عند النشر (اختياري)';

  @override
  String get channelEditDialogCategoryLabel => 'الفئة';

  @override
  String get channelEditDialogNoCategory => 'بدون فئة';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'الوصول حسب الأدوار (اتركه فارغًا للجميع)';

  @override
  String get channelEditDialogContentLabelsLabel => 'تصنيفات المحتوى';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'يضع علامة على هذه القناة لفلاتر محتوى الأعضاء؛ محظورة تمامًا للحسابات الخاضعة للإشراف الأبوي';

  @override
  String get categoryEditDialogNewTitle => 'فئة جديدة';

  @override
  String get categoryEditDialogEditTitle => 'تعديل الفئة';

  @override
  String get categoryEditDialogNameHint => 'اسم الفئة';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'الوصول حسب الأدوار (اتركه فارغًا للجميع)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'الأعضاء — $count متصل';
  }

  @override
  String get memberPanelRefreshTooltip => 'تحديث قائمة الأعضاء';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عضو',
      many: '$count عضوًا',
      few: '$count أعضاء',
      two: 'عضوان',
      one: 'عضو واحد',
      zero: 'لا أعضاء',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'غير متصل';

  @override
  String memberPanelTierSuffix(String tier) {
    return '، مستوى $tier';
  }

  @override
  String get memberPanelUnknownUser => 'غير معروف';

  @override
  String get memberPanelModerationActionsTooltip => 'إجراءات الإشراف';

  @override
  String get reportDialogReasonSpam => 'سبام';

  @override
  String get reportDialogReasonHarassment => 'تحرش أو إساءة';

  @override
  String get reportDialogReasonIllegal => 'محتوى غير قانوني';

  @override
  String get reportDialogReasonOther => 'أخرى';

  @override
  String get reportDialogReasonLabel => 'السبب';

  @override
  String get reportDialogNoteHint =>
      'أي شيء آخر ينبغي أن يعرفه المشرفون؟ (اختياري)';

  @override
  String get reportDialogDisclosureNote =>
      'سيتم مشاركة محتوى الرسالة المعروض لك ومن أرسلها مع مشرفي هذا الخادم.';

  @override
  String get reportDialogSubmitButton => 'إرسال البلاغ';

  @override
  String get reportDialogSubmitError => 'تعذّر إرسال البلاغ.';

  @override
  String get notificationBellTitle => 'الإشعارات';

  @override
  String get notificationBellMarkAllRead => 'تعليم الكل كمقروء';

  @override
  String get notificationBellEmptyState => 'لا توجد إشعارات بعد';

  @override
  String get notificationBellUnreadLabel => 'غير مقروء';

  @override
  String get invitePreviewTitle => 'دعوة الخادم';

  @override
  String get invitePreviewInvalidOrExpired =>
      'دعوة غير صالحة أو منتهية الصلاحية.';

  @override
  String get invitePreviewCouldNotJoin => 'تعذّر الانضمام إلى الخادم.';

  @override
  String get invitePreviewUnknownServer => 'خادم غير معروف';

  @override
  String get shippingAddressFullNameHint => 'الاسم الكامل';

  @override
  String get shippingAddressLine1Hint => 'سطر العنوان 1';

  @override
  String get shippingAddressLine2Hint => 'سطر العنوان 2 (اختياري)';

  @override
  String get shippingAddressCityHint => 'المدينة';

  @override
  String get shippingAddressStateHint => 'الولاية/المنطقة';

  @override
  String get shippingAddressZipHint => 'الرمز البريدي';

  @override
  String get shippingAddressCountryCodeHint => 'رمز الدولة (مثال: US)';

  @override
  String get shippingAddressPhoneHint => 'الهاتف (اختياري)';

  @override
  String get shippingAddressPrivacyNote =>
      'يُستخدم فقط لشحن هذا الطلب -- راجع سياسة خصوصية Printful الخاصة لمعرفة كيفية تعاملهم معه بعد تقديم الطلب.';

  @override
  String get updateNudgeAvailableTitle => 'يتوفر تحديث';

  @override
  String get updateNudgeRequiredTitle => 'يلزم تحديث';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'الإصدار $version من Koda متاح -- أنت تستخدم إصدارًا أقدم.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'لم يعد هذا الإصدار مدعومًا. حدّث إلى Koda $version لمواصلة استخدام Koda.';
  }

  @override
  String get updateNudgeLaterButton => 'لاحقًا';

  @override
  String get tierBadgeSparkSubscriber => 'مشترك Spark';

  @override
  String get tierBadgePulseSubscriber => 'مشترك Pulse';

  @override
  String get vispAvatarInDevelopment => 'قيد التطوير';

  @override
  String get vispBoostAdvisorCouldNotAnswer => 'تعذّر على Visp تجهيز إجابة.';

  @override
  String get vispBoostAdvisorTitle => 'اسأل Visp: مستشار عائد استثمار التعزيز';

  @override
  String get vispBoostAdvisorFollowUpHint => 'اطرح سؤالًا إضافيًا...';

  @override
  String get vispBoostAdvisorSendTooltip => 'إرسال';

  @override
  String get vispBoostAdvisorBasedOn => 'بناءً على:';

  @override
  String get vispEventDialogCouldNotGenerate => 'تعذّر على Visp إنشاء حدث.';

  @override
  String get vispEventDialogCouldNotCreate => 'تعذّر إنشاء هذا الحدث.';

  @override
  String get vispEventDialogRecurrenceNone => 'مرة واحدة';

  @override
  String get vispEventDialogRecurrenceDaily => 'يتكرر يوميًا';

  @override
  String get vispEventDialogRecurrenceWeekly => 'يتكرر أسبوعيًا';

  @override
  String get vispEventDialogRecurrenceMonthly => 'يتكرر شهريًا';

  @override
  String get vispEventDialogTitle => 'اطلب من Visp إنشاء حدث';

  @override
  String get vispEventDialogDescription =>
      'صف الحدث -- سيقترح Visp عنوانًا وتاريخًا/وقتًا وأي تفاصيل أخرى.';

  @override
  String get vispEventDialogPromptHint =>
      'مثال: \"جلسة D&D أسبوعية كل جمعة الساعة 7 مساءً لمدة 3 ساعات تقريبًا\"';

  @override
  String get vispEventDialogPrivacyNote =>
      'يُرسَل وصفك إلى Visp (مساعد مستضاف ذاتيًا -- لا شيء يغادر خوادم Koda) لإعداد هذه الخطة.';

  @override
  String get vispEventDialogStartOver => 'البدء من جديد';

  @override
  String get vispEventDialogCreateEvent => 'إنشاء حدث';

  @override
  String get vispEventDialogThinking => 'يفكر...';

  @override
  String get vispEventDialogGeneratePlan => 'إنشاء الخطة';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'تعذّر تحليل تاريخ -- حاول إعادة الصياغة';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'ينتهي $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price للتذكرة';
  }

  @override
  String get vispEventDialogBasedOn => 'بناءً على:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'السؤال $questionNumber من $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'أو اكتب إجابتك الخاصة...';

  @override
  String get vispQuestionStepSendTooltip => 'إرسال';

  @override
  String get vispQuestionStepSkip => 'تخطَّ وأنشئ الآن';

  @override
  String get vispSetupDialogCouldNotGeneratePlan => 'تعذّر على Visp إنشاء خطة.';

  @override
  String get vispSetupDialogCouldNotApplyPlan => 'تعذّر تطبيق تلك الخطة.';

  @override
  String get vispSetupDialogTitleNew => 'صف خادمك لـ Visp';

  @override
  String get vispSetupDialogTitleExisting =>
      'اطلب من Visp الإضافة إلى هذا الخادم';

  @override
  String get vispSetupDialogDescriptionNew =>
      'صف الخادم الذي تريده -- سيقترح Visp اسمًا ومجموعة من الأدوار والفئات والقنوات.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'صف ما تريد إضافته -- سيقترح Visp أدوارًا وفئات وقنوات لإنشائها.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'مثال: \"خادم مريح لمجموعة D&D الخاصة بي مع قنوات صوتية لطاولتين\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'مثال: \"أضف بضع قنوات إضافية لفرق الغارات لدينا\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      'يُرسَل وصفك إلى Visp (مساعد مستضاف ذاتيًا -- لا شيء يغادر خوادم Koda) لإعداد هذه الخطة.';

  @override
  String get vispSetupDialogStartOver => 'البدء من جديد';

  @override
  String get vispSetupDialogCreateServer => 'إنشاء خادم';

  @override
  String get vispSetupDialogAddToServer => 'الإضافة إلى الخادم';

  @override
  String get vispSetupDialogThinking => 'يفكر...';

  @override
  String get vispSetupDialogGeneratePlan => 'إنشاء الخطة';

  @override
  String get vispSetupDialogNewServerLabel => 'خادم جديد';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دور',
      many: '$count دورًا',
      few: '$count أدوار',
      two: 'دوران',
      one: 'دور واحد',
      zero: 'لا أدوار',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فئة',
      many: '$count فئة',
      few: '$count فئات',
      two: 'فئتان',
      one: 'فئة واحدة',
      zero: 'لا فئات',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count قناة',
      many: '$count قناة',
      few: '$count قنوات',
      two: 'قناتان',
      one: 'قناة واحدة',
      zero: 'لا قنوات',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'بناءً على:';

  @override
  String get childLockoutTitle => 'أنت الآن خارج ساعاتك المسموحة';

  @override
  String get childLockoutBody =>
      'قام أحد الوالدين أو الأوصياء بتحديد أوقات يمكن فيها استخدام Koda بهذا الحساب. اطلب منهم مزيدًا من الوقت، أو عد لاحقًا خلال نافذتك المسموحة التالية.';

  @override
  String get childLockoutLogOutButton => 'تسجيل الخروج';

  @override
  String get forcePasswordChangeError =>
      'تعذّر تحديث كلمة المرور. حاول مرة أخرى.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'مرحبًا، $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'يتطلب حسابك كلمة مرور جديدة قبل أن تتمكن من المتابعة.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'كلمة مرور جديدة';

  @override
  String get forcePasswordChangeConfirmPasswordHint =>
      'تأكيد كلمة المرور الجديدة';

  @override
  String get forcePasswordChangeReqLength => '12 حرفًا على الأقل';

  @override
  String get forcePasswordChangeReqUpper => 'حرف كبير واحد';

  @override
  String get forcePasswordChangeReqLower => 'حرف صغير واحد';

  @override
  String get forcePasswordChangeReqDigit => 'رقم واحد';

  @override
  String get forcePasswordChangeReqMatch => 'كلمتا المرور متطابقتان';

  @override
  String get forcePasswordChangeSubmitButton => 'تعيين كلمة مرور جديدة';

  @override
  String get forgotPasswordEnterEmailError => 'أدخل عنوان بريدك الإلكتروني.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'إذا كان هذا الحساب موجودًا، فقد تم إرسال رمز إعادة التعيين.';

  @override
  String get forgotPasswordEnterCodeError =>
      'أدخل الرمز وكلمة مرور مكوّنة من 8 أحرف على الأقل.';

  @override
  String get forgotPasswordInvalidCode => 'رمز غير صالح أو منتهي الصلاحية.';

  @override
  String get forgotPasswordTitle => 'إعادة تعيين كلمة المرور';

  @override
  String get forgotPasswordEmailHint => 'عنوان البريد الإلكتروني';

  @override
  String get forgotPasswordSendCodeButton => 'إرسال رمز إعادة التعيين';

  @override
  String get forgotPasswordCodeHint => 'رمز مكوّن من 6 أرقام';

  @override
  String get forgotPasswordNewPasswordHint => 'كلمة مرور جديدة';

  @override
  String get forgotPasswordSetNewPasswordButton => 'تعيين كلمة مرور جديدة';

  @override
  String get verifyEmailEnterCodeError =>
      'أدخل الرمز المكوّن من 6 أرقام من بريدك الإلكتروني.';

  @override
  String get verifyEmailInvalidCode => 'رمز غير صالح أو منتهي الصلاحية.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'تم إرسال رمز جديد إلى $email.';
  }

  @override
  String get verifyEmailResendFailed => 'تعذّر إعادة الإرسال الآن.';

  @override
  String get verifyEmailTitle => 'تحقق من بريدك الإلكتروني';

  @override
  String verifyEmailSentCode(String email) {
    return 'أرسلنا رمزًا مكوّنًا من 6 أرقام إلى $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'تأكيد البريد الإلكتروني';

  @override
  String get verifyEmailResendButton => 'إعادة إرسال الرمز';

  @override
  String get safetyNumberKeysNotSetUp => 'لم يتم إعداد مفاتيحك الخاصة بعد.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return 'لا تتوفر لدى $peerName حزمة مفاتيح بعد.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'تعذّر حساب رقم الأمان: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return 'لم يعد $peerName يملك هذا الجهاز.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'رقم الأمان مع $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'قارن هذا الرقم مع $peerName عبر قناة أخرى -- شخصيًا، أو عبر مكالمة هاتفية، أو أي مكان آخر غير هذه المحادثة. إذا تطابق على الجانبين، فأنت تتحدث فعلًا مع من تعتقد أنك تتحدث معه.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return 'لدى $peerName $count أجهزة، لكل منها رقم أمان خاص به -- التحقق من واحد لا يشمل الباقي.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'الجهاز $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'التعليم كمُتحقَّق منه';

  @override
  String get contentFiltersDescription =>
      'يمكن للخوادم وضع تصنيفات محتوى على القنوات. اختر كيف تريد أن تتصرف القنوات المصنّفة -- هذا تفضيلك الخاص ولا يؤثر أبدًا على ما يراه الآخرون.';

  @override
  String get contentFiltersLabelAdult => 'محتوى للبالغين';

  @override
  String get contentFiltersLabelSuggestive => 'محتوى مثير';

  @override
  String get contentFiltersLabelGraphic => 'وسائط صادمة';

  @override
  String get contentFiltersLabelNudity => 'عري غير جنسي';

  @override
  String get contentFiltersDescAdult => 'محتوى جنسي صريح';

  @override
  String get contentFiltersDescSuggestive => 'محتوى مثير جنسيًا لكن غير صريح';

  @override
  String get contentFiltersDescGraphic => 'عنف أو مشاهد دموية';

  @override
  String get contentFiltersDescNudity => 'عري في سياق غير جنسي';

  @override
  String get contentFiltersHide => 'إخفاء';

  @override
  String get contentFiltersWarn => 'تحذير';

  @override
  String get contentFiltersShow => 'إظهار';

  @override
  String get deviceTestCouldNotGetToken => 'تعذّر الحصول على رمز اختبار.';

  @override
  String get deviceTestLabelTest => 'اختبار';

  @override
  String get deviceTestLabelRecording => 'جارٍ التسجيل...';

  @override
  String get deviceTestLabelPlayingBack => 'جارٍ التشغيل...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'تعذّر تشغيل الكاميرا: $error';
  }

  @override
  String get deviceTestTitle => 'اختبار الأجهزة';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'تعذّر الاتصال: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'الميكروفون';

  @override
  String get deviceTestHearYourselfLabel => 'اسمع نفسك (متأخر)';

  @override
  String get deviceTestSpeakerOutputLabel => 'السماعة / الإخراج';

  @override
  String get deviceTestCameraLabel => 'الكاميرا';

  @override
  String get deviceTestSystemDefault => 'افتراضي النظام';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'تحدث، ثم استمع لتشغيل مقطع مدته $seconds ثانية';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '$seconds ث';
  }

  @override
  String get deviceTestCameraPreviewOff => 'معاينة الكاميرا متوقفة';

  @override
  String get deviceTestStopCameraButton => 'إيقاف اختبار الكاميرا';

  @override
  String get deviceTestTestCameraButton => 'اختبار الكاميرا';

  @override
  String get deviceTestInputLevelLabel => 'مستوى الإدخال';

  @override
  String get devicesScreenRemoveConfirmTitle => 'إزالة هذا الجهاز؟';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'سيحتاج إلى تسجيل الدخول مرة أخرى، وأي رسائل أُرسلت إليه أثناء إزالته لن تصله بعد ذلك -- جلسات Double Ratchet لا تملأ الفجوات بأثر رجعي.';

  @override
  String get devicesScreenRemoveFailed => 'تعذّرت إزالة ذلك الجهاز.';

  @override
  String get devicesScreenNeverActive => 'لم يُستخدم قط';

  @override
  String devicesScreenActiveDate(String date) {
    return 'نشط في $date';
  }

  @override
  String get devicesScreenDescription =>
      'لكل جهاز تسجّل الدخول منه هوية تشفير خاصة به -- تصل الرسالة المرسلة إليك إلى كل جهاز أدناه. أزل أي جهاز لا تستخدمه أو لا تتعرف عليه.';

  @override
  String get devicesScreenNoDevicesFound => 'لم يتم العثور على أجهزة.';

  @override
  String get devicesScreenUnknownDevice => 'جهاز غير معروف';

  @override
  String get devicesScreenThisDeviceBadge => 'هذا الجهاز';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'إزالة الجهاز';

  @override
  String get totpSetupInvalidCode => 'رمز غير صالح. حاول مرة أخرى.';

  @override
  String get totpSetupEnabledMessage => 'تم تفعيل المصادقة الثنائية.';

  @override
  String get totpSetupScanInstructions =>
      'امسح هذا الرمز السري ضوئيًا في تطبيق المصادقة الخاص بك (Google Authenticator، 1Password، Authy):';

  @override
  String get totpSetupCodeHint => 'أدخل الرمز المكوّن من 6 أرقام للتأكيد';

  @override
  String get totpSetupVerifyButton => 'التحقق والتفعيل';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'اضغط للتحدث';

  @override
  String get voiceVideoSettingsPressAnyKeyHint => 'اضغط أي مفتاح لربطه...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'اختبار الأجهزة';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'معالجة الصوت';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'كبت الضوضاء';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'يقلل الضوضاء الخلفية في ميكروفونك';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'كبت الضوضاء المتقدم (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'إزالة الضوضاء بالذكاء الاصطناعي في الوقت الفعلي، أقوى من الكبت القياسي -- يحل محله عند التفعيل';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'إلغاء الصدى';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'يمنع رجوع صوتك الخاص كصدى';

  @override
  String get voiceVideoSettingsAutoGainTitle => 'التحكم التلقائي بالكسب';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'يوازن مستوى صوت الميكروفون تلقائيًا (تسوية الصوت)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'الخفض التلقائي';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'يخفض صوت المشاركين الآخرين أثناء حديثك';

  @override
  String get voiceVideoSettingsHighPassTitle => 'مرشح تمرير عالٍ';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'يقطع الطنين منخفض التردد (المراوح، التكييف، طرقات المكتب)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle => 'كشف ضوضاء الكتابة';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'يكبت صوت طرق لوحة المفاتيح الذي يلتقطه ميكروفونك';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'عزل الصوت';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'يركّز على صوتك، مع تصفية الأشخاص والأصوات الأخرى القريبة';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'تعزيز الميكروفون';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'تفعيل التعزيز';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'كسب تمهيدي لميكروفون هادئ أو بعيد -- يُطبَّق قبل المعادل';

  @override
  String get voiceVideoSettingsBandBoost => 'تعزيز';

  @override
  String get voiceVideoSettingsSectionMicEq => 'معادل الميكروفون';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'تفعيل المعادل';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'يشكّل صوت ميكروفونك قبل وصوله إلى الآخرين';

  @override
  String get voiceVideoSettingsBandBass => 'المنخفضات';

  @override
  String get voiceVideoSettingsBandMid => 'المتوسطات';

  @override
  String get voiceVideoSettingsBandTreble => 'الحادة';

  @override
  String get voiceVideoSettingsSectionVad => 'كشف النشاط الصوتي (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'تفعيل VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'الإرسال فقط عندما تتحدث فعليًا';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'الحساسية';

  @override
  String get voiceVideoSettingsVadHint =>
      'أقل = يلتقط أصواتًا أهدأ. أعلى = يُشغّل الإرسال فقط الكلام الأعلى صوتًا.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'المفتاح المرتبط';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'غير محدد — يبقى الميكروفون نشطًا كلما كان غير مكتوم';

  @override
  String get voiceVideoSettingsClearButton => 'مسح';

  @override
  String get voiceVideoSettingsSetKeyButton => 'تعيين مفتاح';

  @override
  String get voiceVideoSettingsChangeButton => 'تغيير';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'عند ربط مفتاح، ينقل ميكروفونك الصوت فقط أثناء ضغطك على ذلك المفتاح باستمرار. يكون لهذا أولوية على VOX أثناء وجودك في قناة صوتية.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - نموذج الصورة الرمزية التفاعلي الافتراضي';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'ارفع صورتين تتبادلان عند حديثك. تظهر لك فقط.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'صامت';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'يتحدث';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'عتبة الحديث';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'أقل = يتحول إلى صورة الحديث بسهولة أكبر.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'إزالة VARM';

  @override
  String get gifPickerNoGifsFound => 'لم يتم العثور على صور GIF';

  @override
  String get gifPickerSearchHint => 'ابحث عن صور GIF...';

  @override
  String get messageSearchHint => 'ابحث في هذه القناة...';

  @override
  String get messageSearchTooltip => 'بحث';

  @override
  String get messageSearchInitialHint =>
      'يبحث في الرسائل المحمّلة بالفعل على هذا الجهاز -- يتم جلب السجل الأقدم (وفك تشفيره محليًا) كلما تصفحت إلى الوراء أكثر.';

  @override
  String get messageSearchNoMatches => 'لا نتائج';

  @override
  String get messageSearchStartOfHistory => 'بداية سجل القناة';

  @override
  String get messageSearchFurtherBackButton => 'البحث أبعد في السجل';

  @override
  String get messageSearchUnknownAuthor => 'غير معروف';
}
