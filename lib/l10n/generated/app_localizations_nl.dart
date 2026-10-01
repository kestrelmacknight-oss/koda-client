// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'Annuleren';

  @override
  String get commonSave => 'Opslaan';

  @override
  String get commonEdit => 'Bewerken';

  @override
  String get commonDelete => 'Verwijderen';

  @override
  String get commonCreate => 'Aanmaken';

  @override
  String get commonClose => 'Sluiten';

  @override
  String get commonDone => 'Klaar';

  @override
  String get commonDownload => 'Downloaden';

  @override
  String get commonDisconnect => 'Verbinding verbreken';

  @override
  String get commonNone => 'Geen';

  @override
  String get commonJoin => 'Deelnemen';

  @override
  String get commonDismiss => 'Negeren';

  @override
  String get commonSubmit => 'Verzenden';

  @override
  String get commonConfirm => 'Bevestigen';

  @override
  String get commonRemove => 'Verwijderen';

  @override
  String get commonRetry => 'Opnieuw proberen';

  @override
  String get commonOk => 'OK';

  @override
  String get commonYes => 'Ja';

  @override
  String get commonNo => 'Nee';

  @override
  String get commonSearch => 'Zoeken';

  @override
  String get commonSettings => 'Instellingen';

  @override
  String get commonLoading => 'Laden...';

  @override
  String get settingsLanguageSection => 'Taal';

  @override
  String get settingsLanguageTitle => 'App-taal';

  @override
  String get settingsLanguageSystemDefault => 'Systeemstandaard';

  @override
  String get settingsLanguageDescription =>
      'Kies de taal waarin Koda\'s eigen interface wordt weergegeven. Dit staat los van de hoofdtaal van een server of de taal waarin je berichten typt.';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get settingsSignOut => 'Afmelden';

  @override
  String get settingsSectionMyAccount => 'Mijn account';

  @override
  String get settingsSectionSecurity => 'Beveiliging';

  @override
  String get settingsSectionAccessibility => 'Toegankelijkheid';

  @override
  String get settingsSectionBilling => 'Facturering';

  @override
  String get settingsSectionFamily => 'Gezin';

  @override
  String get settingsSectionVoiceVideo => 'Spraak en video';

  @override
  String get settingsSectionDesktop => 'Desktop';

  @override
  String get settingsSectionAbout => 'Over';

  @override
  String get settingsTwoFactorTitle => 'Tweestapsverificatie';

  @override
  String get settingsTwoFactorSubtitle =>
      'Voeg een authenticator-app toe voor extra beveiliging';

  @override
  String get settingsLinkedDevicesTitle => 'Gekoppelde apparaten';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'Bekijk en verwijder apparaten die bij dit account zijn aangemeld';

  @override
  String get settingsContentFiltersTitle => 'Contentfilters';

  @override
  String get settingsContentFiltersSubtitle =>
      'Kies hoe gelabelde content moet worden weergegeven';

  @override
  String get settingsDmFriendsOnlyTitle => 'Alleen DM\'s van vrienden toestaan';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Niet-vrienden kunnen geen nieuw gesprek met je beginnen';

  @override
  String get settingsDmPrivacyError => 'Kan DM-privacy niet bijwerken.';

  @override
  String get settingsShowVispAvatarTitle => 'Visps avatar tonen';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Toont Visps gezicht en stemming in de dialoogvensters voor instellen, gebeurtenissen en advies';

  @override
  String get settingsHighContrastTitle => 'Hoog contrast';

  @override
  String get settingsHighContrastSubtitle =>
      'Puur zwart-wit, hoogcontrastkleuren in de hele app -- wisselen laadt het huidige scherm kort opnieuw.';

  @override
  String get settingsDyslexiaFontTitle => 'Dyslexievriendelijk lettertype';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Verandert de hoofdtekst naar OpenDyslexic in de hele app';

  @override
  String get settingsFontSizeTitle => 'Tekstgrootte';

  @override
  String get settingsFontSizeSample =>
      'Pa\'s wijze lynx bezag vroom het fikse aquaduct';

  @override
  String get settingsDensityTitle => 'Dichtheid';

  @override
  String get settingsDensityDescription =>
      'Beïnvloedt de ruimte tussen standaardbedieningselementen -- knoppen, schakelaars, dialoogvensters -- niet elke aangepaste lay-out.';

  @override
  String get settingsDensityCompact => 'Compact';

  @override
  String get settingsDensityStandard => 'Standaard';

  @override
  String get settingsDensityComfortable => 'Comfortabel';

  @override
  String get settingsStreamingTitle => 'Streamingaccounts';

  @override
  String get settingsStreamingDescription =>
      'Verbind Twitch/YouTube zodat servers waar je de rechten \"Aankondigen bij live-uitzending\" hebt, automatisch kunnen posten wanneer je live gaat of een nieuwe video plaatst.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform verbonden als $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform niet verbonden';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- nu live';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- nieuwe upload';

  @override
  String get settingsStreamingConnecting => 'Verbinden...';

  @override
  String get settingsStreamingConnect => 'Verbinden';

  @override
  String get settingsAnnounceLiveTwitch => 'Aankondigen wanneer ik live ga';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Livestreams en nieuwe uploads aankondigen';

  @override
  String get settingsRefreshStatus =>
      'Al verbonden in je browser? Vernieuw status';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'Kan verbinding met $platform niet starten.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Rond het verbinden af in je browser en kom dan terug om te vernieuwen.';

  @override
  String get settingsThroneTitle => 'Throne-webhook';

  @override
  String get settingsThroneDescription =>
      'Plak deze URL in je Throne.com-webhookinstellingen om in Koda een melding te krijgen wanneer iemand je een cadeau stuurt.';

  @override
  String get settingsThroneGetUrl => 'Mijn webhook-URL ophalen';

  @override
  String get settingsThroneCopyTooltip => 'Kopiëren';

  @override
  String get settingsThroneCopiedToast => 'Gekopieerd naar klembord';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Opnieuw genereren (maakt de oude URL ongeldig)';

  @override
  String get settingsThroneRegenerateConfirmTitle =>
      'Webhook-URL opnieuw genereren?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'Je oude URL stopt met werken, dus werk deze daarna bij in Throne.com.';

  @override
  String get settingsThroneRegenerate => 'Opnieuw genereren';

  @override
  String get settingsUploadPhoto => 'Foto uploaden';

  @override
  String get settingsOrPasteUrl => 'of plak hieronder een URL';

  @override
  String get settingsAvatarUrlHint => 'https://voorbeeld.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'Afbeelding uploaden vereist Cloudflare R2 — URL plakken werkt altijd.';

  @override
  String get settingsDisplayNameLabel => 'WEERGAVENAAM';

  @override
  String get settingsDisplayNameHint => 'Weergavenaam';

  @override
  String get settingsBioLabel => 'BIO';

  @override
  String get settingsBioHint => 'Vertel anderen iets over jezelf';

  @override
  String get settingsPronounsLabel => 'VOORNAAMWOORDEN';

  @override
  String get settingsPronounsHint => 'bijv. hen/hun';

  @override
  String get settingsShowPronounsTitle =>
      'Mijn voornaamwoorden aan anderen tonen';

  @override
  String get settingsShowPronounsSubtitle =>
      'Wordt naast je naam getoond in chat, ledenlijsten en spraak';

  @override
  String get settingsStatusLabel => 'STATUS';

  @override
  String get settingsCustomStatusLabel => 'AANGEPASTE STATUS';

  @override
  String get settingsCustomStatusHint => 'Waar denk je aan?';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusAway => 'Afwezig';

  @override
  String get statusDnd => 'Niet storen';

  @override
  String get statusInvisible => 'Onzichtbaar';

  @override
  String get settingsFamilyNotAvailable =>
      'Ouderlijk toezicht is niet beschikbaar op een begeleid account.';

  @override
  String get settingsAboutTitle => 'Over Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Algemene voorwaarden';

  @override
  String get settingsPrivacyTitle => 'Privacybeleid';

  @override
  String get settingsSupportTitle => 'Ondersteuning';

  @override
  String get settingsReportSecurityTitle => 'Een beveiligingsprobleem melden';

  @override
  String get settingsDesktopNotAvailable =>
      'Dit zijn instellingen die alleen voor desktop gelden -- dit platform heeft geen venster of systeemvak.';

  @override
  String get settingsCloseToTrayTitle => 'Naar systeemvak sluiten';

  @override
  String get settingsCloseToTraySubtitle =>
      'Als je het venster sluit, blijft Koda op de achtergrond actief zodat je meldingen blijft ontvangen -- zet dit uit zodat het sluiten van het venster de app echt afsluit.';

  @override
  String get authErrorEmailPasswordRequired =>
      'E-mailadres en wachtwoord zijn verplicht.';

  @override
  String get authErrorIncorrectCredentials =>
      'Onjuist e-mailadres of wachtwoord.';

  @override
  String get authErrorMustAcceptTerms => 'Accepteer de Algemene voorwaarden.';

  @override
  String get authErrorAllFieldsRequired => 'Alle velden zijn verplicht.';

  @override
  String get authErrorPasswordsDontMatch => 'Wachtwoorden komen niet overeen.';

  @override
  String get authErrorPasswordTooShort =>
      'Wachtwoord moet minstens 8 tekens bevatten.';

  @override
  String get authErrorRegistrationFailed =>
      'Registratie mislukt. Dat e-mailadres is mogelijk al in gebruik.';

  @override
  String get authTabSignIn => 'Aanmelden';

  @override
  String get authTabCreateAccount => 'Account aanmaken';

  @override
  String get authAgreementPrefix =>
      'Door Koda te gebruiken ga je akkoord met onze ';

  @override
  String get authTermsLink => 'Algemene voorwaarden';

  @override
  String get authAgreementMiddle => ' en ons ';

  @override
  String get authPrivacyLink => 'Privacybeleid';

  @override
  String get authAgreementSuffix => '.';

  @override
  String get authEmailHint => 'E-mailadres';

  @override
  String get authPasswordHint => 'Wachtwoord';

  @override
  String get authForgotPassword => 'Wachtwoord vergeten?';

  @override
  String get authSignInButton => 'Aanmelden';

  @override
  String get authUsernameHint => 'Gebruikersnaam';

  @override
  String get authConfirmPasswordHint => 'Wachtwoord bevestigen';

  @override
  String get authAgreeToTerms =>
      'Ik ga akkoord met de Algemene voorwaarden en het Privacybeleid';

  @override
  String get authCreateAccountButton => 'Account aanmaken';

  @override
  String get dmSafetyNumberChangedWarning =>
      'Het veiligheidsnummer van dit gesprek is gewijzigd -- controleer dit voordat je verzendt.';

  @override
  String get dmMessageNotSent => 'Bericht niet verzonden.';

  @override
  String dmEncryptMessageError(String error) {
    return 'Kan bericht niet versleutelen: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'Uploaden van bijlage mislukt.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'Kan bijlage niet versleutelen: $error';
  }

  @override
  String get dmReportMessage => 'Bericht melden';

  @override
  String get dmReportSubmitted => 'Melding verzonden.';

  @override
  String get dmTitle => 'Berichten';

  @override
  String get dmNewMessage => 'Nieuw bericht';

  @override
  String get dmNoConversationsYet => 'Nog geen gesprekken';

  @override
  String get dmSelectConversation => 'Selecteer een gesprek';

  @override
  String get dmVerifySafetyNumberTooltip => 'Veiligheidsnummer verifiëren';

  @override
  String get dmSeenLabel => 'Gezien';

  @override
  String get dmMessageActionsTooltip => 'Berichtacties';

  @override
  String get dmRemoveAttachmentTooltip => 'Bijlage verwijderen';

  @override
  String get dmAttachFileTooltip => 'Bestand bijvoegen';

  @override
  String get dmMessageHint => 'Bericht...';

  @override
  String get dmSendMessageTooltip => 'Bericht verzenden';

  @override
  String get dmNoFriendsYet =>
      'Nog geen vrienden.\nStuur een vriendschapsverzoek om te beginnen.';

  @override
  String get dmUnfriendTooltip => 'Ontvrienden';

  @override
  String get dmNoPendingRequests => 'Geen openstaande vriendschapsverzoeken.';

  @override
  String get dmIncomingRequestsLabel => 'BINNENKOMEND';

  @override
  String get dmSentRequestsLabel => 'VERZONDEN';

  @override
  String get dmAcceptTooltip => 'Accepteren';

  @override
  String get dmDeclineTooltip => 'Weigeren';

  @override
  String get dmPendingLabel => 'In behandeling';

  @override
  String get dmNewMessageDialogTitle => 'Nieuw bericht';

  @override
  String get dmEnterUsernameHint => 'Voer gebruikersnaam in';

  @override
  String get dmOpenButton => 'Openen';

  @override
  String dmSavedAttachment(String fileName) {
    return '$fileName opgeslagen';
  }

  @override
  String get dmUnknownUser => 'Onbekend';

  @override
  String get dmEndToEndEncryptedTooltip => 'End-to-end versleuteld';

  @override
  String get homeContentWarningTitle => 'Contentwaarschuwing';

  @override
  String homeContentWarningBody(String labels) {
    return 'Dit kanaal is gemarkeerd voor: $labels.\n\nWijzig dit in Instellingen > Beveiliging > Contentfilters.';
  }

  @override
  String get homeViewAnyway => 'Toch weergeven';

  @override
  String get homeCouldNotConnectVoice =>
      'Kan geen verbinding maken met spraak.';

  @override
  String get homeVoiceChannelFull => 'Dit spraakkanaal is vol.';

  @override
  String get homeCreateServer => 'Server aanmaken';

  @override
  String get homeJoinServer => 'Deelnemen aan server';

  @override
  String get homeRedeemCode => 'Code inwisselen';

  @override
  String get homeJoinServerDialogTitle => 'Deelnemen aan server';

  @override
  String get homeEnterInviteCode => 'Voer een uitnodigingscode of URL in:';

  @override
  String get homeInviteCodeHint => 'bijv. XK9MP2';

  @override
  String get homeJoined => 'Deelgenomen!';

  @override
  String get homeInvalidInvite => 'Ongeldige of verlopen uitnodigingscode.';

  @override
  String get homeJoinButton => 'Deelnemen';

  @override
  String get homeRedeemCodeDialogTitle => 'Code inwisselen';

  @override
  String get homeEnterBackerCode => 'Voer je backer- of beloningscode in:';

  @override
  String get homeRewardCodeHint => 'Beloningscode';

  @override
  String get homeCodeRedeemed =>
      'Code ingewisseld! Je beloningen zijn toegepast.';

  @override
  String get homeInvalidRedeemCode =>
      'Ongeldige, verlopen of al ingewisselde code.';

  @override
  String get homeRedeemButton => 'Inwisselen';

  @override
  String get homeAreFriends => 'Jullie zijn vrienden';

  @override
  String get homeAddFriend => 'Vriend toevoegen';

  @override
  String homeFriendRequestSent(String username) {
    return 'Vriendschapsverzoek verzonden naar $username!';
  }

  @override
  String get homeMessageButton => 'Bericht';

  @override
  String get homeSendTip => 'Fooi versturen';

  @override
  String get homeSwitchToServer => 'Overschakelen naar server';

  @override
  String get homeInvitePeople => 'Mensen uitnodigen';

  @override
  String get homeServerSettingsMenuItem => 'Serverinstellingen';

  @override
  String get homeLeaveServerMenuItem => 'Server verlaten';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return '$serverName verlaten? Je kunt opnieuw deelnemen met een uitnodiging.';
  }

  @override
  String get homeLeaveButton => 'Verlaten';

  @override
  String get homeCreateAServer => 'Een server aanmaken';

  @override
  String get homeServerNameHint => 'Servernaam';

  @override
  String get homeDescribeToVisp => 'Beschrijf het in plaats daarvan aan Visp';

  @override
  String get homeMarkAsRead => 'Markeren als gelezen';

  @override
  String get homeEditChannel => 'Kanaal bewerken';

  @override
  String get homeDeleteChannel => 'Kanaal verwijderen';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return '#$channelName verwijderen? Dit kan niet ongedaan worden gemaakt.';
  }

  @override
  String get homeDeleteButton => 'Verwijderen';

  @override
  String get homeCreateChannelHere => 'Kanaal hier aanmaken';

  @override
  String get homeEditCategory => 'Categorie bewerken';

  @override
  String get homeDeleteCategory => 'Categorie verwijderen';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return '\"$categoryName\" verwijderen? Kanalen hierin worden ongecategoriseerd.';
  }

  @override
  String get homeReplyAction => 'Beantwoorden';

  @override
  String get homeCreateThreadAction => 'Thread aanmaken';

  @override
  String get homeEditMessageAction => 'Bericht bewerken';

  @override
  String get homeDeleteMessageAction => 'Bericht verwijderen';

  @override
  String get homePinMessageAction => 'Bericht vastmaken';

  @override
  String get homeUnpinMessageAction => 'Bericht losmaken';

  @override
  String get homeReportMessageAction => 'Bericht melden';

  @override
  String get homeReportSubmitted => 'Melding verzonden.';

  @override
  String get homeAddReactionTitle => 'Reactie toevoegen';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count threads',
      one: '$count thread',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'Categorie-opties';

  @override
  String get homeChannelOptionsTooltip => 'Kanaalopties';

  @override
  String get homeOpenVoiceChatTooltip => 'Chat openen';

  @override
  String get homeMarketplaceLabel => 'Marktplaats';

  @override
  String get homeSelectChannelPrompt => 'Selecteer een kanaal';

  @override
  String get homeSearchTooltip => 'Zoeken';

  @override
  String get homePinnedMessagesTooltip => 'Vastgemaakte berichten';

  @override
  String get homeWaitingForKey =>
      'Wachten tot de versleutelingssleutel binnenkomt...';

  @override
  String get homeUnableToDecrypt => 'Kan dit bericht niet ontsleutelen.';

  @override
  String get homeMessageActionsTooltip => 'Berichtacties';

  @override
  String get homeCancelReplyTooltip => 'Antwoord annuleren';

  @override
  String get homeRemoveAttachmentTooltip => 'Bijlage verwijderen';

  @override
  String get homeAttachFileTooltip => 'Bestand bijvoegen';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'Bericht #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'Bericht verzenden';

  @override
  String get homeEditMessageTitle => 'Bericht bewerken';

  @override
  String get homeMessageLabel => 'Bericht';

  @override
  String get homePinnedMessagesTitle => 'Vastgemaakte berichten';

  @override
  String get homeNoPinnedMessages => 'Geen vastgemaakte berichten';

  @override
  String get homeUnpinTooltip => 'Losmaken';

  @override
  String get homeCreateThreadTitle => 'Thread aanmaken';

  @override
  String get homeThreadNameHint => 'Threadnaam';

  @override
  String homeThreadCreated(String name) {
    return 'Thread \"$name\" aangemaakt!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Aanmaken of deelnemen';

  @override
  String get homeKodaMarketplaceTooltip => 'Koda Marktplaats';

  @override
  String get homeAdminPanelTooltip => 'Beheerderspaneel';

  @override
  String get homeServerSettingsTooltip => 'Serverinstellingen';

  @override
  String get homeSettingsTooltip => 'Instellingen';

  @override
  String get homeContentWarningBadge => 'Contentwaarschuwing';

  @override
  String get homeDirectMessagesTooltip => 'Directe berichten';

  @override
  String homeReplyingTo(String username) {
    return 'Antwoorden aan $username';
  }

  @override
  String get homeAttachmentFallback => 'Bijlage';

  @override
  String get homeAttachmentUploadFailed => 'Uploaden van bijlage mislukt.';

  @override
  String homeSavedAttachment(String fileName) {
    return '$fileName opgeslagen';
  }

  @override
  String serverConnectError(String service) {
    return 'Kan verbinding met $service niet starten.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Printful loskoppelen?';

  @override
  String get serverDisconnectPrintfulBody =>
      'Deze server kan geen merchandisebestellingen meer verwerken totdat de verbinding is hersteld.';

  @override
  String get serverDisconnectTiltifyTitle => 'Tiltify loskoppelen?';

  @override
  String get serverDisconnectTiltifyBody =>
      'Deze server toont de voortgang van zijn goededoelencampagne niet meer totdat de verbinding is hersteld.';

  @override
  String get serverNewRoleTitle => 'Nieuwe rol';

  @override
  String get serverEditRoleTitle => 'Rol bewerken';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Kleur $hex';
  }

  @override
  String get permViewChannels => 'Kanalen bekijken';

  @override
  String get permSendMessages => 'Berichten verzenden';

  @override
  String get permConnectVoice => 'Verbinden met spraak';

  @override
  String get permManageServer => 'Server beheren';

  @override
  String get permManageChannels => 'Kanalen beheren';

  @override
  String get permManageRoles => 'Rollen beheren';

  @override
  String get permManageMessages => 'Berichten beheren';

  @override
  String get permKickMembers => 'Leden verwijderen';

  @override
  String get permBanMembers => 'Leden verbannen';

  @override
  String get permMuteMembers => 'Leden dempen';

  @override
  String get permMentionEveryone => '@everyone vermelden';

  @override
  String get permManageMarketplace => 'Marktplaats beheren';

  @override
  String get permAnnounceLive => 'Aankondigen bij live-uitzending';

  @override
  String get permMoveMembers => 'Leden verplaatsen (spraak)';

  @override
  String get serverRoleNameHint => 'Rolnaam';

  @override
  String get serverColorLabel => 'Kleur';

  @override
  String get serverPermissionsLabel => 'Rechten';

  @override
  String get serverSelfAssignableTitle => 'Zelf toewijsbaar';

  @override
  String get serverSelfAssignableSubtitle =>
      'Leden kunnen deze rol zelf aan zichzelf toewijzen';

  @override
  String get serverDefaultRoleUndeletable =>
      'De standaardrol kan niet worden verwijderd.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'Rol \"$roleName\" verwijderen?';
  }

  @override
  String get serverCouldNotDeleteRole => 'Kan die rol niet verwijderen.';

  @override
  String get serverMemberFallback => 'Lid';

  @override
  String get serverNoRolesYet => 'Nog geen rollen.';

  @override
  String get serverRefreshStatus =>
      'Al verbonden in je browser? Vernieuw status';

  @override
  String get serverPrintfulConnected => 'Printful verbonden';

  @override
  String get serverPrintfulNotConnected => 'Printful niet verbonden';

  @override
  String get serverPrintfulDescription =>
      'Koppel het Printful-account van deze server om merchandisebestellingen via Koda te verwerken. Elke server koppelt zijn eigen winkel.';

  @override
  String get serverConnecting => 'Verbinden...';

  @override
  String get serverConnectPrintful => 'Printful verbinden';

  @override
  String get serverTiltifyConnected => 'Tiltify verbonden';

  @override
  String get serverTiltifyNotConnected => 'Tiltify niet verbonden';

  @override
  String get serverTiltifyDescription =>
      'Koppel het Tiltify-account van deze server om de live voortgang van een goededoelencampagne aan alle leden te tonen. Alleen-lezen -- Koda plaatst of wijzigt nooit iets aan de kant van Tiltify.';

  @override
  String get serverConnectTiltify => 'Tiltify verbinden';

  @override
  String get serverNoTiltifyCampaigns =>
      'Geen campagnes gevonden op dit Tiltify-account.';

  @override
  String get serverPickCampaign =>
      'Kies welke campagne moet worden weergegeven';

  @override
  String get serverUntitledCampaign => 'Naamloze campagne';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '$currency $raised opgehaald van doel $goal';
  }

  @override
  String get serverViewCampaign => 'Campagne bekijken';

  @override
  String get serverRefreshButton => 'Vernieuwen';

  @override
  String get serverUploadButton => 'Uploaden';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '$used / $limit plekken gebruikt -- boostniveau $level';
  }

  @override
  String get serverNoCustomEmoji => 'Nog geen aangepaste emoji.';

  @override
  String get serverDeleteEmojiTooltip => 'Emoji verwijderen';

  @override
  String get serverUploadEmojiTitle => 'Emoji uploaden';

  @override
  String get serverEmojiNameHint => 'naam (letters, cijfers, _)';

  @override
  String get serverChooseImage => 'Afbeelding kiezen';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Huidig boostniveau: $level';
  }

  @override
  String get serverBackgroundTitle => 'Serverachtergrond';

  @override
  String get serverBackgroundDescription =>
      'Een aangepaste achtergrond die achter de kanaalweergave wordt getoond aan iedereen in deze server.';

  @override
  String get serverBackgroundLockedHint =>
      'Bereik boostniveau 4 om een aangepaste achtergrond te ontgrendelen.';

  @override
  String get serverIconBorderTitle => 'Serverpictogramrand';

  @override
  String get serverIconBorderDescription =>
      'Een accentrand rond het pictogram van deze server in de serverlijst van elk lid.';

  @override
  String get serverIconBorderLockedHint =>
      'Bereik boostniveau 5 om een aangepaste pictogramrand te ontgrendelen.';

  @override
  String get serverBoostFromBank =>
      'Boost deze server vanuit de Serverbank in de Marktplaats om het niveau te verhogen.';

  @override
  String get serverMarketplaceListingLabel => 'MARKTPLAATSVERMELDING';

  @override
  String get serverListInMarketplace => 'Vermelden in Koda Marktplaats';

  @override
  String get serverListInMarketplaceDescription =>
      'Vermeldt de winkel van deze server in de Koda Marketplace, met een kans op de wekelijkse uitgelichte rotatie. Dit gaat over winkelen, niet over het vinden van servers om lid van te worden -- het heeft geen invloed op het algemene zoeken naar servers.';

  @override
  String get serverSocialLinkLabel =>
      'Sociale link / uitnodigingslink (optioneel)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Link opslaan';

  @override
  String get serverPricingLabel => 'PRIJZEN';

  @override
  String get serverPrimaryCurrencyLabel => 'Primaire valuta';

  @override
  String get serverPrimaryCurrencyDescription =>
      'Geldt voor serverabonnementsniveaus en prijzen van digitale goederen die je voor deze server instelt.';

  @override
  String get serverPrimaryLanguageLabel => 'Primaire taal';

  @override
  String get serverPrimaryLanguageDescription =>
      'Berichten die leden in een andere taal plaatsen, krijgen een kleine taalbadge, vergeleken met deze instelling.';

  @override
  String get serverMarketplaceLinkSaved => 'Marktplaatslink opgeslagen.';

  @override
  String get serverIconUpdated => 'Serverpictogram bijgewerkt!';

  @override
  String get serverTemplateImported => 'Sjabloon geïmporteerd!';

  @override
  String get serverImportFromDiscord => 'Importeren vanuit Discord';

  @override
  String get serverVispPlanLive => 'Visps plan is live!';

  @override
  String get serverAskVisp => 'Visp vragen';

  @override
  String get serverAddCategoryButton => 'Categorie toevoegen';

  @override
  String get serverAddChannelHereTooltip => 'Kanaal hier toevoegen';

  @override
  String get serverRename => 'Naam wijzigen';

  @override
  String get serverUncategorized => 'ZONDER CATEGORIE';

  @override
  String get serverAddChannel => 'Kanaal toevoegen';

  @override
  String get serverEditRulesContent => 'Regelinhoud bewerken';

  @override
  String get serverRulesContentHint => 'Voer hier je serverregels in...';

  @override
  String get serverRulesUpdated => 'Regels bijgewerkt!';

  @override
  String get serverAddRole => 'Rol toevoegen';

  @override
  String get serverDefaultRoleLabel => 'Standaardrol';

  @override
  String get serverManageRolesTooltip => 'Rollen beheren';

  @override
  String get serverMutedLabel => 'Gedempt';

  @override
  String get serverExpandedLabel => 'uitgevouwen';

  @override
  String get serverCollapsedLabel => 'samengevouwen';

  @override
  String get serverUnmute => 'Dempen opheffen';

  @override
  String get serverMute => 'Dempen';

  @override
  String get serverKick => 'Verwijderen';

  @override
  String get serverBan => 'Verbannen';

  @override
  String serverBannedUsersLabel(int count) {
    return 'VERBANNEN GEBRUIKERS — $count';
  }

  @override
  String get serverNoBannedUsers => 'Geen verbannen gebruikers.';

  @override
  String get serverUnban => 'Verbanning opheffen';

  @override
  String get serverMemberFallbackGeneric => 'dit lid';

  @override
  String serverBanConfirm(String username, String serverName) {
    return '$username verbannen van $serverName? Diegene kan niet opnieuw deelnemen zonder dat de verbanning wordt opgeheven.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return '$username verwijderen van $serverName? Diegene kan opnieuw deelnemen met een uitnodiging.';
  }

  @override
  String get serverMuteDuration60Sec => '60 seconden';

  @override
  String get serverMuteDuration5Min => '5 minuten';

  @override
  String get serverMuteDuration10Min => '10 minuten';

  @override
  String get serverMuteDuration1Hour => '1 uur';

  @override
  String get serverMuteDuration1Day => '1 dag';

  @override
  String get serverMuteDuration1Week => '1 week';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'Kan $username niet $action.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return '$username dempen';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'Kan $username niet dempen.';
  }

  @override
  String get serverUnlockInvites => 'Uitnodigingen ontgrendelen';

  @override
  String get serverInvitesUnlocked => 'Uitnodigingen ontgrendeld.';

  @override
  String get serverAuditLogDescription =>
      'Niveau 1-moderatieactiviteit -- verwijderingen, verbanningen, dempingen en automatische bescherming tegen spam/raids. Alleen metadata; nooit berichtinhoud.';

  @override
  String get serverSystemActor => 'Systeem';

  @override
  String get serverActionKicked => 'verwijderd';

  @override
  String get serverActionBanned => 'verbannen';

  @override
  String get serverActionUnbanned => 'verbanning opgeheven';

  @override
  String get serverActionMuted => 'gedempt';

  @override
  String get serverActionUnmuted => 'dempen opgeheven';

  @override
  String get serverActionFloodDetected => 'automatisch gedempt wegens spammen';

  @override
  String get serverActionRaidLockdownEnabled =>
      'uitnodigingen vergrendeld (raidbescherming)';

  @override
  String get serverActionRaidLockdownDisabled => 'uitnodigingen ontgrendeld';

  @override
  String get serverActionMoved => 'verplaatst';

  @override
  String get serverUnknownAction => 'onbekende actie';

  @override
  String get serverNoModerationActivity => 'Nog geen moderatieactiviteit.';

  @override
  String get serverReportsDescription =>
      'Berichten gemeld door leden van deze server -- de al ontsleutelde eigen kopie van de melder, onthuld door het melden.';

  @override
  String get serverNoPendingReports => 'Geen openstaande meldingen.';

  @override
  String get serverReportReasonOther => 'overig';

  @override
  String get serverReportStatusActioned => 'Afgehandeld';

  @override
  String get serverReportStatusDismissed => 'Afgewezen';

  @override
  String get serverResolvedLabel => 'OPGELOST';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'Gemeld door $reporter -- verzonden door $target';
  }

  @override
  String serverReportNote(String note) {
    return 'Notitie: $note';
  }

  @override
  String get serverDismissButton => 'Afwijzen';

  @override
  String get serverMarkActioned => 'Markeren als afgehandeld';

  @override
  String get serverCreateInvite => 'Uitnodiging maken';

  @override
  String get serverInviteCreatedTitle => 'Uitnodiging aangemaakt';

  @override
  String get serverNoActiveInvites => 'Geen actieve uitnodigingen';

  @override
  String serverUsesLabel(String uses) {
    return 'Gebruikt: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Uitnodiging verwijderen';

  @override
  String get serverChangeIconLabel => 'Serverpictogram wijzigen';

  @override
  String get serverFallbackName => 'Server';

  @override
  String serverSettingsTitle(String serverName) {
    return 'Instellingen voor $serverName';
  }

  @override
  String get serverTabChannels => 'Kanalen';

  @override
  String get serverTabRoles => 'Rollen';

  @override
  String get serverTabMembers => 'Leden';

  @override
  String get serverTabInvites => 'Uitnodigingen';

  @override
  String get serverTabMerch => 'Merchandise';

  @override
  String get serverTabEmoji => 'Emoji';

  @override
  String get serverTabCustomize => 'Aanpassen';

  @override
  String get serverTabAuditLog => 'Auditlogboek';

  @override
  String get serverTabReports => 'Meldingen';

  @override
  String get serverTabThresholdMod => 'Drempelmoderatie';

  @override
  String get serverTabCharity => 'Liefdadigheid';

  @override
  String get homeCustomEmojiFallback => 'aangepaste emoji';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reacties',
      one: '$count reactie',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted =>
      ', je hebt gereageerd, activeer om te verwijderen';

  @override
  String get homeReactionActivateToAdd => ', activeer om toe te voegen';

  @override
  String get homeAddReactionLabel => 'Reactie toevoegen';

  @override
  String homeViewProfile(String username) {
    return 'Profiel van $username bekijken';
  }

  @override
  String get homeMoveToVoiceChannel => 'Verplaatsen naar spraakkanaal…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Kies een spraakkanaal';

  @override
  String get homeNoOtherVoiceChannels => 'Geen andere spraakkanalen';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username zit nu in $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'Kan $username niet verplaatsen';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'Je zit nu in $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'Word lid van $channel om te praten';
  }

  @override
  String get adminPanelTitle => 'Beheerpaneel';

  @override
  String get adminTabBackerCodes => 'Backer-codes';

  @override
  String get adminTabUsers => 'Gebruikers';

  @override
  String get adminTabDmReports => 'DM-meldingen';

  @override
  String get adminTabSpamFlags => 'Spammeldingen';

  @override
  String get adminTabWiki => 'Wiki';

  @override
  String get adminTabBoosts => 'Boosts';

  @override
  String get adminCreateBackerCodeTitle => 'Backer-code aanmaken';

  @override
  String get adminCodeHint => 'Code (leeg laten om automatisch te genereren)';

  @override
  String get adminNoteHint => 'Notitie (bijv. \"Kickstarter Tier 2\")';

  @override
  String get adminFlagsJsonHint =>
      'Flags als JSON, bijv. \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint =>
      'Max. aantal keer te gebruiken (leeg laten = onbeperkt)';

  @override
  String get adminCodeCreatedTitle => 'Code aangemaakt';

  @override
  String get adminCodeLabel => 'Code:';

  @override
  String get adminCopyCodeTooltip => 'Code kopiëren';

  @override
  String adminFlagsValue(String flags) {
    return 'Flags: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Backer- en beloningscodes';

  @override
  String get adminNewCodeButton => 'Nieuwe code';

  @override
  String get adminNoCodesYet => 'Nog geen codes';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses keer gebruikt';
  }

  @override
  String get adminSearchUsersHint => 'Zoek gebruikers op gebruikersnaam...';

  @override
  String get adminSearchUsersPrompt => 'Zoek hierboven naar een gebruiker';

  @override
  String get adminNoDmReports => 'Geen DM-meldingen.';

  @override
  String get adminResolvedLabel => 'OPGELOST';

  @override
  String get adminReasonOther => 'overig';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Melder: $reporterId\nOnthulde afzender: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Notitie: $note';
  }

  @override
  String get adminDismissButton => 'Negeren';

  @override
  String get adminMarkActionedButton => 'Markeren als afgehandeld';

  @override
  String get adminStatusActioned => 'Afgehandeld';

  @override
  String get adminStatusDismissed => 'Genegeerd';

  @override
  String get adminNoSpamFlags => 'Geen spammeldingen.';

  @override
  String get adminFlagMassDmSpam => 'Massale DM-spam';

  @override
  String get adminFlagRaidLockdown => 'Raid-lockdown';

  @override
  String get adminFlagBotBehavior => 'Bot-achtig gedrag';

  @override
  String get adminFlagChannelFlooding => 'Kanaal overspoelen met berichten';

  @override
  String get adminAutoEscalatedBadge => 'AUTOMATISCH GEËSCALEERD';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Zekerheid: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'Gebruiker: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Server: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount van $totalJoiners nieuwe leden nog gedempt';
  }

  @override
  String get adminNoJoinersMuted => 'Geen nieuwe leden momenteel gedempt';

  @override
  String adminRestrictedUntil(String until) {
    return 'Momenteel beperkt tot $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'Momenteel niet beperkt';

  @override
  String get adminDismissUndoButton => 'Negeren & ongedaan maken';

  @override
  String get adminConfirmRestrictButton => 'Bevestigen & beperken';

  @override
  String get adminDeleteArticleTitle => 'Artikel verwijderen?';

  @override
  String adminDeleteArticleBody(String title) {
    return '\"$title\" wordt verwijderd uit Visps kennisbank.';
  }

  @override
  String get adminNewArticleTitle => 'Nieuw artikel';

  @override
  String get adminEditArticleTitle => 'Artikel bewerken';

  @override
  String get adminArticleTitleHint => 'Titel';

  @override
  String get adminArticleContentHint => 'Artikelinhoud (markdown)';

  @override
  String get adminWikiArticlesHeader => 'Wiki-artikelen';

  @override
  String get adminNoArticlesYet => 'Nog geen artikelen';

  @override
  String get adminEditArticleTooltip => 'Artikel bewerken';

  @override
  String get adminDeleteArticleTooltip => 'Artikel verwijderen';

  @override
  String get adminSearchServersHint => 'Zoek servers op naam...';

  @override
  String get adminSearchServersPrompt => 'Zoek hierboven naar een server';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'Boosts toekennen aan $serverName';
  }

  @override
  String get adminNumBoostsHint => 'Aantal boosts';

  @override
  String get adminGrantButton => 'Toekennen';

  @override
  String get adminPositiveNumberError => 'Voer een positief geheel getal in.';

  @override
  String get adminGrantBoostsFailed => 'Boosts toekennen is mislukt.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count boosts toegekend aan $serverName -- nu level $level ($activeCount actief).',
      one:
          '$count boost toegekend aan $serverName -- nu level $level ($activeCount actief).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count leden';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Boosts toekennen';

  @override
  String get parentalDashboardTitle => 'Familie';

  @override
  String get parentalDashboardCreateChildTitle => 'Kindaccount aanmaken';

  @override
  String get parentalDashboardUsernameHint => 'Gebruikersnaam';

  @override
  String get parentalDashboardEmailHint => 'E-mail';

  @override
  String get parentalDashboardPasswordHint => 'Wachtwoord';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'Dit maakt een volledig begeleid account aan: gelabelde kanalen worden geblokkeerd en je kunt toegestane uren instellen en hun vrienden en servers zien (maar niet lezen).';

  @override
  String get parentalDashboardValidationError =>
      'Gebruikersnaam, e-mail en een wachtwoord van minstens 8 tekens zijn verplicht.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'Kon kindaccount niet aanmaken -- gebruikersnaam/e-mail zijn mogelijk al in gebruik.';

  @override
  String get parentalDashboardCreatingLabel => 'Bezig met aanmaken...';

  @override
  String get parentalDashboardNoChildren => 'Nog geen gekoppelde accounts.';

  @override
  String get parentalDashboardSupervisedLabel => 'Begeleid account';

  @override
  String get parentalDashboardUnknownUser => 'Onbekend';

  @override
  String get childDetailFallbackTitle => 'Kindaccount';

  @override
  String get childDetailTabFriends => 'Vrienden';

  @override
  String get childDetailTabServers => 'Servers';

  @override
  String get childDetailTabSchedule => 'Schema';

  @override
  String get childDetailTabOverride => 'Uitzondering';

  @override
  String get childDetailNoFriends => 'Geen vrienden.';

  @override
  String get childDetailUnknownUser => 'Onbekend';

  @override
  String get childDetailRemoveFriendTooltip => 'Vriend verwijderen';

  @override
  String get childDetailNoServers => 'Zit in geen enkele server.';

  @override
  String childDetailMemberCount(int count) {
    return '$count leden';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Uit server verwijderen';

  @override
  String get childDetailRestrictAccessTitle =>
      'Toegang beperken tot vaste uren';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Uit betekent onbeperkte toegang op elk moment';

  @override
  String get childDetailTimezoneLabel => 'Tijdzone';

  @override
  String get childDetailMonday => 'Maandag';

  @override
  String get childDetailTuesday => 'Dinsdag';

  @override
  String get childDetailWednesday => 'Woensdag';

  @override
  String get childDetailThursday => 'Donderdag';

  @override
  String get childDetailFriday => 'Vrijdag';

  @override
  String get childDetailSaturday => 'Zaterdag';

  @override
  String get childDetailSunday => 'Zondag';

  @override
  String get childDetailNoAccessLabel => 'Geen toegang';

  @override
  String get childDetailToLabel => 'tot';

  @override
  String get childDetailSavingLabel => 'Bezig met opslaan...';

  @override
  String get childDetailSaveScheduleButton => 'Schema opslaan';

  @override
  String get childDetailScheduleSaved => 'Schema opgeslagen.';

  @override
  String get childDetailOverrideExplanation =>
      'Verleen tijdelijke toegang buiten het normale schema -- handig voor een eenmalige uitzondering zonder het weekschema te wijzigen.';

  @override
  String get childDetailReasonHint => 'Reden (optioneel)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes min';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours u';
  }

  @override
  String get childDetailRevokeOverrideButton =>
      'Actieve uitzondering intrekken';

  @override
  String get childDetailAccessGranted => 'Tijdelijke toegang verleend.';

  @override
  String get childDetailOverrideRevoked => 'Uitzondering ingetrokken.';

  @override
  String get digitalGoodsTitle => 'Digitale producten';

  @override
  String get digitalGoodsMyProductsTitle => 'Mijn producten';

  @override
  String get digitalGoodsManageProductsTooltip =>
      'Beheer de producten van deze server';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Overschakelen naar Bladeren';

  @override
  String get digitalGoodsCreateProductTooltip => 'Product aanmaken';

  @override
  String get digitalGoodsBrowseTab => 'Bladeren';

  @override
  String get digitalGoodsMyListingsTab => 'Mijn aanbiedingen';

  @override
  String get digitalGoodsMyPurchasesTab => 'Mijn aankopen';

  @override
  String get digitalGoodsNoProductsYet => 'Nog geen producten';

  @override
  String get digitalGoodsNoProductsAvailable => 'Geen producten beschikbaar';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Maak je eerste product aan om te beginnen met verkopen';

  @override
  String get digitalGoodsCheckBackLater =>
      'Kom later terug voor digitale producten';

  @override
  String get digitalGoodsCreateProductButton => 'Product aanmaken';

  @override
  String get digitalGoodsLicenseKeyBadge => 'Licentiesleutel';

  @override
  String get digitalGoodsFileBadge => 'Bestand';

  @override
  String get digitalGoodsAllServersBadge => 'Alle servers';

  @override
  String get digitalGoodsFreeForYou => 'Gratis voor jou';

  @override
  String get digitalGoodsFreeLabel => 'Gratis';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count verkocht';
  }

  @override
  String get digitalGoodsKeysButton => 'Sleutels';

  @override
  String get digitalGoodsGetForFree => 'Gratis ontvangen';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'Koop voor $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'Nog geen aankopen';

  @override
  String get digitalGoodsUnknownProduct => 'Onbekend product';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'Gekocht op $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Sleutel kopiëren';

  @override
  String get digitalGoodsLicenseKeyCopied => 'Licentiesleutel gekopieerd!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'Verloopt $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'Jouw licentiesleutel';

  @override
  String get digitalGoodsCopyKeyButton => 'Sleutel kopiëren';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'Kon afrekenen niet starten -- deze maker heeft mogelijk nog geen Stripe gekoppeld.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'Aankoop voltooid! Je vindt het terug bij Mijn aankopen.';

  @override
  String get digitalGoodsPurchasePending =>
      'Nog steeds wachtend op die betaling -- het verschijnt bij Mijn aankopen zodra deze is voltooid.';

  @override
  String get digitalGoodsCreateProductTitle => 'Product aanmaken';

  @override
  String get digitalGoodsEditProductTitle => 'Product bewerken';

  @override
  String get digitalGoodsProductTitleHint => 'Producttitel';

  @override
  String get digitalGoodsDescriptionHint => 'Beschrijving (optioneel)';

  @override
  String get digitalGoodsPriceHint => 'Prijs in USD (leeg laten voor gratis)';

  @override
  String get digitalGoodsProductTypeLabel => 'Producttype';

  @override
  String get digitalGoodsFileDownloadOption => 'Bestandsdownload';

  @override
  String get digitalGoodsLicenseKeyOption => 'Licentiesleutel';

  @override
  String get digitalGoodsAvailabilityLabel => 'Beschikbaarheid';

  @override
  String get digitalGoodsThisServerOnlyOption => 'Alleen deze server';

  @override
  String get digitalGoodsAllKodaServersOption => 'Alle Koda-servers';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'Gebruik na het aanmaken de knop \"Sleutels\" om je licentiesleutels te uploaden.';

  @override
  String get digitalGoodsProductFileLabel => 'Productbestand';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName (${sizeMb}MB)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Bestand verwijderen';

  @override
  String get digitalGoodsUploadingLabel => 'Bezig met uploaden...';

  @override
  String get digitalGoodsChooseFileButton => 'Bestand kiezen';

  @override
  String get digitalGoodsReplaceFileButton => 'Bestand vervangen';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Kies een bestand voor dit product voordat je opslaat.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'Licentiesleutels uploaden';

  @override
  String get digitalGoodsPasteKeysHint => 'Plak één sleutel per regel:';

  @override
  String get digitalGoodsKeyExampleHint =>
      'SLEUTEL-XXXX-XXXX\nSLEUTEL-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Sleutels uploaden';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'Licentiesleutels geüpload!';

  @override
  String get serverSubscriptionManageTitle => 'Abonnementen beheren';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return 'Abonnementen van $serverName';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Niveau toevoegen';

  @override
  String get serverSubscriptionNoTiersYet => 'Nog geen abonnementsniveaus';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Maak tot 3 niveaus voor je community';

  @override
  String get serverSubscriptionCreateFirstTierButton =>
      'Eerste niveau aanmaken';

  @override
  String get serverSubscriptionShowSubscriberCounts => 'Aantal abonnees tonen';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/mnd';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count actieve abonnees',
      one: '$count actieve abonnee',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned => 'Rol automatisch toegewezen';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '$discount% marketplace-korting';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'Deze server heeft geen abonnementsniveaus';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Actieve abonnee';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'Verloopt $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk => 'Exclusieve abonneerol';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return '$discount% korting op marketplace-aankopen';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Kanalen alleen voor abonnees';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Momenteel geabonneerd';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'Abonneer voor $price/mnd';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Niveau aanmaken';

  @override
  String get serverSubscriptionEditTierTitle => 'Niveau bewerken';

  @override
  String get serverSubscriptionTierNameHint =>
      'Naam niveau (bijv. Fan, Supporter, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Beschrijving (optioneel)';

  @override
  String get serverSubscriptionPriceHint => 'Prijs per maand (USD)';

  @override
  String get serverSubscriptionDiscountLabel => 'Marketplace-korting %';

  @override
  String get serverSubscriptionPositionLabel => 'Positie';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Niveau $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Geeft rol bij abonneren — optioneel';

  @override
  String get serverSubscriptionRoleFallback => 'rol';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Wordt automatisch toegekend zodra een lid zich abonneert, en weer ingetrokken zodra het abonnement verloopt.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Niveau aangemaakt -- koppel Stripe onder Marketplace → Maker voordat leden zich hierop kunnen abonneren.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Niveau verwijderen';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return '\"$tierName\" verwijderen? Bestaande abonnees houden toegang tot het verloopt.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'Abonneren op $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel => 'Maandabonnement';

  @override
  String get serverSubscriptionServerBankEarnsLabel => 'Serverbank verdient';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points pt';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Betaling veilig verwerkt door Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'Abonneren';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'Kon afrekenen niet starten -- de eigenaar van deze server heeft mogelijk nog geen Stripe gekoppeld.';

  @override
  String get serverSubscriptionSubscribed => 'Geabonneerd!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'Nog steeds wachtend op die betaling -- het wordt geactiveerd zodra deze is voltooid.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'Fooi geven aan $username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Kies een bedrag';

  @override
  String get tipDialogMessageHint => 'Voeg een bericht toe (optioneel)';

  @override
  String get tipDialogYouPayLabel => 'Jij betaalt';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username ontvangt';
  }

  @override
  String get tipDialogSendTipButton => 'Fooi versturen';

  @override
  String get tipDialogFailedToSendTip =>
      'Fooi versturen mislukt. De maker is mogelijk niet gekoppeld aan Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'Kon afrekenen niet starten. Probeer het straks opnieuw.';

  @override
  String get tipDialogTipSent => 'Fooi verstuurd!';

  @override
  String get tipDialogTipPending =>
      'Nog steeds wachtend op die betaling -- deze wordt verwerkt zodra ze is voltooid.';

  @override
  String get tipDialogUnknownUser => 'Onbekend';

  @override
  String get marketplaceTitle => 'Marketplace';

  @override
  String get marketplaceCreatorPayoutsTitle => 'Uitbetalingen voor makers';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Ontvang fooien rechtstreeks via Stripe';

  @override
  String get marketplaceTabServerBank => 'Serverbank';

  @override
  String get marketplaceTabDigitalGoods => 'Digitale producten';

  @override
  String get marketplaceTabMerch => 'Merch';

  @override
  String get marketplaceTabSubscription => 'Abonnement';

  @override
  String get marketplaceTabRevenue => 'Inkomsten';

  @override
  String get marketplaceSelectServerSubscription =>
      'Kies een server om het abonnement te bekijken';

  @override
  String get marketplaceSelectServerBank =>
      'Kies een server om de bank te bekijken';

  @override
  String get marketplaceSelectServerRevenue =>
      'Kies een server om de inkomsten te bekijken';

  @override
  String get marketplaceStripeAccountStatus => 'Stripe-account';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Onboarding voltooid';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'Accepteert betalingen';

  @override
  String get marketplaceConnectStripeButton => 'Stripe-account koppelen';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Stripe-onboarding voltooien';

  @override
  String get marketplaceRefreshStatusButton => 'Status vernieuwen';

  @override
  String get marketplaceReadyToReceiveTips =>
      'Je bent klaar om fooien te ontvangen!';

  @override
  String get marketplaceHowItWorksTitle => 'Zo werkt het';

  @override
  String get marketplaceHowItWorksStep1 => 'Koppel je Stripe-account';

  @override
  String get marketplaceHowItWorksStep2 => 'Voltooi identiteitsverificatie';

  @override
  String get marketplaceHowItWorksStep3 =>
      'Ontvang fooien rechtstreeks op je bankrekening';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda rekent 5% verwerkingskosten. Deze kosten gaan als punten naar de bank van je server.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Alleen de servereigenaar of iemand met de rechten Marketplace beheren kan de Serverbank bekijken.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName geboost!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit eigen emoji-plekken';
  }

  @override
  String get marketplaceServerFallback => 'Server';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance pt';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount aan activiteit';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'Punten komen van de 5% verwerkingskosten op fooien en abonnementen in deze server. Gebruik punten om server-upgrades te ontgrendelen.';

  @override
  String get marketplaceServerBoostsTitle => 'Serverboosts';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Level $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count actieve boosts',
      one: '$count actieve boost',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: 'Nog $more boosts nodig voor level $level',
      one: 'Nog $more boost nodig voor level $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' en ontgrendel een eigen server-achtergrond';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' en ontgrendel een eigen rand om het server-icoon';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Je hebt $count boosttokens beschikbaar.',
      one: 'Je hebt $count boosttoken beschikbaar.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'Boosttokens komen van een Pulse-abonnement (1/maand). Abonneer je via het tabblad Abonnementen om er een te verdienen.';

  @override
  String get marketplaceBoostingLabel => 'Bezig met boosten...';

  @override
  String get marketplaceBoostThisServerButton => 'Boost deze server';

  @override
  String get marketplaceComingSoonUpgradesTitle =>
      'Binnenkort — Server-upgrades';

  @override
  String get marketplaceSpendPointsList =>
      'Besteed serverbankpunten aan:\n• Eigen serverdomein\n• Hoger ledenlimiet\n• Prioriteitsondersteuning\n• Exclusieve serverbadge';

  @override
  String get marketplaceSourceTip => 'Fooien';

  @override
  String get marketplaceSourceSubscription => 'Koda-abonnementen';

  @override
  String get marketplaceSourceServerSubscription => 'Serverabonnementen';

  @override
  String get marketplaceSourceDigitalProduct => 'Digitale producten';

  @override
  String get marketplaceSourceStageTicket => 'Podium-tickets';

  @override
  String get marketplaceSourcePrintfulOrder => 'Merchbestellingen';

  @override
  String get marketplaceJustNow => 'zojuist';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return '${minutes}m geleden';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return '${hours}u geleden';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return '${days}d geleden';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Alleen leden die de marketplace kunnen beheren, kunnen de inkomsten van deze server bekijken.';

  @override
  String get marketplaceBalanceLabel => 'Saldo';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Totaal verdiend';

  @override
  String get marketplaceLast30DaysTitle => 'Laatste 30 dagen';

  @override
  String get marketplaceRevenueBySourceTitle => 'Inkomsten per bron';

  @override
  String get marketplaceNoRevenueYet => 'Nog geen inkomsten.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count transacties',
      one: '$count transactie',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'Recente transacties';

  @override
  String get marketplaceNoTransactionsYet => 'Nog geen transacties.';

  @override
  String get marketplaceNoActivityYet => 'Nog geen activiteit';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count producten gesynchroniseerd vanuit Printful',
      one: '$count product gesynchroniseerd vanuit Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Kon niet synchroniseren met Printful -- controleer de verbinding bij Merch-instellingen.';

  @override
  String get printfulMerchSelectServer =>
      'Kies een server om de merch te bekijken';

  @override
  String get printfulMerchManageCatalogTitle => 'Merchcatalogus beheren';

  @override
  String get printfulMerchTitle => 'Merch';

  @override
  String get printfulMerchSyncingLabel => 'Bezig met synchroniseren...';

  @override
  String get printfulMerchSyncCatalogButton => 'Catalogus synchroniseren';

  @override
  String get printfulMerchSwitchToBrowseTooltip =>
      'Overschakelen naar Bladeren';

  @override
  String get printfulMerchManageTooltip => 'Beheer de merch van deze server';

  @override
  String get printfulMerchNothingSyncedYet => 'Nog niets gesynchroniseerd';

  @override
  String get printfulMerchNoMerchAvailable => 'Nog geen merch beschikbaar';

  @override
  String get printfulMerchSyncHint =>
      'Synchroniseer je Printful-winkel om je productcatalogus op te halen';

  @override
  String get printfulMerchCheckBackLater =>
      'Kom later terug voor merch van deze server';

  @override
  String get printfulMerchOutOfStock => 'Niet op voorraad';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vanaf $price • $count opties',
      one: 'Vanaf $price • $count optie',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'Bekijken';

  @override
  String printfulMerchPayoutTo(String username) {
    return 'Uitbetaling aan: $username';
  }

  @override
  String get printfulMerchPayoutToYou => 'Uitbetaling aan: jou';

  @override
  String get printfulMerchPayoutChangeButton => 'Wijzigen';

  @override
  String get printfulMerchPayoutDialogTitle => 'Uitbetalingsontvanger';

  @override
  String get printfulMerchPayoutDialogBody =>
      'Stuur het aandeel van deze bestellingopbrengst van dit item naar een andere gebruiker in plaats van naar jezelf -- diegene moet eerst een eigen Stripe-account koppelen en de onboarding voltooien voordat iemand het kan kopen.';

  @override
  String get printfulMerchPayoutUsernameHint => 'Gebruikersnaam';

  @override
  String get printfulMerchPayoutLookupButton => 'Opzoeken';

  @override
  String get printfulMerchPayoutUserNotFound =>
      'Geen gebruiker gevonden met die naam.';

  @override
  String printfulMerchPayoutResolvedAs(String username) {
    return 'Gevonden: $username';
  }

  @override
  String get printfulMerchPayoutResetButton => 'Terugzetten naar mij';

  @override
  String get printfulMerchCartTooltip => 'Winkelwagen';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productName toegevoegd aan winkelwagen';
  }

  @override
  String get printfulMerchQuantityLabel => 'Aantal';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Aantal verlagen';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Aantal verhogen';

  @override
  String get printfulMerchAddToCartButton => 'In winkelwagen';

  @override
  String get printfulMerchOptionLabel => 'Optie';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Stijl';

  @override
  String get printfulMerchSizeLabel => 'Maat';

  @override
  String get printfulMerchYourCartTitle => 'Jouw winkelwagen';

  @override
  String get printfulMerchCartEmpty => 'Je winkelwagen is leeg.';

  @override
  String get printfulMerchSubtotalLabel => 'Subtotaal';

  @override
  String get printfulMerchCheckoutLabel => 'Afrekenen';

  @override
  String get printfulMerchRemoveFromCartTooltip =>
      'Uit winkelwagen verwijderen';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Vul eerst je verzendadres in.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'Kon geen verzendtarieven ophalen voor dat adres.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'Kon afrekenen niet starten. Probeer het straks opnieuw.';

  @override
  String get printfulMerchOrderPlaced => 'Bestelling geplaatst!';

  @override
  String get printfulMerchOrderPending =>
      'Nog steeds wachtend op die betaling -- de bestelling wordt geplaatst zodra deze is voltooid.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Verzendsnelheid';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max werkdagen';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => 'Verzendkosten opvragen';

  @override
  String get printfulMerchPayButton => 'Betalen';

  @override
  String get kodaMarketplaceTitle => 'Koda Marketplace';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Abonnementen';

  @override
  String get kodaMarketplaceTabBoosts => 'Boosts';

  @override
  String get kodaMarketplaceTabDiscover => 'Ontdekken';

  @override
  String get kodaMarketplaceTierFreeName => 'Gratis';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'Verloopt $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks =>
      'Upgrade voor exclusieve voordelen';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count boosttokens beschikbaar',
      one: '$count boosttoken beschikbaar',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Geef een token cadeau aan elke server waar je lid van bent, via het tabblad Serverbank';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => 'Eigen avatarkader';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Spark-badge op profiel';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Hogere uploadlimiet voor bestanden (50MB)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality =>
      'Prioriteit voor spraakkwaliteit';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'Alles uit Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => 'Geanimeerd avatarkader';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Pulse-badge op profiel';

  @override
  String get kodaMarketplacePulsePerkFileLimit => 'Uploadlimiet van 100MB';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      '1 serverboosttoken per maand';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/mnd';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Huidig abonnement';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'Kies $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return '$name cadeau doen';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return '$tier cadeau doen';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'Abonneren op $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel => 'Gebruikersnaam ontvanger:';

  @override
  String get kodaMarketplaceUsernameHint => 'Gebruikersnaam';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Abonnement';

  @override
  String get kodaMarketplaceTotalLabel => 'Totaal';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Betaling veilig verwerkt door Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'Doorgaan naar betaling';

  @override
  String get kodaMarketplaceUserNotFound => 'Gebruiker niet gevonden';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'Kon afrekenen niet starten. Probeer het straks opnieuw.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'Abonnement actief!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'Nog steeds wachtend op die betaling -- het wordt geactiveerd zodra deze is voltooid.';

  @override
  String get kodaMarketplaceBoostPurchased => 'Boost gekocht!';

  @override
  String get kodaMarketplaceBoostPending =>
      'Nog steeds wachtend op die betaling -- de boost is klaar zodra deze is voltooid.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count beschikbaar';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Een boost kopen';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'Een eenmalige aankoop -- Pulse-abonnees krijgen ook elke verlenging een gratis token, wat de betere deal blijft als je regelmatig boost.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Boost kopen -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Nog geen servers hebben zich aangemeld bij de Koda Marketplace. Servereigenaren kunnen dit inschakelen bij de aanpassingsinstellingen van hun server.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => 'UITGELICHT DEZE WEEK';

  @override
  String get kodaMarketplaceAllListedServersHeader => 'ALLE VERMELDE SERVERS';

  @override
  String get kodaMarketplaceFeaturedItemsHeader => 'UITGELICHTE ITEMS';

  @override
  String get kodaMarketplaceAllItemsHeader => 'ALLE ITEMS';

  @override
  String get kodaMarketplaceServerFallback => 'Server';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count leden',
      one: '$count lid',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceVisitStore => 'Winkel bezoeken';

  @override
  String get calendarFallbackTitle => 'Kalender';

  @override
  String get calendarAskVispTooltip => 'Vraag het Visp';

  @override
  String get calendarCreateEventTooltip => 'Evenement aanmaken';

  @override
  String get calendarPreviousMonthTooltip => 'Vorige maand';

  @override
  String get calendarNextMonthTooltip => 'Volgende maand';

  @override
  String get calendarTodayButton => 'Vandaag';

  @override
  String get calendarWeekdaySun => 'Zo';

  @override
  String get calendarWeekdayMon => 'Ma';

  @override
  String get calendarWeekdayTue => 'Di';

  @override
  String get calendarWeekdayWed => 'Wo';

  @override
  String get calendarWeekdayThu => 'Do';

  @override
  String get calendarWeekdayFri => 'Vr';

  @override
  String get calendarWeekdaySat => 'Za';

  @override
  String get calendarTodaySuffix => ', vandaag';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count evenementen',
      one: ', $count evenement',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'Kies een dag';

  @override
  String get calendarNoEvents => 'Geen evenementen';

  @override
  String get calendarSubscribeTooltip => 'Abonneren';

  @override
  String get calendarUnsubscribeTooltip => 'Abonnement opzeggen';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'Herhaalt $recurrence';
  }

  @override
  String get calendarTicketOwned => 'Ticket in bezit';

  @override
  String calendarTicketPrice(String price) {
    return 'Ticket $price';
  }

  @override
  String get calendarDeleteEventTitle => 'Evenement verwijderen';

  @override
  String calendarDeleteEventConfirm(String title) {
    return '\"$title\" verwijderen? Dit kan niet ongedaan worden gemaakt.';
  }

  @override
  String get calendarEditEventTitle => 'Evenement bewerken';

  @override
  String get calendarCreateEventTitle => 'Evenement aanmaken';

  @override
  String get calendarEventTitleHint => 'Titel evenement';

  @override
  String get calendarDescriptionHint => 'Beschrijving (optioneel)';

  @override
  String get calendarLocationHint => 'Locatie (optioneel)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Begin ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Startdatum en -tijd, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'Einde — optioneel ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'Einddatum en -tijd, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'niet ingesteld';

  @override
  String get calendarTapToSetEndTime => 'Tik om eindtijd in te stellen';

  @override
  String get calendarRecurrenceLabel => 'Herhaling';

  @override
  String get calendarRecurrenceNone => 'Herhaalt niet';

  @override
  String get calendarRecurrenceDaily => 'Dagelijks';

  @override
  String get calendarRecurrenceWeekly => 'Wekelijks';

  @override
  String get calendarRecurrenceMonthly => 'Maandelijks';

  @override
  String get calendarColorLabel => 'Kleur';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Kleur $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Ticketprijs — optioneel';

  @override
  String get calendarLinkStageChannelLabel =>
      'Koppelen aan podiumkanaal — optioneel';

  @override
  String get calendarStageChannelFallback => 'podium';

  @override
  String get discordImportFetchError => 'Kon sjabloon niet ophalen.';

  @override
  String get discordImportApplyError =>
      'Sjabloon toepassen is mislukt. Probeer het opnieuw.';

  @override
  String get discordImportTitle => 'Discord-sjabloon importeren';

  @override
  String get discordImportDescription =>
      'Plak een discord.new-link of sjablooncode om rollen, categorieën en kanalen in deze server te importeren.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 of sjablooncode';

  @override
  String get discordImportPreviewButton => 'Voorbeeld';

  @override
  String get discordImportTemplateFallback => 'Sjabloon';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rollen',
      one: '$count rol',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categorieën',
      one: '$count categorie',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kanalen',
      one: '$count kanaal',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel =>
      'BESTAANDE STRUCTUUR VERVANGEN';

  @override
  String get discordImportReplaceWarning =>
      'Alle bestaande kanalen, categorieën en rollen worden permanent verwijderd.';

  @override
  String get discordImportAddDescription =>
      'Het sjabloon wordt toegevoegd aan je bestaande serverstructuur.';

  @override
  String get discordImportReplaceConfirmTitle => 'Serverstructuur vervangen?';

  @override
  String get discordImportReplaceConfirmBody =>
      'Dit verwijdert vóór het importeren permanent ALLE bestaande kanalen, categorieën en rollen. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get discordImportYesReplace => 'Ja, vervangen';

  @override
  String get discordImportReplaceAndImportButton =>
      'Vervangen & sjabloon importeren';

  @override
  String get discordImportAddToServerButton => 'Sjabloon aan server toevoegen';

  @override
  String get thresholdModConfigureTitle => 'Drempelmoderatie instellen';

  @override
  String get thresholdModConfigureExplanation =>
      'Kies vertrouwde moderators en hoeveel van hen het eens moeten zijn voordat een van hen één epoch van de geschiedenis van een kanaal kan ontsleutelen. Zelfs jij krijgt geen unilaterale sleutel -- je bent alleen uitgezonderd als je ook op deze lijst staat.';

  @override
  String get thresholdModThresholdLabel => 'Drempel:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Drempel verlagen';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Drempel verhogen';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'van $count moderators',
      one: 'van $count moderator',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle =>
      'Drempelontsleuteling aanvragen';

  @override
  String get thresholdModChannelLabel => 'Kanaal';

  @override
  String get thresholdModReasonHint =>
      'Reden -- zichtbaar voor elke aangewezen moderator';

  @override
  String get thresholdModRequestButton => 'Aanvragen';

  @override
  String get thresholdModShareRelayed => 'Deel doorgestuurd naar de aanvrager.';

  @override
  String get thresholdModNotEnoughShares =>
      'Nog niet genoeg delen doorgestuurd -- probeer het opnieuw zodra meer moderators de hunne hebben doorgestuurd.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count berichten',
      one: '$count bericht',
    );
    return 'Epoch $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'Geen te ontsleutelen berichten in deze epoch.';

  @override
  String get thresholdModExplanation =>
      'Echte ontsleuteling van de geschiedenis van een kanaal, alleen mogelijk als meerdere aangewezen moderators actief instemmen -- nooit één persoon alleen, zelfs de servereigenaar niet. Ontgrendelt altijd één hele epoch (alles verstuurd sinds de laatste ledenwijziging), nooit één enkel bericht.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Ingeschakeld -- $count moderators, drempel $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'Niet ingesteld';

  @override
  String get thresholdModReconfigureButton => 'Opnieuw instellen';

  @override
  String get thresholdModEnableButton => 'Inschakelen';

  @override
  String get thresholdModNotEnabledForServer =>
      'Drempelmoderatie is niet ingeschakeld voor deze server.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Ingeschakeld voor deze server. Jij bent niet een van de aangewezen moderators.';

  @override
  String get thresholdModRequestsLabel => 'Verzoeken';

  @override
  String get thresholdModRequestDecryptButton => 'Ontsleuteling aanvragen';

  @override
  String get thresholdModNoActiveRequests => 'Geen actieve verzoeken.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- epoch $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'in behandeling';

  @override
  String get thresholdModStatusApproved => 'goedgekeurd';

  @override
  String get thresholdModApproveButton => 'Goedkeuren';

  @override
  String get thresholdModRelayShareButton => 'Mijn deel doorsturen';

  @override
  String get thresholdModTryReconstructButton => 'Reconstructie proberen';

  @override
  String get roleSelectNoRolesAvailable =>
      'Geen zelf toe te wijzen rollen beschikbaar.';

  @override
  String get roleSelectInstructions =>
      'Selecteer de rollen die je wilt. Tik op een rol om deze toe te voegen of te verwijderen.';

  @override
  String get rulesScreenAcceptError =>
      'Kon regels niet accepteren. Probeer het opnieuw.';

  @override
  String get rulesScreenSubtitle => 'Serverregels';

  @override
  String get rulesScreenScrollToRead =>
      'Scroll naar beneden om alle regels te lezen';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'Door op Accepteren te klikken, ga je akkoord met het naleven van deze regels.\nOvertredingen kunnen leiden tot verwijdering van de server.';

  @override
  String get rulesScreenAcceptButton => 'Ik accepteer de regels';

  @override
  String get rulesScreenReadAllToContinue => 'Lees alle regels om door te gaan';

  @override
  String get galleryNewPostTitle => 'Nieuw bericht';

  @override
  String get galleryChooseFileButton => 'Bestand kiezen';

  @override
  String get galleryOrDivider => 'of';

  @override
  String get galleryPasteUrlHint => 'Plak afbeeldings-/video-URL';

  @override
  String get galleryTypeLabel => 'Type';

  @override
  String get galleryImageOption => 'Afbeelding';

  @override
  String get galleryVideoOption => 'Video';

  @override
  String get galleryCaptionHint => 'Bijschrift (optioneel)';

  @override
  String get galleryPostButton => 'Plaatsen';

  @override
  String get galleryNewCollectionTitle => 'Nieuwe collectie';

  @override
  String get galleryCollectionNameHint => 'Naam collectie';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return '\"$collectionName\" verwijderen? Berichten hierin komen los te staan.';
  }

  @override
  String get galleryFeedTab => 'Feed';

  @override
  String get galleryCollectionsTab => 'Collecties';

  @override
  String get galleryNoPostsYet => 'Nog geen berichten';

  @override
  String get galleryNoCollectionsYet => 'Nog geen collecties';

  @override
  String get gallerySelectACollection => 'Kies een collectie';

  @override
  String get galleryNoPostsInCollection => 'Geen berichten in deze collectie';

  @override
  String get galleryAddPostButton => 'Bericht toevoegen';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Scherm delen is mislukt: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return 'Volume van $username';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'Heeft alleen invloed op wat jij hoort -- dit apparaat, dit gesprek.';

  @override
  String get voiceScreenResetVolumeButton => 'Resetten';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'Kon niet verbinden: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Jouw scherm, tik voor volledig scherm';

  @override
  String get voiceScreenYourScreenLabel => 'Jouw scherm';

  @override
  String get voiceScreenTapToClose => 'Tik om te sluiten';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (jij)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', aan het praten';

  @override
  String get voiceScreenCameraOnSuffix => ', camera aan';

  @override
  String get voiceScreenActivateToPopOut => ', activeer om los te maken';

  @override
  String get voiceScreenShowVarmTooltip => 'VARM tonen';

  @override
  String get voiceScreenHideVarmTooltip => 'VARM verbergen';

  @override
  String get voiceScreenShowChatTooltip => 'Chat tonen';

  @override
  String get voiceScreenHideChatTooltip => 'Chat verbergen';

  @override
  String get voiceScreenStartCameraTooltip => 'Camera starten';

  @override
  String get voiceScreenStopCameraTooltip => 'Camera stoppen';

  @override
  String get voiceScreenShareScreenTooltip => 'Scherm delen';

  @override
  String get voiceScreenStopSharingTooltip => 'Delen stoppen';

  @override
  String get voiceScreenPopOutTooltip => 'Spraak losmaken in apart venster';

  @override
  String get voiceScreenCouldNotPopOut => 'Kon spraak niet losmaken.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Spraakkanaal verlaten';

  @override
  String get voiceScreenPinTooltip => 'Vastzetten (open houden)';

  @override
  String get voiceScreenUnpinTooltip => 'Losmaken';

  @override
  String get voiceScreenSizeSmall => 'Klein (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Middel (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Groot (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, $count verbonden';
  }

  @override
  String get voiceBarSpeakingSuffix => ', je bent aan het praten';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count verbonden · tik om uit te klappen';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Camera starten';

  @override
  String get voiceBarStopCameraTooltip => 'Camera stoppen';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Spraakkanaal verlaten';

  @override
  String get popOutVideoFallbackTitle => 'Spraak';

  @override
  String get popOutVideoMissingTokenError => 'Ontbrekende token of URL';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Verbinding time-out na 15 seconden';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Fout: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'Geen deelnemers';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Podium';

  @override
  String get stageCouldNotJoin => 'Kon niet deelnemen aan podium.';

  @override
  String get stageThisStageFallback => 'Dit podium';

  @override
  String get stageRequiresTicketToJoin => 'vereist een ticket om deel te nemen';

  @override
  String get stagePleaseWaitLabel => 'Even geduld...';

  @override
  String get stageGetFreeTicketButton => 'Gratis ticket ophalen';

  @override
  String stageBuyTicketButton(String price) {
    return 'Ticket kopen -- $price';
  }

  @override
  String get stageNotNowButton => 'Niet nu';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'Kon ticketaankoop niet starten.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'Nog steeds wachtend op die betaling -- probeer opnieuw deel te nemen zodra deze is bevestigd.';

  @override
  String get stageSpeakerBadge => 'Spreker';

  @override
  String get stageListenerBadge => 'Luisteraar';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'Kon niet deelnemen: $error';
  }

  @override
  String get stageSpeakersHeader => 'SPREKERS';

  @override
  String get stageRaisedHandsHeader => 'OPGESTOKEN HANDEN';

  @override
  String get stageAllowButton => 'Toestaan';

  @override
  String get stageIgnoreButton => 'Negeren';

  @override
  String get stageListenersHeader => 'LUISTERAARS';

  @override
  String get stageRaiseHandTooltip => 'Hand opsteken';

  @override
  String get stageLowerHandTooltip => 'Hand laten zakken';

  @override
  String get stageLeaveStageTooltip => 'Podium verlaten';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (jij)';
  }

  @override
  String get stageMoveToListenersButton => 'Verplaatsen naar luisteraars';

  @override
  String get stageYouFallbackName => 'Jij';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'Avatar van $username';
  }

  @override
  String get channelEditDialogNewTitle => 'Nieuw kanaal';

  @override
  String get channelEditDialogEditTitle => 'Kanaal bewerken';

  @override
  String get channelEditDialogNameHint => 'Kanaalnaam';

  @override
  String get channelEditDialogDescriptionHint => 'Onderwerp (optioneel)';

  @override
  String get channelEditDialogTypeLabel => 'Type';

  @override
  String get channelEditDialogTypeText => 'Tekst';

  @override
  String get channelEditDialogTypeVoice => 'Spraak';

  @override
  String get channelEditDialogTypeGallery => 'Galerij';

  @override
  String get channelEditDialogTypeStage => 'Podium';

  @override
  String get channelEditDialogTypeRules => 'Regels';

  @override
  String get channelEditDialogTypeRoleSelection => 'Rolselectie';

  @override
  String get channelEditDialogTypeCalendar => 'Kalender';

  @override
  String get channelEditDialogAnnouncementTitle => 'Aankondigingskanaal';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Alleen leden die berichten kunnen beheren mogen hier plaatsen';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Plaats hier livestream- en uploadaankondigingen';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'Plaatst automatisch een bericht wanneer een lid met de rechten \"Aankondigen bij live gaan\" live gaat op Twitch, of een nieuwe YouTube-video plaatst';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Stel deze rollen op de hoogte bij plaatsing (optioneel)';

  @override
  String get channelEditDialogSlowmodeLabel => 'Slowmode';

  @override
  String get channelEditDialogSlowmodeOff => 'Uit';

  @override
  String get channelEditDialogUserLimitLabel => 'Gebruikerslimiet';

  @override
  String get channelEditDialogUserLimitOff => 'Geen limiet';

  @override
  String get channelEditDialogCategoryLabel => 'Categorie';

  @override
  String get channelEditDialogNoCategory => 'Geen categorie';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Roltoegang (leeg laten voor iedereen)';

  @override
  String get channelEditDialogContentLabelsLabel => 'Inhoudslabels';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Markeert dit kanaal voor de inhoudsfilters van leden; volledig geblokkeerd voor begeleide accounts';

  @override
  String get categoryEditDialogNewTitle => 'Nieuwe categorie';

  @override
  String get categoryEditDialogEditTitle => 'Categorie bewerken';

  @override
  String get categoryEditDialogNameHint => 'Naam categorie';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Roltoegang (leeg laten voor iedereen)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Leden — $count online';
  }

  @override
  String get memberPanelRefreshTooltip => 'Ledenlijst vernieuwen';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count leden',
      one: '$count lid',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Offline';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', $tier-niveau';
  }

  @override
  String get memberPanelUnknownUser => 'Onbekend';

  @override
  String get memberPanelModerationActionsTooltip => 'Moderatieacties';

  @override
  String get reportDialogReasonSpam => 'Spam';

  @override
  String get reportDialogReasonHarassment => 'Intimidatie of misbruik';

  @override
  String get reportDialogReasonIllegal => 'Illegale inhoud';

  @override
  String get reportDialogReasonOther => 'Anders';

  @override
  String get reportDialogReasonLabel => 'Reden';

  @override
  String get reportDialogNoteHint =>
      'Nog iets wat moderators moeten weten? (optioneel)';

  @override
  String get reportDialogDisclosureNote =>
      'De berichtinhoud die aan jou wordt getoond en wie het heeft verstuurd, wordt gedeeld met de moderators van deze server.';

  @override
  String get reportDialogSubmitButton => 'Melding indienen';

  @override
  String get reportDialogSubmitError => 'Kon melding niet indienen.';

  @override
  String get notificationBellTitle => 'Meldingen';

  @override
  String get notificationBellMarkAllRead => 'Alles als gelezen markeren';

  @override
  String get notificationBellEmptyState => 'Nog geen meldingen';

  @override
  String get notificationBellUnreadLabel => 'Ongelezen';

  @override
  String get invitePreviewTitle => 'Serveruitnodiging';

  @override
  String get invitePreviewInvalidOrExpired =>
      'Ongeldige of verlopen uitnodiging.';

  @override
  String get invitePreviewCouldNotJoin => 'Kon niet deelnemen aan server.';

  @override
  String get invitePreviewUnknownServer => 'Onbekende server';

  @override
  String get shippingAddressFullNameHint => 'Volledige naam';

  @override
  String get shippingAddressLine1Hint => 'Adresregel 1';

  @override
  String get shippingAddressLine2Hint => 'Adresregel 2 (optioneel)';

  @override
  String get shippingAddressCityHint => 'Plaats';

  @override
  String get shippingAddressStateHint => 'Provincie/staat';

  @override
  String get shippingAddressZipHint => 'Postcode';

  @override
  String get shippingAddressCountryCodeHint => 'Landcode (bijv. NL)';

  @override
  String get shippingAddressPhoneHint => 'Telefoon (optioneel)';

  @override
  String get shippingAddressPrivacyNote =>
      'Wordt alleen gebruikt om deze bestelling te verzenden -- zie het privacybeleid van Printful voor hoe zij ermee omgaan zodra de bestelling is geplaatst.';

  @override
  String get updateNudgeAvailableTitle => 'Update beschikbaar';

  @override
  String get updateNudgeRequiredTitle => 'Update vereist';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $version is beschikbaar -- je gebruikt een oudere versie.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'Deze versie wordt niet meer ondersteund. Update naar Koda $version om Koda te blijven gebruiken.';
  }

  @override
  String get updateNudgeLaterButton => 'Later';

  @override
  String get tierBadgeSparkSubscriber => 'Spark-abonnee';

  @override
  String get tierBadgePulseSubscriber => 'Pulse-abonnee';

  @override
  String get vispAvatarInDevelopment => 'IN ONTWIKKELING';

  @override
  String get vispBoostAdvisorCouldNotAnswer =>
      'Visp kon geen antwoord samenstellen.';

  @override
  String get vispBoostAdvisorTitle => 'Vraag het Visp: Boost ROI-adviseur';

  @override
  String get vispBoostAdvisorFollowUpHint => 'Stel een vervolgvraag...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Versturen';

  @override
  String get vispBoostAdvisorBasedOn => 'Gebaseerd op:';

  @override
  String get vispEventDialogCouldNotGenerate =>
      'Visp kon geen evenement genereren.';

  @override
  String get vispEventDialogCouldNotCreate =>
      'Kon dat evenement niet aanmaken.';

  @override
  String get vispEventDialogRecurrenceNone => 'Eenmalig';

  @override
  String get vispEventDialogRecurrenceDaily => 'Herhaalt dagelijks';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Herhaalt wekelijks';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Herhaalt maandelijks';

  @override
  String get vispEventDialogTitle => 'Vraag Visp een evenement aan te maken';

  @override
  String get vispEventDialogDescription =>
      'Beschrijf het evenement -- Visp stelt een titel, datum/tijd en overige details voor.';

  @override
  String get vispEventDialogPromptHint =>
      'bijv. \"Wekelijkse D&D-sessie elke vrijdag om 19:00 uur, ongeveer 3 uur\"';

  @override
  String get vispEventDialogPrivacyNote =>
      'Je beschrijving wordt naar Visp gestuurd (een zelf-gehoste assistent -- niets verlaat de servers van Koda) om dit plan te genereren.';

  @override
  String get vispEventDialogStartOver => 'Opnieuw beginnen';

  @override
  String get vispEventDialogCreateEvent => 'Evenement aanmaken';

  @override
  String get vispEventDialogThinking => 'Aan het nadenken...';

  @override
  String get vispEventDialogGeneratePlan => 'Plan genereren';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'Kon geen datum herkennen -- probeer het anders te formuleren';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Eindigt $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price per ticket';
  }

  @override
  String get vispEventDialogBasedOn => 'Gebaseerd op:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Vraag $questionNumber van $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'Of typ je eigen antwoord...';

  @override
  String get vispQuestionStepSendTooltip => 'Versturen';

  @override
  String get vispQuestionStepSkip => 'Overslaan en nu genereren';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp kon geen plan genereren.';

  @override
  String get vispSetupDialogCouldNotApplyPlan => 'Kon dat plan niet toepassen.';

  @override
  String get vispSetupDialogTitleNew => 'Beschrijf je server aan Visp';

  @override
  String get vispSetupDialogTitleExisting =>
      'Vraag Visp iets toe te voegen aan deze server';

  @override
  String get vispSetupDialogDescriptionNew =>
      'Beschrijf de server die je wilt -- Visp stelt een naam en een set rollen, categorieën en kanalen voor.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Beschrijf wat je wilt toevoegen -- Visp stelt rollen, categorieën en kanalen voor om aan te maken.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'bijv. \"Een gezellige server voor mijn D&D-groep met spraakkanalen voor twee tafels\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'bijv. \"Voeg nog een paar kanalen toe voor onze raidteams\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      'Je beschrijving wordt naar Visp gestuurd (een zelf-gehoste assistent -- niets verlaat de servers van Koda) om dit plan te genereren.';

  @override
  String get vispSetupDialogStartOver => 'Opnieuw beginnen';

  @override
  String get vispSetupDialogCreateServer => 'Server aanmaken';

  @override
  String get vispSetupDialogAddToServer => 'Toevoegen aan server';

  @override
  String get vispSetupDialogThinking => 'Aan het nadenken...';

  @override
  String get vispSetupDialogGeneratePlan => 'Plan genereren';

  @override
  String get vispSetupDialogNewServerLabel => 'Nieuwe server';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rollen',
      one: '$count rol',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categorieën',
      one: '$count categorie',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kanalen',
      one: '$count kanaal',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'Gebaseerd op:';

  @override
  String get childLockoutTitle => 'Dit valt buiten je toegestane uren';

  @override
  String get childLockoutBody =>
      'Een ouder of voogd heeft tijden ingesteld waarop dit account Koda mag gebruiken. Vraag om meer tijd, of kom terug tijdens je volgende toegestane periode.';

  @override
  String get childLockoutLogOutButton => 'Uitloggen';

  @override
  String get forcePasswordChangeError =>
      'Kon wachtwoord niet bijwerken. Probeer het opnieuw.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Welkom, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Je account heeft een nieuw wachtwoord nodig voordat je verder kunt.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'Nieuw wachtwoord';

  @override
  String get forcePasswordChangeConfirmPasswordHint =>
      'Bevestig nieuw wachtwoord';

  @override
  String get forcePasswordChangeReqLength => 'Minstens 12 tekens';

  @override
  String get forcePasswordChangeReqUpper => 'Eén hoofdletter';

  @override
  String get forcePasswordChangeReqLower => 'Eén kleine letter';

  @override
  String get forcePasswordChangeReqDigit => 'Eén cijfer';

  @override
  String get forcePasswordChangeReqMatch => 'Wachtwoorden komen overeen';

  @override
  String get forcePasswordChangeSubmitButton => 'Nieuw wachtwoord instellen';

  @override
  String get forgotPasswordEnterEmailError => 'Voer je e-mailadres in.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'Als dat account bestaat, is er een resetcode verstuurd.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Voer de code in en een wachtwoord van minstens 8 tekens.';

  @override
  String get forgotPasswordInvalidCode => 'Ongeldige of verlopen code.';

  @override
  String get forgotPasswordTitle => 'Wachtwoord opnieuw instellen';

  @override
  String get forgotPasswordEmailHint => 'E-mailadres';

  @override
  String get forgotPasswordSendCodeButton => 'Resetcode versturen';

  @override
  String get forgotPasswordCodeHint => '6-cijferige code';

  @override
  String get forgotPasswordNewPasswordHint => 'Nieuw wachtwoord';

  @override
  String get forgotPasswordSetNewPasswordButton => 'Nieuw wachtwoord instellen';

  @override
  String get verifyEmailEnterCodeError =>
      'Voer de 6-cijferige code uit je e-mail in.';

  @override
  String get verifyEmailInvalidCode => 'Ongeldige of verlopen code.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'Er is een nieuwe code verstuurd naar $email.';
  }

  @override
  String get verifyEmailResendFailed => 'Kon nu niet opnieuw versturen.';

  @override
  String get verifyEmailTitle => 'Controleer je e-mail';

  @override
  String verifyEmailSentCode(String email) {
    return 'We hebben een 6-cijferige code gestuurd naar $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'E-mail verifiëren';

  @override
  String get verifyEmailResendButton => 'Code opnieuw versturen';

  @override
  String get safetyNumberKeysNotSetUp =>
      'Je eigen sleutels zijn nog niet ingesteld.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName heeft nog geen sleutelbundel.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'Kon veiligheidsnummer niet berekenen: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName heeft dat apparaat niet meer.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'Veiligheidsnummer met $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Vergelijk dit nummer met $peerName via een ander kanaal -- persoonlijk, telefonisch, waar dan ook behalve dit gesprek. Komt het aan beide kanten overeen, dan praat je met wie je denkt dat je praat.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName heeft $count apparaten, elk met een eigen veiligheidsnummer -- het verifiëren van één dekt de andere niet.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Apparaat $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Markeren als geverifieerd';

  @override
  String get contentFiltersDescription =>
      'Servers kunnen kanalen markeren met inhoudslabels. Kies hoe gelabelde kanalen zich moeten gedragen -- dit is jouw eigen voorkeur en heeft nooit invloed op wat anderen zien.';

  @override
  String get contentFiltersLabelAdult => 'Content voor volwassenen';

  @override
  String get contentFiltersLabelSuggestive => 'Suggestief';

  @override
  String get contentFiltersLabelGraphic => 'Grafische media';

  @override
  String get contentFiltersLabelNudity => 'Niet-seksuele naaktheid';

  @override
  String get contentFiltersDescAdult => 'Seksueel expliciete content';

  @override
  String get contentFiltersDescSuggestive =>
      'Seksueel suggestieve maar niet expliciete content';

  @override
  String get contentFiltersDescGraphic => 'Geweld of gore';

  @override
  String get contentFiltersDescNudity =>
      'Naaktheid in een niet-seksuele context';

  @override
  String get contentFiltersHide => 'Verbergen';

  @override
  String get contentFiltersWarn => 'Waarschuwen';

  @override
  String get contentFiltersShow => 'Tonen';

  @override
  String get deviceTestCouldNotGetToken => 'Kon geen testtoken ophalen.';

  @override
  String get deviceTestLabelTest => 'Testen';

  @override
  String get deviceTestLabelRecording => 'Bezig met opnemen...';

  @override
  String get deviceTestLabelPlayingBack => 'Bezig met afspelen...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'Kon camera niet starten: $error';
  }

  @override
  String get deviceTestTitle => 'Apparaten testen';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'Kon niet verbinden: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Microfoon';

  @override
  String get deviceTestHearYourselfLabel => 'Jezelf horen (vertraagd)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Luidspreker / uitvoer';

  @override
  String get deviceTestCameraLabel => 'Camera';

  @override
  String get deviceTestSystemDefault => 'Systeemstandaard';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Praat, en hoor daarna een fragment van ${seconds}s teruggespeeld';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '${seconds}s';
  }

  @override
  String get deviceTestCameraPreviewOff => 'Cameravoorbeeld uit';

  @override
  String get deviceTestStopCameraButton => 'Camerates stoppen';

  @override
  String get deviceTestTestCameraButton => 'Camera testen';

  @override
  String get deviceTestInputLevelLabel => 'Invoerniveau';

  @override
  String get devicesScreenRemoveConfirmTitle => 'Dit apparaat verwijderen?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'Het moet opnieuw inloggen, en berichten die ernaartoe zijn gestuurd terwijl het verwijderd was, komen er daarna niet meer aan -- Double Ratchet-sessies vullen hiaten niet met terugwerkende kracht aan.';

  @override
  String get devicesScreenRemoveFailed => 'Kon dat apparaat niet verwijderen.';

  @override
  String get devicesScreenNeverActive => 'Nooit actief';

  @override
  String devicesScreenActiveDate(String date) {
    return 'Actief $date';
  }

  @override
  String get devicesScreenDescription =>
      'Elk apparaat waarop je inlogt heeft zijn eigen versleutelingsidentiteit -- een bericht dat naar jou wordt gestuurd bereikt elk apparaat hieronder. Verwijder een apparaat dat je niet gebruikt of niet herkent.';

  @override
  String get devicesScreenNoDevicesFound => 'Geen apparaten gevonden.';

  @override
  String get devicesScreenUnknownDevice => 'Onbekend apparaat';

  @override
  String get devicesScreenThisDeviceBadge => 'Dit apparaat';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Apparaat verwijderen';

  @override
  String get totpSetupInvalidCode => 'Ongeldige code. Probeer het opnieuw.';

  @override
  String get totpSetupEnabledMessage => 'Tweestapsverificatie is ingeschakeld.';

  @override
  String get totpSetupScanInstructions =>
      'Scan dit geheim in je authenticator-app (Google Authenticator, 1Password, Authy):';

  @override
  String get totpSetupCodeHint => 'Voer 6-cijferige code in om te bevestigen';

  @override
  String get totpSetupVerifyButton => 'Verifiëren & inschakelen';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'Push-to-talk';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'Druk op een toets om deze te koppelen...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Apparaten testen';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Spraakverwerking';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'Ruisonderdrukking';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Achtergrondgeluid op je microfoon verminderen';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Geavanceerde ruisonderdrukking (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'Realtime AI-ruisverwijdering, sterker dan standaard onderdrukking -- vervangt deze wanneer ingeschakeld';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'Echo-onderdrukking';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Voorkom dat je eigen geluid terugkaatst als echo';

  @override
  String get voiceVideoSettingsAutoGainTitle =>
      'Automatische versterkingsregeling';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Balanceert automatisch het microfoonvolume (volumenormalisatie)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'Automatisch dempen';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Verlaagt het volume van andere deelnemers terwijl jij praat';

  @override
  String get voiceVideoSettingsHighPassTitle => 'High-pass filter';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Snijdt laagfrequent gerommel weg (ventilatoren, airco, bureaugestommel)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle => 'Typegeluiddetectie';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Onderdrukt toetsenbordgeklepper dat je microfoon oppikt';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Stemisolatie';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Focust op jouw stem en filtert andere mensen en geluiden in de omgeving eruit';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Microfoonversterking';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Versterking inschakelen';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Voorversterking voor een zachte of afgelegen microfoon -- toegepast vóór de EQ';

  @override
  String get voiceVideoSettingsBandBoost => 'Versterking';

  @override
  String get voiceVideoSettingsSectionMicEq => 'Microfoon-EQ';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'EQ inschakelen';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Vorm je microfoongeluid voordat het bij anderen aankomt';

  @override
  String get voiceVideoSettingsBandBass => 'Bas';

  @override
  String get voiceVideoSettingsBandMid => 'Midden';

  @override
  String get voiceVideoSettingsBandTreble => 'Hoog';

  @override
  String get voiceVideoSettingsSectionVad => 'Spraakactiviteitsdetectie (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'VOX inschakelen';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Zend alleen uit als je daadwerkelijk aan het praten bent';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Gevoeligheid';

  @override
  String get voiceVideoSettingsVadHint =>
      'Lager = pikt zachtere geluiden op. Hoger = alleen luidere spraak start de uitzending.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Gekoppelde toets';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'Niet ingesteld — microfoon blijft actief zodra deze niet gedempt is';

  @override
  String get voiceVideoSettingsClearButton => 'Wissen';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Toets instellen';

  @override
  String get voiceVideoSettingsChangeButton => 'Wijzigen';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'Als er een toets is gekoppeld, zendt je microfoon alleen uit terwijl je die toets ingedrukt houdt. Dit heeft voorrang op VOX zolang je in een spraakkanaal bent.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Virtual Avatar Reactive Model';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Upload twee afbeeldingen die wisselen wanneer je praat. Alleen voor jou zichtbaar.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'Stil';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'Aan het praten';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'Spraakdrempel';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Lager = schakelt makkelijker over naar de pratende afbeelding.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'VARM verwijderen';

  @override
  String get gifPickerNoGifsFound => 'Geen GIF\'s gevonden';

  @override
  String get gifPickerSearchHint => 'GIF\'s zoeken...';

  @override
  String get messageSearchHint => 'Zoek in dit kanaal...';

  @override
  String get messageSearchTooltip => 'Zoeken';

  @override
  String get messageSearchInitialHint =>
      'Doorzoekt berichten die al op dit apparaat zijn geladen -- oudere geschiedenis wordt opgehaald (en lokaal ontsleuteld) terwijl je verder terugbladert.';

  @override
  String get messageSearchNoMatches => 'Geen overeenkomsten';

  @override
  String get messageSearchStartOfHistory => 'Begin van kanaalgeschiedenis';

  @override
  String get messageSearchFurtherBackButton => 'Verder terugzoeken';

  @override
  String get messageSearchUnknownAuthor => 'Onbekend';
}
