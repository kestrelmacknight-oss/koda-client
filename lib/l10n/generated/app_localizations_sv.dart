// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String get commonSave => 'Spara';

  @override
  String get commonEdit => 'Redigera';

  @override
  String get commonDelete => 'Ta bort';

  @override
  String get commonCreate => 'Skapa';

  @override
  String get commonClose => 'Stäng';

  @override
  String get commonDone => 'Klar';

  @override
  String get commonDownload => 'Ladda ner';

  @override
  String get commonDisconnect => 'Koppla från';

  @override
  String get commonNone => 'Ingen';

  @override
  String get commonJoin => 'Gå med';

  @override
  String get commonDismiss => 'Avfärda';

  @override
  String get commonSubmit => 'Skicka';

  @override
  String get commonConfirm => 'Bekräfta';

  @override
  String get commonRemove => 'Ta bort';

  @override
  String get commonRetry => 'Försök igen';

  @override
  String get commonOk => 'OK';

  @override
  String get commonYes => 'Ja';

  @override
  String get commonNo => 'Nej';

  @override
  String get commonSearch => 'Sök';

  @override
  String get commonSettings => 'Inställningar';

  @override
  String get commonLoading => 'Laddar...';

  @override
  String get settingsLanguageSection => 'Språk';

  @override
  String get settingsLanguageTitle => 'Appspråk';

  @override
  String get settingsLanguageSystemDefault => 'Systemets standard';

  @override
  String get settingsLanguageDescription =>
      'Välj vilket språk Kodas eget gränssnitt visas på. Det här är skilt från ett servers huvudspråk eller det språk du skriver meddelanden på.';

  @override
  String get settingsTitle => 'Inställningar';

  @override
  String get settingsSignOut => 'Logga ut';

  @override
  String get settingsSectionMyAccount => 'Mitt konto';

  @override
  String get settingsSectionSecurity => 'Säkerhet';

  @override
  String get settingsSectionAccessibility => 'Tillgänglighet';

  @override
  String get settingsSectionBilling => 'Fakturering';

  @override
  String get settingsSectionFamily => 'Familj';

  @override
  String get settingsSectionVoiceVideo => 'Röst och video';

  @override
  String get settingsSectionDesktop => 'Skrivbord';

  @override
  String get settingsSectionAbout => 'Om';

  @override
  String get settingsTwoFactorTitle => 'Tvåfaktorsautentisering';

  @override
  String get settingsTwoFactorSubtitle =>
      'Lägg till en autentiseringsapp för extra säkerhet';

  @override
  String get settingsLinkedDevicesTitle => 'Länkade enheter';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'Se och ta bort enheter som är inloggade på det här kontot';

  @override
  String get settingsContentFiltersTitle => 'Innehållsfilter';

  @override
  String get settingsContentFiltersSubtitle =>
      'Välj hur du vill att märkt innehåll ska visas';

  @override
  String get settingsDmFriendsOnlyTitle => 'Tillåt endast DM från vänner';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Personer som inte är vänner kan inte starta en ny konversation med dig';

  @override
  String get settingsDmPrivacyError => 'Kunde inte uppdatera DM-sekretessen.';

  @override
  String get settingsShowVispAvatarTitle => 'Visa Visps avatar';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Visar Visps ansikte och humör i dess dialoger för installation, händelser och rådgivning';

  @override
  String get settingsDeleteAccountTitle => 'Radera konto';

  @override
  String get settingsDeleteAccountSubtitle =>
      'Tar bort din personliga information från Koda permanent';

  @override
  String get settingsDeleteAccountWarning =>
      'Detta tar bort din profilinformation permanent och kan inte ångras. Dina tidigare meddelanden kan fortfarande vara synliga för andra, visade som skickade av en raderad användare. Ange ditt lösenord för att bekräfta.';

  @override
  String get settingsDeleteAccountPasswordHint => 'Lösenord';

  @override
  String get settingsDeleteAccountConfirm => 'Radera konto';

  @override
  String get settingsDeleteAccountWrongPassword => 'Felaktigt lösenord.';

  @override
  String get settingsHighContrastTitle => 'Hög kontrast';

  @override
  String get settingsHighContrastSubtitle =>
      'Rent svartvitt, högkontrastfärger i hela appen -- att växla laddar kort om den aktuella skärmen.';

  @override
  String get settingsDyslexiaFontTitle => 'Dyslexivänligt typsnitt';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Byter brödtext till OpenDyslexic i hela appen';

  @override
  String get settingsNewestAtTopTitle => 'Visa senaste meddelanden högst upp';

  @override
  String get settingsNewestAtTopSubtitle =>
      'Gäller kanaler, DM och röstkanalschatt på samma sätt';

  @override
  String get settingsFontSizeTitle => 'Teckenstorlek';

  @override
  String get settingsFontSizeSample =>
      'Flygande bäckasiner söka hwila på mjuka tuvor';

  @override
  String get settingsDensityTitle => 'Densitet';

  @override
  String get settingsDensityDescription =>
      'Påverkar avstånd på standardkontroller -- knappar, växlar, dialogrutor -- inte varje anpassad layout.';

  @override
  String get settingsDensityCompact => 'Kompakt';

  @override
  String get settingsDensityStandard => 'Standard';

  @override
  String get settingsDensityComfortable => 'Bekväm';

  @override
  String get settingsStreamingTitle => 'Streamingkonton';

  @override
  String get settingsStreamingDescription =>
      'Anslut Twitch/YouTube/Kick så att servrar där du har behörigheten \"Meddela vid livesändning\" automatiskt kan publicera när du går live eller laddar upp en ny video.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform ansluten som $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform inte ansluten';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- live nu';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- en ny uppladdning';

  @override
  String get settingsStreamingLiveSuffixKick => ' -- live nu';

  @override
  String get settingsStreamingConnecting => 'Ansluter...';

  @override
  String get settingsStreamingConnect => 'Anslut';

  @override
  String get settingsAnnounceLiveTwitch => 'Meddela när jag går live';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Meddela livesändningar och nya uppladdningar';

  @override
  String get settingsAnnounceLiveKick => 'Meddela när jag går live';

  @override
  String get settingsRefreshStatus =>
      'Redan ansluten i webbläsaren? Uppdatera status';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'Kunde inte starta $platform-anslutningen.';
  }

  @override
  String settingsStreamingConsentRequired(String platform) {
    return 'Be barnets förälder eller vårdnadshavare att först tillåta anslutning av $platform i Föräldrapanelen.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Slutför anslutningen i webbläsaren och kom sedan tillbaka och uppdatera.';

  @override
  String get settingsDeveloperPortalTitle => 'Utvecklarportal';

  @override
  String get settingsDeveloperPortalSubtitle =>
      'Registrera bottar och appar som använder Koda-API:et';

  @override
  String get devPortalScreenTitle => 'Utvecklarportal';

  @override
  String get devPortalNewAppTooltip => 'Ny app';

  @override
  String get devPortalEmptyState =>
      'Inga appar än. Skapa en för att få en API-nyckel till din bot.';

  @override
  String get devPortalNewAppTitle => 'Ny app';

  @override
  String get devPortalAppNameHint => 'Appnamn';

  @override
  String get devPortalAppDescriptionHint => 'Beskrivning (valfritt)';

  @override
  String get devPortalBotUsernameHint => 'Bot-användarnamn';

  @override
  String get devPortalInteractionDataOnlyNote =>
      'Din bot får bara kommandot och alternativen som en användare uttryckligen skickar till den -- aldrig en kanals meddelandehistorik.';

  @override
  String get devPortalCreateError => 'Kunde inte skapa den här appen just nu.';

  @override
  String get devPortalKeyRevealTitle => 'Din API-nyckel';

  @override
  String get devPortalKeyRevealWarning =>
      'Det här är enda gången nyckeln visas. Kopiera den nu -- Koda sparar den inte i återställningsbar form.';

  @override
  String get devPortalCopyKeyTooltip => 'Kopiera nyckel';

  @override
  String get devPortalKeyCopiedToast => 'API-nyckel kopierad.';

  @override
  String get devPortalKeySavedIt => 'Jag har sparat den';

  @override
  String get devPortalRegenerate => 'Generera ny';

  @override
  String get devPortalRegenerateConfirmTitle => 'Generera ny API-nyckel?';

  @override
  String get devPortalRegenerateConfirmBody =>
      'Den nuvarande nyckeln slutar fungera omedelbart -- allt som redan använder den behöver den nya.';

  @override
  String get devPortalDeleteConfirmTitle => 'Ta bort den här appen?';

  @override
  String get devPortalDeleteConfirmBody =>
      'Dess API-nyckel återkallas och bot-kontot inaktiveras. Detta kan inte ångras.';

  @override
  String get devPortalOAuthSectionTitle => 'OAuth2 (Logga in med Koda)';

  @override
  String get devPortalNoRedirectUris => 'Inga redirect-URI:er registrerade än.';

  @override
  String get devPortalEditRedirectUris => 'Redigera redirect-URI:er';

  @override
  String get devPortalEditRedirectUrisTitle => 'Redirect-URI:er';

  @override
  String get devPortalRedirectUrisHelp =>
      'En per rad. En samtyckesbegärans redirect_uri måste matcha exakt en av dessa.';

  @override
  String get devPortalRedirectUrisHint => 'https://example.com/callback';

  @override
  String get devPortalGenerateClientSecret => 'Generera klienthemlighet';

  @override
  String get devPortalRegenerateClientSecret => 'Generera ny klienthemlighet';

  @override
  String devPortalClientSecretEndingIn(String lastFour) {
    return 'Klienthemlighet som slutar på $lastFour';
  }

  @override
  String get oauthConsentTitle => 'Auktorisera app';

  @override
  String get oauthConsentUnknownApp => 'Den här appen kunde inte hittas.';

  @override
  String oauthConsentAllowQuestion(String appName) {
    return 'Tillåt $appName att komma åt ditt Koda-konto?';
  }

  @override
  String get oauthConsentWillBeAbleTo => 'Detta tillåter appen att:';

  @override
  String get oauthConsentAllow => 'Tillåt';

  @override
  String get oauthConsentDeny => 'Neka';

  @override
  String get oauthConsentError => 'Kunde inte slutföra det -- försök igen.';

  @override
  String get commonNext => 'Nästa';

  @override
  String get serverTabBots => 'Bottar';

  @override
  String get botInstallTitle => 'Installera bot';

  @override
  String get botInstallSuccess => 'Bot installerad.';

  @override
  String get botInstallNoEligibleServers =>
      'Du hanterar inga servrar där bottar kan installeras.';

  @override
  String get botInstallSelectServer => 'Installera i';

  @override
  String get botInstallSelectPermissions => 'Behörigheter att bevilja';

  @override
  String get botInstallPermissionsHelp =>
      'Endast behörigheter du själv har kan beviljas -- gråtonade är inte dina att ge bort.';

  @override
  String get botInstallConfirm => 'Installera';

  @override
  String get botsTabDescription =>
      'Bottar installerade i denna server, och vad de får göra.';

  @override
  String get botsTabInstallButton => 'Installera en bot';

  @override
  String get botsTabInstallDialogTitle => 'Installera en bot';

  @override
  String get botsTabClientIdHint => 'Klistra in botens app-ID';

  @override
  String get botsTabEmptyState => 'Inga bottar installerade än.';

  @override
  String get botsTabNoPermissions => 'Inga behörigheter beviljade';

  @override
  String get botsTabUninstall => 'Avinstallera';

  @override
  String get devPortalCommandsSectionTitle => 'Snedstreckskommandon';

  @override
  String get devPortalNoInteractionsUrl =>
      'Ingen interaktions-URL inställd än.';

  @override
  String get devPortalEditInteractionsUrl => 'Redigera interaktions-URL';

  @override
  String get devPortalEditInteractionsUrlTitle => 'Interaktions-URL';

  @override
  String get devPortalInteractionsUrlHelp =>
      'Vart Koda levererar en signerad POST varje gång någon anropar ett av den här appens kommandon. Måste svara inom cirka 3 sekunder.';

  @override
  String get devPortalInteractionsUrlHint =>
      'https://example.com/koda/interactions';

  @override
  String get devPortalGenerateSigningSecret => 'Generera signeringshemlighet';

  @override
  String get devPortalRegenerateSigningSecret =>
      'Generera ny signeringshemlighet';

  @override
  String get homeSlashCommandsTooltip => 'Snedstreckskommandon';

  @override
  String get slashCommandsNoneAvailable =>
      'Inga bottar med kommandon installerade i den här servern.';

  @override
  String get slashCommandsPickerTitle => 'Välj ett kommando';

  @override
  String get slashCommandsRun => 'Kör';

  @override
  String get devPortalEventsSectionTitle => 'Webhook-händelser';

  @override
  String get devPortalEventsSectionHelp =>
      'Koda meddelar den här appens interaktions-URL när en prenumererad händelse inträffar -- aktivera bara det du behöver.';

  @override
  String get devPortalSandboxSection => 'Sandlåda';

  @override
  String get devPortalSandboxCommandLabel => 'Kommandonamn';

  @override
  String get devPortalSandboxOptionsLabel => 'Alternativ (JSON)';

  @override
  String get devPortalSandboxSendInteraction => 'Skicka testinteraktion';

  @override
  String get devPortalSandboxTestEvent => 'Skicka test';

  @override
  String get devPortalSandboxReplyLabel => 'Svar:';

  @override
  String get devPortalSandboxErrorPrefix => 'Fel:';

  @override
  String get devPortalSandboxNotReady =>
      'Ange en interaktions-URL och signeringsnyckel först';

  @override
  String get homeBrowsePublicServersTooltip =>
      'Bläddra bland offentliga servrar';

  @override
  String get homeUpcomingEventsTooltip => 'Kommande evenemang';

  @override
  String get homeActivityFeedTooltip => 'Aktivitetsflöde';

  @override
  String get serverDiscoveryTitle => 'Bläddra Servrar';

  @override
  String get serverDiscoverySearchHint => 'Sök servrar';

  @override
  String get serverDiscoveryEmptyState => 'Inga offentliga servrar hittades.';

  @override
  String get serverDiscoveryMatureBadge => 'VUXET INNEHÅLL';

  @override
  String get serverDiscoveryNoDescription => 'Ingen beskrivning angiven.';

  @override
  String serverDiscoveryMemberCount(int count) {
    return '$count medlemmar';
  }

  @override
  String get serverDiscoveryJoinError => 'Kunde inte gå med i servern';

  @override
  String get serverDiscoveryNotFound =>
      'Den här servern är inte längre tillgänglig.';

  @override
  String get serverDiscoveryJoinButton => 'Gå med i Server';

  @override
  String get serverDiscoveryPreviewChannelsLabel =>
      'Förhandsgranskningskanaler';

  @override
  String get serverDiscoveryPreviewReadOnlyNote =>
      'Du tittar på den här kanalen utan att ha gått med. Gå med i servern för att svara.';

  @override
  String get serverDiscoveryPreviewEmptyState => 'Inga meddelanden än.';

  @override
  String get serverPublicListingLabel => 'Offentlig listning';

  @override
  String get serverListPublicly => 'Lista denna server offentligt';

  @override
  String get serverListPubliclyDescription =>
      'Låt vem som helst hitta och gå med i den här servern via Bläddra Servrar, utan inbjudan.';

  @override
  String get serverDescriptionLabel => 'Beskrivning';

  @override
  String get serverDescriptionHint => 'Vad handlar den här servern om?';

  @override
  String get serverMatureContentLabel => 'Innehåller vuxet innehåll';

  @override
  String get serverRulesGateNote =>
      'Nya medlemmar ser bara din regelkanal (och eventuella förhandsgranskningskanaler) tills de accepterar reglerna.';

  @override
  String get serverMakePublicTitle => 'Göra den här servern offentlig?';

  @override
  String get serverMakePublicBody =>
      'Vem som helst kan hitta och gå med i den här servern utan inbjudan. Se till att din beskrivning är korrekt och att innehållet är korrekt märkt innan du fortsätter.';

  @override
  String get serverMakePublicConfirm => 'Gör Offentlig';

  @override
  String get serverMakePublicNeedsDescription =>
      'Lägg till en beskrivning innan du gör servern offentlig.';

  @override
  String get serverMakePublicGenericError =>
      'Kunde inte uppdatera offentlig listning';

  @override
  String homeFeaturedServerTooltip(String name) {
    return 'Utvald: $name';
  }

  @override
  String get serverRolePriorityHelp =>
      'Dra för att ange vilken roll som visas först när en medlem har fler än en.';

  @override
  String get steamHideUnplayedTitle => 'Dölj ospelade spel?';

  @override
  String steamHideUnplayedBody(int count) {
    return '$count spel i ditt bibliotek har 0 speltid -- demos, gratisspel eller sådant du aldrig kom till. Dölja alla från jämförelsen?';
  }

  @override
  String get steamHideUnplayedConfirm => 'Dölj alla';

  @override
  String steamHideUnplayedButton(int count) {
    return 'Dölj $count ospelade spel';
  }

  @override
  String steamUnresolvedGameLabel(int appId) {
    return 'App $appId';
  }

  @override
  String get steamNeverPlayedLabel => 'Aldrig spelat';

  @override
  String get steamVisibleInComparison => 'Synlig i jämförelsen';

  @override
  String get channelEditDialogTypePreview => 'Offentlig förhandsgranskning';

  @override
  String get channelEditDialogPreviewHelp =>
      'Synlig för alla utan att gå med, om servern är offentlig. Att posta kräver fortfarande att man går med (och accepterar reglerna, om sådana finns).';

  @override
  String get channelEditDialogGeneralSection => 'Allmänt';

  @override
  String get channelEditDialogBehaviorSection => 'Beteende';

  @override
  String get channelEditDialogAccessSection => 'Åtkomst';

  @override
  String get serverThemeLibraryTitle => 'Serverteman';

  @override
  String get serverThemeLibraryEmptyState => 'Inga mallar tillgängliga ännu.';

  @override
  String serverThemeLockedHint(int level) {
    return 'Kräver boostnivå $level';
  }

  @override
  String serverThemePreviewTitle(String name) {
    return 'Förhandsgranskning: $name';
  }

  @override
  String get serverThemePreviewNote =>
      'Det här är en förhandsgranskning — inget har tillämpats än.';

  @override
  String get serverThemeApplyButton => 'Tillämpa mall';

  @override
  String get serverThemeApplyError => 'Kunde inte tillämpa den här mallen';

  @override
  String get serverThemeCardTitle => 'Serverteman';

  @override
  String get serverThemeCardDescription =>
      'Bläddra bland utvalda utseenden och förhandsgranska innan du tillämpar.';

  @override
  String get serverThemeBrowseButton => 'Bläddra bland mallar';

  @override
  String get settingsSteamTitle => 'Steam';

  @override
  String get settingsSteamDescription =>
      'Anslut Steam för att dela vad du spelar och/eller jämföra spelbibliotek med vänner -- det är två oberoende reglage, att slå på ett slår aldrig på det andra.';

  @override
  String settingsSteamConnected(String personaName) {
    return 'Steam ansluten som $personaName';
  }

  @override
  String get settingsSteamNotConnected => 'Steam inte anslutet';

  @override
  String get settingsSteamSharePresence => 'Dela vad jag spelar';

  @override
  String get settingsSteamSharePresenceSubtitle =>
      'Vänner och servermedlemmar ser ditt nuvarande spel bredvid din status';

  @override
  String get settingsSteamShareLibrary => 'Tillåt biblioteksjämförelse';

  @override
  String get settingsSteamShareLibrarySubtitle =>
      'Vänner och servermedlemmar kan jämföra sitt Steam-bibliotek med ditt';

  @override
  String profilePlayingGame(String game) {
    return 'Spelar $game';
  }

  @override
  String get profileCompareSteamLibraries => 'Jämför Steam-bibliotek';

  @override
  String get profileUpcomingEventsLabel => 'UPCOMING EVENTS';

  @override
  String get profileSeeAllEvents => 'See all';

  @override
  String get steamCompareScreenTitle => 'Delat Steam-bibliotek';

  @override
  String steamCompareSharedCount(int count) {
    return 'Ni har båda $count spel';
  }

  @override
  String get steamCompareEmptyState => 'Inga gemensamma spel än.';

  @override
  String get steamCompareError => 'Kunde inte läsa in delade spel just nu.';

  @override
  String get steamSyncNow => 'Synka nu';

  @override
  String get steamSyncSuccess => 'Steam-bibliotek synkat.';

  @override
  String get steamSyncError => 'Kunde inte synka just nu -- försök igen strax.';

  @override
  String get steamManageLibraryTitle => 'Hantera synkade spel';

  @override
  String get steamManageLibraryDescription =>
      'Spel du markerar som dolda här visas aldrig i en biblioteksjämförelse, även om Steam fortfarande ser dem som offentliga.';

  @override
  String get steamManageLibraryEmptyState =>
      'Inga synkade spel än -- försök med Synka nu.';

  @override
  String get steamHiddenFromComparison => 'Dold från jämförelse';

  @override
  String get settingsThroneTitle => 'Throne-webhook';

  @override
  String get settingsThroneDescription =>
      'Klistra in den här URL:en i dina webhook-inställningar på Throne.com för att få aviseringar i Koda varje gång någon skickar dig en gåva.';

  @override
  String get settingsThroneGetUrl => 'Hämta min webhook-URL';

  @override
  String get settingsThroneCopyTooltip => 'Kopiera';

  @override
  String get settingsThroneCopiedToast => 'Kopierat till urklipp';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Generera om (gör den gamla URL:en ogiltig)';

  @override
  String get settingsThroneRegenerateConfirmTitle => 'Generera om webhook-URL?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'Din gamla URL slutar fungera, så uppdatera den på Throne.com efteråt.';

  @override
  String get settingsThroneRegenerate => 'Generera om';

  @override
  String get settingsUploadPhoto => 'Ladda upp foto';

  @override
  String get settingsOrPasteUrl => 'eller klistra in en URL nedan';

  @override
  String get settingsAvatarUrlHint => 'https://exempel.se/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'Bilduppladdning kräver Cloudflare R2 — att klistra in en URL fungerar alltid.';

  @override
  String get settingsDisplayNameLabel => 'VISNINGSNAMN';

  @override
  String get settingsDisplayNameHint => 'Visningsnamn';

  @override
  String get settingsBioLabel => 'BIO';

  @override
  String get settingsBioHint => 'Berätta lite om dig själv för andra';

  @override
  String get settingsPronounsLabel => 'PRONOMEN';

  @override
  String get settingsPronounsHint => 't.ex. hen';

  @override
  String get settingsShowPronounsTitle => 'Visa mina pronomen för andra';

  @override
  String get settingsShowPronounsSubtitle =>
      'Visas bredvid ditt namn i chatten, medlemslistor och röst';

  @override
  String get settingsCalendarLabel => 'CALENDAR';

  @override
  String get settingsShareCalendarTitle => 'Share my calendar';

  @override
  String get settingsShareCalendarSubtitle =>
      'Let friends and servers you share see events you\'ve confirmed';

  @override
  String get settingsViewMyCalendar => 'View my calendar';

  @override
  String get settingsStatusLabel => 'STATUS';

  @override
  String get settingsCustomStatusLabel => 'ANPASSAD STATUS';

  @override
  String get settingsCustomStatusHint => 'Vad tänker du på?';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusAway => 'Frånvarande';

  @override
  String get statusDnd => 'Stör ej';

  @override
  String get statusInvisible => 'Osynlig';

  @override
  String get settingsFamilyNotAvailable =>
      'Föräldrakontroller är inte tillgängliga på ett övervakat konto.';

  @override
  String get settingsAboutTitle => 'Om Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Villkor';

  @override
  String get settingsPrivacyTitle => 'Integritetspolicy';

  @override
  String get settingsSupportTitle => 'Support';

  @override
  String get settingsReportSecurityTitle => 'Rapportera ett säkerhetsproblem';

  @override
  String get settingsDesktopNotAvailable =>
      'Det här är inställningar enbart för skrivbordet -- den här plattformen har varken fönster eller systemfält.';

  @override
  String get settingsCloseToTrayTitle => 'Minimera till systemfältet';

  @override
  String get settingsCloseToTraySubtitle =>
      'Att stänga fönstret låter Koda fortsätta köra i bakgrunden så att du fortfarande får aviseringar -- stäng av detta för att stängning av fönstret faktiskt ska avsluta appen.';

  @override
  String get authErrorEmailPasswordRequired => 'E-post och lösenord krävs.';

  @override
  String get authErrorIncorrectCredentials => 'Fel e-post eller lösenord.';

  @override
  String get authErrorMustAcceptTerms => 'Godkänn villkoren.';

  @override
  String get authErrorAllFieldsRequired => 'Alla fält krävs.';

  @override
  String get authErrorPasswordsDontMatch => 'Lösenorden matchar inte.';

  @override
  String get authErrorPasswordTooShort =>
      'Lösenordet måste vara minst 8 tecken.';

  @override
  String get authErrorRegistrationFailed =>
      'Registreringen misslyckades. E-postadressen kan redan vara i bruk.';

  @override
  String get authTabSignIn => 'Logga in';

  @override
  String get authTabCreateAccount => 'Skapa konto';

  @override
  String get authAgreementPrefix => 'Genom att använda Koda godkänner du våra ';

  @override
  String get authTermsLink => 'villkor';

  @override
  String get authAgreementMiddle => ' och vår ';

  @override
  String get authPrivacyLink => 'integritetspolicy';

  @override
  String get authAgreementSuffix => '.';

  @override
  String get authEmailHint => 'E-postadress';

  @override
  String get authPasswordHint => 'Lösenord';

  @override
  String get authForgotPassword => 'Glömt lösenord?';

  @override
  String get authSignInButton => 'Logga in';

  @override
  String get authUsernameHint => 'Användarnamn';

  @override
  String get authConfirmPasswordHint => 'Bekräfta lösenord';

  @override
  String get authAccessCodeHint => 'Åtkomstkod (om du har en)';

  @override
  String get authAgreeToTerms =>
      'Jag godkänner villkoren och integritetspolicyn';

  @override
  String get authCreateAccountButton => 'Skapa konto';

  @override
  String get dmSafetyNumberChangedWarning =>
      'Den här konversationens säkerhetsnummer har ändrats -- verifiera det innan du skickar.';

  @override
  String get dmMessageNotSent => 'Meddelandet skickades inte.';

  @override
  String dmEncryptMessageError(String error) {
    return 'Kunde inte kryptera meddelandet: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'Det gick inte att ladda upp bilagan.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'Kunde inte kryptera bilagan: $error';
  }

  @override
  String get dmReportMessage => 'Rapportera meddelande';

  @override
  String get dmReportSubmitted => 'Rapporten har skickats.';

  @override
  String get dmTitle => 'Meddelanden';

  @override
  String get dmNewMessage => 'Nytt meddelande';

  @override
  String get dmNoConversationsYet => 'Inga konversationer än';

  @override
  String get dmSelectConversation => 'Välj en konversation';

  @override
  String get dmVerifySafetyNumberTooltip => 'Verifiera säkerhetsnummer';

  @override
  String get dmSeenLabel => 'Sedd';

  @override
  String get dmMessageActionsTooltip => 'Meddelandeåtgärder';

  @override
  String get dmRemoveAttachmentTooltip => 'Ta bort bilaga';

  @override
  String get dmAttachFileTooltip => 'Bifoga fil';

  @override
  String get dmMessageHint => 'Meddelande...';

  @override
  String get dmSendMessageTooltip => 'Skicka meddelande';

  @override
  String get dmNoFriendsYet =>
      'Inga vänner än.\nSkicka en vänförfrågan för att komma igång.';

  @override
  String get dmUnfriendTooltip => 'Ta bort vän';

  @override
  String get dmNoPendingRequests => 'Inga väntande vänförfrågningar.';

  @override
  String get dmIncomingRequestsLabel => 'INKOMMANDE';

  @override
  String get dmSentRequestsLabel => 'SKICKADE';

  @override
  String get dmAcceptTooltip => 'Acceptera';

  @override
  String get dmDeclineTooltip => 'Avböj';

  @override
  String get dmPendingLabel => 'Väntar';

  @override
  String get dmNewMessageDialogTitle => 'Nytt meddelande';

  @override
  String get dmEnterUsernameHint => 'Ange användarnamn';

  @override
  String get dmOpenButton => 'Öppna';

  @override
  String dmSavedAttachment(String fileName) {
    return 'Sparade $fileName';
  }

  @override
  String get dmUnknownUser => 'Okänd';

  @override
  String get dmEndToEndEncryptedTooltip => 'Totalsträckskrypterat';

  @override
  String get homeContentWarningTitle => 'Innehållsvarning';

  @override
  String homeContentWarningBody(String labels) {
    return 'Den här kanalen är flaggad för: $labels.\n\nÄndra detta i Inställningar > Säkerhet > Innehållsfilter.';
  }

  @override
  String get homeViewAnyway => 'Visa ändå';

  @override
  String get homeCouldNotConnectVoice => 'Kunde inte ansluta till röst.';

  @override
  String get homeVoiceChannelFull => 'Den här röstkanalen är full.';

  @override
  String get homeCreateServer => 'Skapa server';

  @override
  String get homeJoinServer => 'Gå med i server';

  @override
  String get homeRedeemCode => 'Lös in kod';

  @override
  String get homeJoinServerDialogTitle => 'Gå med i server';

  @override
  String get homeEnterInviteCode => 'Ange en inbjudningskod eller URL:';

  @override
  String get homeInviteCodeHint => 't.ex. XK9MP2';

  @override
  String get homeJoined => 'Gick med!';

  @override
  String get homeInvalidInvite => 'Ogiltig eller utgången inbjudningskod.';

  @override
  String get homeJoinButton => 'Gå med';

  @override
  String get homeRedeemCodeDialogTitle => 'Lös in kod';

  @override
  String get homeEnterBackerCode => 'Ange din backer- eller belöningskod:';

  @override
  String get homeRewardCodeHint => 'Belöningskod';

  @override
  String get homeCodeRedeemed =>
      'Koden är inlöst! Dina belöningar har tillämpats.';

  @override
  String get homeInvalidRedeemCode =>
      'Ogiltig, utgången eller redan inlöst kod.';

  @override
  String get homeRedeemButton => 'Lös in';

  @override
  String get homeAreFriends => 'Ni är vänner';

  @override
  String get homeAddFriend => 'Lägg till vän';

  @override
  String homeFriendRequestSent(String username) {
    return 'Vänförfrågan skickad till $username!';
  }

  @override
  String get homeMessageButton => 'Meddelande';

  @override
  String get homeSendTip => 'Skicka dricks';

  @override
  String get homeSwitchToServer => 'Byt till server';

  @override
  String get homeInvitePeople => 'Bjud in personer';

  @override
  String get homeServerSettingsMenuItem => 'Serverinställningar';

  @override
  String get homeLeaveServerMenuItem => 'Lämna server';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return 'Lämna $serverName? Du kan gå med igen med en inbjudan.';
  }

  @override
  String get homeLeaveButton => 'Lämna';

  @override
  String get homeCreateAServer => 'Skapa en server';

  @override
  String get homeServerNameHint => 'Servernamn';

  @override
  String get homeDescribeToVisp => 'Beskriv det för Visp istället';

  @override
  String get homeMarkAsRead => 'Markera som läst';

  @override
  String get homeEditChannel => 'Redigera kanal';

  @override
  String get homeDeleteChannel => 'Ta bort kanal';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return 'Ta bort #$channelName? Det här kan inte ångras.';
  }

  @override
  String get homeDeleteButton => 'Ta bort';

  @override
  String get homeCreateChannelHere => 'Skapa kanal här';

  @override
  String get homeEditCategory => 'Redigera kategori';

  @override
  String get homeDeleteCategory => 'Ta bort kategori';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return 'Ta bort \"$categoryName\"? Kanaler i den blir okategoriserade.';
  }

  @override
  String get homeReplyAction => 'Svara';

  @override
  String get homeCreateThreadAction => 'Skapa tråd';

  @override
  String get homeEditMessageAction => 'Redigera meddelande';

  @override
  String get homeDeleteMessageAction => 'Ta bort meddelande';

  @override
  String get homePinMessageAction => 'Nåla fast meddelande';

  @override
  String get homeUnpinMessageAction => 'Ta bort fastnålning';

  @override
  String get homeReportMessageAction => 'Rapportera meddelande';

  @override
  String get homeReportSubmitted => 'Rapporten har skickats.';

  @override
  String get messageActionForward => 'Vidarebefordra';

  @override
  String messageForwardedFromLabel(String name) {
    return 'Vidarebefordrat från $name';
  }

  @override
  String get forwardDestinationPickerTitle => 'Vidarebefordra meddelande';

  @override
  String get forwardDestinationPickerChannelsTab => 'Kanaler';

  @override
  String get forwardDestinationPickerDmsTab => 'Direktmeddelanden';

  @override
  String get forwardDestinationPickerNoServers =>
      'Du är inte med i någon server än.';

  @override
  String get forwardDestinationPickerNoChannels =>
      'Inga textkanaler i den här servern.';

  @override
  String get forwardDestinationPickerNoConversations =>
      'Inga konversationer än.';

  @override
  String get forwardSuccessToast => 'Meddelandet vidarebefordrat.';

  @override
  String get forwardFailedToast =>
      'Det gick inte att vidarebefordra meddelandet -- försök igen.';

  @override
  String get homeAddReactionTitle => 'Lägg till reaktion';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trådar',
      one: '$count tråd',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'Kategorialternativ';

  @override
  String get homeChannelOptionsTooltip => 'Kanalalternativ';

  @override
  String get homeOpenVoiceChatTooltip => 'Öppna chatt';

  @override
  String get homeMarketplaceLabel => 'Marknadsplats';

  @override
  String get homeSelectChannelPrompt => 'Välj en kanal';

  @override
  String get homeSearchTooltip => 'Sök';

  @override
  String get homePinnedMessagesTooltip => 'Fastnålade meddelanden';

  @override
  String get homeWaitingForKey =>
      'Väntar på att krypteringsnyckeln ska komma...';

  @override
  String get homeUnableToDecrypt => 'Kan inte dekryptera det här meddelandet.';

  @override
  String get homeMessageActionsTooltip => 'Meddelandeåtgärder';

  @override
  String get homeCancelReplyTooltip => 'Avbryt svar';

  @override
  String get homeRemoveAttachmentTooltip => 'Ta bort bilaga';

  @override
  String get homeAttachFileTooltip => 'Bifoga fil';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'Meddelande #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'Skicka meddelande';

  @override
  String get homeEditMessageTitle => 'Redigera meddelande';

  @override
  String get homeMessageLabel => 'Meddelande';

  @override
  String get homePinnedMessagesTitle => 'Fastnålade meddelanden';

  @override
  String get homeNoPinnedMessages => 'Inga fastnålade meddelanden';

  @override
  String get homeUnpinTooltip => 'Ta bort fastnålning';

  @override
  String get homeCreateThreadTitle => 'Skapa tråd';

  @override
  String get homeThreadNameHint => 'Trådnamn';

  @override
  String homeThreadCreated(String name) {
    return 'Tråden \"$name\" skapades!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Skapa eller gå med';

  @override
  String get homeKodaMarketplaceTooltip => 'Koda Marketplace';

  @override
  String get homeAdminPanelTooltip => 'Adminpanel';

  @override
  String get homeServerSettingsTooltip => 'Serverinställningar';

  @override
  String get homeSettingsTooltip => 'Inställningar';

  @override
  String get homeContentWarningBadge => 'Innehållsvarning';

  @override
  String get homeDirectMessagesTooltip => 'Direktmeddelanden';

  @override
  String homeReplyingTo(String username) {
    return 'Svarar $username';
  }

  @override
  String get homeAttachmentFallback => 'Bilaga';

  @override
  String get homeAttachmentUploadFailed =>
      'Det gick inte att ladda upp bilagan.';

  @override
  String homeSavedAttachment(String fileName) {
    return 'Sparade $fileName';
  }

  @override
  String serverConnectError(String service) {
    return 'Kunde inte starta $service-anslutningen.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Koppla från Printful?';

  @override
  String get serverDisconnectPrintfulBody =>
      'Den här servern kan inte längre fullfölja beställningar av merch förrän den ansluts igen.';

  @override
  String get serverDisconnectTiltifyTitle => 'Koppla från Tiltify?';

  @override
  String get serverDisconnectTiltifyBody =>
      'Den här servern slutar visa insamlingskampanjens förlopp tills den ansluts igen.';

  @override
  String get serverNewRoleTitle => 'Ny roll';

  @override
  String get serverEditRoleTitle => 'Redigera roll';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Färg $hex';
  }

  @override
  String get permViewChannels => 'Visa kanaler';

  @override
  String get permSendMessages => 'Skicka meddelanden';

  @override
  String get permConnectVoice => 'Ansluta till röst';

  @override
  String get permManageServer => 'Hantera server';

  @override
  String get permManageChannels => 'Hantera kanaler';

  @override
  String get permManageRoles => 'Hantera roller';

  @override
  String get permManageMessages => 'Hantera meddelanden';

  @override
  String get permKickMembers => 'Sparka ut medlemmar';

  @override
  String get permBanMembers => 'Bannlysa medlemmar';

  @override
  String get permMuteMembers => 'Tysta medlemmar';

  @override
  String get permMentionEveryone => 'Nämna @everyone';

  @override
  String get permManageMarketplace => 'Hantera marknadsplats';

  @override
  String get permAnnounceLive => 'Meddela vid livesändning';

  @override
  String get permMoveMembers => 'Flytta medlemmar (röst)';

  @override
  String get serverRoleNameHint => 'Rollnamn';

  @override
  String get serverColorLabel => 'Färg';

  @override
  String get serverPermissionsLabel => 'Behörigheter';

  @override
  String get serverSelfAssignableTitle => 'Självtilldelningsbar';

  @override
  String get serverSelfAssignableSubtitle =>
      'Medlemmar kan tilldela sig själva den här rollen';

  @override
  String get serverDefaultRoleUndeletable =>
      'Standardrollen kan inte tas bort.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'Ta bort rollen \"$roleName\"?';
  }

  @override
  String get serverCouldNotDeleteRole =>
      'Det gick inte att ta bort den rollen.';

  @override
  String get serverMemberFallback => 'Medlem';

  @override
  String get serverNoRolesYet => 'Inga roller än.';

  @override
  String get serverRefreshStatus =>
      'Redan ansluten i webbläsaren? Uppdatera status';

  @override
  String get serverPrintfulConnected => 'Printful ansluten';

  @override
  String get serverPrintfulNotConnected => 'Printful inte ansluten';

  @override
  String get serverPrintfulDescription =>
      'Anslut den här serverns Printful-konto för att fullfölja merch-beställningar som görs via Koda. Varje server ansluter sin egen butik.';

  @override
  String get serverConnecting => 'Ansluter...';

  @override
  String get serverConnectPrintful => 'Anslut Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify ansluten';

  @override
  String get serverTiltifyNotConnected => 'Tiltify inte ansluten';

  @override
  String get serverTiltifyDescription =>
      'Anslut den här serverns Tiltify-konto för att visa en insamlingskampanjs förlopp i realtid för alla medlemmar. Skrivskyddat -- Koda publicerar eller ändrar aldrig något på Tiltifys sida.';

  @override
  String get serverConnectTiltify => 'Anslut Tiltify';

  @override
  String get serverNoTiltifyCampaigns =>
      'Inga kampanjer hittades på det här Tiltify-kontot.';

  @override
  String get serverPickCampaign => 'Välj vilken kampanj som ska visas';

  @override
  String get serverUntitledCampaign => 'Namnlös kampanj';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '$currency $raised insamlat av $goal mål';
  }

  @override
  String get serverViewCampaign => 'Visa kampanj';

  @override
  String get serverRefreshButton => 'Uppdatera';

  @override
  String get serverUploadButton => 'Ladda upp';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '$used / $limit platser använda -- boostnivå $level';
  }

  @override
  String get serverNoCustomEmoji => 'Inga anpassade emojis än.';

  @override
  String get serverDeleteEmojiTooltip => 'Ta bort emoji';

  @override
  String get serverUploadEmojiTitle => 'Ladda upp emoji';

  @override
  String get serverEmojiNameHint => 'namn (bokstäver, siffror, _)';

  @override
  String get serverChooseImage => 'Välj bild';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Aktuell boostnivå: $level';
  }

  @override
  String get serverBackgroundTitle => 'Serverbakgrund';

  @override
  String get serverBackgroundDescription =>
      'En anpassad bakgrund som visas bakom kanalvyn för alla på den här servern.';

  @override
  String get serverBackgroundLockedHint =>
      'Nå boostnivå 4 för att låsa upp en anpassad bakgrund.';

  @override
  String get serverIconBorderTitle => 'Kantram för serverikon';

  @override
  String get serverIconBorderDescription =>
      'En accentram runt den här serverns ikon i varje medlems serverlista.';

  @override
  String get serverIconBorderLockedHint =>
      'Nå boostnivå 5 för att låsa upp en anpassad ikonram.';

  @override
  String get serverAchievementsCardTitle => 'Prestationer';

  @override
  String get serverAchievementsCardDescription =>
      'Skapa anpassade märken och dela ut dem till medlemmar.';

  @override
  String get serverAchievementsLockedHint =>
      'Nå boostnivå 3 för att skapa prestationer.';

  @override
  String get serverOpenAchievements => 'Hantera prestationer';

  @override
  String get serverBoostFromBank =>
      'Boosta den här servern från Serverbanken i Marketplace för att höja dess nivå.';

  @override
  String get serverMarketplaceListingLabel => 'MARKNADSPLATSANNONS';

  @override
  String get serverListInMarketplace => 'Lista på Koda Marketplace';

  @override
  String get serverListInMarketplaceDescription =>
      'Listar den här serverns butik i Koda Marketplace, med chans till den veckovisa utvalda-rotationen. Det här handlar om shopping, inte om att hitta servrar att gå med i -- det påverkar inte den allmänna serversökningen.';

  @override
  String get serverSocialLinkLabel => 'Social länk/inbjudningslänk (valfritt)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Spara länk';

  @override
  String get serverPricingLabel => 'PRISSÄTTNING';

  @override
  String get serverPrimaryCurrencyLabel => 'Primär valuta';

  @override
  String get serverPrimaryCurrencyDescription =>
      'Gäller för Serverprenumerationsnivåer och priser på digitala varor som du anger för den här servern.';

  @override
  String get serverPrimaryLanguageLabel => 'Primärt språk';

  @override
  String get serverPrimaryLanguageDescription =>
      'Meddelanden som medlemmar publicerar på ett annat språk får en liten språkmärkning, jämfört med den här inställningen.';

  @override
  String get serverMarketplaceLinkSaved => 'Marknadsplatslänk sparad.';

  @override
  String get serverIconUpdated => 'Serverikonen har uppdaterats!';

  @override
  String get serverTemplateImported => 'Mallen har importerats!';

  @override
  String get serverImportFromDiscord => 'Importera från Discord';

  @override
  String get serverVispPlanLive => 'Visps plan är klar!';

  @override
  String get serverAskVisp => 'Fråga Visp';

  @override
  String get serverAddCategoryButton => 'Lägg till kategori';

  @override
  String get serverAddChannelHereTooltip => 'Lägg till kanal här';

  @override
  String get serverRename => 'Byt namn';

  @override
  String get serverUncategorized => 'OKATEGORISERAD';

  @override
  String get serverAddChannel => 'Lägg till kanal';

  @override
  String get serverEditRulesContent => 'Redigera regelinnehåll';

  @override
  String get serverRulesContentHint => 'Ange din servers regler här...';

  @override
  String get serverRulesUpdated => 'Reglerna har uppdaterats!';

  @override
  String get serverAddRole => 'Lägg till roll';

  @override
  String get serverSaveRoleOrder => 'Spara ordning';

  @override
  String get serverRoleOrderSaved => 'Rollordningen sparades.';

  @override
  String get serverRoleOrderSaveFailed =>
      'Det gick inte att spara rollordningen. Försök igen.';

  @override
  String get serverDefaultRoleLabel => 'Standardroll';

  @override
  String get serverManageRolesTooltip => 'Hantera roller';

  @override
  String get serverMutedLabel => 'Tystad';

  @override
  String get serverExpandedLabel => 'expanderad';

  @override
  String get serverCollapsedLabel => 'hopfälld';

  @override
  String get serverUnmute => 'Avtysta';

  @override
  String get serverMute => 'Tysta';

  @override
  String get serverKick => 'Sparka ut';

  @override
  String get serverBan => 'Bannlys';

  @override
  String serverBannedUsersLabel(int count) {
    return 'BANNLYSTA ANVÄNDARE — $count';
  }

  @override
  String get serverNoBannedUsers => 'Inga bannlysta användare.';

  @override
  String get serverUnban => 'Häv bannlysning';

  @override
  String get serverMemberFallbackGeneric => 'den här medlemmen';

  @override
  String serverBanConfirm(String username, String serverName) {
    return 'Bannlysa $username från $serverName? Personen kan inte gå med igen utan att bannlysningen hävs.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return 'Sparka ut $username från $serverName? Personen kan gå med igen med en inbjudan.';
  }

  @override
  String get serverMuteDuration60Sec => '60 sekunder';

  @override
  String get serverMuteDuration5Min => '5 minuter';

  @override
  String get serverMuteDuration10Min => '10 minuter';

  @override
  String get serverMuteDuration1Hour => '1 timme';

  @override
  String get serverMuteDuration1Day => '1 dag';

  @override
  String get serverMuteDuration1Week => '1 vecka';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'Det gick inte att $action $username.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return 'Tysta $username';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'Det gick inte att tysta $username.';
  }

  @override
  String get serverUnlockInvites => 'Lås upp inbjudningar';

  @override
  String get serverInvitesUnlocked => 'Inbjudningar upplåsta.';

  @override
  String get serverAuditLogDescription =>
      'Nivå 1-modereringsaktivitet -- utsparkningar, bannlysningar, tystningar och automatiskt skydd mot flödning/räder. Endast metadata; aldrig meddelandeinnehåll.';

  @override
  String get serverSystemActor => 'System';

  @override
  String get serverActionKicked => 'sparkade ut';

  @override
  String get serverActionBanned => 'bannlyste';

  @override
  String get serverActionUnbanned => 'hävde bannlysning för';

  @override
  String get serverActionMuted => 'tystade';

  @override
  String get serverActionUnmuted => 'avtystade';

  @override
  String get serverActionFloodDetected => 'auto-tystad för flödning';

  @override
  String get serverActionRaidLockdownEnabled =>
      'låste inbjudningar (räddskydd)';

  @override
  String get serverActionRaidLockdownDisabled => 'låste upp inbjudningar';

  @override
  String get serverActionMoved => 'flyttade';

  @override
  String get serverUnknownAction => 'okänd åtgärd';

  @override
  String get serverNoModerationActivity => 'Ingen modereringsaktivitet än.';

  @override
  String get serverReportsDescription =>
      'Meddelanden som rapporterats av medlemmar på den här servern -- rapportörens egen redan dekrypterade kopia, avslöjad genom rapporteringen.';

  @override
  String get serverNoPendingReports => 'Inga väntande rapporter.';

  @override
  String get serverReportReasonOther => 'övrigt';

  @override
  String get serverReportStatusActioned => 'Åtgärdad';

  @override
  String get serverReportStatusDismissed => 'Avfärdad';

  @override
  String get serverResolvedLabel => 'LÖST';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'Rapporterad av $reporter -- skickat av $target';
  }

  @override
  String serverReportNote(String note) {
    return 'Anteckning: $note';
  }

  @override
  String get serverDismissButton => 'Avfärda';

  @override
  String get serverMarkActioned => 'Markera som åtgärdad';

  @override
  String get serverCreateInvite => 'Skapa inbjudan';

  @override
  String get serverInviteCreatedTitle => 'Inbjudan skapad';

  @override
  String get serverNoActiveInvites => 'Inga aktiva inbjudningar';

  @override
  String serverUsesLabel(String uses) {
    return 'Användningar: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Ta bort inbjudan';

  @override
  String get serverChangeIconLabel => 'Byt serverikon';

  @override
  String get serverFallbackName => 'Server';

  @override
  String serverSettingsTitle(String serverName) {
    return '$serverName – inställningar';
  }

  @override
  String get serverTabChannels => 'Kanaler';

  @override
  String get serverTabRoles => 'Roller';

  @override
  String get serverTabMembers => 'Medlemmar';

  @override
  String get serverTabInvites => 'Inbjudningar';

  @override
  String get serverTabMerch => 'Merch';

  @override
  String get serverTabEmoji => 'Emoji';

  @override
  String get serverTabCustomize => 'Anpassa';

  @override
  String get serverTabAuditLog => 'Granskningslogg';

  @override
  String get serverTabReports => 'Rapporter';

  @override
  String get serverTabThresholdMod => 'Tröskelmoderering';

  @override
  String get serverTabCharity => 'Välgörenhet';

  @override
  String get homeCustomEmojiFallback => 'anpassad emoji';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reaktioner',
      one: '$count reaktion',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted =>
      ', du reagerade, aktivera för att ta bort';

  @override
  String get homeReactionActivateToAdd => ', aktivera för att lägga till';

  @override
  String get homeAddReactionLabel => 'Lägg till reaktion';

  @override
  String homeViewProfile(String username) {
    return 'Visa ${username}s profil';
  }

  @override
  String get homeMoveToVoiceChannel => 'Flytta till röstkanal…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Välj en röstkanal';

  @override
  String get homeNoOtherVoiceChannels => 'Inga andra röstkanaler';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username är nu i $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'Det gick inte att flytta $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'Du är nu i $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'Gå med i $channel för att prata';
  }

  @override
  String get adminPanelTitle => 'Adminpanel';

  @override
  String get adminTabBackerCodes => 'Backerkoder';

  @override
  String get adminTabUsers => 'Användare';

  @override
  String get adminTabDmReports => 'DM-rapporter';

  @override
  String get adminTabSpamFlags => 'Spammarkeringar';

  @override
  String get adminTabWiki => 'Wiki';

  @override
  String get adminTabBoosts => 'Boostar';

  @override
  String get adminCreateBackerCodeTitle => 'Skapa backerkod';

  @override
  String get adminCodeHint => 'Kod (lämna tomt för att generera automatiskt)';

  @override
  String get adminNoteHint => 'Anteckning (t.ex. \"Kickstarter Tier 2\")';

  @override
  String get adminFlagsJsonHint =>
      'Flaggor som JSON, t.ex. \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint =>
      'Max antal användningar (lämna tomt = obegränsat)';

  @override
  String get adminCodeCreatedTitle => 'Kod skapad';

  @override
  String get adminCodeLabel => 'Kod:';

  @override
  String get adminCopyCodeTooltip => 'Kopiera kod';

  @override
  String adminFlagsValue(String flags) {
    return 'Flaggor: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Backer- och belöningskoder';

  @override
  String get adminNewCodeButton => 'Ny kod';

  @override
  String get adminNoCodesYet => 'Inga koder än';

  @override
  String get adminRewardsHeader => 'Belöningar';

  @override
  String get adminRewardAlphaBetaAccess =>
      'Alpha/Beta-åtkomst + Alpha Spark-märke';

  @override
  String get adminRewardLifetimePulse =>
      'Livstids Pulse-status + Founder-märke + förbättrad bitrate';

  @override
  String get adminRewardMonthlyBoostTokenOne =>
      'Månatlig server-boost-token (förbättrat ljud/video)';

  @override
  String get adminRewardAnimatedFrameBundle =>
      'Animerad profilram + Founders Hall + 2 månatliga servertokens';

  @override
  String get adminRewardTitanGlow => 'Permanent \"Titan\"-användarnamnsglöd';

  @override
  String get adminRewardAnimatedFrame => 'Animerad ram';

  @override
  String get adminRewardFoundersHall => 'Founders Hall';

  @override
  String adminRewardMonthlyBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count boost-tokens/månad',
      one: '1 boost-token/månad',
    );
    return '$_temp0';
  }

  @override
  String get adminRewardsNone => 'Inga belöningar';

  @override
  String get adminRegistrationOpenLabel => 'Registrering är öppen för alla';

  @override
  String get adminRegistrationInviteOnlyLabel =>
      'Registrering är endast på inbjudan (backer-kod krävs)';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses användningar';
  }

  @override
  String get adminSearchUsersHint => 'Sök användare efter användarnamn...';

  @override
  String get adminSearchUsersPrompt => 'Sök efter en användare ovan';

  @override
  String get adminNoDmReports => 'Inga DM-rapporter.';

  @override
  String get adminResolvedLabel => 'LÖST';

  @override
  String get adminReasonOther => 'annat';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Anmälare: $reporterId\nAvslöjad avsändare: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Anteckning: $note';
  }

  @override
  String get adminDismissButton => 'Avfärda';

  @override
  String get adminMarkActionedButton => 'Markera som åtgärdad';

  @override
  String get adminStatusActioned => 'Åtgärdad';

  @override
  String get adminStatusDismissed => 'Avfärdad';

  @override
  String get adminNoSpamFlags => 'Inga spammarkeringar.';

  @override
  String get adminFlagMassDmSpam => 'Massutskick av DM-spam';

  @override
  String get adminFlagRaidLockdown => 'Raid-nedstängning';

  @override
  String get adminFlagBotBehavior => 'Botliknande beteende';

  @override
  String get adminFlagChannelFlooding => 'Kanalöversvämning';

  @override
  String get adminAutoEscalatedBadge => 'AUTOESKALERAD';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Säkerhet: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'Användare: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Server: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount av $totalJoiners nya medlemmar är fortfarande tystade';
  }

  @override
  String get adminNoJoinersMuted => 'Inga nya medlemmar är tystade just nu';

  @override
  String adminRestrictedUntil(String until) {
    return 'Begränsad till $until just nu';
  }

  @override
  String get adminNotCurrentlyRestricted => 'Inte begränsad just nu';

  @override
  String get adminDismissUndoButton => 'Avfärda och ångra';

  @override
  String get adminConfirmRestrictButton => 'Bekräfta och begränsa';

  @override
  String get adminDeleteArticleTitle => 'Ta bort artikel?';

  @override
  String adminDeleteArticleBody(String title) {
    return '\"$title\" tas bort från Visps kunskapsbas.';
  }

  @override
  String get adminNewArticleTitle => 'Ny artikel';

  @override
  String get adminEditArticleTitle => 'Redigera artikel';

  @override
  String get adminArticleTitleHint => 'Titel';

  @override
  String get adminArticleContentHint => 'Artikelinnehåll (markdown)';

  @override
  String get adminWikiArticlesHeader => 'Wikiartiklar';

  @override
  String get adminNoArticlesYet => 'Inga artiklar än';

  @override
  String get adminEditArticleTooltip => 'Redigera artikel';

  @override
  String get adminDeleteArticleTooltip => 'Ta bort artikel';

  @override
  String get adminSearchServersHint => 'Sök servrar efter namn...';

  @override
  String get adminSearchServersPrompt => 'Sök efter en server ovan';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'Ge boostar till $serverName';
  }

  @override
  String get adminNumBoostsHint => 'Antal boostar';

  @override
  String get adminGrantButton => 'Ge';

  @override
  String get adminPositiveNumberError => 'Ange ett positivt heltal.';

  @override
  String get adminGrantBoostsFailed => 'Det gick inte att ge boostar.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Gav $count boostar till $serverName -- nu nivå $level ($activeCount aktiva).',
      one:
          'Gav $count boost till $serverName -- nu nivå $level ($activeCount aktiva).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count medlemmar';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Ge boostar';

  @override
  String get parentalDashboardTitle => 'Familj';

  @override
  String get parentalDashboardCreateChildTitle => 'Skapa barnkonto';

  @override
  String get parentalDashboardUsernameHint => 'Användarnamn';

  @override
  String get parentalDashboardEmailHint => 'E-post';

  @override
  String get parentalDashboardPasswordHint => 'Lösenord';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'Detta startar en förfrågan om att skapa ett helt övervakat konto för ditt barn: märkta kanaler blockeras, och du kan ställa in tillåtna timmar och se (men inte läsa) deras vänner och servrar. Vi verifierar att du är förälder eller behörig vårdnadshavare innan kontot skapas -- välj en verifieringsmetod nedan.';

  @override
  String get parentalDashboardValidationError =>
      'Användarnamn, e-post och ett lösenord på minst 8 tecken krävs.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'Kunde inte starta förfrågan -- användarnamnet/e-posten kan redan vara upptaget.';

  @override
  String get parentalDashboardCreatingLabel => 'Startar...';

  @override
  String get parentalDashboardNoChildren => 'Inga länkade konton än.';

  @override
  String get parentalDashboardSupervisedLabel => 'Övervakat konto';

  @override
  String get parentalDashboardUnknownUser => 'Okänd';

  @override
  String get parentalConsentMethodLabel =>
      'Hur ska vi verifiera att du är förälder eller vårdnadshavare?';

  @override
  String get parentalConsentMethodCardTitle => 'Kredit- eller betalkort';

  @override
  String get parentalConsentMethodCardSubtitle =>
      'En liten avgift på 0,50 \$ verifierar att du äger kortet och återbetalas omedelbart.';

  @override
  String get parentalConsentMethodFormTitle => 'Signerat samtyckesformulär';

  @override
  String get parentalConsentMethodFormSubtitle =>
      'Ladda upp ett signerat formulär. En medarbetare granskar det innan kontot skapas.';

  @override
  String get parentalConsentAttestation =>
      'Jag bekräftar att jag är förälder eller behörig vårdnadshavare för detta barn.';

  @override
  String get parentalConsentUploadFormHint =>
      'Ladda sedan upp ditt signerade samtyckesformulär nedan.';

  @override
  String get parentalConsentFinishInBrowser =>
      'Slutför verifieringen i din webbläsare och kom sedan tillbaka -- detta uppdateras automatiskt.';

  @override
  String parentalConsentStatusRejected(String reason) {
    return 'Avvisad: $reason';
  }

  @override
  String get parentalConsentStatusExpired =>
      'Förfrågan har löpt ut -- börja om';

  @override
  String get parentalConsentStatusAwaitingUpload =>
      'Väntar på ditt signerade formulär';

  @override
  String get parentalConsentUploadFormButton => 'Ladda upp formulär';

  @override
  String get parentalConsentStatusAwaitingReview =>
      'Väntar på granskning av personal';

  @override
  String get parentalConsentStatusAwaitingPayment =>
      'Väntar på betalningsverifiering';

  @override
  String get parentalConsentPendingSectionTitle => 'VÄNTANDE FÖRFRÅGNINGAR';

  @override
  String get parentalConsentPrivacyNoticePrefix => 'Läs vår ';

  @override
  String get parentalConsentPrivacyNoticeSuffix =>
      ' för att se exakt vilken information vi samlar in om ditt barn och hur den används.';

  @override
  String get childDetailFallbackTitle => 'Barnkonto';

  @override
  String get childDetailTabFriends => 'Vänner';

  @override
  String get childDetailTabServers => 'Servrar';

  @override
  String get childDetailTabSchedule => 'Schema';

  @override
  String get childDetailTabOverride => 'Undantag';

  @override
  String get childDetailTabThirdParty => 'Anslutningar';

  @override
  String get childDetailNoFriends => 'Inga vänner.';

  @override
  String get childDetailUnknownUser => 'Okänd';

  @override
  String get childDetailRemoveFriendTooltip => 'Ta bort vän';

  @override
  String get childDetailNoServers => 'Med i inga servrar.';

  @override
  String childDetailMemberCount(int count) {
    return '$count medlemmar';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Ta bort från server';

  @override
  String get childDetailRestrictAccessTitle =>
      'Begränsa åtkomst till fasta tider';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Av innebär obegränsad åtkomst när som helst';

  @override
  String get childDetailTimezoneLabel => 'Tidszon';

  @override
  String get childDetailMonday => 'Måndag';

  @override
  String get childDetailTuesday => 'Tisdag';

  @override
  String get childDetailWednesday => 'Onsdag';

  @override
  String get childDetailThursday => 'Torsdag';

  @override
  String get childDetailFriday => 'Fredag';

  @override
  String get childDetailSaturday => 'Lördag';

  @override
  String get childDetailSunday => 'Söndag';

  @override
  String get childDetailNoAccessLabel => 'Ingen åtkomst';

  @override
  String get childDetailToLabel => 'till';

  @override
  String get childDetailSavingLabel => 'Sparar...';

  @override
  String get childDetailSaveScheduleButton => 'Spara schema';

  @override
  String get childDetailScheduleSaved => 'Schema sparat.';

  @override
  String get childDetailOverrideExplanation =>
      'Ge tillfällig åtkomst utanför det vanliga schemat -- praktiskt för ett enstaka undantag utan att ändra veckoschemat.';

  @override
  String get childDetailThirdPartyExplanation =>
      'Att ansluta en tjänst som Twitch, Kick, YouTube, Steam eller Spotify delar ditt barns Koda-användarnamn och aktivitet med den externa plattformen. Detta är separat från samtycket som skapade kontot, och är avstängt som standard -- slå på det bara om du vill att ditt barn ska kunna länka dessa konton.';

  @override
  String get childDetailThirdPartyToggleTitle =>
      'Tillåt anslutningar till tredje part';

  @override
  String get childDetailThirdPartyToggleSubtitle =>
      'Att stänga av detta kopplar omedelbart bort alla redan länkade konton';

  @override
  String get childDetailDeleteAccountTitle => 'Radera konto';

  @override
  String childDetailDeleteAccountWarning(String username) {
    return 'Detta tar bort ${username}s konto och personliga information permanent. Detta kan inte ångras.';
  }

  @override
  String get childDetailDeleteAccountConfirm => 'Radera konto';

  @override
  String get childDetailReasonHint => 'Anledning (valfritt)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes min';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours tim';
  }

  @override
  String get childDetailRevokeOverrideButton => 'Återkalla aktivt undantag';

  @override
  String get childDetailAccessGranted => 'Tillfällig åtkomst beviljad.';

  @override
  String get childDetailOverrideRevoked => 'Undantag återkallat.';

  @override
  String get digitalGoodsTitle => 'Digitala varor';

  @override
  String get digitalGoodsMyProductsTitle => 'Mina produkter';

  @override
  String get digitalGoodsManageProductsTooltip =>
      'Hantera den här serverns produkter';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Växla till Bläddra';

  @override
  String get digitalGoodsCreateProductTooltip => 'Skapa produkt';

  @override
  String get digitalGoodsBrowseTab => 'Bläddra';

  @override
  String get digitalGoodsMyListingsTab => 'Mina annonser';

  @override
  String get digitalGoodsMyPurchasesTab => 'Mina köp';

  @override
  String get digitalGoodsNoProductsYet => 'Inga produkter än';

  @override
  String get digitalGoodsNoProductsAvailable => 'Inga produkter tillgängliga';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Skapa din första produkt för att börja sälja';

  @override
  String get digitalGoodsCheckBackLater =>
      'Titta tillbaka senare för digitala varor';

  @override
  String get digitalGoodsCreateProductButton => 'Skapa produkt';

  @override
  String get digitalGoodsLicenseKeyBadge => 'Licensnyckel';

  @override
  String get digitalGoodsFileBadge => 'Fil';

  @override
  String get digitalGoodsAllServersBadge => 'Alla servrar';

  @override
  String get digitalGoodsFreeForYou => 'Gratis för dig';

  @override
  String get digitalGoodsFreeLabel => 'Gratis';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count sålda';
  }

  @override
  String get digitalGoodsKeysButton => 'Nycklar';

  @override
  String get digitalGoodsGetForFree => 'Hämta gratis';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'Köp för $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'Inga köp än';

  @override
  String get digitalGoodsUnknownProduct => 'Okänd produkt';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'Köpt $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Kopiera nyckel';

  @override
  String get digitalGoodsLicenseKeyCopied => 'Licensnyckel kopierad!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'Löper ut $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'Din licensnyckel';

  @override
  String get digitalGoodsCopyKeyButton => 'Kopiera nyckel';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'Kunde inte starta utcheckningen -- den här skaparen kanske inte har anslutit Stripe än.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'Köpet är klart! Hitta det under Mina köp.';

  @override
  String get digitalGoodsPurchasePending =>
      'Väntar fortfarande på betalningen -- den visas under Mina köp när den är klar.';

  @override
  String get digitalGoodsCreateProductTitle => 'Skapa produkt';

  @override
  String get digitalGoodsEditProductTitle => 'Redigera produkt';

  @override
  String get digitalGoodsProductTitleHint => 'Produktnamn';

  @override
  String get digitalGoodsDescriptionHint => 'Beskrivning (valfritt)';

  @override
  String get digitalGoodsPriceHint => 'Pris i USD (lämna tomt för gratis)';

  @override
  String get digitalGoodsProductTypeLabel => 'Produkttyp';

  @override
  String get digitalGoodsFileDownloadOption => 'Filnedladdning';

  @override
  String get digitalGoodsLicenseKeyOption => 'Licensnyckel';

  @override
  String get digitalGoodsAvailabilityLabel => 'Tillgänglighet';

  @override
  String get digitalGoodsThisServerOnlyOption => 'Endast den här servern';

  @override
  String get digitalGoodsAllKodaServersOption => 'Alla Koda-servrar';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'Efter skapandet, använd knappen \"Nycklar\" för att ladda upp dina licensnycklar.';

  @override
  String get digitalGoodsProductFileLabel => 'Produktfil';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName (${sizeMb}MB)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Ta bort fil';

  @override
  String get digitalGoodsUploadingLabel => 'Laddar upp...';

  @override
  String get digitalGoodsChooseFileButton => 'Välj fil';

  @override
  String get digitalGoodsReplaceFileButton => 'Ersätt fil';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Välj en fil för den här produkten innan du sparar.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'Ladda upp licensnycklar';

  @override
  String get digitalGoodsPasteKeysHint => 'Klistra in en nyckel per rad:';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Ladda upp nycklar';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'Licensnycklar uppladdade!';

  @override
  String get serverSubscriptionManageTitle => 'Hantera prenumerationer';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return '$serverName prenumerationer';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Lägg till nivå';

  @override
  String get serverSubscriptionNoTiersYet => 'Inga prenumerationsnivåer än';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Skapa upp till 3 nivåer för din community';

  @override
  String get serverSubscriptionCreateFirstTierButton => 'Skapa första nivån';

  @override
  String get serverSubscriptionShowSubscriberCounts =>
      'Visa antal prenumeranter';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/mån';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktiva prenumeranter',
      one: '$count aktiv prenumerant',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned => 'Roll tilldelas automatiskt';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '$discount% rabatt på marknadsplatsen';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'Den här servern har inga prenumerationsnivåer';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Aktiv prenumerant';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'Löper ut $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk => 'Exklusiv prenumerantroll';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return '$discount% rabatt på köp på marknadsplatsen';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Kanaler endast för prenumeranter';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Prenumererar just nu';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'Prenumerera för $price/mån';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Skapa nivå';

  @override
  String get serverSubscriptionEditTierTitle => 'Redigera nivå';

  @override
  String get serverSubscriptionTierNameHint =>
      'Nivånamn (t.ex. Fan, Supporter, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Beskrivning (valfritt)';

  @override
  String get serverSubscriptionPriceHint => 'Pris per månad (USD)';

  @override
  String get serverSubscriptionDiscountLabel => 'Rabatt på marknadsplatsen i %';

  @override
  String get serverSubscriptionPositionLabel => 'Position';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Nivå $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Ger roll vid prenumeration — valfritt';

  @override
  String get serverSubscriptionRoleFallback => 'roll';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Ges automatiskt till en medlem så fort de prenumererar, och tas bort så fort deras prenumeration upphör.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Nivå skapad -- anslut Stripe under Marknadsplats → Skapare innan medlemmar kan prenumerera på den.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Ta bort nivå';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return 'Ta bort \"$tierName\"? Befintliga prenumeranter behåller åtkomst tills det löper ut.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'Prenumerera på $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel =>
      'Månadsprenumeration';

  @override
  String get serverSubscriptionServerBankEarnsLabel => 'Serverbanken tjänar';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points poäng';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Betalningen hanteras säkert av Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'Prenumerera';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'Kunde inte starta utcheckningen -- den här serverns ägare kanske inte har anslutit Stripe än.';

  @override
  String get serverSubscriptionSubscribed => 'Prenumererar!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'Väntar fortfarande på betalningen -- den aktiveras när den är klar.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'Ge dricks till $username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Välj belopp';

  @override
  String get tipDialogMessageHint => 'Lägg till ett meddelande (valfritt)';

  @override
  String get tipDialogYouPayLabel => 'Du betalar';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username får';
  }

  @override
  String get tipDialogSendTipButton => 'Skicka dricks';

  @override
  String get tipDialogFailedToSendTip =>
      'Det gick inte att skicka dricksen. Skaparen kanske inte är ansluten till Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'Kunde inte starta utcheckningen. Försök igen om en liten stund.';

  @override
  String get tipDialogTipSent => 'Dricks skickad!';

  @override
  String get tipDialogTipPending =>
      'Väntar fortfarande på betalningen -- den går igenom när den är klar.';

  @override
  String get tipDialogUnknownUser => 'Okänd';

  @override
  String get marketplaceTitle => 'Marknadsplats';

  @override
  String get marketplaceCreatorPayoutsTitle => 'Utbetalningar till skapare';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Ta emot dricks direkt via Stripe';

  @override
  String get marketplaceTabServerBank => 'Serverbank';

  @override
  String get marketplaceTabDigitalGoods => 'Digitala varor';

  @override
  String get marketplaceTabMerch => 'Merch';

  @override
  String get marketplaceTabSubscription => 'Prenumeration';

  @override
  String get marketplaceTabRevenue => 'Intäkter';

  @override
  String get marketplaceSelectServerSubscription =>
      'Välj en server för att se dess prenumeration';

  @override
  String get marketplaceSelectServerBank =>
      'Välj en server för att se dess bank';

  @override
  String get marketplaceSelectServerRevenue =>
      'Välj en server för att se dess intäkter';

  @override
  String get marketplaceStripeAccountStatus => 'Stripe-konto';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Registrering klar';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'Tar emot betalningar';

  @override
  String get marketplaceConnectStripeButton => 'Anslut Stripe-konto';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Slutför Stripe-registrering';

  @override
  String get marketplaceRefreshStatusButton => 'Uppdatera status';

  @override
  String get marketplaceReadyToReceiveTips => 'Du är redo att ta emot dricks!';

  @override
  String get marketplaceHowItWorksTitle => 'Så här fungerar det';

  @override
  String get marketplaceHowItWorksStep1 => 'Anslut ditt Stripe-konto';

  @override
  String get marketplaceHowItWorksStep2 => 'Slutför identitetsverifiering';

  @override
  String get marketplaceHowItWorksStep3 =>
      'Ta emot dricks direkt till din bank';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda tar en behandlingsavgift på 5%. Avgiften går till din servers bank som poäng.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Endast serverägaren eller någon med behörigheten Hantera marknadsplats kan se serverbanken.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName har boostats!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit platser för egna emojier';
  }

  @override
  String get marketplaceServerFallback => 'Server';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance poäng';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount i aktivitet';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'Poäng tjänas från 5%-behandlingsavgiften på dricks och prenumerationer på den här servern. Använd poäng för att låsa upp serveruppgraderingar.';

  @override
  String get marketplaceServerBoostsTitle => 'Serverboostar';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Nivå $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktiva boostar',
      one: '$count aktiv boost',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: '$more boostar till för att nå nivå $level',
      one: '$more boost till för att nå nivå $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' och lås upp en egen serverbakgrund';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' och lås upp en egen ram för serverikonen';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Du har $count boosttoken tillgängliga.',
      one: 'Du har $count boosttoken tillgänglig.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'Boosttoken kommer från en Pulse-prenumeration (1/månad). Prenumerera på fliken Prenumerationer för att tjäna en.';

  @override
  String get marketplaceBoostingLabel => 'Boostar...';

  @override
  String get marketplaceBoostThisServerButton => 'Boosta den här servern';

  @override
  String get marketplaceComingSoonUpgradesTitle =>
      'Kommer snart — Serveruppgraderingar';

  @override
  String get marketplaceSpendPointsList =>
      'Spendera serverbankens poäng på:\n• Egen serverdomän\n• Ökad medlemsgräns\n• Prioriterad support\n• Exklusivt servermärke';

  @override
  String get marketplaceSourceTip => 'Dricks';

  @override
  String get marketplaceSourceSubscription => 'Koda-prenumerationer';

  @override
  String get marketplaceSourceServerSubscription => 'Serverprenumerationer';

  @override
  String get marketplaceSourceDigitalProduct => 'Digitala varor';

  @override
  String get marketplaceSourceStageTicket => 'Scenbiljetter';

  @override
  String get marketplaceSourcePrintfulOrder => 'Merchbeställningar';

  @override
  String get marketplaceJustNow => 'just nu';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return '$minutes min sedan';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return '$hours tim sedan';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return '$days d sedan';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Endast medlemmar som kan hantera marknadsplatsen kan se den här serverns intäkter.';

  @override
  String get marketplaceBalanceLabel => 'Saldo';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Totalt intjänat';

  @override
  String get marketplaceLast30DaysTitle => 'Senaste 30 dagarna';

  @override
  String get marketplaceRevenueBySourceTitle => 'Intäkter per källa';

  @override
  String get marketplaceNoRevenueYet => 'Inga intäkter än.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count transaktioner',
      one: '$count transaktion',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'Senaste transaktioner';

  @override
  String get marketplaceNoTransactionsYet => 'Inga transaktioner än.';

  @override
  String get marketplaceNoActivityYet => 'Ingen aktivitet än';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Synkade $count produkter från Printful',
      one: 'Synkade $count produkt från Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Kunde inte synka med Printful -- kontrollera anslutningen i Merch-inställningarna.';

  @override
  String get printfulMerchSelectServer =>
      'Välj en server för att se dess merch';

  @override
  String get printfulMerchManageCatalogTitle => 'Hantera merchkatalog';

  @override
  String get printfulMerchTitle => 'Merch';

  @override
  String get printfulMerchSyncingLabel => 'Synkar...';

  @override
  String get printfulMerchSyncCatalogButton => 'Synka katalog';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'Växla till Bläddra';

  @override
  String get printfulMerchManageTooltip => 'Hantera den här serverns merch';

  @override
  String get printfulMerchNothingSyncedYet => 'Inget synkat än';

  @override
  String get printfulMerchNoMerchAvailable => 'Ingen merch tillgänglig än';

  @override
  String get printfulMerchSyncHint =>
      'Synka din Printful-butik för att hämta din produktkatalog';

  @override
  String get printfulMerchCheckBackLater =>
      'Titta tillbaka senare för merch från den här servern';

  @override
  String get printfulMerchOutOfStock => 'Slut i lager';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Från $price • $count alternativ',
      one: 'Från $price • $count alternativ',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'Visa';

  @override
  String printfulMerchPayoutTo(String username) {
    return 'Utbetalning till: $username';
  }

  @override
  String get printfulMerchPayoutToYou => 'Utbetalning till: dig';

  @override
  String get printfulMerchPayoutChangeButton => 'Ändra';

  @override
  String get printfulMerchPayoutDialogTitle => 'Utbetalningsmottagare';

  @override
  String get printfulMerchPayoutDialogBody =>
      'Skicka den här artikelns andel av orderintäkterna till en annan användare istället för dig själv -- personen måste koppla sitt eget Stripe-konto och slutföra registreringen innan någon kan köpa den.';

  @override
  String get printfulMerchPayoutUsernameHint => 'Användarnamn';

  @override
  String get printfulMerchPayoutLookupButton => 'Sök';

  @override
  String get printfulMerchPayoutUserNotFound =>
      'Ingen användare med det namnet hittades.';

  @override
  String printfulMerchPayoutResolvedAs(String username) {
    return 'Hittad: $username';
  }

  @override
  String get printfulMerchPayoutResetButton => 'Återställ till mig';

  @override
  String get printfulMerchCartTooltip => 'Varukorg';

  @override
  String printfulMerchAddedToCart(String productName) {
    return 'Lade till $productName i varukorgen';
  }

  @override
  String get printfulMerchQuantityLabel => 'Antal';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Minska antal';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Öka antal';

  @override
  String get printfulMerchAddToCartButton => 'Lägg i varukorg';

  @override
  String get printfulMerchOptionLabel => 'Alternativ';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Stil';

  @override
  String get printfulMerchSizeLabel => 'Storlek';

  @override
  String get printfulMerchYourCartTitle => 'Din varukorg';

  @override
  String get printfulMerchCartEmpty => 'Din varukorg är tom.';

  @override
  String get printfulMerchSubtotalLabel => 'Delsumma';

  @override
  String get printfulMerchCheckoutLabel => 'Kassa';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'Ta bort från varukorgen';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Fyll i din leveransadress först.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'Kunde inte hämta fraktpriser för den adressen.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'Kunde inte starta utcheckningen. Försök igen om en liten stund.';

  @override
  String get printfulMerchOrderPlaced => 'Beställning lagd!';

  @override
  String get printfulMerchOrderPending =>
      'Väntar fortfarande på betalningen -- den läggs när den är klar.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Leveranshastighet';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max arbetsdagar';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => 'Hämta fraktoffert';

  @override
  String get printfulMerchPayButton => 'Betala';

  @override
  String get kodaMarketplaceTitle => 'Koda Marknadsplats';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Prenumerationer';

  @override
  String get kodaMarketplaceTabBoosts => 'Boostar';

  @override
  String get kodaMarketplaceTabDiscover => 'Upptäck';

  @override
  String get kodaMarketplaceTierFreeName => 'Gratis';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'Löper ut $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks =>
      'Uppgradera för exklusiva förmåner';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count boosttoken tillgängliga',
      one: '$count boosttoken tillgänglig',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Skänk ett token till valfri server du är med i från dess flik Serverbank';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => 'Egen avatarram';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Spark-märke på profilen';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Ökad gräns för filuppladdning (50MB)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality => 'Prioriterad röstkvalitet';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'Allt i Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => 'Animerad avatarram';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Pulse-märke på profilen';

  @override
  String get kodaMarketplacePulsePerkFileLimit =>
      '100MB gräns för filuppladdning';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      '1 serverboosttoken per månad';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/mån';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Nuvarande plan';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'Skaffa $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return 'Skänk $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return 'Skänk $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'Prenumerera på $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel => 'Mottagarens användarnamn:';

  @override
  String get kodaMarketplaceUsernameHint => 'Användarnamn';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Prenumeration';

  @override
  String get kodaMarketplaceTotalLabel => 'Totalt';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Betalningen hanteras säkert av Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'Fortsätt till betalning';

  @override
  String get kodaMarketplaceUserNotFound => 'Användaren hittades inte';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'Kunde inte starta utcheckningen. Försök igen om en liten stund.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'Prenumeration aktiv!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'Väntar fortfarande på betalningen -- den aktiveras när den är klar.';

  @override
  String get kodaMarketplaceBoostPurchased => 'Boost köpt!';

  @override
  String get kodaMarketplaceBoostPending =>
      'Väntar fortfarande på betalningen -- den blir klar när betalningen är klar.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count tillgängliga';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Köp en boost';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'Ett engångsköp -- Pulse-prenumeranter får också ett gratis token vid varje förnyelse, vilket förblir den bättre affären om du boostar regelbundet.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Köp en boost -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Inga servrar har anslutit sig till Koda Marknadsplats än. Serverägare kan aktivera detta i sina serverinställningar under Anpassa.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => 'I FOKUS DENNA VECKA';

  @override
  String get kodaMarketplaceAllListedServersHeader => 'ALLA LISTADE SERVRAR';

  @override
  String get kodaMarketplaceFeaturedItemsHeader => 'UTVALDA ARTIKLAR';

  @override
  String get kodaMarketplaceAllItemsHeader => 'ALLA ARTIKLAR';

  @override
  String get kodaMarketplaceServerFallback => 'Server';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count medlemmar',
      one: '$count medlem',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceVisitStore => 'Besök butiken';

  @override
  String get calendarFallbackTitle => 'Kalender';

  @override
  String get calendarAskVispTooltip => 'Fråga Visp';

  @override
  String get calendarCreateEventTooltip => 'Skapa händelse';

  @override
  String get calendarSyncTooltip => 'Synka med din kalenderapp';

  @override
  String get calendarSyncDialogTitle => 'Synka denna kalender';

  @override
  String get calendarSyncDialogDescription =>
      'Prenumerera på den här URL:en från Google Kalender, Apple Kalender, Outlook eller någon app som stöder \"prenumerera via URL\" för att se den här serverns händelser i din egen kalender. Skrivskyddad, och innehåller bara händelser från kanaler du kan se.';

  @override
  String get calendarSyncCopyTooltip => 'Kopiera URL';

  @override
  String get calendarSyncCopiedToast => 'Kalender-URL kopierad.';

  @override
  String get calendarSyncRegenerateTooltip => 'Generera ny URL';

  @override
  String get calendarSyncRegenerate => 'Generera ny';

  @override
  String get calendarSyncRegenerateConfirmTitle => 'Generera ny kalender-URL?';

  @override
  String get calendarSyncRegenerateConfirmBody =>
      'Den gamla URL:en slutar fungera omedelbart -- där du redan prenumererar behövs den nya.';

  @override
  String get calendarSyncInstructions =>
      'Google Kalender: Andra kalendrar > Via URL. Apple Kalender: Arkiv > Ny kalenderprenumeration. Outlook: Lägg till kalender > Prenumerera från webben.';

  @override
  String get calendarPreviousMonthTooltip => 'Föregående månad';

  @override
  String get calendarNextMonthTooltip => 'Nästa månad';

  @override
  String get calendarTodayButton => 'Idag';

  @override
  String get calendarWeekdaySun => 'Sön';

  @override
  String get calendarWeekdayMon => 'Mån';

  @override
  String get calendarWeekdayTue => 'Tis';

  @override
  String get calendarWeekdayWed => 'Ons';

  @override
  String get calendarWeekdayThu => 'Tor';

  @override
  String get calendarWeekdayFri => 'Fre';

  @override
  String get calendarWeekdaySat => 'Lör';

  @override
  String get calendarTodaySuffix => ', idag';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count händelser',
      one: ', $count händelse',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'Välj en dag';

  @override
  String get calendarNoEvents => 'Inga händelser';

  @override
  String get calendarSubscribeTooltip => 'Prenumerera';

  @override
  String get calendarUnsubscribeTooltip => 'Avsluta prenumeration';

  @override
  String get calendarReminderOffTooltip => 'Påminn mig';

  @override
  String get calendarReminderOnTooltip => 'Stäng av påminnelse';

  @override
  String get calendarAddToCalendarTooltip => 'Lägg till i min kalender';

  @override
  String get calendarIcsSaved => 'Kalenderfil sparad';

  @override
  String get upcomingEventsTitle => 'Kommande';

  @override
  String get upcomingEventsEmptyState =>
      'Inga kommande evenemang på dina servrar';

  @override
  String get userCalendarMyTitle => 'My calendar';

  @override
  String userCalendarOtherTitle(String username) {
    return '$username\'s calendar';
  }

  @override
  String get userCalendarEmptyState => 'No confirmed events yet';

  @override
  String get upcomingEventsPublicBadge => 'Offentlig';

  @override
  String upcomingEventsFriendGoing(String name) {
    return '$name ska gå';
  }

  @override
  String upcomingEventsTwoFriendsGoing(String name1, String name2) {
    return '$name1 och $name2 ska gå';
  }

  @override
  String upcomingEventsManyFriendsGoing(String name, int count) {
    return '$name och $count till ska gå';
  }

  @override
  String get activityFeedTitle => 'Aktivitetsflöde';

  @override
  String get activityFeedEmptyState => 'Ingen aktivitet från dina vänner än';

  @override
  String activityFeedAchievement(
      String username, String achievement, String server) {
    return '$username fick $achievement på $server';
  }

  @override
  String activityFeedWentLive(String username, String platform) {
    return '$username sänder live på $platform';
  }

  @override
  String activityFeedServerJoined(String username, String server) {
    return '$username gick med i $server';
  }

  @override
  String activityFeedArcadeHighScore(String username, String game, int score) {
    return '$username fick ett nytt högsta resultat i $game: $score';
  }

  @override
  String get activityFeedJustNow => 'Just nu';

  @override
  String activityFeedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuter sedan',
      one: '1 minut sedan',
    );
    return '$_temp0';
  }

  @override
  String activityFeedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count timmar sedan',
      one: '1 timme sedan',
    );
    return '$_temp0';
  }

  @override
  String activityFeedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagar sedan',
      one: '1 dag sedan',
    );
    return '$_temp0';
  }

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'Upprepas $recurrence';
  }

  @override
  String get calendarTicketOwned => 'Biljett ägd';

  @override
  String calendarTicketPrice(String price) {
    return '$price biljett';
  }

  @override
  String get calendarDeleteEventTitle => 'Ta bort händelse';

  @override
  String calendarDeleteEventConfirm(String title) {
    return 'Ta bort \"$title\"? Detta kan inte ångras.';
  }

  @override
  String get calendarEditEventTitle => 'Redigera händelse';

  @override
  String get calendarCreateEventTitle => 'Skapa händelse';

  @override
  String get calendarEventTitleHint => 'Händelsens titel';

  @override
  String get calendarDescriptionHint => 'Beskrivning (valfritt)';

  @override
  String get calendarLocationHint => 'Plats (valfritt)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Start ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Startdatum och -tid, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'Slut — valfritt ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'Slutdatum och -tid, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'inte inställt';

  @override
  String get calendarTapToSetEndTime => 'Tryck för att ställa in sluttid';

  @override
  String get calendarRecurrenceLabel => 'Upprepning';

  @override
  String get calendarRecurrenceNone => 'Upprepas inte';

  @override
  String get calendarRecurrenceDaily => 'Dagligen';

  @override
  String get calendarRecurrenceWeekly => 'Veckovis';

  @override
  String get calendarRecurrenceMonthly => 'Månadsvis';

  @override
  String get calendarColorLabel => 'Färg';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Färg $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Biljettpris — valfritt';

  @override
  String get calendarLinkStageChannelLabel => 'Länka till scenkanal — valfritt';

  @override
  String get calendarStageChannelFallback => 'scen';

  @override
  String get discordImportFetchError => 'Kunde inte hämta mallen.';

  @override
  String get discordImportApplyError =>
      'Det gick inte att tillämpa mallen. Försök igen.';

  @override
  String get discordImportTitle => 'Importera Discord-mall';

  @override
  String get discordImportDescription =>
      'Klistra in en discord.new-länk eller mallkod för att importera roller, kategorier och kanaler till den här servern.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 eller mallkod';

  @override
  String get discordImportPreviewButton => 'Förhandsgranska';

  @override
  String get discordImportTemplateFallback => 'Mall';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count roller',
      one: '$count roll',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kategorier',
      one: '$count kategori',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kanaler',
      one: '$count kanal',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel => 'ERSÄTT BEFINTLIG STRUKTUR';

  @override
  String get discordImportReplaceWarning =>
      'Alla befintliga kanaler, kategorier och roller kommer att tas bort permanent.';

  @override
  String get discordImportAddDescription =>
      'Mallen läggs till i din befintliga serverstruktur.';

  @override
  String get discordImportReplaceConfirmTitle => 'Ersätta serverstrukturen?';

  @override
  String get discordImportReplaceConfirmBody =>
      'Detta tar permanent bort ALLA befintliga kanaler, kategorier och roller innan importen. Detta kan inte ångras.';

  @override
  String get discordImportYesReplace => 'Ja, ersätt';

  @override
  String get discordImportReplaceAndImportButton => 'Ersätt och importera mall';

  @override
  String get discordImportAddToServerButton => 'Lägg till mall på servern';

  @override
  String get thresholdModConfigureTitle => 'Konfigurera tröskelmoderering';

  @override
  String get thresholdModConfigureExplanation =>
      'Välj betrodda moderatorer och hur många av dem som måste hålla med innan någon av dem kan dekryptera en epok av en kanals historik. Inte ens du får en ensidig nyckel -- du undantas bara om du också finns med på den här listan.';

  @override
  String get thresholdModThresholdLabel => 'Tröskel:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Minska tröskeln';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Öka tröskeln';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'av $count moderatorer',
      one: 'av $count moderator',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle => 'Begär tröskeldekryptering';

  @override
  String get thresholdModChannelLabel => 'Kanal';

  @override
  String get thresholdModReasonHint =>
      'Anledning -- visas för varje utsedd moderator';

  @override
  String get thresholdModRequestButton => 'Begär';

  @override
  String get thresholdModShareRelayed =>
      'Andel vidarebefordrad till begäraren.';

  @override
  String get thresholdModNotEnoughShares =>
      'Inte tillräckligt med andelar vidarebefordrade än -- försök igen när fler moderatorer har vidarebefordrat sina.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meddelanden',
      one: '$count meddelande',
    );
    return 'Epok $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'Inga dekrypterbara meddelanden i den här epoken.';

  @override
  String get thresholdModExplanation =>
      'Verklig dekryptering av en kanals historik, som kräver att flera utsedda moderatorer aktivt håller med -- aldrig en enda person, inte ens serverägaren. Låser bara upp en hel epok i taget (allt som skickats sedan senaste medlemsförändringen), aldrig ett enskilt meddelande.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Aktiverad -- $count moderatorer, tröskel $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'Inte konfigurerad';

  @override
  String get thresholdModReconfigureButton => 'Konfigurera om';

  @override
  String get thresholdModEnableButton => 'Aktivera';

  @override
  String get thresholdModNotEnabledForServer =>
      'Tröskelmoderering är inte aktiverad för den här servern.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Aktiverad för den här servern. Du är inte en av de utsedda moderatorerna.';

  @override
  String get thresholdModRequestsLabel => 'Förfrågningar';

  @override
  String get thresholdModRequestDecryptButton => 'Begär dekryptering';

  @override
  String get thresholdModNoActiveRequests => 'Inga aktiva förfrågningar.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- epok $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'väntande';

  @override
  String get thresholdModStatusApproved => 'godkänd';

  @override
  String get thresholdModApproveButton => 'Godkänn';

  @override
  String get thresholdModRelayShareButton => 'Vidarebefordra min andel';

  @override
  String get thresholdModTryReconstructButton => 'Försök återskapa';

  @override
  String get roleSelectNoRolesAvailable =>
      'Inga självtilldelningsbara roller tillgängliga.';

  @override
  String get roleSelectInstructions =>
      'Välj de roller du vill ha. Tryck på en roll för att lägga till eller ta bort den.';

  @override
  String get rulesScreenAcceptError =>
      'Kunde inte acceptera reglerna. Försök igen.';

  @override
  String get rulesScreenSubtitle => 'Serverregler';

  @override
  String get rulesScreenScrollToRead => 'Bläddra ner för att läsa alla regler';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'Genom att klicka på Acceptera godkänner du att följa dessa regler.\nÖverträdelser kan leda till att du tas bort från servern.';

  @override
  String get rulesScreenAcceptButton => 'Jag accepterar reglerna';

  @override
  String get rulesScreenReadAllToContinue =>
      'Läs alla regler för att fortsätta';

  @override
  String get galleryNewPostTitle => 'Nytt inlägg';

  @override
  String get galleryChooseFileButton => 'Välj fil';

  @override
  String get galleryOrDivider => 'eller';

  @override
  String get galleryPasteUrlHint => 'Klistra in bild-/video-URL';

  @override
  String get galleryTypeLabel => 'Typ';

  @override
  String get galleryImageOption => 'Bild';

  @override
  String get galleryVideoOption => 'Video';

  @override
  String get galleryCaptionHint => 'Bildtext (valfritt)';

  @override
  String get galleryPostButton => 'Publicera';

  @override
  String get galleryNewCollectionTitle => 'Ny samling';

  @override
  String get galleryCollectionNameHint => 'Samlingens namn';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return 'Ta bort \"$collectionName\"? Inlägg inuti blir osamlade.';
  }

  @override
  String get galleryFeedTab => 'Flöde';

  @override
  String get galleryCollectionsTab => 'Samlingar';

  @override
  String get galleryNoPostsYet => 'Inga inlägg än';

  @override
  String get galleryNoCollectionsYet => 'Inga samlingar än';

  @override
  String get gallerySelectACollection => 'Välj en samling';

  @override
  String get galleryNoPostsInCollection => 'Inga inlägg i den här samlingen';

  @override
  String get galleryAddPostButton => 'Lägg till inlägg';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Skärmdelning misslyckades: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return '${username}s volym';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'Påverkar bara det du hör -- den här enheten, det här samtalet.';

  @override
  String get voiceScreenResetVolumeButton => 'Återställ';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'Kunde inte ansluta: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Din skärm, tryck för helskärm';

  @override
  String get voiceScreenYourScreenLabel => 'Din skärm';

  @override
  String get voiceScreenTapToClose => 'Tryck för att stänga';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (du)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', talar';

  @override
  String get voiceScreenCameraOnSuffix => ', kameran på';

  @override
  String get voiceScreenActivateToPopOut => ', aktivera för att lyfta ut';

  @override
  String get voiceScreenShowVarmTooltip => 'Visa VARM';

  @override
  String get voiceScreenHideVarmTooltip => 'Dölj VARM';

  @override
  String get voiceScreenShowChatTooltip => 'Visa chatt';

  @override
  String get voiceScreenHideChatTooltip => 'Dölj chatt';

  @override
  String get voiceScreenStartCameraTooltip => 'Starta kamera';

  @override
  String get voiceScreenStopCameraTooltip => 'Stäng av kamera';

  @override
  String get voiceScreenShareScreenTooltip => 'Dela skärm';

  @override
  String get voiceScreenStopSharingTooltip => 'Sluta dela';

  @override
  String get voiceScreenPopOutTooltip => 'Lyft ut röst till separat fönster';

  @override
  String get voiceScreenCouldNotPopOut => 'Kunde inte lyfta ut rösten.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Lämna röstkanal';

  @override
  String get voiceScreenPinTooltip => 'Fäst (håll öppen)';

  @override
  String get voiceScreenUnpinTooltip => 'Lossa';

  @override
  String get voiceScreenSizeSmall => 'Liten (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Mellan (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Stor (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, $count anslutna';
  }

  @override
  String get voiceBarSpeakingSuffix => ', du talar';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count anslutna · tryck för att expandera';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Starta kamera';

  @override
  String get voiceBarStopCameraTooltip => 'Stäng av kamera';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Lämna röstkanal';

  @override
  String get popOutVideoFallbackTitle => 'Röst';

  @override
  String get popOutVideoMissingTokenError => 'Token eller URL saknas';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Anslutningen tidsgränsades efter 15 sekunder';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Fel: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'Inga deltagare';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Scen';

  @override
  String get stageCouldNotJoin => 'Kunde inte gå med i scenen.';

  @override
  String get stageThisStageFallback => 'Den här scenen';

  @override
  String get stageRequiresTicketToJoin => 'kräver en biljett för att gå med';

  @override
  String get stagePleaseWaitLabel => 'Vänta...';

  @override
  String get stageGetFreeTicketButton => 'Hämta gratis biljett';

  @override
  String stageBuyTicketButton(String price) {
    return 'Köp biljett -- $price';
  }

  @override
  String get stageNotNowButton => 'Inte nu';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'Kunde inte starta biljettköpet.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'Väntar fortfarande på betalningen -- försök gå med igen när den är bekräftad.';

  @override
  String get stageSpeakerBadge => 'Talare';

  @override
  String get stageListenerBadge => 'Lyssnare';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'Kunde inte gå med: $error';
  }

  @override
  String get stageSpeakersHeader => 'TALARE';

  @override
  String get stageRaisedHandsHeader => 'RÄCKTA UPP HÄNDER';

  @override
  String get stageAllowButton => 'Tillåt';

  @override
  String get stageIgnoreButton => 'Ignorera';

  @override
  String get stageListenersHeader => 'LYSSNARE';

  @override
  String get stageRaiseHandTooltip => 'Räck upp handen';

  @override
  String get stageLowerHandTooltip => 'Sänk handen';

  @override
  String get stageLeaveStageTooltip => 'Lämna scenen';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (du)';
  }

  @override
  String get stageMoveToListenersButton => 'Flytta till lyssnare';

  @override
  String get stageYouFallbackName => 'Du';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'Avatar för $username';
  }

  @override
  String get channelEditDialogNewTitle => 'Ny kanal';

  @override
  String get channelEditDialogEditTitle => 'Redigera kanal';

  @override
  String get channelEditDialogNameHint => 'Kanalnamn';

  @override
  String get channelEditDialogDescriptionHint => 'Ämne (valfritt)';

  @override
  String get channelEditDialogTypeLabel => 'Typ';

  @override
  String get channelEditDialogTypeText => 'Text';

  @override
  String get channelEditDialogTypeVoice => 'Röst';

  @override
  String get channelEditDialogTypeGallery => 'Galleri';

  @override
  String get channelEditDialogTypeStage => 'Scen';

  @override
  String get channelEditDialogTypeRules => 'Regler';

  @override
  String get channelEditDialogTypeRoleSelection => 'Rollval';

  @override
  String get channelEditDialogTypeCalendar => 'Kalender';

  @override
  String get channelEditDialogAnnouncementTitle => 'Tillkännagivandekanal';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Endast medlemmar som kan hantera meddelanden får posta';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Posta tillkännagivanden om livesändningar och uppladdningar här';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'Postar automatiskt när en medlem med behörigheten \"Meddela vid livesändning\" börjar sända live på Twitch eller postar en ny YouTube-video';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Meddela dessa roller vid postning (valfritt)';

  @override
  String get channelEditDialogSlowmodeLabel => 'Långsamt läge';

  @override
  String get channelEditDialogSlowmodeOff => 'Av';

  @override
  String get channelEditDialogUserLimitLabel => 'Användargräns';

  @override
  String get channelEditDialogUserLimitOff => 'Ingen gräns';

  @override
  String get channelEditDialogCategoryLabel => 'Kategori';

  @override
  String get channelEditDialogNoCategory => 'Ingen kategori';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Rollåtkomst (lämna tomt för alla)';

  @override
  String get channelEditDialogContentLabelsLabel => 'Innehållsetiketter';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Märker den här kanalen för medlemmars innehållsfilter; helt blockerad för övervakade konton';

  @override
  String get categoryEditDialogNewTitle => 'Ny kategori';

  @override
  String get categoryEditDialogEditTitle => 'Redigera kategori';

  @override
  String get categoryEditDialogNameHint => 'Kategorinamn';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Rollåtkomst (lämna tomt för alla)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Medlemmar — $count online';
  }

  @override
  String get memberPanelRefreshTooltip => 'Uppdatera medlemslistan';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count medlemmar',
      one: '$count medlem',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Offline';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', $tier-nivå';
  }

  @override
  String get memberPanelUnknownUser => 'Okänd';

  @override
  String get memberPanelModerationActionsTooltip => 'Modereringsåtgärder';

  @override
  String get reportDialogReasonSpam => 'Spam';

  @override
  String get reportDialogReasonHarassment => 'Trakasserier eller missbruk';

  @override
  String get reportDialogReasonIllegal => 'Olagligt innehåll';

  @override
  String get reportDialogReasonOther => 'Annat';

  @override
  String get reportDialogReasonLabel => 'Anledning';

  @override
  String get reportDialogNoteHint =>
      'Något annat moderatorerna bör veta? (valfritt)';

  @override
  String get reportDialogDisclosureNote =>
      'Meddelandeinnehållet som visas för dig och vem som skickade det kommer att delas med den här serverns moderatorer.';

  @override
  String get reportDialogSubmitButton => 'Skicka rapport';

  @override
  String get reportDialogSubmitError => 'Kunde inte skicka rapporten.';

  @override
  String get notificationBellTitle => 'Aviseringar';

  @override
  String get notificationBellMarkAllRead => 'Markera alla som lästa';

  @override
  String get notificationBellEmptyState => 'Inga aviseringar än';

  @override
  String get notificationBellUnreadLabel => 'Oläst';

  @override
  String get invitePreviewTitle => 'Serverinbjudan';

  @override
  String get invitePreviewInvalidOrExpired =>
      'Ogiltig eller utgången inbjudan.';

  @override
  String get invitePreviewCouldNotJoin => 'Kunde inte gå med i servern.';

  @override
  String get invitePreviewUnknownServer => 'Okänd server';

  @override
  String get shippingAddressFullNameHint => 'Fullständigt namn';

  @override
  String get shippingAddressLine1Hint => 'Adressrad 1';

  @override
  String get shippingAddressLine2Hint => 'Adressrad 2 (valfritt)';

  @override
  String get shippingAddressCityHint => 'Stad';

  @override
  String get shippingAddressStateHint => 'Delstat/region';

  @override
  String get shippingAddressZipHint => 'Postnummer';

  @override
  String get shippingAddressCountryCodeHint => 'Landskod (t.ex. US)';

  @override
  String get shippingAddressPhoneHint => 'Telefon (valfritt)';

  @override
  String get shippingAddressPrivacyNote =>
      'Används endast för att skicka den här beställningen -- se Printfuls egen integritetspolicy för hur de hanterar det när beställningen har lagts.';

  @override
  String get updateNudgeAvailableTitle => 'Uppdatering tillgänglig';

  @override
  String get updateNudgeRequiredTitle => 'Uppdatering krävs';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $version är tillgänglig -- du använder en äldre version.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'Den här versionen stöds inte längre. Uppdatera till Koda $version för att fortsätta använda Koda.';
  }

  @override
  String get updateNudgeLaterButton => 'Senare';

  @override
  String get updateNudgeUpdateNowButton => 'Uppdatera nu';

  @override
  String updateNudgeDownloading(int percent) {
    return 'Laddar ner uppdatering... $percent%';
  }

  @override
  String get updateNudgeVerifying => 'Verifierar nedladdning...';

  @override
  String get updateNudgeLaunching => 'Startar installationsprogrammet...';

  @override
  String get updateNudgeFailed =>
      'Det gick inte att slutföra uppdateringen. Du kan ladda ner den manuellt istället.';

  @override
  String get tierBadgeSparkSubscriber => 'Spark-prenumerant';

  @override
  String get tierBadgePulseSubscriber => 'Pulse-prenumerant';

  @override
  String get tierBadgeAlphaSpark => 'Alpha Spark';

  @override
  String get tierBadgeFounder => 'Founder';

  @override
  String get foundersHallTitle => 'Founders Hall';

  @override
  String get foundersHallSubtitle =>
      'De tidigaste backers som gjorde Koda möjligt.';

  @override
  String get foundersHallEmptyState => 'Inga founders än.';

  @override
  String get settingsFoundersHallTitle => 'Founders Hall';

  @override
  String get settingsFoundersHallSubtitle => 'Se vem som hjälpte bygga Koda';

  @override
  String get settingsWikiTitle => 'Hjälp & Wiki';

  @override
  String get settingsWikiSubtitle => 'Bläddra i Kodas kunskapsbas';

  @override
  String get wikiScreenTitle => 'Hjälp & Wiki';

  @override
  String get wikiScreenEmptyState => 'Inget här än.';

  @override
  String get vispAvatarInDevelopment => 'UNDER UTVECKLING';

  @override
  String get vispBoostAdvisorCouldNotAnswer =>
      'Visp kunde inte sätta ihop ett svar.';

  @override
  String get vispBoostAdvisorTitle => 'Fråga Visp: Boost-ROI-rådgivare';

  @override
  String get vispBoostAdvisorFollowUpHint => 'Ställ en följdfråga...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Skicka';

  @override
  String get vispBoostAdvisorBasedOn => 'Baserat på:';

  @override
  String get vispEventDialogCouldNotGenerate =>
      'Visp kunde inte skapa en händelse.';

  @override
  String get vispEventDialogCouldNotCreate => 'Kunde inte skapa den händelsen.';

  @override
  String get vispEventDialogRecurrenceNone => 'Engångs';

  @override
  String get vispEventDialogRecurrenceDaily => 'Upprepas dagligen';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Upprepas veckovis';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Upprepas månadsvis';

  @override
  String get vispEventDialogTitle => 'Be Visp skapa en händelse';

  @override
  String get vispEventDialogDescription =>
      'Beskriv händelsen -- Visp föreslår en titel, datum/tid och andra detaljer.';

  @override
  String get vispEventDialogPromptHint =>
      't.ex. \"Vecko-D&D-session varje fredag kl. 19 i cirka 3 timmar\"';

  @override
  String get vispEventDialogPrivacyNote =>
      'Din beskrivning skickas till Visp (en självhostad assistent -- inget lämnar Kodas servrar) för att skapa den här planen.';

  @override
  String get vispEventDialogStartOver => 'Börja om';

  @override
  String get vispEventDialogCreateEvent => 'Skapa händelse';

  @override
  String get vispEventDialogThinking => 'Tänker...';

  @override
  String get vispEventDialogGeneratePlan => 'Skapa plan';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'Kunde inte tolka ett datum -- försök omformulera';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Slutar $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price per biljett';
  }

  @override
  String get vispEventDialogBasedOn => 'Baserat på:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Fråga $questionNumber av $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'Eller skriv ditt eget svar...';

  @override
  String get vispQuestionStepSendTooltip => 'Skicka';

  @override
  String get vispQuestionStepSkip => 'Hoppa över och skapa nu';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp kunde inte skapa en plan.';

  @override
  String get vispSetupDialogCouldNotApplyPlan =>
      'Kunde inte tillämpa den planen.';

  @override
  String get vispSetupDialogTitleNew => 'Beskriv din server för Visp';

  @override
  String get vispSetupDialogTitleExisting =>
      'Be Visp lägga till på den här servern';

  @override
  String get vispSetupDialogDescriptionNew =>
      'Beskriv servern du vill ha -- Visp föreslår ett namn och en uppsättning roller, kategorier och kanaler.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Beskriv vad du vill lägga till -- Visp föreslår roller, kategorier och kanaler att skapa.';

  @override
  String get vispSetupDialogPromptHintNew =>
      't.ex. \"En mysig server för min D&D-grupp med röstkanaler för två bord\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      't.ex. \"Lägg till några fler kanaler för våra raid-lag\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      'Din beskrivning skickas till Visp (en självhostad assistent -- inget lämnar Kodas servrar) för att skapa den här planen.';

  @override
  String get vispSetupDialogStartOver => 'Börja om';

  @override
  String get vispSetupDialogCreateServer => 'Skapa server';

  @override
  String get vispSetupDialogAddToServer => 'Lägg till på server';

  @override
  String get vispSetupDialogThinking => 'Tänker...';

  @override
  String get vispSetupDialogGeneratePlan => 'Skapa plan';

  @override
  String get vispSetupDialogNewServerLabel => 'Ny server';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count roller',
      one: '$count roll',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kategorier',
      one: '$count kategori',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kanaler',
      one: '$count kanal',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'Baserat på:';

  @override
  String get childLockoutTitle => 'Det är utanför dina tillåtna timmar';

  @override
  String get childLockoutBody =>
      'En förälder eller vårdnadshavare har ställt in tider då det här kontot får använda Koda. Be dem om mer tid, eller kom tillbaka under nästa tillåtna tidsfönster.';

  @override
  String get childLockoutLogOutButton => 'Logga ut';

  @override
  String get forcePasswordChangeError =>
      'Kunde inte uppdatera lösenordet. Försök igen.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Välkommen, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Ditt konto kräver ett nytt lösenord innan du kan fortsätta.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'Nytt lösenord';

  @override
  String get forcePasswordChangeConfirmPasswordHint => 'Bekräfta nytt lösenord';

  @override
  String get forcePasswordChangeReqLength => 'Minst 12 tecken';

  @override
  String get forcePasswordChangeReqUpper => 'En versal';

  @override
  String get forcePasswordChangeReqLower => 'En gemen';

  @override
  String get forcePasswordChangeReqDigit => 'En siffra';

  @override
  String get forcePasswordChangeReqMatch => 'Lösenorden matchar';

  @override
  String get forcePasswordChangeSubmitButton => 'Ange nytt lösenord';

  @override
  String get forgotPasswordEnterEmailError => 'Ange din e-postadress.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'Om det kontot finns har en återställningskod skickats.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Ange koden och ett lösenord på minst 8 tecken.';

  @override
  String get forgotPasswordInvalidCode => 'Ogiltig eller utgången kod.';

  @override
  String get forgotPasswordTitle => 'Återställ lösenord';

  @override
  String get forgotPasswordEmailHint => 'E-postadress';

  @override
  String get forgotPasswordSendCodeButton => 'Skicka återställningskod';

  @override
  String get forgotPasswordCodeHint => '6-siffrig kod';

  @override
  String get forgotPasswordNewPasswordHint => 'Nytt lösenord';

  @override
  String get forgotPasswordSetNewPasswordButton => 'Ange nytt lösenord';

  @override
  String get verifyEmailEnterCodeError =>
      'Ange den 6-siffriga koden från din e-post.';

  @override
  String get verifyEmailInvalidCode => 'Ogiltig eller utgången kod.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'En ny kod har skickats till $email.';
  }

  @override
  String get verifyEmailResendFailed => 'Kunde inte skicka igen just nu.';

  @override
  String get verifyEmailTitle => 'Kontrollera din e-post';

  @override
  String verifyEmailSentCode(String email) {
    return 'Vi skickade en 6-siffrig kod till $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'Verifiera e-post';

  @override
  String get verifyEmailResendButton => 'Skicka kod igen';

  @override
  String get safetyNumberKeysNotSetUp =>
      'Dina egna nycklar har inte ställts in än.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName har inget nyckelpaket än.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'Kunde inte beräkna säkerhetsnumret: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName har inte längre den enheten.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'Säkerhetsnummer med $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Jämför det här numret med $peerName via en annan kanal -- personligen, ett telefonsamtal, var som helst utom den här chatten. Om det matchar på båda sidor pratar du med den du tror att du pratar med.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName har $count enheter, var och en med sitt eget säkerhetsnummer -- att verifiera en täcker inte de andra.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Enhet $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Markera som verifierad';

  @override
  String get contentFiltersDescription =>
      'Servrar kan märka kanaler med innehållsetiketter. Välj hur du vill att märkta kanaler ska bete sig -- det här är din egen preferens och påverkar aldrig vad någon annan ser.';

  @override
  String get contentFiltersLabelAdult => 'Vuxet innehåll';

  @override
  String get contentFiltersLabelSuggestive => 'Antydande';

  @override
  String get contentFiltersLabelGraphic => 'Grafiskt innehåll';

  @override
  String get contentFiltersLabelNudity => 'Icke-sexuell nakenhet';

  @override
  String get contentFiltersDescAdult => 'Sexuellt explicit innehåll';

  @override
  String get contentFiltersDescSuggestive =>
      'Sexuellt antydande men inte explicit innehåll';

  @override
  String get contentFiltersDescGraphic => 'Våld eller obehagligt innehåll';

  @override
  String get contentFiltersDescNudity => 'Nakenhet i icke-sexuellt sammanhang';

  @override
  String get contentFiltersHide => 'Dölj';

  @override
  String get contentFiltersWarn => 'Varna';

  @override
  String get contentFiltersShow => 'Visa';

  @override
  String get deviceTestCouldNotGetToken => 'Kunde inte hämta ett testtoken.';

  @override
  String get deviceTestLabelTest => 'Test';

  @override
  String get deviceTestLabelRecording => 'Spelar in...';

  @override
  String get deviceTestLabelPlayingBack => 'Spelar upp...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'Kunde inte starta kameran: $error';
  }

  @override
  String get deviceTestTitle => 'Testa enheter';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'Kunde inte ansluta: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Mikrofon';

  @override
  String get deviceTestHearYourselfLabel => 'Hör dig själv (fördröjd)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Högtalare / utgång';

  @override
  String get deviceTestCameraLabel => 'Kamera';

  @override
  String get deviceTestSystemDefault => 'Systemstandard';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Prata, hör sedan ett ${seconds}s-klipp spelas upp';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '${seconds}s';
  }

  @override
  String get deviceTestCameraPreviewOff => 'Kameraförhandsvisning av';

  @override
  String get deviceTestStopCameraButton => 'Stoppa kameratest';

  @override
  String get deviceTestTestCameraButton => 'Testa kamera';

  @override
  String get deviceTestInputLevelLabel => 'Ingångsnivå';

  @override
  String get devicesScreenRemoveConfirmTitle => 'Ta bort den här enheten?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'Den måste loggas in igen, och meddelanden som skickas till den medan den är borttagen når den inte i efterhand -- Double Ratchet-sessioner fyller inte i luckor i efterhand.';

  @override
  String get devicesScreenRemoveFailed => 'Kunde inte ta bort den enheten.';

  @override
  String get devicesScreenNeverActive => 'Aldrig aktiv';

  @override
  String devicesScreenActiveDate(String date) {
    return 'Aktiv $date';
  }

  @override
  String get devicesScreenDescription =>
      'Varje enhet du loggar in på har sin egen krypteringsidentitet -- ett meddelande som skickas till dig når varje enhet nedan. Ta bort en du inte använder eller inte känner igen.';

  @override
  String get devicesScreenNoDevicesFound => 'Inga enheter hittades.';

  @override
  String get devicesScreenUnknownDevice => 'Okänd enhet';

  @override
  String get devicesScreenThisDeviceBadge => 'Den här enheten';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Ta bort enhet';

  @override
  String get totpSetupInvalidCode => 'Ogiltig kod. Försök igen.';

  @override
  String get totpSetupEnabledMessage => 'Tvåfaktorsautentisering är aktiverad.';

  @override
  String get totpSetupScanInstructions =>
      'Skanna den här hemligheten i din autentiseringsapp (Google Authenticator, 1Password, Authy):';

  @override
  String get totpSetupCodeHint => 'Ange 6-siffrig kod för att bekräfta';

  @override
  String get totpSetupVerifyButton => 'Verifiera och aktivera';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'Tryck för att prata';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'Tryck på valfri tangent för att binda den...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Testa enheter';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Röstbehandling';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'Brusreducering';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Minskar bakgrundsljud på din mikrofon';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Avancerad brusreducering (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'AI-brusreducering i realtid, starkare än standardreducering -- ersätter den när den är på';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'Ekoeliminering';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Förhindrar att ditt eget ljud ekar tillbaka';

  @override
  String get voiceVideoSettingsAutoGainTitle =>
      'Automatisk förstärkningskontroll';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Balanserar automatiskt mikrofonvolymen (ljudnivånormalisering)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'Automatisk nedtoning';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Sänker andra deltagares volym medan du pratar';

  @override
  String get voiceVideoSettingsHighPassTitle => 'Högpassfilter';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Tar bort lågfrekvent dån (fläktar, AC, bordsstötar)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle =>
      'Detektering av tangentbordsljud';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Undertrycker tangentbordsklapper som fångas upp av din mikrofon';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Röstisolering';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Fokuserar på din röst och filtrerar bort andra personer och ljud i närheten';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Mikrofonförstärkning';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Aktivera förstärkning';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Förförstärkning för en tyst eller avlägsen mikrofon -- tillämpas före EQ';

  @override
  String get voiceVideoSettingsBandBoost => 'Förstärkning';

  @override
  String get voiceVideoSettingsSectionMicEq => 'Mikrofon-EQ';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'Aktivera EQ';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Formar din mikrofon innan den når andra';

  @override
  String get voiceVideoSettingsBandBass => 'Bas';

  @override
  String get voiceVideoSettingsBandMid => 'Mellan';

  @override
  String get voiceVideoSettingsBandTreble => 'Diskant';

  @override
  String get voiceVideoSettingsSectionVad => 'Röstaktivitetsdetektering (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'Aktivera VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Sänder bara när du faktiskt pratar';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Känslighet';

  @override
  String get voiceVideoSettingsVadHint =>
      'Lägre = fångar upp tystare ljud. Högre = bara högre tal utlöser sändning.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Bunden tangent';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'Inte inställd — mikrofonen förblir aktiv så länge den inte är avstängd';

  @override
  String get voiceVideoSettingsClearButton => 'Rensa';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Ställ in tangent';

  @override
  String get voiceVideoSettingsChangeButton => 'Ändra';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'När en tangent är bunden sänder din mikrofon bara medan du håller ner den tangenten. Detta har prioritet över VOX medan du är i en röstkanal.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Virtual Avatar Reactive Model';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Ladda upp två bilder som byts när du pratar. Synlig endast för dig.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'Tyst';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'Pratar';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'Taltröskel';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Lägre = byter till pratbilden lättare.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'Ta bort VARM';

  @override
  String get gifPickerNoGifsFound => 'Inga GIF:ar hittades';

  @override
  String get gifPickerSearchHint => 'Sök GIF:ar...';

  @override
  String get messageSearchHint => 'Sök i den här kanalen...';

  @override
  String get messageSearchTooltip => 'Sök';

  @override
  String get messageSearchInitialHint =>
      'Söker meddelanden som redan laddats på den här enheten -- äldre historik hämtas (och dekrypteras lokalt) när du bläddrar längre bakåt.';

  @override
  String get messageSearchNoMatches => 'Inga träffar';

  @override
  String get messageSearchStartOfHistory => 'Början av kanalens historik';

  @override
  String get messageSearchFurtherBackButton => 'Sök längre bakåt';

  @override
  String get messageSearchUnknownAuthor => 'Okänd';

  @override
  String get serverTabLeveling => 'Nivåer';

  @override
  String get permManageLeaderboards => 'Hantera topplistor';

  @override
  String get serverLevelingEnableLabel => 'Server-XP';

  @override
  String get serverLevelingEnableDescription =>
      'Medlemmar tjänar XP och nivåer genom att chatta. Aktiverat som standard.';

  @override
  String get serverGifLevelGateLabel => 'Nivå som krävs för GIF-bilder';

  @override
  String get serverGifLevelGateDescription =>
      'Lägsta nivå för att skicka GIF-bilder på den här servern. 0 = ingen begränsning.';

  @override
  String get serverOpenLeaderboards => 'Visa topplistor';

  @override
  String get leaderboardScreenTitle => 'Topplistor';

  @override
  String get leaderboardCreateTitle => 'Skapa topplista';

  @override
  String get leaderboardNameHint => 'Topplistans namn';

  @override
  String get leaderboardResetTitle => 'Återställ säsong';

  @override
  String leaderboardResetBody(String name) {
    return 'Detta arkiverar den aktuella placeringen för \"$name\" och startar en ny säsong. Detta kan inte ångras.';
  }

  @override
  String get leaderboardResetConfirm => 'Återställ säsong';

  @override
  String get leaderboardAdjustTitle => 'Justera poäng';

  @override
  String get leaderboardUserIdHint => 'Användar-ID';

  @override
  String get leaderboardScoreHint => 'Poäng';

  @override
  String leaderboardSeasonLabel(int number) {
    return 'Säsong $number';
  }

  @override
  String get leaderboardEmptyState => 'Inga poster än';

  @override
  String leaderboardYourRank(int rank, int score) {
    return 'Din placering: #$rank ($score)';
  }

  @override
  String leaderboardXpScore(int score, int level) {
    return '$score XP · Nivå $level';
  }

  @override
  String memberPanelLevelLabel(int level) {
    return 'Nivå $level';
  }

  @override
  String get achievementScreenTitle => 'Prestationer';

  @override
  String get achievementCreateTitle => 'Skapa prestation';

  @override
  String get achievementNameHint => 'Prestationens namn';

  @override
  String get achievementDescriptionHint => 'Beskrivning (valfritt)';

  @override
  String get achievementDeleteTitle => 'Ta bort prestation';

  @override
  String achievementDeleteConfirm(String name) {
    return 'Ta bort \"$name\"? Den som redan har den behåller den, men den tas bort från servern. Detta kan inte ångras.';
  }

  @override
  String get achievementAwardTitle => 'Dela ut prestation';

  @override
  String get achievementAwardButton => 'Dela ut';

  @override
  String get achievementUserIdHint => 'Användar-ID';

  @override
  String get achievementLockedBanner =>
      'Den här servern är under boostnivå 3, så befintliga prestationer och deras innehavare förblir precis som de är, men ingen kan delas ut till någon ny förrän servern når nivå 3 igen.';

  @override
  String get achievementEmptyState => 'Inga prestationer än';

  @override
  String get achievementNoRecipients => 'Ingen har den här än';

  @override
  String chatGifLevelGated(int level) {
    return 'Du behöver nivå $level för att skicka GIF-bilder här';
  }

  @override
  String get arcadeNavLabel => 'Arkad';

  @override
  String get arcadeHomeTitle => 'Koda Arkad';

  @override
  String get arcadeViewLeaderboardsButton => 'Visa topplistor';

  @override
  String get arcadeMinesweeperTitle => 'Minröjaren';

  @override
  String get arcadeMinesweeperSubtitle =>
      'Rensa hela brädet utan att träffa en mina';

  @override
  String get arcadeMatch3Title => 'Ädelstensmatchning';

  @override
  String get arcadeMatch3Subtitle =>
      'Matcha 3 eller fler ädelstenar för att få poäng';

  @override
  String get arcadeDifficultyBeginner => 'Nybörjare';

  @override
  String get arcadeDifficultyIntermediate => 'Medel';

  @override
  String get arcadeDifficultyExpert => 'Expert';

  @override
  String arcadeMinesLeftLabel(int count) {
    return 'Minor: $count';
  }

  @override
  String arcadeTimeLabel(int seconds) {
    return 'Tid: ${seconds}s';
  }

  @override
  String get arcadeNewGameButton => 'Nytt spel';

  @override
  String get arcadeMinesweeperWinTitle => 'Brädet rensat!';

  @override
  String arcadeMinesweeperWinBody(int score) {
    return 'Du fick $score poäng.';
  }

  @override
  String get arcadeMinesweeperLoseTitle => 'Bom!';

  @override
  String get arcadeMinesweeperLoseBody => 'Du träffade en mina. Försöka igen?';

  @override
  String get arcadeScoreSubmittedNote =>
      'Poäng skickat till den här serverns topplista';

  @override
  String arcadeMatch3ScoreLabel(int score) {
    return 'Poäng: $score';
  }

  @override
  String arcadeMatch3MovesLeftLabel(int count) {
    return 'Drag kvar: $count';
  }

  @override
  String get arcadeMatch3GameOverTitle => 'Inga fler drag';

  @override
  String arcadeMatch3GameOverBody(int score) {
    return 'Slutpoäng: $score';
  }

  @override
  String get commonContinue => 'Fortsätt';

  @override
  String get adminTabEnterprise => 'Enterprise';

  @override
  String get adminTabStatus => 'Status';

  @override
  String get adminTabParentalConsent => 'Föräldrasamtycke';

  @override
  String get adminParentalConsentDescription =>
      'Granska uppladdade signerade samtyckesformulär innan ett barnkonto skapas. Kortverifiering sker automatiskt och visas aldrig här.';

  @override
  String get adminParentalConsentEmptyState => 'Inga väntande granskningar.';

  @override
  String get adminParentalConsentViewDocument => 'Visa dokument';

  @override
  String get adminParentalConsentApprove => 'Godkänn';

  @override
  String get adminParentalConsentReject => 'Avvisa';

  @override
  String get adminParentalConsentRejectTitle => 'Avvisa samtyckesförfrågan';

  @override
  String get adminParentalConsentRejectReasonHint =>
      'Anledning (visas för föräldern/vårdnadshavaren)';

  @override
  String get adminParentalConsentRejectConfirm => 'Avvisa';

  @override
  String get serverTabSso => 'SSO';

  @override
  String get serverSsoCardTitle => 'SAML Single Sign-On';

  @override
  String get serverSsoCardDescription =>
      'Låt medlemmar logga in via ditt företags identitetsleverantör istället för e-post och lösenord.';

  @override
  String get serverSsoLockedHint =>
      'SSO finns tillgängligt på Enterprise-nivån. Kontakta oss för att uppgradera.';

  @override
  String get serverSsoEnabledLabel => 'SSO aktiverat';

  @override
  String get serverSsoEmailDomainLabel => 'Företagets e-postdomän';

  @override
  String get serverSsoEmailDomainHint => 'acme.com';

  @override
  String get serverSsoEntityIdLabel => 'Entity-ID för identitetsleverantör';

  @override
  String get serverSsoEntityIdHint => 'https://idp.example.com/entity';

  @override
  String get serverSsoSsoUrlLabel => 'SSO-URL för identitetsleverantör';

  @override
  String get serverSsoSsoUrlHint => 'https://idp.example.com/sso/redirect';

  @override
  String get serverSsoCertLabel =>
      'X.509-certifikat för identitetsleverantör (PEM)';

  @override
  String get serverSsoCertHint => '-----BEGIN CERTIFICATE-----';

  @override
  String get ssoSignInButton => 'Logga in med SSO istället';

  @override
  String get ssoLoginTitle => 'Logga in med SSO';

  @override
  String get ssoLoginDescription =>
      'Ange din jobb-e-post -- vi omdirigerar dig till ditt företags identitetsleverantör för att slutföra inloggningen.';

  @override
  String get ssoWorkEmailHint => 'du@foretag.com';

  @override
  String get ssoNoConfigError =>
      'Ingen SSO är konfigurerad för den e-posten. Prova ditt lösenord istället.';

  @override
  String get ssoGenericError =>
      'Något gick fel när SSO-inloggningen skulle startas.';

  @override
  String get ssoExpiredError =>
      'Det här inloggningsförsöket har upphört. Försök igen.';

  @override
  String get ssoWaitingForBrowser =>
      'Slutför inloggningen hos din identitetsleverantör i webbläsarfönstret. Den här sidan fortsätter automatiskt.';

  @override
  String get statusPostIncidentTitle => 'Publicera incident';

  @override
  String get statusIncidentTitleHint => 'Incidentens titel';

  @override
  String get statusIncidentBodyHint => 'Vad händer? (valfritt)';

  @override
  String get statusAllSystemsNormal => 'Alla system fungerar normalt';

  @override
  String get statusDegraded => 'Nedsatt -- databasen är oåtkomlig';

  @override
  String get statusNoIncidents => 'Inga incidenter rapporterade';

  @override
  String get statusResolvedLabel => 'Löst';

  @override
  String get statusResolveButton => 'Lös';

  @override
  String get commonCopy => 'Kopiera';

  @override
  String get permManageWebhooks => 'Hantera webhooks';

  @override
  String get permManageAchievements => 'Hantera prestationer';

  @override
  String get channelEditDialogManageWebhooks => 'Hantera webhooks';

  @override
  String get webhookScreenTitle => 'Webhooks';

  @override
  String get webhookScreenDescription =>
      'Vilken tjänst som helst som kan skicka en webbförfrågan kan posta meddelanden i den här kanalen. Kompatibel med verktyg som redan stöder att posta till en Discord-webhook -- klistra bara in den här URL:en istället.';

  @override
  String get webhookEmptyState => 'Inga webhooks än';

  @override
  String get webhookCreateTitle => 'Skapa webhook';

  @override
  String get webhookNameHint => 'Webhookens namn';

  @override
  String get webhookRegenerateTitle => 'Återskapa URL';

  @override
  String get webhookRegenerateBody =>
      'Den nuvarande URL:en slutar fungera omedelbart. Allt som fortfarande använder den behöver den nya.';

  @override
  String get webhookRegenerateConfirm => 'Återskapa';

  @override
  String get webhookUrlRevealTitle => 'Webhook-URL';

  @override
  String get webhookUrlRevealWarning =>
      'Kopiera det här nu -- du kommer inte kunna se det igen. Vem som helst med den här URL:en kan posta meddelanden i den här kanalen.';

  @override
  String get webhookUrlCopiedToast => 'URL kopierad';

  @override
  String get webhookUrlSavedIt => 'Jag har sparat det';

  @override
  String get chatWebhookBadge => 'WEBHOOK';

  @override
  String adminReportWebhookTarget(String reporterId, String webhookName) {
    return 'Anmälare: $reporterId\nWebhook: $webhookName';
  }

  @override
  String get commonActionFailed => 'Något gick fel. Försök igen.';

  @override
  String get ssoBrowserLaunchError =>
      'Det gick inte att öppna en webbläsare för att fortsätta inloggningen.';

  @override
  String get settingsSpotifyTitle => 'Spotify';

  @override
  String get settingsSpotifyDescription =>
      'Anslut Spotify för att dela vad du lyssnar på i en kanal. Koda kan inte synkronisera uppspelning i realtid -- detta publicerar en länk så att andra kan spela samma låt själva.';

  @override
  String settingsSpotifyConnected(String username) {
    return 'Ansluten som $username';
  }

  @override
  String get settingsSpotifyNotConnected => 'Spotify inte anslutet';

  @override
  String settingsSpotifyNowPlaying(String track, String artist) {
    return 'Spelas nu: $track av $artist';
  }

  @override
  String get settingsSpotifyShareHint =>
      'Dela det här via notikonen i meddelanderutan i valfri kanal.';

  @override
  String get chatShareSpotifyTooltip => 'Dela vad du lyssnar på';

  @override
  String get chatSpotifyShareFailed =>
      'Kunde inte dela -- se till att Spotify spelar något.';

  @override
  String get chatPreviewBadgeLive => 'LIVE';

  @override
  String get chatPreviewBadgeListening => 'LYSSNAR';

  @override
  String get chatPreviewBadgeEnded => 'AVSLUTAD';

  @override
  String get serverAuditLogExportDescription =>
      'Exportera hela granskningsloggen som CSV eller JSON Lines för efterlevnad eller SIEM-inmatning.';

  @override
  String get serverAuditLogExportLockedHint =>
      'Export av granskningsloggen är tillgänglig på Enterprise-nivån. Kontakta oss för att uppgradera.';

  @override
  String get serverExportAuditLog => 'Exportera';

  @override
  String get serverExportFormatPrompt =>
      'Välj ett format. JSON Lines passar oftast bättre för en SIEM eller loggpipeline; CSV öppnas direkt i ett kalkylblad.';

  @override
  String get serverAuditLogExported => 'Granskningslogg exporterad';

  @override
  String get chatPreviewBadgePremiere => 'PREMIÄR';
}
