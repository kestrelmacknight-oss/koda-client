// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'Zrušit';

  @override
  String get commonSave => 'Uložit';

  @override
  String get commonEdit => 'Upravit';

  @override
  String get commonDelete => 'Smazat';

  @override
  String get commonCreate => 'Vytvořit';

  @override
  String get commonClose => 'Zavřít';

  @override
  String get commonDone => 'Hotovo';

  @override
  String get commonDownload => 'Stáhnout';

  @override
  String get commonDisconnect => 'Odpojit';

  @override
  String get commonNone => 'Žádné';

  @override
  String get commonJoin => 'Připojit se';

  @override
  String get commonDismiss => 'Zavřít';

  @override
  String get commonSubmit => 'Odeslat';

  @override
  String get commonConfirm => 'Potvrdit';

  @override
  String get commonRemove => 'Odebrat';

  @override
  String get commonRetry => 'Zkusit znovu';

  @override
  String get commonOk => 'OK';

  @override
  String get commonYes => 'Ano';

  @override
  String get commonNo => 'Ne';

  @override
  String get commonSearch => 'Hledat';

  @override
  String get commonSettings => 'Nastavení';

  @override
  String get commonLoading => 'Načítání...';

  @override
  String get settingsLanguageSection => 'Jazyk';

  @override
  String get settingsLanguageTitle => 'Jazyk aplikace';

  @override
  String get settingsLanguageSystemDefault => 'Výchozí podle systému';

  @override
  String get settingsLanguageDescription =>
      'Vyberte jazyk, ve kterém se zobrazuje samotné rozhraní Kody. To je nezávislé na hlavním jazyce jakéhokoli serveru nebo na jazyce, ve kterém píšete zprávy.';

  @override
  String get settingsTitle => 'Nastavení';

  @override
  String get settingsSignOut => 'Odhlásit se';

  @override
  String get settingsSectionMyAccount => 'Můj účet';

  @override
  String get settingsSectionSecurity => 'Zabezpečení';

  @override
  String get settingsSectionAccessibility => 'Přístupnost';

  @override
  String get settingsSectionBilling => 'Fakturace';

  @override
  String get settingsSectionFamily => 'Rodina';

  @override
  String get settingsSectionVoiceVideo => 'Hlas a video';

  @override
  String get settingsSectionDesktop => 'Počítač';

  @override
  String get settingsSectionAbout => 'O aplikaci';

  @override
  String get settingsTwoFactorTitle => 'Dvoufaktorové ověřování';

  @override
  String get settingsTwoFactorSubtitle =>
      'Přidejte autentizační aplikaci pro vyšší zabezpečení';

  @override
  String get settingsLinkedDevicesTitle => 'Propojená zařízení';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'Zobrazte a odeberte zařízení přihlášená k tomuto účtu';

  @override
  String get settingsContentFiltersTitle => 'Filtry obsahu';

  @override
  String get settingsContentFiltersSubtitle =>
      'Vyberte, jak se má zobrazovat označený obsah';

  @override
  String get settingsDmFriendsOnlyTitle =>
      'Povolit soukromé zprávy jen od přátel';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Lidé, kteří nejsou vašimi přáteli, s vámi nemohou zahájit novou konverzaci';

  @override
  String get settingsDmPrivacyError =>
      'Nepodařilo se aktualizovat soukromí soukromých zpráv.';

  @override
  String get settingsShowVispAvatarTitle => 'Zobrazovat avatara Visp';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Zobrazuje tvář a náladu Visp v jeho dialozích nastavení, událostí a rad';

  @override
  String get settingsHighContrastTitle => 'Vysoký kontrast';

  @override
  String get settingsHighContrastSubtitle =>
      'Čistě černobílé, vysoce kontrastní barvy v celé aplikaci -- přepnutí na chvíli znovu načte aktuální obrazovku.';

  @override
  String get settingsDyslexiaFontTitle => 'Písmo přívětivé pro dyslektiky';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Přepne text v celé aplikaci na OpenDyslexic';

  @override
  String get settingsFontSizeTitle => 'Velikost písma';

  @override
  String get settingsFontSizeSample => 'Příliš žluťoučký kůň úpěl ďábelské ódy';

  @override
  String get settingsDensityTitle => 'Hustota';

  @override
  String get settingsDensityDescription =>
      'Ovlivňuje rozestupy standardních prvků -- tlačítek, přepínačů, dialogů -- ne každé vlastní rozvržení.';

  @override
  String get settingsDensityCompact => 'Kompaktní';

  @override
  String get settingsDensityStandard => 'Standardní';

  @override
  String get settingsDensityComfortable => 'Pohodlná';

  @override
  String get settingsStreamingTitle => 'Streamovací účty';

  @override
  String get settingsStreamingDescription =>
      'Propojte Twitch/YouTube, aby servery, kde máte oprávnění \"Oznamovat vysílání\", mohly automaticky zveřejnit příspěvek, když začnete vysílat naživo nebo nahrajete nové video.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform připojeno jako $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform nepřipojeno';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- právě vysílá';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- nové nahrání';

  @override
  String get settingsStreamingConnecting => 'Připojování...';

  @override
  String get settingsStreamingConnect => 'Připojit';

  @override
  String get settingsAnnounceLiveTwitch => 'Oznámit, když začnu vysílat naživo';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Oznamovat živá vysílání a nová nahrání';

  @override
  String get settingsRefreshStatus =>
      'Už jste připojeni v prohlížeči? Obnovit stav';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'Nepodařilo se zahájit připojení $platform.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Dokončete připojení v prohlížeči a poté se vraťte a obnovte stránku.';

  @override
  String get settingsThroneTitle => 'Webhook Throne';

  @override
  String get settingsThroneDescription =>
      'Vložte tuto adresu URL do nastavení webhooku na Throne.com, abyste v Kodě dostávali upozornění, kdykoli vám někdo pošle dárek.';

  @override
  String get settingsThroneGetUrl => 'Získat adresu URL mého webhooku';

  @override
  String get settingsThroneCopyTooltip => 'Kopírovat';

  @override
  String get settingsThroneCopiedToast => 'Zkopírováno do schránky';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Znovu vygenerovat (stará adresa URL přestane platit)';

  @override
  String get settingsThroneRegenerateConfirmTitle =>
      'Znovu vygenerovat adresu URL webhooku?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'Vaše stará adresa URL přestane fungovat, proto ji poté aktualizujte na Throne.com.';

  @override
  String get settingsThroneRegenerate => 'Znovu vygenerovat';

  @override
  String get settingsUploadPhoto => 'Nahrát fotku';

  @override
  String get settingsOrPasteUrl => 'nebo vložte adresu URL níže';

  @override
  String get settingsAvatarUrlHint => 'https://priklad.cz/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'Nahrání obrázku vyžaduje Cloudflare R2 — vložení URL funguje vždy.';

  @override
  String get settingsDisplayNameLabel => 'ZOBRAZOVANÉ JMÉNO';

  @override
  String get settingsDisplayNameHint => 'Zobrazované jméno';

  @override
  String get settingsBioLabel => 'PROFIL';

  @override
  String get settingsBioHint => 'Napište ostatním něco málo o sobě';

  @override
  String get settingsPronounsLabel => 'ZÁJMENA';

  @override
  String get settingsPronounsHint => 'např. on/jeho';

  @override
  String get settingsShowPronounsTitle => 'Zobrazovat moje zájmena ostatním';

  @override
  String get settingsShowPronounsSubtitle =>
      'Zobrazují se vedle vašeho jména v chatu, seznamech členů a hlasu';

  @override
  String get settingsStatusLabel => 'STAV';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusAway => 'Pryč';

  @override
  String get statusDnd => 'Nerušit';

  @override
  String get statusInvisible => 'Neviditelný';

  @override
  String get settingsFamilyNotAvailable =>
      'Rodičovská kontrola není u spravovaného účtu k dispozici.';

  @override
  String get settingsAboutTitle => 'O Kodě';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Podmínky použití';

  @override
  String get settingsPrivacyTitle => 'Zásady ochrany osobních údajů';

  @override
  String get settingsSupportTitle => 'Podpora';

  @override
  String get settingsReportSecurityTitle => 'Nahlásit bezpečnostní problém';

  @override
  String get settingsDesktopNotAvailable =>
      'Toto jsou nastavení pouze pro počítač -- na této platformě neexistuje okno ani systémová lišta.';

  @override
  String get settingsCloseToTrayTitle => 'Zavřít do systémové lišty';

  @override
  String get settingsCloseToTraySubtitle =>
      'Zavření okna nechá Kodu běžet na pozadí, takže budete i nadále dostávat upozornění -- vypněte to, aby zavření okna aplikaci skutečně ukončilo.';

  @override
  String get authErrorEmailPasswordRequired => 'Je vyžadován e-mail a heslo.';

  @override
  String get authErrorIncorrectCredentials => 'Nesprávný e-mail nebo heslo.';

  @override
  String get authErrorMustAcceptTerms => 'Přijměte prosím Podmínky použití.';

  @override
  String get authErrorAllFieldsRequired => 'Všechna pole jsou povinná.';

  @override
  String get authErrorPasswordsDontMatch => 'Hesla se neshodují.';

  @override
  String get authErrorPasswordTooShort => 'Heslo musí mít alespoň 8 znaků.';

  @override
  String get authErrorRegistrationFailed =>
      'Registrace se nezdařila. Tento e-mail se možná už používá.';

  @override
  String get authTabSignIn => 'Přihlásit se';

  @override
  String get authTabCreateAccount => 'Vytvořit účet';

  @override
  String get authAgreementPrefix => 'Používáním Kody souhlasíte s našimi ';

  @override
  String get authTermsLink => 'Podmínkami použití';

  @override
  String get authAgreementMiddle => ' a ';

  @override
  String get authPrivacyLink => 'Zásadami ochrany osobních údajů';

  @override
  String get authAgreementSuffix => '.';

  @override
  String get authEmailHint => 'E-mailová adresa';

  @override
  String get authPasswordHint => 'Heslo';

  @override
  String get authForgotPassword => 'Zapomenuté heslo?';

  @override
  String get authSignInButton => 'Přihlásit se';

  @override
  String get authUsernameHint => 'Uživatelské jméno';

  @override
  String get authConfirmPasswordHint => 'Potvrďte heslo';

  @override
  String get authAgreeToTerms =>
      'Souhlasím s Podmínkami použití a Zásadami ochrany osobních údajů';

  @override
  String get authCreateAccountButton => 'Vytvořit účet';

  @override
  String get dmSafetyNumberChangedWarning =>
      'Bezpečnostní číslo této konverzace se změnilo -- před odesláním ho ověřte.';

  @override
  String get dmMessageNotSent => 'Zpráva nebyla odeslána.';

  @override
  String dmEncryptMessageError(String error) {
    return 'Nepodařilo se zašifrovat zprávu: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'Nahrání přílohy se nezdařilo.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'Nepodařilo se zašifrovat přílohu: $error';
  }

  @override
  String get dmReportMessage => 'Nahlásit zprávu';

  @override
  String get dmReportSubmitted => 'Nahlášení odesláno.';

  @override
  String get dmTitle => 'Zprávy';

  @override
  String get dmNewMessage => 'Nová zpráva';

  @override
  String get dmNoConversationsYet => 'Zatím žádné konverzace';

  @override
  String get dmSelectConversation => 'Vyberte konverzaci';

  @override
  String get dmVerifySafetyNumberTooltip => 'Ověřit bezpečnostní číslo';

  @override
  String get dmSeenLabel => 'Zobrazeno';

  @override
  String get dmMessageActionsTooltip => 'Akce zprávy';

  @override
  String get dmRemoveAttachmentTooltip => 'Odebrat přílohu';

  @override
  String get dmAttachFileTooltip => 'Připojit soubor';

  @override
  String get dmMessageHint => 'Zpráva...';

  @override
  String get dmSendMessageTooltip => 'Odeslat zprávu';

  @override
  String get dmNoFriendsYet =>
      'Zatím žádní přátelé.\nPro začátek odešlete žádost o přátelství.';

  @override
  String get dmUnfriendTooltip => 'Zrušit přátelství';

  @override
  String get dmNoPendingRequests => 'Žádné čekající žádosti o přátelství.';

  @override
  String get dmIncomingRequestsLabel => 'PŘÍCHOZÍ';

  @override
  String get dmSentRequestsLabel => 'ODESLANÉ';

  @override
  String get dmAcceptTooltip => 'Přijmout';

  @override
  String get dmDeclineTooltip => 'Odmítnout';

  @override
  String get dmPendingLabel => 'Čeká se';

  @override
  String get dmNewMessageDialogTitle => 'Nová zpráva';

  @override
  String get dmEnterUsernameHint => 'Zadejte uživatelské jméno';

  @override
  String get dmOpenButton => 'Otevřít';

  @override
  String dmSavedAttachment(String fileName) {
    return 'Uloženo $fileName';
  }

  @override
  String get dmUnknownUser => 'Neznámý';

  @override
  String get dmEndToEndEncryptedTooltip => 'Šifrováno mezi koncovými body';

  @override
  String get homeContentWarningTitle => 'Upozornění na obsah';

  @override
  String homeContentWarningBody(String labels) {
    return 'Tento kanál je označen jako: $labels.\n\nZměňte to v Nastavení > Zabezpečení > Filtry obsahu.';
  }

  @override
  String get homeViewAnyway => 'Přesto zobrazit';

  @override
  String get homeCouldNotConnectVoice => 'Nepodařilo se připojit k hlasu.';

  @override
  String get homeCreateServer => 'Vytvořit server';

  @override
  String get homeJoinServer => 'Připojit se k serveru';

  @override
  String get homeRedeemCode => 'Uplatnit kód';

  @override
  String get homeJoinServerDialogTitle => 'Připojit se k serveru';

  @override
  String get homeEnterInviteCode => 'Zadejte kód pozvánky nebo URL:';

  @override
  String get homeInviteCodeHint => 'např. XK9MP2';

  @override
  String get homeJoined => 'Připojeno!';

  @override
  String get homeInvalidInvite => 'Neplatný nebo vypršelý kód pozvánky.';

  @override
  String get homeJoinButton => 'Připojit se';

  @override
  String get homeRedeemCodeDialogTitle => 'Uplatnit kód';

  @override
  String get homeEnterBackerCode =>
      'Zadejte svůj kód podporovatele nebo odměny:';

  @override
  String get homeRewardCodeHint => 'Kód odměny';

  @override
  String get homeCodeRedeemed => 'Kód byl uplatněn! Vaše odměny byly použity.';

  @override
  String get homeInvalidRedeemCode =>
      'Neplatný, vypršelý nebo již uplatněný kód.';

  @override
  String get homeRedeemButton => 'Uplatnit';

  @override
  String get homeAreFriends => 'Jste přátelé';

  @override
  String get homeAddFriend => 'Přidat přítele';

  @override
  String homeFriendRequestSent(String username) {
    return 'Žádost o přátelství odeslána uživateli $username!';
  }

  @override
  String get homeMessageButton => 'Zpráva';

  @override
  String get homeSendTip => 'Poslat spropitné';

  @override
  String get homeSwitchToServer => 'Přepnout na server';

  @override
  String get homeInvitePeople => 'Pozvat lidi';

  @override
  String get homeServerSettingsMenuItem => 'Nastavení serveru';

  @override
  String get homeLeaveServerMenuItem => 'Opustit server';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return 'Opustit $serverName? Znovu se můžete připojit pomocí pozvánky.';
  }

  @override
  String get homeLeaveButton => 'Opustit';

  @override
  String get homeCreateAServer => 'Vytvořit server';

  @override
  String get homeServerNameHint => 'Název serveru';

  @override
  String get homeDescribeToVisp => 'Popsat to místo toho Visp';

  @override
  String get homeMarkAsRead => 'Označit jako přečtené';

  @override
  String get homeEditChannel => 'Upravit kanál';

  @override
  String get homeDeleteChannel => 'Smazat kanál';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return 'Smazat #$channelName? Tuto akci nelze vrátit zpět.';
  }

  @override
  String get homeDeleteButton => 'Smazat';

  @override
  String get homeCreateChannelHere => 'Vytvořit kanál zde';

  @override
  String get homeEditCategory => 'Upravit kategorii';

  @override
  String get homeDeleteCategory => 'Smazat kategorii';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return 'Smazat \"$categoryName\"? Kanály uvnitř zůstanou bez kategorie.';
  }

  @override
  String get homeReplyAction => 'Odpovědět';

  @override
  String get homeCreateThreadAction => 'Vytvořit vlákno';

  @override
  String get homeEditMessageAction => 'Upravit zprávu';

  @override
  String get homeDeleteMessageAction => 'Smazat zprávu';

  @override
  String get homePinMessageAction => 'Připnout zprávu';

  @override
  String get homeUnpinMessageAction => 'Odepnout zprávu';

  @override
  String get homeReportMessageAction => 'Nahlásit zprávu';

  @override
  String get homeReportSubmitted => 'Nahlášení odesláno.';

  @override
  String get homeAddReactionTitle => 'Přidat reakci';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vláken',
      many: '$count vlákna',
      few: '$count vlákna',
      one: '$count vlákno',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'Možnosti kategorie';

  @override
  String get homeChannelOptionsTooltip => 'Možnosti kanálu';

  @override
  String get homeOpenVoiceChatTooltip => 'Otevřít chat';

  @override
  String get homeMarketplaceLabel => 'Tržiště';

  @override
  String get homeSelectChannelPrompt => 'Vyberte kanál';

  @override
  String get homeSearchTooltip => 'Hledat';

  @override
  String get homePinnedMessagesTooltip => 'Připnuté zprávy';

  @override
  String get homeWaitingForKey => 'Čeká se na doručení šifrovacího klíče...';

  @override
  String get homeUnableToDecrypt => 'Tuto zprávu se nepodařilo dešifrovat.';

  @override
  String get homeMessageActionsTooltip => 'Akce zprávy';

  @override
  String get homeCancelReplyTooltip => 'Zrušit odpověď';

  @override
  String get homeRemoveAttachmentTooltip => 'Odebrat přílohu';

  @override
  String get homeAttachFileTooltip => 'Připojit soubor';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'Zpráva do #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'Odeslat zprávu';

  @override
  String get homeEditMessageTitle => 'Upravit zprávu';

  @override
  String get homeMessageLabel => 'Zpráva';

  @override
  String get homePinnedMessagesTitle => 'Připnuté zprávy';

  @override
  String get homeNoPinnedMessages => 'Žádné připnuté zprávy';

  @override
  String get homeUnpinTooltip => 'Odepnout';

  @override
  String get homeCreateThreadTitle => 'Vytvořit vlákno';

  @override
  String get homeThreadNameHint => 'Název vlákna';

  @override
  String homeThreadCreated(String name) {
    return 'Vlákno \"$name\" bylo vytvořeno!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Vytvořit nebo se připojit';

  @override
  String get homeKodaMarketplaceTooltip => 'Koda Marketplace';

  @override
  String get homeAdminPanelTooltip => 'Panel správce';

  @override
  String get homeServerSettingsTooltip => 'Nastavení serveru';

  @override
  String get homeSettingsTooltip => 'Nastavení';

  @override
  String get homeContentWarningBadge => 'Upozornění na obsah';

  @override
  String get homeDirectMessagesTooltip => 'Soukromé zprávy';

  @override
  String homeReplyingTo(String username) {
    return 'Odpovídáte uživateli $username';
  }

  @override
  String get homeAttachmentFallback => 'Příloha';

  @override
  String serverConnectError(String service) {
    return 'Nepodařilo se zahájit připojení $service.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Odpojit Printful?';

  @override
  String get serverDisconnectPrintfulBody =>
      'Tento server nebude schopen vyřizovat objednávky merche, dokud nebude znovu připojen.';

  @override
  String get serverDisconnectTiltifyTitle => 'Odpojit Tiltify?';

  @override
  String get serverDisconnectTiltifyBody =>
      'Tento server přestane zobrazovat průběh charitativní kampaně, dokud nebude znovu připojen.';

  @override
  String get serverNewRoleTitle => 'Nová role';

  @override
  String get serverEditRoleTitle => 'Upravit roli';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Barva $hex';
  }

  @override
  String get permViewChannels => 'Zobrazit kanály';

  @override
  String get permSendMessages => 'Odesílat zprávy';

  @override
  String get permConnectVoice => 'Připojit se k hlasu';

  @override
  String get permManageServer => 'Spravovat server';

  @override
  String get permManageChannels => 'Spravovat kanály';

  @override
  String get permManageRoles => 'Spravovat role';

  @override
  String get permManageMessages => 'Spravovat zprávy';

  @override
  String get permKickMembers => 'Vyhazovat členy';

  @override
  String get permBanMembers => 'Zakazovat členy';

  @override
  String get permMuteMembers => 'Ztlumit členy';

  @override
  String get permMentionEveryone => 'Zmiňovat @everyone';

  @override
  String get permManageMarketplace => 'Spravovat tržiště';

  @override
  String get permAnnounceLive => 'Oznamovat vysílání';

  @override
  String get permMoveMembers => 'Přesunout členy (hlas)';

  @override
  String get serverRoleNameHint => 'Název role';

  @override
  String get serverColorLabel => 'Barva';

  @override
  String get serverPermissionsLabel => 'Oprávnění';

  @override
  String get serverSelfAssignableTitle => 'Lze přiřadit samostatně';

  @override
  String get serverSelfAssignableSubtitle =>
      'Členové si mohou tuto roli přiřadit sami';

  @override
  String get serverDefaultRoleUndeletable => 'Výchozí roli nelze smazat.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'Smazat roli \"$roleName\"?';
  }

  @override
  String get serverCouldNotDeleteRole => 'Tuto roli se nepodařilo smazat.';

  @override
  String get serverMemberFallback => 'Člen';

  @override
  String get serverNoRolesYet => 'Zatím žádné role.';

  @override
  String get serverRefreshStatus =>
      'Už jste připojeni v prohlížeči? Obnovit stav';

  @override
  String get serverPrintfulConnected => 'Printful připojen';

  @override
  String get serverPrintfulNotConnected => 'Printful nepřipojen';

  @override
  String get serverPrintfulDescription =>
      'Propojte účet Printful tohoto serveru pro vyřizování objednávek merche zadaných přes Kodu. Každý server propojuje vlastní obchod.';

  @override
  String get serverConnecting => 'Připojování...';

  @override
  String get serverConnectPrintful => 'Připojit Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify připojen';

  @override
  String get serverTiltifyNotConnected => 'Tiltify nepřipojen';

  @override
  String get serverTiltifyDescription =>
      'Propojte účet Tiltify tohoto serveru, abyste všem členům zobrazili živý průběh charitativní kampaně. Pouze pro čtení -- Koda nikdy nic nezveřejňuje ani nemění na straně Tiltify.';

  @override
  String get serverConnectTiltify => 'Připojit Tiltify';

  @override
  String get serverNoTiltifyCampaigns =>
      'Na tomto účtu Tiltify nebyly nalezeny žádné kampaně.';

  @override
  String get serverPickCampaign => 'Vyberte, která kampaň se má zobrazovat';

  @override
  String get serverUntitledCampaign => 'Kampaň bez názvu';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '$currency $raised vybráno z cíle $goal';
  }

  @override
  String get serverViewCampaign => 'Zobrazit kampaň';

  @override
  String get serverRefreshButton => 'Obnovit';

  @override
  String get serverUploadButton => 'Nahrát';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return 'Využito $used / $limit slotů -- úroveň boostu $level';
  }

  @override
  String get serverNoCustomEmoji => 'Zatím žádná vlastní emoji.';

  @override
  String get serverDeleteEmojiTooltip => 'Smazat emoji';

  @override
  String get serverUploadEmojiTitle => 'Nahrát emoji';

  @override
  String get serverEmojiNameHint => 'název (písmena, číslice, _)';

  @override
  String get serverChooseImage => 'Vybrat obrázek';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Aktuální úroveň boostu: $level';
  }

  @override
  String get serverBackgroundTitle => 'Pozadí serveru';

  @override
  String get serverBackgroundDescription =>
      'Vlastní pozadí zobrazené za zobrazením kanálů všem na tomto serveru.';

  @override
  String get serverBackgroundLockedHint =>
      'Dosáhněte úrovně boostu 4 a odemkněte vlastní pozadí.';

  @override
  String get serverIconBorderTitle => 'Okraj ikony serveru';

  @override
  String get serverIconBorderDescription =>
      'Zvýrazněný okraj kolem ikony tohoto serveru v seznamu serverů každého člena.';

  @override
  String get serverIconBorderLockedHint =>
      'Dosáhněte úrovně boostu 5 a odemkněte vlastní okraj ikony.';

  @override
  String get serverBoostFromBank =>
      'Zvyšte boost tohoto serveru z Banky serveru na Tržišti a zvedněte tak jeho úroveň.';

  @override
  String get serverMarketplaceListingLabel => 'ZÁPIS NA TRŽIŠTI';

  @override
  String get serverListInMarketplace => 'Zapsat na Koda Marketplace';

  @override
  String get serverListInMarketplaceDescription =>
      'Zařadí tento server do celoplatformní karty Objevit a šanci na týdenní doporučenou rotaci. Odděleno od obecné dohledatelnosti pro připojení k serveru.';

  @override
  String get serverSocialLinkLabel =>
      'Sociální odkaz / odkaz na pozvánku (volitelné)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Uložit odkaz';

  @override
  String get serverPricingLabel => 'CENY';

  @override
  String get serverPrimaryCurrencyLabel => 'Primární měna';

  @override
  String get serverPrimaryCurrencyDescription =>
      'Vztahuje se na úrovně předplatného serveru a ceny digitálního zboží, které nastavíte pro tento server.';

  @override
  String get serverPrimaryLanguageLabel => 'Primární jazyk';

  @override
  String get serverPrimaryLanguageDescription =>
      'Zprávy, které členové zveřejní v jiném jazyce, dostanou malý jazykový odznak porovnaný s tímto nastavením.';

  @override
  String get serverMarketplaceLinkSaved => 'Odkaz na tržiště uložen.';

  @override
  String get serverIconUpdated => 'Ikona serveru byla aktualizována!';

  @override
  String get serverTemplateImported => 'Šablona byla importována!';

  @override
  String get serverImportFromDiscord => 'Importovat z Discordu';

  @override
  String get serverVispPlanLive => 'Plán od Visp je hotový!';

  @override
  String get serverAskVisp => 'Zeptat se Visp';

  @override
  String get serverAddCategoryButton => 'Přidat kategorii';

  @override
  String get serverAddChannelHereTooltip => 'Přidat kanál sem';

  @override
  String get serverRename => 'Přejmenovat';

  @override
  String get serverUncategorized => 'BEZ KATEGORIE';

  @override
  String get serverAddChannel => 'Přidat kanál';

  @override
  String get serverEditRulesContent => 'Upravit obsah pravidel';

  @override
  String get serverRulesContentHint => 'Zde zadejte pravidla svého serveru...';

  @override
  String get serverRulesUpdated => 'Pravidla byla aktualizována!';

  @override
  String get serverAddRole => 'Přidat roli';

  @override
  String get serverDefaultRoleLabel => 'Výchozí role';

  @override
  String get serverManageRolesTooltip => 'Spravovat role';

  @override
  String get serverMutedLabel => 'Ztlumeno';

  @override
  String get serverExpandedLabel => 'rozbaleno';

  @override
  String get serverCollapsedLabel => 'sbaleno';

  @override
  String get serverUnmute => 'Zrušit ztlumení';

  @override
  String get serverMute => 'Ztlumit';

  @override
  String get serverKick => 'Vyhodit';

  @override
  String get serverBan => 'Zakázat';

  @override
  String serverBannedUsersLabel(int count) {
    return 'ZAKÁZANÍ UŽIVATELÉ — $count';
  }

  @override
  String get serverNoBannedUsers => 'Žádní zakázaní uživatelé.';

  @override
  String get serverUnban => 'Zrušit zákaz';

  @override
  String get serverMemberFallbackGeneric => 'tohoto člena';

  @override
  String serverBanConfirm(String username, String serverName) {
    return 'Zakázat $username na serveru $serverName? Nebude se moci znovu připojit, dokud nebude zákaz zrušen.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return 'Vyhodit $username ze serveru $serverName? Bude se moci znovu připojit pomocí pozvánky.';
  }

  @override
  String get serverMuteDuration60Sec => '60 sekund';

  @override
  String get serverMuteDuration5Min => '5 minut';

  @override
  String get serverMuteDuration10Min => '10 minut';

  @override
  String get serverMuteDuration1Hour => '1 hodina';

  @override
  String get serverMuteDuration1Day => '1 den';

  @override
  String get serverMuteDuration1Week => '1 týden';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'Nepodařilo se provést akci \"$action\" u uživatele $username.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return 'Ztlumit $username';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'Nepodařilo se ztlumit uživatele $username.';
  }

  @override
  String get serverUnlockInvites => 'Odemknout pozvánky';

  @override
  String get serverInvitesUnlocked => 'Pozvánky odemčeny.';

  @override
  String get serverAuditLogDescription =>
      'Moderátorská aktivita úrovně 1 -- vyhazování, zákazy, ztlumení a automatická ochrana proti záplavě zpráv/raidům. Pouze metadata; nikdy obsah zpráv.';

  @override
  String get serverSystemActor => 'Systém';

  @override
  String get serverActionKicked => 'vyhodil(a)';

  @override
  String get serverActionBanned => 'zakázal(a)';

  @override
  String get serverActionUnbanned => 'zrušil(a) zákaz';

  @override
  String get serverActionMuted => 'ztlumil(a)';

  @override
  String get serverActionUnmuted => 'zrušil(a) ztlumení';

  @override
  String get serverActionFloodDetected =>
      'automaticky ztlumen(a) za záplavu zpráv';

  @override
  String get serverActionRaidLockdownEnabled =>
      'uzamkl(a) pozvánky (ochrana proti raidu)';

  @override
  String get serverActionRaidLockdownDisabled => 'odemkl(a) pozvánky';

  @override
  String get serverActionMoved => 'přesunul(a)';

  @override
  String get serverUnknownAction => 'neznámá akce';

  @override
  String get serverNoModerationActivity => 'Zatím žádná moderátorská aktivita.';

  @override
  String get serverReportsDescription =>
      'Zprávy nahlášené členy tohoto serveru -- už dešifrovaná kopie samotného oznamovatele, odhalená nahlášením.';

  @override
  String get serverNoPendingReports => 'Žádná čekající nahlášení.';

  @override
  String get serverReportReasonOther => 'jiné';

  @override
  String get serverReportStatusActioned => 'Vyřešeno';

  @override
  String get serverReportStatusDismissed => 'Zamítnuto';

  @override
  String get serverResolvedLabel => 'VYŘEŠENO';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'Nahlásil(a) $reporter -- odesláno uživatelem $target';
  }

  @override
  String serverReportNote(String note) {
    return 'Poznámka: $note';
  }

  @override
  String get serverDismissButton => 'Zamítnout';

  @override
  String get serverMarkActioned => 'Označit jako vyřešené';

  @override
  String get serverCreateInvite => 'Vytvořit pozvánku';

  @override
  String get serverInviteCreatedTitle => 'Pozvánka vytvořena';

  @override
  String get serverNoActiveInvites => 'Žádné aktivní pozvánky';

  @override
  String serverUsesLabel(String uses) {
    return 'Použití: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Smazat pozvánku';

  @override
  String get serverChangeIconLabel => 'Změnit ikonu serveru';

  @override
  String get serverFallbackName => 'Server';

  @override
  String serverSettingsTitle(String serverName) {
    return 'Nastavení serveru $serverName';
  }

  @override
  String get serverTabChannels => 'Kanály';

  @override
  String get serverTabRoles => 'Role';

  @override
  String get serverTabMembers => 'Členové';

  @override
  String get serverTabInvites => 'Pozvánky';

  @override
  String get serverTabMerch => 'Merch';

  @override
  String get serverTabEmoji => 'Emoji';

  @override
  String get serverTabCustomize => 'Přizpůsobit';

  @override
  String get serverTabAuditLog => 'Protokol auditu';

  @override
  String get serverTabReports => 'Nahlášení';

  @override
  String get serverTabThresholdMod => 'Prahová moderace';

  @override
  String get serverTabCharity => 'Charita';

  @override
  String get homeCustomEmojiFallback => 'vlastní emoji';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reakcí',
      many: '$count reakce',
      few: '$count reakce',
      one: '$count reakce',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted =>
      ', zareagovali jste, aktivujte pro odebrání';

  @override
  String get homeReactionActivateToAdd => ', aktivujte pro přidání';

  @override
  String get homeAddReactionLabel => 'Přidat reakci';

  @override
  String homeViewProfile(String username) {
    return 'Zobrazit profil uživatele $username';
  }

  @override
  String get homeMoveToVoiceChannel => 'Přesunout do hlasového kanálu…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Vyberte hlasový kanál';

  @override
  String get homeNoOtherVoiceChannels => 'Žádné další hlasové kanály';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username je nyní v kanálu $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'Nepodařilo se přesunout $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'Nyní jste v kanálu $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'Připojte se k $channel a mluvte';
  }

  @override
  String get adminPanelTitle => 'Panel administrátora';

  @override
  String get adminTabBackerCodes => 'Kódy pro podporovatele';

  @override
  String get adminTabUsers => 'Uživatelé';

  @override
  String get adminTabDmReports => 'Nahlášení SZ';

  @override
  String get adminTabSpamFlags => 'Příznaky spamu';

  @override
  String get adminTabWiki => 'Wiki';

  @override
  String get adminTabBoosts => 'Vylepšení';

  @override
  String get adminCreateBackerCodeTitle => 'Vytvořit kód pro podporovatele';

  @override
  String get adminCodeHint =>
      'Kód (ponechte prázdné pro automatické vygenerování)';

  @override
  String get adminNoteHint => 'Poznámka (např. \"Kickstarter Tier 2\")';

  @override
  String get adminFlagsJsonHint =>
      'Příznaky jako JSON, např. \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint =>
      'Max. počet použití (ponechte prázdné = bez omezení)';

  @override
  String get adminCodeCreatedTitle => 'Kód vytvořen';

  @override
  String get adminCodeLabel => 'Kód:';

  @override
  String get adminCopyCodeTooltip => 'Kopírovat kód';

  @override
  String adminFlagsValue(String flags) {
    return 'Příznaky: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Kódy pro podporovatele a odměny';

  @override
  String get adminNewCodeButton => 'Nový kód';

  @override
  String get adminNoCodesYet => 'Zatím žádné kódy';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses použití';
  }

  @override
  String get adminSearchUsersHint => 'Hledat uživatele podle jména...';

  @override
  String get adminSearchUsersPrompt => 'Vyhledejte uživatele výše';

  @override
  String get adminNoDmReports => 'Žádná nahlášení soukromých zpráv.';

  @override
  String get adminResolvedLabel => 'VYŘEŠENO';

  @override
  String get adminReasonOther => 'jiné';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Nahlašovatel: $reporterId\nOdhalený odesílatel: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Poznámka: $note';
  }

  @override
  String get adminDismissButton => 'Zamítnout';

  @override
  String get adminMarkActionedButton => 'Označit jako vyřešené';

  @override
  String get adminStatusActioned => 'Vyřešeno';

  @override
  String get adminStatusDismissed => 'Zamítnuto';

  @override
  String get adminNoSpamFlags => 'Žádné příznaky spamu.';

  @override
  String get adminFlagMassDmSpam => 'Hromadný spam v SZ';

  @override
  String get adminFlagRaidLockdown => 'Uzamčení kvůli raidu';

  @override
  String get adminFlagBotBehavior => 'Chování podobné botovi';

  @override
  String get adminFlagChannelFlooding => 'Zaplavení kanálu zprávami';

  @override
  String get adminAutoEscalatedBadge => 'AUTOMATICKY ESKALOVÁNO';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Jistota: $score % ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'Uživatel: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Server: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount z $totalJoiners nových členů je stále ztlumeno';
  }

  @override
  String get adminNoJoinersMuted =>
      'Momentálně nejsou ztlumeni žádní noví členové';

  @override
  String adminRestrictedUntil(String until) {
    return 'Momentálně omezeno do $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'Momentálně bez omezení';

  @override
  String get adminDismissUndoButton => 'Zamítnout a vrátit zpět';

  @override
  String get adminConfirmRestrictButton => 'Potvrdit a omezit';

  @override
  String get adminDeleteArticleTitle => 'Smazat článek?';

  @override
  String adminDeleteArticleBody(String title) {
    return '\"$title\" bude odstraněn ze znalostní báze Visp.';
  }

  @override
  String get adminNewArticleTitle => 'Nový článek';

  @override
  String get adminEditArticleTitle => 'Upravit článek';

  @override
  String get adminArticleTitleHint => 'Název';

  @override
  String get adminArticleContentHint => 'Obsah článku (markdown)';

  @override
  String get adminWikiArticlesHeader => 'Články wiki';

  @override
  String get adminNoArticlesYet => 'Zatím žádné články';

  @override
  String get adminEditArticleTooltip => 'Upravit článek';

  @override
  String get adminDeleteArticleTooltip => 'Smazat článek';

  @override
  String get adminSearchServersHint => 'Hledat servery podle názvu...';

  @override
  String get adminSearchServersPrompt => 'Vyhledejte server výše';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'Udělit vylepšení serveru $serverName';
  }

  @override
  String get adminNumBoostsHint => 'Počet vylepšení';

  @override
  String get adminGrantButton => 'Udělit';

  @override
  String get adminPositiveNumberError => 'Zadejte kladné celé číslo.';

  @override
  String get adminGrantBoostsFailed => 'Udělení vylepšení se nezdařilo.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Uděleno $count vylepšení serveru $serverName -- nyní úroveň $level ($activeCount aktivních).',
      many:
          'Uděleno $count vylepšení serveru $serverName -- nyní úroveň $level ($activeCount aktivních).',
      few:
          'Udělena $count vylepšení serveru $serverName -- nyní úroveň $level ($activeCount aktivních).',
      one:
          'Uděleno $count vylepšení serveru $serverName -- nyní úroveň $level ($activeCount aktivních).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count členů';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Udělit vylepšení';

  @override
  String get parentalDashboardTitle => 'Rodina';

  @override
  String get parentalDashboardCreateChildTitle => 'Vytvořit dětský účet';

  @override
  String get parentalDashboardUsernameHint => 'Uživatelské jméno';

  @override
  String get parentalDashboardEmailHint => 'E-mail';

  @override
  String get parentalDashboardPasswordHint => 'Heslo';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'Tím se vytvoří plně kontrolovaný účet: označené kanály jsou zablokovány a budete moci nastavit povolené hodiny a vidět (ale ne číst) jejich přátele a servery.';

  @override
  String get parentalDashboardValidationError =>
      'Je vyžadováno uživatelské jméno, e-mail a heslo alespoň o 8 znacích.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'Dětský účet se nepodařilo vytvořit -- uživatelské jméno/e-mail může být již obsazeno.';

  @override
  String get parentalDashboardCreatingLabel => 'Vytváření...';

  @override
  String get parentalDashboardNoChildren => 'Zatím žádné propojené účty.';

  @override
  String get parentalDashboardSupervisedLabel => 'Kontrolovaný účet';

  @override
  String get parentalDashboardUnknownUser => 'Neznámý';

  @override
  String get childDetailFallbackTitle => 'Dětský účet';

  @override
  String get childDetailTabFriends => 'Přátelé';

  @override
  String get childDetailTabServers => 'Servery';

  @override
  String get childDetailTabSchedule => 'Rozvrh';

  @override
  String get childDetailTabOverride => 'Výjimka';

  @override
  String get childDetailNoFriends => 'Žádní přátelé.';

  @override
  String get childDetailUnknownUser => 'Neznámý';

  @override
  String get childDetailRemoveFriendTooltip => 'Odebrat přítele';

  @override
  String get childDetailNoServers => 'Není v žádných serverech.';

  @override
  String childDetailMemberCount(int count) {
    return '$count členů';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Odebrat ze serveru';

  @override
  String get childDetailRestrictAccessTitle =>
      'Omezit přístup na stanovené hodiny';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Vypnuto znamená neomezený přístup kdykoli';

  @override
  String get childDetailTimezoneLabel => 'Časové pásmo';

  @override
  String get childDetailMonday => 'Pondělí';

  @override
  String get childDetailTuesday => 'Úterý';

  @override
  String get childDetailWednesday => 'Středa';

  @override
  String get childDetailThursday => 'Čtvrtek';

  @override
  String get childDetailFriday => 'Pátek';

  @override
  String get childDetailSaturday => 'Sobota';

  @override
  String get childDetailSunday => 'Neděle';

  @override
  String get childDetailNoAccessLabel => 'Bez přístupu';

  @override
  String get childDetailToLabel => 'do';

  @override
  String get childDetailSavingLabel => 'Ukládání...';

  @override
  String get childDetailSaveScheduleButton => 'Uložit rozvrh';

  @override
  String get childDetailScheduleSaved => 'Rozvrh uložen.';

  @override
  String get childDetailOverrideExplanation =>
      'Udělte dočasný přístup mimo běžný rozvrh -- vhodné pro jednorázovou výjimku bez úpravy týdenního rozvrhu.';

  @override
  String get childDetailReasonHint => 'Důvod (nepovinné)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes min';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours h';
  }

  @override
  String get childDetailRevokeOverrideButton => 'Zrušit aktivní výjimku';

  @override
  String get childDetailAccessGranted => 'Dočasný přístup udělen.';

  @override
  String get childDetailOverrideRevoked => 'Výjimka zrušena.';

  @override
  String get digitalGoodsTitle => 'Digitální zboží';

  @override
  String get digitalGoodsMyProductsTitle => 'Moje produkty';

  @override
  String get digitalGoodsManageProductsTooltip =>
      'Spravovat produkty tohoto serveru';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Přepnout na Procházet';

  @override
  String get digitalGoodsCreateProductTooltip => 'Vytvořit produkt';

  @override
  String get digitalGoodsBrowseTab => 'Procházet';

  @override
  String get digitalGoodsMyListingsTab => 'Moje nabídky';

  @override
  String get digitalGoodsMyPurchasesTab => 'Moje nákupy';

  @override
  String get digitalGoodsNoProductsYet => 'Zatím žádné produkty';

  @override
  String get digitalGoodsNoProductsAvailable => 'Žádné dostupné produkty';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Vytvořte svůj první produkt a začněte prodávat';

  @override
  String get digitalGoodsCheckBackLater =>
      'Podívejte se znovu později na digitální zboží';

  @override
  String get digitalGoodsCreateProductButton => 'Vytvořit produkt';

  @override
  String get digitalGoodsLicenseKeyBadge => 'Licenční klíč';

  @override
  String get digitalGoodsFileBadge => 'Soubor';

  @override
  String get digitalGoodsAllServersBadge => 'Všechny servery';

  @override
  String get digitalGoodsFreeForYou => 'Pro vás zdarma';

  @override
  String get digitalGoodsFreeLabel => 'Zdarma';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count prodáno';
  }

  @override
  String get digitalGoodsKeysButton => 'Klíče';

  @override
  String get digitalGoodsGetForFree => 'Získat zdarma';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'Koupit za $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'Zatím žádné nákupy';

  @override
  String get digitalGoodsUnknownProduct => 'Neznámý produkt';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'Zakoupeno $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Kopírovat klíč';

  @override
  String get digitalGoodsLicenseKeyCopied => 'Licenční klíč zkopírován!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'Platnost končí $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'Váš licenční klíč';

  @override
  String get digitalGoodsCopyKeyButton => 'Kopírovat klíč';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'Nepodařilo se zahájit platbu -- tento tvůrce možná ještě nepřipojil Stripe.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'Nákup dokončen! Najdete ho v sekci Moje nákupy.';

  @override
  String get digitalGoodsPurchasePending =>
      'Stále čekáme na platbu -- objeví se v Mých nákupech po jejím dokončení.';

  @override
  String get digitalGoodsCreateProductTitle => 'Vytvořit produkt';

  @override
  String get digitalGoodsEditProductTitle => 'Upravit produkt';

  @override
  String get digitalGoodsProductTitleHint => 'Název produktu';

  @override
  String get digitalGoodsDescriptionHint => 'Popis (nepovinné)';

  @override
  String get digitalGoodsPriceHint =>
      'Cena v USD (ponechte prázdné pro zdarma)';

  @override
  String get digitalGoodsProductTypeLabel => 'Typ produktu';

  @override
  String get digitalGoodsFileDownloadOption => 'Stažení souboru';

  @override
  String get digitalGoodsLicenseKeyOption => 'Licenční klíč';

  @override
  String get digitalGoodsAvailabilityLabel => 'Dostupnost';

  @override
  String get digitalGoodsThisServerOnlyOption => 'Pouze tento server';

  @override
  String get digitalGoodsAllKodaServersOption => 'Všechny servery Koda';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'Po vytvoření použijte tlačítko \"Klíče\" k nahrání licenčních klíčů.';

  @override
  String get digitalGoodsProductFileLabel => 'Soubor produktu';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName ($sizeMb MB)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Odebrat soubor';

  @override
  String get digitalGoodsUploadingLabel => 'Nahrávání...';

  @override
  String get digitalGoodsChooseFileButton => 'Vybrat soubor';

  @override
  String get digitalGoodsReplaceFileButton => 'Nahradit soubor';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Před uložením vyberte soubor pro tento produkt.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'Nahrát licenční klíče';

  @override
  String get digitalGoodsPasteKeysHint => 'Vložte jeden klíč na řádek:';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Nahrát klíče';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'Licenční klíče nahrány!';

  @override
  String get serverSubscriptionManageTitle => 'Spravovat předplatná';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return 'Předplatná serveru $serverName';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Přidat úroveň';

  @override
  String get serverSubscriptionNoTiersYet => 'Zatím žádné úrovně předplatného';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Vytvořte až 3 úrovně pro svou komunitu';

  @override
  String get serverSubscriptionCreateFirstTierButton => 'Vytvořit první úroveň';

  @override
  String get serverSubscriptionShowSubscriberCounts =>
      'Zobrazovat počet předplatitelů';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/měs';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktivních předplatitelů',
      many: '$count aktivního předplatitele',
      few: '$count aktivní předplatitelé',
      one: '$count aktivní předplatitel',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned =>
      'Role je přiřazena automaticky';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '$discount % sleva na marketplace';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'Tento server nemá žádné úrovně předplatného';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Aktivní předplatitel';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'Platnost končí $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk =>
      'Exkluzivní role předplatitele';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return '$discount % sleva na nákupy na marketplace';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Kanály pouze pro předplatitele';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Aktuálně předplaceno';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'Předplatit za $price/měs';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Vytvořit úroveň';

  @override
  String get serverSubscriptionEditTierTitle => 'Upravit úroveň';

  @override
  String get serverSubscriptionTierNameHint =>
      'Název úrovně (např. Fanoušek, Podporovatel, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Popis (nepovinné)';

  @override
  String get serverSubscriptionPriceHint => 'Cena za měsíc (USD)';

  @override
  String get serverSubscriptionDiscountLabel => '% slevy na marketplace';

  @override
  String get serverSubscriptionPositionLabel => 'Pozice';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Úroveň $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Uděluje roli při předplacení — nepovinné';

  @override
  String get serverSubscriptionRoleFallback => 'role';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Automaticky udělena členovi ve chvíli, kdy se předplatí, a odebrána ve chvíli, kdy jeho předplatné vyprší.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Úroveň vytvořena -- před tím, než se na ni budou moci členové přihlásit, připojte Stripe v sekci Marketplace → Tvůrce.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Smazat úroveň';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return 'Smazat \"$tierName\"? Stávající předplatitelé si zachovají přístup až do vypršení.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'Předplatit $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel => 'Měsíční předplatné';

  @override
  String get serverSubscriptionServerBankEarnsLabel => 'Banka serveru vydělává';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points bodů';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Platba je bezpečně zpracována přes Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'Předplatit';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'Nepodařilo se zahájit platbu -- vlastník tohoto serveru možná ještě nepřipojil Stripe.';

  @override
  String get serverSubscriptionSubscribed => 'Předplaceno!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'Stále čekáme na platbu -- aktivuje se po jejím dokončení.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'Dát spropitné uživateli $username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Vyberte částku';

  @override
  String get tipDialogMessageHint => 'Přidat zprávu (nepovinné)';

  @override
  String get tipDialogYouPayLabel => 'Platíte';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username obdrží';
  }

  @override
  String get tipDialogSendTipButton => 'Odeslat spropitné';

  @override
  String get tipDialogFailedToSendTip =>
      'Odeslání spropitného se nezdařilo. Tvůrce možná není připojen ke Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'Nepodařilo se zahájit platbu. Zkuste to za chvíli znovu.';

  @override
  String get tipDialogTipSent => 'Spropitné odesláno!';

  @override
  String get tipDialogTipPending =>
      'Stále čekáme na platbu -- projde po jejím dokončení.';

  @override
  String get tipDialogUnknownUser => 'Neznámý';

  @override
  String get marketplaceTitle => 'Marketplace';

  @override
  String get marketplaceCreatorPayoutsTitle => 'Výplaty tvůrcům';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Přijímejte spropitné přímo přes Stripe';

  @override
  String get marketplaceTabServerBank => 'Banka serveru';

  @override
  String get marketplaceTabDigitalGoods => 'Digitální zboží';

  @override
  String get marketplaceTabMerch => 'Merch';

  @override
  String get marketplaceTabSubscription => 'Předplatné';

  @override
  String get marketplaceTabRevenue => 'Příjmy';

  @override
  String get marketplaceSelectServerSubscription =>
      'Vyberte server pro zobrazení jeho předplatného';

  @override
  String get marketplaceSelectServerBank =>
      'Vyberte server pro zobrazení jeho banky';

  @override
  String get marketplaceSelectServerRevenue =>
      'Vyberte server pro zobrazení jeho příjmů';

  @override
  String get marketplaceStripeAccountStatus => 'Účet Stripe';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Registrace dokončena';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'Přijímá platby';

  @override
  String get marketplaceConnectStripeButton => 'Připojit účet Stripe';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Dokončit registraci Stripe';

  @override
  String get marketplaceRefreshStatusButton => 'Obnovit stav';

  @override
  String get marketplaceReadyToReceiveTips =>
      'Jste připraveni přijímat spropitné!';

  @override
  String get marketplaceHowItWorksTitle => 'Jak to funguje';

  @override
  String get marketplaceHowItWorksStep1 => 'Připojte svůj účet Stripe';

  @override
  String get marketplaceHowItWorksStep2 => 'Dokončete ověření totožnosti';

  @override
  String get marketplaceHowItWorksStep3 =>
      'Přijímejte spropitné přímo na svůj bankovní účet';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda účtuje zpracovatelský poplatek 5 %. Poplatek jde do banky vašeho serveru jako body.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Banku serveru může zobrazit pouze vlastník serveru nebo osoba s oprávněním Spravovat marketplace.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName vylepšen!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit slotů pro vlastní emoji';
  }

  @override
  String get marketplaceServerFallback => 'Server';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance bodů';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount v aktivitě';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'Body se získávají z 5% zpracovatelského poplatku ze spropitného a předplatných na tomto serveru. Body využijte k odemčení vylepšení serveru.';

  @override
  String get marketplaceServerBoostsTitle => 'Vylepšení serveru';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Úroveň $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktivních vylepšení',
      many: '$count aktivního vylepšení',
      few: '$count aktivní vylepšení',
      one: '$count aktivní vylepšení',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: 'Ještě $more vylepšení k dosažení úrovně $level',
      many: 'Ještě $more vylepšení k dosažení úrovně $level',
      few: 'Ještě $more vylepšení k dosažení úrovně $level',
      one: 'Ještě $more vylepšení k dosažení úrovně $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' a odemknout vlastní pozadí serveru';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' a odemknout vlastní rámeček ikony serveru';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Máte $count dostupných tokenů na vylepšení.',
      many: 'Máte $count dostupného tokenu na vylepšení.',
      few: 'Máte $count dostupné tokeny na vylepšení.',
      one: 'Máte $count dostupný token na vylepšení.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'Tokeny na vylepšení pocházejí z předplatného Pulse (1/měsíc). Předplaťte si ho na kartě Předplatná a jeden získáte.';

  @override
  String get marketplaceBoostingLabel => 'Vylepšování...';

  @override
  String get marketplaceBoostThisServerButton => 'Vylepšit tento server';

  @override
  String get marketplaceComingSoonUpgradesTitle =>
      'Již brzy — Vylepšení serveru';

  @override
  String get marketplaceSpendPointsList =>
      'Utraťte body banky serveru za:\n• Vlastní doménu serveru\n• Zvýšený limit členů\n• Prioritní podporu\n• Exkluzivní odznak serveru';

  @override
  String get marketplaceSourceTip => 'Spropitné';

  @override
  String get marketplaceSourceSubscription => 'Předplatná Koda';

  @override
  String get marketplaceSourceServerSubscription => 'Předplatná serveru';

  @override
  String get marketplaceSourceDigitalProduct => 'Digitální zboží';

  @override
  String get marketplaceSourceStageTicket => 'Vstupenky na Stage';

  @override
  String get marketplaceSourcePrintfulOrder => 'Objednávky merche';

  @override
  String get marketplaceJustNow => 'právě teď';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return 'před $minutes min';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return 'před $hours h';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return 'před $days d';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Příjmy tohoto serveru mohou zobrazit pouze členové, kteří mohou spravovat marketplace.';

  @override
  String get marketplaceBalanceLabel => 'Zůstatek';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Celkově vyděláno';

  @override
  String get marketplaceLast30DaysTitle => 'Posledních 30 dní';

  @override
  String get marketplaceRevenueBySourceTitle => 'Příjmy podle zdroje';

  @override
  String get marketplaceNoRevenueYet => 'Zatím žádné příjmy.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count transakcí',
      many: '$count transakce',
      few: '$count transakce',
      one: '$count transakce',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'Nedávné transakce';

  @override
  String get marketplaceNoTransactionsYet => 'Zatím žádné transakce.';

  @override
  String get marketplaceNoActivityYet => 'Zatím žádná aktivita';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Synchronizováno $count produktů z Printful',
      many: 'Synchronizováno $count produktu z Printful',
      few: 'Synchronizovány $count produkty z Printful',
      one: 'Synchronizován $count produkt z Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Synchronizace s Printful se nezdařila -- zkontrolujte připojení v nastavení Merch.';

  @override
  String get printfulMerchSelectServer =>
      'Vyberte server pro zobrazení jeho merche';

  @override
  String get printfulMerchManageCatalogTitle => 'Spravovat katalog merche';

  @override
  String get printfulMerchTitle => 'Merch';

  @override
  String get printfulMerchSyncingLabel => 'Synchronizace...';

  @override
  String get printfulMerchSyncCatalogButton => 'Synchronizovat katalog';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'Přepnout na Procházet';

  @override
  String get printfulMerchManageTooltip => 'Spravovat merch tohoto serveru';

  @override
  String get printfulMerchNothingSyncedYet => 'Zatím nic nesynchronizováno';

  @override
  String get printfulMerchNoMerchAvailable => 'Zatím žádný dostupný merch';

  @override
  String get printfulMerchSyncHint =>
      'Synchronizujte svůj obchod Printful a načtěte katalog produktů';

  @override
  String get printfulMerchCheckBackLater =>
      'Podívejte se znovu později na merch z tohoto serveru';

  @override
  String get printfulMerchOutOfStock => 'Vyprodáno';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Od $price • $count možností',
      many: 'Od $price • $count možnosti',
      few: 'Od $price • $count možnosti',
      one: 'Od $price • $count možnost',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'Zobrazit';

  @override
  String get printfulMerchCartTooltip => 'Košík';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productName přidán do košíku';
  }

  @override
  String get printfulMerchQuantityLabel => 'Množství';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Snížit množství';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Zvýšit množství';

  @override
  String get printfulMerchAddToCartButton => 'Přidat do košíku';

  @override
  String get printfulMerchOptionLabel => 'Možnost';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Styl';

  @override
  String get printfulMerchSizeLabel => 'Velikost';

  @override
  String get printfulMerchYourCartTitle => 'Váš košík';

  @override
  String get printfulMerchCartEmpty => 'Váš košík je prázdný.';

  @override
  String get printfulMerchSubtotalLabel => 'Mezisoučet';

  @override
  String get printfulMerchCheckoutLabel => 'Pokladna';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'Odebrat z košíku';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Nejprve vyplňte doručovací adresu.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'Nepodařilo se získat ceny dopravy pro tuto adresu.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'Nepodařilo se zahájit platbu. Zkuste to za chvíli znovu.';

  @override
  String get printfulMerchOrderPlaced => 'Objednávka odeslána!';

  @override
  String get printfulMerchOrderPending =>
      'Stále čekáme na platbu -- objednávka bude odeslána po jejím dokončení.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Rychlost dopravy';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max pracovních dní';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => 'Získat nabídku dopravy';

  @override
  String get printfulMerchPayButton => 'Zaplatit';

  @override
  String get kodaMarketplaceTitle => 'Koda Marketplace';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Předplatná';

  @override
  String get kodaMarketplaceTabBoosts => 'Vylepšení';

  @override
  String get kodaMarketplaceTabDiscover => 'Objevit';

  @override
  String get kodaMarketplaceTierFreeName => 'Zdarma';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'Platnost končí $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks =>
      'Upgradujte kvůli exkluzivním výhodám';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dostupných tokenů na vylepšení',
      many: '$count dostupného tokenu na vylepšení',
      few: '$count dostupné tokeny na vylepšení',
      one: '$count dostupný token na vylepšení',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Darujte token libovolnému serveru, kde jste členem, z jeho karty Banka serveru';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => 'Vlastní rámeček avatara';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Odznak Spark v profilu';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Zvýšený limit nahrávání souborů (50 MB)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality => 'Prioritní kvalita hlasu';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'Vše, co je ve Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame =>
      'Animovaný rámeček avatara';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Odznak Pulse v profilu';

  @override
  String get kodaMarketplacePulsePerkFileLimit =>
      'Limit nahrávání souborů 100 MB';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      '1 token na vylepšení serveru měsíčně';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/měs';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Aktuální plán';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'Získat $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return 'Darovat $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return 'Darovat $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'Předplatit $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel => 'Uživatelské jméno příjemce:';

  @override
  String get kodaMarketplaceUsernameHint => 'Uživatelské jméno';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Předplatné';

  @override
  String get kodaMarketplaceTotalLabel => 'Celkem';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Platba je bezpečně zpracována přes Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'Pokračovat k platbě';

  @override
  String get kodaMarketplaceUserNotFound => 'Uživatel nenalezen';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'Nepodařilo se zahájit platbu. Zkuste to za chvíli znovu.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'Předplatné aktivní!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'Stále čekáme na platbu -- aktivuje se po jejím dokončení.';

  @override
  String get kodaMarketplaceBoostPurchased => 'Vylepšení zakoupeno!';

  @override
  String get kodaMarketplaceBoostPending =>
      'Stále čekáme na platbu -- bude připraveno po jejím dokončení.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count dostupných';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Koupit vylepšení';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'Jednorázový nákup -- předplatitelé Pulse navíc dostávají jeden token zdarma při každém obnovení, což zůstává výhodnější volbou, pokud vylepšujete pravidelně.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Koupit vylepšení -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Zatím se do Koda Marketplace nezapojil žádný server. Vlastníci serverů to mohou zapnout v nastavení Přizpůsobení svého serveru.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => 'DOPORUČENÉ TENTO TÝDEN';

  @override
  String get kodaMarketplaceAllListedServersHeader => 'VŠECHNY UVEDENÉ SERVERY';

  @override
  String get kodaMarketplaceServerFallback => 'Server';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count členů',
      many: '$count člena',
      few: '$count členové',
      one: '$count člen',
    );
    return '$_temp0';
  }

  @override
  String get calendarFallbackTitle => 'Kalendář';

  @override
  String get calendarAskVispTooltip => 'Zeptat se Visp';

  @override
  String get calendarCreateEventTooltip => 'Vytvořit událost';

  @override
  String get calendarPreviousMonthTooltip => 'Předchozí měsíc';

  @override
  String get calendarNextMonthTooltip => 'Další měsíc';

  @override
  String get calendarTodayButton => 'Dnes';

  @override
  String get calendarWeekdaySun => 'Ne';

  @override
  String get calendarWeekdayMon => 'Po';

  @override
  String get calendarWeekdayTue => 'Út';

  @override
  String get calendarWeekdayWed => 'St';

  @override
  String get calendarWeekdayThu => 'Čt';

  @override
  String get calendarWeekdayFri => 'Pá';

  @override
  String get calendarWeekdaySat => 'So';

  @override
  String get calendarTodaySuffix => ', dnes';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count událostí',
      many: ', $count události',
      few: ', $count události',
      one: ', $count událost',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'Vyberte den';

  @override
  String get calendarNoEvents => 'Žádné události';

  @override
  String get calendarSubscribeTooltip => 'Odebírat';

  @override
  String get calendarUnsubscribeTooltip => 'Zrušit odběr';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'Opakuje se $recurrence';
  }

  @override
  String get calendarTicketOwned => 'Vstupenka vlastněna';

  @override
  String calendarTicketPrice(String price) {
    return 'Vstupenka $price';
  }

  @override
  String get calendarDeleteEventTitle => 'Smazat událost';

  @override
  String calendarDeleteEventConfirm(String title) {
    return 'Smazat \"$title\"? Tuto akci nelze vrátit zpět.';
  }

  @override
  String get calendarEditEventTitle => 'Upravit událost';

  @override
  String get calendarCreateEventTitle => 'Vytvořit událost';

  @override
  String get calendarEventTitleHint => 'Název události';

  @override
  String get calendarDescriptionHint => 'Popis (nepovinné)';

  @override
  String get calendarLocationHint => 'Místo (nepovinné)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Začátek ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Datum a čas začátku, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'Konec — nepovinné ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'Datum a čas konce, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'nenastaveno';

  @override
  String get calendarTapToSetEndTime => 'Klepnutím nastavte čas konce';

  @override
  String get calendarRecurrenceLabel => 'Opakování';

  @override
  String get calendarRecurrenceNone => 'Neopakuje se';

  @override
  String get calendarRecurrenceDaily => 'Denně';

  @override
  String get calendarRecurrenceWeekly => 'Týdně';

  @override
  String get calendarRecurrenceMonthly => 'Měsíčně';

  @override
  String get calendarColorLabel => 'Barva';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Barva $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Cena vstupenky — nepovinné';

  @override
  String get calendarLinkStageChannelLabel =>
      'Propojit s kanálem Stage — nepovinné';

  @override
  String get calendarStageChannelFallback => 'stage';

  @override
  String get discordImportFetchError => 'Nepodařilo se načíst šablonu.';

  @override
  String get discordImportApplyError =>
      'Použití šablony se nezdařilo. Zkuste to prosím znovu.';

  @override
  String get discordImportTitle => 'Import šablony Discord';

  @override
  String get discordImportDescription =>
      'Vložte odkaz discord.new nebo kód šablony pro import rolí, kategorií a kanálů do tohoto serveru.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 nebo kód šablony';

  @override
  String get discordImportPreviewButton => 'Náhled';

  @override
  String get discordImportTemplateFallback => 'Šablona';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rolí',
      many: '$count role',
      few: '$count role',
      one: '$count role',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kategorií',
      many: '$count kategorie',
      few: '$count kategorie',
      one: '$count kategorie',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kanálů',
      many: '$count kanálu',
      few: '$count kanály',
      one: '$count kanál',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel =>
      'NAHRADIT STÁVAJÍCÍ STRUKTURU';

  @override
  String get discordImportReplaceWarning =>
      'Všechny stávající kanály, kategorie a role budou trvale odstraněny.';

  @override
  String get discordImportAddDescription =>
      'Šablona bude přidána do stávající struktury vašeho serveru.';

  @override
  String get discordImportReplaceConfirmTitle => 'Nahradit strukturu serveru?';

  @override
  String get discordImportReplaceConfirmBody =>
      'Tímto se před importem trvale odstraní VŠECHNY stávající kanály, kategorie a role. Tuto akci nelze vrátit zpět.';

  @override
  String get discordImportYesReplace => 'Ano, nahradit';

  @override
  String get discordImportReplaceAndImportButton =>
      'Nahradit a importovat šablonu';

  @override
  String get discordImportAddToServerButton => 'Přidat šablonu na server';

  @override
  String get thresholdModConfigureTitle => 'Konfigurace prahové moderace';

  @override
  String get thresholdModConfigureExplanation =>
      'Vyberte důvěryhodné moderátory a kolik z nich musí souhlasit, než kterýkoli z nich může dešifrovat jednu epochu historie kanálu. Ani vy nemáte jednostranný klíč -- výjimku máte pouze pokud jste také na tomto seznamu.';

  @override
  String get thresholdModThresholdLabel => 'Práh:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Snížit práh';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Zvýšit práh';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'z $count moderátorů',
      many: 'z $count moderátora',
      few: 'z $count moderátorů',
      one: 'z $count moderátora',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle => 'Žádost o prahové dešifrování';

  @override
  String get thresholdModChannelLabel => 'Kanál';

  @override
  String get thresholdModReasonHint =>
      'Důvod -- zobrazí se každému určenému moderátorovi';

  @override
  String get thresholdModRequestButton => 'Požádat';

  @override
  String get thresholdModShareRelayed => 'Podíl předán žadateli.';

  @override
  String get thresholdModNotEnoughShares =>
      'Zatím nebylo předáno dostatek podílů -- zkuste to znovu, až předá své podíly více moderátorů.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zpráv',
      many: '$count zprávy',
      few: '$count zprávy',
      one: '$count zpráva',
    );
    return 'Epocha $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'V této epoše nejsou žádné dešifrovatelné zprávy.';

  @override
  String get thresholdModExplanation =>
      'Skutečné dešifrování historie kanálu, podmíněné aktivním souhlasem více určených moderátorů -- nikdy jednou osobou samotnou, ani vlastníkem serveru. Vždy odemyká pouze jednu celou epochu (vše odeslané od poslední změny členství), nikdy jednu jednotlivou zprávu.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Povoleno -- $count moderátorů, práh $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'Nenakonfigurováno';

  @override
  String get thresholdModReconfigureButton => 'Znovu nakonfigurovat';

  @override
  String get thresholdModEnableButton => 'Povolit';

  @override
  String get thresholdModNotEnabledForServer =>
      'Prahová moderace není pro tento server povolena.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Povoleno pro tento server. Nejste jedním z určených moderátorů.';

  @override
  String get thresholdModRequestsLabel => 'Žádosti';

  @override
  String get thresholdModRequestDecryptButton => 'Požádat o dešifrování';

  @override
  String get thresholdModNoActiveRequests => 'Žádné aktivní žádosti.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- epocha $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'čeká se';

  @override
  String get thresholdModStatusApproved => 'schváleno';

  @override
  String get thresholdModApproveButton => 'Schválit';

  @override
  String get thresholdModRelayShareButton => 'Předat můj podíl';

  @override
  String get thresholdModTryReconstructButton => 'Pokusit se rekonstruovat';

  @override
  String get roleSelectNoRolesAvailable =>
      'Nejsou k dispozici žádné role k samopřiřazení.';

  @override
  String get roleSelectInstructions =>
      'Vyberte role, které chcete. Klepnutím na roli ji přidáte nebo odeberete.';

  @override
  String get rulesScreenAcceptError =>
      'Nepodařilo se přijmout pravidla. Zkuste to znovu.';

  @override
  String get rulesScreenSubtitle => 'Pravidla serveru';

  @override
  String get rulesScreenScrollToRead =>
      'Posuňte dolů a přečtěte si všechna pravidla';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'Kliknutím na Přijmout souhlasíte s dodržováním těchto pravidel.\nPorušení může vést k odstranění ze serveru.';

  @override
  String get rulesScreenAcceptButton => 'Přijímám pravidla';

  @override
  String get rulesScreenReadAllToContinue =>
      'Přečtěte si všechna pravidla pro pokračování';

  @override
  String get galleryNewPostTitle => 'Nový příspěvek';

  @override
  String get galleryChooseFileButton => 'Vybrat soubor';

  @override
  String get galleryOrDivider => 'nebo';

  @override
  String get galleryPasteUrlHint => 'Vložte URL obrázku/videa';

  @override
  String get galleryTypeLabel => 'Typ';

  @override
  String get galleryImageOption => 'Obrázek';

  @override
  String get galleryVideoOption => 'Video';

  @override
  String get galleryCaptionHint => 'Popisek (nepovinné)';

  @override
  String get galleryPostButton => 'Zveřejnit';

  @override
  String get galleryNewCollectionTitle => 'Nová kolekce';

  @override
  String get galleryCollectionNameHint => 'Název kolekce';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return 'Smazat \"$collectionName\"? Příspěvky uvnitř přestanou být zařazeny do kolekce.';
  }

  @override
  String get galleryFeedTab => 'Feed';

  @override
  String get galleryCollectionsTab => 'Kolekce';

  @override
  String get galleryNoPostsYet => 'Zatím žádné příspěvky';

  @override
  String get galleryNoCollectionsYet => 'Zatím žádné kolekce';

  @override
  String get gallerySelectACollection => 'Vyberte kolekci';

  @override
  String get galleryNoPostsInCollection =>
      'V této kolekci nejsou žádné příspěvky';

  @override
  String get galleryAddPostButton => 'Přidat příspěvek';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Sdílení obrazovky se nezdařilo: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return 'Hlasitost uživatele $username';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'Ovlivňuje pouze to, co slyšíte vy -- toto zařízení, tento hovor.';

  @override
  String get voiceScreenResetVolumeButton => 'Obnovit';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'Nepodařilo se připojit: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Vaše obrazovka, klepnutím zobrazíte na celou obrazovku';

  @override
  String get voiceScreenYourScreenLabel => 'Vaše obrazovka';

  @override
  String get voiceScreenTapToClose => 'Klepnutím zavřete';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (vy)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', mluví';

  @override
  String get voiceScreenCameraOnSuffix => ', kamera zapnuta';

  @override
  String get voiceScreenActivateToPopOut =>
      ', aktivujte pro vysunutí do vlastního okna';

  @override
  String get voiceScreenShowVarmTooltip => 'Zobrazit VARM';

  @override
  String get voiceScreenHideVarmTooltip => 'Skrýt VARM';

  @override
  String get voiceScreenShowChatTooltip => 'Zobrazit chat';

  @override
  String get voiceScreenHideChatTooltip => 'Skrýt chat';

  @override
  String get voiceScreenStartCameraTooltip => 'Zapnout kameru';

  @override
  String get voiceScreenStopCameraTooltip => 'Vypnout kameru';

  @override
  String get voiceScreenShareScreenTooltip => 'Sdílet obrazovku';

  @override
  String get voiceScreenStopSharingTooltip => 'Ukončit sdílení';

  @override
  String get voiceScreenPopOutTooltip => 'Vysunout hlas do samostatného okna';

  @override
  String get voiceScreenCouldNotPopOut => 'Nepodařilo se vysunout hlas.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Opustit hlasový kanál';

  @override
  String get voiceScreenPinTooltip => 'Připnout (ponechat otevřené)';

  @override
  String get voiceScreenUnpinTooltip => 'Odepnout';

  @override
  String get voiceScreenSizeSmall => 'Malé (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Střední (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Velké (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, připojeno $count';
  }

  @override
  String get voiceBarSpeakingSuffix => ', mluvíte';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return 'Připojeno $count · klepnutím rozbalíte';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Zapnout kameru';

  @override
  String get voiceBarStopCameraTooltip => 'Vypnout kameru';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Opustit hlasový kanál';

  @override
  String get popOutVideoFallbackTitle => 'Hlas';

  @override
  String get popOutVideoMissingTokenError => 'Chybí token nebo URL';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Časový limit připojení vypršel po 15 sekundách';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Chyba: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'Žádní účastníci';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Stage';

  @override
  String get stageCouldNotJoin => 'Nepodařilo se připojit ke Stage.';

  @override
  String get stageThisStageFallback => 'Tento Stage';

  @override
  String get stageRequiresTicketToJoin => 'vyžaduje vstupenku pro připojení';

  @override
  String get stagePleaseWaitLabel => 'Čekejte prosím...';

  @override
  String get stageGetFreeTicketButton => 'Získat vstupenku zdarma';

  @override
  String stageBuyTicketButton(String price) {
    return 'Koupit vstupenku -- $price';
  }

  @override
  String get stageNotNowButton => 'Teď ne';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'Nepodařilo se zahájit nákup vstupenky.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'Stále čekáme na platbu -- zkuste se připojit znovu, jakmile bude potvrzena.';

  @override
  String get stageSpeakerBadge => 'Řečník';

  @override
  String get stageListenerBadge => 'Posluchač';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'Nepodařilo se připojit: $error';
  }

  @override
  String get stageSpeakersHeader => 'ŘEČNÍCI';

  @override
  String get stageRaisedHandsHeader => 'ZVEDNUTÉ RUCE';

  @override
  String get stageAllowButton => 'Povolit';

  @override
  String get stageIgnoreButton => 'Ignorovat';

  @override
  String get stageListenersHeader => 'POSLUCHAČI';

  @override
  String get stageRaiseHandTooltip => 'Zvednout ruku';

  @override
  String get stageLowerHandTooltip => 'Spustit ruku';

  @override
  String get stageLeaveStageTooltip => 'Opustit Stage';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (vy)';
  }

  @override
  String get stageMoveToListenersButton => 'Přesunout mezi posluchače';

  @override
  String get stageYouFallbackName => 'Vy';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'Avatar uživatele $username';
  }

  @override
  String get channelEditDialogNewTitle => 'Nový kanál';

  @override
  String get channelEditDialogEditTitle => 'Upravit kanál';

  @override
  String get channelEditDialogNameHint => 'Název kanálu';

  @override
  String get channelEditDialogTypeLabel => 'Typ';

  @override
  String get channelEditDialogTypeText => 'Textový';

  @override
  String get channelEditDialogTypeVoice => 'Hlasový';

  @override
  String get channelEditDialogTypeGallery => 'Galerie';

  @override
  String get channelEditDialogTypeStage => 'Stage';

  @override
  String get channelEditDialogTypeRules => 'Pravidla';

  @override
  String get channelEditDialogTypeRoleSelection => 'Výběr role';

  @override
  String get channelEditDialogTypeCalendar => 'Kalendář';

  @override
  String get channelEditDialogAnnouncementTitle => 'Oznamovací kanál';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Přispívat mohou pouze členové, kteří mohou spravovat zprávy';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Zveřejňujte zde oznámení o živých vysíláních a nahrávkách';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'Automaticky zveřejní, když člen s oprávněním \"Oznámit živé vysílání\" spustí živé vysílání na Twitch nebo zveřejní nové video na YouTube';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Upozornit tyto role při zveřejnění (nepovinné)';

  @override
  String get channelEditDialogCategoryLabel => 'Kategorie';

  @override
  String get channelEditDialogNoCategory => 'Bez kategorie';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Přístup podle role (ponechte prázdné pro všechny)';

  @override
  String get channelEditDialogContentLabelsLabel => 'Štítky obsahu';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Označí tento kanál pro filtry obsahu členů; u kontrolovaných účtů je zcela blokován';

  @override
  String get categoryEditDialogNewTitle => 'Nová kategorie';

  @override
  String get categoryEditDialogEditTitle => 'Upravit kategorii';

  @override
  String get categoryEditDialogNameHint => 'Název kategorie';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Přístup podle role (ponechte prázdné pro všechny)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Členové — $count online';
  }

  @override
  String get memberPanelRefreshTooltip => 'Obnovit seznam členů';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count členů',
      many: '$count člena',
      few: '$count členové',
      one: '$count člen',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Offline';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', úroveň $tier';
  }

  @override
  String get memberPanelUnknownUser => 'Neznámý';

  @override
  String get memberPanelModerationActionsTooltip => 'Moderátorské akce';

  @override
  String get reportDialogReasonSpam => 'Spam';

  @override
  String get reportDialogReasonHarassment => 'Obtěžování nebo zneužívání';

  @override
  String get reportDialogReasonIllegal => 'Nezákonný obsah';

  @override
  String get reportDialogReasonOther => 'Jiné';

  @override
  String get reportDialogReasonLabel => 'Důvod';

  @override
  String get reportDialogNoteHint =>
      'Něco dalšího, co by měli moderátoři vědět? (nepovinné)';

  @override
  String get reportDialogDisclosureNote =>
      'Obsah zprávy, který se vám zobrazuje, a kdo ji odeslal, bude sdíleno s moderátory tohoto serveru.';

  @override
  String get reportDialogSubmitButton => 'Odeslat nahlášení';

  @override
  String get reportDialogSubmitError => 'Nepodařilo se odeslat nahlášení.';

  @override
  String get notificationBellTitle => 'Oznámení';

  @override
  String get notificationBellMarkAllRead => 'Označit vše jako přečtené';

  @override
  String get notificationBellEmptyState => 'Zatím žádná oznámení';

  @override
  String get notificationBellUnreadLabel => 'Nepřečteno';

  @override
  String get invitePreviewTitle => 'Pozvánka na server';

  @override
  String get invitePreviewInvalidOrExpired =>
      'Neplatná nebo vypršelá pozvánka.';

  @override
  String get invitePreviewCouldNotJoin => 'Nepodařilo se připojit k serveru.';

  @override
  String get invitePreviewUnknownServer => 'Neznámý server';

  @override
  String get shippingAddressFullNameHint => 'Celé jméno';

  @override
  String get shippingAddressLine1Hint => 'Adresa, řádek 1';

  @override
  String get shippingAddressLine2Hint => 'Adresa, řádek 2 (nepovinné)';

  @override
  String get shippingAddressCityHint => 'Město';

  @override
  String get shippingAddressStateHint => 'Stát/kraj';

  @override
  String get shippingAddressZipHint => 'PSČ';

  @override
  String get shippingAddressCountryCodeHint => 'Kód země (např. US)';

  @override
  String get shippingAddressPhoneHint => 'Telefon (nepovinné)';

  @override
  String get shippingAddressPrivacyNote =>
      'Používá se pouze k odeslání této objednávky -- jak s ním po odeslání objednávky naloží Printful, zjistíte v jejich vlastních zásadách ochrany soukromí.';

  @override
  String get updateNudgeAvailableTitle => 'Dostupná aktualizace';

  @override
  String get updateNudgeRequiredTitle => 'Vyžadována aktualizace';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Je dostupná verze Koda $version -- používáte starší verzi.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'Tato verze již není podporována. Aktualizujte na Koda $version, abyste mohli Koda dále používat.';
  }

  @override
  String get updateNudgeLaterButton => 'Později';

  @override
  String get tierBadgeSparkSubscriber => 'Předplatitel Spark';

  @override
  String get tierBadgePulseSubscriber => 'Předplatitel Pulse';

  @override
  String get vispAvatarInDevelopment => 'VE VÝVOJI';

  @override
  String get vispBoostAdvisorCouldNotAnswer =>
      'Visp se nepodařilo sestavit odpověď.';

  @override
  String get vispBoostAdvisorTitle => 'Zeptat se Visp: Poradce ROI vylepšení';

  @override
  String get vispBoostAdvisorFollowUpHint => 'Položte doplňující otázku...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Odeslat';

  @override
  String get vispBoostAdvisorBasedOn => 'Na základě:';

  @override
  String get vispEventDialogCouldNotGenerate =>
      'Visp se nepodařilo vygenerovat událost.';

  @override
  String get vispEventDialogCouldNotCreate =>
      'Tuto událost se nepodařilo vytvořit.';

  @override
  String get vispEventDialogRecurrenceNone => 'Jednorázová';

  @override
  String get vispEventDialogRecurrenceDaily => 'Opakuje se denně';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Opakuje se týdně';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Opakuje se měsíčně';

  @override
  String get vispEventDialogTitle => 'Požádat Visp o vytvoření události';

  @override
  String get vispEventDialogDescription =>
      'Popište událost -- Visp navrhne název, datum/čas a další podrobnosti.';

  @override
  String get vispEventDialogPromptHint =>
      'např. \"Týdenní D&D sezení každý pátek v 19:00 na asi 3 hodiny\"';

  @override
  String get vispEventDialogPrivacyNote =>
      'Váš popis je odeslán do Visp (samostatně hostovaný asistent -- nic neopouští servery Koda), aby vygeneroval tento plán.';

  @override
  String get vispEventDialogStartOver => 'Začít znovu';

  @override
  String get vispEventDialogCreateEvent => 'Vytvořit událost';

  @override
  String get vispEventDialogThinking => 'Přemýšlí...';

  @override
  String get vispEventDialogGeneratePlan => 'Vygenerovat plán';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'Nepodařilo se rozpoznat datum -- zkuste to přeformulovat';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Končí $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price za vstupenku';
  }

  @override
  String get vispEventDialogBasedOn => 'Na základě:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Otázka $questionNumber z $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'Nebo napište vlastní odpověď...';

  @override
  String get vispQuestionStepSendTooltip => 'Odeslat';

  @override
  String get vispQuestionStepSkip => 'Přeskočit a vygenerovat nyní';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp se nepodařilo vygenerovat plán.';

  @override
  String get vispSetupDialogCouldNotApplyPlan =>
      'Tento plán se nepodařilo použít.';

  @override
  String get vispSetupDialogTitleNew => 'Popište Visp svůj server';

  @override
  String get vispSetupDialogTitleExisting =>
      'Požádat Visp o přidání na tento server';

  @override
  String get vispSetupDialogDescriptionNew =>
      'Popište server, který chcete -- Visp navrhne název a sadu rolí, kategorií a kanálů.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Popište, co byste chtěli přidat -- Visp navrhne role, kategorie a kanály k vytvoření.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'např. \"Útulný server pro mou D&D skupinu s hlasovými kanály pro dva stoly\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'např. \"Přidejte pár dalších kanálů pro naše raidové týmy\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      'Váš popis je odeslán do Visp (samostatně hostovaný asistent -- nic neopouští servery Koda), aby vygeneroval tento plán.';

  @override
  String get vispSetupDialogStartOver => 'Začít znovu';

  @override
  String get vispSetupDialogCreateServer => 'Vytvořit server';

  @override
  String get vispSetupDialogAddToServer => 'Přidat na server';

  @override
  String get vispSetupDialogThinking => 'Přemýšlí...';

  @override
  String get vispSetupDialogGeneratePlan => 'Vygenerovat plán';

  @override
  String get vispSetupDialogNewServerLabel => 'Nový server';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rolí',
      many: '$count role',
      few: '$count role',
      one: '$count role',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kategorií',
      many: '$count kategorie',
      few: '$count kategorie',
      one: '$count kategorie',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kanálů',
      many: '$count kanálu',
      few: '$count kanály',
      one: '$count kanál',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'Na základě:';

  @override
  String get childLockoutTitle => 'Jste mimo své povolené hodiny';

  @override
  String get childLockoutBody =>
      'Rodič nebo zákonný zástupce nastavil časy, kdy tento účet může používat Koda. Požádejte je o více času, nebo se vraťte během dalšího povoleného okna.';

  @override
  String get childLockoutLogOutButton => 'Odhlásit se';

  @override
  String get forcePasswordChangeError =>
      'Nepodařilo se aktualizovat heslo. Zkuste to znovu.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Vítejte, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Váš účet vyžaduje nové heslo, než budete moci pokračovat.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'Nové heslo';

  @override
  String get forcePasswordChangeConfirmPasswordHint => 'Potvrďte nové heslo';

  @override
  String get forcePasswordChangeReqLength => 'Alespoň 12 znaků';

  @override
  String get forcePasswordChangeReqUpper => 'Jedno velké písmeno';

  @override
  String get forcePasswordChangeReqLower => 'Jedno malé písmeno';

  @override
  String get forcePasswordChangeReqDigit => 'Jednu číslici';

  @override
  String get forcePasswordChangeReqMatch => 'Hesla se shodují';

  @override
  String get forcePasswordChangeSubmitButton => 'Nastavit nové heslo';

  @override
  String get forgotPasswordEnterEmailError => 'Zadejte svou e-mailovou adresu.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'Pokud tento účet existuje, byl odeslán kód pro obnovení.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Zadejte kód a heslo o délce alespoň 8 znaků.';

  @override
  String get forgotPasswordInvalidCode => 'Neplatný nebo vypršelý kód.';

  @override
  String get forgotPasswordTitle => 'Obnovit heslo';

  @override
  String get forgotPasswordEmailHint => 'E-mailová adresa';

  @override
  String get forgotPasswordSendCodeButton => 'Odeslat kód pro obnovení';

  @override
  String get forgotPasswordCodeHint => '6místný kód';

  @override
  String get forgotPasswordNewPasswordHint => 'Nové heslo';

  @override
  String get forgotPasswordSetNewPasswordButton => 'Nastavit nové heslo';

  @override
  String get verifyEmailEnterCodeError => 'Zadejte 6místný kód z e-mailu.';

  @override
  String get verifyEmailInvalidCode => 'Neplatný nebo vypršelý kód.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'Nový kód byl odeslán na $email.';
  }

  @override
  String get verifyEmailResendFailed => 'Nyní se nepodařilo znovu odeslat.';

  @override
  String get verifyEmailTitle => 'Zkontrolujte svůj e-mail';

  @override
  String verifyEmailSentCode(String email) {
    return 'Odeslali jsme 6místný kód na $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'Ověřit e-mail';

  @override
  String get verifyEmailResendButton => 'Odeslat kód znovu';

  @override
  String get safetyNumberKeysNotSetUp =>
      'Vaše vlastní klíče ještě nebyly nastaveny.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName zatím nemá balíček klíčů.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'Nepodařilo se vypočítat bezpečnostní číslo: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName už toto zařízení nemá.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'Bezpečnostní číslo s uživatelem $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Porovnejte toto číslo s uživatelem $peerName přes jiný kanál -- osobně, telefonním hovorem, kdekoli mimo tento chat. Pokud se shoduje na obou stranách, mluvíte s tím, s kým si myslíte, že mluvíte.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName má $count zařízení, každé s vlastním bezpečnostním číslem -- ověření jednoho nepokrývá ostatní.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Zařízení $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Označit jako ověřené';

  @override
  String get contentFiltersDescription =>
      'Servery mohou označovat kanály štítky obsahu. Vyberte, jak se mají označené kanály chovat -- jde o vaši vlastní preferenci a nikdy neovlivňuje, co vidí ostatní.';

  @override
  String get contentFiltersLabelAdult => 'Obsah pro dospělé';

  @override
  String get contentFiltersLabelSuggestive => 'Sugestivní';

  @override
  String get contentFiltersLabelGraphic => 'Drastický obsah';

  @override
  String get contentFiltersLabelNudity => 'Nesexuální nahota';

  @override
  String get contentFiltersDescAdult => 'Sexuálně explicitní obsah';

  @override
  String get contentFiltersDescSuggestive =>
      'Sexuálně sugestivní, ale ne explicitní obsah';

  @override
  String get contentFiltersDescGraphic => 'Násilí nebo drastické scény';

  @override
  String get contentFiltersDescNudity => 'Nahota v nesexuálním kontextu';

  @override
  String get contentFiltersHide => 'Skrýt';

  @override
  String get contentFiltersWarn => 'Varovat';

  @override
  String get contentFiltersShow => 'Zobrazit';

  @override
  String get deviceTestCouldNotGetToken =>
      'Nepodařilo se získat testovací token.';

  @override
  String get deviceTestLabelTest => 'Test';

  @override
  String get deviceTestLabelRecording => 'Nahrávání...';

  @override
  String get deviceTestLabelPlayingBack => 'Přehrávání...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'Nepodařilo se spustit kameru: $error';
  }

  @override
  String get deviceTestTitle => 'Testovat zařízení';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'Nepodařilo se připojit: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Mikrofon';

  @override
  String get deviceTestHearYourselfLabel => 'Slyšet sám sebe (se zpožděním)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Reproduktor / výstup';

  @override
  String get deviceTestCameraLabel => 'Kamera';

  @override
  String get deviceTestSystemDefault => 'Výchozí nastavení systému';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Mluvte, poté se přehraje ${seconds}s klip';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '$seconds s';
  }

  @override
  String get deviceTestCameraPreviewOff => 'Náhled kamery vypnut';

  @override
  String get deviceTestStopCameraButton => 'Zastavit test kamery';

  @override
  String get deviceTestTestCameraButton => 'Otestovat kameru';

  @override
  String get deviceTestInputLevelLabel => 'Úroveň vstupu';

  @override
  String get devicesScreenRemoveConfirmTitle => 'Odebrat toto zařízení?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'Bude se muset znovu přihlásit a jakékoli zprávy odeslané na něj v době, kdy bylo odebráno, ho poté nezastihnou -- relace Double Ratchet zpětně nedoplňují mezery.';

  @override
  String get devicesScreenRemoveFailed =>
      'Toto zařízení se nepodařilo odebrat.';

  @override
  String get devicesScreenNeverActive => 'Nikdy aktivní';

  @override
  String devicesScreenActiveDate(String date) {
    return 'Aktivní $date';
  }

  @override
  String get devicesScreenDescription =>
      'Každé zařízení, do kterého se přihlásíte, má svou vlastní šifrovací identitu -- zpráva odeslaná vám dosáhne každého zařízení níže. Odeberte to, které nepoužíváte nebo nerozpoznáváte.';

  @override
  String get devicesScreenNoDevicesFound => 'Nebyla nalezena žádná zařízení.';

  @override
  String get devicesScreenUnknownDevice => 'Neznámé zařízení';

  @override
  String get devicesScreenThisDeviceBadge => 'Toto zařízení';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Odebrat zařízení';

  @override
  String get totpSetupInvalidCode => 'Neplatný kód. Zkuste to znovu.';

  @override
  String get totpSetupEnabledMessage => 'Dvoufaktorové ověřování je povoleno.';

  @override
  String get totpSetupScanInstructions =>
      'Naskenujte tento tajný klíč do své ověřovací aplikace (Google Authenticator, 1Password, Authy):';

  @override
  String get totpSetupCodeHint => 'Zadejte 6místný kód pro potvrzení';

  @override
  String get totpSetupVerifyButton => 'Ověřit a povolit';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'Stisknout pro mluvení';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'Stiskněte libovolnou klávesu pro přiřazení...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Testovat zařízení';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Zpracování hlasu';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'Potlačení hluku';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Snižuje hluk pozadí na vašem mikrofonu';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Pokročilé potlačení hluku (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'Odstranění hluku pomocí AI v reálném čase, silnější než standardní potlačení -- nahrazuje ho při zapnutí';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'Potlačení ozvěny';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Zabraňuje ozvěně vašeho vlastního zvuku';

  @override
  String get voiceVideoSettingsAutoGainTitle => 'Automatická regulace zisku';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Automaticky vyrovnává hlasitost mikrofonu (normalizace hlasitosti)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'Automatické ztlumování';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Sníží hlasitost ostatních účastníků, když mluvíte';

  @override
  String get voiceVideoSettingsHighPassTitle => 'Horní propust';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Odřízne nízkofrekvenční hukot (ventilátory, klimatizace, nárazy do stolu)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle =>
      'Detekce zvuku psaní na klávesnici';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Potlačí klapání klávesnice zachycené vaším mikrofonem';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Izolace hlasu';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Zaměří se na váš hlas a odfiltruje ostatní lidi a zvuky v okolí';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Zesílení mikrofonu';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Povolit zesílení';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Předzesílení pro tichý nebo vzdálený mikrofon -- aplikuje se před EQ';

  @override
  String get voiceVideoSettingsBandBoost => 'Zesílení';

  @override
  String get voiceVideoSettingsSectionMicEq => 'EQ mikrofonu';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'Povolit EQ';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Tvaruje váš mikrofon, než se dostane k ostatním';

  @override
  String get voiceVideoSettingsBandBass => 'Basy';

  @override
  String get voiceVideoSettingsBandMid => 'Střední';

  @override
  String get voiceVideoSettingsBandTreble => 'Výšky';

  @override
  String get voiceVideoSettingsSectionVad => 'Detekce hlasové aktivity (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'Povolit VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Přenáší pouze tehdy, když skutečně mluvíte';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Citlivost';

  @override
  String get voiceVideoSettingsVadHint =>
      'Nižší = zachytí tišší zvuky. Vyšší = přenos spustí pouze hlasitější řeč.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Přiřazená klávesa';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'Nenastaveno — mikrofon zůstává aktivní vždy, když není ztlumen';

  @override
  String get voiceVideoSettingsClearButton => 'Vymazat';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Nastavit klávesu';

  @override
  String get voiceVideoSettingsChangeButton => 'Změnit';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'Když je klávesa přiřazena, váš mikrofon přenáší pouze, dokud tuto klávesu držíte. To má přednost před VOX, dokud jste v hlasovém kanálu.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Model reaktivního virtuálního avatara';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Nahrajte dva obrázky, které se prohodí, když mluvíte. Viditelné pouze pro vás.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'Tichý';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'Mluvící';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'Práh mluvení';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Nižší = snadněji přepne na mluvící obrázek.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'Odebrat VARM';

  @override
  String get gifPickerNoGifsFound => 'Nebyla nalezena žádná GIF';

  @override
  String get gifPickerSearchHint => 'Hledat GIF...';

  @override
  String get messageSearchHint => 'Hledat v tomto kanálu...';

  @override
  String get messageSearchTooltip => 'Hledat';

  @override
  String get messageSearchInitialHint =>
      'Hledá zprávy již načtené na tomto zařízení -- starší historie se stahuje (a lokálně dešifruje) při procházení dál do minulosti.';

  @override
  String get messageSearchNoMatches => 'Žádné výsledky';

  @override
  String get messageSearchStartOfHistory => 'Začátek historie kanálu';

  @override
  String get messageSearchFurtherBackButton => 'Hledat dále do minulosti';

  @override
  String get messageSearchUnknownAuthor => 'Neznámý';
}
