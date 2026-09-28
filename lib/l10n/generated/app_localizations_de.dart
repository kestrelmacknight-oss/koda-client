// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonSave => 'Speichern';

  @override
  String get commonEdit => 'Bearbeiten';

  @override
  String get commonDelete => 'Löschen';

  @override
  String get commonCreate => 'Erstellen';

  @override
  String get commonClose => 'Schließen';

  @override
  String get commonDone => 'Fertig';

  @override
  String get commonDownload => 'Herunterladen';

  @override
  String get commonDisconnect => 'Trennen';

  @override
  String get commonNone => 'Keine';

  @override
  String get commonJoin => 'Beitreten';

  @override
  String get commonDismiss => 'Verwerfen';

  @override
  String get commonSubmit => 'Absenden';

  @override
  String get commonConfirm => 'Bestätigen';

  @override
  String get commonRemove => 'Entfernen';

  @override
  String get commonRetry => 'Erneut versuchen';

  @override
  String get commonOk => 'OK';

  @override
  String get commonYes => 'Ja';

  @override
  String get commonNo => 'Nein';

  @override
  String get commonSearch => 'Suchen';

  @override
  String get commonSettings => 'Einstellungen';

  @override
  String get commonLoading => 'Wird geladen...';

  @override
  String get settingsLanguageSection => 'Sprache';

  @override
  String get settingsLanguageTitle => 'App-Sprache';

  @override
  String get settingsLanguageSystemDefault => 'Systemstandard';

  @override
  String get settingsLanguageDescription =>
      'Wählen Sie die Anzeigesprache der Koda-Oberfläche. Dies ist unabhängig von der Hauptsprache eines Servers oder der Sprache, in der Sie Nachrichten schreiben.';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsSignOut => 'Abmelden';

  @override
  String get settingsSectionMyAccount => 'Mein Konto';

  @override
  String get settingsSectionSecurity => 'Sicherheit';

  @override
  String get settingsSectionAccessibility => 'Barrierefreiheit';

  @override
  String get settingsSectionBilling => 'Abrechnung';

  @override
  String get settingsSectionFamily => 'Familie';

  @override
  String get settingsSectionVoiceVideo => 'Sprache & Video';

  @override
  String get settingsSectionDesktop => 'Desktop';

  @override
  String get settingsSectionAbout => 'Über';

  @override
  String get settingsTwoFactorTitle => 'Zwei-Faktor-Authentifizierung';

  @override
  String get settingsTwoFactorSubtitle =>
      'Fügen Sie eine Authentifizierungs-App für zusätzliche Sicherheit hinzu';

  @override
  String get settingsLinkedDevicesTitle => 'Verknüpfte Geräte';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'Mit diesem Konto verbundene Geräte anzeigen und entfernen';

  @override
  String get settingsContentFiltersTitle => 'Inhaltsfilter';

  @override
  String get settingsContentFiltersSubtitle =>
      'Legen Sie fest, wie markierte Inhalte angezeigt werden';

  @override
  String get settingsDmFriendsOnlyTitle => 'DMs nur von Freunden zulassen';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Personen, die nicht mit Ihnen befreundet sind, können keine Unterhaltung mit Ihnen beginnen';

  @override
  String get settingsDmPrivacyError =>
      'DM-Datenschutz konnte nicht aktualisiert werden.';

  @override
  String get settingsShowVispAvatarTitle => 'Visp-Avatar anzeigen';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Zeigt Visps Gesicht und Stimmung in dessen Einrichtungs-, Ereignis- und Tipp-Dialogen';

  @override
  String get settingsHighContrastTitle => 'Hoher Kontrast';

  @override
  String get settingsHighContrastSubtitle =>
      'Reine Schwarz-Weiß-Farben mit hohem Kontrast in der gesamten App -- das Umschalten lädt den aktuellen Bildschirm kurz neu.';

  @override
  String get settingsDyslexiaFontTitle => 'Legasthenie-freundliche Schrift';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Stellt den Haupttext in der gesamten App auf OpenDyslexic um';

  @override
  String get settingsFontSizeTitle => 'Schriftgröße';

  @override
  String get settingsFontSizeSample =>
      'Zwölf Boxkämpfer jagen Viktor quer über den großen Sylter Deich';

  @override
  String get settingsDensityTitle => 'Dichte';

  @override
  String get settingsDensityDescription =>
      'Betrifft den Abstand von Standardsteuerelementen -- Schaltflächen, Schalter, Dialoge -- aber nicht alle benutzerdefinierten Layouts.';

  @override
  String get settingsDensityCompact => 'Kompakt';

  @override
  String get settingsDensityStandard => 'Standard';

  @override
  String get settingsDensityComfortable => 'Komfortabel';

  @override
  String get settingsStreamingTitle => 'Streaming-Konten';

  @override
  String get settingsStreamingDescription =>
      'Verbinden Sie Twitch/YouTube, damit Server, auf denen Sie die Berechtigung \"Live ankündigen\" haben, automatisch posten können, wenn Sie live sind oder ein neues Video veröffentlichen.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform verbunden als $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform nicht verbunden';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- gerade live';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- neuer Beitrag';

  @override
  String get settingsStreamingConnecting => 'Verbinden...';

  @override
  String get settingsStreamingConnect => 'Verbinden';

  @override
  String get settingsAnnounceLiveTwitch => 'Ankündigen, wenn ich live bin';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Livestreams und neue Beiträge ankündigen';

  @override
  String get settingsRefreshStatus =>
      'Bereits über Ihren Browser verbunden? Status aktualisieren';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'Verbindung zu $platform konnte nicht gestartet werden.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Schließen Sie die Verbindung in Ihrem Browser ab und kehren Sie dann zurück, um zu aktualisieren.';

  @override
  String get settingsThroneTitle => 'Throne-Webhook';

  @override
  String get settingsThroneDescription =>
      'Fügen Sie diese URL in die Webhook-Einstellungen von Throne.com ein, um in Koda benachrichtigt zu werden, wenn Ihnen jemand ein Geschenk sendet.';

  @override
  String get settingsThroneGetUrl => 'Meine Webhook-URL abrufen';

  @override
  String get settingsThroneCopyTooltip => 'Kopieren';

  @override
  String get settingsThroneCopiedToast => 'In die Zwischenablage kopiert';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Neu generieren (macht die alte URL ungültig)';

  @override
  String get settingsThroneRegenerateConfirmTitle =>
      'Webhook-URL neu generieren?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'Ihre alte URL funktioniert dann nicht mehr -- denken Sie daran, sie anschließend auf Throne.com zu aktualisieren.';

  @override
  String get settingsThroneRegenerate => 'Neu generieren';

  @override
  String get settingsUploadPhoto => 'Foto hochladen';

  @override
  String get settingsOrPasteUrl => 'oder fügen Sie unten eine URL ein';

  @override
  String get settingsAvatarUrlHint => 'https://beispiel.de/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'Für den Bild-Upload ist Cloudflare R2 erforderlich -- das Einfügen einer URL funktioniert weiterhin.';

  @override
  String get settingsDisplayNameLabel => 'ANZEIGENAME';

  @override
  String get settingsDisplayNameHint => 'Anzeigename';

  @override
  String get settingsBioLabel => 'BIOGRAFIE';

  @override
  String get settingsBioHint => 'Erzählen Sie etwas über sich';

  @override
  String get settingsPronounsLabel => 'PRONOMEN';

  @override
  String get settingsPronounsHint => 'z. B. sie/ihr';

  @override
  String get settingsShowPronounsTitle => 'Meine Pronomen für andere anzeigen';

  @override
  String get settingsShowPronounsSubtitle =>
      'Wird neben Ihrem Namen im Chat, in Mitgliederlisten und bei Sprache angezeigt';

  @override
  String get settingsStatusLabel => 'STATUS';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusAway => 'Abwesend';

  @override
  String get statusDnd => 'Nicht stören';

  @override
  String get statusInvisible => 'Unsichtbar';

  @override
  String get settingsFamilyNotAvailable =>
      'Kindersicherung ist bei einem überwachten Konto nicht verfügbar.';

  @override
  String get settingsAboutTitle => 'Über Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Nutzungsbedingungen';

  @override
  String get settingsPrivacyTitle => 'Datenschutzrichtlinie';

  @override
  String get settingsSupportTitle => 'Support';

  @override
  String get settingsReportSecurityTitle => 'Sicherheitsproblem melden';

  @override
  String get settingsDesktopNotAvailable =>
      'Dies sind reine Desktop-Einstellungen -- auf dieser Plattform gibt es kein Fenster oder Infobereich.';

  @override
  String get settingsCloseToTrayTitle => 'In den Infobereich minimieren';

  @override
  String get settingsCloseToTraySubtitle =>
      'Beim Schließen des Fensters läuft Koda im Hintergrund weiter, um Benachrichtigungen zu erhalten -- deaktivieren Sie dies, damit das Schließen des Fensters die App tatsächlich beendet.';

  @override
  String get authErrorEmailPasswordRequired =>
      'E-Mail-Adresse und Passwort sind erforderlich.';

  @override
  String get authErrorIncorrectCredentials =>
      'Falsche E-Mail-Adresse oder falsches Passwort.';

  @override
  String get authErrorMustAcceptTerms =>
      'Bitte akzeptieren Sie die Nutzungsbedingungen.';

  @override
  String get authErrorAllFieldsRequired => 'Alle Felder sind erforderlich.';

  @override
  String get authErrorPasswordsDontMatch =>
      'Die Passwörter stimmen nicht überein.';

  @override
  String get authErrorPasswordTooShort =>
      'Das Passwort muss mindestens 8 Zeichen lang sein.';

  @override
  String get authErrorRegistrationFailed =>
      'Registrierung fehlgeschlagen. Diese E-Mail-Adresse wird möglicherweise bereits verwendet.';

  @override
  String get authTabSignIn => 'Anmelden';

  @override
  String get authTabCreateAccount => 'Konto erstellen';

  @override
  String get authAgreementPrefix =>
      'Mit der Nutzung von Koda stimmen Sie unseren ';

  @override
  String get authTermsLink => 'Nutzungsbedingungen';

  @override
  String get authAgreementMiddle => ' und unserer ';

  @override
  String get authPrivacyLink => 'Datenschutzrichtlinie';

  @override
  String get authAgreementSuffix => ' zu.';

  @override
  String get authEmailHint => 'E-Mail-Adresse';

  @override
  String get authPasswordHint => 'Passwort';

  @override
  String get authForgotPassword => 'Passwort vergessen?';

  @override
  String get authSignInButton => 'Anmelden';

  @override
  String get authUsernameHint => 'Benutzername';

  @override
  String get authConfirmPasswordHint => 'Passwort bestätigen';

  @override
  String get authAgreeToTerms =>
      'Ich stimme den Nutzungsbedingungen und der Datenschutzrichtlinie zu';

  @override
  String get authCreateAccountButton => 'Konto erstellen';

  @override
  String get dmSafetyNumberChangedWarning =>
      'Die Sicherheitsnummer dieser Unterhaltung hat sich geändert -- überprüfen Sie sie vor dem Senden.';

  @override
  String get dmMessageNotSent => 'Nachricht nicht gesendet.';

  @override
  String dmEncryptMessageError(String error) {
    return 'Nachricht konnte nicht verschlüsselt werden: $error';
  }

  @override
  String get dmAttachmentUploadFailed =>
      'Hochladen des Anhangs fehlgeschlagen.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'Anhang konnte nicht verschlüsselt werden: $error';
  }

  @override
  String get dmReportMessage => 'Nachricht melden';

  @override
  String get dmReportSubmitted => 'Meldung gesendet.';

  @override
  String get dmTitle => 'Nachrichten';

  @override
  String get dmNewMessage => 'Neue Nachricht';

  @override
  String get dmNoConversationsYet => 'Noch keine Unterhaltungen';

  @override
  String get dmSelectConversation => 'Wählen Sie eine Unterhaltung aus';

  @override
  String get dmVerifySafetyNumberTooltip => 'Sicherheitsnummer überprüfen';

  @override
  String get dmSeenLabel => 'Gesehen';

  @override
  String get dmMessageActionsTooltip => 'Nachrichtenaktionen';

  @override
  String get dmRemoveAttachmentTooltip => 'Anhang entfernen';

  @override
  String get dmAttachFileTooltip => 'Datei anhängen';

  @override
  String get dmMessageHint => 'Nachricht...';

  @override
  String get dmSendMessageTooltip => 'Nachricht senden';

  @override
  String get dmNoFriendsYet =>
      'Noch keine Freunde.\nSenden Sie eine Freundschaftsanfrage, um zu beginnen.';

  @override
  String get dmUnfriendTooltip => 'Freundschaft aufheben';

  @override
  String get dmNoPendingRequests => 'Keine ausstehenden Freundschaftsanfragen.';

  @override
  String get dmIncomingRequestsLabel => 'ERHALTEN';

  @override
  String get dmSentRequestsLabel => 'GESENDET';

  @override
  String get dmAcceptTooltip => 'Annehmen';

  @override
  String get dmDeclineTooltip => 'Ablehnen';

  @override
  String get dmPendingLabel => 'Ausstehend';

  @override
  String get dmNewMessageDialogTitle => 'Neue Nachricht';

  @override
  String get dmEnterUsernameHint => 'Benutzernamen eingeben';

  @override
  String get dmOpenButton => 'Öffnen';

  @override
  String dmSavedAttachment(String fileName) {
    return '$fileName gespeichert';
  }

  @override
  String get dmUnknownUser => 'Unbekannt';

  @override
  String get dmEndToEndEncryptedTooltip => 'Ende-zu-Ende-verschlüsselt';

  @override
  String get homeContentWarningTitle => 'Inhaltswarnung';

  @override
  String homeContentWarningBody(String labels) {
    return 'Dieser Kanal ist markiert für: $labels.\n\nÄndern Sie dies unter Einstellungen > Sicherheit > Inhaltsfilter.';
  }

  @override
  String get homeViewAnyway => 'Trotzdem anzeigen';

  @override
  String get homeCouldNotConnectVoice =>
      'Verbindung zur Sprache konnte nicht hergestellt werden.';

  @override
  String get homeCreateServer => 'Server erstellen';

  @override
  String get homeJoinServer => 'Server beitreten';

  @override
  String get homeRedeemCode => 'Code einlösen';

  @override
  String get homeJoinServerDialogTitle => 'Server beitreten';

  @override
  String get homeEnterInviteCode =>
      'Geben Sie einen Einladungscode oder eine URL ein:';

  @override
  String get homeInviteCodeHint => 'z. B. XK9MP2';

  @override
  String get homeJoined => 'Beigetreten!';

  @override
  String get homeInvalidInvite =>
      'Ungültiger oder abgelaufener Einladungscode.';

  @override
  String get homeJoinButton => 'Beitreten';

  @override
  String get homeRedeemCodeDialogTitle => 'Code einlösen';

  @override
  String get homeEnterBackerCode =>
      'Geben Sie Ihren Unterstützer- oder Belohnungscode ein:';

  @override
  String get homeRewardCodeHint => 'Belohnungscode';

  @override
  String get homeCodeRedeemed =>
      'Code eingelöst! Ihre Belohnungen wurden angewendet.';

  @override
  String get homeInvalidRedeemCode =>
      'Ungültiger, abgelaufener oder bereits eingelöster Code.';

  @override
  String get homeRedeemButton => 'Einlösen';

  @override
  String get homeAreFriends => 'Ihr seid befreundet';

  @override
  String get homeAddFriend => 'Als Freund hinzufügen';

  @override
  String homeFriendRequestSent(String username) {
    return 'Freundschaftsanfrage an $username gesendet!';
  }

  @override
  String get homeMessageButton => 'Nachricht';

  @override
  String get homeSendTip => 'Trinkgeld senden';

  @override
  String get homeSwitchToServer => 'Zu diesem Server wechseln';

  @override
  String get homeInvitePeople => 'Personen einladen';

  @override
  String get homeServerSettingsMenuItem => 'Servereinstellungen';

  @override
  String get homeLeaveServerMenuItem => 'Server verlassen';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return '$serverName verlassen? Sie können mit einer Einladung wieder beitreten.';
  }

  @override
  String get homeLeaveButton => 'Verlassen';

  @override
  String get homeCreateAServer => 'Einen Server erstellen';

  @override
  String get homeServerNameHint => 'Servername';

  @override
  String get homeDescribeToVisp => 'Stattdessen Visp beschreiben';

  @override
  String get homeMarkAsRead => 'Als gelesen markieren';

  @override
  String get homeEditChannel => 'Kanal bearbeiten';

  @override
  String get homeDeleteChannel => 'Kanal löschen';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return '#$channelName löschen? Dies kann nicht rückgängig gemacht werden.';
  }

  @override
  String get homeDeleteButton => 'Löschen';

  @override
  String get homeCreateChannelHere => 'Kanal hier erstellen';

  @override
  String get homeEditCategory => 'Kategorie bearbeiten';

  @override
  String get homeDeleteCategory => 'Kategorie löschen';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return '\"$categoryName\" löschen? Die darin enthaltenen Kanäle werden unkategorisiert.';
  }

  @override
  String get homeReplyAction => 'Antworten';

  @override
  String get homeCreateThreadAction => 'Thread erstellen';

  @override
  String get homeEditMessageAction => 'Nachricht bearbeiten';

  @override
  String get homeDeleteMessageAction => 'Nachricht löschen';

  @override
  String get homePinMessageAction => 'Nachricht anheften';

  @override
  String get homeUnpinMessageAction => 'Anheftung aufheben';

  @override
  String get homeReportMessageAction => 'Nachricht melden';

  @override
  String get homeReportSubmitted => 'Meldung gesendet.';

  @override
  String get homeAddReactionTitle => 'Reaktion hinzufügen';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Threads',
      one: '$count Thread',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'Kategorieoptionen';

  @override
  String get homeChannelOptionsTooltip => 'Kanaloptionen';

  @override
  String get homeOpenVoiceChatTooltip => 'Chat öffnen';

  @override
  String get homeMarketplaceLabel => 'Marktplatz';

  @override
  String get homeSelectChannelPrompt => 'Wählen Sie einen Kanal aus';

  @override
  String get homeSearchTooltip => 'Suchen';

  @override
  String get homePinnedMessagesTooltip => 'Angeheftete Nachrichten';

  @override
  String get homeWaitingForKey => 'Warte auf Verschlüsselungsschlüssel...';

  @override
  String get homeUnableToDecrypt =>
      'Diese Nachricht kann nicht entschlüsselt werden.';

  @override
  String get homeMessageActionsTooltip => 'Nachrichtenaktionen';

  @override
  String get homeCancelReplyTooltip => 'Antwort abbrechen';

  @override
  String get homeRemoveAttachmentTooltip => 'Anhang entfernen';

  @override
  String get homeAttachFileTooltip => 'Datei anhängen';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'Nachricht an #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'Nachricht senden';

  @override
  String get homeEditMessageTitle => 'Nachricht bearbeiten';

  @override
  String get homeMessageLabel => 'Nachricht';

  @override
  String get homePinnedMessagesTitle => 'Angeheftete Nachrichten';

  @override
  String get homeNoPinnedMessages => 'Keine angehefteten Nachrichten';

  @override
  String get homeUnpinTooltip => 'Anheftung aufheben';

  @override
  String get homeCreateThreadTitle => 'Thread erstellen';

  @override
  String get homeThreadNameHint => 'Threadname';

  @override
  String homeThreadCreated(String name) {
    return 'Thread \"$name\" erstellt!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Erstellen oder beitreten';

  @override
  String get homeKodaMarketplaceTooltip => 'Koda-Marktplatz';

  @override
  String get homeAdminPanelTooltip => 'Admin-Bereich';

  @override
  String get homeServerSettingsTooltip => 'Servereinstellungen';

  @override
  String get homeSettingsTooltip => 'Einstellungen';

  @override
  String get homeContentWarningBadge => 'Inhaltswarnung';

  @override
  String get homeDirectMessagesTooltip => 'Direktnachrichten';

  @override
  String homeReplyingTo(String username) {
    return 'Antwort an $username';
  }

  @override
  String get homeAttachmentFallback => 'Anhang';

  @override
  String serverConnectError(String service) {
    return 'Verbindung zu $service konnte nicht gestartet werden.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Printful trennen?';

  @override
  String get serverDisconnectPrintfulBody =>
      'Dieser Server kann keine Merch-Bestellungen mehr verarbeiten, bis er erneut verbunden wird.';

  @override
  String get serverDisconnectTiltifyTitle => 'Tiltify trennen?';

  @override
  String get serverDisconnectTiltifyBody =>
      'Dieser Server zeigt keinen Spendenaktions-Fortschritt mehr an, bis er erneut verbunden wird.';

  @override
  String get serverNewRoleTitle => 'Neue Rolle';

  @override
  String get serverEditRoleTitle => 'Rolle bearbeiten';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Farbe $hex';
  }

  @override
  String get permViewChannels => 'Kanäle ansehen';

  @override
  String get permSendMessages => 'Nachrichten senden';

  @override
  String get permConnectVoice => 'Mit Sprache verbinden';

  @override
  String get permManageServer => 'Server verwalten';

  @override
  String get permManageChannels => 'Kanäle verwalten';

  @override
  String get permManageRoles => 'Rollen verwalten';

  @override
  String get permManageMessages => 'Nachrichten verwalten';

  @override
  String get permKickMembers => 'Mitglieder hinauswerfen';

  @override
  String get permBanMembers => 'Mitglieder bannen';

  @override
  String get permMuteMembers => 'Mitglieder stummschalten';

  @override
  String get permMentionEveryone => '@everyone erwähnen';

  @override
  String get permManageMarketplace => 'Marktplatz verwalten';

  @override
  String get permAnnounceLive => 'Live ankündigen';

  @override
  String get permMoveMembers => 'Mitglieder verschieben (Sprachkanal)';

  @override
  String get serverRoleNameHint => 'Rollenname';

  @override
  String get serverColorLabel => 'Farbe';

  @override
  String get serverPermissionsLabel => 'Berechtigungen';

  @override
  String get serverSelfAssignableTitle => 'Selbst zuweisbar';

  @override
  String get serverSelfAssignableSubtitle =>
      'Mitglieder können sich diese Rolle selbst zuweisen';

  @override
  String get serverDefaultRoleUndeletable =>
      'Die Standardrolle kann nicht gelöscht werden.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'Rolle \"$roleName\" löschen?';
  }

  @override
  String get serverCouldNotDeleteRole =>
      'Diese Rolle konnte nicht gelöscht werden.';

  @override
  String get serverMemberFallback => 'Mitglied';

  @override
  String get serverNoRolesYet => 'Noch keine Rollen.';

  @override
  String get serverRefreshStatus =>
      'Bereits über Ihren Browser verbunden? Status aktualisieren';

  @override
  String get serverPrintfulConnected => 'Printful verbunden';

  @override
  String get serverPrintfulNotConnected => 'Printful nicht verbunden';

  @override
  String get serverPrintfulDescription =>
      'Verbinden Sie das Printful-Konto dieses Servers, um über Koda aufgegebene Merch-Bestellungen zu verarbeiten. Jeder Server verbindet seinen eigenen Shop.';

  @override
  String get serverConnecting => 'Verbinden...';

  @override
  String get serverConnectPrintful => 'Printful verbinden';

  @override
  String get serverTiltifyConnected => 'Tiltify verbunden';

  @override
  String get serverTiltifyNotConnected => 'Tiltify nicht verbunden';

  @override
  String get serverTiltifyDescription =>
      'Verbinden Sie das Tiltify-Konto dieses Servers, um allen Mitgliedern den Live-Fortschritt einer Spendenaktion anzuzeigen. Nur lesend -- Koda postet oder ändert niemals etwas bei Tiltify.';

  @override
  String get serverConnectTiltify => 'Tiltify verbinden';

  @override
  String get serverNoTiltifyCampaigns =>
      'Auf diesem Tiltify-Konto wurden keine Kampagnen gefunden.';

  @override
  String get serverPickCampaign =>
      'Wählen Sie, welche Kampagne angezeigt werden soll';

  @override
  String get serverUntitledCampaign => 'Unbenannte Kampagne';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '$currency $raised gesammelt von $goal Ziel';
  }

  @override
  String get serverViewCampaign => 'Kampagne ansehen';

  @override
  String get serverRefreshButton => 'Aktualisieren';

  @override
  String get serverUploadButton => 'Hochladen';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '$used / $limit Plätze belegt -- Boost-Stufe $level';
  }

  @override
  String get serverNoCustomEmoji => 'Noch keine benutzerdefinierten Emojis.';

  @override
  String get serverDeleteEmojiTooltip => 'Emoji löschen';

  @override
  String get serverUploadEmojiTitle => 'Emoji hochladen';

  @override
  String get serverEmojiNameHint => 'Name (Buchstaben, Zahlen, _)';

  @override
  String get serverChooseImage => 'Bild auswählen';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Aktuelle Boost-Stufe: $level';
  }

  @override
  String get serverBackgroundTitle => 'Server-Hintergrund';

  @override
  String get serverBackgroundDescription =>
      'Ein benutzerdefinierter Hintergrund, der allen Mitgliedern dieses Servers hinter der Kanalansicht angezeigt wird.';

  @override
  String get serverBackgroundLockedHint =>
      'Erreichen Sie Boost-Stufe 4, um einen benutzerdefinierten Hintergrund freizuschalten.';

  @override
  String get serverIconBorderTitle => 'Server-Icon-Rahmen';

  @override
  String get serverIconBorderDescription =>
      'Ein Akzentrahmen um das Icon dieses Servers in der Serverliste jedes Mitglieds.';

  @override
  String get serverIconBorderLockedHint =>
      'Erreichen Sie Boost-Stufe 5, um einen benutzerdefinierten Icon-Rahmen freizuschalten.';

  @override
  String get serverBoostFromBank =>
      'Boosten Sie diesen Server über die Server-Bank im Marktplatz, um seine Stufe zu erhöhen.';

  @override
  String get serverMarketplaceListingLabel => 'MARKTPLATZ-EINTRAG';

  @override
  String get serverListInMarketplace => 'Im Koda-Marktplatz auflisten';

  @override
  String get serverListInMarketplaceDescription =>
      'Fügt diesen Server dem Entdecken-Tab der Plattform hinzu, mit der Chance, in der wöchentlichen Rotation vorgestellter Server zu erscheinen. Unabhängig von der allgemeinen Server-Beitritts-Entdeckung.';

  @override
  String get serverSocialLinkLabel => 'Social-/Einladungslink (optional)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Link speichern';

  @override
  String get serverPricingLabel => 'PREISGESTALTUNG';

  @override
  String get serverPrimaryCurrencyLabel => 'Hauptwährung';

  @override
  String get serverPrimaryCurrencyDescription =>
      'Gilt für Server-Abonnementstufen und die Preise digitaler Güter, die Sie für diesen Server festlegen.';

  @override
  String get serverPrimaryLanguageLabel => 'Hauptsprache';

  @override
  String get serverPrimaryLanguageDescription =>
      'Nachrichten, die Mitglieder in einer anderen Sprache posten, erhalten ein kleines Sprachabzeichen im Vergleich zu dieser Einstellung.';

  @override
  String get serverMarketplaceLinkSaved => 'Marktplatz-Link gespeichert.';

  @override
  String get serverIconUpdated => 'Server-Icon aktualisiert!';

  @override
  String get serverTemplateImported => 'Vorlage importiert!';

  @override
  String get serverImportFromDiscord => 'Von Discord importieren';

  @override
  String get serverVispPlanLive => 'Visps Plan ist fertig!';

  @override
  String get serverAskVisp => 'Visp fragen';

  @override
  String get serverAddCategoryButton => 'Kategorie hinzufügen';

  @override
  String get serverAddChannelHereTooltip => 'Kanal hier hinzufügen';

  @override
  String get serverRename => 'Umbenennen';

  @override
  String get serverUncategorized => 'UNKATEGORISIERT';

  @override
  String get serverAddChannel => 'Kanal hinzufügen';

  @override
  String get serverEditRulesContent => 'Regelinhalt bearbeiten';

  @override
  String get serverRulesContentHint =>
      'Schreiben Sie hier die Regeln Ihres Servers...';

  @override
  String get serverRulesUpdated => 'Regeln aktualisiert!';

  @override
  String get serverAddRole => 'Rolle hinzufügen';

  @override
  String get serverDefaultRoleLabel => 'Standardrolle';

  @override
  String get serverManageRolesTooltip => 'Rollen verwalten';

  @override
  String get serverMutedLabel => 'Stumm';

  @override
  String get serverExpandedLabel => 'ausgeklappt';

  @override
  String get serverCollapsedLabel => 'eingeklappt';

  @override
  String get serverUnmute => 'Stummschaltung aufheben';

  @override
  String get serverMute => 'Stummschalten';

  @override
  String get serverKick => 'Hinauswerfen';

  @override
  String get serverBan => 'Bannen';

  @override
  String serverBannedUsersLabel(int count) {
    return 'GEBANNTE BENUTZER — $count';
  }

  @override
  String get serverNoBannedUsers => 'Keine gebannten Benutzer.';

  @override
  String get serverUnban => 'Bann aufheben';

  @override
  String get serverMemberFallbackGeneric => 'dieses Mitglied';

  @override
  String serverBanConfirm(String username, String serverName) {
    return '$username von $serverName bannen? Diese Person kann ohne Bann-Aufhebung nicht zurückkehren.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return '$username von $serverName hinauswerfen? Diese Person kann mit einer Einladung zurückkehren.';
  }

  @override
  String get serverMuteDuration60Sec => '60 Sekunden';

  @override
  String get serverMuteDuration5Min => '5 Minuten';

  @override
  String get serverMuteDuration10Min => '10 Minuten';

  @override
  String get serverMuteDuration1Hour => '1 Stunde';

  @override
  String get serverMuteDuration1Day => '1 Tag';

  @override
  String get serverMuteDuration1Week => '1 Woche';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return '$username konnte nicht $action werden.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return '$username stummschalten';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return '$username konnte nicht stummgeschaltet werden.';
  }

  @override
  String get serverUnlockInvites => 'Einladungen freischalten';

  @override
  String get serverInvitesUnlocked => 'Einladungen freigeschaltet.';

  @override
  String get serverAuditLogDescription =>
      'Moderationsaktivität der Stufe 1 -- Hinauswürfe, Banns, Stummschaltungen und automatischer Flood-/Raid-Schutz. Nur Metadaten; niemals Nachrichteninhalte.';

  @override
  String get serverSystemActor => 'System';

  @override
  String get serverActionKicked => 'hat hinausgeworfen';

  @override
  String get serverActionBanned => 'hat gebannt';

  @override
  String get serverActionUnbanned => 'hat den Bann aufgehoben von';

  @override
  String get serverActionMuted => 'hat stummgeschaltet';

  @override
  String get serverActionUnmuted => 'hat die Stummschaltung aufgehoben von';

  @override
  String get serverActionFloodDetected =>
      'automatisch stummgeschaltet wegen Flood';

  @override
  String get serverActionRaidLockdownEnabled =>
      'hat Einladungen gesperrt (Anti-Raid-Schutz)';

  @override
  String get serverActionRaidLockdownDisabled => 'hat Einladungen entsperrt';

  @override
  String get serverActionMoved => 'hat verschoben';

  @override
  String get serverUnknownAction => 'unbekannte Aktion';

  @override
  String get serverNoModerationActivity => 'Noch keine Moderationsaktivität.';

  @override
  String get serverReportsDescription =>
      'Von Mitgliedern dieses Servers gemeldete Nachrichten -- die bereits entschlüsselte eigene Kopie des Meldenden, offengelegt durch die Meldung.';

  @override
  String get serverNoPendingReports => 'Keine ausstehenden Meldungen.';

  @override
  String get serverReportReasonOther => 'sonstiges';

  @override
  String get serverReportStatusActioned => 'Bearbeitet';

  @override
  String get serverReportStatusDismissed => 'Verworfen';

  @override
  String get serverResolvedLabel => 'BEARBEITET';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'Gemeldet von $reporter -- gesendet von $target';
  }

  @override
  String serverReportNote(String note) {
    return 'Notiz: $note';
  }

  @override
  String get serverDismissButton => 'Verwerfen';

  @override
  String get serverMarkActioned => 'Als bearbeitet markieren';

  @override
  String get serverCreateInvite => 'Einladung erstellen';

  @override
  String get serverInviteCreatedTitle => 'Einladung erstellt';

  @override
  String get serverNoActiveInvites => 'Keine aktiven Einladungen';

  @override
  String serverUsesLabel(String uses) {
    return 'Verwendungen: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Einladung löschen';

  @override
  String get serverChangeIconLabel => 'Server-Icon ändern';

  @override
  String get serverFallbackName => 'Server';

  @override
  String serverSettingsTitle(String serverName) {
    return '$serverName-Einstellungen';
  }

  @override
  String get serverTabChannels => 'Kanäle';

  @override
  String get serverTabRoles => 'Rollen';

  @override
  String get serverTabMembers => 'Mitglieder';

  @override
  String get serverTabInvites => 'Einladungen';

  @override
  String get serverTabMerch => 'Merch';

  @override
  String get serverTabEmoji => 'Emojis';

  @override
  String get serverTabCustomize => 'Anpassen';

  @override
  String get serverTabAuditLog => 'Audit-Protokoll';

  @override
  String get serverTabReports => 'Meldungen';

  @override
  String get serverTabThresholdMod => 'Schwellenwert-Moderation';

  @override
  String get serverTabCharity => 'Wohltätigkeit';

  @override
  String get homeCustomEmojiFallback => 'benutzerdefiniertes Emoji';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Reaktionen',
      one: '$count Reaktion',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted =>
      ', Sie haben reagiert, aktivieren zum Entfernen';

  @override
  String get homeReactionActivateToAdd => ', aktivieren zum Hinzufügen';

  @override
  String get homeAddReactionLabel => 'Reaktion hinzufügen';

  @override
  String homeViewProfile(String username) {
    return 'Profil von $username ansehen';
  }

  @override
  String get homeMoveToVoiceChannel => 'In Sprachkanal verschieben…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Sprachkanal auswählen';

  @override
  String get homeNoOtherVoiceChannels => 'Keine anderen Sprachkanäle';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username ist jetzt in $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return '$username konnte nicht verschoben werden';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'Sie sind jetzt in $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return '$channel beitreten, um zu sprechen';
  }

  @override
  String get adminPanelTitle => 'Admin-Bereich';

  @override
  String get adminTabBackerCodes => 'Unterstützer-Codes';

  @override
  String get adminTabUsers => 'Benutzer';

  @override
  String get adminTabDmReports => 'DM-Meldungen';

  @override
  String get adminTabSpamFlags => 'Spam-Meldungen';

  @override
  String get adminTabWiki => 'Wiki';

  @override
  String get adminTabBoosts => 'Boosts';

  @override
  String get adminCreateBackerCodeTitle => 'Unterstützer-Code erstellen';

  @override
  String get adminCodeHint =>
      'Code (leer lassen, um automatisch zu generieren)';

  @override
  String get adminNoteHint => 'Notiz (z. B. \"Kickstarter Stufe 2\")';

  @override
  String get adminFlagsJsonHint =>
      'Flags als JSON, z. B. \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint =>
      'Maximale Nutzungen (leer lassen = unbegrenzt)';

  @override
  String get adminCodeCreatedTitle => 'Code erstellt';

  @override
  String get adminCodeLabel => 'Code:';

  @override
  String get adminCopyCodeTooltip => 'Code kopieren';

  @override
  String adminFlagsValue(String flags) {
    return 'Flags: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Unterstützer- und Prämiencodes';

  @override
  String get adminNewCodeButton => 'Neuer Code';

  @override
  String get adminNoCodesYet => 'Noch keine Codes';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses Nutzungen';
  }

  @override
  String get adminSearchUsersHint => 'Benutzer nach Benutzername suchen...';

  @override
  String get adminSearchUsersPrompt => 'Suchen Sie oben nach einem Benutzer';

  @override
  String get adminNoDmReports => 'Keine DM-Meldungen.';

  @override
  String get adminResolvedLabel => 'GELÖST';

  @override
  String get adminReasonOther => 'sonstiges';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Meldender: $reporterId\nAufgedeckter Absender: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Notiz: $note';
  }

  @override
  String get adminDismissButton => 'Verwerfen';

  @override
  String get adminMarkActionedButton => 'Als bearbeitet markieren';

  @override
  String get adminStatusActioned => 'Bearbeitet';

  @override
  String get adminStatusDismissed => 'Verworfen';

  @override
  String get adminNoSpamFlags => 'Keine Spam-Meldungen.';

  @override
  String get adminFlagMassDmSpam => 'Massen-DM-Spam';

  @override
  String get adminFlagRaidLockdown => 'Raid-Sperre';

  @override
  String get adminFlagBotBehavior => 'Bot-artiges Verhalten';

  @override
  String get adminFlagChannelFlooding => 'Kanal-Flooding';

  @override
  String get adminAutoEscalatedBadge => 'AUTOMATISCH ESKALIERT';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Konfidenz: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'Benutzer: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Server: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount von $totalJoiners Beigetretenen noch stummgeschaltet';
  }

  @override
  String get adminNoJoinersMuted =>
      'Derzeit keine Beigetretenen stummgeschaltet';

  @override
  String adminRestrictedUntil(String until) {
    return 'Derzeit eingeschränkt bis $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'Derzeit nicht eingeschränkt';

  @override
  String get adminDismissUndoButton => 'Verwerfen & Rückgängig machen';

  @override
  String get adminConfirmRestrictButton => 'Bestätigen & Einschränken';

  @override
  String get adminDeleteArticleTitle => 'Artikel löschen?';

  @override
  String adminDeleteArticleBody(String title) {
    return '„$title“ wird aus Visps Wissensdatenbank entfernt.';
  }

  @override
  String get adminNewArticleTitle => 'Neuer Artikel';

  @override
  String get adminEditArticleTitle => 'Artikel bearbeiten';

  @override
  String get adminArticleTitleHint => 'Titel';

  @override
  String get adminArticleContentHint => 'Artikelinhalt (Markdown)';

  @override
  String get adminWikiArticlesHeader => 'Wiki-Artikel';

  @override
  String get adminNoArticlesYet => 'Noch keine Artikel';

  @override
  String get adminEditArticleTooltip => 'Artikel bearbeiten';

  @override
  String get adminDeleteArticleTooltip => 'Artikel löschen';

  @override
  String get adminSearchServersHint => 'Server nach Namen suchen...';

  @override
  String get adminSearchServersPrompt => 'Suchen Sie oben nach einem Server';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'Boosts an $serverName vergeben';
  }

  @override
  String get adminNumBoostsHint => 'Anzahl der Boosts';

  @override
  String get adminGrantButton => 'Vergeben';

  @override
  String get adminPositiveNumberError =>
      'Geben Sie eine positive ganze Zahl ein.';

  @override
  String get adminGrantBoostsFailed => 'Boosts konnten nicht vergeben werden.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Boosts an $serverName vergeben -- jetzt Level $level ($activeCount aktiv).',
      one:
          '$count Boost an $serverName vergeben -- jetzt Level $level ($activeCount aktiv).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count Mitglieder';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Boosts vergeben';

  @override
  String get parentalDashboardTitle => 'Familie';

  @override
  String get parentalDashboardCreateChildTitle => 'Kinderkonto erstellen';

  @override
  String get parentalDashboardUsernameHint => 'Benutzername';

  @override
  String get parentalDashboardEmailHint => 'E-Mail';

  @override
  String get parentalDashboardPasswordHint => 'Passwort';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'Dadurch wird ein vollständig überwachtes Konto erstellt: gekennzeichnete Kanäle werden blockiert, und Sie können erlaubte Zeiten festlegen sowie die Freunde und Server des Kontos sehen (aber nicht mitlesen).';

  @override
  String get parentalDashboardValidationError =>
      'Benutzername, E-Mail und ein Passwort mit mindestens 8 Zeichen sind erforderlich.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'Kinderkonto konnte nicht erstellt werden -- Benutzername/E-Mail werden möglicherweise bereits verwendet.';

  @override
  String get parentalDashboardCreatingLabel => 'Wird erstellt...';

  @override
  String get parentalDashboardNoChildren => 'Noch keine verknüpften Konten.';

  @override
  String get parentalDashboardSupervisedLabel => 'Überwachtes Konto';

  @override
  String get parentalDashboardUnknownUser => 'Unbekannt';

  @override
  String get childDetailFallbackTitle => 'Kinderkonto';

  @override
  String get childDetailTabFriends => 'Freunde';

  @override
  String get childDetailTabServers => 'Server';

  @override
  String get childDetailTabSchedule => 'Zeitplan';

  @override
  String get childDetailTabOverride => 'Ausnahme';

  @override
  String get childDetailNoFriends => 'Keine Freunde.';

  @override
  String get childDetailUnknownUser => 'Unbekannt';

  @override
  String get childDetailRemoveFriendTooltip => 'Freund entfernen';

  @override
  String get childDetailNoServers => 'In keinem Server.';

  @override
  String childDetailMemberCount(int count) {
    return '$count Mitglieder';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Vom Server entfernen';

  @override
  String get childDetailRestrictAccessTitle =>
      'Zugriff auf festgelegte Zeiten beschränken';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Aus bedeutet uneingeschränkten Zugriff jederzeit';

  @override
  String get childDetailTimezoneLabel => 'Zeitzone';

  @override
  String get childDetailMonday => 'Montag';

  @override
  String get childDetailTuesday => 'Dienstag';

  @override
  String get childDetailWednesday => 'Mittwoch';

  @override
  String get childDetailThursday => 'Donnerstag';

  @override
  String get childDetailFriday => 'Freitag';

  @override
  String get childDetailSaturday => 'Samstag';

  @override
  String get childDetailSunday => 'Sonntag';

  @override
  String get childDetailNoAccessLabel => 'Kein Zugriff';

  @override
  String get childDetailToLabel => 'bis';

  @override
  String get childDetailSavingLabel => 'Wird gespeichert...';

  @override
  String get childDetailSaveScheduleButton => 'Zeitplan speichern';

  @override
  String get childDetailScheduleSaved => 'Zeitplan gespeichert.';

  @override
  String get childDetailOverrideExplanation =>
      'Gewährt vorübergehenden Zugriff außerhalb des normalen Zeitplans -- nützlich für eine einmalige Ausnahme, ohne den wöchentlichen Zeitplan zu ändern.';

  @override
  String get childDetailReasonHint => 'Grund (optional)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes Min.';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours Std.';
  }

  @override
  String get childDetailRevokeOverrideButton => 'Aktive Ausnahme widerrufen';

  @override
  String get childDetailAccessGranted => 'Vorübergehender Zugriff gewährt.';

  @override
  String get childDetailOverrideRevoked => 'Ausnahme widerrufen.';

  @override
  String get digitalGoodsTitle => 'Digitale Güter';

  @override
  String get digitalGoodsMyProductsTitle => 'Meine Produkte';

  @override
  String get digitalGoodsManageProductsTooltip =>
      'Produkte dieses Servers verwalten';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Zu Durchsuchen wechseln';

  @override
  String get digitalGoodsCreateProductTooltip => 'Produkt erstellen';

  @override
  String get digitalGoodsBrowseTab => 'Durchsuchen';

  @override
  String get digitalGoodsMyListingsTab => 'Meine Angebote';

  @override
  String get digitalGoodsMyPurchasesTab => 'Meine Käufe';

  @override
  String get digitalGoodsNoProductsYet => 'Noch keine Produkte';

  @override
  String get digitalGoodsNoProductsAvailable => 'Keine Produkte verfügbar';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Erstellen Sie Ihr erstes Produkt, um mit dem Verkauf zu beginnen';

  @override
  String get digitalGoodsCheckBackLater =>
      'Schauen Sie später wieder vorbei für digitale Güter';

  @override
  String get digitalGoodsCreateProductButton => 'Produkt erstellen';

  @override
  String get digitalGoodsLicenseKeyBadge => 'Lizenzschlüssel';

  @override
  String get digitalGoodsFileBadge => 'Datei';

  @override
  String get digitalGoodsAllServersBadge => 'Alle Server';

  @override
  String get digitalGoodsFreeForYou => 'Für Sie kostenlos';

  @override
  String get digitalGoodsFreeLabel => 'Kostenlos';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count verkauft';
  }

  @override
  String get digitalGoodsKeysButton => 'Schlüssel';

  @override
  String get digitalGoodsGetForFree => 'Kostenlos erhalten';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'Für $price kaufen';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'Noch keine Käufe';

  @override
  String get digitalGoodsUnknownProduct => 'Unbekanntes Produkt';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'Gekauft am $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Schlüssel kopieren';

  @override
  String get digitalGoodsLicenseKeyCopied => 'Lizenzschlüssel kopiert!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'Läuft ab am $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'Ihr Lizenzschlüssel';

  @override
  String get digitalGoodsCopyKeyButton => 'Schlüssel kopieren';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'Bezahlvorgang konnte nicht gestartet werden -- dieser Ersteller hat möglicherweise noch kein Stripe-Konto verbunden.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'Kauf abgeschlossen! Zu finden unter Meine Käufe.';

  @override
  String get digitalGoodsPurchasePending =>
      'Zahlung wird noch bearbeitet -- sie erscheint unter Meine Käufe, sobald sie abgeschlossen ist.';

  @override
  String get digitalGoodsCreateProductTitle => 'Produkt erstellen';

  @override
  String get digitalGoodsEditProductTitle => 'Produkt bearbeiten';

  @override
  String get digitalGoodsProductTitleHint => 'Produkttitel';

  @override
  String get digitalGoodsDescriptionHint => 'Beschreibung (optional)';

  @override
  String get digitalGoodsPriceHint =>
      'Preis in USD (leer lassen für kostenlos)';

  @override
  String get digitalGoodsProductTypeLabel => 'Produkttyp';

  @override
  String get digitalGoodsFileDownloadOption => 'Datei-Download';

  @override
  String get digitalGoodsLicenseKeyOption => 'Lizenzschlüssel';

  @override
  String get digitalGoodsAvailabilityLabel => 'Verfügbarkeit';

  @override
  String get digitalGoodsThisServerOnlyOption => 'Nur dieser Server';

  @override
  String get digitalGoodsAllKodaServersOption => 'Alle Koda-Server';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'Verwenden Sie nach dem Erstellen die Schaltfläche „Schlüssel“, um Ihre Lizenzschlüssel hochzuladen.';

  @override
  String get digitalGoodsProductFileLabel => 'Produktdatei';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName ($sizeMb MB)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Datei entfernen';

  @override
  String get digitalGoodsUploadingLabel => 'Wird hochgeladen...';

  @override
  String get digitalGoodsChooseFileButton => 'Datei auswählen';

  @override
  String get digitalGoodsReplaceFileButton => 'Datei ersetzen';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Wählen Sie vor dem Speichern eine Datei für dieses Produkt aus.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'Lizenzschlüssel hochladen';

  @override
  String get digitalGoodsPasteKeysHint =>
      'Fügen Sie einen Schlüssel pro Zeile ein:';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Schlüssel hochladen';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'Lizenzschlüssel hochgeladen!';

  @override
  String get serverSubscriptionManageTitle => 'Abonnements verwalten';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return '$serverName-Abonnements';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Stufe hinzufügen';

  @override
  String get serverSubscriptionNoTiersYet => 'Noch keine Abo-Stufen';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Erstellen Sie bis zu 3 Stufen für Ihre Community';

  @override
  String get serverSubscriptionCreateFirstTierButton => 'Erste Stufe erstellen';

  @override
  String get serverSubscriptionShowSubscriberCounts =>
      'Abonnentenzahl anzeigen';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/Monat';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktive Abonnenten',
      one: '$count aktiver Abonnent',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned =>
      'Rolle automatisch zugewiesen';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '$discount% Marktplatz-Rabatt';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'Dieser Server hat keine Abo-Stufen';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Aktiver Abonnent';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'Läuft ab am $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk => 'Exklusive Abonnentenrolle';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return '$discount% Rabatt auf Marktplatz-Käufe';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Nur für Abonnenten zugängliche Kanäle';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Derzeit abonniert';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'Für $price/Monat abonnieren';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Stufe erstellen';

  @override
  String get serverSubscriptionEditTierTitle => 'Stufe bearbeiten';

  @override
  String get serverSubscriptionTierNameHint =>
      'Stufenname (z. B. Fan, Unterstützer, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Beschreibung (optional)';

  @override
  String get serverSubscriptionPriceHint => 'Preis pro Monat (USD)';

  @override
  String get serverSubscriptionDiscountLabel => 'Marktplatz-Rabatt in %';

  @override
  String get serverSubscriptionPositionLabel => 'Position';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Stufe $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Vergibt beim Abonnieren eine Rolle — optional';

  @override
  String get serverSubscriptionRoleFallback => 'Rolle';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Wird einem Mitglied automatisch in dem Moment gegeben, in dem es abonniert, und entzogen, sobald das Abonnement abläuft.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Stufe erstellt -- verbinden Sie Stripe unter Marktplatz → Ersteller, bevor Mitglieder sie abonnieren können.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Stufe löschen';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return '„$tierName“ löschen? Bestehende Abonnenten behalten den Zugriff bis zum Ablauf.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return '$tierName abonnieren';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel =>
      'Monatliches Abonnement';

  @override
  String get serverSubscriptionServerBankEarnsLabel => 'Serverbank verdient';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points Pkt.';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Zahlung sicher über Stripe abgewickelt';

  @override
  String get serverSubscriptionSubscribeButton => 'Abonnieren';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'Bezahlvorgang konnte nicht gestartet werden -- der Inhaber dieses Servers hat möglicherweise noch kein Stripe-Konto verbunden.';

  @override
  String get serverSubscriptionSubscribed => 'Abonniert!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'Zahlung wird noch bearbeitet -- sie wird aktiviert, sobald sie abgeschlossen ist.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return '$username Trinkgeld geben';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Betrag auswählen';

  @override
  String get tipDialogMessageHint => 'Nachricht hinzufügen (optional)';

  @override
  String get tipDialogYouPayLabel => 'Sie zahlen';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username erhält';
  }

  @override
  String get tipDialogSendTipButton => 'Trinkgeld senden';

  @override
  String get tipDialogFailedToSendTip =>
      'Trinkgeld konnte nicht gesendet werden. Der Ersteller ist möglicherweise nicht mit Stripe verbunden.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'Bezahlvorgang konnte nicht gestartet werden. Versuchen Sie es gleich noch einmal.';

  @override
  String get tipDialogTipSent => 'Trinkgeld gesendet!';

  @override
  String get tipDialogTipPending =>
      'Zahlung wird noch bearbeitet -- sie wird abgeschlossen, sobald sie eingegangen ist.';

  @override
  String get tipDialogUnknownUser => 'Unbekannt';

  @override
  String get marketplaceTitle => 'Marktplatz';

  @override
  String get marketplaceCreatorPayoutsTitle => 'Auszahlungen an Ersteller';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Trinkgelder direkt über Stripe erhalten';

  @override
  String get marketplaceTabServerBank => 'Serverbank';

  @override
  String get marketplaceTabDigitalGoods => 'Digitale Güter';

  @override
  String get marketplaceTabMerch => 'Merch';

  @override
  String get marketplaceTabSubscription => 'Abonnement';

  @override
  String get marketplaceTabRevenue => 'Einnahmen';

  @override
  String get marketplaceSelectServerSubscription =>
      'Wählen Sie einen Server aus, um dessen Abonnement anzuzeigen';

  @override
  String get marketplaceSelectServerBank =>
      'Wählen Sie einen Server aus, um dessen Bank anzuzeigen';

  @override
  String get marketplaceSelectServerRevenue =>
      'Wählen Sie einen Server aus, um dessen Einnahmen anzuzeigen';

  @override
  String get marketplaceStripeAccountStatus => 'Stripe-Konto';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Einrichtung abgeschlossen';

  @override
  String get marketplaceAcceptingPaymentsStatus =>
      'Zahlungen werden akzeptiert';

  @override
  String get marketplaceConnectStripeButton => 'Stripe-Konto verbinden';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Stripe-Einrichtung abschließen';

  @override
  String get marketplaceRefreshStatusButton => 'Status aktualisieren';

  @override
  String get marketplaceReadyToReceiveTips =>
      'Sie sind bereit, Trinkgelder zu empfangen!';

  @override
  String get marketplaceHowItWorksTitle => 'So funktioniert es';

  @override
  String get marketplaceHowItWorksStep1 => 'Verbinden Sie Ihr Stripe-Konto';

  @override
  String get marketplaceHowItWorksStep2 =>
      'Schließen Sie die Identitätsprüfung ab';

  @override
  String get marketplaceHowItWorksStep3 =>
      'Erhalten Sie Trinkgelder direkt auf Ihr Bankkonto';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda berechnet eine Bearbeitungsgebühr von 5 %. Die Gebühr fließt als Punkte in die Bank Ihres Servers.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Nur der Serverinhaber oder jemand mit der Berechtigung „Marktplatz verwalten“ kann die Serverbank einsehen.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName geboostet!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit benutzerdefinierte Emoji-Plätze';
  }

  @override
  String get marketplaceServerFallback => 'Server';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance Pkt.';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount an Aktivität';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'Punkte werden aus der 5%igen Bearbeitungsgebühr auf Trinkgelder und Abonnements dieses Servers erzielt. Nutzen Sie Punkte, um Server-Upgrades freizuschalten.';

  @override
  String get marketplaceServerBoostsTitle => 'Server-Boosts';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Level $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktive Boosts',
      one: '$count aktiver Boost',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: 'Noch $more Boosts bis Level $level',
      one: 'Noch $more Boost bis Level $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' und schaltet einen benutzerdefinierten Server-Hintergrund frei';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' und schaltet einen benutzerdefinierten Server-Symbolrahmen frei';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sie haben $count Boost-Tokens verfügbar.',
      one: 'Sie haben $count Boost-Token verfügbar.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'Boost-Token stammen aus einem Pulse-Abonnement (1/Monat). Abonnieren Sie im Tab Abonnements, um eines zu erhalten.';

  @override
  String get marketplaceBoostingLabel => 'Wird geboostet...';

  @override
  String get marketplaceBoostThisServerButton => 'Diesen Server boosten';

  @override
  String get marketplaceComingSoonUpgradesTitle =>
      'Demnächst — Server-Upgrades';

  @override
  String get marketplaceSpendPointsList =>
      'Geben Sie Serverbank-Punkte aus für:\n• Benutzerdefinierte Server-Domain\n• Erhöhtes Mitgliederlimit\n• Priorisierter Support\n• Exklusives Server-Abzeichen';

  @override
  String get marketplaceSourceTip => 'Trinkgelder';

  @override
  String get marketplaceSourceSubscription => 'Koda-Abonnements';

  @override
  String get marketplaceSourceServerSubscription => 'Server-Abonnements';

  @override
  String get marketplaceSourceDigitalProduct => 'Digitale Güter';

  @override
  String get marketplaceSourceStageTicket => 'Bühnen-Tickets';

  @override
  String get marketplaceSourcePrintfulOrder => 'Merch-Bestellungen';

  @override
  String get marketplaceJustNow => 'gerade eben';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return 'vor $minutes Min.';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return 'vor $hours Std.';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return 'vor $days T.';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Nur Mitglieder, die den Marktplatz verwalten können, können die Einnahmen dieses Servers einsehen.';

  @override
  String get marketplaceBalanceLabel => 'Guthaben';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Insgesamt verdient';

  @override
  String get marketplaceLast30DaysTitle => 'Letzte 30 Tage';

  @override
  String get marketplaceRevenueBySourceTitle => 'Einnahmen nach Quelle';

  @override
  String get marketplaceNoRevenueYet => 'Noch keine Einnahmen.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Transaktionen',
      one: '$count Transaktion',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'Letzte Transaktionen';

  @override
  String get marketplaceNoTransactionsYet => 'Noch keine Transaktionen.';

  @override
  String get marketplaceNoActivityYet => 'Noch keine Aktivität';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Produkte von Printful synchronisiert',
      one: '$count Produkt von Printful synchronisiert',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Synchronisierung mit Printful fehlgeschlagen -- überprüfen Sie die Verbindung in den Merch-Einstellungen.';

  @override
  String get printfulMerchSelectServer =>
      'Wählen Sie einen Server aus, um dessen Merch anzuzeigen';

  @override
  String get printfulMerchManageCatalogTitle => 'Merch-Katalog verwalten';

  @override
  String get printfulMerchTitle => 'Merch';

  @override
  String get printfulMerchSyncingLabel => 'Wird synchronisiert...';

  @override
  String get printfulMerchSyncCatalogButton => 'Katalog synchronisieren';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'Zu Durchsuchen wechseln';

  @override
  String get printfulMerchManageTooltip => 'Merch dieses Servers verwalten';

  @override
  String get printfulMerchNothingSyncedYet => 'Noch nichts synchronisiert';

  @override
  String get printfulMerchNoMerchAvailable => 'Noch kein Merch verfügbar';

  @override
  String get printfulMerchSyncHint =>
      'Synchronisieren Sie Ihren Printful-Shop, um Ihren Produktkatalog zu importieren';

  @override
  String get printfulMerchCheckBackLater =>
      'Schauen Sie später wieder vorbei für Merch von diesem Server';

  @override
  String get printfulMerchOutOfStock => 'Nicht auf Lager';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ab $price • $count Optionen',
      one: 'Ab $price • $count Option',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'Anzeigen';

  @override
  String get printfulMerchCartTooltip => 'Warenkorb';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productName zum Warenkorb hinzugefügt';
  }

  @override
  String get printfulMerchQuantityLabel => 'Menge';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Menge verringern';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Menge erhöhen';

  @override
  String get printfulMerchAddToCartButton => 'In den Warenkorb';

  @override
  String get printfulMerchOptionLabel => 'Option';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Stil';

  @override
  String get printfulMerchSizeLabel => 'Größe';

  @override
  String get printfulMerchYourCartTitle => 'Ihr Warenkorb';

  @override
  String get printfulMerchCartEmpty => 'Ihr Warenkorb ist leer.';

  @override
  String get printfulMerchSubtotalLabel => 'Zwischensumme';

  @override
  String get printfulMerchCheckoutLabel => 'Zur Kasse';

  @override
  String get printfulMerchRemoveFromCartTooltip =>
      'Aus dem Warenkorb entfernen';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Geben Sie zuerst Ihre Versandadresse ein.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'Versandkosten für diese Adresse konnten nicht ermittelt werden.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'Bezahlvorgang konnte nicht gestartet werden. Versuchen Sie es gleich noch einmal.';

  @override
  String get printfulMerchOrderPlaced => 'Bestellung aufgegeben!';

  @override
  String get printfulMerchOrderPending =>
      'Zahlung wird noch bearbeitet -- die Bestellung wird aufgegeben, sobald sie abgeschlossen ist.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Versandgeschwindigkeit';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max Werktage';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => 'Versandkosten abrufen';

  @override
  String get printfulMerchPayButton => 'Bezahlen';

  @override
  String get kodaMarketplaceTitle => 'Koda Marketplace';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Abonnements';

  @override
  String get kodaMarketplaceTabBoosts => 'Boosts';

  @override
  String get kodaMarketplaceTabDiscover => 'Entdecken';

  @override
  String get kodaMarketplaceTierFreeName => 'Kostenlos';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'Läuft ab am $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks =>
      'Upgraden für exklusive Vorteile';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Boost-Tokens verfügbar',
      one: '$count Boost-Token verfügbar',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Verschenken Sie ein Token an jeden Server, in dem Sie Mitglied sind, über dessen Serverbank-Tab';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame =>
      'Benutzerdefinierter Avatar-Rahmen';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Spark-Abzeichen im Profil';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Erhöhtes Datei-Upload-Limit (50 MB)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality =>
      'Priorisierte Sprachqualität';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'Alles aus Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame =>
      'Animierter Avatar-Rahmen';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Pulse-Abzeichen im Profil';

  @override
  String get kodaMarketplacePulsePerkFileLimit => '100-MB-Datei-Upload-Limit';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      '1 Server-Boost-Token pro Monat';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/Monat';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Aktueller Plan';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return '$name holen';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return '$name verschenken';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return '$tier verschenken';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return '$tier abonnieren';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel =>
      'Benutzername des Beschenkten:';

  @override
  String get kodaMarketplaceUsernameHint => 'Benutzername';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Abonnement';

  @override
  String get kodaMarketplaceTotalLabel => 'Gesamt';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Zahlung sicher über Stripe abgewickelt';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'Weiter zur Zahlung';

  @override
  String get kodaMarketplaceUserNotFound => 'Benutzer nicht gefunden';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'Bezahlvorgang konnte nicht gestartet werden. Versuchen Sie es gleich noch einmal.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'Abonnement aktiv!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'Zahlung wird noch bearbeitet -- sie wird aktiviert, sobald sie abgeschlossen ist.';

  @override
  String get kodaMarketplaceBoostPurchased => 'Boost gekauft!';

  @override
  String get kodaMarketplaceBoostPending =>
      'Zahlung wird noch bearbeitet -- er wird bereitstehen, sobald sie abgeschlossen ist.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count verfügbar';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Boost kaufen';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'Ein einmaliger Kauf -- Pulse-Abonnenten erhalten außerdem bei jeder Verlängerung ein kostenloses Token, was bei regelmäßigem Boosten weiterhin die bessere Wahl bleibt.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Boost kaufen -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Noch keine Server haben sich für den Koda Marketplace entschieden. Serverinhaber können dies in den Anpassen-Einstellungen ihres Servers aktivieren.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader =>
      'DIESE WOCHE HERVORGEHOBEN';

  @override
  String get kodaMarketplaceAllListedServersHeader => 'ALLE GELISTETEN SERVER';

  @override
  String get kodaMarketplaceServerFallback => 'Server';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Mitglieder',
      one: '$count Mitglied',
    );
    return '$_temp0';
  }

  @override
  String get calendarFallbackTitle => 'Kalender';

  @override
  String get calendarAskVispTooltip => 'Visp fragen';

  @override
  String get calendarCreateEventTooltip => 'Ereignis erstellen';

  @override
  String get calendarPreviousMonthTooltip => 'Vorheriger Monat';

  @override
  String get calendarNextMonthTooltip => 'Nächster Monat';

  @override
  String get calendarTodayButton => 'Heute';

  @override
  String get calendarWeekdaySun => 'So';

  @override
  String get calendarWeekdayMon => 'Mo';

  @override
  String get calendarWeekdayTue => 'Di';

  @override
  String get calendarWeekdayWed => 'Mi';

  @override
  String get calendarWeekdayThu => 'Do';

  @override
  String get calendarWeekdayFri => 'Fr';

  @override
  String get calendarWeekdaySat => 'Sa';

  @override
  String get calendarTodaySuffix => ', heute';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count Ereignisse',
      one: ', $count Ereignis',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'Wählen Sie einen Tag aus';

  @override
  String get calendarNoEvents => 'Keine Ereignisse';

  @override
  String get calendarSubscribeTooltip => 'Abonnieren';

  @override
  String get calendarUnsubscribeTooltip => 'Abo beenden';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'Wiederholt sich $recurrence';
  }

  @override
  String get calendarTicketOwned => 'Ticket vorhanden';

  @override
  String calendarTicketPrice(String price) {
    return 'Ticket $price';
  }

  @override
  String get calendarDeleteEventTitle => 'Ereignis löschen';

  @override
  String calendarDeleteEventConfirm(String title) {
    return '„$title“ löschen? Dies kann nicht rückgängig gemacht werden.';
  }

  @override
  String get calendarEditEventTitle => 'Ereignis bearbeiten';

  @override
  String get calendarCreateEventTitle => 'Ereignis erstellen';

  @override
  String get calendarEventTitleHint => 'Ereignistitel';

  @override
  String get calendarDescriptionHint => 'Beschreibung (optional)';

  @override
  String get calendarLocationHint => 'Ort (optional)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Beginn ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Startdatum und -uhrzeit, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'Ende — optional ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'Enddatum und -uhrzeit, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'nicht festgelegt';

  @override
  String get calendarTapToSetEndTime => 'Tippen, um die Endzeit festzulegen';

  @override
  String get calendarRecurrenceLabel => 'Wiederholung';

  @override
  String get calendarRecurrenceNone => 'Wiederholt sich nicht';

  @override
  String get calendarRecurrenceDaily => 'Täglich';

  @override
  String get calendarRecurrenceWeekly => 'Wöchentlich';

  @override
  String get calendarRecurrenceMonthly => 'Monatlich';

  @override
  String get calendarColorLabel => 'Farbe';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Farbe $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Ticketpreis — optional';

  @override
  String get calendarLinkStageChannelLabel =>
      'Mit Bühnenkanal verknüpfen — optional';

  @override
  String get calendarStageChannelFallback => 'Bühne';

  @override
  String get discordImportFetchError =>
      'Vorlage konnte nicht abgerufen werden.';

  @override
  String get discordImportApplyError =>
      'Vorlage konnte nicht angewendet werden. Bitte versuchen Sie es erneut.';

  @override
  String get discordImportTitle => 'Discord-Vorlage importieren';

  @override
  String get discordImportDescription =>
      'Fügen Sie einen discord.new-Link oder Vorlagencode ein, um Rollen, Kategorien und Kanäle in diesen Server zu importieren.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 oder Vorlagencode';

  @override
  String get discordImportPreviewButton => 'Vorschau';

  @override
  String get discordImportTemplateFallback => 'Vorlage';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Rollen',
      one: '$count Rolle',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kategorien',
      one: '$count Kategorie',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kanäle',
      one: '$count Kanal',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel =>
      'VORHANDENE STRUKTUR ERSETZEN';

  @override
  String get discordImportReplaceWarning =>
      'Alle vorhandenen Kanäle, Kategorien und Rollen werden dauerhaft gelöscht.';

  @override
  String get discordImportAddDescription =>
      'Die Vorlage wird zu Ihrer bestehenden Serverstruktur hinzugefügt.';

  @override
  String get discordImportReplaceConfirmTitle => 'Serverstruktur ersetzen?';

  @override
  String get discordImportReplaceConfirmBody =>
      'Dadurch werden vor dem Import ALLE vorhandenen Kanäle, Kategorien und Rollen dauerhaft gelöscht. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get discordImportYesReplace => 'Ja, ersetzen';

  @override
  String get discordImportReplaceAndImportButton =>
      'Ersetzen & Vorlage importieren';

  @override
  String get discordImportAddToServerButton => 'Vorlage zum Server hinzufügen';

  @override
  String get thresholdModConfigureTitle =>
      'Schwellenwert-Moderation konfigurieren';

  @override
  String get thresholdModConfigureExplanation =>
      'Wählen Sie vertrauenswürdige Moderatoren und wie viele von ihnen zustimmen müssen, bevor einer von ihnen eine Epoche des Verlaufs eines Kanals entschlüsseln kann. Nicht einmal Sie erhalten einen einseitigen Schlüssel -- Sie sind nur ausgenommen, wenn Sie ebenfalls auf dieser Liste stehen.';

  @override
  String get thresholdModThresholdLabel => 'Schwellenwert:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Schwellenwert verringern';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Schwellenwert erhöhen';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'von $count Moderatoren',
      one: 'von $count Moderator',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle =>
      'Schwellenwert-Entschlüsselung anfragen';

  @override
  String get thresholdModChannelLabel => 'Kanal';

  @override
  String get thresholdModReasonHint =>
      'Grund -- wird jedem benannten Moderator angezeigt';

  @override
  String get thresholdModRequestButton => 'Anfragen';

  @override
  String get thresholdModShareRelayed =>
      'Anteil an den Anfragenden weitergeleitet.';

  @override
  String get thresholdModNotEnoughShares =>
      'Noch nicht genug Anteile weitergeleitet -- versuchen Sie es erneut, sobald weitere Moderatoren ihre weitergeleitet haben.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Nachrichten',
      one: '$count Nachricht',
    );
    return 'Epoche $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'Keine entschlüsselbaren Nachrichten in dieser Epoche.';

  @override
  String get thresholdModExplanation =>
      'Echte Entschlüsselung des Verlaufs eines Kanals, abhängig von der aktiven Zustimmung mehrerer benannter Moderatoren -- niemals nur eine Person allein, nicht einmal der Serverinhaber. Schaltet immer nur eine ganze Epoche frei (alles, was seit der letzten Änderung der Mitgliedschaft gesendet wurde), niemals eine einzelne Nachricht.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Aktiviert -- $count Moderatoren, Schwellenwert $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'Nicht konfiguriert';

  @override
  String get thresholdModReconfigureButton => 'Neu konfigurieren';

  @override
  String get thresholdModEnableButton => 'Aktivieren';

  @override
  String get thresholdModNotEnabledForServer =>
      'Die Schwellenwert-Moderation ist für diesen Server nicht aktiviert.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Für diesen Server aktiviert. Sie sind keiner der benannten Moderatoren.';

  @override
  String get thresholdModRequestsLabel => 'Anfragen';

  @override
  String get thresholdModRequestDecryptButton => 'Entschlüsselung anfragen';

  @override
  String get thresholdModNoActiveRequests => 'Keine aktiven Anfragen.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- Epoche $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'ausstehend';

  @override
  String get thresholdModStatusApproved => 'genehmigt';

  @override
  String get thresholdModApproveButton => 'Genehmigen';

  @override
  String get thresholdModRelayShareButton => 'Meinen Anteil weiterleiten';

  @override
  String get thresholdModTryReconstructButton => 'Rekonstruktion versuchen';

  @override
  String get roleSelectNoRolesAvailable =>
      'Keine selbst zuweisbaren Rollen verfügbar.';

  @override
  String get roleSelectInstructions =>
      'Wählen Sie die gewünschten Rollen aus. Tippen Sie auf eine Rolle, um sie hinzuzufügen oder zu entfernen.';

  @override
  String get rulesScreenAcceptError =>
      'Regeln konnten nicht akzeptiert werden. Versuchen Sie es erneut.';

  @override
  String get rulesScreenSubtitle => 'Serverregeln';

  @override
  String get rulesScreenScrollToRead =>
      'Scrollen Sie nach unten, um alle Regeln zu lesen';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'Mit Klick auf Akzeptieren erklären Sie sich bereit, diese Regeln zu befolgen.\nVerstöße können zum Ausschluss vom Server führen.';

  @override
  String get rulesScreenAcceptButton => 'Ich akzeptiere die Regeln';

  @override
  String get rulesScreenReadAllToContinue =>
      'Lesen Sie alle Regeln, um fortzufahren';

  @override
  String get galleryNewPostTitle => 'Neuer Beitrag';

  @override
  String get galleryChooseFileButton => 'Datei auswählen';

  @override
  String get galleryOrDivider => 'oder';

  @override
  String get galleryPasteUrlHint => 'Bild-/Video-URL einfügen';

  @override
  String get galleryTypeLabel => 'Typ';

  @override
  String get galleryImageOption => 'Bild';

  @override
  String get galleryVideoOption => 'Video';

  @override
  String get galleryCaptionHint => 'Beschriftung (optional)';

  @override
  String get galleryPostButton => 'Posten';

  @override
  String get galleryNewCollectionTitle => 'Neue Sammlung';

  @override
  String get galleryCollectionNameHint => 'Name der Sammlung';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return '„$collectionName“ löschen? Beiträge darin werden dann nicht mehr zugeordnet.';
  }

  @override
  String get galleryFeedTab => 'Feed';

  @override
  String get galleryCollectionsTab => 'Sammlungen';

  @override
  String get galleryNoPostsYet => 'Noch keine Beiträge';

  @override
  String get galleryNoCollectionsYet => 'Noch keine Sammlungen';

  @override
  String get gallerySelectACollection => 'Wählen Sie eine Sammlung aus';

  @override
  String get galleryNoPostsInCollection => 'Keine Beiträge in dieser Sammlung';

  @override
  String get galleryAddPostButton => 'Beitrag hinzufügen';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Bildschirmfreigabe fehlgeschlagen: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return 'Lautstärke von $username';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'Wirkt sich nur auf das aus, was Sie hören -- dieses Gerät, dieser Anruf.';

  @override
  String get voiceScreenResetVolumeButton => 'Zurücksetzen';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'Verbindung fehlgeschlagen: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Ihr Bildschirm, zum Vollbild antippen';

  @override
  String get voiceScreenYourScreenLabel => 'Ihr Bildschirm';

  @override
  String get voiceScreenTapToClose => 'Zum Schließen antippen';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (Sie)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', spricht';

  @override
  String get voiceScreenCameraOnSuffix => ', Kamera an';

  @override
  String get voiceScreenActivateToPopOut => ', aktivieren zum Loslösen';

  @override
  String get voiceScreenShowVarmTooltip => 'VARM anzeigen';

  @override
  String get voiceScreenHideVarmTooltip => 'VARM ausblenden';

  @override
  String get voiceScreenShowChatTooltip => 'Chat anzeigen';

  @override
  String get voiceScreenHideChatTooltip => 'Chat ausblenden';

  @override
  String get voiceScreenStartCameraTooltip => 'Kamera starten';

  @override
  String get voiceScreenStopCameraTooltip => 'Kamera stoppen';

  @override
  String get voiceScreenShareScreenTooltip => 'Bildschirm freigeben';

  @override
  String get voiceScreenStopSharingTooltip => 'Freigabe beenden';

  @override
  String get voiceScreenPopOutTooltip =>
      'Sprachanruf in separates Fenster lösen';

  @override
  String get voiceScreenCouldNotPopOut =>
      'Sprachanruf konnte nicht losgelöst werden.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Sprachkanal verlassen';

  @override
  String get voiceScreenPinTooltip => 'Anheften (geöffnet halten)';

  @override
  String get voiceScreenUnpinTooltip => 'Loslösen';

  @override
  String get voiceScreenSizeSmall => 'Klein (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Mittel (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Groß (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, $count verbunden';
  }

  @override
  String get voiceBarSpeakingSuffix => ', Sie sprechen';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count verbunden · zum Erweitern antippen';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Kamera starten';

  @override
  String get voiceBarStopCameraTooltip => 'Kamera stoppen';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Sprachkanal verlassen';

  @override
  String get popOutVideoFallbackTitle => 'Sprache';

  @override
  String get popOutVideoMissingTokenError => 'Token oder URL fehlt';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Verbindung nach 15 Sekunden zeitüberschritten';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Fehler: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'Keine Teilnehmer';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Bühne';

  @override
  String get stageCouldNotJoin => 'Der Bühne konnte nicht beigetreten werden.';

  @override
  String get stageThisStageFallback => 'Diese Bühne';

  @override
  String get stageRequiresTicketToJoin => 'erfordert ein Ticket zum Beitritt';

  @override
  String get stagePleaseWaitLabel => 'Bitte warten...';

  @override
  String get stageGetFreeTicketButton => 'Kostenloses Ticket holen';

  @override
  String stageBuyTicketButton(String price) {
    return 'Ticket kaufen -- $price';
  }

  @override
  String get stageNotNowButton => 'Nicht jetzt';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'Ticketkauf konnte nicht gestartet werden.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'Zahlung wird noch bearbeitet -- versuchen Sie es erneut, sobald sie bestätigt ist.';

  @override
  String get stageSpeakerBadge => 'Sprecher';

  @override
  String get stageListenerBadge => 'Zuhörer';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'Beitritt nicht möglich: $error';
  }

  @override
  String get stageSpeakersHeader => 'SPRECHER';

  @override
  String get stageRaisedHandsHeader => 'WORTMELDUNGEN';

  @override
  String get stageAllowButton => 'Erlauben';

  @override
  String get stageIgnoreButton => 'Ignorieren';

  @override
  String get stageListenersHeader => 'ZUHÖRER';

  @override
  String get stageRaiseHandTooltip => 'Hand heben';

  @override
  String get stageLowerHandTooltip => 'Hand senken';

  @override
  String get stageLeaveStageTooltip => 'Bühne verlassen';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (Sie)';
  }

  @override
  String get stageMoveToListenersButton => 'Zu Zuhörern verschieben';

  @override
  String get stageYouFallbackName => 'Sie';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'Avatar von $username';
  }

  @override
  String get channelEditDialogNewTitle => 'Neuer Kanal';

  @override
  String get channelEditDialogEditTitle => 'Kanal bearbeiten';

  @override
  String get channelEditDialogNameHint => 'Kanalname';

  @override
  String get channelEditDialogTypeLabel => 'Typ';

  @override
  String get channelEditDialogTypeText => 'Text';

  @override
  String get channelEditDialogTypeVoice => 'Sprache';

  @override
  String get channelEditDialogTypeGallery => 'Galerie';

  @override
  String get channelEditDialogTypeStage => 'Bühne';

  @override
  String get channelEditDialogTypeRules => 'Regeln';

  @override
  String get channelEditDialogTypeRoleSelection => 'Rollenauswahl';

  @override
  String get channelEditDialogTypeCalendar => 'Kalender';

  @override
  String get channelEditDialogAnnouncementTitle => 'Ankündigungskanal';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Nur Mitglieder, die Nachrichten verwalten können, dürfen posten';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Hier Livestream- und Upload-Ankündigungen posten';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'Postet automatisch, wenn ein Mitglied mit der Berechtigung „Bei Livestream ankündigen“ auf Twitch live geht oder ein neues YouTube-Video hochlädt';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Diese Rollen bei Veröffentlichung benachrichtigen (optional)';

  @override
  String get channelEditDialogCategoryLabel => 'Kategorie';

  @override
  String get channelEditDialogNoCategory => 'Keine Kategorie';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Rollenzugriff (für alle leer lassen)';

  @override
  String get channelEditDialogContentLabelsLabel => 'Inhaltskennzeichnungen';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Markiert diesen Kanal für die Inhaltsfilter der Mitglieder; für überwachte Konten strikt gesperrt';

  @override
  String get categoryEditDialogNewTitle => 'Neue Kategorie';

  @override
  String get categoryEditDialogEditTitle => 'Kategorie bearbeiten';

  @override
  String get categoryEditDialogNameHint => 'Kategoriename';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Rollenzugriff (für alle leer lassen)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Mitglieder — $count online';
  }

  @override
  String get memberPanelRefreshTooltip => 'Mitgliederliste aktualisieren';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Mitglieder',
      one: '$count Mitglied',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Offline';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', Stufe $tier';
  }

  @override
  String get memberPanelUnknownUser => 'Unbekannt';

  @override
  String get memberPanelModerationActionsTooltip => 'Moderationsaktionen';

  @override
  String get reportDialogReasonSpam => 'Spam';

  @override
  String get reportDialogReasonHarassment => 'Belästigung oder Missbrauch';

  @override
  String get reportDialogReasonIllegal => 'Illegale Inhalte';

  @override
  String get reportDialogReasonOther => 'Sonstiges';

  @override
  String get reportDialogReasonLabel => 'Grund';

  @override
  String get reportDialogNoteHint =>
      'Sollten Moderatoren noch etwas anderes wissen? (optional)';

  @override
  String get reportDialogDisclosureNote =>
      'Der Ihnen angezeigte Nachrichteninhalt und der Absender werden mit den Moderatoren dieses Servers geteilt.';

  @override
  String get reportDialogSubmitButton => 'Meldung absenden';

  @override
  String get reportDialogSubmitError => 'Meldung konnte nicht gesendet werden.';

  @override
  String get notificationBellTitle => 'Benachrichtigungen';

  @override
  String get notificationBellMarkAllRead => 'Alle als gelesen markieren';

  @override
  String get notificationBellEmptyState => 'Noch keine Benachrichtigungen';

  @override
  String get notificationBellUnreadLabel => 'Ungelesen';

  @override
  String get invitePreviewTitle => 'Servereinladung';

  @override
  String get invitePreviewInvalidOrExpired =>
      'Ungültige oder abgelaufene Einladung.';

  @override
  String get invitePreviewCouldNotJoin =>
      'Server konnte nicht beigetreten werden.';

  @override
  String get invitePreviewUnknownServer => 'Unbekannter Server';

  @override
  String get shippingAddressFullNameHint => 'Vollständiger Name';

  @override
  String get shippingAddressLine1Hint => 'Adresszeile 1';

  @override
  String get shippingAddressLine2Hint => 'Adresszeile 2 (optional)';

  @override
  String get shippingAddressCityHint => 'Stadt';

  @override
  String get shippingAddressStateHint => 'Bundesland';

  @override
  String get shippingAddressZipHint => 'PLZ';

  @override
  String get shippingAddressCountryCodeHint => 'Ländercode (z. B. DE)';

  @override
  String get shippingAddressPhoneHint => 'Telefon (optional)';

  @override
  String get shippingAddressPrivacyNote =>
      'Wird nur für den Versand dieser Bestellung verwendet -- Details zum Umgang danach finden Sie in Printfuls eigener Datenschutzerklärung.';

  @override
  String get updateNudgeAvailableTitle => 'Update verfügbar';

  @override
  String get updateNudgeRequiredTitle => 'Update erforderlich';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $version ist verfügbar -- Sie verwenden eine ältere Version.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'Diese Version wird nicht mehr unterstützt. Aktualisieren Sie auf Koda $version, um Koda weiter zu nutzen.';
  }

  @override
  String get updateNudgeLaterButton => 'Später';

  @override
  String get tierBadgeSparkSubscriber => 'Spark-Abonnent';

  @override
  String get tierBadgePulseSubscriber => 'Pulse-Abonnent';

  @override
  String get vispAvatarInDevelopment => 'IN ENTWICKLUNG';

  @override
  String get vispBoostAdvisorCouldNotAnswer =>
      'Visp konnte keine Antwort zusammenstellen.';

  @override
  String get vispBoostAdvisorTitle => 'Visp fragen: Boost-ROI-Berater';

  @override
  String get vispBoostAdvisorFollowUpHint => 'Eine Nachfrage stellen...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Senden';

  @override
  String get vispBoostAdvisorBasedOn => 'Basierend auf:';

  @override
  String get vispEventDialogCouldNotGenerate =>
      'Visp konnte kein Ereignis generieren.';

  @override
  String get vispEventDialogCouldNotCreate =>
      'Dieses Ereignis konnte nicht erstellt werden.';

  @override
  String get vispEventDialogRecurrenceNone => 'Einmalig';

  @override
  String get vispEventDialogRecurrenceDaily => 'Wiederholt sich täglich';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Wiederholt sich wöchentlich';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Wiederholt sich monatlich';

  @override
  String get vispEventDialogTitle => 'Visp bitten, ein Ereignis zu erstellen';

  @override
  String get vispEventDialogDescription =>
      'Beschreiben Sie das Ereignis -- Visp schlägt einen Titel, Datum/Uhrzeit und weitere Details vor.';

  @override
  String get vispEventDialogPromptHint =>
      'z. B. „Wöchentliche D&D-Runde jeden Freitag um 19 Uhr für etwa 3 Stunden“';

  @override
  String get vispEventDialogPrivacyNote =>
      'Ihre Beschreibung wird an Visp gesendet (ein selbst gehosteter Assistent -- nichts verlässt Kodas Server), um diesen Plan zu erstellen.';

  @override
  String get vispEventDialogStartOver => 'Neu beginnen';

  @override
  String get vispEventDialogCreateEvent => 'Ereignis erstellen';

  @override
  String get vispEventDialogThinking => 'Denkt nach...';

  @override
  String get vispEventDialogGeneratePlan => 'Plan generieren';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'Datum konnte nicht erkannt werden -- versuchen Sie eine andere Formulierung';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Endet $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price pro Ticket';
  }

  @override
  String get vispEventDialogBasedOn => 'Basierend auf:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Frage $questionNumber von $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'Oder eigene Antwort eingeben...';

  @override
  String get vispQuestionStepSendTooltip => 'Senden';

  @override
  String get vispQuestionStepSkip => 'Überspringen und jetzt generieren';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp konnte keinen Plan generieren.';

  @override
  String get vispSetupDialogCouldNotApplyPlan =>
      'Dieser Plan konnte nicht angewendet werden.';

  @override
  String get vispSetupDialogTitleNew => 'Beschreiben Sie Visp Ihren Server';

  @override
  String get vispSetupDialogTitleExisting =>
      'Visp bitten, zu diesem Server hinzuzufügen';

  @override
  String get vispSetupDialogDescriptionNew =>
      'Beschreiben Sie den gewünschten Server -- Visp schlägt einen Namen sowie eine Reihe von Rollen, Kategorien und Kanälen vor.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Beschreiben Sie, was Sie hinzufügen möchten -- Visp schlägt Rollen, Kategorien und Kanäle zum Erstellen vor.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'z. B. „Ein gemütlicher Server für meine D&D-Gruppe mit Sprachkanälen für zwei Tische“';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'z. B. „Füge noch ein paar Kanäle für unsere Raid-Teams hinzu“';

  @override
  String get vispSetupDialogPrivacyNote =>
      'Ihre Beschreibung wird an Visp gesendet (ein selbst gehosteter Assistent -- nichts verlässt Kodas Server), um diesen Plan zu erstellen.';

  @override
  String get vispSetupDialogStartOver => 'Neu beginnen';

  @override
  String get vispSetupDialogCreateServer => 'Server erstellen';

  @override
  String get vispSetupDialogAddToServer => 'Zum Server hinzufügen';

  @override
  String get vispSetupDialogThinking => 'Denkt nach...';

  @override
  String get vispSetupDialogGeneratePlan => 'Plan generieren';

  @override
  String get vispSetupDialogNewServerLabel => 'Neuer Server';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Rollen',
      one: '$count Rolle',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kategorien',
      one: '$count Kategorie',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kanäle',
      one: '$count Kanal',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'Basierend auf:';

  @override
  String get childLockoutTitle => 'Dies liegt außerhalb Ihrer erlaubten Zeiten';

  @override
  String get childLockoutBody =>
      'Ein Elternteil oder Erziehungsberechtigter hat Zeiten festgelegt, zu denen dieses Konto Koda nutzen darf. Bitten Sie um mehr Zeit oder schauen Sie im nächsten erlaubten Zeitfenster wieder vorbei.';

  @override
  String get childLockoutLogOutButton => 'Abmelden';

  @override
  String get forcePasswordChangeError =>
      'Passwort konnte nicht aktualisiert werden. Versuchen Sie es erneut.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Willkommen, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Ihr Konto erfordert ein neues Passwort, bevor Sie fortfahren können.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'Neues Passwort';

  @override
  String get forcePasswordChangeConfirmPasswordHint =>
      'Neues Passwort bestätigen';

  @override
  String get forcePasswordChangeReqLength => 'Mindestens 12 Zeichen';

  @override
  String get forcePasswordChangeReqUpper => 'Ein Großbuchstabe';

  @override
  String get forcePasswordChangeReqLower => 'Ein Kleinbuchstabe';

  @override
  String get forcePasswordChangeReqDigit => 'Eine Ziffer';

  @override
  String get forcePasswordChangeReqMatch => 'Passwörter stimmen überein';

  @override
  String get forcePasswordChangeSubmitButton => 'Neues Passwort festlegen';

  @override
  String get forgotPasswordEnterEmailError =>
      'Geben Sie Ihre E-Mail-Adresse ein.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'Falls dieses Konto existiert, wurde ein Rücksetzcode gesendet.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Geben Sie den Code und ein Passwort mit mindestens 8 Zeichen ein.';

  @override
  String get forgotPasswordInvalidCode => 'Ungültiger oder abgelaufener Code.';

  @override
  String get forgotPasswordTitle => 'Passwort zurücksetzen';

  @override
  String get forgotPasswordEmailHint => 'E-Mail-Adresse';

  @override
  String get forgotPasswordSendCodeButton => 'Rücksetzcode senden';

  @override
  String get forgotPasswordCodeHint => '6-stelliger Code';

  @override
  String get forgotPasswordNewPasswordHint => 'Neues Passwort';

  @override
  String get forgotPasswordSetNewPasswordButton => 'Neues Passwort festlegen';

  @override
  String get verifyEmailEnterCodeError =>
      'Geben Sie den 6-stelligen Code aus Ihrer E-Mail ein.';

  @override
  String get verifyEmailInvalidCode => 'Ungültiger oder abgelaufener Code.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'Ein neuer Code wurde an $email gesendet.';
  }

  @override
  String get verifyEmailResendFailed =>
      'Konnte gerade nicht erneut gesendet werden.';

  @override
  String get verifyEmailTitle => 'Überprüfen Sie Ihre E-Mail';

  @override
  String verifyEmailSentCode(String email) {
    return 'Wir haben einen 6-stelligen Code an $email gesendet';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'E-Mail bestätigen';

  @override
  String get verifyEmailResendButton => 'Code erneut senden';

  @override
  String get safetyNumberKeysNotSetUp =>
      'Ihre eigenen Schlüssel wurden noch nicht eingerichtet.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName hat noch kein Schlüsselbündel.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'Sicherheitsnummer konnte nicht berechnet werden: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName hat dieses Gerät nicht mehr.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'Sicherheitsnummer mit $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Vergleichen Sie diese Nummer mit $peerName über einen anderen Kanal -- persönlich, per Telefon, überall außer in diesem Chat. Stimmt sie auf beiden Seiten überein, sprechen Sie tatsächlich mit der Person, die Sie erwarten.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName hat $count Geräte, jedes mit einer eigenen Sicherheitsnummer -- die Prüfung eines Geräts deckt die anderen nicht ab.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Gerät $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Als verifiziert markieren';

  @override
  String get contentFiltersDescription =>
      'Server können Kanäle mit Inhaltskennzeichnungen versehen. Wählen Sie, wie sich gekennzeichnete Kanäle verhalten sollen -- dies ist Ihre eigene Einstellung und wirkt sich nie darauf aus, was andere sehen.';

  @override
  String get contentFiltersLabelAdult => 'Inhalte für Erwachsene';

  @override
  String get contentFiltersLabelSuggestive => 'Anzüglich';

  @override
  String get contentFiltersLabelGraphic => 'Grafische Medien';

  @override
  String get contentFiltersLabelNudity => 'Nicht-sexuelle Nacktheit';

  @override
  String get contentFiltersDescAdult => 'Sexuell eindeutige Inhalte';

  @override
  String get contentFiltersDescSuggestive =>
      'Sexuell anzügliche, aber nicht eindeutige Inhalte';

  @override
  String get contentFiltersDescGraphic => 'Gewalt oder Blutdarstellungen';

  @override
  String get contentFiltersDescNudity => 'Nacktheit in nicht-sexuellem Kontext';

  @override
  String get contentFiltersHide => 'Ausblenden';

  @override
  String get contentFiltersWarn => 'Warnen';

  @override
  String get contentFiltersShow => 'Anzeigen';

  @override
  String get deviceTestCouldNotGetToken =>
      'Testtoken konnte nicht abgerufen werden.';

  @override
  String get deviceTestLabelTest => 'Testen';

  @override
  String get deviceTestLabelRecording => 'Aufnahme läuft...';

  @override
  String get deviceTestLabelPlayingBack => 'Wiedergabe läuft...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'Kamera konnte nicht gestartet werden: $error';
  }

  @override
  String get deviceTestTitle => 'Geräte testen';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'Verbindung fehlgeschlagen: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Mikrofon';

  @override
  String get deviceTestHearYourselfLabel => 'Sich selbst hören (verzögert)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Lautsprecher / Ausgabe';

  @override
  String get deviceTestCameraLabel => 'Kamera';

  @override
  String get deviceTestSystemDefault => 'Systemstandard';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Sprechen Sie, dann hören Sie einen $seconds-Sekunden-Clip zur Wiedergabe';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '${seconds}s';
  }

  @override
  String get deviceTestCameraPreviewOff => 'Kameravorschau aus';

  @override
  String get deviceTestStopCameraButton => 'Kameratest beenden';

  @override
  String get deviceTestTestCameraButton => 'Kamera testen';

  @override
  String get deviceTestInputLevelLabel => 'Eingangspegel';

  @override
  String get devicesScreenRemoveConfirmTitle => 'Dieses Gerät entfernen?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'Es muss sich erneut anmelden, und Nachrichten, die während der Entfernung gesendet wurden, erreichen es danach nicht mehr -- Double-Ratchet-Sitzungen füllen Lücken nicht rückwirkend auf.';

  @override
  String get devicesScreenRemoveFailed =>
      'Dieses Gerät konnte nicht entfernt werden.';

  @override
  String get devicesScreenNeverActive => 'Nie aktiv';

  @override
  String devicesScreenActiveDate(String date) {
    return 'Aktiv $date';
  }

  @override
  String get devicesScreenDescription =>
      'Jedes Gerät, mit dem Sie sich anmelden, hat seine eigene Verschlüsselungsidentität -- eine an Sie gesendete Nachricht erreicht jedes der unten aufgeführten Geräte. Entfernen Sie eines, das Sie nicht nutzen oder nicht erkennen.';

  @override
  String get devicesScreenNoDevicesFound => 'Keine Geräte gefunden.';

  @override
  String get devicesScreenUnknownDevice => 'Unbekanntes Gerät';

  @override
  String get devicesScreenThisDeviceBadge => 'Dieses Gerät';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Gerät entfernen';

  @override
  String get totpSetupInvalidCode =>
      'Ungültiger Code. Versuchen Sie es erneut.';

  @override
  String get totpSetupEnabledMessage =>
      'Die Zwei-Faktor-Authentifizierung ist aktiviert.';

  @override
  String get totpSetupScanInstructions =>
      'Scannen Sie diesen Schlüssel in Ihre Authenticator-App (Google Authenticator, 1Password, Authy):';

  @override
  String get totpSetupCodeHint =>
      'Geben Sie den 6-stelligen Code zur Bestätigung ein';

  @override
  String get totpSetupVerifyButton => 'Bestätigen & Aktivieren';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'Push-to-Talk';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'Beliebige Taste drücken, um sie zuzuweisen...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Geräte testen';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Sprachverarbeitung';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'Rauschunterdrückung';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Reduziert Hintergrundgeräusche an Ihrem Mikrofon';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Erweiterte Rauschunterdrückung (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'KI-gestützte Rauschentfernung in Echtzeit, stärker als die Standardunterdrückung -- ersetzt sie, wenn aktiviert';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'Echo-Unterdrückung';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Verhindert, dass Ihr eigenes Audio als Echo zurückkommt';

  @override
  String get voiceVideoSettingsAutoGainTitle =>
      'Automatische Verstärkungsregelung';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Gleicht die Mikrofonlautstärke automatisch aus (Lautheitsnormalisierung)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'Auto-Ducking';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Senkt die Lautstärke anderer Teilnehmer, während Sie sprechen';

  @override
  String get voiceVideoSettingsHighPassTitle => 'Hochpassfilter';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Schneidet niederfrequentes Brummen ab (Lüfter, Klimaanlage, Tischstöße)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle => 'Tippgeräuscherkennung';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Unterdrückt Tastaturklappern, das Ihr Mikrofon aufnimmt';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Stimmisolierung';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Fokussiert auf Ihre Stimme und filtert andere Personen und Geräusche in der Nähe heraus';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Mikrofonverstärkung';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Verstärkung aktivieren';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Vorverstärkung für ein leises oder entferntes Mikrofon -- wird vor dem Equalizer angewendet';

  @override
  String get voiceVideoSettingsBandBoost => 'Verstärkung';

  @override
  String get voiceVideoSettingsSectionMicEq => 'Mikrofon-Equalizer';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'Equalizer aktivieren';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Formt Ihr Mikrofonsignal, bevor es andere erreicht';

  @override
  String get voiceVideoSettingsBandBass => 'Bässe';

  @override
  String get voiceVideoSettingsBandMid => 'Mitten';

  @override
  String get voiceVideoSettingsBandTreble => 'Höhen';

  @override
  String get voiceVideoSettingsSectionVad => 'Sprachaktivitätserkennung (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'VOX aktivieren';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Überträgt nur, wenn Sie tatsächlich sprechen';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Empfindlichkeit';

  @override
  String get voiceVideoSettingsVadHint =>
      'Niedriger = erfasst leisere Geräusche. Höher = nur lautere Sprache löst die Übertragung aus.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Zugewiesene Taste';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'Nicht festgelegt — Mikrofon bleibt aktiv, solange es nicht stummgeschaltet ist';

  @override
  String get voiceVideoSettingsClearButton => 'Löschen';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Taste festlegen';

  @override
  String get voiceVideoSettingsChangeButton => 'Ändern';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'Wenn eine Taste zugewiesen ist, überträgt Ihr Mikrofon nur, solange Sie diese Taste gedrückt halten. Dies hat Vorrang vor VOX, während Sie sich in einem Sprachkanal befinden.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Virtuelles Reaktives Avatar-Modell';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Laden Sie zwei Bilder hoch, die sich beim Sprechen abwechseln. Nur für Sie sichtbar.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'Still';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'Spricht';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'Sprechschwelle';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Niedriger = wechselt leichter zum Sprechbild.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'VARM entfernen';

  @override
  String get gifPickerNoGifsFound => 'Keine GIFs gefunden';

  @override
  String get gifPickerSearchHint => 'GIFs suchen...';

  @override
  String get messageSearchHint => 'Diesen Kanal durchsuchen...';

  @override
  String get messageSearchTooltip => 'Suchen';

  @override
  String get messageSearchInitialHint =>
      'Durchsucht bereits auf diesem Gerät geladene Nachrichten -- ältere Verläufe werden abgerufen (und lokal entschlüsselt), während Sie weiter zurückgehen.';

  @override
  String get messageSearchNoMatches => 'Keine Treffer';

  @override
  String get messageSearchStartOfHistory => 'Anfang des Kanalverlaufs';

  @override
  String get messageSearchFurtherBackButton => 'Weiter zurücksuchen';

  @override
  String get messageSearchUnknownAuthor => 'Unbekannt';
}
