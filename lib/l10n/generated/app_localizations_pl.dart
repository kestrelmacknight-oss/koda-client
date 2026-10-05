// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get commonSave => 'Zapisz';

  @override
  String get commonEdit => 'Edytuj';

  @override
  String get commonDelete => 'Usuń';

  @override
  String get commonCreate => 'Utwórz';

  @override
  String get commonClose => 'Zamknij';

  @override
  String get commonDone => 'Gotowe';

  @override
  String get commonDownload => 'Pobierz';

  @override
  String get commonDisconnect => 'Rozłącz';

  @override
  String get commonNone => 'Brak';

  @override
  String get commonJoin => 'Dołącz';

  @override
  String get commonDismiss => 'Odrzuć';

  @override
  String get commonSubmit => 'Wyślij';

  @override
  String get commonConfirm => 'Potwierdź';

  @override
  String get commonRemove => 'Usuń';

  @override
  String get commonRetry => 'Spróbuj ponownie';

  @override
  String get commonOk => 'OK';

  @override
  String get commonYes => 'Tak';

  @override
  String get commonNo => 'Nie';

  @override
  String get commonSearch => 'Szukaj';

  @override
  String get commonSettings => 'Ustawienia';

  @override
  String get commonLoading => 'Wczytywanie...';

  @override
  String get settingsLanguageSection => 'Język';

  @override
  String get settingsLanguageTitle => 'Język aplikacji';

  @override
  String get settingsLanguageSystemDefault => 'Domyślny systemowy';

  @override
  String get settingsLanguageDescription =>
      'Wybierz język, w którym wyświetlany jest interfejs Kody. To ustawienie nie zależy od głównego języka serwera ani języka, w którym piszesz wiadomości.';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get settingsSignOut => 'Wyloguj się';

  @override
  String get settingsSectionMyAccount => 'Moje konto';

  @override
  String get settingsSectionSecurity => 'Bezpieczeństwo';

  @override
  String get settingsSectionAccessibility => 'Dostępność';

  @override
  String get settingsSectionBilling => 'Płatności';

  @override
  String get settingsSectionFamily => 'Rodzina';

  @override
  String get settingsSectionVoiceVideo => 'Głos i wideo';

  @override
  String get settingsSectionDesktop => 'Pulpit';

  @override
  String get settingsSectionAbout => 'Informacje';

  @override
  String get settingsTwoFactorTitle => 'Uwierzytelnianie dwuskładnikowe';

  @override
  String get settingsTwoFactorSubtitle =>
      'Dodaj aplikację uwierzytelniającą dla dodatkowego bezpieczeństwa';

  @override
  String get settingsLinkedDevicesTitle => 'Połączone urządzenia';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'Wyświetl i usuń urządzenia zalogowane na tym koncie';

  @override
  String get settingsContentFiltersTitle => 'Filtry treści';

  @override
  String get settingsContentFiltersSubtitle =>
      'Wybierz, jak ma być wyświetlana oznaczona treść';

  @override
  String get settingsDmFriendsOnlyTitle =>
      'Zezwalaj na wiadomości prywatne tylko od znajomych';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Osoby niebędące znajomymi nie mogą rozpocząć z Tobą nowej rozmowy';

  @override
  String get settingsDmPrivacyError =>
      'Nie udało się zaktualizować prywatności wiadomości prywatnych.';

  @override
  String get settingsShowVispAvatarTitle => 'Pokazuj awatar Visp';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Pokazuje twarz i nastrój Visp w oknach konfiguracji, wydarzeń i porad';

  @override
  String get settingsHighContrastTitle => 'Wysoki kontrast';

  @override
  String get settingsHighContrastSubtitle =>
      'Czysta czerń i biel, wysoki kontrast kolorów w całej aplikacji -- przełączenie na chwilę odświeża bieżący ekran.';

  @override
  String get settingsDyslexiaFontTitle => 'Czcionka przyjazna dysleksji';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Zmienia tekst główny na OpenDyslexic w całej aplikacji';

  @override
  String get settingsFontSizeTitle => 'Rozmiar czcionki';

  @override
  String get settingsFontSizeSample =>
      'Pchnąć w tę łódź jeża lub ośm skrzyń fig';

  @override
  String get settingsDensityTitle => 'Gęstość';

  @override
  String get settingsDensityDescription =>
      'Wpływa na odstępy w standardowych elementach sterujących -- przyciskach, przełącznikach, oknach dialogowych -- ale nie na każdym niestandardowym układzie.';

  @override
  String get settingsDensityCompact => 'Kompaktowa';

  @override
  String get settingsDensityStandard => 'Standardowa';

  @override
  String get settingsDensityComfortable => 'Komfortowa';

  @override
  String get settingsStreamingTitle => 'Konta streamingowe';

  @override
  String get settingsStreamingDescription =>
      'Połącz Twitch/YouTube, aby serwery, w których masz uprawnienie \"Ogłaszaj transmisję na żywo\", mogły automatycznie publikować wpis, gdy zaczniesz transmisję lub dodasz nowy film.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform połączony jako $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform niepołączony';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch =>
      ' -- transmisja na żywo teraz';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- nowy film';

  @override
  String get settingsStreamingConnecting => 'Łączenie...';

  @override
  String get settingsStreamingConnect => 'Połącz';

  @override
  String get settingsAnnounceLiveTwitch =>
      'Ogłaszaj, gdy zaczynam transmisję na żywo';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Ogłaszaj transmisje na żywo i nowe filmy';

  @override
  String get settingsRefreshStatus =>
      'Już połączono w przeglądarce? Odśwież stan';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'Nie udało się rozpocząć połączenia z $platform.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Dokończ łączenie w przeglądarce, a potem wróć i odśwież.';

  @override
  String get settingsThroneTitle => 'Webhook Throne';

  @override
  String get settingsThroneDescription =>
      'Wklej ten adres URL w ustawieniach webhooka Throne.com, aby otrzymywać powiadomienia w Kodzie za każdym razem, gdy ktoś wyśle Ci prezent.';

  @override
  String get settingsThroneGetUrl => 'Pobierz mój adres URL webhooka';

  @override
  String get settingsThroneCopyTooltip => 'Kopiuj';

  @override
  String get settingsThroneCopiedToast => 'Skopiowano do schowka';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Wygeneruj ponownie (unieważnia stary adres URL)';

  @override
  String get settingsThroneRegenerateConfirmTitle =>
      'Wygenerować ponownie adres URL webhooka?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'Twój stary adres URL przestanie działać, więc zaktualizuj go potem w Throne.com.';

  @override
  String get settingsThroneRegenerate => 'Wygeneruj ponownie';

  @override
  String get settingsUploadPhoto => 'Prześlij zdjęcie';

  @override
  String get settingsOrPasteUrl => 'lub wklej adres URL poniżej';

  @override
  String get settingsAvatarUrlHint => 'https://przyklad.com/awatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'Przesyłanie obrazów wymaga Cloudflare R2 — wklejenie adresu URL działa zawsze.';

  @override
  String get settingsDisplayNameLabel => 'WYŚWIETLANA NAZWA';

  @override
  String get settingsDisplayNameHint => 'Wyświetlana nazwa';

  @override
  String get settingsBioLabel => 'OPIS';

  @override
  String get settingsBioHint => 'Opowiedz innym trochę o sobie';

  @override
  String get settingsPronounsLabel => 'ZAIMKI';

  @override
  String get settingsPronounsHint => 'np. ona/jej';

  @override
  String get settingsShowPronounsTitle => 'Pokazuj moje zaimki innym';

  @override
  String get settingsShowPronounsSubtitle =>
      'Wyświetlane obok Twojej nazwy na czacie, listach członków i w głosie';

  @override
  String get settingsStatusLabel => 'STATUS';

  @override
  String get settingsCustomStatusLabel => 'STATUS NIESTANDARDOWY';

  @override
  String get settingsCustomStatusHint => 'Co masz na myśli?';

  @override
  String get statusOnline => 'Dostępny';

  @override
  String get statusAway => 'Zaraz wracam';

  @override
  String get statusDnd => 'Nie przeszkadzać';

  @override
  String get statusInvisible => 'Niewidoczny';

  @override
  String get settingsFamilyNotAvailable =>
      'Kontrola rodzicielska jest niedostępna na koncie nadzorowanym.';

  @override
  String get settingsAboutTitle => 'O Kodzie';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Regulamin';

  @override
  String get settingsPrivacyTitle => 'Polityka prywatności';

  @override
  String get settingsSupportTitle => 'Wsparcie';

  @override
  String get settingsReportSecurityTitle => 'Zgłoś problem z bezpieczeństwem';

  @override
  String get settingsDesktopNotAvailable =>
      'To są ustawienia dostępne wyłącznie na komputerze -- ta platforma nie ma okna ani zasobnika systemowego.';

  @override
  String get settingsCloseToTrayTitle => 'Zamykaj do zasobnika systemowego';

  @override
  String get settingsCloseToTraySubtitle =>
      'Zamknięcie okna pozwala Kodzie działać w tle, dzięki czemu nadal otrzymujesz powiadomienia -- wyłącz to, aby zamknięcie okna naprawdę zamykało aplikację.';

  @override
  String get authErrorEmailPasswordRequired =>
      'Wymagane są adres e-mail i hasło.';

  @override
  String get authErrorIncorrectCredentials =>
      'Nieprawidłowy adres e-mail lub hasło.';

  @override
  String get authErrorMustAcceptTerms => 'Zaakceptuj Regulamin.';

  @override
  String get authErrorAllFieldsRequired => 'Wszystkie pola są wymagane.';

  @override
  String get authErrorPasswordsDontMatch => 'Hasła nie są zgodne.';

  @override
  String get authErrorPasswordTooShort =>
      'Hasło musi mieć co najmniej 8 znaków.';

  @override
  String get authErrorRegistrationFailed =>
      'Rejestracja nie powiodła się. Ten adres e-mail może być już używany.';

  @override
  String get authTabSignIn => 'Zaloguj się';

  @override
  String get authTabCreateAccount => 'Utwórz konto';

  @override
  String get authAgreementPrefix => 'Korzystając z Kody, akceptujesz nasz ';

  @override
  String get authTermsLink => 'Regulamin';

  @override
  String get authAgreementMiddle => ' oraz ';

  @override
  String get authPrivacyLink => 'Politykę prywatności';

  @override
  String get authAgreementSuffix => '.';

  @override
  String get authEmailHint => 'Adres e-mail';

  @override
  String get authPasswordHint => 'Hasło';

  @override
  String get authForgotPassword => 'Nie pamiętasz hasła?';

  @override
  String get authSignInButton => 'Zaloguj się';

  @override
  String get authUsernameHint => 'Nazwa użytkownika';

  @override
  String get authConfirmPasswordHint => 'Potwierdź hasło';

  @override
  String get authAccessCodeHint => 'Kod dostępu (jeśli masz)';

  @override
  String get authAgreeToTerms => 'Akceptuję Regulamin i Politykę prywatności';

  @override
  String get authCreateAccountButton => 'Utwórz konto';

  @override
  String get dmSafetyNumberChangedWarning =>
      'Numer bezpieczeństwa tej rozmowy się zmienił -- zweryfikuj go przed wysłaniem.';

  @override
  String get dmMessageNotSent => 'Wiadomość nie została wysłana.';

  @override
  String dmEncryptMessageError(String error) {
    return 'Nie udało się zaszyfrować wiadomości: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'Nie udało się przesłać załącznika.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'Nie udało się zaszyfrować załącznika: $error';
  }

  @override
  String get dmReportMessage => 'Zgłoś wiadomość';

  @override
  String get dmReportSubmitted => 'Zgłoszenie wysłane.';

  @override
  String get dmTitle => 'Wiadomości';

  @override
  String get dmNewMessage => 'Nowa wiadomość';

  @override
  String get dmNoConversationsYet => 'Brak rozmów';

  @override
  String get dmSelectConversation => 'Wybierz rozmowę';

  @override
  String get dmVerifySafetyNumberTooltip => 'Zweryfikuj numer bezpieczeństwa';

  @override
  String get dmSeenLabel => 'Wyświetlono';

  @override
  String get dmMessageActionsTooltip => 'Działania wiadomości';

  @override
  String get dmRemoveAttachmentTooltip => 'Usuń załącznik';

  @override
  String get dmAttachFileTooltip => 'Dołącz plik';

  @override
  String get dmMessageHint => 'Wiadomość...';

  @override
  String get dmSendMessageTooltip => 'Wyślij wiadomość';

  @override
  String get dmNoFriendsYet =>
      'Nie masz jeszcze znajomych.\nWyślij zaproszenie do znajomych, aby zacząć.';

  @override
  String get dmUnfriendTooltip => 'Usuń ze znajomych';

  @override
  String get dmNoPendingRequests => 'Brak oczekujących zaproszeń do znajomych.';

  @override
  String get dmIncomingRequestsLabel => 'OTRZYMANE';

  @override
  String get dmSentRequestsLabel => 'WYSŁANE';

  @override
  String get dmAcceptTooltip => 'Akceptuj';

  @override
  String get dmDeclineTooltip => 'Odrzuć';

  @override
  String get dmPendingLabel => 'Oczekujące';

  @override
  String get dmNewMessageDialogTitle => 'Nowa wiadomość';

  @override
  String get dmEnterUsernameHint => 'Wpisz nazwę użytkownika';

  @override
  String get dmOpenButton => 'Otwórz';

  @override
  String dmSavedAttachment(String fileName) {
    return 'Zapisano $fileName';
  }

  @override
  String get dmUnknownUser => 'Nieznany';

  @override
  String get dmEndToEndEncryptedTooltip => 'Szyfrowanie end-to-end';

  @override
  String get homeContentWarningTitle => 'Ostrzeżenie o treści';

  @override
  String homeContentWarningBody(String labels) {
    return 'Ten kanał jest oznaczony jako: $labels.\n\nZmień to w Ustawienia > Bezpieczeństwo > Filtry treści.';
  }

  @override
  String get homeViewAnyway => 'Wyświetl mimo to';

  @override
  String get homeCouldNotConnectVoice =>
      'Nie udało się połączyć z kanałem głosowym.';

  @override
  String get homeVoiceChannelFull => 'Ten kanał głosowy jest pełny.';

  @override
  String get homeCreateServer => 'Utwórz serwer';

  @override
  String get homeJoinServer => 'Dołącz do serwera';

  @override
  String get homeRedeemCode => 'Wykorzystaj kod';

  @override
  String get homeJoinServerDialogTitle => 'Dołącz do serwera';

  @override
  String get homeEnterInviteCode => 'Wpisz kod zaproszenia lub adres URL:';

  @override
  String get homeInviteCodeHint => 'np. XK9MP2';

  @override
  String get homeJoined => 'Dołączono!';

  @override
  String get homeInvalidInvite => 'Nieprawidłowy lub wygasły kod zaproszenia.';

  @override
  String get homeJoinButton => 'Dołącz';

  @override
  String get homeRedeemCodeDialogTitle => 'Wykorzystaj kod';

  @override
  String get homeEnterBackerCode => 'Wpisz swój kod wspierającego lub nagrody:';

  @override
  String get homeRewardCodeHint => 'Kod nagrody';

  @override
  String get homeCodeRedeemed =>
      'Kod wykorzystany! Twoje nagrody zostały przyznane.';

  @override
  String get homeInvalidRedeemCode =>
      'Nieprawidłowy, wygasły lub już wykorzystany kod.';

  @override
  String get homeRedeemButton => 'Wykorzystaj';

  @override
  String get homeAreFriends => 'Jesteście znajomymi';

  @override
  String get homeAddFriend => 'Dodaj znajomego';

  @override
  String homeFriendRequestSent(String username) {
    return 'Zaproszenie do znajomych wysłane do $username!';
  }

  @override
  String get homeMessageButton => 'Wiadomość';

  @override
  String get homeSendTip => 'Wyślij napiwek';

  @override
  String get homeSwitchToServer => 'Przełącz na serwer';

  @override
  String get homeInvitePeople => 'Zaproś osoby';

  @override
  String get homeServerSettingsMenuItem => 'Ustawienia serwera';

  @override
  String get homeLeaveServerMenuItem => 'Opuść serwer';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return 'Opuścić serwer $serverName? Możesz do niego dołączyć ponownie za pomocą zaproszenia.';
  }

  @override
  String get homeLeaveButton => 'Opuść';

  @override
  String get homeCreateAServer => 'Utwórz serwer';

  @override
  String get homeServerNameHint => 'Nazwa serwera';

  @override
  String get homeDescribeToVisp => 'Opisz to Visp zamiast tego';

  @override
  String get homeMarkAsRead => 'Oznacz jako przeczytane';

  @override
  String get homeEditChannel => 'Edytuj kanał';

  @override
  String get homeDeleteChannel => 'Usuń kanał';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return 'Usunąć #$channelName? Tej operacji nie można cofnąć.';
  }

  @override
  String get homeDeleteButton => 'Usuń';

  @override
  String get homeCreateChannelHere => 'Utwórz kanał tutaj';

  @override
  String get homeEditCategory => 'Edytuj kategorię';

  @override
  String get homeDeleteCategory => 'Usuń kategorię';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return 'Usunąć \"$categoryName\"? Kanały w niej staną się nieskategoryzowane.';
  }

  @override
  String get homeReplyAction => 'Odpowiedz';

  @override
  String get homeCreateThreadAction => 'Utwórz wątek';

  @override
  String get homeEditMessageAction => 'Edytuj wiadomość';

  @override
  String get homeDeleteMessageAction => 'Usuń wiadomość';

  @override
  String get homePinMessageAction => 'Przypnij wiadomość';

  @override
  String get homeUnpinMessageAction => 'Odepnij wiadomość';

  @override
  String get homeReportMessageAction => 'Zgłoś wiadomość';

  @override
  String get homeReportSubmitted => 'Zgłoszenie wysłane.';

  @override
  String get messageActionForward => 'Przekaż dalej';

  @override
  String messageForwardedFromLabel(String name) {
    return 'Przekazano od $name';
  }

  @override
  String get forwardDestinationPickerTitle => 'Przekaż wiadomość';

  @override
  String get forwardDestinationPickerChannelsTab => 'Kanały';

  @override
  String get forwardDestinationPickerDmsTab => 'Wiadomości bezpośrednie';

  @override
  String get forwardDestinationPickerNoServers =>
      'Nie należysz jeszcze do żadnego serwera.';

  @override
  String get forwardDestinationPickerNoChannels =>
      'Brak kanałów tekstowych na tym serwerze.';

  @override
  String get forwardDestinationPickerNoConversations => 'Brak rozmów.';

  @override
  String get forwardSuccessToast => 'Wiadomość przekazana.';

  @override
  String get forwardFailedToast =>
      'Nie udało się przekazać wiadomości -- spróbuj ponownie.';

  @override
  String get homeAddReactionTitle => 'Dodaj reakcję';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wątku',
      many: '$count wątków',
      few: '$count wątki',
      one: '$count wątek',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'Opcje kategorii';

  @override
  String get homeChannelOptionsTooltip => 'Opcje kanału';

  @override
  String get homeOpenVoiceChatTooltip => 'Otwórz czat';

  @override
  String get homeMarketplaceLabel => 'Rynek';

  @override
  String get homeSelectChannelPrompt => 'Wybierz kanał';

  @override
  String get homeSearchTooltip => 'Szukaj';

  @override
  String get homePinnedMessagesTooltip => 'Przypięte wiadomości';

  @override
  String get homeWaitingForKey => 'Oczekiwanie na klucz szyfrujący...';

  @override
  String get homeUnableToDecrypt => 'Nie można odszyfrować tej wiadomości.';

  @override
  String get homeMessageActionsTooltip => 'Działania wiadomości';

  @override
  String get homeCancelReplyTooltip => 'Anuluj odpowiedź';

  @override
  String get homeRemoveAttachmentTooltip => 'Usuń załącznik';

  @override
  String get homeAttachFileTooltip => 'Dołącz plik';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'Napisz na #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'Wyślij wiadomość';

  @override
  String get homeEditMessageTitle => 'Edytuj wiadomość';

  @override
  String get homeMessageLabel => 'Wiadomość';

  @override
  String get homePinnedMessagesTitle => 'Przypięte wiadomości';

  @override
  String get homeNoPinnedMessages => 'Brak przypiętych wiadomości';

  @override
  String get homeUnpinTooltip => 'Odepnij';

  @override
  String get homeCreateThreadTitle => 'Utwórz wątek';

  @override
  String get homeThreadNameHint => 'Nazwa wątku';

  @override
  String homeThreadCreated(String name) {
    return 'Utworzono wątek \"$name\"!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Utwórz lub dołącz';

  @override
  String get homeKodaMarketplaceTooltip => 'Rynek Kody';

  @override
  String get homeAdminPanelTooltip => 'Panel administracyjny';

  @override
  String get homeServerSettingsTooltip => 'Ustawienia serwera';

  @override
  String get homeSettingsTooltip => 'Ustawienia';

  @override
  String get homeContentWarningBadge => 'Ostrzeżenie o treści';

  @override
  String get homeDirectMessagesTooltip => 'Wiadomości prywatne';

  @override
  String homeReplyingTo(String username) {
    return 'Odpowiadanie do $username';
  }

  @override
  String get homeAttachmentFallback => 'Załącznik';

  @override
  String get homeAttachmentUploadFailed => 'Nie udało się przesłać załącznika.';

  @override
  String homeSavedAttachment(String fileName) {
    return 'Zapisano $fileName';
  }

  @override
  String serverConnectError(String service) {
    return 'Nie udało się rozpocząć połączenia z $service.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Rozłączyć Printful?';

  @override
  String get serverDisconnectPrintfulBody =>
      'Ten serwer nie będzie mógł realizować zamówień na produkty, dopóki połączenie nie zostanie przywrócone.';

  @override
  String get serverDisconnectTiltifyTitle => 'Rozłączyć Tiltify?';

  @override
  String get serverDisconnectTiltifyBody =>
      'Ten serwer przestanie pokazywać postęp kampanii charytatywnej, dopóki połączenie nie zostanie przywrócone.';

  @override
  String get serverNewRoleTitle => 'Nowa rola';

  @override
  String get serverEditRoleTitle => 'Edytuj rolę';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Kolor $hex';
  }

  @override
  String get permViewChannels => 'Wyświetlanie kanałów';

  @override
  String get permSendMessages => 'Wysyłanie wiadomości';

  @override
  String get permConnectVoice => 'Łączenie z kanałem głosowym';

  @override
  String get permManageServer => 'Zarządzanie serwerem';

  @override
  String get permManageChannels => 'Zarządzanie kanałami';

  @override
  String get permManageRoles => 'Zarządzanie rolami';

  @override
  String get permManageMessages => 'Zarządzanie wiadomościami';

  @override
  String get permKickMembers => 'Wyrzucanie członków';

  @override
  String get permBanMembers => 'Banowanie członków';

  @override
  String get permMuteMembers => 'Wyciszanie członków';

  @override
  String get permMentionEveryone => 'Wzmianka @everyone';

  @override
  String get permManageMarketplace => 'Zarządzanie rynkiem';

  @override
  String get permAnnounceLive => 'Ogłaszanie transmisji na żywo';

  @override
  String get permMoveMembers => 'Przenoszenie członków (głos)';

  @override
  String get serverRoleNameHint => 'Nazwa roli';

  @override
  String get serverColorLabel => 'Kolor';

  @override
  String get serverPermissionsLabel => 'Uprawnienia';

  @override
  String get serverSelfAssignableTitle => 'Można przypisać samodzielnie';

  @override
  String get serverSelfAssignableSubtitle =>
      'Członkowie mogą sami przypisać sobie tę rolę';

  @override
  String get serverDefaultRoleUndeletable => 'Domyślnej roli nie można usunąć.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'Usunąć rolę \"$roleName\"?';
  }

  @override
  String get serverCouldNotDeleteRole => 'Nie udało się usunąć tej roli.';

  @override
  String get serverMemberFallback => 'Członek';

  @override
  String get serverNoRolesYet => 'Brak ról.';

  @override
  String get serverRefreshStatus =>
      'Już połączono w przeglądarce? Odśwież stan';

  @override
  String get serverPrintfulConnected => 'Printful połączony';

  @override
  String get serverPrintfulNotConnected => 'Printful niepołączony';

  @override
  String get serverPrintfulDescription =>
      'Połącz konto Printful tego serwera, aby realizować zamówienia na produkty złożone przez Kodę. Każdy serwer łączy swój własny sklep.';

  @override
  String get serverConnecting => 'Łączenie...';

  @override
  String get serverConnectPrintful => 'Połącz Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify połączony';

  @override
  String get serverTiltifyNotConnected => 'Tiltify niepołączony';

  @override
  String get serverTiltifyDescription =>
      'Połącz konto Tiltify tego serwera, aby pokazać wszystkim członkom postęp kampanii charytatywnej na żywo. Tylko do odczytu -- Koda nigdy nic nie publikuje ani nie zmienia po stronie Tiltify.';

  @override
  String get serverConnectTiltify => 'Połącz Tiltify';

  @override
  String get serverNoTiltifyCampaigns =>
      'Nie znaleziono kampanii na tym koncie Tiltify.';

  @override
  String get serverPickCampaign => 'Wybierz, którą kampanię wyświetlić';

  @override
  String get serverUntitledCampaign => 'Kampania bez tytułu';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return 'Zebrano $currency $raised z celu $goal';
  }

  @override
  String get serverViewCampaign => 'Wyświetl kampanię';

  @override
  String get serverRefreshButton => 'Odśwież';

  @override
  String get serverUploadButton => 'Prześlij';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return 'Wykorzystano $used / $limit miejsc -- poziom podbicia $level';
  }

  @override
  String get serverNoCustomEmoji => 'Brak niestandardowych emoji.';

  @override
  String get serverDeleteEmojiTooltip => 'Usuń emoji';

  @override
  String get serverUploadEmojiTitle => 'Prześlij emoji';

  @override
  String get serverEmojiNameHint => 'nazwa (litery, cyfry, _)';

  @override
  String get serverChooseImage => 'Wybierz obraz';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Bieżący poziom podbicia: $level';
  }

  @override
  String get serverBackgroundTitle => 'Tło serwera';

  @override
  String get serverBackgroundDescription =>
      'Niestandardowe tło wyświetlane za widokiem kanału wszystkim na tym serwerze.';

  @override
  String get serverBackgroundLockedHint =>
      'Osiągnij poziom podbicia 4, aby odblokować niestandardowe tło.';

  @override
  String get serverIconBorderTitle => 'Obramowanie ikony serwera';

  @override
  String get serverIconBorderDescription =>
      'Akcentowe obramowanie wokół ikony tego serwera na liście serwerów każdego członka.';

  @override
  String get serverIconBorderLockedHint =>
      'Osiągnij poziom podbicia 5, aby odblokować niestandardowe obramowanie ikony.';

  @override
  String get serverBoostFromBank =>
      'Podbij ten serwer z Banku serwera na Rynku, aby podnieść jego poziom.';

  @override
  String get serverMarketplaceListingLabel => 'WPIS NA RYNKU';

  @override
  String get serverListInMarketplace => 'Wystaw na Rynku Kody';

  @override
  String get serverListInMarketplaceDescription =>
      'Umieszcza sklep tego serwera w Koda Marketplace, z szansą na cotygodniową rotację polecanych produktów. Chodzi tu o zakupy, a nie o znajdowanie serwerów do dołączenia -- nie wpływa to na ogólne wyszukiwanie serwerów.';

  @override
  String get serverSocialLinkLabel =>
      'Link społecznościowy / zaproszenie (opcjonalnie)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Zapisz link';

  @override
  String get serverPricingLabel => 'CENY';

  @override
  String get serverPrimaryCurrencyLabel => 'Waluta główna';

  @override
  String get serverPrimaryCurrencyDescription =>
      'Dotyczy poziomów subskrypcji serwera i cen dóbr cyfrowych ustawionych dla tego serwera.';

  @override
  String get serverPrimaryLanguageLabel => 'Język główny';

  @override
  String get serverPrimaryLanguageDescription =>
      'Wiadomości publikowane przez członków w innym języku otrzymują małą odznakę języka, porównywaną z tym ustawieniem.';

  @override
  String get serverMarketplaceLinkSaved => 'Zapisano link do Rynku.';

  @override
  String get serverIconUpdated => 'Zaktualizowano ikonę serwera!';

  @override
  String get serverTemplateImported => 'Zaimportowano szablon!';

  @override
  String get serverImportFromDiscord => 'Importuj z Discorda';

  @override
  String get serverVispPlanLive => 'Plan Visp jest gotowy!';

  @override
  String get serverAskVisp => 'Zapytaj Visp';

  @override
  String get serverAddCategoryButton => 'Dodaj kategorię';

  @override
  String get serverAddChannelHereTooltip => 'Dodaj kanał tutaj';

  @override
  String get serverRename => 'Zmień nazwę';

  @override
  String get serverUncategorized => 'BEZ KATEGORII';

  @override
  String get serverAddChannel => 'Dodaj kanał';

  @override
  String get serverEditRulesContent => 'Edytuj treść zasad';

  @override
  String get serverRulesContentHint => 'Wpisz tutaj zasady swojego serwera...';

  @override
  String get serverRulesUpdated => 'Zaktualizowano zasady!';

  @override
  String get serverAddRole => 'Dodaj rolę';

  @override
  String get serverDefaultRoleLabel => 'Rola domyślna';

  @override
  String get serverManageRolesTooltip => 'Zarządzaj rolami';

  @override
  String get serverMutedLabel => 'Wyciszony';

  @override
  String get serverExpandedLabel => 'rozwinięte';

  @override
  String get serverCollapsedLabel => 'zwinięte';

  @override
  String get serverUnmute => 'Wyłącz wyciszenie';

  @override
  String get serverMute => 'Wycisz';

  @override
  String get serverKick => 'Wyrzuć';

  @override
  String get serverBan => 'Zbanuj';

  @override
  String serverBannedUsersLabel(int count) {
    return 'ZBANOWANI UŻYTKOWNICY — $count';
  }

  @override
  String get serverNoBannedUsers => 'Brak zbanowanych użytkowników.';

  @override
  String get serverUnban => 'Odbanuj';

  @override
  String get serverMemberFallbackGeneric => 'tego członka';

  @override
  String serverBanConfirm(String username, String serverName) {
    return 'Zbanować $username na serwerze $serverName? Nie będzie mógł ponownie dołączyć bez odbanowania.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return 'Wyrzucić $username z serwera $serverName? Będzie mógł ponownie dołączyć za pomocą zaproszenia.';
  }

  @override
  String get serverMuteDuration60Sec => '60 sekund';

  @override
  String get serverMuteDuration5Min => '5 minut';

  @override
  String get serverMuteDuration10Min => '10 minut';

  @override
  String get serverMuteDuration1Hour => '1 godzina';

  @override
  String get serverMuteDuration1Day => '1 dzień';

  @override
  String get serverMuteDuration1Week => '1 tydzień';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'Nie udało się wykonać akcji \"$action\" wobec $username.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return 'Wycisz $username';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'Nie udało się wyciszyć $username.';
  }

  @override
  String get serverUnlockInvites => 'Odblokuj zaproszenia';

  @override
  String get serverInvitesUnlocked => 'Zaproszenia odblokowane.';

  @override
  String get serverAuditLogDescription =>
      'Aktywność moderacyjna poziomu 1 -- wyrzucenia, bany, wyciszenia oraz automatyczna ochrona przed zalewem wiadomości/najazdami. Tylko metadane; nigdy treść wiadomości.';

  @override
  String get serverSystemActor => 'System';

  @override
  String get serverActionKicked => 'wyrzucił(a)';

  @override
  String get serverActionBanned => 'zbanował(a)';

  @override
  String get serverActionUnbanned => 'odbanował(a)';

  @override
  String get serverActionMuted => 'wyciszył(a)';

  @override
  String get serverActionUnmuted => 'wyłączył(a) wyciszenie';

  @override
  String get serverActionFloodDetected =>
      'automatycznie wyciszony(-a) za zalewanie wiadomościami';

  @override
  String get serverActionRaidLockdownEnabled =>
      'zablokował(a) zaproszenia (ochrona przed najazdem)';

  @override
  String get serverActionRaidLockdownDisabled => 'odblokował(a) zaproszenia';

  @override
  String get serverActionMoved => 'przeniósł(a)';

  @override
  String get serverUnknownAction => 'nieznana akcja';

  @override
  String get serverNoModerationActivity => 'Brak aktywności moderacyjnej.';

  @override
  String get serverReportsDescription =>
      'Wiadomości zgłoszone przez członków tego serwera -- już odszyfrowana własna kopia zgłaszającego, ujawniona poprzez zgłoszenie.';

  @override
  String get serverNoPendingReports => 'Brak oczekujących zgłoszeń.';

  @override
  String get serverReportReasonOther => 'inne';

  @override
  String get serverReportStatusActioned => 'Rozpatrzone';

  @override
  String get serverReportStatusDismissed => 'Odrzucone';

  @override
  String get serverResolvedLabel => 'ROZPATRZONE';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'Zgłoszone przez $reporter -- wysłane przez $target';
  }

  @override
  String serverReportNote(String note) {
    return 'Notatka: $note';
  }

  @override
  String get serverDismissButton => 'Odrzuć';

  @override
  String get serverMarkActioned => 'Oznacz jako rozpatrzone';

  @override
  String get serverCreateInvite => 'Utwórz zaproszenie';

  @override
  String get serverInviteCreatedTitle => 'Utworzono zaproszenie';

  @override
  String get serverNoActiveInvites => 'Brak aktywnych zaproszeń';

  @override
  String serverUsesLabel(String uses) {
    return 'Użycia: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Usuń zaproszenie';

  @override
  String get serverChangeIconLabel => 'Zmień ikonę serwera';

  @override
  String get serverFallbackName => 'Serwer';

  @override
  String serverSettingsTitle(String serverName) {
    return 'Ustawienia serwera $serverName';
  }

  @override
  String get serverTabChannels => 'Kanały';

  @override
  String get serverTabRoles => 'Role';

  @override
  String get serverTabMembers => 'Członkowie';

  @override
  String get serverTabInvites => 'Zaproszenia';

  @override
  String get serverTabMerch => 'Produkty';

  @override
  String get serverTabEmoji => 'Emoji';

  @override
  String get serverTabCustomize => 'Personalizacja';

  @override
  String get serverTabAuditLog => 'Dziennik zdarzeń';

  @override
  String get serverTabReports => 'Zgłoszenia';

  @override
  String get serverTabThresholdMod => 'Moderacja progowa';

  @override
  String get serverTabCharity => 'Charytatywność';

  @override
  String get homeCustomEmojiFallback => 'niestandardowe emoji';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reakcji',
      many: '$count reakcji',
      few: '$count reakcje',
      one: '$count reakcja',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted => ', zareagowano, aktywuj, aby usunąć';

  @override
  String get homeReactionActivateToAdd => ', aktywuj, aby dodać';

  @override
  String get homeAddReactionLabel => 'Dodaj reakcję';

  @override
  String homeViewProfile(String username) {
    return 'Wyświetl profil $username';
  }

  @override
  String get homeMoveToVoiceChannel => 'Przenieś na kanał głosowy…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Wybierz kanał głosowy';

  @override
  String get homeNoOtherVoiceChannels => 'Brak innych kanałów głosowych';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username jest teraz na kanale $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'Nie udało się przenieść $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'Jesteś teraz na kanale $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'Dołącz do $channel, aby rozmawiać';
  }

  @override
  String get adminPanelTitle => 'Panel administratora';

  @override
  String get adminTabBackerCodes => 'Kody wspierających';

  @override
  String get adminTabUsers => 'Użytkownicy';

  @override
  String get adminTabDmReports => 'Zgłoszenia DM';

  @override
  String get adminTabSpamFlags => 'Zgłoszenia spamu';

  @override
  String get adminTabWiki => 'Wiki';

  @override
  String get adminTabBoosts => 'Podbicia';

  @override
  String get adminCreateBackerCodeTitle => 'Utwórz kod wspierającego';

  @override
  String get adminCodeHint =>
      'Kod (zostaw puste, aby wygenerować automatycznie)';

  @override
  String get adminNoteHint => 'Notatka (np. \"Kickstarter Tier 2\")';

  @override
  String get adminFlagsJsonHint =>
      'Flagi jako JSON, np. \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint =>
      'Maks. liczba użyć (zostaw puste = bez limitu)';

  @override
  String get adminCodeCreatedTitle => 'Kod utworzony';

  @override
  String get adminCodeLabel => 'Kod:';

  @override
  String get adminCopyCodeTooltip => 'Kopiuj kod';

  @override
  String adminFlagsValue(String flags) {
    return 'Flagi: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Kody wspierających i nagród';

  @override
  String get adminNewCodeButton => 'Nowy kod';

  @override
  String get adminNoCodesYet => 'Brak kodów';

  @override
  String get adminRewardsHeader => 'Nagrody';

  @override
  String get adminRewardAlphaBetaAccess =>
      'Dostęp Alpha/Beta + Odznaka Alpha Spark';

  @override
  String get adminRewardLifetimePulse =>
      'Dożywotni status Pulse + Odznaka Founder + Zwiększony bitrate';

  @override
  String get adminRewardMonthlyBoostTokenOne =>
      'Miesięczny token wzmocnienia serwera (Lepsze audio/wideo)';

  @override
  String get adminRewardAnimatedFrameBundle =>
      'Animowana ramka profilu + Sala Założycieli + 2 miesięczne tokeny serwera';

  @override
  String get adminRewardTitanGlow =>
      'Trwała poświata nazwy użytkownika \"Titan\"';

  @override
  String get adminRewardAnimatedFrame => 'Animowana ramka';

  @override
  String get adminRewardFoundersHall => 'Sala Założycieli';

  @override
  String adminRewardMonthlyBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tokenów wzmocnienia/miesiąc',
      few: '$count tokeny wzmocnienia/miesiąc',
      one: '1 token wzmocnienia/miesiąc',
    );
    return '$_temp0';
  }

  @override
  String get adminRewardsNone => 'Brak nagród';

  @override
  String get adminRegistrationOpenLabel =>
      'Rejestracja jest otwarta dla wszystkich';

  @override
  String get adminRegistrationInviteOnlyLabel =>
      'Rejestracja jest tylko na zaproszenia (wymagany kod wspierającego)';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return 'Użycia: $uses';
  }

  @override
  String get adminSearchUsersHint => 'Szukaj użytkowników po nazwie...';

  @override
  String get adminSearchUsersPrompt => 'Wyszukaj użytkownika powyżej';

  @override
  String get adminNoDmReports => 'Brak zgłoszeń DM.';

  @override
  String get adminResolvedLabel => 'ROZWIĄZANE';

  @override
  String get adminReasonOther => 'inne';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Zgłaszający: $reporterId\nUjawniony nadawca: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Notatka: $note';
  }

  @override
  String get adminDismissButton => 'Odrzuć';

  @override
  String get adminMarkActionedButton => 'Oznacz jako rozpatrzone';

  @override
  String get adminStatusActioned => 'Rozpatrzone';

  @override
  String get adminStatusDismissed => 'Odrzucone';

  @override
  String get adminNoSpamFlags => 'Brak zgłoszeń spamu.';

  @override
  String get adminFlagMassDmSpam => 'Masowy spam DM';

  @override
  String get adminFlagRaidLockdown => 'Blokada przez najazd';

  @override
  String get adminFlagBotBehavior => 'Zachowanie przypominające bota';

  @override
  String get adminFlagChannelFlooding => 'Zalewanie kanału wiadomościami';

  @override
  String get adminAutoEscalatedBadge => 'AUTOMATYCZNIE ESKALOWANE';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Pewność: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'Użytkownik: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Serwer: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount z $totalJoiners dołączających wciąż wyciszonych';
  }

  @override
  String get adminNoJoinersMuted => 'Brak aktualnie wyciszonych dołączających';

  @override
  String adminRestrictedUntil(String until) {
    return 'Obecnie ograniczone do $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'Obecnie brak ograniczeń';

  @override
  String get adminDismissUndoButton => 'Odrzuć i cofnij';

  @override
  String get adminConfirmRestrictButton => 'Potwierdź i ogranicz';

  @override
  String get adminDeleteArticleTitle => 'Usunąć artykuł?';

  @override
  String adminDeleteArticleBody(String title) {
    return '\"$title\" zostanie usunięty z bazy wiedzy Visp.';
  }

  @override
  String get adminNewArticleTitle => 'Nowy artykuł';

  @override
  String get adminEditArticleTitle => 'Edytuj artykuł';

  @override
  String get adminArticleTitleHint => 'Tytuł';

  @override
  String get adminArticleContentHint => 'Treść artykułu (markdown)';

  @override
  String get adminWikiArticlesHeader => 'Artykuły wiki';

  @override
  String get adminNoArticlesYet => 'Brak artykułów';

  @override
  String get adminEditArticleTooltip => 'Edytuj artykuł';

  @override
  String get adminDeleteArticleTooltip => 'Usuń artykuł';

  @override
  String get adminSearchServersHint => 'Szukaj serwerów po nazwie...';

  @override
  String get adminSearchServersPrompt => 'Wyszukaj serwer powyżej';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'Przyznaj podbicia dla $serverName';
  }

  @override
  String get adminNumBoostsHint => 'Liczba podbić';

  @override
  String get adminGrantButton => 'Przyznaj';

  @override
  String get adminPositiveNumberError => 'Podaj dodatnią liczbę całkowitą.';

  @override
  String get adminGrantBoostsFailed => 'Nie udało się przyznać podbić.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Przyznano $count podbicia dla $serverName -- teraz poziom $level ($activeCount aktywnych).',
      many:
          'Przyznano $count podbić dla $serverName -- teraz poziom $level ($activeCount aktywnych).',
      few:
          'Przyznano $count podbicia dla $serverName -- teraz poziom $level ($activeCount aktywnych).',
      one:
          'Przyznano $count podbicie dla $serverName -- teraz poziom $level ($activeCount aktywnych).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count członków';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Przyznaj podbicia';

  @override
  String get parentalDashboardTitle => 'Rodzina';

  @override
  String get parentalDashboardCreateChildTitle => 'Utwórz konto dziecka';

  @override
  String get parentalDashboardUsernameHint => 'Nazwa użytkownika';

  @override
  String get parentalDashboardEmailHint => 'E-mail';

  @override
  String get parentalDashboardPasswordHint => 'Hasło';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'Tworzy to w pełni nadzorowane konto: kanały oznaczone jako nieodpowiednie są blokowane, a Ty będziesz mógł ustawić dozwolone godziny oraz widzieć (ale nie czytać) znajomych i serwery tego konta.';

  @override
  String get parentalDashboardValidationError =>
      'Wymagane są: nazwa użytkownika, e-mail oraz hasło o długości co najmniej 8 znaków.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'Nie udało się utworzyć konta dziecka -- nazwa użytkownika/e-mail mogą być już zajęte.';

  @override
  String get parentalDashboardCreatingLabel => 'Tworzenie...';

  @override
  String get parentalDashboardNoChildren => 'Brak połączonych kont.';

  @override
  String get parentalDashboardSupervisedLabel => 'Konto nadzorowane';

  @override
  String get parentalDashboardUnknownUser => 'Nieznany';

  @override
  String get childDetailFallbackTitle => 'Konto dziecka';

  @override
  String get childDetailTabFriends => 'Znajomi';

  @override
  String get childDetailTabServers => 'Serwery';

  @override
  String get childDetailTabSchedule => 'Harmonogram';

  @override
  String get childDetailTabOverride => 'Wyjątek';

  @override
  String get childDetailNoFriends => 'Brak znajomych.';

  @override
  String get childDetailUnknownUser => 'Nieznany';

  @override
  String get childDetailRemoveFriendTooltip => 'Usuń znajomego';

  @override
  String get childDetailNoServers => 'Nie należy do żadnych serwerów.';

  @override
  String childDetailMemberCount(int count) {
    return '$count członków';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Usuń z serwera';

  @override
  String get childDetailRestrictAccessTitle =>
      'Ogranicz dostęp do wybranych godzin';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Wyłączone oznacza nieograniczony dostęp o każdej porze';

  @override
  String get childDetailTimezoneLabel => 'Strefa czasowa';

  @override
  String get childDetailMonday => 'Poniedziałek';

  @override
  String get childDetailTuesday => 'Wtorek';

  @override
  String get childDetailWednesday => 'Środa';

  @override
  String get childDetailThursday => 'Czwartek';

  @override
  String get childDetailFriday => 'Piątek';

  @override
  String get childDetailSaturday => 'Sobota';

  @override
  String get childDetailSunday => 'Niedziela';

  @override
  String get childDetailNoAccessLabel => 'Brak dostępu';

  @override
  String get childDetailToLabel => 'do';

  @override
  String get childDetailSavingLabel => 'Zapisywanie...';

  @override
  String get childDetailSaveScheduleButton => 'Zapisz harmonogram';

  @override
  String get childDetailScheduleSaved => 'Harmonogram zapisany.';

  @override
  String get childDetailOverrideExplanation =>
      'Przyznaj tymczasowy dostęp poza normalnym harmonogramem -- przydatne przy jednorazowym wyjątku bez zmiany harmonogramu tygodniowego.';

  @override
  String get childDetailReasonHint => 'Powód (opcjonalnie)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes min';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours godz.';
  }

  @override
  String get childDetailRevokeOverrideButton => 'Cofnij aktywny wyjątek';

  @override
  String get childDetailAccessGranted => 'Przyznano tymczasowy dostęp.';

  @override
  String get childDetailOverrideRevoked => 'Wyjątek cofnięty.';

  @override
  String get digitalGoodsTitle => 'Produkty cyfrowe';

  @override
  String get digitalGoodsMyProductsTitle => 'Moje produkty';

  @override
  String get digitalGoodsManageProductsTooltip =>
      'Zarządzaj produktami tego serwera';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Przełącz na przeglądanie';

  @override
  String get digitalGoodsCreateProductTooltip => 'Utwórz produkt';

  @override
  String get digitalGoodsBrowseTab => 'Przeglądaj';

  @override
  String get digitalGoodsMyListingsTab => 'Moje oferty';

  @override
  String get digitalGoodsMyPurchasesTab => 'Moje zakupy';

  @override
  String get digitalGoodsNoProductsYet => 'Brak produktów';

  @override
  String get digitalGoodsNoProductsAvailable => 'Brak dostępnych produktów';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Utwórz swój pierwszy produkt, aby zacząć sprzedaż';

  @override
  String get digitalGoodsCheckBackLater =>
      'Zajrzyj tu później po produkty cyfrowe';

  @override
  String get digitalGoodsCreateProductButton => 'Utwórz produkt';

  @override
  String get digitalGoodsLicenseKeyBadge => 'Klucz licencyjny';

  @override
  String get digitalGoodsFileBadge => 'Plik';

  @override
  String get digitalGoodsAllServersBadge => 'Wszystkie serwery';

  @override
  String get digitalGoodsFreeForYou => 'Dla Ciebie za darmo';

  @override
  String get digitalGoodsFreeLabel => 'Za darmo';

  @override
  String digitalGoodsSoldCount(int count) {
    return 'Sprzedano: $count';
  }

  @override
  String get digitalGoodsKeysButton => 'Klucze';

  @override
  String get digitalGoodsGetForFree => 'Odbierz za darmo';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'Kup za $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'Brak zakupów';

  @override
  String get digitalGoodsUnknownProduct => 'Nieznany produkt';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'Zakupiono $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Kopiuj klucz';

  @override
  String get digitalGoodsLicenseKeyCopied => 'Skopiowano klucz licencyjny!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'Wygasa $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'Twój klucz licencyjny';

  @override
  String get digitalGoodsCopyKeyButton => 'Kopiuj klucz';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'Nie udało się rozpocząć płatności -- ten twórca mógł jeszcze nie podłączyć Stripe.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'Zakup zakończony! Znajdziesz go w Moich zakupach.';

  @override
  String get digitalGoodsPurchasePending =>
      'Wciąż czekamy na tę płatność -- pojawi się w Moich zakupach po jej zakończeniu.';

  @override
  String get digitalGoodsCreateProductTitle => 'Utwórz produkt';

  @override
  String get digitalGoodsEditProductTitle => 'Edytuj produkt';

  @override
  String get digitalGoodsProductTitleHint => 'Nazwa produktu';

  @override
  String get digitalGoodsDescriptionHint => 'Opis (opcjonalnie)';

  @override
  String get digitalGoodsPriceHint => 'Cena w USD (zostaw puste dla darmowego)';

  @override
  String get digitalGoodsProductTypeLabel => 'Typ produktu';

  @override
  String get digitalGoodsFileDownloadOption => 'Pobieranie pliku';

  @override
  String get digitalGoodsLicenseKeyOption => 'Klucz licencyjny';

  @override
  String get digitalGoodsAvailabilityLabel => 'Dostępność';

  @override
  String get digitalGoodsThisServerOnlyOption => 'Tylko ten serwer';

  @override
  String get digitalGoodsAllKodaServersOption => 'Wszystkie serwery Koda';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'Po utworzeniu użyj przycisku \"Klucze\", aby przesłać swoje klucze licencyjne.';

  @override
  String get digitalGoodsProductFileLabel => 'Plik produktu';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName (${sizeMb}MB)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Usuń plik';

  @override
  String get digitalGoodsUploadingLabel => 'Przesyłanie...';

  @override
  String get digitalGoodsChooseFileButton => 'Wybierz plik';

  @override
  String get digitalGoodsReplaceFileButton => 'Zamień plik';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Wybierz plik dla tego produktu przed zapisaniem.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'Prześlij klucze licencyjne';

  @override
  String get digitalGoodsPasteKeysHint => 'Wklej jeden klucz w każdej linii:';

  @override
  String get digitalGoodsKeyExampleHint =>
      'KLUCZ-XXXX-XXXX\nKLUCZ-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Prześlij klucze';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'Klucze licencyjne przesłane!';

  @override
  String get serverSubscriptionManageTitle => 'Zarządzaj subskrypcjami';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return 'Subskrypcje $serverName';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Dodaj poziom';

  @override
  String get serverSubscriptionNoTiersYet =>
      'Brak jeszcze poziomów subskrypcji';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Utwórz do 3 poziomów dla swojej społeczności';

  @override
  String get serverSubscriptionCreateFirstTierButton =>
      'Utwórz pierwszy poziom';

  @override
  String get serverSubscriptionShowSubscriberCounts =>
      'Pokazuj liczbę subskrybentów';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/mies.';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktywnego subskrybenta',
      many: '$count aktywnych subskrybentów',
      few: '$count aktywnych subskrybentów',
      one: '$count aktywny subskrybent',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned =>
      'Rola przyznawana automatycznie';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '$discount% zniżki w marketplace';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'Ten serwer nie ma poziomów subskrypcji';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Aktywny subskrybent';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'Wygasa $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk =>
      'Ekskluzywna rola subskrybenta';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return '$discount% zniżki na zakupy w marketplace';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Kanały tylko dla subskrybentów';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Obecnie subskrybujesz';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'Subskrybuj za $price/mies.';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Utwórz poziom';

  @override
  String get serverSubscriptionEditTierTitle => 'Edytuj poziom';

  @override
  String get serverSubscriptionTierNameHint =>
      'Nazwa poziomu (np. Fan, Wspierający, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Opis (opcjonalnie)';

  @override
  String get serverSubscriptionPriceHint => 'Cena miesięczna (USD)';

  @override
  String get serverSubscriptionDiscountLabel => 'Zniżka w marketplace %';

  @override
  String get serverSubscriptionPositionLabel => 'Pozycja';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Poziom $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Przyznaje rolę po subskrypcji — opcjonalnie';

  @override
  String get serverSubscriptionRoleFallback => 'rola';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Przyznawana automatycznie członkowi w momencie subskrypcji i odbierana w momencie jej wygaśnięcia.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Poziom utworzony -- połącz Stripe w Marketplace → Twórca, zanim członkowie będą mogli go subskrybować.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Usuń poziom';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return 'Usunąć \"$tierName\"? Obecni subskrybenci zachowają dostęp do wygaśnięcia.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'Subskrybuj $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel =>
      'Subskrypcja miesięczna';

  @override
  String get serverSubscriptionServerBankEarnsLabel => 'Bank serwera zarabia';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points pkt';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Płatność bezpiecznie przetwarzana przez Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'Subskrybuj';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'Nie udało się rozpocząć płatności -- właściciel tego serwera mógł jeszcze nie podłączyć Stripe.';

  @override
  String get serverSubscriptionSubscribed => 'Zasubskrybowano!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'Wciąż czekamy na tę płatność -- subskrypcja aktywuje się po jej zakończeniu.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'Napiwek dla $username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Wybierz kwotę';

  @override
  String get tipDialogMessageHint => 'Dodaj wiadomość (opcjonalnie)';

  @override
  String get tipDialogYouPayLabel => 'Płacisz';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username otrzymuje';
  }

  @override
  String get tipDialogSendTipButton => 'Wyślij napiwek';

  @override
  String get tipDialogFailedToSendTip =>
      'Nie udało się wysłać napiwku. Twórca może nie być połączony ze Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'Nie udało się rozpocząć płatności. Spróbuj ponownie za chwilę.';

  @override
  String get tipDialogTipSent => 'Napiwek wysłany!';

  @override
  String get tipDialogTipPending =>
      'Wciąż czekamy na tę płatność -- zostanie zrealizowana po jej zakończeniu.';

  @override
  String get tipDialogUnknownUser => 'Nieznany';

  @override
  String get marketplaceTitle => 'Marketplace';

  @override
  String get marketplaceCreatorPayoutsTitle => 'Wypłaty dla twórców';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Odbieraj napiwki bezpośrednio przez Stripe';

  @override
  String get marketplaceTabServerBank => 'Bank serwera';

  @override
  String get marketplaceTabDigitalGoods => 'Produkty cyfrowe';

  @override
  String get marketplaceTabMerch => 'Gadżety';

  @override
  String get marketplaceTabSubscription => 'Subskrypcja';

  @override
  String get marketplaceTabRevenue => 'Przychody';

  @override
  String get marketplaceSelectServerSubscription =>
      'Wybierz serwer, aby zobaczyć jego subskrypcję';

  @override
  String get marketplaceSelectServerBank =>
      'Wybierz serwer, aby zobaczyć jego bank';

  @override
  String get marketplaceSelectServerRevenue =>
      'Wybierz serwer, aby zobaczyć jego przychody';

  @override
  String get marketplaceStripeAccountStatus => 'Konto Stripe';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Rejestracja ukończona';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'Przyjmuje płatności';

  @override
  String get marketplaceConnectStripeButton => 'Połącz konto Stripe';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Dokończ rejestrację w Stripe';

  @override
  String get marketplaceRefreshStatusButton => 'Odśwież status';

  @override
  String get marketplaceReadyToReceiveTips => 'Możesz już odbierać napiwki!';

  @override
  String get marketplaceHowItWorksTitle => 'Jak to działa';

  @override
  String get marketplaceHowItWorksStep1 => 'Połącz swoje konto Stripe';

  @override
  String get marketplaceHowItWorksStep2 => 'Ukończ weryfikację tożsamości';

  @override
  String get marketplaceHowItWorksStep3 =>
      'Odbieraj napiwki bezpośrednio na swoje konto bankowe';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda pobiera 5% opłaty transakcyjnej. Opłata trafia do banku Twojego serwera w postaci punktów.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Tylko właściciel serwera lub osoba z uprawnieniem Zarządzaj marketplace może przeglądać Bank serwera.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName podbity!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit miejsc na własne emoji';
  }

  @override
  String get marketplaceServerFallback => 'Serwer';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance pkt';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount w aktywności';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'Punkty pochodzą z 5% opłaty transakcyjnej od napiwków i subskrypcji na tym serwerze. Używaj punktów, aby odblokować ulepszenia serwera.';

  @override
  String get marketplaceServerBoostsTitle => 'Podbicia serwera';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Poziom $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktywnego podbicia',
      many: '$count aktywnych podbić',
      few: '$count aktywne podbicia',
      one: '$count aktywne podbicie',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: 'Jeszcze $more podbicia do poziomu $level',
      many: 'Jeszcze $more podbić do poziomu $level',
      few: 'Jeszcze $more podbicia do poziomu $level',
      one: 'Jeszcze $more podbicie do poziomu $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' i odblokuj własne tło serwera';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' i odblokuj własną obwódkę ikony serwera';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Masz $count dostępnego tokenu podbicia.',
      many: 'Masz $count dostępnych tokenów podbicia.',
      few: 'Masz $count dostępne tokeny podbicia.',
      one: 'Masz $count dostępny token podbicia.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'Tokeny podbicia pochodzą z subskrypcji Pulse (1/miesiąc). Subskrybuj w zakładce Subskrypcje, aby go otrzymać.';

  @override
  String get marketplaceBoostingLabel => 'Podbijanie...';

  @override
  String get marketplaceBoostThisServerButton => 'Podbij ten serwer';

  @override
  String get marketplaceComingSoonUpgradesTitle =>
      'Wkrótce — Ulepszenia serwera';

  @override
  String get marketplaceSpendPointsList =>
      'Wydaj punkty banku serwera na:\n• Własną domenę serwera\n• Zwiększony limit członków\n• Priorytetowe wsparcie\n• Ekskluzywną odznakę serwera';

  @override
  String get marketplaceSourceTip => 'Napiwki';

  @override
  String get marketplaceSourceSubscription => 'Subskrypcje Koda';

  @override
  String get marketplaceSourceServerSubscription => 'Subskrypcje serwera';

  @override
  String get marketplaceSourceDigitalProduct => 'Produkty cyfrowe';

  @override
  String get marketplaceSourceStageTicket => 'Bilety na scenę';

  @override
  String get marketplaceSourcePrintfulOrder => 'Zamówienia gadżetów';

  @override
  String get marketplaceJustNow => 'przed chwilą';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return '$minutes min temu';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return '$hours godz. temu';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return '$days dni temu';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Tylko osoby mogące zarządzać marketplace mogą przeglądać przychody tego serwera.';

  @override
  String get marketplaceBalanceLabel => 'Saldo';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Zarobione łącznie';

  @override
  String get marketplaceLast30DaysTitle => 'Ostatnie 30 dni';

  @override
  String get marketplaceRevenueBySourceTitle => 'Przychody wg źródła';

  @override
  String get marketplaceNoRevenueYet => 'Brak jeszcze przychodów.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count transakcji',
      many: '$count transakcji',
      few: '$count transakcje',
      one: '$count transakcja',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'Ostatnie transakcje';

  @override
  String get marketplaceNoTransactionsYet => 'Brak jeszcze transakcji.';

  @override
  String get marketplaceNoActivityYet => 'Brak jeszcze aktywności';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zsynchronizowano $count produktu z Printful',
      many: 'Zsynchronizowano $count produktów z Printful',
      few: 'Zsynchronizowano $count produkty z Printful',
      one: 'Zsynchronizowano $count produkt z Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Nie udało się zsynchronizować z Printful -- sprawdź połączenie w ustawieniach Gadżetów.';

  @override
  String get printfulMerchSelectServer =>
      'Wybierz serwer, aby zobaczyć jego gadżety';

  @override
  String get printfulMerchManageCatalogTitle => 'Zarządzaj katalogiem gadżetów';

  @override
  String get printfulMerchTitle => 'Gadżety';

  @override
  String get printfulMerchSyncingLabel => 'Synchronizowanie...';

  @override
  String get printfulMerchSyncCatalogButton => 'Synchronizuj katalog';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'Przełącz na przeglądanie';

  @override
  String get printfulMerchManageTooltip => 'Zarządzaj gadżetami tego serwera';

  @override
  String get printfulMerchNothingSyncedYet =>
      'Nic jeszcze nie zsynchronizowano';

  @override
  String get printfulMerchNoMerchAvailable =>
      'Brak jeszcze dostępnych gadżetów';

  @override
  String get printfulMerchSyncHint =>
      'Zsynchronizuj swój sklep Printful, aby pobrać katalog produktów';

  @override
  String get printfulMerchCheckBackLater =>
      'Zajrzyj tu później po gadżety z tego serwera';

  @override
  String get printfulMerchOutOfStock => 'Brak w magazynie';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Od $price • $count opcji',
      many: 'Od $price • $count opcji',
      few: 'Od $price • $count opcje',
      one: 'Od $price • $count opcja',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'Zobacz';

  @override
  String printfulMerchPayoutTo(String username) {
    return 'Wypłata dla: $username';
  }

  @override
  String get printfulMerchPayoutToYou => 'Wypłata dla: ciebie';

  @override
  String get printfulMerchPayoutChangeButton => 'Zmień';

  @override
  String get printfulMerchPayoutDialogTitle => 'Odbiorca Wypłaty';

  @override
  String get printfulMerchPayoutDialogBody =>
      'Skieruj udział tego produktu w przychodach z zamówienia do innego użytkownika zamiast do siebie -- będzie musiał połączyć własne konto Stripe i ukończyć proces rejestracji, zanim ktokolwiek będzie mógł go kupić.';

  @override
  String get printfulMerchPayoutUsernameHint => 'Nazwa użytkownika';

  @override
  String get printfulMerchPayoutLookupButton => 'Szukaj';

  @override
  String get printfulMerchPayoutUserNotFound =>
      'Nie znaleziono użytkownika o tej nazwie.';

  @override
  String printfulMerchPayoutResolvedAs(String username) {
    return 'Znaleziono: $username';
  }

  @override
  String get printfulMerchPayoutResetButton => 'Przywróć do mnie';

  @override
  String get printfulMerchCartTooltip => 'Koszyk';

  @override
  String printfulMerchAddedToCart(String productName) {
    return 'Dodano $productName do koszyka';
  }

  @override
  String get printfulMerchQuantityLabel => 'Ilość';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Zmniejsz ilość';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Zwiększ ilość';

  @override
  String get printfulMerchAddToCartButton => 'Dodaj do koszyka';

  @override
  String get printfulMerchOptionLabel => 'Opcja';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Styl';

  @override
  String get printfulMerchSizeLabel => 'Rozmiar';

  @override
  String get printfulMerchYourCartTitle => 'Twój koszyk';

  @override
  String get printfulMerchCartEmpty => 'Twój koszyk jest pusty.';

  @override
  String get printfulMerchSubtotalLabel => 'Suma częściowa';

  @override
  String get printfulMerchCheckoutLabel => 'Płatność';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'Usuń z koszyka';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Najpierw uzupełnij adres wysyłki.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'Nie udało się pobrać kosztów wysyłki dla tego adresu.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'Nie udało się rozpocząć płatności. Spróbuj ponownie za chwilę.';

  @override
  String get printfulMerchOrderPlaced => 'Zamówienie złożone!';

  @override
  String get printfulMerchOrderPending =>
      'Wciąż czekamy na tę płatność -- zamówienie zostanie złożone po jej zakończeniu.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Szybkość wysyłki';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max dni roboczych';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => 'Pobierz koszt wysyłki';

  @override
  String get printfulMerchPayButton => 'Zapłać';

  @override
  String get kodaMarketplaceTitle => 'Koda Marketplace';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Subskrypcje';

  @override
  String get kodaMarketplaceTabBoosts => 'Podbicia';

  @override
  String get kodaMarketplaceTabDiscover => 'Odkrywaj';

  @override
  String get kodaMarketplaceTierFreeName => 'Darmowy';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'Wygasa $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks =>
      'Ulepsz, aby otrzymać ekskluzywne korzyści';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dostępnego tokenu podbicia',
      many: '$count dostępnych tokenów podbicia',
      few: '$count dostępne tokeny podbicia',
      one: '$count dostępny token podbicia',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Podaruj token dowolnemu serwerowi, w którym jesteś, w zakładce Bank serwera';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => 'Własna ramka awatara';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Odznaka Spark na profilu';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Zwiększony limit przesyłania plików (50MB)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality =>
      'Priorytetowa jakość głosu';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark =>
      'Wszystko z pakietu Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => 'Animowana ramka awatara';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Odznaka Pulse na profilu';

  @override
  String get kodaMarketplacePulsePerkFileLimit =>
      'Limit przesyłania plików 100MB';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      '1 token podbicia serwera miesięcznie';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/mies.';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Obecny plan';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'Wybierz $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return 'Podaruj $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return 'Podaruj $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'Subskrybuj $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel =>
      'Nazwa użytkownika obdarowanego:';

  @override
  String get kodaMarketplaceUsernameHint => 'Nazwa użytkownika';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Subskrypcja';

  @override
  String get kodaMarketplaceTotalLabel => 'Razem';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Płatność bezpiecznie przetwarzana przez Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'Przejdź do płatności';

  @override
  String get kodaMarketplaceUserNotFound => 'Nie znaleziono użytkownika';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'Nie udało się rozpocząć płatności. Spróbuj ponownie za chwilę.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'Subskrypcja aktywna!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'Wciąż czekamy na tę płatność -- subskrypcja aktywuje się po jej zakończeniu.';

  @override
  String get kodaMarketplaceBoostPurchased => 'Podbicie zakupione!';

  @override
  String get kodaMarketplaceBoostPending =>
      'Wciąż czekamy na tę płatność -- podbicie będzie gotowe po jej zakończeniu.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return 'Dostępnych: $count';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Kup podbicie';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'Jednorazowy zakup -- subskrybenci Pulse otrzymują też jeden darmowy token przy każdym odnowieniu, co pozostaje lepszą opcją przy regularnym podbijaniu.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Kup podbicie -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Żaden serwer nie dołączył jeszcze do Koda Marketplace. Właściciele serwerów mogą to włączyć w ustawieniach Personalizacji swojego serwera.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader =>
      'WYRÓŻNIONE W TYM TYGODNIU';

  @override
  String get kodaMarketplaceAllListedServersHeader =>
      'WSZYSTKIE WYLISTOWANE SERWERY';

  @override
  String get kodaMarketplaceFeaturedItemsHeader => 'POLECANE PRZEDMIOTY';

  @override
  String get kodaMarketplaceAllItemsHeader => 'WSZYSTKIE PRZEDMIOTY';

  @override
  String get kodaMarketplaceServerFallback => 'Serwer';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count członka',
      many: '$count członków',
      few: '$count członków',
      one: '$count członek',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceVisitStore => 'Odwiedź sklep';

  @override
  String get calendarFallbackTitle => 'Kalendarz';

  @override
  String get calendarAskVispTooltip => 'Zapytaj Visp';

  @override
  String get calendarCreateEventTooltip => 'Utwórz wydarzenie';

  @override
  String get calendarPreviousMonthTooltip => 'Poprzedni miesiąc';

  @override
  String get calendarNextMonthTooltip => 'Następny miesiąc';

  @override
  String get calendarTodayButton => 'Dziś';

  @override
  String get calendarWeekdaySun => 'Nd';

  @override
  String get calendarWeekdayMon => 'Pon';

  @override
  String get calendarWeekdayTue => 'Wt';

  @override
  String get calendarWeekdayWed => 'Śr';

  @override
  String get calendarWeekdayThu => 'Czw';

  @override
  String get calendarWeekdayFri => 'Pt';

  @override
  String get calendarWeekdaySat => 'Sob';

  @override
  String get calendarTodaySuffix => ', dziś';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count wydarzenia',
      many: ', $count wydarzeń',
      few: ', $count wydarzenia',
      one: ', $count wydarzenie',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'Wybierz dzień';

  @override
  String get calendarNoEvents => 'Brak wydarzeń';

  @override
  String get calendarSubscribeTooltip => 'Subskrybuj';

  @override
  String get calendarUnsubscribeTooltip => 'Anuluj subskrypcję';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'Powtarza się $recurrence';
  }

  @override
  String get calendarTicketOwned => 'Bilet posiadany';

  @override
  String calendarTicketPrice(String price) {
    return 'Bilet $price';
  }

  @override
  String get calendarDeleteEventTitle => 'Usuń wydarzenie';

  @override
  String calendarDeleteEventConfirm(String title) {
    return 'Usunąć \"$title\"? Tego nie można cofnąć.';
  }

  @override
  String get calendarEditEventTitle => 'Edytuj wydarzenie';

  @override
  String get calendarCreateEventTitle => 'Utwórz wydarzenie';

  @override
  String get calendarEventTitleHint => 'Tytuł wydarzenia';

  @override
  String get calendarDescriptionHint => 'Opis (opcjonalnie)';

  @override
  String get calendarLocationHint => 'Lokalizacja (opcjonalnie)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Początek ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Data i godzina rozpoczęcia, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'Koniec — opcjonalnie ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'Data i godzina zakończenia, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'nie ustawiono';

  @override
  String get calendarTapToSetEndTime => 'Dotknij, aby ustawić czas zakończenia';

  @override
  String get calendarRecurrenceLabel => 'Powtarzanie';

  @override
  String get calendarRecurrenceNone => 'Nie powtarza się';

  @override
  String get calendarRecurrenceDaily => 'Codziennie';

  @override
  String get calendarRecurrenceWeekly => 'Co tydzień';

  @override
  String get calendarRecurrenceMonthly => 'Co miesiąc';

  @override
  String get calendarColorLabel => 'Kolor';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Kolor $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Cena biletu — opcjonalnie';

  @override
  String get calendarLinkStageChannelLabel =>
      'Połącz z kanałem sceny — opcjonalnie';

  @override
  String get calendarStageChannelFallback => 'scena';

  @override
  String get discordImportFetchError => 'Nie udało się pobrać szablonu.';

  @override
  String get discordImportApplyError =>
      'Nie udało się zastosować szablonu. Spróbuj ponownie.';

  @override
  String get discordImportTitle => 'Importuj szablon Discorda';

  @override
  String get discordImportDescription =>
      'Wklej link discord.new lub kod szablonu, aby zaimportować role, kategorie i kanały do tego serwera.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 lub kod szablonu';

  @override
  String get discordImportPreviewButton => 'Podgląd';

  @override
  String get discordImportTemplateFallback => 'Szablon';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count roli',
      many: '$count ról',
      few: '$count role',
      one: '$count rola',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kategorii',
      many: '$count kategorii',
      few: '$count kategorie',
      one: '$count kategoria',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kanału',
      many: '$count kanałów',
      few: '$count kanały',
      one: '$count kanał',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel =>
      'ZASTĄP ISTNIEJĄCĄ STRUKTURĘ';

  @override
  String get discordImportReplaceWarning =>
      'Wszystkie istniejące kanały, kategorie i role zostaną trwale usunięte.';

  @override
  String get discordImportAddDescription =>
      'Szablon zostanie dodany do istniejącej struktury serwera.';

  @override
  String get discordImportReplaceConfirmTitle => 'Zastąpić strukturę serwera?';

  @override
  String get discordImportReplaceConfirmBody =>
      'To trwale usunie WSZYSTKIE istniejące kanały, kategorie i role przed importem. Tego nie można cofnąć.';

  @override
  String get discordImportYesReplace => 'Tak, zastąp';

  @override
  String get discordImportReplaceAndImportButton =>
      'Zastąp i zaimportuj szablon';

  @override
  String get discordImportAddToServerButton => 'Dodaj szablon do serwera';

  @override
  String get thresholdModConfigureTitle => 'Skonfiguruj moderację progową';

  @override
  String get thresholdModConfigureExplanation =>
      'Wybierz zaufanych moderatorów oraz liczbę z nich, która musi się zgodzić, zanim którykolwiek z nich odszyfruje jedną epokę historii kanału. Nawet Ty nie masz jednostronnego klucza -- jesteś zwolniony tylko wtedy, gdy również znajdujesz się na tej liście.';

  @override
  String get thresholdModThresholdLabel => 'Próg:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Zmniejsz próg';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Zwiększ próg';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'z $count moderatora',
      many: 'z $count moderatorów',
      few: 'z $count moderatorów',
      one: 'z $count moderatora',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle =>
      'Zażądaj odszyfrowania progowego';

  @override
  String get thresholdModChannelLabel => 'Kanał';

  @override
  String get thresholdModReasonHint =>
      'Powód -- widoczny dla każdego wyznaczonego moderatora';

  @override
  String get thresholdModRequestButton => 'Zażądaj';

  @override
  String get thresholdModShareRelayed => 'Udział przekazany do zgłaszającego.';

  @override
  String get thresholdModNotEnoughShares =>
      'Nie przekazano jeszcze wystarczającej liczby udziałów -- spróbuj ponownie, gdy więcej moderatorów przekaże swoje.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wiadomości',
      many: '$count wiadomości',
      few: '$count wiadomości',
      one: '$count wiadomość',
    );
    return 'Epoka $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'Brak możliwych do odszyfrowania wiadomości w tej epoce.';

  @override
  String get thresholdModExplanation =>
      'Rzeczywiste odszyfrowanie historii kanału, uzależnione od aktywnej zgody wielu wyznaczonych moderatorów -- nigdy jednej osoby, nawet właściciela serwera. Zawsze odblokowuje całą epokę (wszystko wysłane od ostatniej zmiany członkostwa), nigdy pojedynczą wiadomość.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Włączone -- $count moderatorów, próg $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'Nie skonfigurowano';

  @override
  String get thresholdModReconfigureButton => 'Skonfiguruj ponownie';

  @override
  String get thresholdModEnableButton => 'Włącz';

  @override
  String get thresholdModNotEnabledForServer =>
      'Moderacja progowa nie jest włączona dla tego serwera.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Włączona dla tego serwera. Nie jesteś jednym z wyznaczonych moderatorów.';

  @override
  String get thresholdModRequestsLabel => 'Żądania';

  @override
  String get thresholdModRequestDecryptButton => 'Zażądaj odszyfrowania';

  @override
  String get thresholdModNoActiveRequests => 'Brak aktywnych żądań.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- epoka $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'oczekujące';

  @override
  String get thresholdModStatusApproved => 'zatwierdzone';

  @override
  String get thresholdModApproveButton => 'Zatwierdź';

  @override
  String get thresholdModRelayShareButton => 'Przekaż mój udział';

  @override
  String get thresholdModTryReconstructButton => 'Spróbuj zrekonstruować';

  @override
  String get roleSelectNoRolesAvailable =>
      'Brak dostępnych ról do samodzielnego przypisania.';

  @override
  String get roleSelectInstructions =>
      'Wybierz role, które chcesz mieć. Dotknij roli, aby ją dodać lub usunąć.';

  @override
  String get rulesScreenAcceptError =>
      'Nie udało się zaakceptować regulaminu. Spróbuj ponownie.';

  @override
  String get rulesScreenSubtitle => 'Regulamin serwera';

  @override
  String get rulesScreenScrollToRead =>
      'Przewiń w dół, aby przeczytać cały regulamin';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'Klikając Akceptuję, zgadzasz się przestrzegać tego regulaminu.\nNaruszenia mogą skutkować usunięciem z serwera.';

  @override
  String get rulesScreenAcceptButton => 'Akceptuję regulamin';

  @override
  String get rulesScreenReadAllToContinue =>
      'Przeczytaj cały regulamin, aby kontynuować';

  @override
  String get galleryNewPostTitle => 'Nowy post';

  @override
  String get galleryChooseFileButton => 'Wybierz plik';

  @override
  String get galleryOrDivider => 'lub';

  @override
  String get galleryPasteUrlHint => 'Wklej URL obrazu/wideo';

  @override
  String get galleryTypeLabel => 'Typ';

  @override
  String get galleryImageOption => 'Obraz';

  @override
  String get galleryVideoOption => 'Wideo';

  @override
  String get galleryCaptionHint => 'Podpis (opcjonalnie)';

  @override
  String get galleryPostButton => 'Opublikuj';

  @override
  String get galleryNewCollectionTitle => 'Nowa kolekcja';

  @override
  String get galleryCollectionNameHint => 'Nazwa kolekcji';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return 'Usunąć \"$collectionName\"? Posty w niej staną się nieprzypisane do kolekcji.';
  }

  @override
  String get galleryFeedTab => 'Tablica';

  @override
  String get galleryCollectionsTab => 'Kolekcje';

  @override
  String get galleryNoPostsYet => 'Brak jeszcze postów';

  @override
  String get galleryNoCollectionsYet => 'Brak jeszcze kolekcji';

  @override
  String get gallerySelectACollection => 'Wybierz kolekcję';

  @override
  String get galleryNoPostsInCollection => 'Brak postów w tej kolekcji';

  @override
  String get galleryAddPostButton => 'Dodaj post';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Udostępnianie ekranu nie powiodło się: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return 'Głośność użytkownika $username';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'Wpływa tylko na to, co Ty słyszysz -- to urządzenie, ta rozmowa.';

  @override
  String get voiceScreenResetVolumeButton => 'Resetuj';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'Nie udało się połączyć: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Twój ekran, dotknij, aby wyświetlić na pełnym ekranie';

  @override
  String get voiceScreenYourScreenLabel => 'Twój ekran';

  @override
  String get voiceScreenTapToClose => 'Dotknij, aby zamknąć';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (Ty)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', mówi';

  @override
  String get voiceScreenCameraOnSuffix => ', kamera włączona';

  @override
  String get voiceScreenActivateToPopOut =>
      ', aktywuj, aby otworzyć w osobnym oknie';

  @override
  String get voiceScreenShowVarmTooltip => 'Pokaż VARM';

  @override
  String get voiceScreenHideVarmTooltip => 'Ukryj VARM';

  @override
  String get voiceScreenShowChatTooltip => 'Pokaż czat';

  @override
  String get voiceScreenHideChatTooltip => 'Ukryj czat';

  @override
  String get voiceScreenStartCameraTooltip => 'Włącz kamerę';

  @override
  String get voiceScreenStopCameraTooltip => 'Wyłącz kamerę';

  @override
  String get voiceScreenShareScreenTooltip => 'Udostępnij ekran';

  @override
  String get voiceScreenStopSharingTooltip => 'Zatrzymaj udostępnianie';

  @override
  String get voiceScreenPopOutTooltip => 'Otwórz głos w osobnym oknie';

  @override
  String get voiceScreenCouldNotPopOut =>
      'Nie udało się otworzyć głosu w osobnym oknie.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Opuść kanał głosowy';

  @override
  String get voiceScreenPinTooltip => 'Przypnij (pozostaw otwarte)';

  @override
  String get voiceScreenUnpinTooltip => 'Odepnij';

  @override
  String get voiceScreenSizeSmall => 'Mały (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Średni (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Duży (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, połączonych: $count';
  }

  @override
  String get voiceBarSpeakingSuffix => ', mówisz';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return 'Połączonych: $count · dotknij, aby rozwinąć';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Włącz kamerę';

  @override
  String get voiceBarStopCameraTooltip => 'Wyłącz kamerę';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Opuść kanał głosowy';

  @override
  String get popOutVideoFallbackTitle => 'Głos';

  @override
  String get popOutVideoMissingTokenError => 'Brak tokenu lub adresu URL';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Przekroczono czas oczekiwania na połączenie po 15 sekundach';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Błąd: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'Brak uczestników';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Scena';

  @override
  String get stageCouldNotJoin => 'Nie udało się dołączyć do sceny.';

  @override
  String get stageThisStageFallback => 'Ta scena';

  @override
  String get stageRequiresTicketToJoin => 'wymaga biletu, aby dołączyć';

  @override
  String get stagePleaseWaitLabel => 'Proszę czekać...';

  @override
  String get stageGetFreeTicketButton => 'Odbierz darmowy bilet';

  @override
  String stageBuyTicketButton(String price) {
    return 'Kup bilet -- $price';
  }

  @override
  String get stageNotNowButton => 'Nie teraz';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'Nie udało się rozpocząć zakupu biletu.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'Wciąż czekamy na tę płatność -- spróbuj dołączyć ponownie po jej potwierdzeniu.';

  @override
  String get stageSpeakerBadge => 'Mówca';

  @override
  String get stageListenerBadge => 'Słuchacz';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'Nie udało się dołączyć: $error';
  }

  @override
  String get stageSpeakersHeader => 'MÓWCY';

  @override
  String get stageRaisedHandsHeader => 'ZGŁOSZONE RĘCE';

  @override
  String get stageAllowButton => 'Zezwól';

  @override
  String get stageIgnoreButton => 'Ignoruj';

  @override
  String get stageListenersHeader => 'SŁUCHACZE';

  @override
  String get stageRaiseHandTooltip => 'Zgłoś rękę';

  @override
  String get stageLowerHandTooltip => 'Opuść rękę';

  @override
  String get stageLeaveStageTooltip => 'Opuść scenę';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (Ty)';
  }

  @override
  String get stageMoveToListenersButton => 'Przenieś do słuchaczy';

  @override
  String get stageYouFallbackName => 'Ty';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'Awatar użytkownika $username';
  }

  @override
  String get channelEditDialogNewTitle => 'Nowy kanał';

  @override
  String get channelEditDialogEditTitle => 'Edytuj kanał';

  @override
  String get channelEditDialogNameHint => 'Nazwa kanału';

  @override
  String get channelEditDialogDescriptionHint => 'Temat (opcjonalnie)';

  @override
  String get channelEditDialogTypeLabel => 'Typ';

  @override
  String get channelEditDialogTypeText => 'Tekstowy';

  @override
  String get channelEditDialogTypeVoice => 'Głosowy';

  @override
  String get channelEditDialogTypeGallery => 'Galeria';

  @override
  String get channelEditDialogTypeStage => 'Scena';

  @override
  String get channelEditDialogTypeRules => 'Regulamin';

  @override
  String get channelEditDialogTypeRoleSelection => 'Wybór ról';

  @override
  String get channelEditDialogTypeCalendar => 'Kalendarz';

  @override
  String get channelEditDialogAnnouncementTitle => 'Kanał ogłoszeń';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Publikować mogą tylko członkowie z uprawnieniem do zarządzania wiadomościami';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Publikuj tutaj ogłoszenia o transmisjach na żywo i nowych materiałach';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'Automatycznie publikuje, gdy członek z uprawnieniem \"Ogłaszaj transmisje na żywo\" rozpocznie transmisję na Twitchu lub opublikuje nowy film na YouTube';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Powiadom te role po publikacji (opcjonalnie)';

  @override
  String get channelEditDialogSlowmodeLabel => 'Tryb spowolniony';

  @override
  String get channelEditDialogSlowmodeOff => 'Wyłączony';

  @override
  String get channelEditDialogUserLimitLabel => 'Limit użytkowników';

  @override
  String get channelEditDialogUserLimitOff => 'Bez limitu';

  @override
  String get channelEditDialogCategoryLabel => 'Kategoria';

  @override
  String get channelEditDialogNoCategory => 'Brak kategorii';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Dostęp według ról (zostaw puste dla wszystkich)';

  @override
  String get channelEditDialogContentLabelsLabel => 'Etykiety treści';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Oznacza ten kanał w filtrach treści członków; twardo blokowany dla kont nadzorowanych';

  @override
  String get categoryEditDialogNewTitle => 'Nowa kategoria';

  @override
  String get categoryEditDialogEditTitle => 'Edytuj kategorię';

  @override
  String get categoryEditDialogNameHint => 'Nazwa kategorii';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Dostęp według ról (zostaw puste dla wszystkich)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Członkowie — $count online';
  }

  @override
  String get memberPanelRefreshTooltip => 'Odśwież listę członków';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count członka',
      many: '$count członków',
      few: '$count członków',
      one: '$count członek',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Offline';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', poziom $tier';
  }

  @override
  String get memberPanelUnknownUser => 'Nieznany';

  @override
  String get memberPanelModerationActionsTooltip => 'Działania moderacyjne';

  @override
  String get reportDialogReasonSpam => 'Spam';

  @override
  String get reportDialogReasonHarassment => 'Nękanie lub obraźliwe zachowanie';

  @override
  String get reportDialogReasonIllegal => 'Nielegalna treść';

  @override
  String get reportDialogReasonOther => 'Inne';

  @override
  String get reportDialogReasonLabel => 'Powód';

  @override
  String get reportDialogNoteHint =>
      'Coś jeszcze, o czym powinni wiedzieć moderatorzy? (opcjonalnie)';

  @override
  String get reportDialogDisclosureNote =>
      'Treść wiadomości, którą widzisz, oraz jej nadawca zostaną udostępnione moderatorom tego serwera.';

  @override
  String get reportDialogSubmitButton => 'Wyślij zgłoszenie';

  @override
  String get reportDialogSubmitError => 'Nie udało się wysłać zgłoszenia.';

  @override
  String get notificationBellTitle => 'Powiadomienia';

  @override
  String get notificationBellMarkAllRead => 'Oznacz wszystkie jako przeczytane';

  @override
  String get notificationBellEmptyState => 'Brak jeszcze powiadomień';

  @override
  String get notificationBellUnreadLabel => 'Nieprzeczytane';

  @override
  String get invitePreviewTitle => 'Zaproszenie do serwera';

  @override
  String get invitePreviewInvalidOrExpired =>
      'Nieprawidłowe lub wygasłe zaproszenie.';

  @override
  String get invitePreviewCouldNotJoin => 'Nie udało się dołączyć do serwera.';

  @override
  String get invitePreviewUnknownServer => 'Nieznany serwer';

  @override
  String get shippingAddressFullNameHint => 'Imię i nazwisko';

  @override
  String get shippingAddressLine1Hint => 'Adres, linia 1';

  @override
  String get shippingAddressLine2Hint => 'Adres, linia 2 (opcjonalnie)';

  @override
  String get shippingAddressCityHint => 'Miasto';

  @override
  String get shippingAddressStateHint => 'Województwo/stan';

  @override
  String get shippingAddressZipHint => 'Kod pocztowy';

  @override
  String get shippingAddressCountryCodeHint => 'Kod kraju (np. PL)';

  @override
  String get shippingAddressPhoneHint => 'Telefon (opcjonalnie)';

  @override
  String get shippingAddressPrivacyNote =>
      'Używane wyłącznie do wysyłki tego zamówienia -- zobacz politykę prywatności Printful, aby dowiedzieć się, jak dane są traktowane po złożeniu zamówienia.';

  @override
  String get updateNudgeAvailableTitle => 'Dostępna aktualizacja';

  @override
  String get updateNudgeRequiredTitle => 'Wymagana aktualizacja';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Dostępna jest Koda $version -- używasz starszej wersji.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'Ta wersja nie jest już wspierana. Zaktualizuj do Koda $version, aby dalej korzystać z Kody.';
  }

  @override
  String get updateNudgeLaterButton => 'Później';

  @override
  String get tierBadgeSparkSubscriber => 'Subskrybent Spark';

  @override
  String get tierBadgePulseSubscriber => 'Subskrybent Pulse';

  @override
  String get tierBadgeAlphaSpark => 'Alpha Spark';

  @override
  String get tierBadgeFounder => 'Founder';

  @override
  String get foundersHallTitle => 'Sala Założycieli';

  @override
  String get foundersHallSubtitle =>
      'Najwcześniejsi wspierający, którzy umożliwili powstanie Koda.';

  @override
  String get foundersHallEmptyState => 'Jeszcze nie ma założycieli.';

  @override
  String get settingsFoundersHallTitle => 'Sala Założycieli';

  @override
  String get settingsFoundersHallSubtitle => 'Zobacz, kto pomógł zbudować Koda';

  @override
  String get vispAvatarInDevelopment => 'W TRAKCIE PRAC';

  @override
  String get vispBoostAdvisorCouldNotAnswer =>
      'Visp nie mógł przygotować odpowiedzi.';

  @override
  String get vispBoostAdvisorTitle => 'Zapytaj Visp: Doradca ROI podbić';

  @override
  String get vispBoostAdvisorFollowUpHint => 'Zadaj kolejne pytanie...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Wyślij';

  @override
  String get vispBoostAdvisorBasedOn => 'Na podstawie:';

  @override
  String get vispEventDialogCouldNotGenerate =>
      'Visp nie mógł wygenerować wydarzenia.';

  @override
  String get vispEventDialogCouldNotCreate =>
      'Nie udało się utworzyć tego wydarzenia.';

  @override
  String get vispEventDialogRecurrenceNone => 'Jednorazowe';

  @override
  String get vispEventDialogRecurrenceDaily => 'Powtarza się codziennie';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Powtarza się co tydzień';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Powtarza się co miesiąc';

  @override
  String get vispEventDialogTitle => 'Poproś Visp o utworzenie wydarzenia';

  @override
  String get vispEventDialogDescription =>
      'Opisz wydarzenie -- Visp zaproponuje tytuł, datę/godzinę i inne szczegóły.';

  @override
  String get vispEventDialogPromptHint =>
      'np. \"Cotygodniowa sesja D&D w każdy piątek o 19:00, trwająca około 3 godzin\"';

  @override
  String get vispEventDialogPrivacyNote =>
      'Twój opis jest wysyłany do Visp (asystenta hostowanego samodzielnie -- nic nie opuszcza serwerów Kody), aby wygenerować ten plan.';

  @override
  String get vispEventDialogStartOver => 'Zacznij od nowa';

  @override
  String get vispEventDialogCreateEvent => 'Utwórz wydarzenie';

  @override
  String get vispEventDialogThinking => 'Myślę...';

  @override
  String get vispEventDialogGeneratePlan => 'Wygeneruj plan';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'Nie udało się rozpoznać daty -- spróbuj sformułować to inaczej';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Kończy się $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price za bilet';
  }

  @override
  String get vispEventDialogBasedOn => 'Na podstawie:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Pytanie $questionNumber z $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'Lub wpisz własną odpowiedź...';

  @override
  String get vispQuestionStepSendTooltip => 'Wyślij';

  @override
  String get vispQuestionStepSkip => 'Pomiń i wygeneruj teraz';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp nie mógł wygenerować planu.';

  @override
  String get vispSetupDialogCouldNotApplyPlan =>
      'Nie udało się zastosować tego planu.';

  @override
  String get vispSetupDialogTitleNew => 'Opisz swój serwer dla Visp';

  @override
  String get vispSetupDialogTitleExisting =>
      'Poproś Visp o rozbudowę tego serwera';

  @override
  String get vispSetupDialogDescriptionNew =>
      'Opisz serwer, jaki chcesz mieć -- Visp zaproponuje nazwę oraz zestaw ról, kategorii i kanałów.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Opisz, co chcesz dodać -- Visp zaproponuje role, kategorie i kanały do utworzenia.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'np. \"Przytulny serwer dla mojej grupy D&D z kanałami głosowymi dla dwóch stolików\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'np. \"Dodaj kilka kolejnych kanałów dla naszych drużyn raidowych\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      'Twój opis jest wysyłany do Visp (asystenta hostowanego samodzielnie -- nic nie opuszcza serwerów Kody), aby wygenerować ten plan.';

  @override
  String get vispSetupDialogStartOver => 'Zacznij od nowa';

  @override
  String get vispSetupDialogCreateServer => 'Utwórz serwer';

  @override
  String get vispSetupDialogAddToServer => 'Dodaj do serwera';

  @override
  String get vispSetupDialogThinking => 'Myślę...';

  @override
  String get vispSetupDialogGeneratePlan => 'Wygeneruj plan';

  @override
  String get vispSetupDialogNewServerLabel => 'Nowy serwer';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count roli',
      many: '$count ról',
      few: '$count role',
      one: '$count rola',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kategorii',
      many: '$count kategorii',
      few: '$count kategorie',
      one: '$count kategoria',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kanału',
      many: '$count kanałów',
      few: '$count kanały',
      one: '$count kanał',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'Na podstawie:';

  @override
  String get childLockoutTitle => 'To poza Twoimi dozwolonymi godzinami';

  @override
  String get childLockoutBody =>
      'Rodzic lub opiekun ustawił godziny, w których to konto może korzystać z Kody. Poproś go o więcej czasu lub zajrzyj ponownie w kolejnym dozwolonym okresie.';

  @override
  String get childLockoutLogOutButton => 'Wyloguj się';

  @override
  String get forcePasswordChangeError =>
      'Nie udało się zaktualizować hasła. Spróbuj ponownie.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Witaj, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Twoje konto wymaga nowego hasła, zanim będziesz mógł kontynuować.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'Nowe hasło';

  @override
  String get forcePasswordChangeConfirmPasswordHint => 'Potwierdź nowe hasło';

  @override
  String get forcePasswordChangeReqLength => 'Co najmniej 12 znaków';

  @override
  String get forcePasswordChangeReqUpper => 'Jedna wielka litera';

  @override
  String get forcePasswordChangeReqLower => 'Jedna mała litera';

  @override
  String get forcePasswordChangeReqDigit => 'Jedna cyfra';

  @override
  String get forcePasswordChangeReqMatch => 'Hasła są zgodne';

  @override
  String get forcePasswordChangeSubmitButton => 'Ustaw nowe hasło';

  @override
  String get forgotPasswordEnterEmailError => 'Podaj swój adres e-mail.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'Jeśli takie konto istnieje, wysłano kod resetujący.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Podaj kod oraz hasło o długości co najmniej 8 znaków.';

  @override
  String get forgotPasswordInvalidCode => 'Nieprawidłowy lub wygasły kod.';

  @override
  String get forgotPasswordTitle => 'Zresetuj hasło';

  @override
  String get forgotPasswordEmailHint => 'Adres e-mail';

  @override
  String get forgotPasswordSendCodeButton => 'Wyślij kod resetujący';

  @override
  String get forgotPasswordCodeHint => '6-cyfrowy kod';

  @override
  String get forgotPasswordNewPasswordHint => 'Nowe hasło';

  @override
  String get forgotPasswordSetNewPasswordButton => 'Ustaw nowe hasło';

  @override
  String get verifyEmailEnterCodeError => 'Podaj 6-cyfrowy kod z e-maila.';

  @override
  String get verifyEmailInvalidCode => 'Nieprawidłowy lub wygasły kod.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'Nowy kod został wysłany na $email.';
  }

  @override
  String get verifyEmailResendFailed => 'Nie udało się teraz wysłać ponownie.';

  @override
  String get verifyEmailTitle => 'Sprawdź swoją pocztę';

  @override
  String verifyEmailSentCode(String email) {
    return 'Wysłaliśmy 6-cyfrowy kod na $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'Zweryfikuj e-mail';

  @override
  String get verifyEmailResendButton => 'Wyślij kod ponownie';

  @override
  String get safetyNumberKeysNotSetUp =>
      'Twoje własne klucze nie zostały jeszcze skonfigurowane.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName nie ma jeszcze pakietu kluczy.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'Nie udało się obliczyć numeru bezpieczeństwa: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName nie ma już tego urządzenia.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'Numer bezpieczeństwa z $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Porównaj ten numer z $peerName za pomocą innego kanału -- osobiście, przez rozmowę telefoniczną, gdziekolwiek poza tym czatem. Jeśli zgadza się po obu stronach, rozmawiasz z tą osobą, z którą myślisz, że rozmawiasz.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName ma $count urządzeń, każde z własnym numerem bezpieczeństwa -- zweryfikowanie jednego nie obejmuje pozostałych.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Urządzenie $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Oznacz jako zweryfikowane';

  @override
  String get contentFiltersDescription =>
      'Serwery mogą oznaczać kanały etykietami treści. Wybierz, jak mają zachowywać się oznaczone kanały -- to Twoja własna preferencja i nigdy nie wpływa na to, co widzą inni.';

  @override
  String get contentFiltersLabelAdult => 'Treści dla dorosłych';

  @override
  String get contentFiltersLabelSuggestive => 'Treści sugestywne';

  @override
  String get contentFiltersLabelGraphic => 'Drastyczne materiały';

  @override
  String get contentFiltersLabelNudity => 'Nagość bez podtekstu seksualnego';

  @override
  String get contentFiltersDescAdult =>
      'Treści o charakterze jednoznacznie seksualnym';

  @override
  String get contentFiltersDescSuggestive =>
      'Treści sugestywne seksualnie, ale nie jednoznaczne';

  @override
  String get contentFiltersDescGraphic => 'Przemoc lub drastyczne sceny';

  @override
  String get contentFiltersDescNudity =>
      'Nagość w kontekście niezwiązanym z seksualnością';

  @override
  String get contentFiltersHide => 'Ukryj';

  @override
  String get contentFiltersWarn => 'Ostrzegaj';

  @override
  String get contentFiltersShow => 'Pokaż';

  @override
  String get deviceTestCouldNotGetToken =>
      'Nie udało się uzyskać tokenu testowego.';

  @override
  String get deviceTestLabelTest => 'Testuj';

  @override
  String get deviceTestLabelRecording => 'Nagrywanie...';

  @override
  String get deviceTestLabelPlayingBack => 'Odtwarzanie...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'Nie udało się uruchomić kamery: $error';
  }

  @override
  String get deviceTestTitle => 'Testuj urządzenia';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'Nie udało się połączyć: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Mikrofon';

  @override
  String get deviceTestHearYourselfLabel => 'Usłysz siebie (z opóźnieniem)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Głośnik / wyjście';

  @override
  String get deviceTestCameraLabel => 'Kamera';

  @override
  String get deviceTestSystemDefault => 'Domyślne systemowe';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Powiedz coś, a następnie usłyszysz odtworzenie $seconds-sekundowego nagrania';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '$seconds s';
  }

  @override
  String get deviceTestCameraPreviewOff => 'Podgląd kamery wyłączony';

  @override
  String get deviceTestStopCameraButton => 'Zatrzymaj test kamery';

  @override
  String get deviceTestTestCameraButton => 'Testuj kamerę';

  @override
  String get deviceTestInputLevelLabel => 'Poziom wejścia';

  @override
  String get devicesScreenRemoveConfirmTitle => 'Usunąć to urządzenie?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'Będzie musiało zalogować się ponownie, a wiadomości wysłane do niego w czasie, gdy było usunięte, nie dotrą do niego później -- sesje Double Ratchet nie uzupełniają luk wstecz.';

  @override
  String get devicesScreenRemoveFailed =>
      'Nie udało się usunąć tego urządzenia.';

  @override
  String get devicesScreenNeverActive => 'Nigdy nieaktywne';

  @override
  String devicesScreenActiveDate(String date) {
    return 'Aktywne $date';
  }

  @override
  String get devicesScreenDescription =>
      'Każde urządzenie, na którym się logujesz, ma własną tożsamość szyfrowania -- wiadomość wysłana do Ciebie dociera do każdego z poniższych urządzeń. Usuń te, których nie używasz lub nie rozpoznajesz.';

  @override
  String get devicesScreenNoDevicesFound => 'Nie znaleziono urządzeń.';

  @override
  String get devicesScreenUnknownDevice => 'Nieznane urządzenie';

  @override
  String get devicesScreenThisDeviceBadge => 'To urządzenie';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Usuń urządzenie';

  @override
  String get totpSetupInvalidCode => 'Nieprawidłowy kod. Spróbuj ponownie.';

  @override
  String get totpSetupEnabledMessage =>
      'Uwierzytelnianie dwuskładnikowe jest włączone.';

  @override
  String get totpSetupScanInstructions =>
      'Zeskanuj ten sekret w aplikacji uwierzytelniającej (Google Authenticator, 1Password, Authy):';

  @override
  String get totpSetupCodeHint => 'Wpisz 6-cyfrowy kod, aby potwierdzić';

  @override
  String get totpSetupVerifyButton => 'Zweryfikuj i włącz';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'Naciśnij, aby mówić';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'Naciśnij dowolny klawisz, aby go przypisać...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Testuj urządzenia';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Przetwarzanie głosu';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'Redukcja szumów';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Zmniejsz hałas otoczenia w mikrofonie';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Zaawansowana redukcja szumów (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'Usuwanie szumów przez AI w czasie rzeczywistym, silniejsze niż standardowa redukcja -- zastępuje ją, gdy włączone';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'Redukcja echa';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Zapobiegaj odbijaniu się własnego dźwięku echem';

  @override
  String get voiceVideoSettingsAutoGainTitle =>
      'Automatyczna regulacja wzmocnienia';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Automatycznie wyrównuje głośność mikrofonu (normalizacja głośności)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle =>
      'Automatyczne wyciszanie innych';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Obniż głośność innych uczestników, gdy Ty mówisz';

  @override
  String get voiceVideoSettingsHighPassTitle => 'Filtr górnoprzepustowy';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Wytnij niskoczęstotliwościowy pomruk (wentylatory, klimatyzacja, stukanie w biurko)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle => 'Wykrywanie dźwięku pisania';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Tłum stukot klawiatury wychwytywany przez mikrofon';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Izolacja głosu';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Skup się na Twoim głosie, odfiltrowując inne osoby i dźwięki w otoczeniu';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Wzmocnienie mikrofonu';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Włącz wzmocnienie';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Wzmocnienie przedwzmacniacza dla cichego lub odległego mikrofonu -- stosowane przed korektorem';

  @override
  String get voiceVideoSettingsBandBoost => 'Wzmocnienie';

  @override
  String get voiceVideoSettingsSectionMicEq => 'Korektor mikrofonu';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'Włącz korektor';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Kształtuj brzmienie mikrofonu, zanim dotrze do innych';

  @override
  String get voiceVideoSettingsBandBass => 'Basy';

  @override
  String get voiceVideoSettingsBandMid => 'Środek';

  @override
  String get voiceVideoSettingsBandTreble => 'Wysokie tony';

  @override
  String get voiceVideoSettingsSectionVad =>
      'Wykrywanie aktywności głosowej (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'Włącz VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Przesyłaj dźwięk tylko wtedy, gdy faktycznie mówisz';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Czułość';

  @override
  String get voiceVideoSettingsVadHint =>
      'Niżej = wychwytuje cichsze dźwięki. Wyżej = tylko głośniejsza mowa uruchamia transmisję.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Przypisany klawisz';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'Nie ustawiono — mikrofon pozostaje aktywny, gdy jest odciszony';

  @override
  String get voiceVideoSettingsClearButton => 'Wyczyść';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Ustaw klawisz';

  @override
  String get voiceVideoSettingsChangeButton => 'Zmień';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'Gdy klawisz jest przypisany, mikrofon przesyła dźwięk tylko, gdy trzymasz ten klawisz wciśnięty. Ma to pierwszeństwo przed VOX podczas przebywania na kanale głosowym.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Model reaktywnego awatara wirtualnego';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Prześlij dwa obrazy, które zamieniają się miejscami, gdy mówisz. Widoczne tylko dla Ciebie.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'Cisza';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'Mówienie';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'Próg mówienia';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Niżej = łatwiej przełącza się na obraz mówienia.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'Usuń VARM';

  @override
  String get gifPickerNoGifsFound => 'Nie znaleziono GIF-ów';

  @override
  String get gifPickerSearchHint => 'Szukaj GIF-ów...';

  @override
  String get messageSearchHint => 'Szukaj w tym kanale...';

  @override
  String get messageSearchTooltip => 'Szukaj';

  @override
  String get messageSearchInitialHint =>
      'Przeszukuje wiadomości już wczytane na tym urządzeniu -- starsza historia jest pobierana (i lokalnie odszyfrowywana) w miarę przewijania wstecz.';

  @override
  String get messageSearchNoMatches => 'Brak wyników';

  @override
  String get messageSearchStartOfHistory => 'Początek historii kanału';

  @override
  String get messageSearchFurtherBackButton => 'Szukaj dalej wstecz';

  @override
  String get messageSearchUnknownAuthor => 'Nieznany';
}
