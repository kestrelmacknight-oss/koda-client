// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonSave => 'Salva';

  @override
  String get commonEdit => 'Modifica';

  @override
  String get commonDelete => 'Elimina';

  @override
  String get commonCreate => 'Crea';

  @override
  String get commonClose => 'Chiudi';

  @override
  String get commonDone => 'Fatto';

  @override
  String get commonDownload => 'Scarica';

  @override
  String get commonDisconnect => 'Disconnetti';

  @override
  String get commonNone => 'Nessuno';

  @override
  String get commonJoin => 'Partecipa';

  @override
  String get commonDismiss => 'Ignora';

  @override
  String get commonSubmit => 'Invia';

  @override
  String get commonConfirm => 'Conferma';

  @override
  String get commonRemove => 'Rimuovi';

  @override
  String get commonRetry => 'Riprova';

  @override
  String get commonOk => 'OK';

  @override
  String get commonYes => 'Sì';

  @override
  String get commonNo => 'No';

  @override
  String get commonSearch => 'Cerca';

  @override
  String get commonSettings => 'Impostazioni';

  @override
  String get commonLoading => 'Caricamento...';

  @override
  String get settingsLanguageSection => 'Lingua';

  @override
  String get settingsLanguageTitle => 'Lingua dell\'app';

  @override
  String get settingsLanguageSystemDefault => 'Predefinita di sistema';

  @override
  String get settingsLanguageDescription =>
      'Scegli la lingua di visualizzazione dell\'interfaccia di Koda. È indipendente dalla lingua principale di un server o dalla lingua in cui scrivi i messaggi.';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get settingsSignOut => 'Disconnetti';

  @override
  String get settingsSectionMyAccount => 'Il mio account';

  @override
  String get settingsSectionSecurity => 'Sicurezza';

  @override
  String get settingsSectionAccessibility => 'Accessibilità';

  @override
  String get settingsSectionBilling => 'Fatturazione';

  @override
  String get settingsSectionFamily => 'Famiglia';

  @override
  String get settingsSectionVoiceVideo => 'Voce e video';

  @override
  String get settingsSectionDesktop => 'Desktop';

  @override
  String get settingsSectionAbout => 'Informazioni';

  @override
  String get settingsTwoFactorTitle => 'Autenticazione a due fattori';

  @override
  String get settingsTwoFactorSubtitle =>
      'Aggiungi un\'app di autenticazione per maggiore sicurezza';

  @override
  String get settingsLinkedDevicesTitle => 'Dispositivi collegati';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'Visualizza e rimuovi i dispositivi connessi a questo account';

  @override
  String get settingsContentFiltersTitle => 'Filtri contenuti';

  @override
  String get settingsContentFiltersSubtitle =>
      'Scegli come deve essere visualizzato il contenuto contrassegnato';

  @override
  String get settingsDmFriendsOnlyTitle => 'Consenti DM solo dagli amici';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Le persone che non sono tue amiche non possono avviare una conversazione con te';

  @override
  String get settingsDmPrivacyError =>
      'Impossibile aggiornare la privacy dei DM.';

  @override
  String get settingsShowVispAvatarTitle => 'Mostra l\'avatar di Visp';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Mostra il volto e l\'umore di Visp nelle sue finestre di configurazione, evento e consiglio';

  @override
  String get settingsHighContrastTitle => 'Contrasto elevato';

  @override
  String get settingsHighContrastSubtitle =>
      'Colori bianco e nero puro ad alto contrasto in tutta l\'app -- il cambio ricarica brevemente la schermata attuale.';

  @override
  String get settingsDyslexiaFontTitle => 'Carattere per dislessia';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Passa al carattere OpenDyslexic per il testo principale in tutta l\'app';

  @override
  String get settingsFontSizeTitle => 'Dimensione del carattere';

  @override
  String get settingsFontSizeSample => 'Quel fez sghembo copre davanti';

  @override
  String get settingsDensityTitle => 'Densità';

  @override
  String get settingsDensityDescription =>
      'Influisce sulla spaziatura dei controlli standard -- pulsanti, interruttori, finestre di dialogo -- ma non su tutti i layout personalizzati.';

  @override
  String get settingsDensityCompact => 'Compatta';

  @override
  String get settingsDensityStandard => 'Standard';

  @override
  String get settingsDensityComfortable => 'Comoda';

  @override
  String get settingsStreamingTitle => 'Account di streaming';

  @override
  String get settingsStreamingDescription =>
      'Collega Twitch/YouTube in modo che i server in cui hai il permesso \"Annuncia in diretta\" possano pubblicare automaticamente quando sei in diretta o pubblichi un nuovo video.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform connesso come $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform non connesso';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- in diretta ora';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- nuova pubblicazione';

  @override
  String get settingsStreamingConnecting => 'Connessione in corso...';

  @override
  String get settingsStreamingConnect => 'Connetti';

  @override
  String get settingsAnnounceLiveTwitch => 'Annuncia quando sono in diretta';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Annuncia dirette e nuove pubblicazioni';

  @override
  String get settingsRefreshStatus =>
      'Già connesso dal browser? Aggiorna lo stato';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'Impossibile avviare la connessione a $platform.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Completa la connessione nel browser, poi torna e aggiorna.';

  @override
  String get settingsThroneTitle => 'Webhook Throne';

  @override
  String get settingsThroneDescription =>
      'Incolla questo URL nelle impostazioni webhook di Throne.com per ricevere una notifica in Koda ogni volta che qualcuno ti invia un regalo.';

  @override
  String get settingsThroneGetUrl => 'Ottieni il mio URL webhook';

  @override
  String get settingsThroneCopyTooltip => 'Copia';

  @override
  String get settingsThroneCopiedToast => 'Copiato negli appunti';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Rigenera (invalida il vecchio URL)';

  @override
  String get settingsThroneRegenerateConfirmTitle =>
      'Rigenerare l\'URL del webhook?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'Il vecchio URL smetterà di funzionare, ricordati di aggiornarlo su Throne.com in seguito.';

  @override
  String get settingsThroneRegenerate => 'Rigenera';

  @override
  String get settingsUploadPhoto => 'Carica foto';

  @override
  String get settingsOrPasteUrl => 'oppure incolla un URL qui sotto';

  @override
  String get settingsAvatarUrlHint => 'https://esempio.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'Il caricamento di immagini richiede Cloudflare R2 -- incollare un URL funziona comunque.';

  @override
  String get settingsDisplayNameLabel => 'NOME VISUALIZZATO';

  @override
  String get settingsDisplayNameHint => 'Nome visualizzato';

  @override
  String get settingsBioLabel => 'BIOGRAFIA';

  @override
  String get settingsBioHint => 'Racconta qualcosa di te';

  @override
  String get settingsPronounsLabel => 'PRONOMI';

  @override
  String get settingsPronounsHint => 'es. lei/lei';

  @override
  String get settingsShowPronounsTitle => 'Mostra i miei pronomi agli altri';

  @override
  String get settingsShowPronounsSubtitle =>
      'Visualizzato accanto al tuo nome in chat, negli elenchi membri e in voce';

  @override
  String get settingsStatusLabel => 'STATO';

  @override
  String get settingsCustomStatusLabel => 'STATO PERSONALIZZATO';

  @override
  String get settingsCustomStatusHint => 'A cosa stai pensando?';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusAway => 'Assente';

  @override
  String get statusDnd => 'Non disturbare';

  @override
  String get statusInvisible => 'Invisibile';

  @override
  String get settingsFamilyNotAvailable =>
      'I controlli parentali non sono disponibili su un account supervisionato.';

  @override
  String get settingsAboutTitle => 'Informazioni su Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Termini di servizio';

  @override
  String get settingsPrivacyTitle => 'Informativa sulla privacy';

  @override
  String get settingsSupportTitle => 'Assistenza';

  @override
  String get settingsReportSecurityTitle => 'Segnala un problema di sicurezza';

  @override
  String get settingsDesktopNotAvailable =>
      'Queste sono impostazioni solo per desktop -- non c\'è una finestra o un\'area di notifica su questa piattaforma.';

  @override
  String get settingsCloseToTrayTitle => 'Riduci nell\'area di notifica';

  @override
  String get settingsCloseToTraySubtitle =>
      'Chiudendo la finestra, Koda continua a funzionare in background per ricevere notifiche -- disattiva questa opzione per far sì che chiudere la finestra chiuda davvero l\'app.';

  @override
  String get authErrorEmailPasswordRequired =>
      'Email e password sono obbligatorie.';

  @override
  String get authErrorIncorrectCredentials => 'Email o password errati.';

  @override
  String get authErrorMustAcceptTerms => 'Accetta i Termini di servizio.';

  @override
  String get authErrorAllFieldsRequired => 'Tutti i campi sono obbligatori.';

  @override
  String get authErrorPasswordsDontMatch => 'Le password non corrispondono.';

  @override
  String get authErrorPasswordTooShort =>
      'La password deve contenere almeno 8 caratteri.';

  @override
  String get authErrorRegistrationFailed =>
      'Registrazione non riuscita. Questa email potrebbe essere già in uso.';

  @override
  String get authTabSignIn => 'Accedi';

  @override
  String get authTabCreateAccount => 'Crea account';

  @override
  String get authAgreementPrefix => 'Utilizzando Koda, accetti i nostri ';

  @override
  String get authTermsLink => 'Termini di servizio';

  @override
  String get authAgreementMiddle => ' e la nostra ';

  @override
  String get authPrivacyLink => 'Informativa sulla privacy';

  @override
  String get authAgreementSuffix => '.';

  @override
  String get authEmailHint => 'Email';

  @override
  String get authPasswordHint => 'Password';

  @override
  String get authForgotPassword => 'Password dimenticata?';

  @override
  String get authSignInButton => 'Accedi';

  @override
  String get authUsernameHint => 'Nome utente';

  @override
  String get authConfirmPasswordHint => 'Conferma password';

  @override
  String get authAccessCodeHint => 'Codice di accesso (se ne hai uno)';

  @override
  String get authAgreeToTerms =>
      'Accetto i Termini di servizio e l\'Informativa sulla privacy';

  @override
  String get authCreateAccountButton => 'Crea account';

  @override
  String get dmSafetyNumberChangedWarning =>
      'Il numero di sicurezza di questa conversazione è cambiato -- verificalo prima di inviare.';

  @override
  String get dmMessageNotSent => 'Messaggio non inviato.';

  @override
  String dmEncryptMessageError(String error) {
    return 'Impossibile crittografare il messaggio: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'Caricamento allegato non riuscito.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'Impossibile crittografare l\'allegato: $error';
  }

  @override
  String get dmReportMessage => 'Segnala messaggio';

  @override
  String get dmReportSubmitted => 'Segnalazione inviata.';

  @override
  String get dmTitle => 'Messaggi';

  @override
  String get dmNewMessage => 'Nuovo messaggio';

  @override
  String get dmNoConversationsYet => 'Ancora nessuna conversazione';

  @override
  String get dmSelectConversation => 'Seleziona una conversazione';

  @override
  String get dmVerifySafetyNumberTooltip => 'Verifica numero di sicurezza';

  @override
  String get dmSeenLabel => 'Visto';

  @override
  String get dmMessageActionsTooltip => 'Azioni messaggio';

  @override
  String get dmRemoveAttachmentTooltip => 'Rimuovi allegato';

  @override
  String get dmAttachFileTooltip => 'Allega file';

  @override
  String get dmMessageHint => 'Messaggio...';

  @override
  String get dmSendMessageTooltip => 'Invia messaggio';

  @override
  String get dmNoFriendsYet =>
      'Ancora nessun amico.\nInvia una richiesta di amicizia per iniziare.';

  @override
  String get dmUnfriendTooltip => 'Rimuovi amicizia';

  @override
  String get dmNoPendingRequests => 'Nessuna richiesta di amicizia in sospeso.';

  @override
  String get dmIncomingRequestsLabel => 'RICEVUTE';

  @override
  String get dmSentRequestsLabel => 'INVIATE';

  @override
  String get dmAcceptTooltip => 'Accetta';

  @override
  String get dmDeclineTooltip => 'Rifiuta';

  @override
  String get dmPendingLabel => 'In sospeso';

  @override
  String get dmNewMessageDialogTitle => 'Nuovo messaggio';

  @override
  String get dmEnterUsernameHint => 'Inserisci un nome utente';

  @override
  String get dmOpenButton => 'Apri';

  @override
  String dmSavedAttachment(String fileName) {
    return '$fileName salvato';
  }

  @override
  String get dmUnknownUser => 'Sconosciuto';

  @override
  String get dmEndToEndEncryptedTooltip => 'Crittografato end-to-end';

  @override
  String get homeContentWarningTitle => 'Avviso sui contenuti';

  @override
  String homeContentWarningBody(String labels) {
    return 'Questo canale è segnalato per: $labels.\n\nModifica questo in Impostazioni > Sicurezza > Filtri contenuti.';
  }

  @override
  String get homeViewAnyway => 'Visualizza comunque';

  @override
  String get homeCouldNotConnectVoice => 'Impossibile connettersi alla voce.';

  @override
  String get homeVoiceChannelFull => 'Questo canale vocale è pieno.';

  @override
  String get homeCreateServer => 'Crea server';

  @override
  String get homeJoinServer => 'Partecipa a un server';

  @override
  String get homeRedeemCode => 'Riscatta codice';

  @override
  String get homeJoinServerDialogTitle => 'Partecipa a un server';

  @override
  String get homeEnterInviteCode => 'Inserisci un codice o URL di invito:';

  @override
  String get homeInviteCodeHint => 'es. XK9MP2';

  @override
  String get homeJoined => 'Entrato!';

  @override
  String get homeInvalidInvite => 'Codice di invito non valido o scaduto.';

  @override
  String get homeJoinButton => 'Partecipa';

  @override
  String get homeRedeemCodeDialogTitle => 'Riscatta codice';

  @override
  String get homeEnterBackerCode =>
      'Inserisci il tuo codice sostenitore o ricompensa:';

  @override
  String get homeRewardCodeHint => 'Codice ricompensa';

  @override
  String get homeCodeRedeemed =>
      'Codice riscattato! Le tue ricompense sono state applicate.';

  @override
  String get homeInvalidRedeemCode =>
      'Codice non valido, scaduto o già riscattato.';

  @override
  String get homeRedeemButton => 'Riscatta';

  @override
  String get homeAreFriends => 'Siete amici';

  @override
  String get homeAddFriend => 'Aggiungi come amico';

  @override
  String homeFriendRequestSent(String username) {
    return 'Richiesta di amicizia inviata a $username!';
  }

  @override
  String get homeMessageButton => 'Messaggio';

  @override
  String get homeSendTip => 'Invia mancia';

  @override
  String get homeSwitchToServer => 'Passa a questo server';

  @override
  String get homeInvitePeople => 'Invita persone';

  @override
  String get homeServerSettingsMenuItem => 'Impostazioni server';

  @override
  String get homeLeaveServerMenuItem => 'Abbandona server';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return 'Abbandonare $serverName? Potrai rientrare con un invito.';
  }

  @override
  String get homeLeaveButton => 'Abbandona';

  @override
  String get homeCreateAServer => 'Crea un server';

  @override
  String get homeServerNameHint => 'Nome del server';

  @override
  String get homeDescribeToVisp => 'Descrivilo a Visp invece';

  @override
  String get homeMarkAsRead => 'Segna come letto';

  @override
  String get homeEditChannel => 'Modifica canale';

  @override
  String get homeDeleteChannel => 'Elimina canale';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return 'Eliminare #$channelName? Questa azione non può essere annullata.';
  }

  @override
  String get homeDeleteButton => 'Elimina';

  @override
  String get homeCreateChannelHere => 'Crea canale qui';

  @override
  String get homeEditCategory => 'Modifica categoria';

  @override
  String get homeDeleteCategory => 'Elimina categoria';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return 'Eliminare \"$categoryName\"? I canali al suo interno diventeranno senza categoria.';
  }

  @override
  String get homeReplyAction => 'Rispondi';

  @override
  String get homeCreateThreadAction => 'Crea thread';

  @override
  String get homeEditMessageAction => 'Modifica messaggio';

  @override
  String get homeDeleteMessageAction => 'Elimina messaggio';

  @override
  String get homePinMessageAction => 'Fissa messaggio';

  @override
  String get homeUnpinMessageAction => 'Rimuovi messaggio fissato';

  @override
  String get homeReportMessageAction => 'Segnala messaggio';

  @override
  String get homeReportSubmitted => 'Segnalazione inviata.';

  @override
  String get messageActionForward => 'Inoltra';

  @override
  String messageForwardedFromLabel(String name) {
    return 'Inoltrato da $name';
  }

  @override
  String get forwardDestinationPickerTitle => 'Inoltra messaggio';

  @override
  String get forwardDestinationPickerChannelsTab => 'Canali';

  @override
  String get forwardDestinationPickerDmsTab => 'Messaggi Diretti';

  @override
  String get forwardDestinationPickerNoServers =>
      'Non fai ancora parte di nessun server.';

  @override
  String get forwardDestinationPickerNoChannels =>
      'Nessun canale di testo in questo server.';

  @override
  String get forwardDestinationPickerNoConversations =>
      'Nessuna conversazione ancora.';

  @override
  String get forwardSuccessToast => 'Messaggio inoltrato.';

  @override
  String get forwardFailedToast =>
      'Impossibile inoltrare il messaggio -- riprova.';

  @override
  String get homeAddReactionTitle => 'Aggiungi reazione';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count thread',
      one: '$count thread',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'Opzioni categoria';

  @override
  String get homeChannelOptionsTooltip => 'Opzioni canale';

  @override
  String get homeOpenVoiceChatTooltip => 'Apri chat';

  @override
  String get homeMarketplaceLabel => 'Marketplace';

  @override
  String get homeSelectChannelPrompt => 'Seleziona un canale';

  @override
  String get homeSearchTooltip => 'Cerca';

  @override
  String get homePinnedMessagesTooltip => 'Messaggi fissati';

  @override
  String get homeWaitingForKey => 'In attesa della chiave di crittografia...';

  @override
  String get homeUnableToDecrypt =>
      'Impossibile decrittografare questo messaggio.';

  @override
  String get homeMessageActionsTooltip => 'Azioni messaggio';

  @override
  String get homeCancelReplyTooltip => 'Annulla risposta';

  @override
  String get homeRemoveAttachmentTooltip => 'Rimuovi allegato';

  @override
  String get homeAttachFileTooltip => 'Allega file';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'Messaggio in #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'Invia messaggio';

  @override
  String get homeEditMessageTitle => 'Modifica messaggio';

  @override
  String get homeMessageLabel => 'Messaggio';

  @override
  String get homePinnedMessagesTitle => 'Messaggi fissati';

  @override
  String get homeNoPinnedMessages => 'Nessun messaggio fissato';

  @override
  String get homeUnpinTooltip => 'Rimuovi fissaggio';

  @override
  String get homeCreateThreadTitle => 'Crea thread';

  @override
  String get homeThreadNameHint => 'Nome del thread';

  @override
  String homeThreadCreated(String name) {
    return 'Thread \"$name\" creato!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Crea o partecipa';

  @override
  String get homeKodaMarketplaceTooltip => 'Marketplace Koda';

  @override
  String get homeAdminPanelTooltip => 'Pannello di amministrazione';

  @override
  String get homeServerSettingsTooltip => 'Impostazioni server';

  @override
  String get homeSettingsTooltip => 'Impostazioni';

  @override
  String get homeContentWarningBadge => 'Avviso sui contenuti';

  @override
  String get homeDirectMessagesTooltip => 'Messaggi diretti';

  @override
  String homeReplyingTo(String username) {
    return 'In risposta a $username';
  }

  @override
  String get homeAttachmentFallback => 'Allegato';

  @override
  String get homeAttachmentUploadFailed => 'Caricamento allegato non riuscito.';

  @override
  String homeSavedAttachment(String fileName) {
    return '$fileName salvato';
  }

  @override
  String serverConnectError(String service) {
    return 'Impossibile avviare la connessione a $service.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Disconnettere Printful?';

  @override
  String get serverDisconnectPrintfulBody =>
      'Questo server non potrà più elaborare ordini di merchandising finché non verrà riconnesso.';

  @override
  String get serverDisconnectTiltifyTitle => 'Disconnettere Tiltify?';

  @override
  String get serverDisconnectTiltifyBody =>
      'Questo server smetterà di mostrare l\'avanzamento della campagna benefica finché non verrà riconnesso.';

  @override
  String get serverNewRoleTitle => 'Nuovo ruolo';

  @override
  String get serverEditRoleTitle => 'Modifica ruolo';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Colore $hex';
  }

  @override
  String get permViewChannels => 'Visualizza canali';

  @override
  String get permSendMessages => 'Invia messaggi';

  @override
  String get permConnectVoice => 'Connettiti alla voce';

  @override
  String get permManageServer => 'Gestisci server';

  @override
  String get permManageChannels => 'Gestisci canali';

  @override
  String get permManageRoles => 'Gestisci ruoli';

  @override
  String get permManageMessages => 'Gestisci messaggi';

  @override
  String get permKickMembers => 'Espelli membri';

  @override
  String get permBanMembers => 'Banna membri';

  @override
  String get permMuteMembers => 'Silenzia membri';

  @override
  String get permMentionEveryone => 'Menziona @everyone';

  @override
  String get permManageMarketplace => 'Gestisci marketplace';

  @override
  String get permAnnounceLive => 'Annuncia in diretta';

  @override
  String get permMoveMembers => 'Sposta membri (voce)';

  @override
  String get serverRoleNameHint => 'Nome ruolo';

  @override
  String get serverColorLabel => 'Colore';

  @override
  String get serverPermissionsLabel => 'Permessi';

  @override
  String get serverSelfAssignableTitle => 'Autoassegnabile';

  @override
  String get serverSelfAssignableSubtitle =>
      'I membri possono assegnarsi questo ruolo da soli';

  @override
  String get serverDefaultRoleUndeletable =>
      'Il ruolo predefinito non può essere eliminato.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'Eliminare il ruolo \"$roleName\"?';
  }

  @override
  String get serverCouldNotDeleteRole => 'Impossibile eliminare questo ruolo.';

  @override
  String get serverMemberFallback => 'Membro';

  @override
  String get serverNoRolesYet => 'Ancora nessun ruolo.';

  @override
  String get serverRefreshStatus =>
      'Già connesso dal browser? Aggiorna lo stato';

  @override
  String get serverPrintfulConnected => 'Printful connesso';

  @override
  String get serverPrintfulNotConnected => 'Printful non connesso';

  @override
  String get serverPrintfulDescription =>
      'Collega l\'account Printful di questo server per elaborare gli ordini di merchandising effettuati tramite Koda. Ogni server collega il proprio negozio.';

  @override
  String get serverConnecting => 'Connessione in corso...';

  @override
  String get serverConnectPrintful => 'Connetti Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify connesso';

  @override
  String get serverTiltifyNotConnected => 'Tiltify non connesso';

  @override
  String get serverTiltifyDescription =>
      'Collega l\'account Tiltify di questo server per mostrare a tutti i membri l\'avanzamento in diretta di una campagna benefica. Sola lettura -- Koda non pubblica né modifica mai nulla su Tiltify.';

  @override
  String get serverConnectTiltify => 'Connetti Tiltify';

  @override
  String get serverNoTiltifyCampaigns =>
      'Nessuna campagna trovata su questo account Tiltify.';

  @override
  String get serverPickCampaign => 'Scegli quale campagna visualizzare';

  @override
  String get serverUntitledCampaign => 'Campagna senza titolo';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '$currency $raised raccolti su un obiettivo di $goal';
  }

  @override
  String get serverViewCampaign => 'Visualizza campagna';

  @override
  String get serverRefreshButton => 'Aggiorna';

  @override
  String get serverUploadButton => 'Carica';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '$used / $limit slot usati -- livello boost $level';
  }

  @override
  String get serverNoCustomEmoji => 'Ancora nessuna emoji personalizzata.';

  @override
  String get serverDeleteEmojiTooltip => 'Elimina emoji';

  @override
  String get serverUploadEmojiTitle => 'Carica emoji';

  @override
  String get serverEmojiNameHint => 'nome (lettere, numeri, _)';

  @override
  String get serverChooseImage => 'Scegli immagine';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Livello boost attuale: $level';
  }

  @override
  String get serverBackgroundTitle => 'Sfondo del server';

  @override
  String get serverBackgroundDescription =>
      'Uno sfondo personalizzato mostrato dietro la vista dei canali per tutti i membri di questo server.';

  @override
  String get serverBackgroundLockedHint =>
      'Raggiungi il livello boost 4 per sbloccare uno sfondo personalizzato.';

  @override
  String get serverIconBorderTitle => 'Bordo icona server';

  @override
  String get serverIconBorderDescription =>
      'Un bordo di accento attorno all\'icona di questo server nell\'elenco server di ogni membro.';

  @override
  String get serverIconBorderLockedHint =>
      'Raggiungi il livello boost 5 per sbloccare un bordo icona personalizzato.';

  @override
  String get serverBoostFromBank =>
      'Potenzia questo server dalla Banca del server nel marketplace per aumentarne il livello.';

  @override
  String get serverMarketplaceListingLabel => 'SCHEDA MARKETPLACE';

  @override
  String get serverListInMarketplace => 'Includi nel Marketplace Koda';

  @override
  String get serverListInMarketplaceDescription =>
      'Inserisce il negozio di questo server nel Koda Marketplace, con una possibilità di comparire nella rotazione settimanale degli articoli in evidenza. Riguarda lo shopping, non la ricerca di server a cui unirsi -- non influisce sulla ricerca generale dei server.';

  @override
  String get serverSocialLinkLabel => 'Link social/di invito (opzionale)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Salva link';

  @override
  String get serverPricingLabel => 'PREZZI';

  @override
  String get serverPrimaryCurrencyLabel => 'Valuta principale';

  @override
  String get serverPrimaryCurrencyDescription =>
      'Si applica ai livelli di abbonamento del server e ai prezzi dei beni digitali che imposti per questo server.';

  @override
  String get serverPrimaryLanguageLabel => 'Lingua principale';

  @override
  String get serverPrimaryLanguageDescription =>
      'I messaggi che i membri pubblicano in un\'altra lingua ricevono un piccolo badge lingua, confrontato con questa impostazione.';

  @override
  String get serverMarketplaceLinkSaved => 'Link marketplace salvato.';

  @override
  String get serverIconUpdated => 'Icona del server aggiornata!';

  @override
  String get serverTemplateImported => 'Modello importato!';

  @override
  String get serverImportFromDiscord => 'Importa da Discord';

  @override
  String get serverVispPlanLive => 'Il piano di Visp è pronto!';

  @override
  String get serverAskVisp => 'Chiedi a Visp';

  @override
  String get serverAddCategoryButton => 'Aggiungi categoria';

  @override
  String get serverAddChannelHereTooltip => 'Aggiungi canale qui';

  @override
  String get serverRename => 'Rinomina';

  @override
  String get serverUncategorized => 'SENZA CATEGORIA';

  @override
  String get serverAddChannel => 'Aggiungi canale';

  @override
  String get serverEditRulesContent => 'Modifica contenuto regolamento';

  @override
  String get serverRulesContentHint =>
      'Scrivi qui il regolamento del tuo server...';

  @override
  String get serverRulesUpdated => 'Regolamento aggiornato!';

  @override
  String get serverAddRole => 'Aggiungi ruolo';

  @override
  String get serverDefaultRoleLabel => 'Ruolo predefinito';

  @override
  String get serverManageRolesTooltip => 'Gestisci ruoli';

  @override
  String get serverMutedLabel => 'Silenziato';

  @override
  String get serverExpandedLabel => 'espanso';

  @override
  String get serverCollapsedLabel => 'compresso';

  @override
  String get serverUnmute => 'Riattiva audio';

  @override
  String get serverMute => 'Silenzia';

  @override
  String get serverKick => 'Espelli';

  @override
  String get serverBan => 'Banna';

  @override
  String serverBannedUsersLabel(int count) {
    return 'UTENTI BANNATI — $count';
  }

  @override
  String get serverNoBannedUsers => 'Nessun utente bannato.';

  @override
  String get serverUnban => 'Rimuovi ban';

  @override
  String get serverMemberFallbackGeneric => 'questo membro';

  @override
  String serverBanConfirm(String username, String serverName) {
    return 'Bannare $username da $serverName? Questa persona non potrà tornare senza essere sbannata.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return 'Espellere $username da $serverName? Questa persona potrà tornare con un invito.';
  }

  @override
  String get serverMuteDuration60Sec => '60 secondi';

  @override
  String get serverMuteDuration5Min => '5 minuti';

  @override
  String get serverMuteDuration10Min => '10 minuti';

  @override
  String get serverMuteDuration1Hour => '1 ora';

  @override
  String get serverMuteDuration1Day => '1 giorno';

  @override
  String get serverMuteDuration1Week => '1 settimana';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'Impossibile $action $username.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return 'Silenzia $username';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'Impossibile silenziare $username.';
  }

  @override
  String get serverUnlockInvites => 'Sblocca inviti';

  @override
  String get serverInvitesUnlocked => 'Inviti sbloccati.';

  @override
  String get serverAuditLogDescription =>
      'Attività di moderazione di livello 1 -- espulsioni, ban, silenziamenti e protezione automatica da flood/raid. Solo metadati; mai il contenuto dei messaggi.';

  @override
  String get serverSystemActor => 'Sistema';

  @override
  String get serverActionKicked => 'ha espulso';

  @override
  String get serverActionBanned => 'ha bannato';

  @override
  String get serverActionUnbanned => 'ha sbannato';

  @override
  String get serverActionMuted => 'ha silenziato';

  @override
  String get serverActionUnmuted => 'ha riattivato l\'audio di';

  @override
  String get serverActionFloodDetected =>
      'silenziato automaticamente per flood';

  @override
  String get serverActionRaidLockdownEnabled =>
      'ha bloccato gli inviti (protezione anti-raid)';

  @override
  String get serverActionRaidLockdownDisabled => 'ha sbloccato gli inviti';

  @override
  String get serverActionMoved => 'ha spostato';

  @override
  String get serverUnknownAction => 'azione sconosciuta';

  @override
  String get serverNoModerationActivity =>
      'Ancora nessuna attività di moderazione.';

  @override
  String get serverReportsDescription =>
      'Messaggi segnalati dai membri di questo server -- la copia già decrittografata di chi ha segnalato, rivelata segnalando.';

  @override
  String get serverNoPendingReports => 'Nessuna segnalazione in sospeso.';

  @override
  String get serverReportReasonOther => 'altro';

  @override
  String get serverReportStatusActioned => 'Gestita';

  @override
  String get serverReportStatusDismissed => 'Respinta';

  @override
  String get serverResolvedLabel => 'GESTITE';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'Segnalato da $reporter -- inviato da $target';
  }

  @override
  String serverReportNote(String note) {
    return 'Nota: $note';
  }

  @override
  String get serverDismissButton => 'Respingi';

  @override
  String get serverMarkActioned => 'Segna come gestita';

  @override
  String get serverCreateInvite => 'Crea invito';

  @override
  String get serverInviteCreatedTitle => 'Invito creato';

  @override
  String get serverNoActiveInvites => 'Nessun invito attivo';

  @override
  String serverUsesLabel(String uses) {
    return 'Utilizzi: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Elimina invito';

  @override
  String get serverChangeIconLabel => 'Cambia icona server';

  @override
  String get serverFallbackName => 'Server';

  @override
  String serverSettingsTitle(String serverName) {
    return 'Impostazioni di $serverName';
  }

  @override
  String get serverTabChannels => 'Canali';

  @override
  String get serverTabRoles => 'Ruoli';

  @override
  String get serverTabMembers => 'Membri';

  @override
  String get serverTabInvites => 'Inviti';

  @override
  String get serverTabMerch => 'Merchandising';

  @override
  String get serverTabEmoji => 'Emoji';

  @override
  String get serverTabCustomize => 'Personalizza';

  @override
  String get serverTabAuditLog => 'Registro di controllo';

  @override
  String get serverTabReports => 'Segnalazioni';

  @override
  String get serverTabThresholdMod => 'Moderazione a soglia';

  @override
  String get serverTabCharity => 'Beneficenza';

  @override
  String get homeCustomEmojiFallback => 'emoji personalizzata';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reazioni',
      one: '$count reazione',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted => ', hai reagito, attiva per rimuovere';

  @override
  String get homeReactionActivateToAdd => ', attiva per aggiungere';

  @override
  String get homeAddReactionLabel => 'Aggiungi reazione';

  @override
  String homeViewProfile(String username) {
    return 'Visualizza profilo di $username';
  }

  @override
  String get homeMoveToVoiceChannel => 'Sposta nel canale vocale…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Scegli un canale vocale';

  @override
  String get homeNoOtherVoiceChannels => 'Nessun altro canale vocale';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username ora è in $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'Impossibile spostare $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'Ora sei in $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'Partecipa a $channel per parlare';
  }

  @override
  String get adminPanelTitle => 'Pannello Amministratore';

  @override
  String get adminTabBackerCodes => 'Codici Sostenitore';

  @override
  String get adminTabUsers => 'Utenti';

  @override
  String get adminTabDmReports => 'Segnalazioni MD';

  @override
  String get adminTabSpamFlags => 'Segnalazioni Spam';

  @override
  String get adminTabWiki => 'Wiki';

  @override
  String get adminTabBoosts => 'Boost';

  @override
  String get adminCreateBackerCodeTitle => 'Crea Codice Sostenitore';

  @override
  String get adminCodeHint =>
      'Codice (lascia vuoto per generarlo automaticamente)';

  @override
  String get adminNoteHint => 'Nota (es. \"Kickstarter Livello 2\")';

  @override
  String get adminFlagsJsonHint =>
      'Flag in formato JSON, es. \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint => 'Utilizzi massimi (lascia vuoto = illimitati)';

  @override
  String get adminCodeCreatedTitle => 'Codice Creato';

  @override
  String get adminCodeLabel => 'Codice:';

  @override
  String get adminCopyCodeTooltip => 'Copia codice';

  @override
  String adminFlagsValue(String flags) {
    return 'Flag: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Codici Sostenitore e Ricompensa';

  @override
  String get adminNewCodeButton => 'Nuovo Codice';

  @override
  String get adminNoCodesYet => 'Ancora nessun codice';

  @override
  String get adminRewardsHeader => 'Ricompense';

  @override
  String get adminRewardAlphaBetaAccess =>
      'Accesso Alpha/Beta + Badge Alpha Spark';

  @override
  String get adminRewardLifetimePulse =>
      'Stato Pulse a vita + Badge Founder + Bitrate migliorato';

  @override
  String get adminRewardMonthlyBoostTokenOne =>
      'Token di boost server mensile (Audio/Video migliorato)';

  @override
  String get adminRewardAnimatedFrameBundle =>
      'Cornice profilo animata + Founders Hall + 2 token server mensili';

  @override
  String get adminRewardTitanGlow =>
      'Bagliore permanente del nome utente \"Titan\"';

  @override
  String get adminRewardAnimatedFrame => 'Cornice animata';

  @override
  String get adminRewardFoundersHall => 'Founders Hall';

  @override
  String adminRewardMonthlyBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count token boost/mese',
      one: '1 token boost/mese',
    );
    return '$_temp0';
  }

  @override
  String get adminRewardsNone => 'Nessuna ricompensa';

  @override
  String get adminRegistrationOpenLabel => 'La registrazione è aperta a tutti';

  @override
  String get adminRegistrationInviteOnlyLabel =>
      'La registrazione è solo su invito (richiesto codice backer)';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses utilizzi';
  }

  @override
  String get adminSearchUsersHint => 'Cerca utenti per nome utente...';

  @override
  String get adminSearchUsersPrompt => 'Cerca un utente qui sopra';

  @override
  String get adminNoDmReports => 'Nessuna segnalazione MD.';

  @override
  String get adminResolvedLabel => 'RISOLTO';

  @override
  String get adminReasonOther => 'altro';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Segnalante: $reporterId\nMittente rivelato: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Nota: $note';
  }

  @override
  String get adminDismissButton => 'Ignora';

  @override
  String get adminMarkActionedButton => 'Segna come Gestito';

  @override
  String get adminStatusActioned => 'Gestito';

  @override
  String get adminStatusDismissed => 'Ignorato';

  @override
  String get adminNoSpamFlags => 'Nessuna segnalazione di spam.';

  @override
  String get adminFlagMassDmSpam => 'Spam di MD di massa';

  @override
  String get adminFlagRaidLockdown => 'Blocco anti-raid';

  @override
  String get adminFlagBotBehavior => 'Comportamento simile a un bot';

  @override
  String get adminFlagChannelFlooding => 'Inondazione del canale';

  @override
  String get adminAutoEscalatedBadge => 'ESCALATO AUTOMATICAMENTE';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Affidabilità: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'Utente: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Server: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount di $totalJoiners nuovi arrivati ancora silenziati';
  }

  @override
  String get adminNoJoinersMuted =>
      'Nessun nuovo arrivato attualmente silenziato';

  @override
  String adminRestrictedUntil(String until) {
    return 'Attualmente limitato fino a $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'Non limitato al momento';

  @override
  String get adminDismissUndoButton => 'Ignora e Annulla';

  @override
  String get adminConfirmRestrictButton => 'Conferma e Limita';

  @override
  String get adminDeleteArticleTitle => 'Eliminare l\'articolo?';

  @override
  String adminDeleteArticleBody(String title) {
    return '\"$title\" verrà rimosso dalla knowledge base di Visp.';
  }

  @override
  String get adminNewArticleTitle => 'Nuovo Articolo';

  @override
  String get adminEditArticleTitle => 'Modifica Articolo';

  @override
  String get adminArticleTitleHint => 'Titolo';

  @override
  String get adminArticleContentHint => 'Contenuto dell\'articolo (markdown)';

  @override
  String get adminWikiArticlesHeader => 'Articoli della Wiki';

  @override
  String get adminNoArticlesYet => 'Ancora nessun articolo';

  @override
  String get adminEditArticleTooltip => 'Modifica articolo';

  @override
  String get adminDeleteArticleTooltip => 'Elimina articolo';

  @override
  String get adminSearchServersHint => 'Cerca server per nome...';

  @override
  String get adminSearchServersPrompt => 'Cerca un server qui sopra';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'Assegna boost a $serverName';
  }

  @override
  String get adminNumBoostsHint => 'Numero di boost';

  @override
  String get adminGrantButton => 'Assegna';

  @override
  String get adminPositiveNumberError => 'Inserisci un numero intero positivo.';

  @override
  String get adminGrantBoostsFailed => 'Impossibile assegnare i boost.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Assegnati $count boost a $serverName -- ora livello $level ($activeCount attivi).',
      one:
          'Assegnato $count boost a $serverName -- ora livello $level ($activeCount attivi).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count membri';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Assegna Boost';

  @override
  String get parentalDashboardTitle => 'Famiglia';

  @override
  String get parentalDashboardCreateChildTitle => 'Crea Account Bambino';

  @override
  String get parentalDashboardUsernameHint => 'Nome utente';

  @override
  String get parentalDashboardEmailHint => 'Email';

  @override
  String get parentalDashboardPasswordHint => 'Password';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'Questo crea un account completamente supervisionato: i canali etichettati vengono bloccati e potrai impostare gli orari consentiti e vedere (ma non leggere) i suoi amici e server.';

  @override
  String get parentalDashboardValidationError =>
      'Sono richiesti nome utente, email e una password di almeno 8 caratteri.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'Impossibile creare l\'account bambino -- nome utente/email potrebbero essere già in uso.';

  @override
  String get parentalDashboardCreatingLabel => 'Creazione in corso...';

  @override
  String get parentalDashboardNoChildren => 'Ancora nessun account collegato.';

  @override
  String get parentalDashboardSupervisedLabel => 'Account supervisionato';

  @override
  String get parentalDashboardUnknownUser => 'Sconosciuto';

  @override
  String get childDetailFallbackTitle => 'Account bambino';

  @override
  String get childDetailTabFriends => 'Amici';

  @override
  String get childDetailTabServers => 'Server';

  @override
  String get childDetailTabSchedule => 'Programma';

  @override
  String get childDetailTabOverride => 'Deroga';

  @override
  String get childDetailNoFriends => 'Nessun amico.';

  @override
  String get childDetailUnknownUser => 'Sconosciuto';

  @override
  String get childDetailRemoveFriendTooltip => 'Rimuovi amico';

  @override
  String get childDetailNoServers => 'Non è in nessun server.';

  @override
  String childDetailMemberCount(int count) {
    return '$count membri';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Rimuovi dal server';

  @override
  String get childDetailRestrictAccessTitle =>
      'Limita l\'accesso a orari stabiliti';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Disattivato significa accesso illimitato in qualsiasi momento';

  @override
  String get childDetailTimezoneLabel => 'Fuso orario';

  @override
  String get childDetailMonday => 'Lunedì';

  @override
  String get childDetailTuesday => 'Martedì';

  @override
  String get childDetailWednesday => 'Mercoledì';

  @override
  String get childDetailThursday => 'Giovedì';

  @override
  String get childDetailFriday => 'Venerdì';

  @override
  String get childDetailSaturday => 'Sabato';

  @override
  String get childDetailSunday => 'Domenica';

  @override
  String get childDetailNoAccessLabel => 'Nessun accesso';

  @override
  String get childDetailToLabel => 'alle';

  @override
  String get childDetailSavingLabel => 'Salvataggio...';

  @override
  String get childDetailSaveScheduleButton => 'Salva Programma';

  @override
  String get childDetailScheduleSaved => 'Programma salvato.';

  @override
  String get childDetailOverrideExplanation =>
      'Concedi accesso temporaneo al di fuori del programma normale -- utile per un\'eccezione una tantum senza modificare il programma settimanale.';

  @override
  String get childDetailReasonHint => 'Motivo (facoltativo)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes min';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+${hours}h';
  }

  @override
  String get childDetailRevokeOverrideButton => 'Revoca Deroga Attiva';

  @override
  String get childDetailAccessGranted => 'Accesso temporaneo concesso.';

  @override
  String get childDetailOverrideRevoked => 'Deroga revocata.';

  @override
  String get digitalGoodsTitle => 'Beni Digitali';

  @override
  String get digitalGoodsMyProductsTitle => 'I Miei Prodotti';

  @override
  String get digitalGoodsManageProductsTooltip =>
      'Gestisci i prodotti di questo server';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Passa a Esplora';

  @override
  String get digitalGoodsCreateProductTooltip => 'Crea prodotto';

  @override
  String get digitalGoodsBrowseTab => 'Esplora';

  @override
  String get digitalGoodsMyListingsTab => 'I Miei Annunci';

  @override
  String get digitalGoodsMyPurchasesTab => 'I Miei Acquisti';

  @override
  String get digitalGoodsNoProductsYet => 'Ancora nessun prodotto';

  @override
  String get digitalGoodsNoProductsAvailable => 'Nessun prodotto disponibile';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Crea il tuo primo prodotto per iniziare a vendere';

  @override
  String get digitalGoodsCheckBackLater =>
      'Torna più tardi per i beni digitali';

  @override
  String get digitalGoodsCreateProductButton => 'Crea Prodotto';

  @override
  String get digitalGoodsLicenseKeyBadge => 'Chiave di Licenza';

  @override
  String get digitalGoodsFileBadge => 'File';

  @override
  String get digitalGoodsAllServersBadge => 'Tutti i Server';

  @override
  String get digitalGoodsFreeForYou => 'Gratis per te';

  @override
  String get digitalGoodsFreeLabel => 'Gratis';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count venduti';
  }

  @override
  String get digitalGoodsKeysButton => 'Chiavi';

  @override
  String get digitalGoodsGetForFree => 'Ottieni Gratis';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'Acquista per $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'Ancora nessun acquisto';

  @override
  String get digitalGoodsUnknownProduct => 'Prodotto Sconosciuto';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'Acquistato il $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Copia chiave';

  @override
  String get digitalGoodsLicenseKeyCopied => 'Chiave di licenza copiata!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'Scade il $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'La Tua Chiave di Licenza';

  @override
  String get digitalGoodsCopyKeyButton => 'Copia Chiave';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'Impossibile avviare il pagamento -- questo creatore potrebbe non aver ancora collegato Stripe.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'Acquisto completato! Lo trovi in I Miei Acquisti.';

  @override
  String get digitalGoodsPurchasePending =>
      'Ancora in attesa di quel pagamento -- comparirà in I Miei Acquisti una volta completato.';

  @override
  String get digitalGoodsCreateProductTitle => 'Crea Prodotto';

  @override
  String get digitalGoodsEditProductTitle => 'Modifica Prodotto';

  @override
  String get digitalGoodsProductTitleHint => 'Titolo del prodotto';

  @override
  String get digitalGoodsDescriptionHint => 'Descrizione (facoltativa)';

  @override
  String get digitalGoodsPriceHint =>
      'Prezzo in USD (lascia vuoto per gratuito)';

  @override
  String get digitalGoodsProductTypeLabel => 'Tipo di prodotto';

  @override
  String get digitalGoodsFileDownloadOption => 'Download del file';

  @override
  String get digitalGoodsLicenseKeyOption => 'Chiave di licenza';

  @override
  String get digitalGoodsAvailabilityLabel => 'Disponibilità';

  @override
  String get digitalGoodsThisServerOnlyOption => 'Solo questo server';

  @override
  String get digitalGoodsAllKodaServersOption => 'Tutti i server Koda';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'Dopo la creazione, usa il pulsante \"Chiavi\" per caricare le tue chiavi di licenza.';

  @override
  String get digitalGoodsProductFileLabel => 'File del prodotto';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName (${sizeMb}MB)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Rimuovi file';

  @override
  String get digitalGoodsUploadingLabel => 'Caricamento...';

  @override
  String get digitalGoodsChooseFileButton => 'Scegli File';

  @override
  String get digitalGoodsReplaceFileButton => 'Sostituisci File';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Scegli un file per questo prodotto prima di salvare.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'Carica Chiavi di Licenza';

  @override
  String get digitalGoodsPasteKeysHint => 'Incolla una chiave per riga:';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Carica Chiavi';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'Chiavi di licenza caricate!';

  @override
  String get serverSubscriptionManageTitle => 'Gestisci Abbonamenti';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return 'Abbonamenti di $serverName';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Aggiungi livello';

  @override
  String get serverSubscriptionNoTiersYet =>
      'Ancora nessun livello di abbonamento';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Crea fino a 3 livelli per la tua community';

  @override
  String get serverSubscriptionCreateFirstTierButton => 'Crea Primo Livello';

  @override
  String get serverSubscriptionShowSubscriberCounts =>
      'Mostra numero di abbonati';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/mese';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count abbonati attivi',
      one: '$count abbonato attivo',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned =>
      'Ruolo assegnato automaticamente';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '$discount% di sconto sul marketplace';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'Questo server non ha livelli di abbonamento';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Abbonato Attivo';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'Scade il $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk =>
      'Ruolo esclusivo per abbonati';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return '$discount% di sconto sugli acquisti nel marketplace';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Canali riservati agli abbonati';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Attualmente Abbonato';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'Abbonati per $price/mese';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Crea Livello';

  @override
  String get serverSubscriptionEditTierTitle => 'Modifica Livello';

  @override
  String get serverSubscriptionTierNameHint =>
      'Nome del livello (es. Fan, Sostenitore, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Descrizione (facoltativa)';

  @override
  String get serverSubscriptionPriceHint => 'Prezzo al mese (USD)';

  @override
  String get serverSubscriptionDiscountLabel => '% di sconto sul marketplace';

  @override
  String get serverSubscriptionPositionLabel => 'Posizione';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Livello $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Assegna un ruolo all\'iscrizione — facoltativo';

  @override
  String get serverSubscriptionRoleFallback => 'ruolo';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Assegnato automaticamente a un membro nel momento in cui si abbona, e rimosso nel momento in cui l\'abbonamento scade.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Livello creato -- collega Stripe in Marketplace → Creatore prima che i membri possano abbonarsi.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Elimina Livello';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return 'Eliminare \"$tierName\"? Gli abbonati esistenti manterranno l\'accesso fino alla scadenza.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'Abbonati a $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel =>
      'Abbonamento mensile';

  @override
  String get serverSubscriptionServerBankEarnsLabel =>
      'La banca del server guadagna';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points pt';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Pagamento elaborato in modo sicuro da Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'Abbonati';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'Impossibile avviare il pagamento -- il proprietario di questo server potrebbe non aver ancora collegato Stripe.';

  @override
  String get serverSubscriptionSubscribed => 'Abbonato!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'Ancora in attesa di quel pagamento -- si attiverà una volta completato.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'Invia una mancia a $username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Seleziona importo';

  @override
  String get tipDialogMessageHint => 'Aggiungi un messaggio (facoltativo)';

  @override
  String get tipDialogYouPayLabel => 'Tu paghi';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username riceve';
  }

  @override
  String get tipDialogSendTipButton => 'Invia Mancia';

  @override
  String get tipDialogFailedToSendTip =>
      'Impossibile inviare la mancia. Il creatore potrebbe non essere collegato a Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'Impossibile avviare il pagamento. Riprova tra un momento.';

  @override
  String get tipDialogTipSent => 'Mancia inviata!';

  @override
  String get tipDialogTipPending =>
      'Ancora in attesa di quel pagamento -- andrà a buon fine una volta completato.';

  @override
  String get tipDialogUnknownUser => 'Sconosciuto';

  @override
  String get marketplaceTitle => 'Marketplace';

  @override
  String get marketplaceCreatorPayoutsTitle => 'Pagamenti ai Creatori';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Ricevi mance direttamente tramite Stripe';

  @override
  String get marketplaceTabServerBank => 'Banca del Server';

  @override
  String get marketplaceTabDigitalGoods => 'Beni Digitali';

  @override
  String get marketplaceTabMerch => 'Merch';

  @override
  String get marketplaceTabSubscription => 'Abbonamento';

  @override
  String get marketplaceTabRevenue => 'Entrate';

  @override
  String get marketplaceSelectServerSubscription =>
      'Seleziona un server per vedere il suo abbonamento';

  @override
  String get marketplaceSelectServerBank =>
      'Seleziona un server per vedere la sua banca';

  @override
  String get marketplaceSelectServerRevenue =>
      'Seleziona un server per vedere le sue entrate';

  @override
  String get marketplaceStripeAccountStatus => 'Account Stripe';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Registrazione completata';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'Accetta pagamenti';

  @override
  String get marketplaceConnectStripeButton => 'Collega Account Stripe';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Completa la Registrazione a Stripe';

  @override
  String get marketplaceRefreshStatusButton => 'Aggiorna Stato';

  @override
  String get marketplaceReadyToReceiveTips => 'Sei pronto a ricevere mance!';

  @override
  String get marketplaceHowItWorksTitle => 'Come funziona';

  @override
  String get marketplaceHowItWorksStep1 => 'Collega il tuo account Stripe';

  @override
  String get marketplaceHowItWorksStep2 =>
      'Completa la verifica dell\'identità';

  @override
  String get marketplaceHowItWorksStep3 =>
      'Ricevi mance direttamente sulla tua banca';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda applica una commissione di elaborazione del 5%. La commissione va alla banca del tuo server sotto forma di punti.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Solo il proprietario del server o chi ha il permesso Gestisci Marketplace può visualizzare la Banca del Server.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName boostato!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit slot emoji personalizzati';
  }

  @override
  String get marketplaceServerFallback => 'Server';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance pt';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount di attività';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'I punti derivano dalla commissione di elaborazione del 5% su mance e abbonamenti di questo server. Usa i punti per sbloccare miglioramenti del server.';

  @override
  String get marketplaceServerBoostsTitle => 'Boost del Server';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Livello $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count boost attivi',
      one: '$count boost attivo',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: 'Mancano $more boost per raggiungere il livello $level',
      one: 'Manca $more boost per raggiungere il livello $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' e sblocca uno sfondo server personalizzato';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' e sblocca un bordo icona server personalizzato';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hai $count token boost disponibili.',
      one: 'Hai $count token boost disponibile.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'I token boost provengono da un abbonamento Pulse (1/mese). Abbonati nella scheda Abbonamenti per ottenerne uno.';

  @override
  String get marketplaceBoostingLabel => 'Boost in corso...';

  @override
  String get marketplaceBoostThisServerButton => 'Boosta Questo Server';

  @override
  String get marketplaceComingSoonUpgradesTitle =>
      'Prossimamente — Miglioramenti del server';

  @override
  String get marketplaceSpendPointsList =>
      'Spendi i punti della banca del server per:\n• Dominio server personalizzato\n• Limite membri aumentato\n• Supporto prioritario\n• Badge server esclusivo';

  @override
  String get marketplaceSourceTip => 'Mance';

  @override
  String get marketplaceSourceSubscription => 'Abbonamenti Koda';

  @override
  String get marketplaceSourceServerSubscription => 'Abbonamenti Server';

  @override
  String get marketplaceSourceDigitalProduct => 'Beni Digitali';

  @override
  String get marketplaceSourceStageTicket => 'Biglietti Stage';

  @override
  String get marketplaceSourcePrintfulOrder => 'Ordini Merch';

  @override
  String get marketplaceJustNow => 'proprio ora';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return '${minutes}m fa';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return '${hours}h fa';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return '${days}g fa';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Solo i membri che possono gestire il marketplace possono visualizzare le entrate di questo server.';

  @override
  String get marketplaceBalanceLabel => 'Saldo';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Guadagno Totale';

  @override
  String get marketplaceLast30DaysTitle => 'Ultimi 30 Giorni';

  @override
  String get marketplaceRevenueBySourceTitle => 'Entrate per Fonte';

  @override
  String get marketplaceNoRevenueYet => 'Ancora nessuna entrata.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count transazioni',
      one: '$count transazione',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'Transazioni Recenti';

  @override
  String get marketplaceNoTransactionsYet => 'Ancora nessuna transazione.';

  @override
  String get marketplaceNoActivityYet => 'Ancora nessuna attività';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sincronizzati $count prodotti da Printful',
      one: 'Sincronizzato $count prodotto da Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Impossibile sincronizzare con Printful -- controlla la connessione nelle impostazioni Merch.';

  @override
  String get printfulMerchSelectServer =>
      'Seleziona un server per vedere il suo merch';

  @override
  String get printfulMerchManageCatalogTitle => 'Gestisci Catalogo Merch';

  @override
  String get printfulMerchTitle => 'Merch';

  @override
  String get printfulMerchSyncingLabel => 'Sincronizzazione...';

  @override
  String get printfulMerchSyncCatalogButton => 'Sincronizza Catalogo';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'Passa a Esplora';

  @override
  String get printfulMerchManageTooltip => 'Gestisci il merch di questo server';

  @override
  String get printfulMerchNothingSyncedYet => 'Ancora nulla sincronizzato';

  @override
  String get printfulMerchNoMerchAvailable => 'Ancora nessun merch disponibile';

  @override
  String get printfulMerchSyncHint =>
      'Sincronizza il tuo negozio Printful per importare il tuo catalogo prodotti';

  @override
  String get printfulMerchCheckBackLater =>
      'Torna più tardi per il merch di questo server';

  @override
  String get printfulMerchOutOfStock => 'Esaurito';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Da $price • $count opzioni',
      one: 'Da $price • $count opzione',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'Visualizza';

  @override
  String printfulMerchPayoutTo(String username) {
    return 'Pagamento a: $username';
  }

  @override
  String get printfulMerchPayoutToYou => 'Pagamento a: te';

  @override
  String get printfulMerchPayoutChangeButton => 'Modifica';

  @override
  String get printfulMerchPayoutDialogTitle => 'Destinatario del Pagamento';

  @override
  String get printfulMerchPayoutDialogBody =>
      'Indirizza la quota dei proventi dell\'ordine di questo articolo a un altro utente anziché a te -- dovrà collegare il proprio account Stripe e completare l\'onboarding prima che qualcuno possa acquistarlo.';

  @override
  String get printfulMerchPayoutUsernameHint => 'Nome utente';

  @override
  String get printfulMerchPayoutLookupButton => 'Cerca';

  @override
  String get printfulMerchPayoutUserNotFound =>
      'Nessun utente trovato con quel nome.';

  @override
  String printfulMerchPayoutResolvedAs(String username) {
    return 'Trovato: $username';
  }

  @override
  String get printfulMerchPayoutResetButton => 'Ripristina a me';

  @override
  String get printfulMerchCartTooltip => 'Carrello';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productName aggiunto al carrello';
  }

  @override
  String get printfulMerchQuantityLabel => 'Quantità';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Diminuisci quantità';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Aumenta quantità';

  @override
  String get printfulMerchAddToCartButton => 'Aggiungi al Carrello';

  @override
  String get printfulMerchOptionLabel => 'Opzione';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Stile';

  @override
  String get printfulMerchSizeLabel => 'Taglia';

  @override
  String get printfulMerchYourCartTitle => 'Il Tuo Carrello';

  @override
  String get printfulMerchCartEmpty => 'Il tuo carrello è vuoto.';

  @override
  String get printfulMerchSubtotalLabel => 'Subtotale';

  @override
  String get printfulMerchCheckoutLabel => 'Checkout';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'Rimuovi dal carrello';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Compila prima il tuo indirizzo di spedizione.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'Impossibile ottenere le tariffe di spedizione per quell\'indirizzo.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'Impossibile avviare il pagamento. Riprova tra un momento.';

  @override
  String get printfulMerchOrderPlaced => 'Ordine effettuato!';

  @override
  String get printfulMerchOrderPending =>
      'Ancora in attesa di quel pagamento -- l\'ordine verrà effettuato una volta completato.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Velocità di spedizione';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max giorni lavorativi';
  }

  @override
  String get printfulMerchGetShippingQuoteButton =>
      'Ottieni Preventivo di Spedizione';

  @override
  String get printfulMerchPayButton => 'Paga';

  @override
  String get kodaMarketplaceTitle => 'Koda Marketplace';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Abbonamenti';

  @override
  String get kodaMarketplaceTabBoosts => 'Boost';

  @override
  String get kodaMarketplaceTabDiscover => 'Scopri';

  @override
  String get kodaMarketplaceTierFreeName => 'Gratis';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'Scade il $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks =>
      'Esegui l\'upgrade per vantaggi esclusivi';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count token boost disponibili',
      one: '$count token boost disponibile',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Regala un token a qualsiasi server di cui fai parte dalla sua scheda Banca del Server';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame =>
      'Cornice avatar personalizzata';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Badge Spark sul profilo';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Limite di caricamento file aumentato (50MB)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality =>
      'Qualità vocale prioritaria';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark =>
      'Tutto ciò che offre Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => 'Cornice avatar animata';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Badge Pulse sul profilo';

  @override
  String get kodaMarketplacePulsePerkFileLimit =>
      'Limite di caricamento file di 100MB';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      '1 token boost server al mese';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/mese';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Piano Attuale';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'Ottieni $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return 'Regala $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return 'Regala $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'Abbonati a $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel =>
      'Nome utente del destinatario:';

  @override
  String get kodaMarketplaceUsernameHint => 'Nome utente';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Abbonamento';

  @override
  String get kodaMarketplaceTotalLabel => 'Totale';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Pagamento elaborato in modo sicuro da Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'Procedi al Pagamento';

  @override
  String get kodaMarketplaceUserNotFound => 'Utente non trovato';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'Impossibile avviare il pagamento. Riprova tra un momento.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'Abbonamento attivo!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'Ancora in attesa di quel pagamento -- si attiverà una volta completato.';

  @override
  String get kodaMarketplaceBoostPurchased => 'Boost acquistato!';

  @override
  String get kodaMarketplaceBoostPending =>
      'Ancora in attesa di quel pagamento -- sarà pronto una volta completato.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count disponibili';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Acquista un Boost';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'Un acquisto una tantum -- gli abbonati Pulse ricevono anche un token gratuito a ogni rinnovo, il che resta l\'opzione migliore se fai boost regolarmente.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Acquista un Boost -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Nessun server ha ancora aderito al Koda Marketplace. I proprietari dei server possono attivarlo nelle impostazioni Personalizza del proprio server.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader =>
      'IN EVIDENZA QUESTA SETTIMANA';

  @override
  String get kodaMarketplaceAllListedServersHeader => 'TUTTI I SERVER ELENCATI';

  @override
  String get kodaMarketplaceFeaturedItemsHeader => 'ARTICOLI IN EVIDENZA';

  @override
  String get kodaMarketplaceAllItemsHeader => 'TUTTI GLI ARTICOLI';

  @override
  String get kodaMarketplaceServerFallback => 'Server';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membri',
      one: '$count membro',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceVisitStore => 'Visita il negozio';

  @override
  String get calendarFallbackTitle => 'Calendario';

  @override
  String get calendarAskVispTooltip => 'Chiedi a Visp';

  @override
  String get calendarCreateEventTooltip => 'Crea Evento';

  @override
  String get calendarPreviousMonthTooltip => 'Mese precedente';

  @override
  String get calendarNextMonthTooltip => 'Mese successivo';

  @override
  String get calendarTodayButton => 'Oggi';

  @override
  String get calendarWeekdaySun => 'dom';

  @override
  String get calendarWeekdayMon => 'lun';

  @override
  String get calendarWeekdayTue => 'mar';

  @override
  String get calendarWeekdayWed => 'mer';

  @override
  String get calendarWeekdayThu => 'gio';

  @override
  String get calendarWeekdayFri => 'ven';

  @override
  String get calendarWeekdaySat => 'sab';

  @override
  String get calendarTodaySuffix => ', oggi';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count eventi',
      one: ', $count evento',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'Seleziona un giorno';

  @override
  String get calendarNoEvents => 'Nessun evento';

  @override
  String get calendarSubscribeTooltip => 'Iscriviti';

  @override
  String get calendarUnsubscribeTooltip => 'Annulla iscrizione';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'Si ripete $recurrence';
  }

  @override
  String get calendarTicketOwned => 'Biglietto posseduto';

  @override
  String calendarTicketPrice(String price) {
    return 'Biglietto $price';
  }

  @override
  String get calendarDeleteEventTitle => 'Elimina Evento';

  @override
  String calendarDeleteEventConfirm(String title) {
    return 'Eliminare \"$title\"? Questa azione non può essere annullata.';
  }

  @override
  String get calendarEditEventTitle => 'Modifica Evento';

  @override
  String get calendarCreateEventTitle => 'Crea Evento';

  @override
  String get calendarEventTitleHint => 'Titolo evento';

  @override
  String get calendarDescriptionHint => 'Descrizione (facoltativa)';

  @override
  String get calendarLocationHint => 'Luogo (facoltativo)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Inizio ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Data e ora di inizio, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'Fine — facoltativo ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'Data e ora di fine, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'non impostato';

  @override
  String get calendarTapToSetEndTime => 'Tocca per impostare l\'ora di fine';

  @override
  String get calendarRecurrenceLabel => 'Ricorrenza';

  @override
  String get calendarRecurrenceNone => 'Non si ripete';

  @override
  String get calendarRecurrenceDaily => 'Giornaliera';

  @override
  String get calendarRecurrenceWeekly => 'Settimanale';

  @override
  String get calendarRecurrenceMonthly => 'Mensile';

  @override
  String get calendarColorLabel => 'Colore';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Colore $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Prezzo biglietto — facoltativo';

  @override
  String get calendarLinkStageChannelLabel =>
      'Collega a canale stage — facoltativo';

  @override
  String get calendarStageChannelFallback => 'stage';

  @override
  String get discordImportFetchError => 'Impossibile recuperare il template.';

  @override
  String get discordImportApplyError =>
      'Impossibile applicare il template. Riprova.';

  @override
  String get discordImportTitle => 'Importa Template Discord';

  @override
  String get discordImportDescription =>
      'Incolla un link discord.new o un codice template per importare ruoli, categorie e canali in questo server.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 o codice template';

  @override
  String get discordImportPreviewButton => 'Anteprima';

  @override
  String get discordImportTemplateFallback => 'Template';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ruoli',
      one: '$count ruolo',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categorie',
      one: '$count categoria',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count canali',
      one: '$count canale',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel =>
      'SOSTITUISCI STRUTTURA ESISTENTE';

  @override
  String get discordImportReplaceWarning =>
      'Tutti i canali, le categorie e i ruoli esistenti verranno eliminati definitivamente.';

  @override
  String get discordImportAddDescription =>
      'Il template verrà aggiunto alla struttura esistente del tuo server.';

  @override
  String get discordImportReplaceConfirmTitle =>
      'Sostituire la struttura del server?';

  @override
  String get discordImportReplaceConfirmBody =>
      'Questo eliminerà definitivamente TUTTI i canali, le categorie e i ruoli esistenti prima dell\'importazione. Questa azione non può essere annullata.';

  @override
  String get discordImportYesReplace => 'Sì, Sostituisci';

  @override
  String get discordImportReplaceAndImportButton =>
      'Sostituisci e Importa Template';

  @override
  String get discordImportAddToServerButton => 'Aggiungi Template al Server';

  @override
  String get thresholdModConfigureTitle => 'Configura Moderazione a Soglia';

  @override
  String get thresholdModConfigureExplanation =>
      'Scegli moderatori fidati e quanti di loro devono essere d\'accordo prima che uno di loro possa decrittografare un\'epoca della cronologia di un canale. Nemmeno tu ottieni una chiave unilaterale -- sei esente solo se sei anche tu in questo elenco.';

  @override
  String get thresholdModThresholdLabel => 'Soglia:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Diminuisci soglia';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Aumenta soglia';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'di $count moderatori',
      one: 'di $count moderatore',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle =>
      'Richiedi Decrittazione a Soglia';

  @override
  String get thresholdModChannelLabel => 'Canale';

  @override
  String get thresholdModReasonHint =>
      'Motivo -- mostrato a ogni moderatore designato';

  @override
  String get thresholdModRequestButton => 'Richiedi';

  @override
  String get thresholdModShareRelayed => 'Quota inoltrata al richiedente.';

  @override
  String get thresholdModNotEnoughShares =>
      'Non ci sono ancora abbastanza quote inoltrate -- riprova quando altri moderatori avranno inoltrato le loro.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count messaggi',
      one: '$count messaggio',
    );
    return 'Epoca $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'Nessun messaggio decrittabile in questa epoca.';

  @override
  String get thresholdModExplanation =>
      'Decrittazione reale della cronologia di un canale, subordinata all\'accordo attivo di più moderatori designati -- mai una sola persona, nemmeno il proprietario del server. Sblocca sempre e solo un\'intera epoca (tutto ciò che è stato inviato dall\'ultimo cambiamento nei membri), mai un singolo messaggio.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Attivo -- $count moderatori, soglia $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'Non configurato';

  @override
  String get thresholdModReconfigureButton => 'Riconfigura';

  @override
  String get thresholdModEnableButton => 'Attiva';

  @override
  String get thresholdModNotEnabledForServer =>
      'La moderazione a soglia non è attiva per questo server.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Attiva per questo server. Non sei uno dei moderatori designati.';

  @override
  String get thresholdModRequestsLabel => 'Richieste';

  @override
  String get thresholdModRequestDecryptButton => 'Richiedi Decrittazione';

  @override
  String get thresholdModNoActiveRequests => 'Nessuna richiesta attiva.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- epoca $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'in attesa';

  @override
  String get thresholdModStatusApproved => 'approvata';

  @override
  String get thresholdModApproveButton => 'Approva';

  @override
  String get thresholdModRelayShareButton => 'Inoltra la Mia Quota';

  @override
  String get thresholdModTryReconstructButton => 'Prova a Ricostruire';

  @override
  String get roleSelectNoRolesAvailable =>
      'Nessun ruolo autoassegnabile disponibile.';

  @override
  String get roleSelectInstructions =>
      'Seleziona i ruoli che desideri. Tocca un ruolo per aggiungerlo o rimuoverlo.';

  @override
  String get rulesScreenAcceptError =>
      'Impossibile accettare le regole. Riprova.';

  @override
  String get rulesScreenSubtitle => 'Regole del Server';

  @override
  String get rulesScreenScrollToRead =>
      'Scorri verso il basso per leggere tutte le regole';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'Facendo clic su Accetta, accetti di seguire queste regole.\nLe violazioni possono comportare la rimozione dal server.';

  @override
  String get rulesScreenAcceptButton => 'Accetto le Regole';

  @override
  String get rulesScreenReadAllToContinue =>
      'Leggi tutte le regole per continuare';

  @override
  String get galleryNewPostTitle => 'Nuovo Post';

  @override
  String get galleryChooseFileButton => 'Scegli File';

  @override
  String get galleryOrDivider => 'o';

  @override
  String get galleryPasteUrlHint => 'Incolla URL immagine/video';

  @override
  String get galleryTypeLabel => 'Tipo';

  @override
  String get galleryImageOption => 'Immagine';

  @override
  String get galleryVideoOption => 'Video';

  @override
  String get galleryCaptionHint => 'Didascalia (facoltativa)';

  @override
  String get galleryPostButton => 'Pubblica';

  @override
  String get galleryNewCollectionTitle => 'Nuova Raccolta';

  @override
  String get galleryCollectionNameHint => 'Nome della raccolta';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return 'Eliminare \"$collectionName\"? I post al suo interno diventeranno non raccolti.';
  }

  @override
  String get galleryFeedTab => 'Feed';

  @override
  String get galleryCollectionsTab => 'Raccolte';

  @override
  String get galleryNoPostsYet => 'Ancora nessun post';

  @override
  String get galleryNoCollectionsYet => 'Ancora nessuna raccolta';

  @override
  String get gallerySelectACollection => 'Seleziona una raccolta';

  @override
  String get galleryNoPostsInCollection => 'Nessun post in questa raccolta';

  @override
  String get galleryAddPostButton => 'Aggiungi Post';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Condivisione schermo non riuscita: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return 'Volume di $username';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'Influisce solo su ciò che senti tu -- questo dispositivo, questa chiamata.';

  @override
  String get voiceScreenResetVolumeButton => 'Ripristina';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'Impossibile connettersi: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Il tuo schermo, tocca per visualizzare a schermo intero';

  @override
  String get voiceScreenYourScreenLabel => 'Il tuo schermo';

  @override
  String get voiceScreenTapToClose => 'Tocca per chiudere';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (tu)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', sta parlando';

  @override
  String get voiceScreenCameraOnSuffix => ', videocamera attiva';

  @override
  String get voiceScreenActivateToPopOut =>
      ', attiva per aprire in finestra separata';

  @override
  String get voiceScreenShowVarmTooltip => 'Mostra VARM';

  @override
  String get voiceScreenHideVarmTooltip => 'Nascondi VARM';

  @override
  String get voiceScreenShowChatTooltip => 'Mostra chat';

  @override
  String get voiceScreenHideChatTooltip => 'Nascondi chat';

  @override
  String get voiceScreenStartCameraTooltip => 'Avvia videocamera';

  @override
  String get voiceScreenStopCameraTooltip => 'Ferma videocamera';

  @override
  String get voiceScreenShareScreenTooltip => 'Condividi schermo';

  @override
  String get voiceScreenStopSharingTooltip => 'Interrompi condivisione';

  @override
  String get voiceScreenPopOutTooltip =>
      'Apri la voce in una finestra separata';

  @override
  String get voiceScreenCouldNotPopOut =>
      'Impossibile aprire la voce in una finestra separata.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Esci dalla Voce';

  @override
  String get voiceScreenPinTooltip => 'Blocca (mantieni aperto)';

  @override
  String get voiceScreenUnpinTooltip => 'Sblocca';

  @override
  String get voiceScreenSizeSmall => 'Piccolo (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Medio (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Grande (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, $count connessi';
  }

  @override
  String get voiceBarSpeakingSuffix => ', stai parlando';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count connessi · tocca per espandere';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Avvia videocamera';

  @override
  String get voiceBarStopCameraTooltip => 'Ferma videocamera';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Esci dalla Voce';

  @override
  String get popOutVideoFallbackTitle => 'Voce';

  @override
  String get popOutVideoMissingTokenError => 'Token o URL mancante';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Connessione scaduta dopo 15 secondi';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Errore: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'Nessun partecipante';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Stage';

  @override
  String get stageCouldNotJoin => 'Impossibile unirsi allo stage.';

  @override
  String get stageThisStageFallback => 'Questo stage';

  @override
  String get stageRequiresTicketToJoin =>
      'richiede un biglietto per partecipare';

  @override
  String get stagePleaseWaitLabel => 'Attendere...';

  @override
  String get stageGetFreeTicketButton => 'Ottieni Biglietto Gratuito';

  @override
  String stageBuyTicketButton(String price) {
    return 'Acquista Biglietto -- $price';
  }

  @override
  String get stageNotNowButton => 'Non ora';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'Impossibile avviare l\'acquisto del biglietto.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'Ancora in attesa di quel pagamento -- prova a rientrare una volta confermato.';

  @override
  String get stageSpeakerBadge => 'Relatore';

  @override
  String get stageListenerBadge => 'Ascoltatore';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'Impossibile partecipare: $error';
  }

  @override
  String get stageSpeakersHeader => 'RELATORI';

  @override
  String get stageRaisedHandsHeader => 'MANI ALZATE';

  @override
  String get stageAllowButton => 'Consenti';

  @override
  String get stageIgnoreButton => 'Ignora';

  @override
  String get stageListenersHeader => 'ASCOLTATORI';

  @override
  String get stageRaiseHandTooltip => 'Alza la mano';

  @override
  String get stageLowerHandTooltip => 'Abbassa la mano';

  @override
  String get stageLeaveStageTooltip => 'Esci dallo Stage';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (tu)';
  }

  @override
  String get stageMoveToListenersButton => 'Sposta tra gli ascoltatori';

  @override
  String get stageYouFallbackName => 'Tu';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'Avatar di $username';
  }

  @override
  String get channelEditDialogNewTitle => 'Nuovo Canale';

  @override
  String get channelEditDialogEditTitle => 'Modifica Canale';

  @override
  String get channelEditDialogNameHint => 'Nome del canale';

  @override
  String get channelEditDialogDescriptionHint => 'Argomento (opzionale)';

  @override
  String get channelEditDialogTypeLabel => 'Tipo';

  @override
  String get channelEditDialogTypeText => 'Testo';

  @override
  String get channelEditDialogTypeVoice => 'Voce';

  @override
  String get channelEditDialogTypeGallery => 'Galleria';

  @override
  String get channelEditDialogTypeStage => 'Stage';

  @override
  String get channelEditDialogTypeRules => 'Regole';

  @override
  String get channelEditDialogTypeRoleSelection => 'Selezione Ruolo';

  @override
  String get channelEditDialogTypeCalendar => 'Calendario';

  @override
  String get channelEditDialogAnnouncementTitle => 'Canale annunci';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Solo i membri che possono gestire i messaggi possono pubblicare';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Pubblica qui gli annunci di live streaming e caricamenti';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'Pubblica automaticamente quando un membro con il permesso \"Annuncia quando in diretta\" va in diretta su Twitch o pubblica un nuovo video su YouTube';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Notifica questi ruoli alla pubblicazione (facoltativo)';

  @override
  String get channelEditDialogSlowmodeLabel => 'Modalità lenta';

  @override
  String get channelEditDialogSlowmodeOff => 'Disattivato';

  @override
  String get channelEditDialogUserLimitLabel => 'Limite utenti';

  @override
  String get channelEditDialogUserLimitOff => 'Nessun limite';

  @override
  String get channelEditDialogCategoryLabel => 'Categoria';

  @override
  String get channelEditDialogNoCategory => 'Nessuna categoria';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Accesso per Ruolo (lascia vuoto per tutti)';

  @override
  String get channelEditDialogContentLabelsLabel => 'Etichette Contenuto';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Contrassegna questo canale per i filtri contenuti dei membri; bloccato in modo rigido per gli account supervisionati';

  @override
  String get categoryEditDialogNewTitle => 'Nuova Categoria';

  @override
  String get categoryEditDialogEditTitle => 'Modifica Categoria';

  @override
  String get categoryEditDialogNameHint => 'Nome della categoria';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Accesso per Ruolo (lascia vuoto per tutti)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Membri — $count online';
  }

  @override
  String get memberPanelRefreshTooltip => 'Aggiorna elenco membri';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membri',
      one: '$count membro',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Offline';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', livello $tier';
  }

  @override
  String get memberPanelUnknownUser => 'Sconosciuto';

  @override
  String get memberPanelModerationActionsTooltip => 'Azioni di moderazione';

  @override
  String get reportDialogReasonSpam => 'Spam';

  @override
  String get reportDialogReasonHarassment => 'Molestie o abuso';

  @override
  String get reportDialogReasonIllegal => 'Contenuto illegale';

  @override
  String get reportDialogReasonOther => 'Altro';

  @override
  String get reportDialogReasonLabel => 'Motivo';

  @override
  String get reportDialogNoteHint =>
      'C\'è altro che i moderatori dovrebbero sapere? (facoltativo)';

  @override
  String get reportDialogDisclosureNote =>
      'Il contenuto del messaggio mostrato a te e chi lo ha inviato saranno condivisi con i moderatori di questo server.';

  @override
  String get reportDialogSubmitButton => 'Invia Segnalazione';

  @override
  String get reportDialogSubmitError => 'Impossibile inviare la segnalazione.';

  @override
  String get notificationBellTitle => 'Notifiche';

  @override
  String get notificationBellMarkAllRead => 'Segna tutto come letto';

  @override
  String get notificationBellEmptyState => 'Ancora nessuna notifica';

  @override
  String get notificationBellUnreadLabel => 'Non letto';

  @override
  String get invitePreviewTitle => 'Invito al Server';

  @override
  String get invitePreviewInvalidOrExpired => 'Invito non valido o scaduto.';

  @override
  String get invitePreviewCouldNotJoin => 'Impossibile unirsi al server.';

  @override
  String get invitePreviewUnknownServer => 'Server sconosciuto';

  @override
  String get shippingAddressFullNameHint => 'Nome completo';

  @override
  String get shippingAddressLine1Hint => 'Indirizzo riga 1';

  @override
  String get shippingAddressLine2Hint => 'Indirizzo riga 2 (facoltativo)';

  @override
  String get shippingAddressCityHint => 'Città';

  @override
  String get shippingAddressStateHint => 'Provincia';

  @override
  String get shippingAddressZipHint => 'CAP';

  @override
  String get shippingAddressCountryCodeHint => 'Codice paese (es. IT)';

  @override
  String get shippingAddressPhoneHint => 'Telefono (facoltativo)';

  @override
  String get shippingAddressPrivacyNote =>
      'Usato solo per spedire questo ordine -- consulta l\'informativa sulla privacy di Printful per sapere come viene gestito dopo l\'ordine.';

  @override
  String get updateNudgeAvailableTitle => 'Aggiornamento Disponibile';

  @override
  String get updateNudgeRequiredTitle => 'Aggiornamento Richiesto';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $version è disponibile -- stai usando una versione precedente.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'Questa versione non è più supportata. Aggiorna a Koda $version per continuare a usare Koda.';
  }

  @override
  String get updateNudgeLaterButton => 'Più tardi';

  @override
  String get tierBadgeSparkSubscriber => 'Abbonato Spark';

  @override
  String get tierBadgePulseSubscriber => 'Abbonato Pulse';

  @override
  String get tierBadgeAlphaSpark => 'Alpha Spark';

  @override
  String get tierBadgeFounder => 'Founder';

  @override
  String get foundersHallTitle => 'Founders Hall';

  @override
  String get foundersHallSubtitle =>
      'I primi sostenitori che hanno reso possibile Koda.';

  @override
  String get foundersHallEmptyState => 'Nessun fondatore ancora.';

  @override
  String get settingsFoundersHallTitle => 'Founders Hall';

  @override
  String get settingsFoundersHallSubtitle =>
      'Scopri chi ha aiutato a costruire Koda';

  @override
  String get vispAvatarInDevelopment => 'IN SVILUPPO';

  @override
  String get vispBoostAdvisorCouldNotAnswer =>
      'Visp non è riuscito a formulare una risposta.';

  @override
  String get vispBoostAdvisorTitle => 'Chiedi a Visp: Consulente ROI Boost';

  @override
  String get vispBoostAdvisorFollowUpHint => 'Fai una domanda di follow-up...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Invia';

  @override
  String get vispBoostAdvisorBasedOn => 'Basato su:';

  @override
  String get vispEventDialogCouldNotGenerate =>
      'Visp non è riuscito a generare un evento.';

  @override
  String get vispEventDialogCouldNotCreate =>
      'Impossibile creare quell\'evento.';

  @override
  String get vispEventDialogRecurrenceNone => 'Una tantum';

  @override
  String get vispEventDialogRecurrenceDaily => 'Si ripete ogni giorno';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Si ripete ogni settimana';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Si ripete ogni mese';

  @override
  String get vispEventDialogTitle => 'Chiedi a Visp di creare un evento';

  @override
  String get vispEventDialogDescription =>
      'Descrivi l\'evento -- Visp proporrà un titolo, data/ora e altri dettagli.';

  @override
  String get vispEventDialogPromptHint =>
      'es. \"Sessione settimanale di D&D ogni venerdì alle 19:00 per circa 3 ore\"';

  @override
  String get vispEventDialogPrivacyNote =>
      'La tua descrizione viene inviata a Visp (un assistente self-hosted -- nulla lascia i server di Koda) per generare questo piano.';

  @override
  String get vispEventDialogStartOver => 'Ricomincia';

  @override
  String get vispEventDialogCreateEvent => 'Crea Evento';

  @override
  String get vispEventDialogThinking => 'Sto pensando...';

  @override
  String get vispEventDialogGeneratePlan => 'Genera Piano';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'Impossibile interpretare una data -- prova a riformulare';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Termina $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price a biglietto';
  }

  @override
  String get vispEventDialogBasedOn => 'Basato su:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Domanda $questionNumber di $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'Oppure scrivi la tua risposta...';

  @override
  String get vispQuestionStepSendTooltip => 'Invia';

  @override
  String get vispQuestionStepSkip => 'Salta e genera ora';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp non è riuscito a generare un piano.';

  @override
  String get vispSetupDialogCouldNotApplyPlan =>
      'Impossibile applicare quel piano.';

  @override
  String get vispSetupDialogTitleNew => 'Descrivi il tuo server a Visp';

  @override
  String get vispSetupDialogTitleExisting =>
      'Chiedi a Visp di aggiungere a questo server';

  @override
  String get vispSetupDialogDescriptionNew =>
      'Descrivi il server che desideri -- Visp proporrà un nome e un insieme di ruoli, categorie e canali.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Descrivi cosa vorresti aggiungere -- Visp proporrà ruoli, categorie e canali da creare.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'es. \"Un server accogliente per il mio gruppo di D&D con canali vocali per due tavoli\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'es. \"Aggiungi un paio di canali in più per i nostri team di raid\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      'La tua descrizione viene inviata a Visp (un assistente self-hosted -- nulla lascia i server di Koda) per generare questo piano.';

  @override
  String get vispSetupDialogStartOver => 'Ricomincia';

  @override
  String get vispSetupDialogCreateServer => 'Crea Server';

  @override
  String get vispSetupDialogAddToServer => 'Aggiungi al Server';

  @override
  String get vispSetupDialogThinking => 'Sto pensando...';

  @override
  String get vispSetupDialogGeneratePlan => 'Genera Piano';

  @override
  String get vispSetupDialogNewServerLabel => 'Nuovo server';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ruoli',
      one: '$count ruolo',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categorie',
      one: '$count categoria',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count canali',
      one: '$count canale',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'Basato su:';

  @override
  String get childLockoutTitle => 'È fuori dal tuo orario consentito';

  @override
  String get childLockoutBody =>
      'Un genitore o tutore ha impostato gli orari in cui questo account può usare Koda. Chiedigli più tempo, oppure ricontrolla durante la tua prossima finestra consentita.';

  @override
  String get childLockoutLogOutButton => 'Esci';

  @override
  String get forcePasswordChangeError =>
      'Impossibile aggiornare la password. Riprova.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Benvenuto/a, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Il tuo account richiede una nuova password prima che tu possa continuare.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'Nuova password';

  @override
  String get forcePasswordChangeConfirmPasswordHint =>
      'Conferma nuova password';

  @override
  String get forcePasswordChangeReqLength => 'Almeno 12 caratteri';

  @override
  String get forcePasswordChangeReqUpper => 'Una lettera maiuscola';

  @override
  String get forcePasswordChangeReqLower => 'Una lettera minuscola';

  @override
  String get forcePasswordChangeReqDigit => 'Un numero';

  @override
  String get forcePasswordChangeReqMatch => 'Le password corrispondono';

  @override
  String get forcePasswordChangeSubmitButton => 'Imposta Nuova Password';

  @override
  String get forgotPasswordEnterEmailError =>
      'Inserisci il tuo indirizzo email.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'Se quell\'account esiste, è stato inviato un codice di reimpostazione.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Inserisci il codice e una password di almeno 8 caratteri.';

  @override
  String get forgotPasswordInvalidCode => 'Codice non valido o scaduto.';

  @override
  String get forgotPasswordTitle => 'Reimposta password';

  @override
  String get forgotPasswordEmailHint => 'Indirizzo email';

  @override
  String get forgotPasswordSendCodeButton => 'Invia codice di reimpostazione';

  @override
  String get forgotPasswordCodeHint => 'Codice a 6 cifre';

  @override
  String get forgotPasswordNewPasswordHint => 'Nuova password';

  @override
  String get forgotPasswordSetNewPasswordButton => 'Imposta nuova password';

  @override
  String get verifyEmailEnterCodeError =>
      'Inserisci il codice a 6 cifre ricevuto via email.';

  @override
  String get verifyEmailInvalidCode => 'Codice non valido o scaduto.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'Un nuovo codice è stato inviato a $email.';
  }

  @override
  String get verifyEmailResendFailed =>
      'Impossibile reinviare in questo momento.';

  @override
  String get verifyEmailTitle => 'Controlla la tua email';

  @override
  String verifyEmailSentCode(String email) {
    return 'Abbiamo inviato un codice a 6 cifre a $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'Verifica Email';

  @override
  String get verifyEmailResendButton => 'Reinvia codice';

  @override
  String get safetyNumberKeysNotSetUp =>
      'Le tue chiavi non sono ancora state configurate.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName non ha ancora un pacchetto di chiavi.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'Impossibile calcolare il numero di sicurezza: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName non ha più quel dispositivo.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'Numero di Sicurezza con $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Confronta questo numero con $peerName tramite un altro canale -- di persona, una chiamata telefonica, ovunque tranne questa chat. Se corrisponde su entrambi i lati, stai parlando con chi pensi di star parlando.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName ha $count dispositivi, ciascuno con il proprio numero di sicurezza -- verificarne uno non copre gli altri.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Dispositivo $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Segna come Verificato';

  @override
  String get contentFiltersDescription =>
      'I server possono contrassegnare i canali con etichette di contenuto. Scegli come vuoi che si comportino i canali etichettati -- questa è una tua preferenza personale e non influisce mai su ciò che vedono gli altri.';

  @override
  String get contentFiltersLabelAdult => 'Contenuti per adulti';

  @override
  String get contentFiltersLabelSuggestive => 'Suggestivo';

  @override
  String get contentFiltersLabelGraphic => 'Contenuti grafici';

  @override
  String get contentFiltersLabelNudity => 'Nudità non sessuale';

  @override
  String get contentFiltersDescAdult => 'Contenuto sessualmente esplicito';

  @override
  String get contentFiltersDescSuggestive =>
      'Contenuto sessualmente suggestivo ma non esplicito';

  @override
  String get contentFiltersDescGraphic => 'Violenza o splatter';

  @override
  String get contentFiltersDescNudity => 'Nudità in un contesto non sessuale';

  @override
  String get contentFiltersHide => 'Nascondi';

  @override
  String get contentFiltersWarn => 'Avvisa';

  @override
  String get contentFiltersShow => 'Mostra';

  @override
  String get deviceTestCouldNotGetToken =>
      'Impossibile ottenere un token di test.';

  @override
  String get deviceTestLabelTest => 'Test';

  @override
  String get deviceTestLabelRecording => 'Registrazione...';

  @override
  String get deviceTestLabelPlayingBack => 'Riproduzione...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'Impossibile avviare la videocamera: $error';
  }

  @override
  String get deviceTestTitle => 'Testa Dispositivi';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'Impossibile connettersi: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Microfono';

  @override
  String get deviceTestHearYourselfLabel => 'Ascolta Te Stesso (Ritardato)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Altoparlante / Uscita';

  @override
  String get deviceTestCameraLabel => 'Videocamera';

  @override
  String get deviceTestSystemDefault => 'Predefinito di sistema';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Parla, poi ascolta la riproduzione di una clip di ${seconds}s';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '${seconds}s';
  }

  @override
  String get deviceTestCameraPreviewOff => 'Anteprima videocamera disattivata';

  @override
  String get deviceTestStopCameraButton => 'Interrompi Test Videocamera';

  @override
  String get deviceTestTestCameraButton => 'Testa Videocamera';

  @override
  String get deviceTestInputLevelLabel => 'Livello di ingresso';

  @override
  String get devicesScreenRemoveConfirmTitle => 'Rimuovere questo dispositivo?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'Dovrà accedere di nuovo, e i messaggi inviati durante la rimozione non lo raggiungeranno in seguito -- le sessioni Double Ratchet non colmano retroattivamente le lacune.';

  @override
  String get devicesScreenRemoveFailed =>
      'Impossibile rimuovere quel dispositivo.';

  @override
  String get devicesScreenNeverActive => 'Mai attivo';

  @override
  String devicesScreenActiveDate(String date) {
    return 'Attivo $date';
  }

  @override
  String get devicesScreenDescription =>
      'Ogni dispositivo con cui accedi ha la propria identità di crittografia -- un messaggio inviato a te raggiunge ciascuno dei dispositivi elencati sotto. Rimuovi quello che non usi o non riconosci.';

  @override
  String get devicesScreenNoDevicesFound => 'Nessun dispositivo trovato.';

  @override
  String get devicesScreenUnknownDevice => 'Dispositivo sconosciuto';

  @override
  String get devicesScreenThisDeviceBadge => 'Questo dispositivo';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Rimuovi dispositivo';

  @override
  String get totpSetupInvalidCode => 'Codice non valido. Riprova.';

  @override
  String get totpSetupEnabledMessage =>
      'L\'autenticazione a due fattori è attiva.';

  @override
  String get totpSetupScanInstructions =>
      'Scansiona questo codice segreto nella tua app di autenticazione (Google Authenticator, 1Password, Authy):';

  @override
  String get totpSetupCodeHint =>
      'Inserisci il codice a 6 cifre per confermare';

  @override
  String get totpSetupVerifyButton => 'Verifica e Attiva';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'Premi per Parlare';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'Premi un tasto qualsiasi per associarlo...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Testa Dispositivi';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Elaborazione Vocale';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle =>
      'Soppressione del Rumore';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Riduce il rumore di fondo del microfono';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Soppressione del Rumore Avanzata (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'Rimozione del rumore con IA in tempo reale, più efficace della soppressione standard -- la sostituisce quando attiva';

  @override
  String get voiceVideoSettingsEchoCancellationTitle =>
      'Cancellazione dell\'Eco';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Evita che il tuo audio produca un eco';

  @override
  String get voiceVideoSettingsAutoGainTitle =>
      'Controllo Automatico del Guadagno';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Bilancia automaticamente il volume del microfono (normalizzazione del volume)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'Attenuazione Automatica';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Abbassa il volume degli altri partecipanti mentre parli';

  @override
  String get voiceVideoSettingsHighPassTitle => 'Filtro Passa-Alto';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Taglia il rombo a bassa frequenza (ventole, aria condizionata, colpi sulla scrivania)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle =>
      'Rilevamento Rumore di Digitazione';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Sopprime il ticchettio della tastiera captato dal microfono';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Isolamento Vocale';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Si concentra sulla tua voce, filtrando altre persone e suoni nelle vicinanze';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Boost Microfono';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Abilita Boost';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Guadagno di preamplificazione per un microfono debole o distante -- applicato prima dell\'equalizzatore';

  @override
  String get voiceVideoSettingsBandBoost => 'Boost';

  @override
  String get voiceVideoSettingsSectionMicEq => 'Equalizzatore Microfono';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'Abilita Equalizzatore';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Modella il tuo microfono prima che raggiunga altre persone';

  @override
  String get voiceVideoSettingsBandBass => 'Bassi';

  @override
  String get voiceVideoSettingsBandMid => 'Medi';

  @override
  String get voiceVideoSettingsBandTreble => 'Alti';

  @override
  String get voiceVideoSettingsSectionVad =>
      'Rilevamento Attività Vocale (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'Abilita VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Trasmette solo quando stai effettivamente parlando';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Sensibilità';

  @override
  String get voiceVideoSettingsVadHint =>
      'Più basso = capta suoni più deboli. Più alto = solo un parlato più forte attiva la trasmissione.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Tasto associato';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'Non impostato — il microfono resta attivo finché non è disattivato';

  @override
  String get voiceVideoSettingsClearButton => 'Cancella';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Imposta Tasto';

  @override
  String get voiceVideoSettingsChangeButton => 'Cambia';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'Quando un tasto è associato, il microfono trasmette solo mentre tieni premuto quel tasto. Questo ha priorità sul VOX mentre sei in un canale vocale.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Modello Reattivo di Avatar Virtuale';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Carica due immagini che si alternano quando parli. Visibile solo a te.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'Silenzioso';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'Parlando';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel =>
      'Soglia di conversazione';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Più basso = passa più facilmente all\'immagine di parlato.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'Rimuovi VARM';

  @override
  String get gifPickerNoGifsFound => 'Nessuna GIF trovata';

  @override
  String get gifPickerSearchHint => 'Cerca GIF...';

  @override
  String get messageSearchHint => 'Cerca in questo canale...';

  @override
  String get messageSearchTooltip => 'Cerca';

  @override
  String get messageSearchInitialHint =>
      'Cerca tra i messaggi già caricati su questo dispositivo -- la cronologia meno recente viene recuperata (e decrittata localmente) man mano che scorri indietro.';

  @override
  String get messageSearchNoMatches => 'Nessun risultato';

  @override
  String get messageSearchStartOfHistory =>
      'Inizio della cronologia del canale';

  @override
  String get messageSearchFurtherBackButton => 'Cerca più indietro';

  @override
  String get messageSearchUnknownAuthor => 'Sconosciuto';
}
