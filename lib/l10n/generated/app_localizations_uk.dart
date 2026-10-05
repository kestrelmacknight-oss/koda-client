// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'Скасувати';

  @override
  String get commonSave => 'Зберегти';

  @override
  String get commonEdit => 'Редагувати';

  @override
  String get commonDelete => 'Видалити';

  @override
  String get commonCreate => 'Створити';

  @override
  String get commonClose => 'Закрити';

  @override
  String get commonDone => 'Готово';

  @override
  String get commonDownload => 'Завантажити';

  @override
  String get commonDisconnect => 'Відʼєднати';

  @override
  String get commonNone => 'Немає';

  @override
  String get commonJoin => 'Приєднатися';

  @override
  String get commonDismiss => 'Відхилити';

  @override
  String get commonSubmit => 'Надіслати';

  @override
  String get commonConfirm => 'Підтвердити';

  @override
  String get commonRemove => 'Прибрати';

  @override
  String get commonRetry => 'Повторити';

  @override
  String get commonOk => 'Гаразд';

  @override
  String get commonYes => 'Так';

  @override
  String get commonNo => 'Ні';

  @override
  String get commonSearch => 'Пошук';

  @override
  String get commonSettings => 'Налаштування';

  @override
  String get commonLoading => 'Завантаження...';

  @override
  String get settingsLanguageSection => 'Мова';

  @override
  String get settingsLanguageTitle => 'Мова додатка';

  @override
  String get settingsLanguageSystemDefault => 'Системна за замовчуванням';

  @override
  String get settingsLanguageDescription =>
      'Виберіть мову, якою відображається сам інтерфейс Koda. Це не залежить від основної мови будь-якого сервера чи мови, якою ви пишете повідомлення.';

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get settingsSignOut => 'Вийти';

  @override
  String get settingsSectionMyAccount => 'Мій обліковий запис';

  @override
  String get settingsSectionSecurity => 'Безпека';

  @override
  String get settingsSectionAccessibility => 'Доступність';

  @override
  String get settingsSectionBilling => 'Оплата';

  @override
  String get settingsSectionFamily => 'Сімʼя';

  @override
  String get settingsSectionVoiceVideo => 'Голос і відео';

  @override
  String get settingsSectionDesktop => 'Комп\'ютер';

  @override
  String get settingsSectionAbout => 'Про застосунок';

  @override
  String get settingsTwoFactorTitle => 'Двофакторна автентифікація';

  @override
  String get settingsTwoFactorSubtitle =>
      'Додайте застосунок-автентифікатор для додаткової безпеки';

  @override
  String get settingsLinkedDevicesTitle => 'Привʼязані пристрої';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'Перегляд і видалення пристроїв, увійшовши на яких можна отримати доступ до цього акаунта';

  @override
  String get settingsContentFiltersTitle => 'Фільтри вмісту';

  @override
  String get settingsContentFiltersSubtitle =>
      'Виберіть, як показувати позначений вміст';

  @override
  String get settingsDmFriendsOnlyTitle =>
      'Дозволити особисті повідомлення лише від друзів';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Ті, хто не є вашими друзями, не зможуть почати з вами нову розмову';

  @override
  String get settingsDmPrivacyError =>
      'Не вдалося оновити приватність особистих повідомлень.';

  @override
  String get settingsShowVispAvatarTitle => 'Показувати аватар Visp';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Показує обличчя та настрій Visp у діалогах налаштування, подій та порад';

  @override
  String get settingsHighContrastTitle => 'Високий контраст';

  @override
  String get settingsHighContrastSubtitle =>
      'Чисто чорно-білі, висококонтрастні кольори в усьому застосунку -- перемикання ненадовго перезавантажує поточний екран.';

  @override
  String get settingsDyslexiaFontTitle => 'Шрифт для людей з дислексією';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Змінює основний текст на OpenDyslexic в усьому застосунку';

  @override
  String get settingsFontSizeTitle => 'Розмір шрифту';

  @override
  String get settingsFontSizeSample => 'Жабку з’їв хвацький покруч їжака';

  @override
  String get settingsDensityTitle => 'Щільність';

  @override
  String get settingsDensityDescription =>
      'Впливає на відступи стандартних елементів керування -- кнопок, перемикачів, діалогів -- але не на всі власні макети.';

  @override
  String get settingsDensityCompact => 'Компактна';

  @override
  String get settingsDensityStandard => 'Стандартна';

  @override
  String get settingsDensityComfortable => 'Комфортна';

  @override
  String get settingsStreamingTitle => 'Облікові записи стрімінгу';

  @override
  String get settingsStreamingDescription =>
      'Підключіть Twitch/YouTube, щоб сервери, де у вас є право \"Оголошувати про ефір\", могли автоматично публікувати повідомлення, коли ви виходите в ефір або завантажуєте нове відео.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform підключено як $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform не підключено';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- зараз в ефірі';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- нове завантаження';

  @override
  String get settingsStreamingConnecting => 'Підключення...';

  @override
  String get settingsStreamingConnect => 'Підключити';

  @override
  String get settingsAnnounceLiveTwitch => 'Оголошувати, коли я в ефірі';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Оголошувати про прямі трансляції та нові завантаження';

  @override
  String get settingsRefreshStatus =>
      'Уже підключено в браузері? Оновити статус';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'Не вдалося розпочати підключення $platform.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Завершіть підключення у своєму браузері, потім поверніться й оновіть.';

  @override
  String get settingsThroneTitle => 'Вебхук Throne';

  @override
  String get settingsThroneDescription =>
      'Вставте цю URL-адресу в налаштування вебхука Throne.com, щоб отримувати сповіщення в Koda щоразу, коли хтось надсилає вам подарунок.';

  @override
  String get settingsThroneGetUrl => 'Отримати мою URL-адресу вебхука';

  @override
  String get settingsThroneCopyTooltip => 'Копіювати';

  @override
  String get settingsThroneCopiedToast => 'Скопійовано в буфер обміну';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Перегенерувати (стара URL-адреса стане недійсною)';

  @override
  String get settingsThroneRegenerateConfirmTitle =>
      'Перегенерувати URL-адресу вебхука?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'Ваша стара URL-адреса перестане працювати, тому потім оновіть її на Throne.com.';

  @override
  String get settingsThroneRegenerate => 'Перегенерувати';

  @override
  String get settingsUploadPhoto => 'Завантажити фото';

  @override
  String get settingsOrPasteUrl => 'або вставте URL-адресу нижче';

  @override
  String get settingsAvatarUrlHint => 'https://example.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'Для завантаження зображень потрібен Cloudflare R2 — вставлення URL-адреси працює завжди.';

  @override
  String get settingsDisplayNameLabel => 'ВІДОБРАЖУВАНЕ ІМʼЯ';

  @override
  String get settingsDisplayNameHint => 'Відображуване імʼя';

  @override
  String get settingsBioLabel => 'БІОГРАФІЯ';

  @override
  String get settingsBioHint => 'Розкажіть людям трохи про себе';

  @override
  String get settingsPronounsLabel => 'ЗАЙМЕННИКИ';

  @override
  String get settingsPronounsHint => 'напр. вона/її';

  @override
  String get settingsShowPronounsTitle => 'Показувати мої займенники іншим';

  @override
  String get settingsShowPronounsSubtitle =>
      'Показуються поруч із вашим імʼям у чаті, списках учасників і голосі';

  @override
  String get settingsStatusLabel => 'СТАТУС';

  @override
  String get settingsCustomStatusLabel => 'ВЛАСНИЙ СТАТУС';

  @override
  String get settingsCustomStatusHint => 'Про що ви думаєте?';

  @override
  String get statusOnline => 'Онлайн';

  @override
  String get statusAway => 'Відійшов';

  @override
  String get statusDnd => 'Не турбувати';

  @override
  String get statusInvisible => 'Невидимий';

  @override
  String get settingsFamilyNotAvailable =>
      'Батьківський контроль недоступний для підконтрольного акаунта.';

  @override
  String get settingsAboutTitle => 'Про Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Умови використання';

  @override
  String get settingsPrivacyTitle => 'Політика конфіденційності';

  @override
  String get settingsSupportTitle => 'Підтримка';

  @override
  String get settingsReportSecurityTitle => 'Повідомити про проблему безпеки';

  @override
  String get settingsDesktopNotAvailable =>
      'Це налаштування лише для комп\'ютера -- на цій платформі немає вікна чи системного трея.';

  @override
  String get settingsCloseToTrayTitle => 'Згортати в системний трей';

  @override
  String get settingsCloseToTraySubtitle =>
      'Закриття вікна залишає Koda працювати у фоновому режимі, щоб ви й далі отримували сповіщення -- вимкніть це, щоб закриття вікна справді завершувало роботу застосунку.';

  @override
  String get authErrorEmailPasswordRequired =>
      'Потрібні електронна пошта та пароль.';

  @override
  String get authErrorIncorrectCredentials =>
      'Неправильна електронна пошта або пароль.';

  @override
  String get authErrorMustAcceptTerms =>
      'Будь ласка, прийміть Умови використання.';

  @override
  String get authErrorAllFieldsRequired => 'Усі поля обовʼязкові.';

  @override
  String get authErrorPasswordsDontMatch => 'Паролі не збігаються.';

  @override
  String get authErrorPasswordTooShort =>
      'Пароль має містити щонайменше 8 символів.';

  @override
  String get authErrorRegistrationFailed =>
      'Реєстрація не вдалася. Можливо, цю електронну пошту вже використовують.';

  @override
  String get authTabSignIn => 'Увійти';

  @override
  String get authTabCreateAccount => 'Створити акаунт';

  @override
  String get authAgreementPrefix =>
      'Використовуючи Koda, ви погоджуєтеся з нашими ';

  @override
  String get authTermsLink => 'Умовами використання';

  @override
  String get authAgreementMiddle => ' і ';

  @override
  String get authPrivacyLink => 'Політикою конфіденційності';

  @override
  String get authAgreementSuffix => '.';

  @override
  String get authEmailHint => 'Електронна адреса';

  @override
  String get authPasswordHint => 'Пароль';

  @override
  String get authForgotPassword => 'Забули пароль?';

  @override
  String get authSignInButton => 'Увійти';

  @override
  String get authUsernameHint => 'Імʼя користувача';

  @override
  String get authConfirmPasswordHint => 'Підтвердіть пароль';

  @override
  String get authAccessCodeHint => 'Код доступу (якщо є)';

  @override
  String get authAgreeToTerms =>
      'Я погоджуюся з Умовами використання та Політикою конфіденційності';

  @override
  String get authCreateAccountButton => 'Створити акаунт';

  @override
  String get dmSafetyNumberChangedWarning =>
      'Номер безпеки цієї розмови змінився -- перевірте його перед надсиланням.';

  @override
  String get dmMessageNotSent => 'Повідомлення не надіслано.';

  @override
  String dmEncryptMessageError(String error) {
    return 'Не вдалося зашифрувати повідомлення: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'Не вдалося завантажити вкладення.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'Не вдалося зашифрувати вкладення: $error';
  }

  @override
  String get dmReportMessage => 'Поскаржитися на повідомлення';

  @override
  String get dmReportSubmitted => 'Скаргу надіслано.';

  @override
  String get dmTitle => 'Повідомлення';

  @override
  String get dmNewMessage => 'Нове повідомлення';

  @override
  String get dmNoConversationsYet => 'Поки що немає розмов';

  @override
  String get dmSelectConversation => 'Виберіть розмову';

  @override
  String get dmVerifySafetyNumberTooltip => 'Перевірити номер безпеки';

  @override
  String get dmSeenLabel => 'Переглянуто';

  @override
  String get dmMessageActionsTooltip => 'Дії з повідомленням';

  @override
  String get dmRemoveAttachmentTooltip => 'Прибрати вкладення';

  @override
  String get dmAttachFileTooltip => 'Долучити файл';

  @override
  String get dmMessageHint => 'Повідомлення...';

  @override
  String get dmSendMessageTooltip => 'Надіслати повідомлення';

  @override
  String get dmNoFriendsYet =>
      'Поки що немає друзів.\nНадішліть запит у друзі, щоб почати.';

  @override
  String get dmUnfriendTooltip => 'Видалити з друзів';

  @override
  String get dmNoPendingRequests => 'Немає запитів у друзі, що очікують.';

  @override
  String get dmIncomingRequestsLabel => 'ВХІДНІ';

  @override
  String get dmSentRequestsLabel => 'НАДІСЛАНІ';

  @override
  String get dmAcceptTooltip => 'Прийняти';

  @override
  String get dmDeclineTooltip => 'Відхилити';

  @override
  String get dmPendingLabel => 'Очікує';

  @override
  String get dmNewMessageDialogTitle => 'Нове повідомлення';

  @override
  String get dmEnterUsernameHint => 'Введіть імʼя користувача';

  @override
  String get dmOpenButton => 'Відкрити';

  @override
  String dmSavedAttachment(String fileName) {
    return 'Збережено $fileName';
  }

  @override
  String get dmUnknownUser => 'Невідомий';

  @override
  String get dmEndToEndEncryptedTooltip => 'Наскрізне шифрування';

  @override
  String get homeContentWarningTitle => 'Попередження про вміст';

  @override
  String homeContentWarningBody(String labels) {
    return 'Цей канал позначено як: $labels.\n\nЗмінити це можна в Налаштування > Безпека > Фільтри вмісту.';
  }

  @override
  String get homeViewAnyway => 'Переглянути попри все';

  @override
  String get homeCouldNotConnectVoice =>
      'Не вдалося підключитися до голосового каналу.';

  @override
  String get homeVoiceChannelFull => 'Цей голосовий канал заповнений.';

  @override
  String get homeCreateServer => 'Створити сервер';

  @override
  String get homeJoinServer => 'Приєднатися до сервера';

  @override
  String get homeRedeemCode => 'Активувати код';

  @override
  String get homeJoinServerDialogTitle => 'Приєднатися до сервера';

  @override
  String get homeEnterInviteCode => 'Введіть код запрошення або URL-адресу:';

  @override
  String get homeInviteCodeHint => 'напр. XK9MP2';

  @override
  String get homeJoined => 'Приєднано!';

  @override
  String get homeInvalidInvite => 'Недійсний або прострочений код запрошення.';

  @override
  String get homeJoinButton => 'Приєднатися';

  @override
  String get homeRedeemCodeDialogTitle => 'Активувати код';

  @override
  String get homeEnterBackerCode => 'Введіть свій код спонсора або винагороди:';

  @override
  String get homeRewardCodeHint => 'Код винагороди';

  @override
  String get homeCodeRedeemed => 'Код активовано! Ваші винагороди застосовано.';

  @override
  String get homeInvalidRedeemCode =>
      'Недійсний, прострочений або вже використаний код.';

  @override
  String get homeRedeemButton => 'Активувати';

  @override
  String get homeAreFriends => 'Ви друзі';

  @override
  String get homeAddFriend => 'Додати в друзі';

  @override
  String homeFriendRequestSent(String username) {
    return 'Запит у друзі надіслано $username!';
  }

  @override
  String get homeMessageButton => 'Повідомлення';

  @override
  String get homeSendTip => 'Надіслати чайові';

  @override
  String get homeSwitchToServer => 'Перейти на сервер';

  @override
  String get homeInvitePeople => 'Запросити людей';

  @override
  String get homeServerSettingsMenuItem => 'Налаштування сервера';

  @override
  String get homeLeaveServerMenuItem => 'Покинути сервер';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return 'Покинути $serverName? Ви зможете приєднатися знову за запрошенням.';
  }

  @override
  String get homeLeaveButton => 'Покинути';

  @override
  String get homeCreateAServer => 'Створити сервер';

  @override
  String get homeServerNameHint => 'Назва сервера';

  @override
  String get homeDescribeToVisp => 'Натомість опишіть це Visp';

  @override
  String get homeMarkAsRead => 'Позначити як прочитане';

  @override
  String get homeEditChannel => 'Редагувати канал';

  @override
  String get homeDeleteChannel => 'Видалити канал';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return 'Видалити #$channelName? Це неможливо скасувати.';
  }

  @override
  String get homeDeleteButton => 'Видалити';

  @override
  String get homeCreateChannelHere => 'Створити канал тут';

  @override
  String get homeEditCategory => 'Редагувати категорію';

  @override
  String get homeDeleteCategory => 'Видалити категорію';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return 'Видалити \"$categoryName\"? Канали всередині стануть без категорії.';
  }

  @override
  String get homeReplyAction => 'Відповісти';

  @override
  String get homeCreateThreadAction => 'Створити гілку';

  @override
  String get homeEditMessageAction => 'Редагувати повідомлення';

  @override
  String get homeDeleteMessageAction => 'Видалити повідомлення';

  @override
  String get homePinMessageAction => 'Закріпити повідомлення';

  @override
  String get homeUnpinMessageAction => 'Відкріпити повідомлення';

  @override
  String get homeReportMessageAction => 'Поскаржитися на повідомлення';

  @override
  String get homeReportSubmitted => 'Скаргу надіслано.';

  @override
  String get messageActionForward => 'Переслати';

  @override
  String messageForwardedFromLabel(String name) {
    return 'Переслано від $name';
  }

  @override
  String get forwardDestinationPickerTitle => 'Переслати повідомлення';

  @override
  String get forwardDestinationPickerChannelsTab => 'Канали';

  @override
  String get forwardDestinationPickerDmsTab => 'Прямі повідомлення';

  @override
  String get forwardDestinationPickerNoServers =>
      'Ви ще не перебуваєте на жодному сервері.';

  @override
  String get forwardDestinationPickerNoChannels =>
      'На цьому сервері немає текстових каналів.';

  @override
  String get forwardDestinationPickerNoConversations => 'Поки немає розмов.';

  @override
  String get forwardSuccessToast => 'Повідомлення переслано.';

  @override
  String get forwardFailedToast =>
      'Не вдалося переслати повідомлення -- спробуйте ще раз.';

  @override
  String get homeAddReactionTitle => 'Додати реакцію';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count гілки',
      many: '$count гілок',
      few: '$count гілки',
      one: '$count гілка',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'Параметри категорії';

  @override
  String get homeChannelOptionsTooltip => 'Параметри каналу';

  @override
  String get homeOpenVoiceChatTooltip => 'Відкрити чат';

  @override
  String get homeMarketplaceLabel => 'Маркетплейс';

  @override
  String get homeSelectChannelPrompt => 'Виберіть канал';

  @override
  String get homeSearchTooltip => 'Пошук';

  @override
  String get homePinnedMessagesTooltip => 'Закріплені повідомлення';

  @override
  String get homeWaitingForKey => 'Очікування ключа шифрування...';

  @override
  String get homeUnableToDecrypt => 'Не вдалося розшифрувати це повідомлення.';

  @override
  String get homeMessageActionsTooltip => 'Дії з повідомленням';

  @override
  String get homeCancelReplyTooltip => 'Скасувати відповідь';

  @override
  String get homeRemoveAttachmentTooltip => 'Прибрати вкладення';

  @override
  String get homeAttachFileTooltip => 'Долучити файл';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'Повідомлення в #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'Надіслати повідомлення';

  @override
  String get homeEditMessageTitle => 'Редагувати повідомлення';

  @override
  String get homeMessageLabel => 'Повідомлення';

  @override
  String get homePinnedMessagesTitle => 'Закріплені повідомлення';

  @override
  String get homeNoPinnedMessages => 'Немає закріплених повідомлень';

  @override
  String get homeUnpinTooltip => 'Відкріпити';

  @override
  String get homeCreateThreadTitle => 'Створити гілку';

  @override
  String get homeThreadNameHint => 'Назва гілки';

  @override
  String homeThreadCreated(String name) {
    return 'Гілку \"$name\" створено!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Створити або приєднатися';

  @override
  String get homeKodaMarketplaceTooltip => 'Маркетплейс Koda';

  @override
  String get homeAdminPanelTooltip => 'Панель адміністратора';

  @override
  String get homeServerSettingsTooltip => 'Налаштування сервера';

  @override
  String get homeSettingsTooltip => 'Налаштування';

  @override
  String get homeContentWarningBadge => 'Попередження про вміст';

  @override
  String get homeDirectMessagesTooltip => 'Особисті повідомлення';

  @override
  String homeReplyingTo(String username) {
    return 'Відповідь для $username';
  }

  @override
  String get homeAttachmentFallback => 'Вкладення';

  @override
  String get homeAttachmentUploadFailed => 'Не вдалося завантажити вкладення.';

  @override
  String homeSavedAttachment(String fileName) {
    return 'Збережено $fileName';
  }

  @override
  String serverConnectError(String service) {
    return 'Не вдалося розпочати підключення $service.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Відʼєднати Printful?';

  @override
  String get serverDisconnectPrintfulBody =>
      'Цей сервер більше не зможе виконувати замовлення мерчу, поки не буде підключено знову.';

  @override
  String get serverDisconnectTiltifyTitle => 'Відʼєднати Tiltify?';

  @override
  String get serverDisconnectTiltifyBody =>
      'Цей сервер перестане показувати прогрес благодійної кампанії, поки не буде підключено знову.';

  @override
  String get serverNewRoleTitle => 'Нова роль';

  @override
  String get serverEditRoleTitle => 'Редагувати роль';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Колір $hex';
  }

  @override
  String get permViewChannels => 'Перегляд каналів';

  @override
  String get permSendMessages => 'Надсилання повідомлень';

  @override
  String get permConnectVoice => 'Підключення до голосового каналу';

  @override
  String get permManageServer => 'Керування сервером';

  @override
  String get permManageChannels => 'Керування каналами';

  @override
  String get permManageRoles => 'Керування ролями';

  @override
  String get permManageMessages => 'Керування повідомленнями';

  @override
  String get permKickMembers => 'Виключення учасників';

  @override
  String get permBanMembers => 'Блокування учасників';

  @override
  String get permMuteMembers => 'Вимкнення звуку учасників';

  @override
  String get permMentionEveryone => 'Згадування @everyone';

  @override
  String get permManageMarketplace => 'Керування маркетплейсом';

  @override
  String get permAnnounceLive => 'Оголошення про ефір';

  @override
  String get permMoveMembers => 'Переміщення учасників (голос)';

  @override
  String get serverRoleNameHint => 'Назва ролі';

  @override
  String get serverColorLabel => 'Колір';

  @override
  String get serverPermissionsLabel => 'Права доступу';

  @override
  String get serverSelfAssignableTitle => 'Можна призначити собі';

  @override
  String get serverSelfAssignableSubtitle =>
      'Учасники можуть самостійно призначити собі цю роль';

  @override
  String get serverDefaultRoleUndeletable => 'Типову роль неможливо видалити.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'Видалити роль \"$roleName\"?';
  }

  @override
  String get serverCouldNotDeleteRole => 'Не вдалося видалити цю роль.';

  @override
  String get serverMemberFallback => 'Учасник';

  @override
  String get serverNoRolesYet => 'Поки що немає ролей.';

  @override
  String get serverRefreshStatus => 'Уже підключено в браузері? Оновити статус';

  @override
  String get serverPrintfulConnected => 'Printful підключено';

  @override
  String get serverPrintfulNotConnected => 'Printful не підключено';

  @override
  String get serverPrintfulDescription =>
      'Підключіть обліковий запис Printful цього сервера, щоб виконувати замовлення мерчу, зроблені через Koda. Кожен сервер підключає власний магазин.';

  @override
  String get serverConnecting => 'Підключення...';

  @override
  String get serverConnectPrintful => 'Підключити Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify підключено';

  @override
  String get serverTiltifyNotConnected => 'Tiltify не підключено';

  @override
  String get serverTiltifyDescription =>
      'Підключіть обліковий запис Tiltify цього сервера, щоб показувати прогрес благодійної кампанії в реальному часі всім учасникам. Лише читання -- Koda ніколи не публікує й не змінює нічого на боці Tiltify.';

  @override
  String get serverConnectTiltify => 'Підключити Tiltify';

  @override
  String get serverNoTiltifyCampaigns =>
      'На цьому обліковому записі Tiltify не знайдено кампаній.';

  @override
  String get serverPickCampaign => 'Виберіть, яку кампанію показувати';

  @override
  String get serverUntitledCampaign => 'Кампанія без назви';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '$currency $raised зібрано з $goal';
  }

  @override
  String get serverViewCampaign => 'Переглянути кампанію';

  @override
  String get serverRefreshButton => 'Оновити';

  @override
  String get serverUploadButton => 'Завантажити';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return 'Використано слотів: $used / $limit -- рівень бусту $level';
  }

  @override
  String get serverNoCustomEmoji => 'Поки що немає власних емодзі.';

  @override
  String get serverDeleteEmojiTooltip => 'Видалити емодзі';

  @override
  String get serverUploadEmojiTitle => 'Завантажити емодзі';

  @override
  String get serverEmojiNameHint => 'назва (літери, цифри, _)';

  @override
  String get serverChooseImage => 'Вибрати зображення';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Поточний рівень бусту: $level';
  }

  @override
  String get serverBackgroundTitle => 'Фон сервера';

  @override
  String get serverBackgroundDescription =>
      'Власний фон, що показується за переглядом каналів усім на цьому сервері.';

  @override
  String get serverBackgroundLockedHint =>
      'Досягніть 4 рівня бусту, щоб розблокувати власний фон.';

  @override
  String get serverIconBorderTitle => 'Рамка іконки сервера';

  @override
  String get serverIconBorderDescription =>
      'Акцентна рамка навколо іконки цього сервера в списку серверів кожного учасника.';

  @override
  String get serverIconBorderLockedHint =>
      'Досягніть 5 рівня бусту, щоб розблокувати власну рамку іконки.';

  @override
  String get serverBoostFromBank =>
      'Забустіть цей сервер із Банку сервера в Маркетплейсі, щоб підвищити його рівень.';

  @override
  String get serverMarketplaceListingLabel => 'ЛІСТИНГ У МАРКЕТПЛЕЙСІ';

  @override
  String get serverListInMarketplace => 'Додати до Маркетплейсу Koda';

  @override
  String get serverListInMarketplaceDescription =>
      'Додає магазин цього сервера до Koda Marketplace із шансом потрапити до щотижневої ротації рекомендованих товарів. Це стосується покупок, а не пошуку серверів для приєднання -- це не впливає на загальний пошук серверів.';

  @override
  String get serverSocialLinkLabel =>
      'Соціальне посилання / запрошення (необовʼязково)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Зберегти посилання';

  @override
  String get serverPricingLabel => 'ЦІНОУТВОРЕННЯ';

  @override
  String get serverPrimaryCurrencyLabel => 'Основна валюта';

  @override
  String get serverPrimaryCurrencyDescription =>
      'Застосовується до рівнів підписки на сервер і цін цифрових товарів, які ви встановлюєте для цього сервера.';

  @override
  String get serverPrimaryLanguageLabel => 'Основна мова';

  @override
  String get serverPrimaryLanguageDescription =>
      'Повідомлення, які учасники публікують іншою мовою, отримують невеликий значок мови, порівняно з цим налаштуванням.';

  @override
  String get serverMarketplaceLinkSaved =>
      'Посилання на маркетплейс збережено.';

  @override
  String get serverIconUpdated => 'Іконку сервера оновлено!';

  @override
  String get serverTemplateImported => 'Шаблон імпортовано!';

  @override
  String get serverImportFromDiscord => 'Імпортувати з Discord';

  @override
  String get serverVispPlanLive => 'План Visp готовий!';

  @override
  String get serverAskVisp => 'Запитати Visp';

  @override
  String get serverAddCategoryButton => 'Додати категорію';

  @override
  String get serverAddChannelHereTooltip => 'Додати канал тут';

  @override
  String get serverRename => 'Перейменувати';

  @override
  String get serverUncategorized => 'БЕЗ КАТЕГОРІЇ';

  @override
  String get serverAddChannel => 'Додати канал';

  @override
  String get serverEditRulesContent => 'Редагувати текст правил';

  @override
  String get serverRulesContentHint => 'Введіть тут правила свого сервера...';

  @override
  String get serverRulesUpdated => 'Правила оновлено!';

  @override
  String get serverAddRole => 'Додати роль';

  @override
  String get serverDefaultRoleLabel => 'Типова роль';

  @override
  String get serverManageRolesTooltip => 'Керувати ролями';

  @override
  String get serverMutedLabel => 'Заглушено';

  @override
  String get serverExpandedLabel => 'розгорнуто';

  @override
  String get serverCollapsedLabel => 'згорнуто';

  @override
  String get serverUnmute => 'Увімкнути звук';

  @override
  String get serverMute => 'Заглушити';

  @override
  String get serverKick => 'Виключити';

  @override
  String get serverBan => 'Заблокувати';

  @override
  String serverBannedUsersLabel(int count) {
    return 'ЗАБЛОКОВАНІ КОРИСТУВАЧІ — $count';
  }

  @override
  String get serverNoBannedUsers => 'Немає заблокованих користувачів.';

  @override
  String get serverUnban => 'Розблокувати';

  @override
  String get serverMemberFallbackGeneric => 'цього учасника';

  @override
  String serverBanConfirm(String username, String serverName) {
    return 'Заблокувати $username на $serverName? Ця особа не зможе повернутися, поки її не розблокують.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return 'Виключити $username із $serverName? Ця особа зможе повернутися за запрошенням.';
  }

  @override
  String get serverMuteDuration60Sec => '60 секунд';

  @override
  String get serverMuteDuration5Min => '5 хвилин';

  @override
  String get serverMuteDuration10Min => '10 хвилин';

  @override
  String get serverMuteDuration1Hour => '1 годину';

  @override
  String get serverMuteDuration1Day => '1 день';

  @override
  String get serverMuteDuration1Week => '1 тиждень';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'Не вдалося виконати дію \"$action\" щодо $username.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return 'Заглушити $username';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'Не вдалося заглушити $username.';
  }

  @override
  String get serverUnlockInvites => 'Розблокувати запрошення';

  @override
  String get serverInvitesUnlocked => 'Запрошення розблоковано.';

  @override
  String get serverAuditLogDescription =>
      'Модераційна активність рівня 1 -- виключення, блокування, заглушення й автоматичний захист від флуду/рейдів. Лише метадані; ніколи вміст повідомлень.';

  @override
  String get serverSystemActor => 'Система';

  @override
  String get serverActionKicked => 'виключено';

  @override
  String get serverActionBanned => 'заблоковано';

  @override
  String get serverActionUnbanned => 'розблоковано';

  @override
  String get serverActionMuted => 'заглушено';

  @override
  String get serverActionUnmuted => 'увімкнено звук';

  @override
  String get serverActionFloodDetected => 'автоматично заглушено за флуд';

  @override
  String get serverActionRaidLockdownEnabled =>
      'заблоковано запрошення (захист від рейду)';

  @override
  String get serverActionRaidLockdownDisabled => 'розблоковано запрошення';

  @override
  String get serverActionMoved => 'переміщено';

  @override
  String get serverUnknownAction => 'невідома дія';

  @override
  String get serverNoModerationActivity =>
      'Поки що немає модераційної активності.';

  @override
  String get serverReportsDescription =>
      'Повідомлення, на які поскаржилися учасники цього сервера -- вже розшифрована копія самого скаржника, розкрита через подання скарги.';

  @override
  String get serverNoPendingReports => 'Немає скарг, що очікують.';

  @override
  String get serverReportReasonOther => 'інше';

  @override
  String get serverReportStatusActioned => 'Опрацьовано';

  @override
  String get serverReportStatusDismissed => 'Відхилено';

  @override
  String get serverResolvedLabel => 'ВИРІШЕНО';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'Скаргу подав(-ла) $reporter -- надіслано $target';
  }

  @override
  String serverReportNote(String note) {
    return 'Примітка: $note';
  }

  @override
  String get serverDismissButton => 'Відхилити';

  @override
  String get serverMarkActioned => 'Позначити як опрацьовано';

  @override
  String get serverCreateInvite => 'Створити запрошення';

  @override
  String get serverInviteCreatedTitle => 'Запрошення створено';

  @override
  String get serverNoActiveInvites => 'Немає активних запрошень';

  @override
  String serverUsesLabel(String uses) {
    return 'Використань: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Видалити запрошення';

  @override
  String get serverChangeIconLabel => 'Змінити іконку сервера';

  @override
  String get serverFallbackName => 'Сервер';

  @override
  String serverSettingsTitle(String serverName) {
    return 'Налаштування $serverName';
  }

  @override
  String get serverTabChannels => 'Канали';

  @override
  String get serverTabRoles => 'Ролі';

  @override
  String get serverTabMembers => 'Учасники';

  @override
  String get serverTabInvites => 'Запрошення';

  @override
  String get serverTabMerch => 'Мерч';

  @override
  String get serverTabEmoji => 'Емодзі';

  @override
  String get serverTabCustomize => 'Налаштувати вигляд';

  @override
  String get serverTabAuditLog => 'Журнал аудиту';

  @override
  String get serverTabReports => 'Скарги';

  @override
  String get serverTabThresholdMod => 'Порогова модерація';

  @override
  String get serverTabCharity => 'Благодійність';

  @override
  String get homeCustomEmojiFallback => 'власне емодзі';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count реакції',
      many: '$count реакцій',
      few: '$count реакції',
      one: '$count реакція',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted =>
      ', ви відреагували, активуйте, щоб прибрати';

  @override
  String get homeReactionActivateToAdd => ', активуйте, щоб додати';

  @override
  String get homeAddReactionLabel => 'Додати реакцію';

  @override
  String homeViewProfile(String username) {
    return 'Переглянути профіль $username';
  }

  @override
  String get homeMoveToVoiceChannel => 'Перемістити до голосового каналу…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Виберіть голосовий канал';

  @override
  String get homeNoOtherVoiceChannels => 'Немає інших голосових каналів';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username тепер у каналі $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'Не вдалося перемістити $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'Вас перемістили до $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'Приєднайтеся до $channel, щоб говорити';
  }

  @override
  String get adminPanelTitle => 'Панель адміністратора';

  @override
  String get adminTabBackerCodes => 'Коди спонсорів';

  @override
  String get adminTabUsers => 'Користувачі';

  @override
  String get adminTabDmReports => 'Скарги на ОП';

  @override
  String get adminTabSpamFlags => 'Позначки спаму';

  @override
  String get adminTabWiki => 'Вікі';

  @override
  String get adminTabBoosts => 'Бусти';

  @override
  String get adminCreateBackerCodeTitle => 'Створити код спонсора';

  @override
  String get adminCodeHint => 'Код (залиште порожнім для автогенерації)';

  @override
  String get adminNoteHint => 'Примітка (напр. \"Kickstarter Tier 2\")';

  @override
  String get adminFlagsJsonHint =>
      'Прапорці у форматі JSON, напр. \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint =>
      'Макс. кількість використань (залиште порожнім = без обмежень)';

  @override
  String get adminCodeCreatedTitle => 'Код створено';

  @override
  String get adminCodeLabel => 'Код:';

  @override
  String get adminCopyCodeTooltip => 'Копіювати код';

  @override
  String adminFlagsValue(String flags) {
    return 'Прапорці: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Коди спонсорів і винагород';

  @override
  String get adminNewCodeButton => 'Новий код';

  @override
  String get adminNoCodesYet => 'Кодів поки немає';

  @override
  String get adminRewardsHeader => 'Нагороди';

  @override
  String get adminRewardAlphaBetaAccess =>
      'Доступ до альфи/бети + значок Alpha Spark';

  @override
  String get adminRewardLifetimePulse =>
      'Довічний статус Pulse + значок Founder + збільшений бітрейт';

  @override
  String get adminRewardMonthlyBoostTokenOne =>
      'Щомісячний токен посилення серверу (покращене аудіо/відео)';

  @override
  String get adminRewardAnimatedFrameBundle =>
      'Анімована рамка профілю + Зал засновників + 2 щомісячні токени серверу';

  @override
  String get adminRewardTitanGlow =>
      'Постійне сяйво імені користувача \"Titan\"';

  @override
  String get adminRewardAnimatedFrame => 'Анімована рамка';

  @override
  String get adminRewardFoundersHall => 'Зал засновників';

  @override
  String adminRewardMonthlyBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count токена посилення/місяць',
      many: '$count токенів посилення/місяць',
      few: '$count токени посилення/місяць',
      one: '1 токен посилення/місяць',
    );
    return '$_temp0';
  }

  @override
  String get adminRewardsNone => 'Без нагород';

  @override
  String get adminRegistrationOpenLabel => 'Реєстрація відкрита для всіх';

  @override
  String get adminRegistrationInviteOnlyLabel =>
      'Реєстрація лише за запрошенням (потрібен код бекера)';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses використань';
  }

  @override
  String get adminSearchUsersHint => 'Пошук користувачів за іменем...';

  @override
  String get adminSearchUsersPrompt => 'Знайдіть користувача вище';

  @override
  String get adminNoDmReports => 'Немає скарг на особисті повідомлення.';

  @override
  String get adminResolvedLabel => 'ВИРІШЕНО';

  @override
  String get adminReasonOther => 'інше';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Заявник: $reporterId\nВикритий відправник: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Примітка: $note';
  }

  @override
  String get adminDismissButton => 'Відхилити';

  @override
  String get adminMarkActionedButton => 'Позначити оброблено';

  @override
  String get adminStatusActioned => 'Оброблено';

  @override
  String get adminStatusDismissed => 'Відхилено';

  @override
  String get adminNoSpamFlags => 'Немає позначок спаму.';

  @override
  String get adminFlagMassDmSpam => 'Масовий спам в ОП';

  @override
  String get adminFlagRaidLockdown => 'Блокування рейду';

  @override
  String get adminFlagBotBehavior => 'Поведінка, схожа на бота';

  @override
  String get adminFlagChannelFlooding => 'Флуд у каналі';

  @override
  String get adminAutoEscalatedBadge => 'АВТОЕСКАЛАЦІЯ';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Впевненість: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'Користувач: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Сервер: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount з $totalJoiners нових учасників усе ще заглушені';
  }

  @override
  String get adminNoJoinersMuted => 'Наразі немає заглушених нових учасників';

  @override
  String adminRestrictedUntil(String until) {
    return 'Наразі обмежено до $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'Наразі не обмежено';

  @override
  String get adminDismissUndoButton => 'Відхилити та скасувати';

  @override
  String get adminConfirmRestrictButton => 'Підтвердити й обмежити';

  @override
  String get adminDeleteArticleTitle => 'Видалити статтю?';

  @override
  String adminDeleteArticleBody(String title) {
    return '\"$title\" буде видалено з бази знань Visp.';
  }

  @override
  String get adminNewArticleTitle => 'Нова стаття';

  @override
  String get adminEditArticleTitle => 'Редагувати статтю';

  @override
  String get adminArticleTitleHint => 'Заголовок';

  @override
  String get adminArticleContentHint => 'Вміст статті (markdown)';

  @override
  String get adminWikiArticlesHeader => 'Статті вікі';

  @override
  String get adminNoArticlesYet => 'Статей поки немає';

  @override
  String get adminEditArticleTooltip => 'Редагувати статтю';

  @override
  String get adminDeleteArticleTooltip => 'Видалити статтю';

  @override
  String get adminSearchServersHint => 'Пошук серверів за назвою...';

  @override
  String get adminSearchServersPrompt => 'Знайдіть сервер вище';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'Надати бусти серверу $serverName';
  }

  @override
  String get adminNumBoostsHint => 'Кількість бустів';

  @override
  String get adminGrantButton => 'Надати';

  @override
  String get adminPositiveNumberError => 'Введіть додатне ціле число.';

  @override
  String get adminGrantBoostsFailed => 'Не вдалося надати бусти.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Надано $count буста серверу $serverName -- тепер рівень $level ($activeCount активних).',
      many:
          'Надано $count бустів серверу $serverName -- тепер рівень $level ($activeCount активних).',
      few:
          'Надано $count бусти серверу $serverName -- тепер рівень $level ($activeCount активних).',
      one:
          'Надано $count буст серверу $serverName -- тепер рівень $level ($activeCount активних).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count учасників';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Надати бусти';

  @override
  String get parentalDashboardTitle => 'Родина';

  @override
  String get parentalDashboardCreateChildTitle =>
      'Створити дитячий обліковий запис';

  @override
  String get parentalDashboardUsernameHint => 'Ім\'я користувача';

  @override
  String get parentalDashboardEmailHint => 'Електронна пошта';

  @override
  String get parentalDashboardPasswordHint => 'Пароль';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'Це створює повністю контрольований обліковий запис: позначені канали блокуються, а ви зможете встановлювати дозволені години й бачити (але не читати) друзів і сервери дитини.';

  @override
  String get parentalDashboardValidationError =>
      'Потрібні ім\'я користувача, електронна пошта та пароль щонайменше з 8 символів.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'Не вдалося створити дитячий обліковий запис -- ім\'я користувача чи пошта можуть бути вже зайняті.';

  @override
  String get parentalDashboardCreatingLabel => 'Створення...';

  @override
  String get parentalDashboardNoChildren =>
      'Поки немає пов\'язаних облікових записів.';

  @override
  String get parentalDashboardSupervisedLabel =>
      'Контрольований обліковий запис';

  @override
  String get parentalDashboardUnknownUser => 'Невідомо';

  @override
  String get childDetailFallbackTitle => 'Дитячий обліковий запис';

  @override
  String get childDetailTabFriends => 'Друзі';

  @override
  String get childDetailTabServers => 'Сервери';

  @override
  String get childDetailTabSchedule => 'Розклад';

  @override
  String get childDetailTabOverride => 'Виняток';

  @override
  String get childDetailNoFriends => 'Немає друзів.';

  @override
  String get childDetailUnknownUser => 'Невідомо';

  @override
  String get childDetailRemoveFriendTooltip => 'Видалити друга';

  @override
  String get childDetailNoServers => 'Не перебуває на жодному сервері.';

  @override
  String childDetailMemberCount(int count) {
    return '$count учасників';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Видалити із сервера';

  @override
  String get childDetailRestrictAccessTitle =>
      'Обмежити доступ за встановленими годинами';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Вимкнено означає необмежений доступ у будь-який час';

  @override
  String get childDetailTimezoneLabel => 'Часовий пояс';

  @override
  String get childDetailMonday => 'Понеділок';

  @override
  String get childDetailTuesday => 'Вівторок';

  @override
  String get childDetailWednesday => 'Середа';

  @override
  String get childDetailThursday => 'Четвер';

  @override
  String get childDetailFriday => 'П\'ятниця';

  @override
  String get childDetailSaturday => 'Субота';

  @override
  String get childDetailSunday => 'Неділя';

  @override
  String get childDetailNoAccessLabel => 'Немає доступу';

  @override
  String get childDetailToLabel => 'до';

  @override
  String get childDetailSavingLabel => 'Збереження...';

  @override
  String get childDetailSaveScheduleButton => 'Зберегти розклад';

  @override
  String get childDetailScheduleSaved => 'Розклад збережено.';

  @override
  String get childDetailOverrideExplanation =>
      'Надайте тимчасовий доступ поза звичайним розкладом -- корисно для одноразового винятку без зміни щотижневого розкладу.';

  @override
  String get childDetailReasonHint => 'Причина (необов\'язково)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes хв';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours год';
  }

  @override
  String get childDetailRevokeOverrideButton => 'Скасувати активний виняток';

  @override
  String get childDetailAccessGranted => 'Тимчасовий доступ надано.';

  @override
  String get childDetailOverrideRevoked => 'Виняток скасовано.';

  @override
  String get digitalGoodsTitle => 'Цифрові товари';

  @override
  String get digitalGoodsMyProductsTitle => 'Мої товари';

  @override
  String get digitalGoodsManageProductsTooltip =>
      'Керувати товарами цього сервера';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Перейти до перегляду';

  @override
  String get digitalGoodsCreateProductTooltip => 'Створити товар';

  @override
  String get digitalGoodsBrowseTab => 'Перегляд';

  @override
  String get digitalGoodsMyListingsTab => 'Мої оголошення';

  @override
  String get digitalGoodsMyPurchasesTab => 'Мої покупки';

  @override
  String get digitalGoodsNoProductsYet => 'Поки немає товарів';

  @override
  String get digitalGoodsNoProductsAvailable => 'Немає доступних товарів';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Створіть свій перший товар, щоб почати продавати';

  @override
  String get digitalGoodsCheckBackLater =>
      'Зазирніть пізніше за цифровими товарами';

  @override
  String get digitalGoodsCreateProductButton => 'Створити товар';

  @override
  String get digitalGoodsLicenseKeyBadge => 'Ліцензійний ключ';

  @override
  String get digitalGoodsFileBadge => 'Файл';

  @override
  String get digitalGoodsAllServersBadge => 'Усі сервери';

  @override
  String get digitalGoodsFreeForYou => 'Безкоштовно для вас';

  @override
  String get digitalGoodsFreeLabel => 'Безкоштовно';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count продано';
  }

  @override
  String get digitalGoodsKeysButton => 'Ключі';

  @override
  String get digitalGoodsGetForFree => 'Отримати безкоштовно';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'Купити за $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'Поки немає покупок';

  @override
  String get digitalGoodsUnknownProduct => 'Невідомий товар';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'Придбано $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Копіювати ключ';

  @override
  String get digitalGoodsLicenseKeyCopied => 'Ліцензійний ключ скопійовано!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'Закінчується $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'Ваш ліцензійний ключ';

  @override
  String get digitalGoodsCopyKeyButton => 'Копіювати ключ';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'Не вдалося почати оформлення замовлення -- можливо, цей автор ще не підключив Stripe.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'Покупку завершено! Знайдіть її в розділі Мої покупки.';

  @override
  String get digitalGoodsPurchasePending =>
      'Досі очікуємо на платіж -- він з\'явиться в Моїх покупках після завершення.';

  @override
  String get digitalGoodsCreateProductTitle => 'Створити товар';

  @override
  String get digitalGoodsEditProductTitle => 'Редагувати товар';

  @override
  String get digitalGoodsProductTitleHint => 'Назва товару';

  @override
  String get digitalGoodsDescriptionHint => 'Опис (необов\'язково)';

  @override
  String get digitalGoodsPriceHint =>
      'Ціна в USD (залиште порожнім для безкоштовного)';

  @override
  String get digitalGoodsProductTypeLabel => 'Тип товару';

  @override
  String get digitalGoodsFileDownloadOption => 'Завантаження файлу';

  @override
  String get digitalGoodsLicenseKeyOption => 'Ліцензійний ключ';

  @override
  String get digitalGoodsAvailabilityLabel => 'Доступність';

  @override
  String get digitalGoodsThisServerOnlyOption => 'Лише цей сервер';

  @override
  String get digitalGoodsAllKodaServersOption => 'Усі сервери Koda';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'Після створення скористайтеся кнопкою \"Ключі\", щоб завантажити свої ліцензійні ключі.';

  @override
  String get digitalGoodsProductFileLabel => 'Файл товару';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName ($sizeMbМБ)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Видалити файл';

  @override
  String get digitalGoodsUploadingLabel => 'Завантаження...';

  @override
  String get digitalGoodsChooseFileButton => 'Вибрати файл';

  @override
  String get digitalGoodsReplaceFileButton => 'Замінити файл';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Виберіть файл для цього товару перед збереженням.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle =>
      'Завантажити ліцензійні ключі';

  @override
  String get digitalGoodsPasteKeysHint => 'Вставте по одному ключу на рядок:';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Завантажити ключі';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'Ліцензійні ключі завантажено!';

  @override
  String get serverSubscriptionManageTitle => 'Керування підписками';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return 'Підписки сервера $serverName';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Додати рівень';

  @override
  String get serverSubscriptionNoTiersYet => 'Поки немає рівнів підписки';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Створіть до 3 рівнів для своєї спільноти';

  @override
  String get serverSubscriptionCreateFirstTierButton =>
      'Створити перший рівень';

  @override
  String get serverSubscriptionShowSubscriberCounts =>
      'Показувати кількість підписників';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/міс';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count активного підписника',
      many: '$count активних підписників',
      few: '$count активні підписники',
      one: '$count активний підписник',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned =>
      'Роль призначається автоматично';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return 'Знижка на маркетплейсі $discount%';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'У цього сервера немає рівнів підписки';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Активний підписник';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'Закінчується $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk =>
      'Ексклюзивна роль підписника';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return 'Знижка $discount% на покупки в маркетплейсі';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Канали лише для підписників';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Наразі підписані';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'Підписатися за $price/міс';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Створити рівень';

  @override
  String get serverSubscriptionEditTierTitle => 'Редагувати рівень';

  @override
  String get serverSubscriptionTierNameHint =>
      'Назва рівня (напр. Фанат, Прихильник, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Опис (необов\'язково)';

  @override
  String get serverSubscriptionPriceHint => 'Ціна на місяць (USD)';

  @override
  String get serverSubscriptionDiscountLabel => '% знижки на маркетплейсі';

  @override
  String get serverSubscriptionPositionLabel => 'Позиція';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Рівень $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Надає роль при підписці — необов\'язково';

  @override
  String get serverSubscriptionRoleFallback => 'роль';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Автоматично надається учаснику в момент підписки й забирається в момент закінчення підписки.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Рівень створено -- підключіть Stripe у розділі Маркетплейс → Автор, перш ніж учасники зможуть на нього підписатися.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Видалити рівень';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return 'Видалити \"$tierName\"? Наявні підписники збережуть доступ до завершення терміну.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'Підписатися на $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel => 'Щомісячна підписка';

  @override
  String get serverSubscriptionServerBankEarnsLabel => 'Банк сервера отримує';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points балів';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Платіж безпечно обробляється Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'Підписатися';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'Не вдалося почати оформлення замовлення -- можливо, власник цього сервера ще не підключив Stripe.';

  @override
  String get serverSubscriptionSubscribed => 'Підписано!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'Досі очікуємо на платіж -- підписка активується після завершення.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'Дати чайові $username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Виберіть суму';

  @override
  String get tipDialogMessageHint => 'Додати повідомлення (необов\'язково)';

  @override
  String get tipDialogYouPayLabel => 'Ви платите';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username отримує';
  }

  @override
  String get tipDialogSendTipButton => 'Надіслати чайові';

  @override
  String get tipDialogFailedToSendTip =>
      'Не вдалося надіслати чайові. Можливо, автор ще не підключений до Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'Не вдалося почати оформлення замовлення. Спробуйте ще раз за хвилину.';

  @override
  String get tipDialogTipSent => 'Чайові надіслано!';

  @override
  String get tipDialogTipPending =>
      'Досі очікуємо на платіж -- він пройде після завершення.';

  @override
  String get tipDialogUnknownUser => 'Невідомо';

  @override
  String get marketplaceTitle => 'Маркетплейс';

  @override
  String get marketplaceCreatorPayoutsTitle => 'Виплати авторам';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Отримуйте чайові напряму через Stripe';

  @override
  String get marketplaceTabServerBank => 'Банк сервера';

  @override
  String get marketplaceTabDigitalGoods => 'Цифрові товари';

  @override
  String get marketplaceTabMerch => 'Мерч';

  @override
  String get marketplaceTabSubscription => 'Підписка';

  @override
  String get marketplaceTabRevenue => 'Прибуток';

  @override
  String get marketplaceSelectServerSubscription =>
      'Виберіть сервер, щоб переглянути його підписку';

  @override
  String get marketplaceSelectServerBank =>
      'Виберіть сервер, щоб переглянути його банк';

  @override
  String get marketplaceSelectServerRevenue =>
      'Виберіть сервер, щоб переглянути його прибуток';

  @override
  String get marketplaceStripeAccountStatus => 'Обліковий запис Stripe';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Реєстрацію завершено';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'Приймає платежі';

  @override
  String get marketplaceConnectStripeButton =>
      'Підключити обліковий запис Stripe';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Завершити реєстрацію Stripe';

  @override
  String get marketplaceRefreshStatusButton => 'Оновити статус';

  @override
  String get marketplaceReadyToReceiveTips => 'Ви готові отримувати чайові!';

  @override
  String get marketplaceHowItWorksTitle => 'Як це працює';

  @override
  String get marketplaceHowItWorksStep1 =>
      'Підключіть свій обліковий запис Stripe';

  @override
  String get marketplaceHowItWorksStep2 => 'Пройдіть перевірку особи';

  @override
  String get marketplaceHowItWorksStep3 =>
      'Отримуйте чайові напряму на свій банк';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda стягує комісію за обробку 5%. Комісія надходить до банку вашого сервера у вигляді балів.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Лише власник сервера або особа з дозволом \"Керування маркетплейсом\" може переглядати банк сервера.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName забустили!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit слотів для власних емодзі';
  }

  @override
  String get marketplaceServerFallback => 'Сервер';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance балів';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount активності';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'Бали нараховуються з 5% комісії за обробку чайових і підписок на цьому сервері. Використовуйте бали, щоб розблокувати покращення сервера.';

  @override
  String get marketplaceServerBoostsTitle => 'Бусти сервера';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Рівень $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count активного буста',
      many: '$count активних бустів',
      few: '$count активні бусти',
      one: '$count активний буст',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: 'Ще $more буста до рівня $level',
      many: 'Ще $more бустів до рівня $level',
      few: 'Ще $more бусти до рівня $level',
      one: 'Ще $more буст до рівня $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' і розблокувати власний фон сервера';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' і розблокувати власну рамку іконки сервера';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'У вас є $count токена буста.',
      many: 'У вас є $count токенів буста.',
      few: 'У вас є $count токени буста.',
      one: 'У вас є $count токен буста.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'Токени бустів надходять із підписки Pulse (1/місяць). Підпишіться на вкладці Підписки, щоб отримати один.';

  @override
  String get marketplaceBoostingLabel => 'Бустимо...';

  @override
  String get marketplaceBoostThisServerButton => 'Забустити цей сервер';

  @override
  String get marketplaceComingSoonUpgradesTitle => 'Скоро — Покращення сервера';

  @override
  String get marketplaceSpendPointsList =>
      'Витрачайте бали банку сервера на:\n• Власний домен сервера\n• Збільшений ліміт учасників\n• Пріоритетну підтримку\n• Ексклюзивний значок сервера';

  @override
  String get marketplaceSourceTip => 'Чайові';

  @override
  String get marketplaceSourceSubscription => 'Підписки Koda';

  @override
  String get marketplaceSourceServerSubscription => 'Підписки сервера';

  @override
  String get marketplaceSourceDigitalProduct => 'Цифрові товари';

  @override
  String get marketplaceSourceStageTicket => 'Квитки на сцену';

  @override
  String get marketplaceSourcePrintfulOrder => 'Замовлення мерчу';

  @override
  String get marketplaceJustNow => 'щойно';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return '$minutes хв тому';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return '$hours год тому';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return '$days дн тому';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Лише учасники, які можуть керувати маркетплейсом, можуть переглядати прибуток цього сервера.';

  @override
  String get marketplaceBalanceLabel => 'Баланс';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Всього зароблено';

  @override
  String get marketplaceLast30DaysTitle => 'Останні 30 днів';

  @override
  String get marketplaceRevenueBySourceTitle => 'Прибуток за джерелом';

  @override
  String get marketplaceNoRevenueYet => 'Поки немає прибутку.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count транзакції',
      many: '$count транзакцій',
      few: '$count транзакції',
      one: '$count транзакція',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'Останні транзакції';

  @override
  String get marketplaceNoTransactionsYet => 'Поки немає транзакцій.';

  @override
  String get marketplaceNoActivityYet => 'Поки немає активності';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Синхронізовано $count товару з Printful',
      many: 'Синхронізовано $count товарів з Printful',
      few: 'Синхронізовано $count товари з Printful',
      one: 'Синхронізовано $count товар із Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Не вдалося синхронізуватися з Printful -- перевірте з\'єднання в налаштуваннях Мерчу.';

  @override
  String get printfulMerchSelectServer =>
      'Виберіть сервер, щоб переглянути його мерч';

  @override
  String get printfulMerchManageCatalogTitle => 'Керування каталогом мерчу';

  @override
  String get printfulMerchTitle => 'Мерч';

  @override
  String get printfulMerchSyncingLabel => 'Синхронізація...';

  @override
  String get printfulMerchSyncCatalogButton => 'Синхронізувати каталог';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'Перейти до перегляду';

  @override
  String get printfulMerchManageTooltip => 'Керувати мерчем цього сервера';

  @override
  String get printfulMerchNothingSyncedYet => 'Поки нічого не синхронізовано';

  @override
  String get printfulMerchNoMerchAvailable => 'Поки немає доступного мерчу';

  @override
  String get printfulMerchSyncHint =>
      'Синхронізуйте свій магазин Printful, щоб імпортувати каталог товарів';

  @override
  String get printfulMerchCheckBackLater =>
      'Зазирніть пізніше за мерчем цього сервера';

  @override
  String get printfulMerchOutOfStock => 'Немає в наявності';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Від $price • $count варіанта',
      many: 'Від $price • $count варіантів',
      few: 'Від $price • $count варіанти',
      one: 'Від $price • $count варіант',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'Переглянути';

  @override
  String printfulMerchPayoutTo(String username) {
    return 'Виплата: $username';
  }

  @override
  String get printfulMerchPayoutToYou => 'Виплата: вам';

  @override
  String get printfulMerchPayoutChangeButton => 'Змінити';

  @override
  String get printfulMerchPayoutDialogTitle => 'Отримувач виплати';

  @override
  String get printfulMerchPayoutDialogBody =>
      'Спрямуйте частку доходу від цього товару іншому користувачу замість себе -- йому потрібно буде підключити власний обліковий запис Stripe і завершити реєстрацію, перш ніж хтось зможе його купити.';

  @override
  String get printfulMerchPayoutUsernameHint => 'Ім\'я користувача';

  @override
  String get printfulMerchPayoutLookupButton => 'Знайти';

  @override
  String get printfulMerchPayoutUserNotFound =>
      'Користувача з таким іменем не знайдено.';

  @override
  String printfulMerchPayoutResolvedAs(String username) {
    return 'Знайдено: $username';
  }

  @override
  String get printfulMerchPayoutResetButton => 'Скинути на себе';

  @override
  String get printfulMerchCartTooltip => 'Кошик';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productName додано до кошика';
  }

  @override
  String get printfulMerchQuantityLabel => 'Кількість';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Зменшити кількість';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Збільшити кількість';

  @override
  String get printfulMerchAddToCartButton => 'Додати до кошика';

  @override
  String get printfulMerchOptionLabel => 'Варіант';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Стиль';

  @override
  String get printfulMerchSizeLabel => 'Розмір';

  @override
  String get printfulMerchYourCartTitle => 'Ваш кошик';

  @override
  String get printfulMerchCartEmpty => 'Ваш кошик порожній.';

  @override
  String get printfulMerchSubtotalLabel => 'Проміжна сума';

  @override
  String get printfulMerchCheckoutLabel => 'Оформити замовлення';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'Видалити з кошика';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Спершу заповніть адресу доставки.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'Не вдалося отримати тарифи доставки для цієї адреси.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'Не вдалося почати оформлення замовлення. Спробуйте ще раз за хвилину.';

  @override
  String get printfulMerchOrderPlaced => 'Замовлення оформлено!';

  @override
  String get printfulMerchOrderPending =>
      'Досі очікуємо на платіж -- замовлення оформиться після завершення.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Швидкість доставки';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max робочих днів';
  }

  @override
  String get printfulMerchGetShippingQuoteButton =>
      'Отримати вартість доставки';

  @override
  String get printfulMerchPayButton => 'Оплатити';

  @override
  String get kodaMarketplaceTitle => 'Koda Маркетплейс';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Підписки';

  @override
  String get kodaMarketplaceTabBoosts => 'Бусти';

  @override
  String get kodaMarketplaceTabDiscover => 'Відкрити';

  @override
  String get kodaMarketplaceTierFreeName => 'Безкоштовно';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'Закінчується $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks =>
      'Оновіть для ексклюзивних переваг';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count токена буста доступно',
      many: '$count токенів буста доступно',
      few: '$count токени буста доступні',
      one: '$count токен буста доступний',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Подаруйте токен будь-якому серверу, на якому ви перебуваєте, з вкладки Банк сервера';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => 'Власна рамка аватара';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Значок Spark у профілі';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Збільшений ліміт завантаження файлів (50МБ)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality =>
      'Пріоритетна якість голосу';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'Усе, що є в Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => 'Анімована рамка аватара';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Значок Pulse у профілі';

  @override
  String get kodaMarketplacePulsePerkFileLimit =>
      'Ліміт завантаження файлів 100МБ';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      '1 токен буста сервера на місяць';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/міс';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Поточний план';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'Отримати $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return 'Подарувати $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return 'Подарувати $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'Підписатися на $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel =>
      'Ім\'я користувача одержувача:';

  @override
  String get kodaMarketplaceUsernameHint => 'Ім\'я користувача';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Підписка';

  @override
  String get kodaMarketplaceTotalLabel => 'Разом';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Платіж безпечно обробляється Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'Перейти до оплати';

  @override
  String get kodaMarketplaceUserNotFound => 'Користувача не знайдено';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'Не вдалося почати оформлення замовлення. Спробуйте ще раз за хвилину.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'Підписку активовано!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'Досі очікуємо на платіж -- підписка активується після завершення.';

  @override
  String get kodaMarketplaceBoostPurchased => 'Буст придбано!';

  @override
  String get kodaMarketplaceBoostPending =>
      'Досі очікуємо на платіж -- буст буде готовий після завершення.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count доступно';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Купити буст';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'Одноразова покупка -- підписники Pulse також отримують один безкоштовний токен щоразу при поновленні, що залишається вигіднішим варіантом, якщо ви бустите регулярно.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Купити буст -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Поки жоден сервер не приєднався до Koda Маркетплейсу. Власники серверів можуть увімкнути це в налаштуваннях Кастомізації свого сервера.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader =>
      'РЕКОМЕНДОВАНО ЦЬОГО ТИЖНЯ';

  @override
  String get kodaMarketplaceAllListedServersHeader =>
      'УСІ ВНЕСЕНІ ДО СПИСКУ СЕРВЕРИ';

  @override
  String get kodaMarketplaceFeaturedItemsHeader => 'РЕКОМЕНДОВАНІ ТОВАРИ';

  @override
  String get kodaMarketplaceAllItemsHeader => 'УСІ ТОВАРИ';

  @override
  String get kodaMarketplaceServerFallback => 'Сервер';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count учасника',
      many: '$count учасників',
      few: '$count учасники',
      one: '$count учасник',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceVisitStore => 'Відвідати магазин';

  @override
  String get calendarFallbackTitle => 'Календар';

  @override
  String get calendarAskVispTooltip => 'Запитати Visp';

  @override
  String get calendarCreateEventTooltip => 'Створити подію';

  @override
  String get calendarPreviousMonthTooltip => 'Попередній місяць';

  @override
  String get calendarNextMonthTooltip => 'Наступний місяць';

  @override
  String get calendarTodayButton => 'Сьогодні';

  @override
  String get calendarWeekdaySun => 'Нд';

  @override
  String get calendarWeekdayMon => 'Пн';

  @override
  String get calendarWeekdayTue => 'Вт';

  @override
  String get calendarWeekdayWed => 'Ср';

  @override
  String get calendarWeekdayThu => 'Чт';

  @override
  String get calendarWeekdayFri => 'Пт';

  @override
  String get calendarWeekdaySat => 'Сб';

  @override
  String get calendarTodaySuffix => ', сьогодні';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count події',
      many: ', $count подій',
      few: ', $count події',
      one: ', $count подія',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'Виберіть день';

  @override
  String get calendarNoEvents => 'Немає подій';

  @override
  String get calendarSubscribeTooltip => 'Підписатися';

  @override
  String get calendarUnsubscribeTooltip => 'Відписатися';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'Повторюється $recurrence';
  }

  @override
  String get calendarTicketOwned => 'Квиток є';

  @override
  String calendarTicketPrice(String price) {
    return 'Квиток $price';
  }

  @override
  String get calendarDeleteEventTitle => 'Видалити подію';

  @override
  String calendarDeleteEventConfirm(String title) {
    return 'Видалити \"$title\"? Це неможливо скасувати.';
  }

  @override
  String get calendarEditEventTitle => 'Редагувати подію';

  @override
  String get calendarCreateEventTitle => 'Створити подію';

  @override
  String get calendarEventTitleHint => 'Назва події';

  @override
  String get calendarDescriptionHint => 'Опис (необов\'язково)';

  @override
  String get calendarLocationHint => 'Місце (необов\'язково)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Початок ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Дата й час початку, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'Кінець — необов\'язково ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'Дата й час завершення, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'не встановлено';

  @override
  String get calendarTapToSetEndTime =>
      'Торкніться, щоб встановити час завершення';

  @override
  String get calendarRecurrenceLabel => 'Повторення';

  @override
  String get calendarRecurrenceNone => 'Не повторюється';

  @override
  String get calendarRecurrenceDaily => 'Щодня';

  @override
  String get calendarRecurrenceWeekly => 'Щотижня';

  @override
  String get calendarRecurrenceMonthly => 'Щомісяця';

  @override
  String get calendarColorLabel => 'Колір';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Колір $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Ціна квитка — необов\'язково';

  @override
  String get calendarLinkStageChannelLabel =>
      'Прив\'язати до каналу сцени — необов\'язково';

  @override
  String get calendarStageChannelFallback => 'сцена';

  @override
  String get discordImportFetchError => 'Не вдалося отримати шаблон.';

  @override
  String get discordImportApplyError =>
      'Не вдалося застосувати шаблон. Спробуйте ще раз.';

  @override
  String get discordImportTitle => 'Імпортувати шаблон Discord';

  @override
  String get discordImportDescription =>
      'Вставте посилання discord.new або код шаблону, щоб імпортувати ролі, категорії та канали на цей сервер.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 або код шаблону';

  @override
  String get discordImportPreviewButton => 'Попередній перегляд';

  @override
  String get discordImportTemplateFallback => 'Шаблон';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ролі',
      many: '$count ролей',
      few: '$count ролі',
      one: '$count роль',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count категорії',
      many: '$count категорій',
      few: '$count категорії',
      one: '$count категорія',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count каналу',
      many: '$count каналів',
      few: '$count канали',
      one: '$count канал',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel => 'ЗАМІНИТИ НАЯВНУ СТРУКТУРУ';

  @override
  String get discordImportReplaceWarning =>
      'Усі наявні канали, категорії та ролі буде остаточно видалено.';

  @override
  String get discordImportAddDescription =>
      'Шаблон буде додано до наявної структури вашого сервера.';

  @override
  String get discordImportReplaceConfirmTitle => 'Замінити структуру сервера?';

  @override
  String get discordImportReplaceConfirmBody =>
      'Це остаточно видалить УСІ наявні канали, категорії та ролі перед імпортом. Це неможливо скасувати.';

  @override
  String get discordImportYesReplace => 'Так, замінити';

  @override
  String get discordImportReplaceAndImportButton =>
      'Замінити й імпортувати шаблон';

  @override
  String get discordImportAddToServerButton => 'Додати шаблон до сервера';

  @override
  String get thresholdModConfigureTitle => 'Налаштувати порогову модерацію';

  @override
  String get thresholdModConfigureExplanation =>
      'Виберіть довірених модераторів і скільки з них має погодитися, перш ніж будь-хто з них зможе розшифрувати одну епоху історії каналу. Навіть у вас немає одноосібного ключа -- ви звільнені від цього, лише якщо теж є в цьому списку.';

  @override
  String get thresholdModThresholdLabel => 'Поріг:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Зменшити поріг';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Збільшити поріг';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'з $count модератора',
      many: 'з $count модераторів',
      few: 'з $count модераторів',
      one: 'з $count модератора',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle => 'Запит на порогову розшифровку';

  @override
  String get thresholdModChannelLabel => 'Канал';

  @override
  String get thresholdModReasonHint =>
      'Причина -- показується кожному призначеному модератору';

  @override
  String get thresholdModRequestButton => 'Запит';

  @override
  String get thresholdModShareRelayed => 'Частку передано заявнику.';

  @override
  String get thresholdModNotEnoughShares =>
      'Поки передано недостатньо часток -- спробуйте ще раз, коли більше модераторів передадуть свої.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count повідомлення',
      many: '$count повідомлень',
      few: '$count повідомлення',
      one: '$count повідомлення',
    );
    return 'Епоха $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'У цій епосі немає повідомлень, доступних для розшифровки.';

  @override
  String get thresholdModExplanation =>
      'Справжня розшифровка історії каналу, що залежить від активної згоди кількох призначених модераторів -- ніколи не одна людина, навіть не власник сервера. Розблоковує лише одну цілу епоху (усе, надіслане з моменту останньої зміни складу учасників), ніколи одне повідомлення.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Увімкнено -- $count модераторів, поріг $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'Не налаштовано';

  @override
  String get thresholdModReconfigureButton => 'Перенастроїти';

  @override
  String get thresholdModEnableButton => 'Увімкнути';

  @override
  String get thresholdModNotEnabledForServer =>
      'Порогову модерацію не увімкнено для цього сервера.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Увімкнено для цього сервера. Ви не є одним із призначених модераторів.';

  @override
  String get thresholdModRequestsLabel => 'Запити';

  @override
  String get thresholdModRequestDecryptButton => 'Запросити розшифровку';

  @override
  String get thresholdModNoActiveRequests => 'Немає активних запитів.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- епоха $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'очікує';

  @override
  String get thresholdModStatusApproved => 'схвалено';

  @override
  String get thresholdModApproveButton => 'Схвалити';

  @override
  String get thresholdModRelayShareButton => 'Передати мою частку';

  @override
  String get thresholdModTryReconstructButton => 'Спробувати відновити';

  @override
  String get roleSelectNoRolesAvailable =>
      'Немає доступних ролей для самопризначення.';

  @override
  String get roleSelectInstructions =>
      'Виберіть потрібні ролі. Торкніться ролі, щоб додати чи видалити її.';

  @override
  String get rulesScreenAcceptError =>
      'Не вдалося прийняти правила. Спробуйте ще раз.';

  @override
  String get rulesScreenSubtitle => 'Правила сервера';

  @override
  String get rulesScreenScrollToRead =>
      'Прогорніть донизу, щоб прочитати всі правила';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'Натискаючи \"Прийняти\", ви погоджуєтеся дотримуватися цих правил.\nПорушення можуть призвести до видалення з сервера.';

  @override
  String get rulesScreenAcceptButton => 'Я приймаю правила';

  @override
  String get rulesScreenReadAllToContinue =>
      'Прочитайте всі правила, щоб продовжити';

  @override
  String get galleryNewPostTitle => 'Новий допис';

  @override
  String get galleryChooseFileButton => 'Вибрати файл';

  @override
  String get galleryOrDivider => 'або';

  @override
  String get galleryPasteUrlHint => 'Вставте URL зображення/відео';

  @override
  String get galleryTypeLabel => 'Тип';

  @override
  String get galleryImageOption => 'Зображення';

  @override
  String get galleryVideoOption => 'Відео';

  @override
  String get galleryCaptionHint => 'Підпис (необов\'язково)';

  @override
  String get galleryPostButton => 'Опублікувати';

  @override
  String get galleryNewCollectionTitle => 'Нова колекція';

  @override
  String get galleryCollectionNameHint => 'Назва колекції';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return 'Видалити \"$collectionName\"? Дописи всередині стануть без колекції.';
  }

  @override
  String get galleryFeedTab => 'Стрічка';

  @override
  String get galleryCollectionsTab => 'Колекції';

  @override
  String get galleryNoPostsYet => 'Поки немає дописів';

  @override
  String get galleryNoCollectionsYet => 'Поки немає колекцій';

  @override
  String get gallerySelectACollection => 'Виберіть колекцію';

  @override
  String get galleryNoPostsInCollection => 'Немає дописів у цій колекції';

  @override
  String get galleryAddPostButton => 'Додати допис';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Не вдалося демонструвати екран: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return 'Гучність $username';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'Впливає лише на те, що чуєте ви -- цей пристрій, цей дзвінок.';

  @override
  String get voiceScreenResetVolumeButton => 'Скинути';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'Не вдалося підключитися: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Ваш екран, торкніться для повноекранного перегляду';

  @override
  String get voiceScreenYourScreenLabel => 'Ваш екран';

  @override
  String get voiceScreenTapToClose => 'Торкніться, щоб закрити';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (ви)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', говорить';

  @override
  String get voiceScreenCameraOnSuffix => ', камера ввімкнена';

  @override
  String get voiceScreenActivateToPopOut =>
      ', активуйте, щоб від\'єднати у вікно';

  @override
  String get voiceScreenShowVarmTooltip => 'Показати VARM';

  @override
  String get voiceScreenHideVarmTooltip => 'Приховати VARM';

  @override
  String get voiceScreenShowChatTooltip => 'Показати чат';

  @override
  String get voiceScreenHideChatTooltip => 'Приховати чат';

  @override
  String get voiceScreenStartCameraTooltip => 'Увімкнути камеру';

  @override
  String get voiceScreenStopCameraTooltip => 'Вимкнути камеру';

  @override
  String get voiceScreenShareScreenTooltip => 'Демонструвати екран';

  @override
  String get voiceScreenStopSharingTooltip => 'Зупинити демонстрацію';

  @override
  String get voiceScreenPopOutTooltip => 'Від\'єднати голос в окреме вікно';

  @override
  String get voiceScreenCouldNotPopOut => 'Не вдалося від\'єднати голос.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Вийти з голосового';

  @override
  String get voiceScreenPinTooltip => 'Закріпити (тримати відкритим)';

  @override
  String get voiceScreenUnpinTooltip => 'Відкріпити';

  @override
  String get voiceScreenSizeSmall => 'Маленький (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Середній (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Великий (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, підключено $count';
  }

  @override
  String get voiceBarSpeakingSuffix => ', ви говорите';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return 'Підключено $count · торкніться, щоб розгорнути';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Увімкнути камеру';

  @override
  String get voiceBarStopCameraTooltip => 'Вимкнути камеру';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Вийти з голосового';

  @override
  String get popOutVideoFallbackTitle => 'Голос';

  @override
  String get popOutVideoMissingTokenError => 'Відсутній токен або URL';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Час очікування з\'єднання минув через 15 секунд';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Помилка: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'Немає учасників';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Сцена';

  @override
  String get stageCouldNotJoin => 'Не вдалося приєднатися до сцени.';

  @override
  String get stageThisStageFallback => 'Ця сцена';

  @override
  String get stageRequiresTicketToJoin => 'потребує квиток для приєднання';

  @override
  String get stagePleaseWaitLabel => 'Зачекайте...';

  @override
  String get stageGetFreeTicketButton => 'Отримати безкоштовний квиток';

  @override
  String stageBuyTicketButton(String price) {
    return 'Купити квиток -- $price';
  }

  @override
  String get stageNotNowButton => 'Не зараз';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'Не вдалося почати покупку квитка.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'Досі очікуємо на платіж -- спробуйте приєднатися знову після підтвердження.';

  @override
  String get stageSpeakerBadge => 'Спікер';

  @override
  String get stageListenerBadge => 'Слухач';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'Не вдалося приєднатися: $error';
  }

  @override
  String get stageSpeakersHeader => 'СПІКЕРИ';

  @override
  String get stageRaisedHandsHeader => 'ПІДНЯТІ РУКИ';

  @override
  String get stageAllowButton => 'Дозволити';

  @override
  String get stageIgnoreButton => 'Ігнорувати';

  @override
  String get stageListenersHeader => 'СЛУХАЧІ';

  @override
  String get stageRaiseHandTooltip => 'Підняти руку';

  @override
  String get stageLowerHandTooltip => 'Опустити руку';

  @override
  String get stageLeaveStageTooltip => 'Покинути сцену';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (ви)';
  }

  @override
  String get stageMoveToListenersButton => 'Перемістити до слухачів';

  @override
  String get stageYouFallbackName => 'Ви';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'Аватар $username';
  }

  @override
  String get channelEditDialogNewTitle => 'Новий канал';

  @override
  String get channelEditDialogEditTitle => 'Редагувати канал';

  @override
  String get channelEditDialogNameHint => 'Назва каналу';

  @override
  String get channelEditDialogDescriptionHint => 'Тема (необов\'язково)';

  @override
  String get channelEditDialogTypeLabel => 'Тип';

  @override
  String get channelEditDialogTypeText => 'Текстовий';

  @override
  String get channelEditDialogTypeVoice => 'Голосовий';

  @override
  String get channelEditDialogTypeGallery => 'Галерея';

  @override
  String get channelEditDialogTypeStage => 'Сцена';

  @override
  String get channelEditDialogTypeRules => 'Правила';

  @override
  String get channelEditDialogTypeRoleSelection => 'Вибір ролі';

  @override
  String get channelEditDialogTypeCalendar => 'Календар';

  @override
  String get channelEditDialogAnnouncementTitle => 'Канал оголошень';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Публікувати можуть лише учасники з правом керування повідомленнями';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Публікувати тут оголошення про прямі трансляції й нові відео';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'Автоматично публікує, коли учасник із дозволом \"Повідомляти про початок трансляції\" виходить у прямий ефір на Twitch або публікує нове відео на YouTube';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Сповіщати ці ролі при публікації (необов\'язково)';

  @override
  String get channelEditDialogSlowmodeLabel => 'Повільний режим';

  @override
  String get channelEditDialogSlowmodeOff => 'Вимкнено';

  @override
  String get channelEditDialogUserLimitLabel => 'Ліміт користувачів';

  @override
  String get channelEditDialogUserLimitOff => 'Без ліміту';

  @override
  String get channelEditDialogCategoryLabel => 'Категорія';

  @override
  String get channelEditDialogNoCategory => 'Без категорії';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Доступ за ролями (залиште порожнім для всіх)';

  @override
  String get channelEditDialogContentLabelsLabel => 'Мітки вмісту';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Позначає цей канал для фільтрів вмісту учасників; повністю заблоковано для контрольованих облікових записів';

  @override
  String get categoryEditDialogNewTitle => 'Нова категорія';

  @override
  String get categoryEditDialogEditTitle => 'Редагувати категорію';

  @override
  String get categoryEditDialogNameHint => 'Назва категорії';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Доступ за ролями (залиште порожнім для всіх)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Учасники — $count онлайн';
  }

  @override
  String get memberPanelRefreshTooltip => 'Оновити список учасників';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count учасника',
      many: '$count учасників',
      few: '$count учасники',
      one: '$count учасник',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Не в мережі';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', рівень $tier';
  }

  @override
  String get memberPanelUnknownUser => 'Невідомо';

  @override
  String get memberPanelModerationActionsTooltip => 'Дії модерації';

  @override
  String get reportDialogReasonSpam => 'Спам';

  @override
  String get reportDialogReasonHarassment => 'Переслідування чи образи';

  @override
  String get reportDialogReasonIllegal => 'Незаконний вміст';

  @override
  String get reportDialogReasonOther => 'Інше';

  @override
  String get reportDialogReasonLabel => 'Причина';

  @override
  String get reportDialogNoteHint =>
      'Щось іще, що варто знати модераторам? (необов\'язково)';

  @override
  String get reportDialogDisclosureNote =>
      'Вміст повідомлення, показаний вам, і те, хто його надіслав, буде передано модераторам цього сервера.';

  @override
  String get reportDialogSubmitButton => 'Надіслати скаргу';

  @override
  String get reportDialogSubmitError => 'Не вдалося надіслати скаргу.';

  @override
  String get notificationBellTitle => 'Сповіщення';

  @override
  String get notificationBellMarkAllRead => 'Позначити все як прочитане';

  @override
  String get notificationBellEmptyState => 'Поки немає сповіщень';

  @override
  String get notificationBellUnreadLabel => 'Непрочитане';

  @override
  String get invitePreviewTitle => 'Запрошення на сервер';

  @override
  String get invitePreviewInvalidOrExpired =>
      'Недійсне або прострочене запрошення.';

  @override
  String get invitePreviewCouldNotJoin => 'Не вдалося приєднатися до сервера.';

  @override
  String get invitePreviewUnknownServer => 'Невідомий сервер';

  @override
  String get shippingAddressFullNameHint => 'Повне ім\'я';

  @override
  String get shippingAddressLine1Hint => 'Адреса, рядок 1';

  @override
  String get shippingAddressLine2Hint => 'Адреса, рядок 2 (необов\'язково)';

  @override
  String get shippingAddressCityHint => 'Місто';

  @override
  String get shippingAddressStateHint => 'Область/штат';

  @override
  String get shippingAddressZipHint => 'Поштовий індекс';

  @override
  String get shippingAddressCountryCodeHint => 'Код країни (напр. US)';

  @override
  String get shippingAddressPhoneHint => 'Телефон (необов\'язково)';

  @override
  String get shippingAddressPrivacyNote =>
      'Використовується лише для доставки цього замовлення -- дивіться політику конфіденційності Printful щодо того, як вони обробляють дані після оформлення замовлення.';

  @override
  String get updateNudgeAvailableTitle => 'Доступне оновлення';

  @override
  String get updateNudgeRequiredTitle => 'Потрібне оновлення';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Доступна Koda $version -- ви користуєтеся старішою збіркою.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'Ця збірка більше не підтримується. Оновіться до Koda $version, щоб продовжити користуватися Koda.';
  }

  @override
  String get updateNudgeLaterButton => 'Пізніше';

  @override
  String get tierBadgeSparkSubscriber => 'Підписник Spark';

  @override
  String get tierBadgePulseSubscriber => 'Підписник Pulse';

  @override
  String get tierBadgeAlphaSpark => 'Alpha Spark';

  @override
  String get tierBadgeFounder => 'Founder';

  @override
  String get foundersHallTitle => 'Зал засновників';

  @override
  String get foundersHallSubtitle =>
      'Найперші бекери, які зробили Koda можливою.';

  @override
  String get foundersHallEmptyState => 'Поки немає засновників.';

  @override
  String get settingsFoundersHallTitle => 'Зал засновників';

  @override
  String get settingsFoundersHallSubtitle =>
      'Дивіться, хто допоміг створити Koda';

  @override
  String get vispAvatarInDevelopment => 'У РОЗРОБЦІ';

  @override
  String get vispBoostAdvisorCouldNotAnswer =>
      'Visp не зміг скласти відповідь.';

  @override
  String get vispBoostAdvisorTitle => 'Запитати Visp: Радник з ROI бустів';

  @override
  String get vispBoostAdvisorFollowUpHint => 'Задайте додаткове питання...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Надіслати';

  @override
  String get vispBoostAdvisorBasedOn => 'На основі:';

  @override
  String get vispEventDialogCouldNotGenerate =>
      'Visp не зміг згенерувати подію.';

  @override
  String get vispEventDialogCouldNotCreate => 'Не вдалося створити цю подію.';

  @override
  String get vispEventDialogRecurrenceNone => 'Одноразово';

  @override
  String get vispEventDialogRecurrenceDaily => 'Повторюється щодня';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Повторюється щотижня';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Повторюється щомісяця';

  @override
  String get vispEventDialogTitle => 'Попросити Visp створити подію';

  @override
  String get vispEventDialogDescription =>
      'Опишіть подію -- Visp запропонує назву, дату/час і решту деталей.';

  @override
  String get vispEventDialogPromptHint =>
      'напр. \"Щотижнева сесія D&D щоп\'ятниці о 19:00 приблизно на 3 години\"';

  @override
  String get vispEventDialogPrivacyNote =>
      'Ваш опис надсилається Visp (асистенту, розміщеному на власному сервері -- нічого не виходить за межі серверів Koda) для створення цього плану.';

  @override
  String get vispEventDialogStartOver => 'Почати спочатку';

  @override
  String get vispEventDialogCreateEvent => 'Створити подію';

  @override
  String get vispEventDialogThinking => 'Обмірковую...';

  @override
  String get vispEventDialogGeneratePlan => 'Створити план';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'Не вдалося розпізнати дату -- спробуйте переформулювати';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Завершується $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price за квиток';
  }

  @override
  String get vispEventDialogBasedOn => 'На основі:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Питання $questionNumber з $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'Або введіть свою відповідь...';

  @override
  String get vispQuestionStepSendTooltip => 'Надіслати';

  @override
  String get vispQuestionStepSkip => 'Пропустити й згенерувати зараз';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp не зміг створити план.';

  @override
  String get vispSetupDialogCouldNotApplyPlan =>
      'Не вдалося застосувати цей план.';

  @override
  String get vispSetupDialogTitleNew => 'Опишіть свій сервер для Visp';

  @override
  String get vispSetupDialogTitleExisting =>
      'Попросити Visp додати щось на цей сервер';

  @override
  String get vispSetupDialogDescriptionNew =>
      'Опишіть сервер, який ви хочете -- Visp запропонує назву та набір ролей, категорій і каналів.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Опишіть, що ви хочете додати -- Visp запропонує ролі, категорії й канали для створення.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'напр. \"Затишний сервер для моєї групи D&D із голосовими каналами для двох столів\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'напр. \"Додати ще кілька каналів для наших рейдових команд\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      'Ваш опис надсилається Visp (асистенту, розміщеному на власному сервері -- нічого не виходить за межі серверів Koda) для створення цього плану.';

  @override
  String get vispSetupDialogStartOver => 'Почати спочатку';

  @override
  String get vispSetupDialogCreateServer => 'Створити сервер';

  @override
  String get vispSetupDialogAddToServer => 'Додати на сервер';

  @override
  String get vispSetupDialogThinking => 'Обмірковую...';

  @override
  String get vispSetupDialogGeneratePlan => 'Створити план';

  @override
  String get vispSetupDialogNewServerLabel => 'Новий сервер';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ролі',
      many: '$count ролей',
      few: '$count ролі',
      one: '$count роль',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count категорії',
      many: '$count категорій',
      few: '$count категорії',
      one: '$count категорія',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count каналу',
      many: '$count каналів',
      few: '$count канали',
      one: '$count канал',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'На основі:';

  @override
  String get childLockoutTitle => 'Зараз поза дозволеними для вас годинами';

  @override
  String get childLockoutBody =>
      'Батько чи опікун встановив час, коли цей обліковий запис може користуватися Koda. Попросіть у них більше часу або зазирніть знову в наступному дозволеному вікні.';

  @override
  String get childLockoutLogOutButton => 'Вийти';

  @override
  String get forcePasswordChangeError =>
      'Не вдалося оновити пароль. Спробуйте ще раз.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Вітаємо, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Для вашого облікового запису потрібен новий пароль, перш ніж ви зможете продовжити.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'Новий пароль';

  @override
  String get forcePasswordChangeConfirmPasswordHint =>
      'Підтвердіть новий пароль';

  @override
  String get forcePasswordChangeReqLength => 'Щонайменше 12 символів';

  @override
  String get forcePasswordChangeReqUpper => 'Одна велика літера';

  @override
  String get forcePasswordChangeReqLower => 'Одна маленька літера';

  @override
  String get forcePasswordChangeReqDigit => 'Одна цифра';

  @override
  String get forcePasswordChangeReqMatch => 'Паролі збігаються';

  @override
  String get forcePasswordChangeSubmitButton => 'Встановити новий пароль';

  @override
  String get forgotPasswordEnterEmailError => 'Введіть свою електронну пошту.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'Якщо такий обліковий запис існує, код скидання надіслано.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Введіть код і пароль щонайменше з 8 символів.';

  @override
  String get forgotPasswordInvalidCode => 'Недійсний або прострочений код.';

  @override
  String get forgotPasswordTitle => 'Скинути пароль';

  @override
  String get forgotPasswordEmailHint => 'Електронна адреса';

  @override
  String get forgotPasswordSendCodeButton => 'Надіслати код скидання';

  @override
  String get forgotPasswordCodeHint => '6-значний код';

  @override
  String get forgotPasswordNewPasswordHint => 'Новий пароль';

  @override
  String get forgotPasswordSetNewPasswordButton => 'Встановити новий пароль';

  @override
  String get verifyEmailEnterCodeError =>
      'Введіть 6-значний код зі свого листа.';

  @override
  String get verifyEmailInvalidCode => 'Недійсний або прострочений код.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'Новий код надіслано на $email.';
  }

  @override
  String get verifyEmailResendFailed => 'Наразі не вдалося надіслати повторно.';

  @override
  String get verifyEmailTitle => 'Перевірте свою пошту';

  @override
  String verifyEmailSentCode(String email) {
    return 'Ми надіслали 6-значний код на $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'Підтвердити пошту';

  @override
  String get verifyEmailResendButton => 'Надіслати код повторно';

  @override
  String get safetyNumberKeysNotSetUp => 'Ваші власні ключі ще не налаштовано.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName поки не має набору ключів.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'Не вдалося обчислити номер безпеки: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return 'У $peerName більше немає цього пристрою.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'Номер безпеки з $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Порівняйте цей номер із $peerName через інший канал зв\'язку -- особисто, телефонним дзвінком, будь-де, окрім цього чату. Якщо він збігається з обох боків, ви розмовляєте з тим, з ким думаєте.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName має $count пристроїв, кожен зі своїм номером безпеки -- перевірка одного не покриває інші.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Пристрій $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Позначити як перевірене';

  @override
  String get contentFiltersDescription =>
      'Сервери можуть позначати канали мітками вмісту. Виберіть, як мають поводитися позначені канали -- це лише ваша особиста настройка, яка ніколи не впливає на те, що бачать інші.';

  @override
  String get contentFiltersLabelAdult => 'Вміст для дорослих';

  @override
  String get contentFiltersLabelSuggestive => 'Провокативний';

  @override
  String get contentFiltersLabelGraphic => 'Жорсткий вміст';

  @override
  String get contentFiltersLabelNudity => 'Несексуальна оголеність';

  @override
  String get contentFiltersDescAdult => 'Сексуально відвертий вміст';

  @override
  String get contentFiltersDescSuggestive =>
      'Сексуально провокативний, але не відвертий вміст';

  @override
  String get contentFiltersDescGraphic => 'Насильство чи жорстокість';

  @override
  String get contentFiltersDescNudity =>
      'Оголеність у несексуальному контексті';

  @override
  String get contentFiltersHide => 'Приховати';

  @override
  String get contentFiltersWarn => 'Попереджати';

  @override
  String get contentFiltersShow => 'Показувати';

  @override
  String get deviceTestCouldNotGetToken =>
      'Не вдалося отримати тестовий токен.';

  @override
  String get deviceTestLabelTest => 'Тест';

  @override
  String get deviceTestLabelRecording => 'Запис...';

  @override
  String get deviceTestLabelPlayingBack => 'Відтворення...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'Не вдалося увімкнути камеру: $error';
  }

  @override
  String get deviceTestTitle => 'Тестування пристроїв';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'Не вдалося підключитися: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Мікрофон';

  @override
  String get deviceTestHearYourselfLabel => 'Почути себе (із затримкою)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Динамік / Вихід';

  @override
  String get deviceTestCameraLabel => 'Камера';

  @override
  String get deviceTestSystemDefault => 'Системні налаштування';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Говоріть, а потім прослухайте відтворення $seconds-секундного кліпу';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '$seconds с';
  }

  @override
  String get deviceTestCameraPreviewOff =>
      'Попередній перегляд камери вимкнено';

  @override
  String get deviceTestStopCameraButton => 'Зупинити тест камери';

  @override
  String get deviceTestTestCameraButton => 'Перевірити камеру';

  @override
  String get deviceTestInputLevelLabel => 'Рівень вхідного сигналу';

  @override
  String get devicesScreenRemoveConfirmTitle => 'Видалити цей пристрій?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'Йому потрібно буде увійти знову, і будь-які повідомлення, надіслані на нього під час видалення, не дійдуть пізніше -- сесії Double Ratchet не заповнюють прогалини заднім числом.';

  @override
  String get devicesScreenRemoveFailed => 'Не вдалося видалити цей пристрій.';

  @override
  String get devicesScreenNeverActive => 'Ніколи не був активний';

  @override
  String devicesScreenActiveDate(String date) {
    return 'Активний $date';
  }

  @override
  String get devicesScreenDescription =>
      'Кожен пристрій, у який ви входите, має власну ідентичність шифрування -- повідомлення, надіслане вам, доходить до кожного з пристроїв нижче. Видаліть той, яким не користуєтеся або не впізнаєте.';

  @override
  String get devicesScreenNoDevicesFound => 'Пристроїв не знайдено.';

  @override
  String get devicesScreenUnknownDevice => 'Невідомий пристрій';

  @override
  String get devicesScreenThisDeviceBadge => 'Цей пристрій';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Видалити пристрій';

  @override
  String get totpSetupInvalidCode => 'Недійсний код. Спробуйте ще раз.';

  @override
  String get totpSetupEnabledMessage => 'Двофакторну автентифікацію ввімкнено.';

  @override
  String get totpSetupScanInstructions =>
      'Скануйте цей секретний код у своєму застосунку автентифікації (Google Authenticator, 1Password, Authy):';

  @override
  String get totpSetupCodeHint => 'Введіть 6-значний код для підтвердження';

  @override
  String get totpSetupVerifyButton => 'Підтвердити й увімкнути';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'Натисни, щоб говорити';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'Натисніть будь-яку клавішу, щоб прив\'язати її...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Тестування пристроїв';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Обробка голосу';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'Придушення шуму';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Зменшує фоновий шум на мікрофоні';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Глибоке придушення шуму (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'Видалення шуму за допомогою ШІ в реальному часі, потужніше за стандартне придушення -- замінює його, коли увімкнено';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'Придушення луни';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Запобігає відлунню вашого власного звуку';

  @override
  String get voiceVideoSettingsAutoGainTitle =>
      'Автоматичне регулювання гучності';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Автоматично вирівнює гучність мікрофона (нормалізація гучності)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'Автопригашення';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Знижує гучність інших учасників, поки ви говорите';

  @override
  String get voiceVideoSettingsHighPassTitle => 'Фільтр високих частот';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Прибирає низькочастотний гул (вентилятори, кондиціонер, удари по столу)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle =>
      'Виявлення шуму від набору тексту';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Придушує стукіт клавіатури, що потрапляє в мікрофон';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Ізоляція голосу';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Фокусується на вашому голосі, відфільтровуючи інших людей і звуки поруч';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Підсилення мікрофона';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Увімкнути підсилення';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Підсилення для тихого чи віддаленого мікрофона -- застосовується перед еквалайзером';

  @override
  String get voiceVideoSettingsBandBoost => 'Підсилення';

  @override
  String get voiceVideoSettingsSectionMicEq => 'Еквалайзер мікрофона';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'Увімкнути еквалайзер';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Формує звук вашого мікрофона перед тим, як він дійде до інших';

  @override
  String get voiceVideoSettingsBandBass => 'Баси';

  @override
  String get voiceVideoSettingsBandMid => 'Середні';

  @override
  String get voiceVideoSettingsBandTreble => 'Високі';

  @override
  String get voiceVideoSettingsSectionVad =>
      'Виявлення голосової активності (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'Увімкнути VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Передає лише тоді, коли ви справді говорите';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Чутливість';

  @override
  String get voiceVideoSettingsVadHint =>
      'Нижче = вловлює тихіші звуки. Вище = лише голосніша мова запускає передачу.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Прив\'язана клавіша';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'Не встановлено — мікрофон залишається активним, поки не вимкнено звук';

  @override
  String get voiceVideoSettingsClearButton => 'Очистити';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Встановити клавішу';

  @override
  String get voiceVideoSettingsChangeButton => 'Змінити';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'Коли клавіша прив\'язана, ваш мікрофон передає звук лише поки ви утримуєте цю клавішу. Це має пріоритет над VOX, поки ви перебуваєте в голосовому каналі.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Модель реактивного віртуального аватара';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Завантажте два зображення, які змінюються, коли ви говорите. Видно лише вам.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'Мовчання';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'Розмова';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'Поріг мовлення';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Нижче = легше перемикається на зображення розмови.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'Видалити VARM';

  @override
  String get gifPickerNoGifsFound => 'GIF не знайдено';

  @override
  String get gifPickerSearchHint => 'Пошук GIF...';

  @override
  String get messageSearchHint => 'Пошук у цьому каналі...';

  @override
  String get messageSearchTooltip => 'Пошук';

  @override
  String get messageSearchInitialHint =>
      'Шукає повідомлення, вже завантажені на цьому пристрої -- старіша історія завантажується (і розшифровується локально) у міру перегляду далі назад.';

  @override
  String get messageSearchNoMatches => 'Немає збігів';

  @override
  String get messageSearchStartOfHistory => 'Початок історії каналу';

  @override
  String get messageSearchFurtherBackButton => 'Шукати далі назад';

  @override
  String get messageSearchUnknownAuthor => 'Невідомо';
}
