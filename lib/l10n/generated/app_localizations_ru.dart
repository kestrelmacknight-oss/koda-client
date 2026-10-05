// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonEdit => 'Изменить';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get commonCreate => 'Создать';

  @override
  String get commonClose => 'Закрыть';

  @override
  String get commonDone => 'Готово';

  @override
  String get commonDownload => 'Скачать';

  @override
  String get commonDisconnect => 'Отключить';

  @override
  String get commonNone => 'Нет';

  @override
  String get commonJoin => 'Присоединиться';

  @override
  String get commonDismiss => 'Отклонить';

  @override
  String get commonSubmit => 'Отправить';

  @override
  String get commonConfirm => 'Подтвердить';

  @override
  String get commonRemove => 'Убрать';

  @override
  String get commonRetry => 'Повторить';

  @override
  String get commonOk => 'ОК';

  @override
  String get commonYes => 'Да';

  @override
  String get commonNo => 'Нет';

  @override
  String get commonSearch => 'Поиск';

  @override
  String get commonSettings => 'Настройки';

  @override
  String get commonLoading => 'Загрузка...';

  @override
  String get settingsLanguageSection => 'Язык';

  @override
  String get settingsLanguageTitle => 'Язык приложения';

  @override
  String get settingsLanguageSystemDefault => 'Как в системе';

  @override
  String get settingsLanguageDescription =>
      'Выберите язык, на котором отображается интерфейс Koda. Это не влияет ни на основной язык сервера, ни на язык, на котором вы пишете сообщения.';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsSignOut => 'Выйти';

  @override
  String get settingsSectionMyAccount => 'Мой аккаунт';

  @override
  String get settingsSectionSecurity => 'Безопасность';

  @override
  String get settingsSectionAccessibility => 'Специальные возможности';

  @override
  String get settingsSectionBilling => 'Оплата';

  @override
  String get settingsSectionFamily => 'Семья';

  @override
  String get settingsSectionVoiceVideo => 'Голос и видео';

  @override
  String get settingsSectionDesktop => 'Компьютер';

  @override
  String get settingsSectionAbout => 'О приложении';

  @override
  String get settingsTwoFactorTitle => 'Двухфакторная аутентификация';

  @override
  String get settingsTwoFactorSubtitle =>
      'Добавьте приложение-аутентификатор для дополнительной безопасности';

  @override
  String get settingsLinkedDevicesTitle => 'Привязанные устройства';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'Просмотр и удаление устройств, вошедших в этот аккаунт';

  @override
  String get settingsContentFiltersTitle => 'Фильтры контента';

  @override
  String get settingsContentFiltersSubtitle =>
      'Выберите, как должен отображаться помеченный контент';

  @override
  String get settingsDmFriendsOnlyTitle =>
      'Разрешить личные сообщения только от друзей';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Пользователи, не являющиеся друзьями, не смогут начать с вами переписку';

  @override
  String get settingsDmPrivacyError =>
      'Не удалось обновить настройки конфиденциальности личных сообщений.';

  @override
  String get settingsShowVispAvatarTitle => 'Показывать аватар Visp';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Показывает лицо и настроение Visp в диалогах настройки, событий и советов';

  @override
  String get settingsHighContrastTitle => 'Высокий контраст';

  @override
  String get settingsHighContrastSubtitle =>
      'Чёрно-белые цвета высокой контрастности во всём приложении -- при переключении текущий экран ненадолго перезагрузится.';

  @override
  String get settingsDyslexiaFontTitle => 'Шрифт для дислексии';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Переключает основной текст на OpenDyslexic во всём приложении';

  @override
  String get settingsFontSizeTitle => 'Размер шрифта';

  @override
  String get settingsFontSizeSample =>
      'Съешь же ещё этих мягких французских булок, да выпей чаю';

  @override
  String get settingsDensityTitle => 'Плотность';

  @override
  String get settingsDensityDescription =>
      'Влияет на отступы стандартных элементов -- кнопок, переключателей, диалогов -- но не на все нестандартные макеты.';

  @override
  String get settingsDensityCompact => 'Компактная';

  @override
  String get settingsDensityStandard => 'Стандартная';

  @override
  String get settingsDensityComfortable => 'Комфортная';

  @override
  String get settingsStreamingTitle => 'Аккаунты трансляций';

  @override
  String get settingsStreamingDescription =>
      'Подключите Twitch/YouTube, чтобы серверы, где у вас есть право «Объявлять о начале эфира», могли автоматически публиковать сообщение, когда вы выходите в эфир или загружаете новое видео.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform подключён как $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform не подключён';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- в эфире сейчас';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- новая загрузка';

  @override
  String get settingsStreamingConnecting => 'Подключение...';

  @override
  String get settingsStreamingConnect => 'Подключить';

  @override
  String get settingsAnnounceLiveTwitch => 'Объявлять, когда я выхожу в эфир';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Объявлять о трансляциях и новых загрузках';

  @override
  String get settingsRefreshStatus =>
      'Уже подключились в браузере? Обновить статус';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'Не удалось начать подключение к $platform.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Завершите подключение в браузере, затем вернитесь и обновите страницу.';

  @override
  String get settingsThroneTitle => 'Вебхук Throne';

  @override
  String get settingsThroneDescription =>
      'Вставьте этот URL в настройки вебхука на Throne.com, чтобы получать уведомления в Koda каждый раз, когда вам отправляют подарок.';

  @override
  String get settingsThroneGetUrl => 'Получить URL моего вебхука';

  @override
  String get settingsThroneCopyTooltip => 'Копировать';

  @override
  String get settingsThroneCopiedToast => 'Скопировано в буфер обмена';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Перегенерировать (прежний URL станет недействителен)';

  @override
  String get settingsThroneRegenerateConfirmTitle =>
      'Перегенерировать URL вебхука?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'Ваш старый URL перестанет работать, поэтому потом обновите его на Throne.com.';

  @override
  String get settingsThroneRegenerate => 'Перегенерировать';

  @override
  String get settingsUploadPhoto => 'Загрузить фото';

  @override
  String get settingsOrPasteUrl => 'или вставьте URL ниже';

  @override
  String get settingsAvatarUrlHint => 'https://example.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'Для загрузки изображений требуется Cloudflare R2 — вставка URL работает всегда.';

  @override
  String get settingsDisplayNameLabel => 'ОТОБРАЖАЕМОЕ ИМЯ';

  @override
  String get settingsDisplayNameHint => 'Отображаемое имя';

  @override
  String get settingsBioLabel => 'О СЕБЕ';

  @override
  String get settingsBioHint => 'Расскажите немного о себе';

  @override
  String get settingsPronounsLabel => 'МЕСТОИМЕНИЯ';

  @override
  String get settingsPronounsHint => 'например, она/её';

  @override
  String get settingsShowPronounsTitle => 'Показывать мои местоимения другим';

  @override
  String get settingsShowPronounsSubtitle =>
      'Отображаются рядом с вашим именем в чате, списках участников и голосовых каналах';

  @override
  String get settingsStatusLabel => 'СТАТУС';

  @override
  String get settingsCustomStatusLabel => 'СВОЙ СТАТУС';

  @override
  String get settingsCustomStatusHint => 'О чём вы думаете?';

  @override
  String get statusOnline => 'В сети';

  @override
  String get statusAway => 'Нет на месте';

  @override
  String get statusDnd => 'Не беспокоить';

  @override
  String get statusInvisible => 'Невидимка';

  @override
  String get settingsFamilyNotAvailable =>
      'Родительский контроль недоступен для аккаунта, находящегося под наблюдением.';

  @override
  String get settingsAboutTitle => 'О Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Условия использования';

  @override
  String get settingsPrivacyTitle => 'Политика конфиденциальности';

  @override
  String get settingsSupportTitle => 'Поддержка';

  @override
  String get settingsReportSecurityTitle => 'Сообщить о проблеме безопасности';

  @override
  String get settingsDesktopNotAvailable =>
      'Это настройки только для компьютера -- на этой платформе нет окна или системного трея.';

  @override
  String get settingsCloseToTrayTitle => 'Сворачивать в системный трей';

  @override
  String get settingsCloseToTraySubtitle =>
      'При закрытии окна Koda продолжает работать в фоновом режиме, чтобы вы по-прежнему получали уведомления -- отключите это, чтобы закрытие окна действительно завершало работу приложения.';

  @override
  String get authErrorEmailPasswordRequired =>
      'Необходимо указать email и пароль.';

  @override
  String get authErrorIncorrectCredentials => 'Неверный email или пароль.';

  @override
  String get authErrorMustAcceptTerms =>
      'Пожалуйста, примите Условия использования.';

  @override
  String get authErrorAllFieldsRequired =>
      'Все поля обязательны для заполнения.';

  @override
  String get authErrorPasswordsDontMatch => 'Пароли не совпадают.';

  @override
  String get authErrorPasswordTooShort =>
      'Пароль должен содержать не менее 8 символов.';

  @override
  String get authErrorRegistrationFailed =>
      'Регистрация не удалась. Возможно, этот email уже используется.';

  @override
  String get authTabSignIn => 'Вход';

  @override
  String get authTabCreateAccount => 'Создать аккаунт';

  @override
  String get authAgreementPrefix => 'Используя Koda, вы соглашаетесь с нашими ';

  @override
  String get authTermsLink => 'Условиями использования';

  @override
  String get authAgreementMiddle => ' и ';

  @override
  String get authPrivacyLink => 'Политикой конфиденциальности';

  @override
  String get authAgreementSuffix => '.';

  @override
  String get authEmailHint => 'Адрес электронной почты';

  @override
  String get authPasswordHint => 'Пароль';

  @override
  String get authForgotPassword => 'Забыли пароль?';

  @override
  String get authSignInButton => 'Войти';

  @override
  String get authUsernameHint => 'Имя пользователя';

  @override
  String get authConfirmPasswordHint => 'Подтвердите пароль';

  @override
  String get authAccessCodeHint => 'Код доступа (если есть)';

  @override
  String get authAgreeToTerms =>
      'Я принимаю Условия использования и Политику конфиденциальности';

  @override
  String get authCreateAccountButton => 'Создать аккаунт';

  @override
  String get dmSafetyNumberChangedWarning =>
      'Номер безопасности этого разговора изменился -- проверьте его перед отправкой.';

  @override
  String get dmMessageNotSent => 'Сообщение не отправлено.';

  @override
  String dmEncryptMessageError(String error) {
    return 'Не удалось зашифровать сообщение: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'Не удалось загрузить вложение.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'Не удалось зашифровать вложение: $error';
  }

  @override
  String get dmReportMessage => 'Пожаловаться на сообщение';

  @override
  String get dmReportSubmitted => 'Жалоба отправлена.';

  @override
  String get dmTitle => 'Сообщения';

  @override
  String get dmNewMessage => 'Новое сообщение';

  @override
  String get dmNoConversationsYet => 'Пока нет диалогов';

  @override
  String get dmSelectConversation => 'Выберите диалог';

  @override
  String get dmVerifySafetyNumberTooltip => 'Проверить номер безопасности';

  @override
  String get dmSeenLabel => 'Просмотрено';

  @override
  String get dmMessageActionsTooltip => 'Действия с сообщением';

  @override
  String get dmRemoveAttachmentTooltip => 'Удалить вложение';

  @override
  String get dmAttachFileTooltip => 'Прикрепить файл';

  @override
  String get dmMessageHint => 'Сообщение...';

  @override
  String get dmSendMessageTooltip => 'Отправить сообщение';

  @override
  String get dmNoFriendsYet =>
      'Пока нет друзей.\nОтправьте запрос дружбы, чтобы начать.';

  @override
  String get dmUnfriendTooltip => 'Удалить из друзей';

  @override
  String get dmNoPendingRequests => 'Нет ожидающих запросов дружбы.';

  @override
  String get dmIncomingRequestsLabel => 'ВХОДЯЩИЕ';

  @override
  String get dmSentRequestsLabel => 'ОТПРАВЛЕННЫЕ';

  @override
  String get dmAcceptTooltip => 'Принять';

  @override
  String get dmDeclineTooltip => 'Отклонить';

  @override
  String get dmPendingLabel => 'Ожидание';

  @override
  String get dmNewMessageDialogTitle => 'Новое сообщение';

  @override
  String get dmEnterUsernameHint => 'Введите имя пользователя';

  @override
  String get dmOpenButton => 'Открыть';

  @override
  String dmSavedAttachment(String fileName) {
    return 'Сохранено: $fileName';
  }

  @override
  String get dmUnknownUser => 'Неизвестный';

  @override
  String get dmEndToEndEncryptedTooltip => 'Сквозное шифрование';

  @override
  String get homeContentWarningTitle => 'Предупреждение о содержимом';

  @override
  String homeContentWarningBody(String labels) {
    return 'Этот канал помечен как: $labels.\n\nИзмените это в Настройки > Безопасность > Фильтры контента.';
  }

  @override
  String get homeViewAnyway => 'Всё равно показать';

  @override
  String get homeCouldNotConnectVoice =>
      'Не удалось подключиться к голосовому каналу.';

  @override
  String get homeVoiceChannelFull => 'Этот голосовой канал заполнен.';

  @override
  String get homeCreateServer => 'Создать сервер';

  @override
  String get homeJoinServer => 'Присоединиться к серверу';

  @override
  String get homeRedeemCode => 'Активировать код';

  @override
  String get homeJoinServerDialogTitle => 'Присоединиться к серверу';

  @override
  String get homeEnterInviteCode => 'Введите код приглашения или URL:';

  @override
  String get homeInviteCodeHint => 'например, XK9MP2';

  @override
  String get homeJoined => 'Вы присоединились!';

  @override
  String get homeInvalidInvite => 'Неверный или просроченный код приглашения.';

  @override
  String get homeJoinButton => 'Присоединиться';

  @override
  String get homeRedeemCodeDialogTitle => 'Активировать код';

  @override
  String get homeEnterBackerCode => 'Введите код бэкера или награды:';

  @override
  String get homeRewardCodeHint => 'Код награды';

  @override
  String get homeCodeRedeemed => 'Код активирован! Ваши награды применены.';

  @override
  String get homeInvalidRedeemCode =>
      'Неверный, просроченный или уже использованный код.';

  @override
  String get homeRedeemButton => 'Активировать';

  @override
  String get homeAreFriends => 'Вы друзья';

  @override
  String get homeAddFriend => 'Добавить в друзья';

  @override
  String homeFriendRequestSent(String username) {
    return 'Запрос дружбы отправлен пользователю $username!';
  }

  @override
  String get homeMessageButton => 'Написать';

  @override
  String get homeSendTip => 'Отправить чаевые';

  @override
  String get homeSwitchToServer => 'Перейти на сервер';

  @override
  String get homeInvitePeople => 'Пригласить людей';

  @override
  String get homeServerSettingsMenuItem => 'Настройки сервера';

  @override
  String get homeLeaveServerMenuItem => 'Покинуть сервер';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return 'Покинуть $serverName? Вы сможете вернуться по приглашению.';
  }

  @override
  String get homeLeaveButton => 'Покинуть';

  @override
  String get homeCreateAServer => 'Создать сервер';

  @override
  String get homeServerNameHint => 'Название сервера';

  @override
  String get homeDescribeToVisp => 'Описать это Visp вместо этого';

  @override
  String get homeMarkAsRead => 'Отметить как прочитанное';

  @override
  String get homeEditChannel => 'Изменить канал';

  @override
  String get homeDeleteChannel => 'Удалить канал';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return 'Удалить #$channelName? Это действие нельзя отменить.';
  }

  @override
  String get homeDeleteButton => 'Удалить';

  @override
  String get homeCreateChannelHere => 'Создать канал здесь';

  @override
  String get homeEditCategory => 'Изменить категорию';

  @override
  String get homeDeleteCategory => 'Удалить категорию';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return 'Удалить категорию «$categoryName»? Каналы внутри останутся без категории.';
  }

  @override
  String get homeReplyAction => 'Ответить';

  @override
  String get homeCreateThreadAction => 'Создать тред';

  @override
  String get homeEditMessageAction => 'Изменить сообщение';

  @override
  String get homeDeleteMessageAction => 'Удалить сообщение';

  @override
  String get homePinMessageAction => 'Закрепить сообщение';

  @override
  String get homeUnpinMessageAction => 'Открепить сообщение';

  @override
  String get homeReportMessageAction => 'Пожаловаться на сообщение';

  @override
  String get homeReportSubmitted => 'Жалоба отправлена.';

  @override
  String get messageActionForward => 'Переслать';

  @override
  String messageForwardedFromLabel(String name) {
    return 'Переслано от $name';
  }

  @override
  String get forwardDestinationPickerTitle => 'Переслать сообщение';

  @override
  String get forwardDestinationPickerChannelsTab => 'Каналы';

  @override
  String get forwardDestinationPickerDmsTab => 'Личные сообщения';

  @override
  String get forwardDestinationPickerNoServers =>
      'Вы пока не состоите ни на одном сервере.';

  @override
  String get forwardDestinationPickerNoChannels =>
      'На этом сервере нет текстовых каналов.';

  @override
  String get forwardDestinationPickerNoConversations => 'Пока нет бесед.';

  @override
  String get forwardSuccessToast => 'Сообщение переслано.';

  @override
  String get forwardFailedToast =>
      'Не удалось переслать сообщение -- попробуйте снова.';

  @override
  String get homeAddReactionTitle => 'Добавить реакцию';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count треда',
      many: '$count тредов',
      few: '$count треда',
      one: '$count тред',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'Параметры категории';

  @override
  String get homeChannelOptionsTooltip => 'Параметры канала';

  @override
  String get homeOpenVoiceChatTooltip => 'Открыть чат';

  @override
  String get homeMarketplaceLabel => 'Маркетплейс';

  @override
  String get homeSelectChannelPrompt => 'Выберите канал';

  @override
  String get homeSearchTooltip => 'Поиск';

  @override
  String get homePinnedMessagesTooltip => 'Закреплённые сообщения';

  @override
  String get homeWaitingForKey => 'Ожидание ключа шифрования...';

  @override
  String get homeUnableToDecrypt => 'Не удалось расшифровать это сообщение.';

  @override
  String get homeMessageActionsTooltip => 'Действия с сообщением';

  @override
  String get homeCancelReplyTooltip => 'Отменить ответ';

  @override
  String get homeRemoveAttachmentTooltip => 'Удалить вложение';

  @override
  String get homeAttachFileTooltip => 'Прикрепить файл';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'Сообщение в #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'Отправить сообщение';

  @override
  String get homeEditMessageTitle => 'Изменить сообщение';

  @override
  String get homeMessageLabel => 'Сообщение';

  @override
  String get homePinnedMessagesTitle => 'Закреплённые сообщения';

  @override
  String get homeNoPinnedMessages => 'Нет закреплённых сообщений';

  @override
  String get homeUnpinTooltip => 'Открепить';

  @override
  String get homeCreateThreadTitle => 'Создать тред';

  @override
  String get homeThreadNameHint => 'Название треда';

  @override
  String homeThreadCreated(String name) {
    return 'Тред «$name» создан!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Создать или присоединиться';

  @override
  String get homeKodaMarketplaceTooltip => 'Маркетплейс Koda';

  @override
  String get homeAdminPanelTooltip => 'Панель администратора';

  @override
  String get homeServerSettingsTooltip => 'Настройки сервера';

  @override
  String get homeSettingsTooltip => 'Настройки';

  @override
  String get homeContentWarningBadge => 'Предупреждение о содержимом';

  @override
  String get homeDirectMessagesTooltip => 'Личные сообщения';

  @override
  String homeReplyingTo(String username) {
    return 'Ответ пользователю $username';
  }

  @override
  String get homeAttachmentFallback => 'Вложение';

  @override
  String get homeAttachmentUploadFailed => 'Не удалось загрузить вложение.';

  @override
  String homeSavedAttachment(String fileName) {
    return 'Сохранено: $fileName';
  }

  @override
  String serverConnectError(String service) {
    return 'Не удалось начать подключение к $service.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Отключить Printful?';

  @override
  String get serverDisconnectPrintfulBody =>
      'Этот сервер больше не сможет выполнять заказы мерча до повторного подключения.';

  @override
  String get serverDisconnectTiltifyTitle => 'Отключить Tiltify?';

  @override
  String get serverDisconnectTiltifyBody =>
      'Этот сервер перестанет показывать прогресс благотворительной кампании до повторного подключения.';

  @override
  String get serverNewRoleTitle => 'Новая роль';

  @override
  String get serverEditRoleTitle => 'Изменить роль';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Цвет $hex';
  }

  @override
  String get permViewChannels => 'Просмотр каналов';

  @override
  String get permSendMessages => 'Отправка сообщений';

  @override
  String get permConnectVoice => 'Подключение к голосовым каналам';

  @override
  String get permManageServer => 'Управление сервером';

  @override
  String get permManageChannels => 'Управление каналами';

  @override
  String get permManageRoles => 'Управление ролями';

  @override
  String get permManageMessages => 'Управление сообщениями';

  @override
  String get permKickMembers => 'Исключение участников';

  @override
  String get permBanMembers => 'Блокировка участников';

  @override
  String get permMuteMembers => 'Отключение звука участников';

  @override
  String get permMentionEveryone => 'Упоминание @everyone';

  @override
  String get permManageMarketplace => 'Управление маркетплейсом';

  @override
  String get permAnnounceLive => 'Объявление о начале эфира';

  @override
  String get permMoveMembers => 'Перемещение участников (голос)';

  @override
  String get serverRoleNameHint => 'Название роли';

  @override
  String get serverColorLabel => 'Цвет';

  @override
  String get serverPermissionsLabel => 'Права доступа';

  @override
  String get serverSelfAssignableTitle => 'Самоназначаемая';

  @override
  String get serverSelfAssignableSubtitle =>
      'Участники могут назначить себе эту роль самостоятельно';

  @override
  String get serverDefaultRoleUndeletable =>
      'Роль по умолчанию нельзя удалить.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'Удалить роль «$roleName»?';
  }

  @override
  String get serverCouldNotDeleteRole => 'Не удалось удалить эту роль.';

  @override
  String get serverMemberFallback => 'Участник';

  @override
  String get serverNoRolesYet => 'Пока нет ролей.';

  @override
  String get serverRefreshStatus =>
      'Уже подключились в браузере? Обновить статус';

  @override
  String get serverPrintfulConnected => 'Printful подключён';

  @override
  String get serverPrintfulNotConnected => 'Printful не подключён';

  @override
  String get serverPrintfulDescription =>
      'Подключите аккаунт Printful этого сервера, чтобы выполнять заказы мерча, оформленные через Koda. Каждый сервер подключает собственный магазин.';

  @override
  String get serverConnecting => 'Подключение...';

  @override
  String get serverConnectPrintful => 'Подключить Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify подключён';

  @override
  String get serverTiltifyNotConnected => 'Tiltify не подключён';

  @override
  String get serverTiltifyDescription =>
      'Подключите аккаунт Tiltify этого сервера, чтобы показывать прогресс благотворительной кампании в реальном времени всем участникам. Только чтение -- Koda никогда не публикует и не изменяет ничего на стороне Tiltify.';

  @override
  String get serverConnectTiltify => 'Подключить Tiltify';

  @override
  String get serverNoTiltifyCampaigns =>
      'На этом аккаунте Tiltify не найдено кампаний.';

  @override
  String get serverPickCampaign => 'Выберите кампанию для отображения';

  @override
  String get serverUntitledCampaign => 'Кампания без названия';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return 'Собрано $currency $raised из цели $goal';
  }

  @override
  String get serverViewCampaign => 'Посмотреть кампанию';

  @override
  String get serverRefreshButton => 'Обновить';

  @override
  String get serverUploadButton => 'Загрузить';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return 'Использовано $used / $limit слотов -- уровень буста $level';
  }

  @override
  String get serverNoCustomEmoji => 'Пока нет пользовательских эмодзи.';

  @override
  String get serverDeleteEmojiTooltip => 'Удалить эмодзи';

  @override
  String get serverUploadEmojiTitle => 'Загрузить эмодзи';

  @override
  String get serverEmojiNameHint => 'название (буквы, цифры, _)';

  @override
  String get serverChooseImage => 'Выбрать изображение';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Текущий уровень буста: $level';
  }

  @override
  String get serverBackgroundTitle => 'Фон сервера';

  @override
  String get serverBackgroundDescription =>
      'Пользовательский фон, отображаемый за окном каналов для всех на этом сервере.';

  @override
  String get serverBackgroundLockedHint =>
      'Достигните 4-го уровня буста, чтобы открыть пользовательский фон.';

  @override
  String get serverIconBorderTitle => 'Рамка значка сервера';

  @override
  String get serverIconBorderDescription =>
      'Акцентная рамка вокруг значка этого сервера в списке серверов каждого участника.';

  @override
  String get serverIconBorderLockedHint =>
      'Достигните 5-го уровня буста, чтобы открыть пользовательскую рамку значка.';

  @override
  String get serverBoostFromBank =>
      'Прокачайте этот сервер из Банка сервера в Маркетплейсе, чтобы повысить его уровень.';

  @override
  String get serverMarketplaceListingLabel => 'РАЗМЕЩЕНИЕ В МАРКЕТПЛЕЙСЕ';

  @override
  String get serverListInMarketplace => 'Разместить в Маркетплейсе Koda';

  @override
  String get serverListInMarketplaceDescription =>
      'Добавляет магазин этого сервера в Koda Marketplace с шансом попасть в еженедельную ротацию рекомендуемых товаров. Это касается покупок, а не поиска серверов для вступления -- это никак не влияет на общий поиск серверов.';

  @override
  String get serverSocialLinkLabel =>
      'Ссылка на соцсеть / приглашение (необязательно)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Сохранить ссылку';

  @override
  String get serverPricingLabel => 'ЦЕНЫ';

  @override
  String get serverPrimaryCurrencyLabel => 'Основная валюта';

  @override
  String get serverPrimaryCurrencyDescription =>
      'Применяется к уровням подписки на сервер и ценам цифровых товаров, которые вы задаёте для этого сервера.';

  @override
  String get serverPrimaryLanguageLabel => 'Основной язык';

  @override
  String get serverPrimaryLanguageDescription =>
      'Сообщения, которые участники публикуют на другом языке, получают небольшой значок языка при сравнении с этой настройкой.';

  @override
  String get serverMarketplaceLinkSaved => 'Ссылка на маркетплейс сохранена.';

  @override
  String get serverIconUpdated => 'Значок сервера обновлён!';

  @override
  String get serverTemplateImported => 'Шаблон импортирован!';

  @override
  String get serverImportFromDiscord => 'Импортировать из Discord';

  @override
  String get serverVispPlanLive => 'План Visp готов!';

  @override
  String get serverAskVisp => 'Спросить Visp';

  @override
  String get serverAddCategoryButton => 'Добавить категорию';

  @override
  String get serverAddChannelHereTooltip => 'Добавить канал здесь';

  @override
  String get serverRename => 'Переименовать';

  @override
  String get serverUncategorized => 'БЕЗ КАТЕГОРИИ';

  @override
  String get serverAddChannel => 'Добавить канал';

  @override
  String get serverEditRulesContent => 'Редактировать текст правил';

  @override
  String get serverRulesContentHint =>
      'Введите здесь правила вашего сервера...';

  @override
  String get serverRulesUpdated => 'Правила обновлены!';

  @override
  String get serverAddRole => 'Добавить роль';

  @override
  String get serverDefaultRoleLabel => 'Роль по умолчанию';

  @override
  String get serverManageRolesTooltip => 'Управление ролями';

  @override
  String get serverMutedLabel => 'Без звука';

  @override
  String get serverExpandedLabel => 'развёрнуто';

  @override
  String get serverCollapsedLabel => 'свёрнуто';

  @override
  String get serverUnmute => 'Включить звук';

  @override
  String get serverMute => 'Отключить звук';

  @override
  String get serverKick => 'Исключить';

  @override
  String get serverBan => 'Заблокировать';

  @override
  String serverBannedUsersLabel(int count) {
    return 'ЗАБЛОКИРОВАННЫЕ ПОЛЬЗОВАТЕЛИ — $count';
  }

  @override
  String get serverNoBannedUsers => 'Нет заблокированных пользователей.';

  @override
  String get serverUnban => 'Разблокировать';

  @override
  String get serverMemberFallbackGeneric => 'этого участника';

  @override
  String serverBanConfirm(String username, String serverName) {
    return 'Заблокировать $username на сервере $serverName? Он не сможет вернуться без разблокировки.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return 'Исключить $username с сервера $serverName? Он сможет вернуться по приглашению.';
  }

  @override
  String get serverMuteDuration60Sec => '60 секунд';

  @override
  String get serverMuteDuration5Min => '5 минут';

  @override
  String get serverMuteDuration10Min => '10 минут';

  @override
  String get serverMuteDuration1Hour => '1 час';

  @override
  String get serverMuteDuration1Day => '1 день';

  @override
  String get serverMuteDuration1Week => '1 неделя';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'Не удалось выполнить действие «$action» для $username.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return 'Отключить звук $username';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'Не удалось отключить звук $username.';
  }

  @override
  String get serverUnlockInvites => 'Разблокировать приглашения';

  @override
  String get serverInvitesUnlocked => 'Приглашения разблокированы.';

  @override
  String get serverAuditLogDescription =>
      'Модерация 1-го уровня -- исключения, блокировки, отключения звука и автоматическая защита от флуда/рейдов. Только метаданные; никогда не содержимое сообщений.';

  @override
  String get serverSystemActor => 'Система';

  @override
  String get serverActionKicked => 'исключил(а)';

  @override
  String get serverActionBanned => 'заблокировал(а)';

  @override
  String get serverActionUnbanned => 'разблокировал(а)';

  @override
  String get serverActionMuted => 'отключил(а) звук';

  @override
  String get serverActionUnmuted => 'включил(а) звук';

  @override
  String get serverActionFloodDetected => 'автоматически отключён звук за флуд';

  @override
  String get serverActionRaidLockdownEnabled =>
      'заблокировал(а) приглашения (защита от рейда)';

  @override
  String get serverActionRaidLockdownDisabled => 'разблокировал(а) приглашения';

  @override
  String get serverActionMoved => 'переместил(а)';

  @override
  String get serverUnknownAction => 'неизвестное действие';

  @override
  String get serverNoModerationActivity => 'Пока нет действий модерации.';

  @override
  String get serverReportsDescription =>
      'Сообщения, на которые пожаловались участники этого сервера -- уже расшифрованная копия самого отправителя жалобы, раскрытая при подаче жалобы.';

  @override
  String get serverNoPendingReports => 'Нет ожидающих жалоб.';

  @override
  String get serverReportReasonOther => 'другое';

  @override
  String get serverReportStatusActioned => 'Обработано';

  @override
  String get serverReportStatusDismissed => 'Отклонено';

  @override
  String get serverResolvedLabel => 'РЕШЁННЫЕ';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'Жалоба от $reporter -- отправлено пользователем $target';
  }

  @override
  String serverReportNote(String note) {
    return 'Заметка: $note';
  }

  @override
  String get serverDismissButton => 'Отклонить';

  @override
  String get serverMarkActioned => 'Отметить как обработанное';

  @override
  String get serverCreateInvite => 'Создать приглашение';

  @override
  String get serverInviteCreatedTitle => 'Приглашение создано';

  @override
  String get serverNoActiveInvites => 'Нет активных приглашений';

  @override
  String serverUsesLabel(String uses) {
    return 'Использований: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Удалить приглашение';

  @override
  String get serverChangeIconLabel => 'Изменить значок сервера';

  @override
  String get serverFallbackName => 'Сервер';

  @override
  String serverSettingsTitle(String serverName) {
    return 'Настройки сервера $serverName';
  }

  @override
  String get serverTabChannels => 'Каналы';

  @override
  String get serverTabRoles => 'Роли';

  @override
  String get serverTabMembers => 'Участники';

  @override
  String get serverTabInvites => 'Приглашения';

  @override
  String get serverTabMerch => 'Мерч';

  @override
  String get serverTabEmoji => 'Эмодзи';

  @override
  String get serverTabCustomize => 'Оформление';

  @override
  String get serverTabAuditLog => 'Журнал аудита';

  @override
  String get serverTabReports => 'Жалобы';

  @override
  String get serverTabThresholdMod => 'Пороговая модерация';

  @override
  String get serverTabCharity => 'Благотворительность';

  @override
  String get homeCustomEmojiFallback => 'пользовательское эмодзи';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count реакции',
      many: '$count реакций',
      few: '$count реакции',
      one: '$count реакция',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted =>
      ', вы отреагировали, активируйте, чтобы убрать';

  @override
  String get homeReactionActivateToAdd => ', активируйте, чтобы добавить';

  @override
  String get homeAddReactionLabel => 'Добавить реакцию';

  @override
  String homeViewProfile(String username) {
    return 'Просмотреть профиль $username';
  }

  @override
  String get homeMoveToVoiceChannel => 'Переместить в голосовой канал…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Выберите голосовой канал';

  @override
  String get homeNoOtherVoiceChannels => 'Нет других голосовых каналов';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username теперь в канале $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'Не удалось переместить $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'Вас переместили в $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'Присоединитесь к $channel, чтобы говорить';
  }

  @override
  String get adminPanelTitle => 'Панель администратора';

  @override
  String get adminTabBackerCodes => 'Коды бэкеров';

  @override
  String get adminTabUsers => 'Пользователи';

  @override
  String get adminTabDmReports => 'Жалобы на ЛС';

  @override
  String get adminTabSpamFlags => 'Спам-флаги';

  @override
  String get adminTabWiki => 'Вики';

  @override
  String get adminTabBoosts => 'Бусты';

  @override
  String get adminCreateBackerCodeTitle => 'Создать код бэкера';

  @override
  String get adminCodeHint => 'Код (оставьте пустым для автогенерации)';

  @override
  String get adminNoteHint => 'Заметка (например, «Kickstarter Tier 2»)';

  @override
  String get adminFlagsJsonHint =>
      'Флаги в формате JSON, например \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint =>
      'Макс. использований (оставьте пустым = без ограничений)';

  @override
  String get adminCodeCreatedTitle => 'Код создан';

  @override
  String get adminCodeLabel => 'Код:';

  @override
  String get adminCopyCodeTooltip => 'Копировать код';

  @override
  String adminFlagsValue(String flags) {
    return 'Флаги: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Коды бэкеров и наград';

  @override
  String get adminNewCodeButton => 'Новый код';

  @override
  String get adminNoCodesYet => 'Пока нет кодов';

  @override
  String get adminRewardsHeader => 'Награды';

  @override
  String get adminRewardAlphaBetaAccess =>
      'Доступ к альфе/бете + значок Alpha Spark';

  @override
  String get adminRewardLifetimePulse =>
      'Пожизненный статус Pulse + значок Founder + увеличенный битрейт';

  @override
  String get adminRewardMonthlyBoostTokenOne =>
      'Ежемесячный токен усиления сервера (улучшенное аудио/видео)';

  @override
  String get adminRewardAnimatedFrameBundle =>
      'Анимированная рамка профиля + Зал основателей + 2 ежемесячных токена сервера';

  @override
  String get adminRewardTitanGlow =>
      'Постоянное свечение имени пользователя \"Titan\"';

  @override
  String get adminRewardAnimatedFrame => 'Анимированная рамка';

  @override
  String get adminRewardFoundersHall => 'Зал основателей';

  @override
  String adminRewardMonthlyBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count токена усиления/месяц',
      many: '$count токенов усиления/месяц',
      few: '$count токена усиления/месяц',
      one: '1 токен усиления/месяц',
    );
    return '$_temp0';
  }

  @override
  String get adminRewardsNone => 'Нет наград';

  @override
  String get adminRegistrationOpenLabel => 'Регистрация открыта для всех';

  @override
  String get adminRegistrationInviteOnlyLabel =>
      'Регистрация только по приглашению (требуется код бэкера)';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return 'Использований: $uses';
  }

  @override
  String get adminSearchUsersHint => 'Поиск пользователей по имени...';

  @override
  String get adminSearchUsersPrompt => 'Найдите пользователя выше';

  @override
  String get adminNoDmReports => 'Нет жалоб на личные сообщения.';

  @override
  String get adminResolvedLabel => 'РЕШЁННЫЕ';

  @override
  String get adminReasonOther => 'другое';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Отправитель жалобы: $reporterId\\nРаскрытый отправитель: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Заметка: $note';
  }

  @override
  String get adminDismissButton => 'Отклонить';

  @override
  String get adminMarkActionedButton => 'Отметить как обработанное';

  @override
  String get adminStatusActioned => 'Обработано';

  @override
  String get adminStatusDismissed => 'Отклонено';

  @override
  String get adminNoSpamFlags => 'Нет спам-флагов.';

  @override
  String get adminFlagMassDmSpam => 'Массовая рассылка спама в ЛС';

  @override
  String get adminFlagRaidLockdown => 'Блокировка рейда';

  @override
  String get adminFlagBotBehavior => 'Поведение, похожее на бота';

  @override
  String get adminFlagChannelFlooding => 'Флуд в канале';

  @override
  String get adminAutoEscalatedBadge => 'АВТОЭСКАЛАЦИЯ';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Уверенность: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'Пользователь: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Сервер: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount из $totalJoiners новых участников всё ещё отключены';
  }

  @override
  String get adminNoJoinersMuted => 'Сейчас нет отключённых новых участников';

  @override
  String adminRestrictedUntil(String until) {
    return 'Сейчас ограничен(а) до $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'Сейчас не ограничен(а)';

  @override
  String get adminDismissUndoButton => 'Отклонить и отменить';

  @override
  String get adminConfirmRestrictButton => 'Подтвердить и ограничить';

  @override
  String get adminDeleteArticleTitle => 'Удалить статью?';

  @override
  String adminDeleteArticleBody(String title) {
    return '«$title» будет удалена из базы знаний Visp.';
  }

  @override
  String get adminNewArticleTitle => 'Новая статья';

  @override
  String get adminEditArticleTitle => 'Изменить статью';

  @override
  String get adminArticleTitleHint => 'Заголовок';

  @override
  String get adminArticleContentHint => 'Содержание статьи (markdown)';

  @override
  String get adminWikiArticlesHeader => 'Статьи вики';

  @override
  String get adminNoArticlesYet => 'Пока нет статей';

  @override
  String get adminEditArticleTooltip => 'Изменить статью';

  @override
  String get adminDeleteArticleTooltip => 'Удалить статью';

  @override
  String get adminSearchServersHint => 'Поиск серверов по названию...';

  @override
  String get adminSearchServersPrompt => 'Найдите сервер выше';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'Выдать бусты серверу $serverName';
  }

  @override
  String get adminNumBoostsHint => 'Количество бустов';

  @override
  String get adminGrantButton => 'Выдать';

  @override
  String get adminPositiveNumberError => 'Введите положительное целое число.';

  @override
  String get adminGrantBoostsFailed => 'Не удалось выдать бусты.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Выдано $count буста серверу $serverName -- теперь уровень $level ($activeCount активных).',
      many:
          'Выдано $count бустов серверу $serverName -- теперь уровень $level ($activeCount активных).',
      few:
          'Выдано $count буста серверу $serverName -- теперь уровень $level ($activeCount активных).',
      one:
          'Выдан $count буст серверу $serverName -- теперь уровень $level ($activeCount активных).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count участников';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Выдать бусты';

  @override
  String get parentalDashboardTitle => 'Семья';

  @override
  String get parentalDashboardCreateChildTitle => 'Создать детский аккаунт';

  @override
  String get parentalDashboardUsernameHint => 'Имя пользователя';

  @override
  String get parentalDashboardEmailHint => 'Email';

  @override
  String get parentalDashboardPasswordHint => 'Пароль';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'Это создаёт полностью контролируемый аккаунт: помеченные каналы блокируются, и вы сможете задать разрешённые часы и видеть (но не читать) их друзей и серверы.';

  @override
  String get parentalDashboardValidationError =>
      'Необходимы имя пользователя, email и пароль не менее 8 символов.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'Не удалось создать детский аккаунт -- имя пользователя или email могут быть уже заняты.';

  @override
  String get parentalDashboardCreatingLabel => 'Создание...';

  @override
  String get parentalDashboardNoChildren => 'Пока нет привязанных аккаунтов.';

  @override
  String get parentalDashboardSupervisedLabel => 'Аккаунт под наблюдением';

  @override
  String get parentalDashboardUnknownUser => 'Неизвестный';

  @override
  String get childDetailFallbackTitle => 'Детский аккаунт';

  @override
  String get childDetailTabFriends => 'Друзья';

  @override
  String get childDetailTabServers => 'Серверы';

  @override
  String get childDetailTabSchedule => 'Расписание';

  @override
  String get childDetailTabOverride => 'Исключение';

  @override
  String get childDetailNoFriends => 'Нет друзей.';

  @override
  String get childDetailUnknownUser => 'Неизвестный';

  @override
  String get childDetailRemoveFriendTooltip => 'Удалить из друзей';

  @override
  String get childDetailNoServers => 'Не состоит ни в одном сервере.';

  @override
  String childDetailMemberCount(int count) {
    return '$count участников';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Удалить с сервера';

  @override
  String get childDetailRestrictAccessTitle =>
      'Ограничить доступ по расписанию';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Выключено значит доступ не ограничен в любое время';

  @override
  String get childDetailTimezoneLabel => 'Часовой пояс';

  @override
  String get childDetailMonday => 'Понедельник';

  @override
  String get childDetailTuesday => 'Вторник';

  @override
  String get childDetailWednesday => 'Среда';

  @override
  String get childDetailThursday => 'Четверг';

  @override
  String get childDetailFriday => 'Пятница';

  @override
  String get childDetailSaturday => 'Суббота';

  @override
  String get childDetailSunday => 'Воскресенье';

  @override
  String get childDetailNoAccessLabel => 'Нет доступа';

  @override
  String get childDetailToLabel => 'до';

  @override
  String get childDetailSavingLabel => 'Сохранение...';

  @override
  String get childDetailSaveScheduleButton => 'Сохранить расписание';

  @override
  String get childDetailScheduleSaved => 'Расписание сохранено.';

  @override
  String get childDetailOverrideExplanation =>
      'Предоставить временный доступ вне обычного расписания -- полезно для разового исключения без изменения недельного расписания.';

  @override
  String get childDetailReasonHint => 'Причина (необязательно)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes мин';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours ч';
  }

  @override
  String get childDetailRevokeOverrideButton => 'Отозвать активное исключение';

  @override
  String get childDetailAccessGranted => 'Временный доступ предоставлен.';

  @override
  String get childDetailOverrideRevoked => 'Исключение отозвано.';

  @override
  String get digitalGoodsTitle => 'Цифровые товары';

  @override
  String get digitalGoodsMyProductsTitle => 'Мои товары';

  @override
  String get digitalGoodsManageProductsTooltip =>
      'Управление товарами этого сервера';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Перейти к просмотру';

  @override
  String get digitalGoodsCreateProductTooltip => 'Создать товар';

  @override
  String get digitalGoodsBrowseTab => 'Обзор';

  @override
  String get digitalGoodsMyListingsTab => 'Мои товары';

  @override
  String get digitalGoodsMyPurchasesTab => 'Мои покупки';

  @override
  String get digitalGoodsNoProductsYet => 'Пока нет товаров';

  @override
  String get digitalGoodsNoProductsAvailable => 'Нет доступных товаров';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Создайте свой первый товар, чтобы начать продавать';

  @override
  String get digitalGoodsCheckBackLater =>
      'Загляните позже за цифровыми товарами';

  @override
  String get digitalGoodsCreateProductButton => 'Создать товар';

  @override
  String get digitalGoodsLicenseKeyBadge => 'Лицензионный ключ';

  @override
  String get digitalGoodsFileBadge => 'Файл';

  @override
  String get digitalGoodsAllServersBadge => 'Все серверы';

  @override
  String get digitalGoodsFreeForYou => 'Бесплатно для вас';

  @override
  String get digitalGoodsFreeLabel => 'Бесплатно';

  @override
  String digitalGoodsSoldCount(int count) {
    return 'Продано: $count';
  }

  @override
  String get digitalGoodsKeysButton => 'Ключи';

  @override
  String get digitalGoodsGetForFree => 'Получить бесплатно';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'Купить за $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'Пока нет покупок';

  @override
  String get digitalGoodsUnknownProduct => 'Неизвестный товар';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'Куплено $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Копировать ключ';

  @override
  String get digitalGoodsLicenseKeyCopied => 'Лицензионный ключ скопирован!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'Истекает $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'Ваш лицензионный ключ';

  @override
  String get digitalGoodsCopyKeyButton => 'Копировать ключ';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'Не удалось начать оформление заказа -- возможно, этот автор ещё не подключил Stripe.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'Покупка завершена! Найдите её в разделе «Мои покупки».';

  @override
  String get digitalGoodsPurchasePending =>
      'Всё ещё ожидаем оплату -- она появится в разделе «Мои покупки» после завершения.';

  @override
  String get digitalGoodsCreateProductTitle => 'Создать товар';

  @override
  String get digitalGoodsEditProductTitle => 'Изменить товар';

  @override
  String get digitalGoodsProductTitleHint => 'Название товара';

  @override
  String get digitalGoodsDescriptionHint => 'Описание (необязательно)';

  @override
  String get digitalGoodsPriceHint =>
      'Цена в USD (оставьте пустым для бесплатного товара)';

  @override
  String get digitalGoodsProductTypeLabel => 'Тип товара';

  @override
  String get digitalGoodsFileDownloadOption => 'Загрузка файла';

  @override
  String get digitalGoodsLicenseKeyOption => 'Лицензионный ключ';

  @override
  String get digitalGoodsAvailabilityLabel => 'Доступность';

  @override
  String get digitalGoodsThisServerOnlyOption => 'Только этот сервер';

  @override
  String get digitalGoodsAllKodaServersOption => 'Все серверы Koda';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'После создания используйте кнопку «Ключи», чтобы загрузить лицензионные ключи.';

  @override
  String get digitalGoodsProductFileLabel => 'Файл товара';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName ($sizeMb МБ)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Удалить файл';

  @override
  String get digitalGoodsUploadingLabel => 'Загрузка...';

  @override
  String get digitalGoodsChooseFileButton => 'Выбрать файл';

  @override
  String get digitalGoodsReplaceFileButton => 'Заменить файл';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Выберите файл для этого товара перед сохранением.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle =>
      'Загрузить лицензионные ключи';

  @override
  String get digitalGoodsPasteKeysHint => 'Вставьте по одному ключу на строку:';

  @override
  String get digitalGoodsKeyExampleHint =>
      'KEY-XXXX-XXXX\\nKEY-YYYY-YYYY\\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Загрузить ключи';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'Лицензионные ключи загружены!';

  @override
  String get serverSubscriptionManageTitle => 'Управление подписками';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return 'Подписки $serverName';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Добавить уровень';

  @override
  String get serverSubscriptionNoTiersYet => 'Пока нет уровней подписки';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Создайте до 3 уровней для вашего сообщества';

  @override
  String get serverSubscriptionCreateFirstTierButton =>
      'Создать первый уровень';

  @override
  String get serverSubscriptionShowSubscriberCounts =>
      'Показывать количество подписчиков';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/мес';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count активного подписчика',
      many: '$count активных подписчиков',
      few: '$count активных подписчика',
      one: '$count активный подписчик',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned =>
      'Роль назначается автоматически';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return 'Скидка $discount% в маркетплейсе';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'У этого сервера нет уровней подписки';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Активный подписчик';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'Истекает $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk =>
      'Эксклюзивная роль подписчика';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return 'Скидка $discount% на покупки в маркетплейсе';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Каналы только для подписчиков';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Вы подписаны';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'Подписаться за $price/мес';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Создать уровень';

  @override
  String get serverSubscriptionEditTierTitle => 'Изменить уровень';

  @override
  String get serverSubscriptionTierNameHint =>
      'Название уровня (например, Фанат, Сторонник, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Описание (необязательно)';

  @override
  String get serverSubscriptionPriceHint => 'Цена в месяц (USD)';

  @override
  String get serverSubscriptionDiscountLabel => 'Скидка в маркетплейсе, %';

  @override
  String get serverSubscriptionPositionLabel => 'Позиция';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Уровень $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Выдаёт роль при подписке — необязательно';

  @override
  String get serverSubscriptionRoleFallback => 'роль';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Автоматически выдаётся участнику в момент подписки и снимается в момент истечения подписки.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Уровень создан -- подключите Stripe в разделе Маркетплейс → Автор, прежде чем участники смогут на него подписаться.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Удалить уровень';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return 'Удалить «$tierName»? Текущие подписчики сохранят доступ до истечения срока.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'Подписаться на $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel =>
      'Ежемесячная подписка';

  @override
  String get serverSubscriptionServerBankEarnsLabel => 'Банк сервера получает';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points очк.';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Платёж безопасно обрабатывается Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'Подписаться';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'Не удалось начать оформление заказа -- возможно, владелец этого сервера ещё не подключил Stripe.';

  @override
  String get serverSubscriptionSubscribed => 'Вы подписались!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'Всё ещё ожидаем оплату -- подписка активируется после завершения.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'Чаевые для $username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Выберите сумму';

  @override
  String get tipDialogMessageHint => 'Добавить сообщение (необязательно)';

  @override
  String get tipDialogYouPayLabel => 'Вы платите';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username получает';
  }

  @override
  String get tipDialogSendTipButton => 'Отправить чаевые';

  @override
  String get tipDialogFailedToSendTip =>
      'Не удалось отправить чаевые. Возможно, автор не подключён к Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'Не удалось начать оформление заказа. Повторите попытку через мгновение.';

  @override
  String get tipDialogTipSent => 'Чаевые отправлены!';

  @override
  String get tipDialogTipPending =>
      'Всё ещё ожидаем оплату -- она пройдёт после завершения.';

  @override
  String get tipDialogUnknownUser => 'Неизвестный';

  @override
  String get marketplaceTitle => 'Маркетплейс';

  @override
  String get marketplaceCreatorPayoutsTitle => 'Выплаты авторам';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Получайте чаевые напрямую через Stripe';

  @override
  String get marketplaceTabServerBank => 'Банк сервера';

  @override
  String get marketplaceTabDigitalGoods => 'Цифровые товары';

  @override
  String get marketplaceTabMerch => 'Мерч';

  @override
  String get marketplaceTabSubscription => 'Подписка';

  @override
  String get marketplaceTabRevenue => 'Доход';

  @override
  String get marketplaceSelectServerSubscription =>
      'Выберите сервер, чтобы посмотреть его подписку';

  @override
  String get marketplaceSelectServerBank =>
      'Выберите сервер, чтобы посмотреть его банк';

  @override
  String get marketplaceSelectServerRevenue =>
      'Выберите сервер, чтобы посмотреть его доход';

  @override
  String get marketplaceStripeAccountStatus => 'Аккаунт Stripe';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Регистрация завершена';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'Принимает платежи';

  @override
  String get marketplaceConnectStripeButton => 'Подключить аккаунт Stripe';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Завершить регистрацию в Stripe';

  @override
  String get marketplaceRefreshStatusButton => 'Обновить статус';

  @override
  String get marketplaceReadyToReceiveTips => 'Вы готовы получать чаевые!';

  @override
  String get marketplaceHowItWorksTitle => 'Как это работает';

  @override
  String get marketplaceHowItWorksStep1 => 'Подключите свой аккаунт Stripe';

  @override
  String get marketplaceHowItWorksStep2 => 'Пройдите проверку личности';

  @override
  String get marketplaceHowItWorksStep3 =>
      'Получайте чаевые прямо на свой банковский счёт';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda взимает комиссию за обработку 5%. Эта комиссия поступает в банк вашего сервера в виде очков.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Просматривать Банк сервера может только владелец сервера или тот, у кого есть право «Управление маркетплейсом».';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName прокачан!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit слотов для пользовательских эмодзи';
  }

  @override
  String get marketplaceServerFallback => 'Сервер';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance очков';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount активности';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'Очки начисляются с 5% комиссии за обработку чаевых и подписок на этом сервере. Используйте очки, чтобы разблокировать улучшения сервера.';

  @override
  String get marketplaceServerBoostsTitle => 'Бусты сервера';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Уровень $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count активного буста',
      many: '$count активных бустов',
      few: '$count активных буста',
      one: '$count активный буст',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: 'Ещё $more буста до уровня $level',
      many: 'Ещё $more бустов до уровня $level',
      few: 'Ещё $more буста до уровня $level',
      one: 'Ещё $more буст до уровня $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' и разблокирует пользовательский фон сервера';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' и разблокирует пользовательскую рамку значка сервера';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'У вас есть $count токена буста.',
      many: 'У вас есть $count токенов буста.',
      few: 'У вас есть $count токена буста.',
      one: 'У вас есть $count токен буста.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'Токены буста начисляются по подписке Pulse (1 в месяц). Оформите подписку во вкладке «Подписки», чтобы получить один.';

  @override
  String get marketplaceBoostingLabel => 'Прокачка...';

  @override
  String get marketplaceBoostThisServerButton => 'Прокачать этот сервер';

  @override
  String get marketplaceComingSoonUpgradesTitle => 'Скоро — улучшения сервера';

  @override
  String get marketplaceSpendPointsList =>
      'Тратьте очки банка сервера на:\n• Собственный домен сервера\n• Увеличенный лимит участников\n• Приоритетную поддержку\n• Эксклюзивный значок сервера';

  @override
  String get marketplaceSourceTip => 'Чаевые';

  @override
  String get marketplaceSourceSubscription => 'Подписки Koda';

  @override
  String get marketplaceSourceServerSubscription => 'Подписки сервера';

  @override
  String get marketplaceSourceDigitalProduct => 'Цифровые товары';

  @override
  String get marketplaceSourceStageTicket => 'Билеты на сцену';

  @override
  String get marketplaceSourcePrintfulOrder => 'Заказы мерча';

  @override
  String get marketplaceJustNow => 'только что';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return '$minutes мин назад';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return '$hours ч назад';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return '$days дн назад';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Просматривать доход этого сервера могут только участники, способные управлять маркетплейсом.';

  @override
  String get marketplaceBalanceLabel => 'Баланс';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Заработано за всё время';

  @override
  String get marketplaceLast30DaysTitle => 'Последние 30 дней';

  @override
  String get marketplaceRevenueBySourceTitle => 'Доход по источникам';

  @override
  String get marketplaceNoRevenueYet => 'Пока нет дохода.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count транзакции',
      many: '$count транзакций',
      few: '$count транзакции',
      one: '$count транзакция',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'Недавние транзакции';

  @override
  String get marketplaceNoTransactionsYet => 'Пока нет транзакций.';

  @override
  String get marketplaceNoActivityYet => 'Пока нет активности';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Синхронизировано $count товара из Printful',
      many: 'Синхронизировано $count товаров из Printful',
      few: 'Синхронизировано $count товара из Printful',
      one: 'Синхронизирован $count товар из Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Не удалось синхронизироваться с Printful -- проверьте подключение в настройках Мерча.';

  @override
  String get printfulMerchSelectServer =>
      'Выберите сервер, чтобы посмотреть его мерч';

  @override
  String get printfulMerchManageCatalogTitle => 'Управление каталогом мерча';

  @override
  String get printfulMerchTitle => 'Мерч';

  @override
  String get printfulMerchSyncingLabel => 'Синхронизация...';

  @override
  String get printfulMerchSyncCatalogButton => 'Синхронизировать каталог';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'Переключиться на обзор';

  @override
  String get printfulMerchManageTooltip => 'Управление мерчем этого сервера';

  @override
  String get printfulMerchNothingSyncedYet => 'Пока ничего не синхронизировано';

  @override
  String get printfulMerchNoMerchAvailable => 'Мерч пока недоступен';

  @override
  String get printfulMerchSyncHint =>
      'Синхронизируйте свой магазин Printful, чтобы загрузить каталог товаров';

  @override
  String get printfulMerchCheckBackLater =>
      'Загляните позже за мерчем от этого сервера';

  @override
  String get printfulMerchOutOfStock => 'Нет в наличии';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'От $price • $count варианта',
      many: 'От $price • $count вариантов',
      few: 'От $price • $count варианта',
      one: 'От $price • $count вариант',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'Просмотреть';

  @override
  String printfulMerchPayoutTo(String username) {
    return 'Выплата: $username';
  }

  @override
  String get printfulMerchPayoutToYou => 'Выплата: вам';

  @override
  String get printfulMerchPayoutChangeButton => 'Изменить';

  @override
  String get printfulMerchPayoutDialogTitle => 'Получатель выплаты';

  @override
  String get printfulMerchPayoutDialogBody =>
      'Направьте долю выручки от этого товара другому пользователю вместо себя -- ему нужно будет подключить собственный аккаунт Stripe и завершить регистрацию, прежде чем кто-либо сможет его купить.';

  @override
  String get printfulMerchPayoutUsernameHint => 'Имя пользователя';

  @override
  String get printfulMerchPayoutLookupButton => 'Найти';

  @override
  String get printfulMerchPayoutUserNotFound =>
      'Пользователь с таким именем не найден.';

  @override
  String printfulMerchPayoutResolvedAs(String username) {
    return 'Найдено: $username';
  }

  @override
  String get printfulMerchPayoutResetButton => 'Сбросить на себя';

  @override
  String get printfulMerchCartTooltip => 'Корзина';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productName добавлен в корзину';
  }

  @override
  String get printfulMerchQuantityLabel => 'Количество';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Уменьшить количество';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Увеличить количество';

  @override
  String get printfulMerchAddToCartButton => 'Добавить в корзину';

  @override
  String get printfulMerchOptionLabel => 'Вариант';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Стиль';

  @override
  String get printfulMerchSizeLabel => 'Размер';

  @override
  String get printfulMerchYourCartTitle => 'Ваша корзина';

  @override
  String get printfulMerchCartEmpty => 'Ваша корзина пуста.';

  @override
  String get printfulMerchSubtotalLabel => 'Промежуточный итог';

  @override
  String get printfulMerchCheckoutLabel => 'Оформить заказ';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'Удалить из корзины';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Сначала заполните адрес доставки.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'Не удалось получить стоимость доставки для этого адреса.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'Не удалось начать оформление заказа. Попробуйте ещё раз через минуту.';

  @override
  String get printfulMerchOrderPlaced => 'Заказ оформлен!';

  @override
  String get printfulMerchOrderPending =>
      'Всё ещё ожидаем оплату -- заказ будет оформлен после завершения.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Скорость доставки';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max рабочих дней';
  }

  @override
  String get printfulMerchGetShippingQuoteButton =>
      'Рассчитать стоимость доставки';

  @override
  String get printfulMerchPayButton => 'Оплатить';

  @override
  String get kodaMarketplaceTitle => 'Маркетплейс Koda';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Подписки';

  @override
  String get kodaMarketplaceTabBoosts => 'Бусты';

  @override
  String get kodaMarketplaceTabDiscover => 'Обзор';

  @override
  String get kodaMarketplaceTierFreeName => 'Бесплатно';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'Истекает $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks =>
      'Улучшите подписку ради эксклюзивных преимуществ';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count токена буста доступно',
      many: '$count токенов бустов доступно',
      few: '$count токена буста доступно',
      one: '$count токен буста доступен',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Подарите токен любому серверу, в котором вы состоите, во вкладке «Банк сервера»';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame =>
      'Пользовательская рамка аватара';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Значок Spark в профиле';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Увеличенный лимит загрузки файлов (50 МБ)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality =>
      'Приоритетное качество голоса';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'Всё из Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame =>
      'Анимированная рамка аватара';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Значок Pulse в профиле';

  @override
  String get kodaMarketplacePulsePerkFileLimit =>
      'Лимит загрузки файлов 100 МБ';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      '1 токен буста сервера в месяц';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/мес';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Текущий план';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'Получить $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return 'Подарить $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return 'Подарить $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'Подписаться на $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel => 'Имя пользователя получателя:';

  @override
  String get kodaMarketplaceUsernameHint => 'Имя пользователя';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Подписка';

  @override
  String get kodaMarketplaceTotalLabel => 'Итого';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Платёж надёжно обрабатывается через Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'Перейти к оплате';

  @override
  String get kodaMarketplaceUserNotFound => 'Пользователь не найден';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'Не удалось начать оформление заказа. Попробуйте ещё раз через минуту.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'Подписка активна!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'Всё ещё ожидаем оплату -- активируется после завершения.';

  @override
  String get kodaMarketplaceBoostPurchased => 'Буст куплен!';

  @override
  String get kodaMarketplaceBoostPending =>
      'Всё ещё ожидаем оплату -- будет готово после завершения.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count доступно';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Купить буст';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'Разовая покупка -- подписчики Pulse также получают один бесплатный токен при каждом продлении, что остаётся более выгодным вариантом при регулярном использовании бустов.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Купить буст -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Пока ни один сервер не подключился к Маркетплейсу Koda. Владельцы серверов могут включить это в настройках оформления своего сервера.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader =>
      'РЕКОМЕНДУЕМОЕ НА ЭТОЙ НЕДЕЛЕ';

  @override
  String get kodaMarketplaceAllListedServersHeader => 'ВСЕ РАЗМЕЩЁННЫЕ СЕРВЕРЫ';

  @override
  String get kodaMarketplaceFeaturedItemsHeader => 'РЕКОМЕНДУЕМЫЕ ТОВАРЫ';

  @override
  String get kodaMarketplaceAllItemsHeader => 'ВСЕ ТОВАРЫ';

  @override
  String get kodaMarketplaceServerFallback => 'Сервер';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count участника',
      many: '$count участников',
      few: '$count участника',
      one: '$count участник',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceVisitStore => 'Перейти в магазин';

  @override
  String get calendarFallbackTitle => 'Календарь';

  @override
  String get calendarAskVispTooltip => 'Спросить Visp';

  @override
  String get calendarCreateEventTooltip => 'Создать событие';

  @override
  String get calendarPreviousMonthTooltip => 'Предыдущий месяц';

  @override
  String get calendarNextMonthTooltip => 'Следующий месяц';

  @override
  String get calendarTodayButton => 'Сегодня';

  @override
  String get calendarWeekdaySun => 'Вс';

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
  String get calendarTodaySuffix => ', сегодня';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count события',
      many: ', $count событий',
      few: ', $count события',
      one: ', $count событие',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'Выберите день';

  @override
  String get calendarNoEvents => 'Нет событий';

  @override
  String get calendarSubscribeTooltip => 'Подписаться';

  @override
  String get calendarUnsubscribeTooltip => 'Отписаться';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'Повторяется: $recurrence';
  }

  @override
  String get calendarTicketOwned => 'Билет уже есть';

  @override
  String calendarTicketPrice(String price) {
    return 'Билет: $price';
  }

  @override
  String get calendarDeleteEventTitle => 'Удалить событие';

  @override
  String calendarDeleteEventConfirm(String title) {
    return 'Удалить «$title»? Это действие необратимо.';
  }

  @override
  String get calendarEditEventTitle => 'Изменить событие';

  @override
  String get calendarCreateEventTitle => 'Создать событие';

  @override
  String get calendarEventTitleHint => 'Название события';

  @override
  String get calendarDescriptionHint => 'Описание (необязательно)';

  @override
  String get calendarLocationHint => 'Место (необязательно)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Начало ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Дата и время начала, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'Окончание — необязательно ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'Дата и время окончания, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'не задано';

  @override
  String get calendarTapToSetEndTime => 'Нажмите, чтобы задать время окончания';

  @override
  String get calendarRecurrenceLabel => 'Повторение';

  @override
  String get calendarRecurrenceNone => 'Не повторяется';

  @override
  String get calendarRecurrenceDaily => 'Ежедневно';

  @override
  String get calendarRecurrenceWeekly => 'Еженедельно';

  @override
  String get calendarRecurrenceMonthly => 'Ежемесячно';

  @override
  String get calendarColorLabel => 'Цвет';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Цвет $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Цена билета — необязательно';

  @override
  String get calendarLinkStageChannelLabel =>
      'Привязать к сцене-каналу — необязательно';

  @override
  String get calendarStageChannelFallback => 'сцена';

  @override
  String get discordImportFetchError => 'Не удалось загрузить шаблон.';

  @override
  String get discordImportApplyError =>
      'Не удалось применить шаблон. Попробуйте ещё раз.';

  @override
  String get discordImportTitle => 'Импорт шаблона Discord';

  @override
  String get discordImportDescription =>
      'Вставьте ссылку discord.new или код шаблона, чтобы импортировать роли, категории и каналы в этот сервер.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 или код шаблона';

  @override
  String get discordImportPreviewButton => 'Предпросмотр';

  @override
  String get discordImportTemplateFallback => 'Шаблон';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count роли',
      many: '$count ролей',
      few: '$count роли',
      one: '$count роль',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count категории',
      many: '$count категорий',
      few: '$count категории',
      one: '$count категория',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count канала',
      many: '$count каналов',
      few: '$count канала',
      one: '$count канал',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel =>
      'ЗАМЕНИТЬ СУЩЕСТВУЮЩУЮ СТРУКТУРУ';

  @override
  String get discordImportReplaceWarning =>
      'Все существующие каналы, категории и роли будут безвозвратно удалены.';

  @override
  String get discordImportAddDescription =>
      'Шаблон будет добавлен к существующей структуре вашего сервера.';

  @override
  String get discordImportReplaceConfirmTitle => 'Заменить структуру сервера?';

  @override
  String get discordImportReplaceConfirmBody =>
      'Это безвозвратно удалит ВСЕ существующие каналы, категории и роли перед импортом. Это действие необратимо.';

  @override
  String get discordImportYesReplace => 'Да, заменить';

  @override
  String get discordImportReplaceAndImportButton =>
      'Заменить и импортировать шаблон';

  @override
  String get discordImportAddToServerButton => 'Добавить шаблон на сервер';

  @override
  String get thresholdModConfigureTitle => 'Настройка пороговой модерации';

  @override
  String get thresholdModConfigureExplanation =>
      'Выберите доверенных модераторов и то, сколько из них должны согласиться, прежде чем любой из них сможет расшифровать одну эпоху истории канала. Даже у вас нет единоличного ключа -- вы исключены, только если тоже входите в этот список.';

  @override
  String get thresholdModThresholdLabel => 'Порог:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Уменьшить порог';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Увеличить порог';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'из $count модератора',
      many: 'из $count модераторов',
      few: 'из $count модераторов',
      one: 'из $count модератора',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle =>
      'Запрос на пороговую расшифровку';

  @override
  String get thresholdModChannelLabel => 'Канал';

  @override
  String get thresholdModReasonHint =>
      'Причина -- будет показана каждому назначенному модератору';

  @override
  String get thresholdModRequestButton => 'Запросить';

  @override
  String get thresholdModShareRelayed => 'Доля передана запрашивающему.';

  @override
  String get thresholdModNotEnoughShares =>
      'Пока недостаточно переданных долей -- попробуйте снова, когда больше модераторов передадут свои.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сообщения',
      many: '$count сообщений',
      few: '$count сообщения',
      one: '$count сообщение',
    );
    return 'Эпоха $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'В этой эпохе нет сообщений, доступных для расшифровки.';

  @override
  String get thresholdModExplanation =>
      'Настоящая расшифровка истории канала, доступная только при активном согласии нескольких назначенных модераторов -- никогда одним человеком, даже владельцем сервера. Всегда разблокирует только одну целую эпоху (всё, отправленное с последнего изменения состава участников), никогда одно отдельное сообщение.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Включено -- модераторов: $count, порог: $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'Не настроено';

  @override
  String get thresholdModReconfigureButton => 'Перенастроить';

  @override
  String get thresholdModEnableButton => 'Включить';

  @override
  String get thresholdModNotEnabledForServer =>
      'Пороговая модерация не включена для этого сервера.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Включено для этого сервера. Вы не входите в число назначенных модераторов.';

  @override
  String get thresholdModRequestsLabel => 'Запросы';

  @override
  String get thresholdModRequestDecryptButton => 'Запросить расшифровку';

  @override
  String get thresholdModNoActiveRequests => 'Нет активных запросов.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- эпоха $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'ожидание';

  @override
  String get thresholdModStatusApproved => 'одобрено';

  @override
  String get thresholdModApproveButton => 'Одобрить';

  @override
  String get thresholdModRelayShareButton => 'Передать свою долю';

  @override
  String get thresholdModTryReconstructButton => 'Попробовать восстановить';

  @override
  String get roleSelectNoRolesAvailable =>
      'Нет доступных ролей для самостоятельного назначения.';

  @override
  String get roleSelectInstructions =>
      'Выберите нужные роли. Нажмите на роль, чтобы добавить или убрать её.';

  @override
  String get rulesScreenAcceptError =>
      'Не удалось принять правила. Попробуйте снова.';

  @override
  String get rulesScreenSubtitle => 'Правила сервера';

  @override
  String get rulesScreenScrollToRead =>
      'Прокрутите вниз, чтобы прочитать все правила';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'Нажимая «Принять», вы соглашаетесь соблюдать эти правила.\nНарушения могут привести к удалению с сервера.';

  @override
  String get rulesScreenAcceptButton => 'Я принимаю правила';

  @override
  String get rulesScreenReadAllToContinue =>
      'Прочитайте все правила, чтобы продолжить';

  @override
  String get galleryNewPostTitle => 'Новый пост';

  @override
  String get galleryChooseFileButton => 'Выбрать файл';

  @override
  String get galleryOrDivider => 'или';

  @override
  String get galleryPasteUrlHint => 'Вставьте ссылку на изображение/видео';

  @override
  String get galleryTypeLabel => 'Тип';

  @override
  String get galleryImageOption => 'Изображение';

  @override
  String get galleryVideoOption => 'Видео';

  @override
  String get galleryCaptionHint => 'Подпись (необязательно)';

  @override
  String get galleryPostButton => 'Опубликовать';

  @override
  String get galleryNewCollectionTitle => 'Новая коллекция';

  @override
  String get galleryCollectionNameHint => 'Название коллекции';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return 'Удалить «$collectionName»? Посты внутри станут неразмещёнными в коллекции.';
  }

  @override
  String get galleryFeedTab => 'Лента';

  @override
  String get galleryCollectionsTab => 'Коллекции';

  @override
  String get galleryNoPostsYet => 'Пока нет постов';

  @override
  String get galleryNoCollectionsYet => 'Пока нет коллекций';

  @override
  String get gallerySelectACollection => 'Выберите коллекцию';

  @override
  String get galleryNoPostsInCollection => 'В этой коллекции нет постов';

  @override
  String get galleryAddPostButton => 'Добавить пост';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Не удалось начать демонстрацию экрана: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return 'Громкость $username';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'Влияет только на то, что слышите вы -- на этом устройстве, в этом звонке.';

  @override
  String get voiceScreenResetVolumeButton => 'Сбросить';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'Не удалось подключиться: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Ваш экран, нажмите для просмотра в полноэкранном режиме';

  @override
  String get voiceScreenYourScreenLabel => 'Ваш экран';

  @override
  String get voiceScreenTapToClose => 'Нажмите, чтобы закрыть';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (вы)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', говорит';

  @override
  String get voiceScreenCameraOnSuffix => ', камера включена';

  @override
  String get voiceScreenActivateToPopOut =>
      ', активируйте, чтобы открыть в отдельном окне';

  @override
  String get voiceScreenShowVarmTooltip => 'Показать VARM';

  @override
  String get voiceScreenHideVarmTooltip => 'Скрыть VARM';

  @override
  String get voiceScreenShowChatTooltip => 'Показать чат';

  @override
  String get voiceScreenHideChatTooltip => 'Скрыть чат';

  @override
  String get voiceScreenStartCameraTooltip => 'Включить камеру';

  @override
  String get voiceScreenStopCameraTooltip => 'Выключить камеру';

  @override
  String get voiceScreenShareScreenTooltip => 'Демонстрация экрана';

  @override
  String get voiceScreenStopSharingTooltip => 'Остановить показ';

  @override
  String get voiceScreenPopOutTooltip => 'Открыть голос в отдельном окне';

  @override
  String get voiceScreenCouldNotPopOut =>
      'Не удалось открыть голос в отдельном окне.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Покинуть голосовой канал';

  @override
  String get voiceScreenPinTooltip => 'Закрепить (не закрывать)';

  @override
  String get voiceScreenUnpinTooltip => 'Открепить';

  @override
  String get voiceScreenSizeSmall => 'Маленький (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Средний (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Большой (640x360)';

  @override
  String get voiceScreenSizeXl => 'Очень большой (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, подключено: $count';
  }

  @override
  String get voiceBarSpeakingSuffix => ', вы говорите';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return 'Подключено: $count · нажмите, чтобы развернуть';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Включить камеру';

  @override
  String get voiceBarStopCameraTooltip => 'Выключить камеру';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Покинуть голосовой канал';

  @override
  String get popOutVideoFallbackTitle => 'Голос';

  @override
  String get popOutVideoMissingTokenError => 'Отсутствует токен или URL';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Время ожидания подключения истекло через 15 секунд';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'Нет участников';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Сцена';

  @override
  String get stageCouldNotJoin => 'Не удалось присоединиться к сцене.';

  @override
  String get stageThisStageFallback => 'Эта сцена';

  @override
  String get stageRequiresTicketToJoin => 'требует билет для входа';

  @override
  String get stagePleaseWaitLabel => 'Пожалуйста, подождите...';

  @override
  String get stageGetFreeTicketButton => 'Получить бесплатный билет';

  @override
  String stageBuyTicketButton(String price) {
    return 'Купить билет -- $price';
  }

  @override
  String get stageNotNowButton => 'Не сейчас';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'Не удалось начать покупку билета.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'Всё ещё ожидаем оплату -- попробуйте зайти снова, когда она подтвердится.';

  @override
  String get stageSpeakerBadge => 'Спикер';

  @override
  String get stageListenerBadge => 'Слушатель';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'Не удалось присоединиться: $error';
  }

  @override
  String get stageSpeakersHeader => 'СПИКЕРЫ';

  @override
  String get stageRaisedHandsHeader => 'ПОДНЯТЫЕ РУКИ';

  @override
  String get stageAllowButton => 'Разрешить';

  @override
  String get stageIgnoreButton => 'Игнорировать';

  @override
  String get stageListenersHeader => 'СЛУШАТЕЛИ';

  @override
  String get stageRaiseHandTooltip => 'Поднять руку';

  @override
  String get stageLowerHandTooltip => 'Опустить руку';

  @override
  String get stageLeaveStageTooltip => 'Покинуть сцену';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (вы)';
  }

  @override
  String get stageMoveToListenersButton => 'Переместить в слушатели';

  @override
  String get stageYouFallbackName => 'Вы';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'Аватар $username';
  }

  @override
  String get channelEditDialogNewTitle => 'Новый канал';

  @override
  String get channelEditDialogEditTitle => 'Изменить канал';

  @override
  String get channelEditDialogNameHint => 'Название канала';

  @override
  String get channelEditDialogDescriptionHint => 'Тема (необязательно)';

  @override
  String get channelEditDialogTypeLabel => 'Тип';

  @override
  String get channelEditDialogTypeText => 'Текстовый';

  @override
  String get channelEditDialogTypeVoice => 'Голосовой';

  @override
  String get channelEditDialogTypeGallery => 'Галерея';

  @override
  String get channelEditDialogTypeStage => 'Сцена';

  @override
  String get channelEditDialogTypeRules => 'Правила';

  @override
  String get channelEditDialogTypeRoleSelection => 'Выбор роли';

  @override
  String get channelEditDialogTypeCalendar => 'Календарь';

  @override
  String get channelEditDialogAnnouncementTitle => 'Канал объявлений';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Публиковать могут только участники с правом управления сообщениями';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Публиковать здесь анонсы прямых трансляций и загрузок';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'Публикуется автоматически, когда участник с правом «Анонс при трансляции» начинает трансляцию на Twitch или публикует новое видео на YouTube';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Уведомлять эти роли при публикации (необязательно)';

  @override
  String get channelEditDialogSlowmodeLabel => 'Медленный режим';

  @override
  String get channelEditDialogSlowmodeOff => 'Выключено';

  @override
  String get channelEditDialogUserLimitLabel => 'Лимит участников';

  @override
  String get channelEditDialogUserLimitOff => 'Без лимита';

  @override
  String get channelEditDialogCategoryLabel => 'Категория';

  @override
  String get channelEditDialogNoCategory => 'Без категории';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Доступ по ролям (оставьте пустым для всех)';

  @override
  String get channelEditDialogContentLabelsLabel => 'Метки контента';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Отмечает этот канал для фильтров контента участников; жёстко заблокирован для подопечных аккаунтов';

  @override
  String get categoryEditDialogNewTitle => 'Новая категория';

  @override
  String get categoryEditDialogEditTitle => 'Изменить категорию';

  @override
  String get categoryEditDialogNameHint => 'Название категории';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Доступ по ролям (оставьте пустым для всех)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Участники — $count онлайн';
  }

  @override
  String get memberPanelRefreshTooltip => 'Обновить список участников';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count участника',
      many: '$count участников',
      few: '$count участника',
      one: '$count участник',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Не в сети';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', уровень $tier';
  }

  @override
  String get memberPanelUnknownUser => 'Неизвестно';

  @override
  String get memberPanelModerationActionsTooltip => 'Действия модерации';

  @override
  String get reportDialogReasonSpam => 'Спам';

  @override
  String get reportDialogReasonHarassment => 'Домогательства или оскорбления';

  @override
  String get reportDialogReasonIllegal => 'Незаконный контент';

  @override
  String get reportDialogReasonOther => 'Другое';

  @override
  String get reportDialogReasonLabel => 'Причина';

  @override
  String get reportDialogNoteHint =>
      'Что-нибудь ещё, что должны знать модераторы? (необязательно)';

  @override
  String get reportDialogDisclosureNote =>
      'Содержимое сообщения, которое видите вы, и его отправитель будут переданы модераторам этого сервера.';

  @override
  String get reportDialogSubmitButton => 'Отправить жалобу';

  @override
  String get reportDialogSubmitError => 'Не удалось отправить жалобу.';

  @override
  String get notificationBellTitle => 'Уведомления';

  @override
  String get notificationBellMarkAllRead => 'Отметить все как прочитанные';

  @override
  String get notificationBellEmptyState => 'Пока нет уведомлений';

  @override
  String get notificationBellUnreadLabel => 'Непрочитано';

  @override
  String get invitePreviewTitle => 'Приглашение на сервер';

  @override
  String get invitePreviewInvalidOrExpired =>
      'Недействительное или истёкшее приглашение.';

  @override
  String get invitePreviewCouldNotJoin =>
      'Не удалось присоединиться к серверу.';

  @override
  String get invitePreviewUnknownServer => 'Неизвестный сервер';

  @override
  String get shippingAddressFullNameHint => 'Полное имя';

  @override
  String get shippingAddressLine1Hint => 'Адрес, строка 1';

  @override
  String get shippingAddressLine2Hint => 'Адрес, строка 2 (необязательно)';

  @override
  String get shippingAddressCityHint => 'Город';

  @override
  String get shippingAddressStateHint => 'Область/штат';

  @override
  String get shippingAddressZipHint => 'Индекс / почтовый код';

  @override
  String get shippingAddressCountryCodeHint => 'Код страны (например, US)';

  @override
  String get shippingAddressPhoneHint => 'Телефон (необязательно)';

  @override
  String get shippingAddressPrivacyNote =>
      'Используется только для доставки этого заказа -- о том, как эти данные обрабатываются после оформления заказа, смотрите в политике конфиденциальности Printful.';

  @override
  String get updateNudgeAvailableTitle => 'Доступно обновление';

  @override
  String get updateNudgeRequiredTitle => 'Требуется обновление';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Доступна версия Koda $version -- у вас установлена более старая сборка.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'Эта сборка больше не поддерживается. Обновитесь до Koda $version, чтобы продолжить пользоваться Koda.';
  }

  @override
  String get updateNudgeLaterButton => 'Позже';

  @override
  String get tierBadgeSparkSubscriber => 'Подписчик Spark';

  @override
  String get tierBadgePulseSubscriber => 'Подписчик Pulse';

  @override
  String get tierBadgeAlphaSpark => 'Alpha Spark';

  @override
  String get tierBadgeFounder => 'Founder';

  @override
  String get foundersHallTitle => 'Зал основателей';

  @override
  String get foundersHallSubtitle =>
      'Самые первые бэкеры, которые сделали Koda возможной.';

  @override
  String get foundersHallEmptyState => 'Пока нет основателей.';

  @override
  String get settingsFoundersHallTitle => 'Зал основателей';

  @override
  String get settingsFoundersHallSubtitle => 'Узнайте, кто помог создать Koda';

  @override
  String get vispAvatarInDevelopment => 'В РАЗРАБОТКЕ';

  @override
  String get vispBoostAdvisorCouldNotAnswer => 'Visp не смог составить ответ.';

  @override
  String get vispBoostAdvisorTitle =>
      'Спросить Visp: Советник по окупаемости бустов';

  @override
  String get vispBoostAdvisorFollowUpHint => 'Задайте уточняющий вопрос...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Отправить';

  @override
  String get vispBoostAdvisorBasedOn => 'На основе:';

  @override
  String get vispEventDialogCouldNotGenerate => 'Visp не смог создать событие.';

  @override
  String get vispEventDialogCouldNotCreate => 'Не удалось создать это событие.';

  @override
  String get vispEventDialogRecurrenceNone => 'Разово';

  @override
  String get vispEventDialogRecurrenceDaily => 'Повторяется ежедневно';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Повторяется еженедельно';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Повторяется ежемесячно';

  @override
  String get vispEventDialogTitle => 'Попросить Visp создать событие';

  @override
  String get vispEventDialogDescription =>
      'Опишите событие -- Visp предложит название, дату/время и другие детали.';

  @override
  String get vispEventDialogPromptHint =>
      'например, «Еженедельная сессия D&D каждую пятницу в 19:00 примерно на 3 часа»';

  @override
  String get vispEventDialogPrivacyNote =>
      'Ваше описание отправляется Visp (самостоятельно размещаемому помощнику -- ничего не покидает серверы Koda) для составления этого плана.';

  @override
  String get vispEventDialogStartOver => 'Начать заново';

  @override
  String get vispEventDialogCreateEvent => 'Создать событие';

  @override
  String get vispEventDialogThinking => 'Думаю...';

  @override
  String get vispEventDialogGeneratePlan => 'Сгенерировать план';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'Не удалось распознать дату -- попробуйте перефразировать';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Заканчивается $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price за билет';
  }

  @override
  String get vispEventDialogBasedOn => 'На основе:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Вопрос $questionNumber из $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'Или введите свой ответ...';

  @override
  String get vispQuestionStepSendTooltip => 'Отправить';

  @override
  String get vispQuestionStepSkip => 'Пропустить и сгенерировать сейчас';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp не смог создать план.';

  @override
  String get vispSetupDialogCouldNotApplyPlan =>
      'Не удалось применить этот план.';

  @override
  String get vispSetupDialogTitleNew => 'Опишите свой сервер для Visp';

  @override
  String get vispSetupDialogTitleExisting =>
      'Попросить Visp добавить что-то в этот сервер';

  @override
  String get vispSetupDialogDescriptionNew =>
      'Опишите желаемый сервер -- Visp предложит название и набор ролей, категорий и каналов.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Опишите, что вы хотите добавить -- Visp предложит роли, категории и каналы для создания.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'например, «Уютный сервер для моей группы D&D с голосовыми каналами для двух столов»';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'например, «Добавь ещё несколько каналов для наших рейдовых команд»';

  @override
  String get vispSetupDialogPrivacyNote =>
      'Ваше описание отправляется Visp (самостоятельно размещаемому помощнику -- ничего не покидает серверы Koda) для составления этого плана.';

  @override
  String get vispSetupDialogStartOver => 'Начать заново';

  @override
  String get vispSetupDialogCreateServer => 'Создать сервер';

  @override
  String get vispSetupDialogAddToServer => 'Добавить на сервер';

  @override
  String get vispSetupDialogThinking => 'Думаю...';

  @override
  String get vispSetupDialogGeneratePlan => 'Сгенерировать план';

  @override
  String get vispSetupDialogNewServerLabel => 'Новый сервер';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count роли',
      many: '$count ролей',
      few: '$count роли',
      one: '$count роль',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count категории',
      many: '$count категорий',
      few: '$count категории',
      one: '$count категория',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count канала',
      many: '$count каналов',
      few: '$count канала',
      one: '$count канал',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'На основе:';

  @override
  String get childLockoutTitle => 'Сейчас вне разрешённых часов';

  @override
  String get childLockoutBody =>
      'Родитель или опекун установил время, когда можно пользоваться Koda. Попросите у них больше времени или зайдите снова в следующем разрешённом окне.';

  @override
  String get childLockoutLogOutButton => 'Выйти';

  @override
  String get forcePasswordChangeError =>
      'Не удалось обновить пароль. Попробуйте снова.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Добро пожаловать, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Для продолжения вашей учётной записи требуется новый пароль.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'Новый пароль';

  @override
  String get forcePasswordChangeConfirmPasswordHint =>
      'Подтвердите новый пароль';

  @override
  String get forcePasswordChangeReqLength => 'Не менее 12 символов';

  @override
  String get forcePasswordChangeReqUpper => 'Одна заглавная буква';

  @override
  String get forcePasswordChangeReqLower => 'Одна строчная буква';

  @override
  String get forcePasswordChangeReqDigit => 'Одна цифра';

  @override
  String get forcePasswordChangeReqMatch => 'Пароли совпадают';

  @override
  String get forcePasswordChangeSubmitButton => 'Задать новый пароль';

  @override
  String get forgotPasswordEnterEmailError =>
      'Введите ваш адрес электронной почты.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'Если такой аккаунт существует, код сброса был отправлен.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Введите код и пароль не менее 8 символов.';

  @override
  String get forgotPasswordInvalidCode => 'Неверный или истёкший код.';

  @override
  String get forgotPasswordTitle => 'Сброс пароля';

  @override
  String get forgotPasswordEmailHint => 'Адрес электронной почты';

  @override
  String get forgotPasswordSendCodeButton => 'Отправить код сброса';

  @override
  String get forgotPasswordCodeHint => '6-значный код';

  @override
  String get forgotPasswordNewPasswordHint => 'Новый пароль';

  @override
  String get forgotPasswordSetNewPasswordButton => 'Установить новый пароль';

  @override
  String get verifyEmailEnterCodeError =>
      'Введите 6-значный код из вашей электронной почты.';

  @override
  String get verifyEmailInvalidCode => 'Неверный или истёкший код.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'Новый код был отправлен на $email.';
  }

  @override
  String get verifyEmailResendFailed => 'Не удалось отправить повторно сейчас.';

  @override
  String get verifyEmailTitle => 'Проверьте вашу почту';

  @override
  String verifyEmailSentCode(String email) {
    return 'Мы отправили 6-значный код на $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'Подтвердить email';

  @override
  String get verifyEmailResendButton => 'Отправить код повторно';

  @override
  String get safetyNumberKeysNotSetUp =>
      'Ваши собственные ключи ещё не настроены.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return 'У $peerName пока нет набора ключей.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'Не удалось вычислить номер безопасности: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return 'У $peerName больше нет этого устройства.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'Номер безопасности с $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Сравните этот номер с $peerName через другой канал связи -- лично, по телефону, где угодно, кроме этого чата. Если он совпадает с обеих сторон, вы общаетесь с тем, с кем думаете.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return 'У $peerName $count устройств(а), у каждого свой номер безопасности -- проверка одного не покрывает остальные.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Устройство $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Отметить как проверенное';

  @override
  String get contentFiltersDescription =>
      'Серверы могут помечать каналы метками контента. Выберите, как должны вести себя помеченные каналы -- это только ваша личная настройка, она никак не влияет на то, что видят другие.';

  @override
  String get contentFiltersLabelAdult => 'Контент для взрослых';

  @override
  String get contentFiltersLabelSuggestive => 'Провокационный контент';

  @override
  String get contentFiltersLabelGraphic => 'Шокирующие материалы';

  @override
  String get contentFiltersLabelNudity => 'Несексуальная нагота';

  @override
  String get contentFiltersDescAdult => 'Сексуально откровенный контент';

  @override
  String get contentFiltersDescSuggestive =>
      'Сексуально провокационный, но не откровенный контент';

  @override
  String get contentFiltersDescGraphic => 'Насилие или жестокость';

  @override
  String get contentFiltersDescNudity => 'Нагота вне сексуального контекста';

  @override
  String get contentFiltersHide => 'Скрыть';

  @override
  String get contentFiltersWarn => 'Предупреждать';

  @override
  String get contentFiltersShow => 'Показывать';

  @override
  String get deviceTestCouldNotGetToken =>
      'Не удалось получить тестовый токен.';

  @override
  String get deviceTestLabelTest => 'Тест';

  @override
  String get deviceTestLabelRecording => 'Идёт запись...';

  @override
  String get deviceTestLabelPlayingBack => 'Воспроизведение...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'Не удалось включить камеру: $error';
  }

  @override
  String get deviceTestTitle => 'Тест устройств';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'Не удалось подключиться: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Микрофон';

  @override
  String get deviceTestHearYourselfLabel => 'Слышать себя (с задержкой)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Динамик / Вывод звука';

  @override
  String get deviceTestCameraLabel => 'Камера';

  @override
  String get deviceTestSystemDefault => 'По умолчанию в системе';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Говорите, затем услышите воспроизведение $seconds-секундного отрывка';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '$seconds с';
  }

  @override
  String get deviceTestCameraPreviewOff => 'Предпросмотр камеры выключен';

  @override
  String get deviceTestStopCameraButton => 'Остановить тест камеры';

  @override
  String get deviceTestTestCameraButton => 'Протестировать камеру';

  @override
  String get deviceTestInputLevelLabel => 'Уровень входного сигнала';

  @override
  String get devicesScreenRemoveConfirmTitle => 'Удалить это устройство?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'Ему потребуется войти снова, и любые сообщения, отправленные на него во время удаления, не дойдут после -- сессии Double Ratchet не восполняют пропуски задним числом.';

  @override
  String get devicesScreenRemoveFailed => 'Не удалось удалить это устройство.';

  @override
  String get devicesScreenNeverActive => 'Никогда не использовалось';

  @override
  String devicesScreenActiveDate(String date) {
    return 'Активно $date';
  }

  @override
  String get devicesScreenDescription =>
      'У каждого устройства, в которое вы входите, своя идентичность шифрования -- сообщение, отправленное вам, доходит до каждого устройства ниже. Удалите то, которым не пользуетесь или не узнаёте.';

  @override
  String get devicesScreenNoDevicesFound => 'Устройства не найдены.';

  @override
  String get devicesScreenUnknownDevice => 'Неизвестное устройство';

  @override
  String get devicesScreenThisDeviceBadge => 'Это устройство';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Удалить устройство';

  @override
  String get totpSetupInvalidCode => 'Неверный код. Попробуйте снова.';

  @override
  String get totpSetupEnabledMessage =>
      'Двухфакторная аутентификация включена.';

  @override
  String get totpSetupScanInstructions =>
      'Отсканируйте этот секретный ключ в своём приложении-аутентификаторе (Google Authenticator, 1Password, Authy):';

  @override
  String get totpSetupCodeHint => 'Введите 6-значный код для подтверждения';

  @override
  String get totpSetupVerifyButton => 'Подтвердить и включить';

  @override
  String get voiceVideoSettingsPushToTalkLabel =>
      'Push-to-Talk (нажми, чтобы говорить)';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'Нажмите любую клавишу, чтобы назначить...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Тест устройств';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Обработка голоса';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'Подавление шума';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Снижает фоновый шум на вашем микрофоне';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Глубокое подавление шума (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'Подавление шума с помощью ИИ в реальном времени, сильнее стандартного -- заменяет его при включении';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'Подавление эха';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Предотвращает эхо от вашего собственного звука';

  @override
  String get voiceVideoSettingsAutoGainTitle =>
      'Автоматическая регулировка усиления';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Автоматически балансирует громкость микрофона (нормализация громкости)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'Авто-приглушение';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Снижает громкость других участников, пока вы говорите';

  @override
  String get voiceVideoSettingsHighPassTitle => 'Фильтр высоких частот';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Убирает низкочастотный гул (вентиляторы, кондиционер, стук по столу)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle => 'Обнаружение звука печати';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Подавляет стук клавиатуры, улавливаемый микрофоном';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Изоляция голоса';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Фокусируется на вашем голосе, отфильтровывая других людей и звуки рядом';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Усиление микрофона';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Включить усиление';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Предусиление для тихого или удалённого микрофона -- применяется до эквалайзера';

  @override
  String get voiceVideoSettingsBandBoost => 'Усиление';

  @override
  String get voiceVideoSettingsSectionMicEq => 'Эквалайзер микрофона';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'Включить эквалайзер';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Формирует звук вашего микрофона до того, как он дойдёт до других';

  @override
  String get voiceVideoSettingsBandBass => 'Низкие';

  @override
  String get voiceVideoSettingsBandMid => 'Средние';

  @override
  String get voiceVideoSettingsBandTreble => 'Высокие';

  @override
  String get voiceVideoSettingsSectionVad =>
      'Определение голосовой активности (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'Включить VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Передавать звук, только когда вы действительно говорите';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Чувствительность';

  @override
  String get voiceVideoSettingsVadHint =>
      'Ниже = улавливает более тихие звуки. Выше = передачу запускает только более громкая речь.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Назначенная клавиша';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'Не задано — микрофон остаётся активным всегда, когда не выключен';

  @override
  String get voiceVideoSettingsClearButton => 'Очистить';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Назначить клавишу';

  @override
  String get voiceVideoSettingsChangeButton => 'Изменить';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'Когда клавиша назначена, ваш микрофон передаёт звук только пока вы удерживаете эту клавишу. Это имеет приоритет над VOX, пока вы находитесь в голосовом канале.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Виртуальная реактивная модель аватара';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Загрузите два изображения, которые меняются местами, когда вы говорите. Видно только вам.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'Молчание';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'Разговор';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'Порог речи';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Ниже = переключение на изображение разговора происходит легче.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'Удалить VARM';

  @override
  String get gifPickerNoGifsFound => 'GIF не найдены';

  @override
  String get gifPickerSearchHint => 'Поиск GIF...';

  @override
  String get messageSearchHint => 'Поиск в этом канале...';

  @override
  String get messageSearchTooltip => 'Поиск';

  @override
  String get messageSearchInitialHint =>
      'Ищет среди сообщений, уже загруженных на это устройство -- более старая история подгружается (и расшифровывается локально) по мере того, как вы просматриваете дальше назад.';

  @override
  String get messageSearchNoMatches => 'Совпадений нет';

  @override
  String get messageSearchStartOfHistory => 'Начало истории канала';

  @override
  String get messageSearchFurtherBackButton => 'Искать дальше в истории';

  @override
  String get messageSearchUnknownAuthor => 'Неизвестно';
}
