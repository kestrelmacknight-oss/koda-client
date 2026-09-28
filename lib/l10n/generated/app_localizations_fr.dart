// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonCreate => 'Créer';

  @override
  String get commonClose => 'Fermer';

  @override
  String get commonDone => 'Terminé';

  @override
  String get commonDownload => 'Télécharger';

  @override
  String get commonDisconnect => 'Déconnecter';

  @override
  String get commonNone => 'Aucun';

  @override
  String get commonJoin => 'Rejoindre';

  @override
  String get commonDismiss => 'Ignorer';

  @override
  String get commonSubmit => 'Envoyer';

  @override
  String get commonConfirm => 'Confirmer';

  @override
  String get commonRemove => 'Retirer';

  @override
  String get commonRetry => 'Réessayer';

  @override
  String get commonOk => 'OK';

  @override
  String get commonYes => 'Oui';

  @override
  String get commonNo => 'Non';

  @override
  String get commonSearch => 'Rechercher';

  @override
  String get commonSettings => 'Paramètres';

  @override
  String get commonLoading => 'Chargement...';

  @override
  String get settingsLanguageSection => 'Langue';

  @override
  String get settingsLanguageTitle => 'Langue de l\'application';

  @override
  String get settingsLanguageSystemDefault => 'Par défaut du système';

  @override
  String get settingsLanguageDescription =>
      'Choisissez la langue d\'affichage de l\'interface de Koda. Ceci est indépendant de la langue principale d\'un serveur ou de la langue dans laquelle vous écrivez vos messages.';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsSignOut => 'Se déconnecter';

  @override
  String get settingsSectionMyAccount => 'Mon compte';

  @override
  String get settingsSectionSecurity => 'Sécurité';

  @override
  String get settingsSectionAccessibility => 'Accessibilité';

  @override
  String get settingsSectionBilling => 'Facturation';

  @override
  String get settingsSectionFamily => 'Famille';

  @override
  String get settingsSectionVoiceVideo => 'Voix et vidéo';

  @override
  String get settingsSectionDesktop => 'Bureau';

  @override
  String get settingsSectionAbout => 'À propos';

  @override
  String get settingsTwoFactorTitle => 'Authentification à deux facteurs';

  @override
  String get settingsTwoFactorSubtitle =>
      'Ajoutez une application d\'authentification pour plus de sécurité';

  @override
  String get settingsLinkedDevicesTitle => 'Appareils liés';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'Voir et retirer les appareils connectés à ce compte';

  @override
  String get settingsContentFiltersTitle => 'Filtres de contenu';

  @override
  String get settingsContentFiltersSubtitle =>
      'Choisissez comment le contenu étiqueté doit s\'afficher';

  @override
  String get settingsDmFriendsOnlyTitle => 'N\'autoriser les DM que des amis';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Les personnes qui ne sont pas vos amis ne peuvent pas démarrer de conversation avec vous';

  @override
  String get settingsDmPrivacyError =>
      'Impossible de mettre à jour la confidentialité des DM.';

  @override
  String get settingsShowVispAvatarTitle => 'Afficher l\'avatar de Visp';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Affiche le visage et l\'humeur de Visp dans ses boîtes de dialogue de configuration, d\'événement et de conseil';

  @override
  String get settingsHighContrastTitle => 'Contraste élevé';

  @override
  String get settingsHighContrastSubtitle =>
      'Couleurs noir et blanc pur à contraste élevé dans toute l\'application -- le changement recharge brièvement l\'écran actuel.';

  @override
  String get settingsDyslexiaFontTitle => 'Police adaptée à la dyslexie';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Bascule le texte principal vers OpenDyslexic dans toute l\'application';

  @override
  String get settingsFontSizeTitle => 'Taille de police';

  @override
  String get settingsFontSizeSample =>
      'Portez ce vieux whisky au juge blond qui fume';

  @override
  String get settingsDensityTitle => 'Densité';

  @override
  String get settingsDensityDescription =>
      'Affecte l\'espacement des contrôles standards -- boutons, interrupteurs, boîtes de dialogue -- mais pas toutes les mises en page personnalisées.';

  @override
  String get settingsDensityCompact => 'Compacte';

  @override
  String get settingsDensityStandard => 'Standard';

  @override
  String get settingsDensityComfortable => 'Confortable';

  @override
  String get settingsStreamingTitle => 'Comptes de streaming';

  @override
  String get settingsStreamingDescription =>
      'Connectez Twitch/YouTube pour que les serveurs où vous avez la permission \"Annoncer en direct\" puissent publier automatiquement quand vous êtes en direct ou publiez une nouvelle vidéo.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform connecté en tant que $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform non connecté';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- en direct maintenant';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- nouvelle publication';

  @override
  String get settingsStreamingConnecting => 'Connexion...';

  @override
  String get settingsStreamingConnect => 'Connecter';

  @override
  String get settingsAnnounceLiveTwitch => 'Annoncer quand je suis en direct';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Annoncer les diffusions en direct et les nouvelles publications';

  @override
  String get settingsRefreshStatus =>
      'Déjà connecté depuis votre navigateur ? Actualisez le statut';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'Impossible de démarrer la connexion à $platform.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Terminez la connexion dans votre navigateur, puis revenez et actualisez.';

  @override
  String get settingsThroneTitle => 'Webhook Throne';

  @override
  String get settingsThroneDescription =>
      'Collez cette URL dans les paramètres de webhook de Throne.com pour être averti dans Koda chaque fois que quelqu\'un vous envoie un cadeau.';

  @override
  String get settingsThroneGetUrl => 'Obtenir mon URL de webhook';

  @override
  String get settingsThroneCopyTooltip => 'Copier';

  @override
  String get settingsThroneCopiedToast => 'Copié dans le presse-papiers';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Régénérer (invalide l\'ancienne URL)';

  @override
  String get settingsThroneRegenerateConfirmTitle =>
      'Régénérer l\'URL du webhook ?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'Votre ancienne URL cessera de fonctionner, pensez à la mettre à jour sur Throne.com ensuite.';

  @override
  String get settingsThroneRegenerate => 'Régénérer';

  @override
  String get settingsUploadPhoto => 'Importer une photo';

  @override
  String get settingsOrPasteUrl => 'ou collez une URL ci-dessous';

  @override
  String get settingsAvatarUrlHint => 'https://exemple.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'L\'import d\'image nécessite Cloudflare R2 — coller une URL fonctionne toujours.';

  @override
  String get settingsDisplayNameLabel => 'NOM D\'AFFICHAGE';

  @override
  String get settingsDisplayNameHint => 'Nom d\'affichage';

  @override
  String get settingsBioLabel => 'BIOGRAPHIE';

  @override
  String get settingsBioHint => 'Parlez un peu de vous';

  @override
  String get settingsPronounsLabel => 'PRONOMS';

  @override
  String get settingsPronounsHint => 'p. ex. iel';

  @override
  String get settingsShowPronounsTitle => 'Afficher mes pronoms aux autres';

  @override
  String get settingsShowPronounsSubtitle =>
      'Affichés à côté de votre nom dans le chat, les listes de membres et la voix';

  @override
  String get settingsStatusLabel => 'STATUT';

  @override
  String get statusOnline => 'En ligne';

  @override
  String get statusAway => 'Absent';

  @override
  String get statusDnd => 'Ne pas déranger';

  @override
  String get statusInvisible => 'Invisible';

  @override
  String get settingsFamilyNotAvailable =>
      'Les contrôles parentaux ne sont pas disponibles sur un compte supervisé.';

  @override
  String get settingsAboutTitle => 'À propos de Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Conditions d\'utilisation';

  @override
  String get settingsPrivacyTitle => 'Politique de confidentialité';

  @override
  String get settingsSupportTitle => 'Assistance';

  @override
  String get settingsReportSecurityTitle => 'Signaler un problème de sécurité';

  @override
  String get settingsDesktopNotAvailable =>
      'Ce sont des paramètres réservés au bureau -- il n\'y a pas de fenêtre ni de zone de notification sur cette plateforme.';

  @override
  String get settingsCloseToTrayTitle => 'Réduire dans la zone de notification';

  @override
  String get settingsCloseToTraySubtitle =>
      'Fermer la fenêtre laisse Koda fonctionner en arrière-plan pour continuer à recevoir des notifications -- désactivez ceci pour que fermer la fenêtre quitte réellement l\'application.';

  @override
  String get authErrorEmailPasswordRequired =>
      'L\'adresse e-mail et le mot de passe sont requis.';

  @override
  String get authErrorIncorrectCredentials =>
      'Adresse e-mail ou mot de passe incorrect.';

  @override
  String get authErrorMustAcceptTerms =>
      'Veuillez accepter les Conditions d\'utilisation.';

  @override
  String get authErrorAllFieldsRequired => 'Tous les champs sont obligatoires.';

  @override
  String get authErrorPasswordsDontMatch =>
      'Les mots de passe ne correspondent pas.';

  @override
  String get authErrorPasswordTooShort =>
      'Le mot de passe doit contenir au moins 8 caractères.';

  @override
  String get authErrorRegistrationFailed =>
      'L\'inscription a échoué. Cette adresse e-mail est peut-être déjà utilisée.';

  @override
  String get authTabSignIn => 'Connexion';

  @override
  String get authTabCreateAccount => 'Créer un compte';

  @override
  String get authAgreementPrefix => 'En utilisant Koda, vous acceptez nos ';

  @override
  String get authTermsLink => 'Conditions d\'utilisation';

  @override
  String get authAgreementMiddle => ' et notre ';

  @override
  String get authPrivacyLink => 'Politique de confidentialité';

  @override
  String get authAgreementSuffix => '.';

  @override
  String get authEmailHint => 'Adresse e-mail';

  @override
  String get authPasswordHint => 'Mot de passe';

  @override
  String get authForgotPassword => 'Mot de passe oublié ?';

  @override
  String get authSignInButton => 'Connexion';

  @override
  String get authUsernameHint => 'Nom d\'utilisateur';

  @override
  String get authConfirmPasswordHint => 'Confirmer le mot de passe';

  @override
  String get authAgreeToTerms =>
      'J\'accepte les Conditions d\'utilisation et la Politique de confidentialité';

  @override
  String get authCreateAccountButton => 'Créer un compte';

  @override
  String get dmSafetyNumberChangedWarning =>
      'Le numéro de sécurité de cette conversation a changé -- vérifiez-le avant d\'envoyer.';

  @override
  String get dmMessageNotSent => 'Message non envoyé.';

  @override
  String dmEncryptMessageError(String error) {
    return 'Impossible de chiffrer le message : $error';
  }

  @override
  String get dmAttachmentUploadFailed =>
      'Échec de l\'envoi de la pièce jointe.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'Impossible de chiffrer la pièce jointe : $error';
  }

  @override
  String get dmReportMessage => 'Signaler le message';

  @override
  String get dmReportSubmitted => 'Signalement envoyé.';

  @override
  String get dmTitle => 'Messages';

  @override
  String get dmNewMessage => 'Nouveau message';

  @override
  String get dmNoConversationsYet => 'Aucune conversation pour le moment';

  @override
  String get dmSelectConversation => 'Sélectionnez une conversation';

  @override
  String get dmVerifySafetyNumberTooltip => 'Vérifier le numéro de sécurité';

  @override
  String get dmSeenLabel => 'Vu';

  @override
  String get dmMessageActionsTooltip => 'Actions du message';

  @override
  String get dmRemoveAttachmentTooltip => 'Retirer la pièce jointe';

  @override
  String get dmAttachFileTooltip => 'Joindre un fichier';

  @override
  String get dmMessageHint => 'Message...';

  @override
  String get dmSendMessageTooltip => 'Envoyer le message';

  @override
  String get dmNoFriendsYet =>
      'Aucun ami pour le moment.\nEnvoyez une demande d\'ami pour commencer.';

  @override
  String get dmUnfriendTooltip => 'Retirer des amis';

  @override
  String get dmNoPendingRequests => 'Aucune demande d\'ami en attente.';

  @override
  String get dmIncomingRequestsLabel => 'REÇUES';

  @override
  String get dmSentRequestsLabel => 'ENVOYÉES';

  @override
  String get dmAcceptTooltip => 'Accepter';

  @override
  String get dmDeclineTooltip => 'Refuser';

  @override
  String get dmPendingLabel => 'En attente';

  @override
  String get dmNewMessageDialogTitle => 'Nouveau message';

  @override
  String get dmEnterUsernameHint => 'Entrez un nom d\'utilisateur';

  @override
  String get dmOpenButton => 'Ouvrir';

  @override
  String dmSavedAttachment(String fileName) {
    return '$fileName enregistré';
  }

  @override
  String get dmUnknownUser => 'Inconnu';

  @override
  String get dmEndToEndEncryptedTooltip => 'Chiffré de bout en bout';

  @override
  String get homeContentWarningTitle => 'Avertissement de contenu';

  @override
  String homeContentWarningBody(String labels) {
    return 'Ce salon est signalé pour : $labels.\n\nModifiez ceci dans Paramètres > Sécurité > Filtres de contenu.';
  }

  @override
  String get homeViewAnyway => 'Voir quand même';

  @override
  String get homeCouldNotConnectVoice =>
      'Impossible de se connecter à la voix.';

  @override
  String get homeCreateServer => 'Créer un serveur';

  @override
  String get homeJoinServer => 'Rejoindre un serveur';

  @override
  String get homeRedeemCode => 'Utiliser un code';

  @override
  String get homeJoinServerDialogTitle => 'Rejoindre un serveur';

  @override
  String get homeEnterInviteCode => 'Entrez un code ou une URL d\'invitation :';

  @override
  String get homeInviteCodeHint => 'p. ex. XK9MP2';

  @override
  String get homeJoined => 'Rejoint !';

  @override
  String get homeInvalidInvite => 'Code d\'invitation invalide ou expiré.';

  @override
  String get homeJoinButton => 'Rejoindre';

  @override
  String get homeRedeemCodeDialogTitle => 'Utiliser un code';

  @override
  String get homeEnterBackerCode =>
      'Entrez votre code de contributeur ou de récompense :';

  @override
  String get homeRewardCodeHint => 'Code de récompense';

  @override
  String get homeCodeRedeemed =>
      'Code utilisé ! Vos récompenses ont été appliquées.';

  @override
  String get homeInvalidRedeemCode => 'Code invalide, expiré ou déjà utilisé.';

  @override
  String get homeRedeemButton => 'Utiliser';

  @override
  String get homeAreFriends => 'Vous êtes amis';

  @override
  String get homeAddFriend => 'Ajouter en ami';

  @override
  String homeFriendRequestSent(String username) {
    return 'Demande d\'ami envoyée à $username !';
  }

  @override
  String get homeMessageButton => 'Message';

  @override
  String get homeSendTip => 'Envoyer un pourboire';

  @override
  String get homeSwitchToServer => 'Passer à ce serveur';

  @override
  String get homeInvitePeople => 'Inviter des personnes';

  @override
  String get homeServerSettingsMenuItem => 'Paramètres du serveur';

  @override
  String get homeLeaveServerMenuItem => 'Quitter le serveur';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return 'Quitter $serverName ? Vous pourrez le rejoindre à nouveau avec une invitation.';
  }

  @override
  String get homeLeaveButton => 'Quitter';

  @override
  String get homeCreateAServer => 'Créer un serveur';

  @override
  String get homeServerNameHint => 'Nom du serveur';

  @override
  String get homeDescribeToVisp => 'Le décrire à Visp à la place';

  @override
  String get homeMarkAsRead => 'Marquer comme lu';

  @override
  String get homeEditChannel => 'Modifier le salon';

  @override
  String get homeDeleteChannel => 'Supprimer le salon';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return 'Supprimer #$channelName ? Cette action est irréversible.';
  }

  @override
  String get homeDeleteButton => 'Supprimer';

  @override
  String get homeCreateChannelHere => 'Créer un salon ici';

  @override
  String get homeEditCategory => 'Modifier la catégorie';

  @override
  String get homeDeleteCategory => 'Supprimer la catégorie';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return 'Supprimer \"$categoryName\" ? Les salons qu\'elle contient deviendront sans catégorie.';
  }

  @override
  String get homeReplyAction => 'Répondre';

  @override
  String get homeCreateThreadAction => 'Créer un fil de discussion';

  @override
  String get homeEditMessageAction => 'Modifier le message';

  @override
  String get homeDeleteMessageAction => 'Supprimer le message';

  @override
  String get homePinMessageAction => 'Épingler le message';

  @override
  String get homeUnpinMessageAction => 'Désépingler le message';

  @override
  String get homeReportMessageAction => 'Signaler le message';

  @override
  String get homeReportSubmitted => 'Signalement envoyé.';

  @override
  String get homeAddReactionTitle => 'Ajouter une réaction';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fils de discussion',
      one: '$count fil de discussion',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'Options de la catégorie';

  @override
  String get homeChannelOptionsTooltip => 'Options du salon';

  @override
  String get homeOpenVoiceChatTooltip => 'Ouvrir le chat';

  @override
  String get homeMarketplaceLabel => 'Place de marché';

  @override
  String get homeSelectChannelPrompt => 'Sélectionnez un salon';

  @override
  String get homeSearchTooltip => 'Rechercher';

  @override
  String get homePinnedMessagesTooltip => 'Messages épinglés';

  @override
  String get homeWaitingForKey => 'En attente de la clé de chiffrement...';

  @override
  String get homeUnableToDecrypt => 'Impossible de déchiffrer ce message.';

  @override
  String get homeMessageActionsTooltip => 'Actions du message';

  @override
  String get homeCancelReplyTooltip => 'Annuler la réponse';

  @override
  String get homeRemoveAttachmentTooltip => 'Retirer la pièce jointe';

  @override
  String get homeAttachFileTooltip => 'Joindre un fichier';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'Message #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'Envoyer le message';

  @override
  String get homeEditMessageTitle => 'Modifier le message';

  @override
  String get homeMessageLabel => 'Message';

  @override
  String get homePinnedMessagesTitle => 'Messages épinglés';

  @override
  String get homeNoPinnedMessages => 'Aucun message épinglé';

  @override
  String get homeUnpinTooltip => 'Désépingler';

  @override
  String get homeCreateThreadTitle => 'Créer un fil de discussion';

  @override
  String get homeThreadNameHint => 'Nom du fil de discussion';

  @override
  String homeThreadCreated(String name) {
    return 'Fil de discussion \"$name\" créé !';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Créer ou rejoindre';

  @override
  String get homeKodaMarketplaceTooltip => 'Place de marché Koda';

  @override
  String get homeAdminPanelTooltip => 'Panneau d\'administration';

  @override
  String get homeServerSettingsTooltip => 'Paramètres du serveur';

  @override
  String get homeSettingsTooltip => 'Paramètres';

  @override
  String get homeContentWarningBadge => 'Avertissement de contenu';

  @override
  String get homeDirectMessagesTooltip => 'Messages directs';

  @override
  String homeReplyingTo(String username) {
    return 'Réponse à $username';
  }

  @override
  String get homeAttachmentFallback => 'Pièce jointe';

  @override
  String serverConnectError(String service) {
    return 'Impossible de démarrer la connexion à $service.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Déconnecter Printful ?';

  @override
  String get serverDisconnectPrintfulBody =>
      'Ce serveur ne pourra plus traiter les commandes de produits dérivés tant qu\'il ne sera pas reconnecté.';

  @override
  String get serverDisconnectTiltifyTitle => 'Déconnecter Tiltify ?';

  @override
  String get serverDisconnectTiltifyBody =>
      'Ce serveur cessera d\'afficher la progression de sa campagne caritative tant qu\'il ne sera pas reconnecté.';

  @override
  String get serverNewRoleTitle => 'Nouveau rôle';

  @override
  String get serverEditRoleTitle => 'Modifier le rôle';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Couleur $hex';
  }

  @override
  String get permViewChannels => 'Voir les salons';

  @override
  String get permSendMessages => 'Envoyer des messages';

  @override
  String get permConnectVoice => 'Se connecter à la voix';

  @override
  String get permManageServer => 'Gérer le serveur';

  @override
  String get permManageChannels => 'Gérer les salons';

  @override
  String get permManageRoles => 'Gérer les rôles';

  @override
  String get permManageMessages => 'Gérer les messages';

  @override
  String get permKickMembers => 'Expulser des membres';

  @override
  String get permBanMembers => 'Bannir des membres';

  @override
  String get permMuteMembers => 'Rendre muets des membres';

  @override
  String get permMentionEveryone => 'Mentionner @everyone';

  @override
  String get permManageMarketplace => 'Gérer la place de marché';

  @override
  String get permAnnounceLive => 'Annoncer en direct';

  @override
  String get permMoveMembers => 'Déplacer les membres (voix)';

  @override
  String get serverRoleNameHint => 'Nom du rôle';

  @override
  String get serverColorLabel => 'Couleur';

  @override
  String get serverPermissionsLabel => 'Permissions';

  @override
  String get serverSelfAssignableTitle => 'Auto-attribuable';

  @override
  String get serverSelfAssignableSubtitle =>
      'Les membres peuvent s\'attribuer ce rôle eux-mêmes';

  @override
  String get serverDefaultRoleUndeletable =>
      'Le rôle par défaut ne peut pas être supprimé.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'Supprimer le rôle \"$roleName\" ?';
  }

  @override
  String get serverCouldNotDeleteRole => 'Impossible de supprimer ce rôle.';

  @override
  String get serverMemberFallback => 'Membre';

  @override
  String get serverNoRolesYet => 'Aucun rôle pour le moment.';

  @override
  String get serverRefreshStatus =>
      'Déjà connecté depuis votre navigateur ? Actualisez le statut';

  @override
  String get serverPrintfulConnected => 'Printful connecté';

  @override
  String get serverPrintfulNotConnected => 'Printful non connecté';

  @override
  String get serverPrintfulDescription =>
      'Connectez le compte Printful de ce serveur pour traiter les commandes de produits dérivés passées via Koda. Chaque serveur connecte sa propre boutique.';

  @override
  String get serverConnecting => 'Connexion...';

  @override
  String get serverConnectPrintful => 'Connecter Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify connecté';

  @override
  String get serverTiltifyNotConnected => 'Tiltify non connecté';

  @override
  String get serverTiltifyDescription =>
      'Connectez le compte Tiltify de ce serveur pour afficher en direct la progression d\'une campagne caritative à tous les membres. Lecture seule -- Koda ne publie ni ne modifie jamais rien du côté de Tiltify.';

  @override
  String get serverConnectTiltify => 'Connecter Tiltify';

  @override
  String get serverNoTiltifyCampaigns =>
      'Aucune campagne trouvée sur ce compte Tiltify.';

  @override
  String get serverPickCampaign => 'Choisissez la campagne à afficher';

  @override
  String get serverUntitledCampaign => 'Campagne sans titre';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '$currency $raised récoltés sur un objectif de $goal';
  }

  @override
  String get serverViewCampaign => 'Voir la campagne';

  @override
  String get serverRefreshButton => 'Actualiser';

  @override
  String get serverUploadButton => 'Importer';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '$used / $limit emplacements utilisés -- niveau de boost $level';
  }

  @override
  String get serverNoCustomEmoji => 'Aucun emoji personnalisé pour le moment.';

  @override
  String get serverDeleteEmojiTooltip => 'Supprimer l\'emoji';

  @override
  String get serverUploadEmojiTitle => 'Importer un emoji';

  @override
  String get serverEmojiNameHint => 'nom (lettres, chiffres, _)';

  @override
  String get serverChooseImage => 'Choisir une image';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Niveau de boost actuel : $level';
  }

  @override
  String get serverBackgroundTitle => 'Arrière-plan du serveur';

  @override
  String get serverBackgroundDescription =>
      'Un arrière-plan personnalisé affiché derrière la vue des salons pour tous les membres de ce serveur.';

  @override
  String get serverBackgroundLockedHint =>
      'Atteignez le niveau de boost 4 pour débloquer un arrière-plan personnalisé.';

  @override
  String get serverIconBorderTitle => 'Bordure de l\'icône du serveur';

  @override
  String get serverIconBorderDescription =>
      'Une bordure d\'accent autour de l\'icône de ce serveur dans la liste de serveurs de chaque membre.';

  @override
  String get serverIconBorderLockedHint =>
      'Atteignez le niveau de boost 5 pour débloquer une bordure d\'icône personnalisée.';

  @override
  String get serverBoostFromBank =>
      'Boostez ce serveur depuis la Banque du serveur dans la place de marché pour augmenter son niveau.';

  @override
  String get serverMarketplaceListingLabel =>
      'RÉFÉRENCEMENT SUR LA PLACE DE MARCHÉ';

  @override
  String get serverListInMarketplace =>
      'Référencer sur la place de marché Koda';

  @override
  String get serverListInMarketplaceDescription =>
      'Inclut ce serveur dans l\'onglet Découvrir de la plateforme, avec une chance d\'apparaître dans la rotation hebdomadaire des serveurs mis en avant. Indépendant de la découverte générale pour rejoindre le serveur.';

  @override
  String get serverSocialLinkLabel =>
      'Lien social / d\'invitation (facultatif)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Enregistrer le lien';

  @override
  String get serverPricingLabel => 'TARIFICATION';

  @override
  String get serverPrimaryCurrencyLabel => 'Devise principale';

  @override
  String get serverPrimaryCurrencyDescription =>
      'S\'applique aux niveaux d\'abonnement du serveur et aux prix des biens numériques que vous définissez pour ce serveur.';

  @override
  String get serverPrimaryLanguageLabel => 'Langue principale';

  @override
  String get serverPrimaryLanguageDescription =>
      'Les messages que les membres publient dans une autre langue reçoivent un petit badge de langue, comparé à ce paramètre.';

  @override
  String get serverMarketplaceLinkSaved =>
      'Lien de la place de marché enregistré.';

  @override
  String get serverIconUpdated => 'Icône du serveur mise à jour !';

  @override
  String get serverTemplateImported => 'Modèle importé !';

  @override
  String get serverImportFromDiscord => 'Importer depuis Discord';

  @override
  String get serverVispPlanLive => 'Le plan de Visp est prêt !';

  @override
  String get serverAskVisp => 'Demander à Visp';

  @override
  String get serverAddCategoryButton => 'Ajouter une catégorie';

  @override
  String get serverAddChannelHereTooltip => 'Ajouter un salon ici';

  @override
  String get serverRename => 'Renommer';

  @override
  String get serverUncategorized => 'SANS CATÉGORIE';

  @override
  String get serverAddChannel => 'Ajouter un salon';

  @override
  String get serverEditRulesContent => 'Modifier le contenu du règlement';

  @override
  String get serverRulesContentHint =>
      'Écrivez ici le règlement de votre serveur...';

  @override
  String get serverRulesUpdated => 'Règlement mis à jour !';

  @override
  String get serverAddRole => 'Ajouter un rôle';

  @override
  String get serverDefaultRoleLabel => 'Rôle par défaut';

  @override
  String get serverManageRolesTooltip => 'Gérer les rôles';

  @override
  String get serverMutedLabel => 'Muet';

  @override
  String get serverExpandedLabel => 'développé';

  @override
  String get serverCollapsedLabel => 'réduit';

  @override
  String get serverUnmute => 'Réactiver le son';

  @override
  String get serverMute => 'Rendre muet';

  @override
  String get serverKick => 'Expulser';

  @override
  String get serverBan => 'Bannir';

  @override
  String serverBannedUsersLabel(int count) {
    return 'UTILISATEURS BANNIS — $count';
  }

  @override
  String get serverNoBannedUsers => 'Aucun utilisateur banni.';

  @override
  String get serverUnban => 'Débannir';

  @override
  String get serverMemberFallbackGeneric => 'ce membre';

  @override
  String serverBanConfirm(String username, String serverName) {
    return 'Bannir $username de $serverName ? Cette personne ne pourra pas revenir sans être débannie.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return 'Expulser $username de $serverName ? Cette personne pourra revenir avec une invitation.';
  }

  @override
  String get serverMuteDuration60Sec => '60 secondes';

  @override
  String get serverMuteDuration5Min => '5 minutes';

  @override
  String get serverMuteDuration10Min => '10 minutes';

  @override
  String get serverMuteDuration1Hour => '1 heure';

  @override
  String get serverMuteDuration1Day => '1 jour';

  @override
  String get serverMuteDuration1Week => '1 semaine';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'Impossible de $action $username.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return 'Rendre $username muet';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'Impossible de rendre $username muet.';
  }

  @override
  String get serverUnlockInvites => 'Débloquer les invitations';

  @override
  String get serverInvitesUnlocked => 'Invitations débloquées.';

  @override
  String get serverAuditLogDescription =>
      'Activité de modération de niveau 1 -- expulsions, bannissements, mises en sourdine et protection automatique contre le flood/les raids. Métadonnées uniquement ; jamais le contenu des messages.';

  @override
  String get serverSystemActor => 'Système';

  @override
  String get serverActionKicked => 'a expulsé';

  @override
  String get serverActionBanned => 'a banni';

  @override
  String get serverActionUnbanned => 'a débanni';

  @override
  String get serverActionMuted => 'a rendu muet';

  @override
  String get serverActionUnmuted => 'a réactivé le son de';

  @override
  String get serverActionFloodDetected =>
      'mis en sourdine automatiquement pour flood';

  @override
  String get serverActionRaidLockdownEnabled =>
      'a verrouillé les invitations (protection anti-raid)';

  @override
  String get serverActionRaidLockdownDisabled =>
      'a déverrouillé les invitations';

  @override
  String get serverActionMoved => 'a déplacé';

  @override
  String get serverUnknownAction => 'action inconnue';

  @override
  String get serverNoModerationActivity =>
      'Aucune activité de modération pour le moment.';

  @override
  String get serverReportsDescription =>
      'Messages signalés par des membres de ce serveur -- la propre copie déjà déchiffrée du signaleur, divulguée en signalant.';

  @override
  String get serverNoPendingReports => 'Aucun signalement en attente.';

  @override
  String get serverReportReasonOther => 'autre';

  @override
  String get serverReportStatusActioned => 'Traité';

  @override
  String get serverReportStatusDismissed => 'Rejeté';

  @override
  String get serverResolvedLabel => 'TRAITÉS';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'Signalé par $reporter -- envoyé par $target';
  }

  @override
  String serverReportNote(String note) {
    return 'Note : $note';
  }

  @override
  String get serverDismissButton => 'Rejeter';

  @override
  String get serverMarkActioned => 'Marquer comme traité';

  @override
  String get serverCreateInvite => 'Créer une invitation';

  @override
  String get serverInviteCreatedTitle => 'Invitation créée';

  @override
  String get serverNoActiveInvites => 'Aucune invitation active';

  @override
  String serverUsesLabel(String uses) {
    return 'Utilisations : $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Supprimer l\'invitation';

  @override
  String get serverChangeIconLabel => 'Changer l\'icône du serveur';

  @override
  String get serverFallbackName => 'Serveur';

  @override
  String serverSettingsTitle(String serverName) {
    return 'Paramètres de $serverName';
  }

  @override
  String get serverTabChannels => 'Salons';

  @override
  String get serverTabRoles => 'Rôles';

  @override
  String get serverTabMembers => 'Membres';

  @override
  String get serverTabInvites => 'Invitations';

  @override
  String get serverTabMerch => 'Produits dérivés';

  @override
  String get serverTabEmoji => 'Emojis';

  @override
  String get serverTabCustomize => 'Personnaliser';

  @override
  String get serverTabAuditLog => 'Registre d\'audit';

  @override
  String get serverTabReports => 'Signalements';

  @override
  String get serverTabThresholdMod => 'Modération par seuil';

  @override
  String get serverTabCharity => 'Charité';

  @override
  String get homeCustomEmojiFallback => 'emoji personnalisé';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count réactions',
      one: '$count réaction',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted =>
      ', vous avez réagi, activer pour retirer';

  @override
  String get homeReactionActivateToAdd => ', activer pour ajouter';

  @override
  String get homeAddReactionLabel => 'Ajouter une réaction';

  @override
  String homeViewProfile(String username) {
    return 'Voir le profil de $username';
  }

  @override
  String get homeMoveToVoiceChannel => 'Déplacer vers un salon vocal…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Choisissez un salon vocal';

  @override
  String get homeNoOtherVoiceChannels => 'Aucun autre salon vocal';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username est maintenant dans $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'Impossible de déplacer $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'Vous êtes maintenant dans $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'Rejoignez $channel pour parler';
  }

  @override
  String get adminPanelTitle => 'Panneau d\'administration';

  @override
  String get adminTabBackerCodes => 'Codes de soutien';

  @override
  String get adminTabUsers => 'Utilisateurs';

  @override
  String get adminTabDmReports => 'Signalements MP';

  @override
  String get adminTabSpamFlags => 'Signalements de spam';

  @override
  String get adminTabWiki => 'Wiki';

  @override
  String get adminTabBoosts => 'Boosts';

  @override
  String get adminCreateBackerCodeTitle => 'Créer un code de soutien';

  @override
  String get adminCodeHint =>
      'Code (laisser vide pour générer automatiquement)';

  @override
  String get adminNoteHint => 'Note (p. ex. \"Kickstarter Palier 2\")';

  @override
  String get adminFlagsJsonHint =>
      'Indicateurs au format JSON, p. ex. \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint =>
      'Utilisations maximales (laisser vide = illimité)';

  @override
  String get adminCodeCreatedTitle => 'Code créé';

  @override
  String get adminCodeLabel => 'Code :';

  @override
  String get adminCopyCodeTooltip => 'Copier le code';

  @override
  String adminFlagsValue(String flags) {
    return 'Indicateurs : $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Codes de soutien et de récompense';

  @override
  String get adminNewCodeButton => 'Nouveau code';

  @override
  String get adminNoCodesYet => 'Aucun code pour l\'instant';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses utilisations';
  }

  @override
  String get adminSearchUsersHint =>
      'Rechercher des utilisateurs par nom d\'utilisateur...';

  @override
  String get adminSearchUsersPrompt => 'Recherchez un utilisateur ci-dessus';

  @override
  String get adminNoDmReports => 'Aucun signalement de MP.';

  @override
  String get adminResolvedLabel => 'RÉSOLU';

  @override
  String get adminReasonOther => 'autre';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Signaleur : $reporterId\nExpéditeur révélé : $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Note : $note';
  }

  @override
  String get adminDismissButton => 'Ignorer';

  @override
  String get adminMarkActionedButton => 'Marquer comme traité';

  @override
  String get adminStatusActioned => 'Traité';

  @override
  String get adminStatusDismissed => 'Ignoré';

  @override
  String get adminNoSpamFlags => 'Aucun signalement de spam.';

  @override
  String get adminFlagMassDmSpam => 'Spam de MP en masse';

  @override
  String get adminFlagRaidLockdown => 'Verrouillage anti-raid';

  @override
  String get adminFlagBotBehavior => 'Comportement de type bot';

  @override
  String get adminFlagChannelFlooding => 'Inondation de salon';

  @override
  String get adminAutoEscalatedBadge => 'ESCALADE AUTOMATIQUE';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Confiance : $score % ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'Utilisateur : $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Serveur : $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount sur $totalJoiners nouveaux arrivants encore réduits au silence';
  }

  @override
  String get adminNoJoinersMuted =>
      'Aucun nouvel arrivant actuellement réduit au silence';

  @override
  String adminRestrictedUntil(String until) {
    return 'Actuellement restreint jusqu\'à $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'Pas de restriction actuellement';

  @override
  String get adminDismissUndoButton => 'Ignorer et annuler';

  @override
  String get adminConfirmRestrictButton => 'Confirmer et restreindre';

  @override
  String get adminDeleteArticleTitle => 'Supprimer l\'article ?';

  @override
  String adminDeleteArticleBody(String title) {
    return '« $title » sera retiré de la base de connaissances de Visp.';
  }

  @override
  String get adminNewArticleTitle => 'Nouvel article';

  @override
  String get adminEditArticleTitle => 'Modifier l\'article';

  @override
  String get adminArticleTitleHint => 'Titre';

  @override
  String get adminArticleContentHint => 'Contenu de l\'article (markdown)';

  @override
  String get adminWikiArticlesHeader => 'Articles du wiki';

  @override
  String get adminNoArticlesYet => 'Aucun article pour l\'instant';

  @override
  String get adminEditArticleTooltip => 'Modifier l\'article';

  @override
  String get adminDeleteArticleTooltip => 'Supprimer l\'article';

  @override
  String get adminSearchServersHint => 'Rechercher des serveurs par nom...';

  @override
  String get adminSearchServersPrompt => 'Recherchez un serveur ci-dessus';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'Accorder des boosts à $serverName';
  }

  @override
  String get adminNumBoostsHint => 'Nombre de boosts';

  @override
  String get adminGrantButton => 'Accorder';

  @override
  String get adminPositiveNumberError => 'Saisissez un nombre entier positif.';

  @override
  String get adminGrantBoostsFailed => 'Échec de l\'attribution des boosts.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count boosts accordés à $serverName -- désormais niveau $level ($activeCount actifs).',
      one:
          '$count boost accordé à $serverName -- désormais niveau $level ($activeCount actifs).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count membres';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Accorder des boosts';

  @override
  String get parentalDashboardTitle => 'Famille';

  @override
  String get parentalDashboardCreateChildTitle => 'Créer un compte enfant';

  @override
  String get parentalDashboardUsernameHint => 'Nom d\'utilisateur';

  @override
  String get parentalDashboardEmailHint => 'E-mail';

  @override
  String get parentalDashboardPasswordHint => 'Mot de passe';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'Cela crée un compte entièrement supervisé : les salons étiquetés sont bloqués, et vous pourrez définir des horaires autorisés et voir (mais pas lire) ses amis et ses serveurs.';

  @override
  String get parentalDashboardValidationError =>
      'Un nom d\'utilisateur, un e-mail et un mot de passe d\'au moins 8 caractères sont requis.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'Impossible de créer le compte enfant -- ce nom d\'utilisateur ou cet e-mail est peut-être déjà utilisé.';

  @override
  String get parentalDashboardCreatingLabel => 'Création...';

  @override
  String get parentalDashboardNoChildren => 'Aucun compte lié pour l\'instant.';

  @override
  String get parentalDashboardSupervisedLabel => 'Compte supervisé';

  @override
  String get parentalDashboardUnknownUser => 'Inconnu';

  @override
  String get childDetailFallbackTitle => 'Compte enfant';

  @override
  String get childDetailTabFriends => 'Amis';

  @override
  String get childDetailTabServers => 'Serveurs';

  @override
  String get childDetailTabSchedule => 'Horaires';

  @override
  String get childDetailTabOverride => 'Dérogation';

  @override
  String get childDetailNoFriends => 'Aucun ami.';

  @override
  String get childDetailUnknownUser => 'Inconnu';

  @override
  String get childDetailRemoveFriendTooltip => 'Retirer l\'ami';

  @override
  String get childDetailNoServers => 'N\'est dans aucun serveur.';

  @override
  String childDetailMemberCount(int count) {
    return '$count membres';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Retirer du serveur';

  @override
  String get childDetailRestrictAccessTitle =>
      'Restreindre l\'accès à des horaires définis';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Désactivé signifie un accès illimité à tout moment';

  @override
  String get childDetailTimezoneLabel => 'Fuseau horaire';

  @override
  String get childDetailMonday => 'Lundi';

  @override
  String get childDetailTuesday => 'Mardi';

  @override
  String get childDetailWednesday => 'Mercredi';

  @override
  String get childDetailThursday => 'Jeudi';

  @override
  String get childDetailFriday => 'Vendredi';

  @override
  String get childDetailSaturday => 'Samedi';

  @override
  String get childDetailSunday => 'Dimanche';

  @override
  String get childDetailNoAccessLabel => 'Aucun accès';

  @override
  String get childDetailToLabel => 'à';

  @override
  String get childDetailSavingLabel => 'Enregistrement...';

  @override
  String get childDetailSaveScheduleButton => 'Enregistrer l\'horaire';

  @override
  String get childDetailScheduleSaved => 'Horaire enregistré.';

  @override
  String get childDetailOverrideExplanation =>
      'Accorder un accès temporaire en dehors de l\'horaire habituel -- utile pour une exception ponctuelle sans modifier l\'horaire hebdomadaire.';

  @override
  String get childDetailReasonHint => 'Raison (facultatif)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes min';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours h';
  }

  @override
  String get childDetailRevokeOverrideButton => 'Révoquer la dérogation active';

  @override
  String get childDetailAccessGranted => 'Accès temporaire accordé.';

  @override
  String get childDetailOverrideRevoked => 'Dérogation révoquée.';

  @override
  String get digitalGoodsTitle => 'Biens numériques';

  @override
  String get digitalGoodsMyProductsTitle => 'Mes produits';

  @override
  String get digitalGoodsManageProductsTooltip =>
      'Gérer les produits de ce serveur';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Passer à Parcourir';

  @override
  String get digitalGoodsCreateProductTooltip => 'Créer un produit';

  @override
  String get digitalGoodsBrowseTab => 'Parcourir';

  @override
  String get digitalGoodsMyListingsTab => 'Mes annonces';

  @override
  String get digitalGoodsMyPurchasesTab => 'Mes achats';

  @override
  String get digitalGoodsNoProductsYet => 'Aucun produit pour l\'instant';

  @override
  String get digitalGoodsNoProductsAvailable => 'Aucun produit disponible';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Créez votre premier produit pour commencer à vendre';

  @override
  String get digitalGoodsCheckBackLater =>
      'Revenez plus tard pour découvrir des biens numériques';

  @override
  String get digitalGoodsCreateProductButton => 'Créer un produit';

  @override
  String get digitalGoodsLicenseKeyBadge => 'Clé de licence';

  @override
  String get digitalGoodsFileBadge => 'Fichier';

  @override
  String get digitalGoodsAllServersBadge => 'Tous les serveurs';

  @override
  String get digitalGoodsFreeForYou => 'Gratuit pour vous';

  @override
  String get digitalGoodsFreeLabel => 'Gratuit';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count vendus';
  }

  @override
  String get digitalGoodsKeysButton => 'Clés';

  @override
  String get digitalGoodsGetForFree => 'Obtenir gratuitement';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'Acheter pour $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'Aucun achat pour l\'instant';

  @override
  String get digitalGoodsUnknownProduct => 'Produit inconnu';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'Acheté le $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Copier la clé';

  @override
  String get digitalGoodsLicenseKeyCopied => 'Clé de licence copiée !';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'Expire le $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'Votre clé de licence';

  @override
  String get digitalGoodsCopyKeyButton => 'Copier la clé';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'Impossible de démarrer le paiement -- ce créateur n\'a peut-être pas encore connecté Stripe.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'Achat terminé ! Retrouvez-le dans Mes achats.';

  @override
  String get digitalGoodsPurchasePending =>
      'En attente de ce paiement -- il apparaîtra dans Mes achats une fois finalisé.';

  @override
  String get digitalGoodsCreateProductTitle => 'Créer un produit';

  @override
  String get digitalGoodsEditProductTitle => 'Modifier le produit';

  @override
  String get digitalGoodsProductTitleHint => 'Titre du produit';

  @override
  String get digitalGoodsDescriptionHint => 'Description (facultatif)';

  @override
  String get digitalGoodsPriceHint => 'Prix en USD (laisser vide pour gratuit)';

  @override
  String get digitalGoodsProductTypeLabel => 'Type de produit';

  @override
  String get digitalGoodsFileDownloadOption => 'Téléchargement de fichier';

  @override
  String get digitalGoodsLicenseKeyOption => 'Clé de licence';

  @override
  String get digitalGoodsAvailabilityLabel => 'Disponibilité';

  @override
  String get digitalGoodsThisServerOnlyOption => 'Ce serveur uniquement';

  @override
  String get digitalGoodsAllKodaServersOption => 'Tous les serveurs Koda';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'Une fois créé, utilisez le bouton « Clés » pour importer vos clés de licence.';

  @override
  String get digitalGoodsProductFileLabel => 'Fichier du produit';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName ($sizeMb Mo)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Supprimer le fichier';

  @override
  String get digitalGoodsUploadingLabel => 'Envoi en cours...';

  @override
  String get digitalGoodsChooseFileButton => 'Choisir un fichier';

  @override
  String get digitalGoodsReplaceFileButton => 'Remplacer le fichier';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Choisissez un fichier pour ce produit avant d\'enregistrer.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle =>
      'Importer des clés de licence';

  @override
  String get digitalGoodsPasteKeysHint => 'Collez une clé par ligne :';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Importer les clés';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'Clés de licence importées !';

  @override
  String get serverSubscriptionManageTitle => 'Gérer les abonnements';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return 'Abonnements $serverName';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Ajouter un palier';

  @override
  String get serverSubscriptionNoTiersYet =>
      'Aucun palier d\'abonnement pour l\'instant';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Créez jusqu\'à 3 paliers pour votre communauté';

  @override
  String get serverSubscriptionCreateFirstTierButton =>
      'Créer le premier palier';

  @override
  String get serverSubscriptionShowSubscriberCounts =>
      'Afficher le nombre d\'abonnés';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/mois';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count abonnés actifs',
      one: '$count abonné actif',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned =>
      'Rôle attribué automatiquement';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '$discount % de réduction sur la marketplace';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'Ce serveur n\'a aucun palier d\'abonnement';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Abonné actif';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'Expire le $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk => 'Rôle exclusif aux abonnés';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return '$discount % de réduction sur les achats de la marketplace';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Salons réservés aux abonnés';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Actuellement abonné';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'S\'abonner pour $price/mois';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Créer un palier';

  @override
  String get serverSubscriptionEditTierTitle => 'Modifier le palier';

  @override
  String get serverSubscriptionTierNameHint =>
      'Nom du palier (p. ex. Fan, Supporter, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Description (facultatif)';

  @override
  String get serverSubscriptionPriceHint => 'Prix par mois (USD)';

  @override
  String get serverSubscriptionDiscountLabel =>
      '% de réduction sur la marketplace';

  @override
  String get serverSubscriptionPositionLabel => 'Position';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Palier $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Attribue un rôle lors de l\'abonnement — facultatif';

  @override
  String get serverSubscriptionRoleFallback => 'rôle';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Attribué automatiquement à un membre dès qu\'il s\'abonne, et retiré dès que son abonnement expire.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Palier créé -- connectez Stripe dans Marketplace → Créateur avant que les membres puissent s\'y abonner.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Supprimer le palier';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return 'Supprimer « $tierName » ? Les abonnés actuels conserveront l\'accès jusqu\'à expiration.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'S\'abonner à $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel => 'Abonnement mensuel';

  @override
  String get serverSubscriptionServerBankEarnsLabel =>
      'La banque du serveur gagne';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points pts';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Paiement traité en toute sécurité par Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'S\'abonner';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'Impossible de démarrer le paiement -- le propriétaire de ce serveur n\'a peut-être pas encore connecté Stripe.';

  @override
  String get serverSubscriptionSubscribed => 'Abonné !';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'En attente de ce paiement -- il s\'activera une fois finalisé.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'Donner un pourboire à $username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Sélectionner le montant';

  @override
  String get tipDialogMessageHint => 'Ajouter un message (facultatif)';

  @override
  String get tipDialogYouPayLabel => 'Vous payez';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username reçoit';
  }

  @override
  String get tipDialogSendTipButton => 'Envoyer le pourboire';

  @override
  String get tipDialogFailedToSendTip =>
      'Échec de l\'envoi du pourboire. Le créateur n\'est peut-être pas connecté à Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'Impossible de démarrer le paiement. Réessayez dans un instant.';

  @override
  String get tipDialogTipSent => 'Pourboire envoyé !';

  @override
  String get tipDialogTipPending =>
      'En attente de ce paiement -- il sera traité une fois finalisé.';

  @override
  String get tipDialogUnknownUser => 'Inconnu';

  @override
  String get marketplaceTitle => 'Marketplace';

  @override
  String get marketplaceCreatorPayoutsTitle => 'Paiements aux créateurs';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Recevez des pourboires directement via Stripe';

  @override
  String get marketplaceTabServerBank => 'Banque du serveur';

  @override
  String get marketplaceTabDigitalGoods => 'Biens numériques';

  @override
  String get marketplaceTabMerch => 'Merch';

  @override
  String get marketplaceTabSubscription => 'Abonnement';

  @override
  String get marketplaceTabRevenue => 'Revenus';

  @override
  String get marketplaceSelectServerSubscription =>
      'Sélectionnez un serveur pour voir son abonnement';

  @override
  String get marketplaceSelectServerBank =>
      'Sélectionnez un serveur pour voir sa banque';

  @override
  String get marketplaceSelectServerRevenue =>
      'Sélectionnez un serveur pour voir ses revenus';

  @override
  String get marketplaceStripeAccountStatus => 'Compte Stripe';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Intégration terminée';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'Paiements acceptés';

  @override
  String get marketplaceConnectStripeButton => 'Connecter un compte Stripe';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Terminer l\'intégration Stripe';

  @override
  String get marketplaceRefreshStatusButton => 'Actualiser le statut';

  @override
  String get marketplaceReadyToReceiveTips =>
      'Vous êtes prêt à recevoir des pourboires !';

  @override
  String get marketplaceHowItWorksTitle => 'Comment ça marche';

  @override
  String get marketplaceHowItWorksStep1 => 'Connectez votre compte Stripe';

  @override
  String get marketplaceHowItWorksStep2 =>
      'Terminez la vérification d\'identité';

  @override
  String get marketplaceHowItWorksStep3 =>
      'Recevez des pourboires directement sur votre compte bancaire';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda facture des frais de traitement de 5 %. Ces frais sont versés à la banque de votre serveur sous forme de points.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Seuls le propriétaire du serveur ou une personne disposant de la permission Gérer la marketplace peuvent consulter la banque du serveur.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName boosté !';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit emplacements d\'emoji personnalisés';
  }

  @override
  String get marketplaceServerFallback => 'Serveur';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance pts';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount d\'activité';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'Les points proviennent des frais de traitement de 5 % sur les pourboires et abonnements de ce serveur. Utilisez-les pour débloquer des améliorations de serveur.';

  @override
  String get marketplaceServerBoostsTitle => 'Boosts du serveur';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Niveau $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count boosts actifs',
      one: '$count boost actif',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: 'Encore $more boosts pour atteindre le niveau $level',
      one: 'Encore $more boost pour atteindre le niveau $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' et débloquez un arrière-plan de serveur personnalisé';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' et débloquez une bordure d\'icône de serveur personnalisée';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vous avez $count jetons de boost disponibles.',
      one: 'Vous avez $count jeton de boost disponible.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'Les jetons de boost proviennent d\'un abonnement Pulse (1/mois). Abonnez-vous depuis l\'onglet Abonnements pour en obtenir un.';

  @override
  String get marketplaceBoostingLabel => 'Boost en cours...';

  @override
  String get marketplaceBoostThisServerButton => 'Booster ce serveur';

  @override
  String get marketplaceComingSoonUpgradesTitle =>
      'Bientôt disponible — Améliorations du serveur';

  @override
  String get marketplaceSpendPointsList =>
      'Dépensez les points de la banque du serveur pour :\n• Domaine de serveur personnalisé\n• Limite de membres augmentée\n• Support prioritaire\n• Badge de serveur exclusif';

  @override
  String get marketplaceSourceTip => 'Pourboires';

  @override
  String get marketplaceSourceSubscription => 'Abonnements Koda';

  @override
  String get marketplaceSourceServerSubscription => 'Abonnements au serveur';

  @override
  String get marketplaceSourceDigitalProduct => 'Biens numériques';

  @override
  String get marketplaceSourceStageTicket => 'Billets de scène';

  @override
  String get marketplaceSourcePrintfulOrder => 'Commandes de merch';

  @override
  String get marketplaceJustNow => 'à l\'instant';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return 'il y a $minutes min';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return 'il y a $hours h';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return 'il y a $days j';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Seuls les membres pouvant gérer la marketplace peuvent consulter les revenus de ce serveur.';

  @override
  String get marketplaceBalanceLabel => 'Solde';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Gains totaux';

  @override
  String get marketplaceLast30DaysTitle => '30 derniers jours';

  @override
  String get marketplaceRevenueBySourceTitle => 'Revenus par source';

  @override
  String get marketplaceNoRevenueYet => 'Aucun revenu pour l\'instant.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count transactions',
      one: '$count transaction',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'Transactions récentes';

  @override
  String get marketplaceNoTransactionsYet =>
      'Aucune transaction pour l\'instant.';

  @override
  String get marketplaceNoActivityYet => 'Aucune activité pour l\'instant';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date : $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count produits synchronisés depuis Printful',
      one: '$count produit synchronisé depuis Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Impossible de synchroniser avec Printful -- vérifiez la connexion dans les paramètres Merch.';

  @override
  String get printfulMerchSelectServer =>
      'Sélectionnez un serveur pour voir son merch';

  @override
  String get printfulMerchManageCatalogTitle => 'Gérer le catalogue Merch';

  @override
  String get printfulMerchTitle => 'Merch';

  @override
  String get printfulMerchSyncingLabel => 'Synchronisation...';

  @override
  String get printfulMerchSyncCatalogButton => 'Synchroniser le catalogue';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'Passer à Parcourir';

  @override
  String get printfulMerchManageTooltip => 'Gérer le merch de ce serveur';

  @override
  String get printfulMerchNothingSyncedYet =>
      'Rien de synchronisé pour l\'instant';

  @override
  String get printfulMerchNoMerchAvailable =>
      'Aucun merch disponible pour l\'instant';

  @override
  String get printfulMerchSyncHint =>
      'Synchronisez votre boutique Printful pour importer votre catalogue de produits';

  @override
  String get printfulMerchCheckBackLater =>
      'Revenez plus tard pour découvrir le merch de ce serveur';

  @override
  String get printfulMerchOutOfStock => 'Rupture de stock';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'À partir de $price • $count options',
      one: 'À partir de $price • $count option',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'Voir';

  @override
  String get printfulMerchCartTooltip => 'Panier';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productName ajouté au panier';
  }

  @override
  String get printfulMerchQuantityLabel => 'Quantité';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Diminuer la quantité';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Augmenter la quantité';

  @override
  String get printfulMerchAddToCartButton => 'Ajouter au panier';

  @override
  String get printfulMerchOptionLabel => 'Option';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Style';

  @override
  String get printfulMerchSizeLabel => 'Taille';

  @override
  String get printfulMerchYourCartTitle => 'Votre panier';

  @override
  String get printfulMerchCartEmpty => 'Votre panier est vide.';

  @override
  String get printfulMerchSubtotalLabel => 'Sous-total';

  @override
  String get printfulMerchCheckoutLabel => 'Paiement';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'Retirer du panier';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Renseignez d\'abord votre adresse de livraison.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'Impossible d\'obtenir les tarifs de livraison pour cette adresse.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'Impossible de démarrer le paiement. Réessayez dans un instant.';

  @override
  String get printfulMerchOrderPlaced => 'Commande passée !';

  @override
  String get printfulMerchOrderPending =>
      'En attente de ce paiement -- elle sera passée une fois finalisé.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Vitesse d\'expédition';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max jours ouvrés';
  }

  @override
  String get printfulMerchGetShippingQuoteButton =>
      'Obtenir un devis de livraison';

  @override
  String get printfulMerchPayButton => 'Payer';

  @override
  String get kodaMarketplaceTitle => 'Koda Marketplace';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Abonnements';

  @override
  String get kodaMarketplaceTabBoosts => 'Boosts';

  @override
  String get kodaMarketplaceTabDiscover => 'Découvrir';

  @override
  String get kodaMarketplaceTierFreeName => 'Gratuit';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'Expire le $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks =>
      'Passez à un niveau supérieur pour des avantages exclusifs';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jetons de boost disponibles',
      one: '$count jeton de boost disponible',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Offrez un jeton à n\'importe quel serveur dont vous êtes membre depuis son onglet Banque du serveur';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame =>
      'Cadre d\'avatar personnalisé';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Badge Spark sur le profil';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Limite d\'envoi de fichiers augmentée (50 Mo)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality =>
      'Qualité vocale prioritaire';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark =>
      'Tout ce qu\'offre Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => 'Cadre d\'avatar animé';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Badge Pulse sur le profil';

  @override
  String get kodaMarketplacePulsePerkFileLimit =>
      'Limite d\'envoi de fichiers de 100 Mo';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      '1 jeton de boost de serveur par mois';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/mois';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Offre actuelle';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'Obtenir $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return 'Offrir $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return 'Offrir $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'S\'abonner à $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel =>
      'Nom d\'utilisateur du destinataire :';

  @override
  String get kodaMarketplaceUsernameHint => 'Nom d\'utilisateur';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Abonnement';

  @override
  String get kodaMarketplaceTotalLabel => 'Total';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Paiement traité en toute sécurité par Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'Passer au paiement';

  @override
  String get kodaMarketplaceUserNotFound => 'Utilisateur introuvable';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'Impossible de démarrer le paiement. Réessayez dans un instant.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'Abonnement actif !';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'En attente de ce paiement -- il s\'activera une fois finalisé.';

  @override
  String get kodaMarketplaceBoostPurchased => 'Boost acheté !';

  @override
  String get kodaMarketplaceBoostPending =>
      'En attente de ce paiement -- il sera prêt une fois finalisé.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count disponibles';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Acheter un boost';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'Un achat unique -- les abonnés Pulse reçoivent également un jeton gratuit à chaque renouvellement, ce qui reste la meilleure option si vous boostez régulièrement.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Acheter un boost -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Aucun serveur n\'a encore rejoint le Koda Marketplace. Les propriétaires de serveur peuvent l\'activer dans les paramètres Personnaliser de leur serveur.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader =>
      'EN VEDETTE CETTE SEMAINE';

  @override
  String get kodaMarketplaceAllListedServersHeader =>
      'TOUS LES SERVEURS LISTÉS';

  @override
  String get kodaMarketplaceServerFallback => 'Serveur';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membres',
      one: '$count membre',
    );
    return '$_temp0';
  }

  @override
  String get calendarFallbackTitle => 'Calendrier';

  @override
  String get calendarAskVispTooltip => 'Demander à Visp';

  @override
  String get calendarCreateEventTooltip => 'Créer un événement';

  @override
  String get calendarPreviousMonthTooltip => 'Mois précédent';

  @override
  String get calendarNextMonthTooltip => 'Mois suivant';

  @override
  String get calendarTodayButton => 'Aujourd\'hui';

  @override
  String get calendarWeekdaySun => 'dim';

  @override
  String get calendarWeekdayMon => 'lun';

  @override
  String get calendarWeekdayTue => 'mar';

  @override
  String get calendarWeekdayWed => 'mer';

  @override
  String get calendarWeekdayThu => 'jeu';

  @override
  String get calendarWeekdayFri => 'ven';

  @override
  String get calendarWeekdaySat => 'sam';

  @override
  String get calendarTodaySuffix => ', aujourd\'hui';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count événements',
      one: ', $count événement',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'Sélectionnez un jour';

  @override
  String get calendarNoEvents => 'Aucun événement';

  @override
  String get calendarSubscribeTooltip => 'S\'abonner';

  @override
  String get calendarUnsubscribeTooltip => 'Se désabonner';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'Se répète $recurrence';
  }

  @override
  String get calendarTicketOwned => 'Billet possédé';

  @override
  String calendarTicketPrice(String price) {
    return 'Billet $price';
  }

  @override
  String get calendarDeleteEventTitle => 'Supprimer l\'événement';

  @override
  String calendarDeleteEventConfirm(String title) {
    return 'Supprimer « $title » ? Cette action est irréversible.';
  }

  @override
  String get calendarEditEventTitle => 'Modifier l\'événement';

  @override
  String get calendarCreateEventTitle => 'Créer un événement';

  @override
  String get calendarEventTitleHint => 'Titre de l\'événement';

  @override
  String get calendarDescriptionHint => 'Description (facultatif)';

  @override
  String get calendarLocationHint => 'Lieu (facultatif)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Début ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Date et heure de début, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'Fin — facultatif ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'Date et heure de fin, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'non défini';

  @override
  String get calendarTapToSetEndTime => 'Touchez pour définir l\'heure de fin';

  @override
  String get calendarRecurrenceLabel => 'Récurrence';

  @override
  String get calendarRecurrenceNone => 'Ne se répète pas';

  @override
  String get calendarRecurrenceDaily => 'Quotidienne';

  @override
  String get calendarRecurrenceWeekly => 'Hebdomadaire';

  @override
  String get calendarRecurrenceMonthly => 'Mensuelle';

  @override
  String get calendarColorLabel => 'Couleur';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Couleur $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Prix du billet — facultatif';

  @override
  String get calendarLinkStageChannelLabel =>
      'Lier à un salon de scène — facultatif';

  @override
  String get calendarStageChannelFallback => 'scène';

  @override
  String get discordImportFetchError => 'Impossible de récupérer le modèle.';

  @override
  String get discordImportApplyError =>
      'Échec de l\'application du modèle. Veuillez réessayer.';

  @override
  String get discordImportTitle => 'Importer un modèle Discord';

  @override
  String get discordImportDescription =>
      'Collez un lien discord.new ou un code de modèle pour importer des rôles, catégories et salons dans ce serveur.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 ou code du modèle';

  @override
  String get discordImportPreviewButton => 'Aperçu';

  @override
  String get discordImportTemplateFallback => 'Modèle';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rôles',
      one: '$count rôle',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count catégories',
      one: '$count catégorie',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count salons',
      one: '$count salon',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel =>
      'REMPLACER LA STRUCTURE EXISTANTE';

  @override
  String get discordImportReplaceWarning =>
      'Tous les salons, catégories et rôles existants seront définitivement supprimés.';

  @override
  String get discordImportAddDescription =>
      'Le modèle sera ajouté à la structure existante de votre serveur.';

  @override
  String get discordImportReplaceConfirmTitle =>
      'Remplacer la structure du serveur ?';

  @override
  String get discordImportReplaceConfirmBody =>
      'Cela supprimera définitivement TOUS les salons, catégories et rôles existants avant l\'importation. Cette action est irréversible.';

  @override
  String get discordImportYesReplace => 'Oui, remplacer';

  @override
  String get discordImportReplaceAndImportButton =>
      'Remplacer et importer le modèle';

  @override
  String get discordImportAddToServerButton => 'Ajouter le modèle au serveur';

  @override
  String get thresholdModConfigureTitle => 'Configurer la modération par seuil';

  @override
  String get thresholdModConfigureExplanation =>
      'Choisissez des modérateurs de confiance et combien d\'entre eux doivent être d\'accord avant que l\'un d\'eux puisse déchiffrer une époque de l\'historique d\'un salon. Même vous n\'obtenez pas de clé unilatérale -- vous n\'êtes exempté que si vous figurez aussi dans cette liste.';

  @override
  String get thresholdModThresholdLabel => 'Seuil :';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Diminuer le seuil';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Augmenter le seuil';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'sur $count modérateurs',
      one: 'sur $count modérateur',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle =>
      'Demander un déchiffrement par seuil';

  @override
  String get thresholdModChannelLabel => 'Salon';

  @override
  String get thresholdModReasonHint =>
      'Raison -- visible par chaque modérateur désigné';

  @override
  String get thresholdModRequestButton => 'Demander';

  @override
  String get thresholdModShareRelayed => 'Partage transmis au demandeur.';

  @override
  String get thresholdModNotEnoughShares =>
      'Pas encore assez de parts transmises -- réessayez une fois que d\'autres modérateurs auront transmis les leurs.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count messages',
      one: '$count message',
    );
    return 'Époque $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'Aucun message déchiffrable dans cette époque.';

  @override
  String get thresholdModExplanation =>
      'Déchiffrement réel de l\'historique d\'un salon, conditionné à l\'accord actif de plusieurs modérateurs désignés -- jamais une seule personne, pas même le propriétaire du serveur. Ne débloque jamais qu\'une époque entière (tout ce qui a été envoyé depuis le dernier changement de composition), jamais un seul message.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Activé -- $count modérateurs, seuil $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'Non configuré';

  @override
  String get thresholdModReconfigureButton => 'Reconfigurer';

  @override
  String get thresholdModEnableButton => 'Activer';

  @override
  String get thresholdModNotEnabledForServer =>
      'La modération par seuil n\'est pas activée pour ce serveur.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Activée pour ce serveur. Vous ne faites pas partie des modérateurs désignés.';

  @override
  String get thresholdModRequestsLabel => 'Demandes';

  @override
  String get thresholdModRequestDecryptButton => 'Demander un déchiffrement';

  @override
  String get thresholdModNoActiveRequests => 'Aucune demande active.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- époque $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'en attente';

  @override
  String get thresholdModStatusApproved => 'approuvée';

  @override
  String get thresholdModApproveButton => 'Approuver';

  @override
  String get thresholdModRelayShareButton => 'Transmettre ma part';

  @override
  String get thresholdModTryReconstructButton => 'Essayer de reconstruire';

  @override
  String get roleSelectNoRolesAvailable => 'Aucun rôle attribuable disponible.';

  @override
  String get roleSelectInstructions =>
      'Sélectionnez les rôles que vous voulez. Touchez un rôle pour l\'ajouter ou le retirer.';

  @override
  String get rulesScreenAcceptError =>
      'Impossible d\'accepter les règles. Réessayez.';

  @override
  String get rulesScreenSubtitle => 'Règles du serveur';

  @override
  String get rulesScreenScrollToRead =>
      'Faites défiler pour lire toutes les règles';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'En cliquant sur Accepter, vous acceptez de suivre ces règles.\nLes infractions peuvent entraîner votre exclusion du serveur.';

  @override
  String get rulesScreenAcceptButton => 'J\'accepte les règles';

  @override
  String get rulesScreenReadAllToContinue =>
      'Lisez toutes les règles pour continuer';

  @override
  String get galleryNewPostTitle => 'Nouvelle publication';

  @override
  String get galleryChooseFileButton => 'Choisir un fichier';

  @override
  String get galleryOrDivider => 'ou';

  @override
  String get galleryPasteUrlHint => 'Collez l\'URL de l\'image/vidéo';

  @override
  String get galleryTypeLabel => 'Type';

  @override
  String get galleryImageOption => 'Image';

  @override
  String get galleryVideoOption => 'Vidéo';

  @override
  String get galleryCaptionHint => 'Légende (facultatif)';

  @override
  String get galleryPostButton => 'Publier';

  @override
  String get galleryNewCollectionTitle => 'Nouvelle collection';

  @override
  String get galleryCollectionNameHint => 'Nom de la collection';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return 'Supprimer « $collectionName » ? Les publications qu\'elle contient ne seront plus regroupées.';
  }

  @override
  String get galleryFeedTab => 'Fil';

  @override
  String get galleryCollectionsTab => 'Collections';

  @override
  String get galleryNoPostsYet => 'Aucune publication pour l\'instant';

  @override
  String get galleryNoCollectionsYet => 'Aucune collection pour l\'instant';

  @override
  String get gallerySelectACollection => 'Sélectionnez une collection';

  @override
  String get galleryNoPostsInCollection =>
      'Aucune publication dans cette collection';

  @override
  String get galleryAddPostButton => 'Ajouter une publication';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Échec du partage d\'écran : $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return 'Volume de $username';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'N\'affecte que ce que vous entendez -- cet appareil, cet appel.';

  @override
  String get voiceScreenResetVolumeButton => 'Réinitialiser';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'Connexion impossible : $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Votre écran, touchez pour afficher en plein écran';

  @override
  String get voiceScreenYourScreenLabel => 'Votre écran';

  @override
  String get voiceScreenTapToClose => 'Toucher pour fermer';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (vous)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', en train de parler';

  @override
  String get voiceScreenCameraOnSuffix => ', caméra activée';

  @override
  String get voiceScreenActivateToPopOut =>
      ', activer pour ouvrir dans une fenêtre séparée';

  @override
  String get voiceScreenShowVarmTooltip => 'Afficher VARM';

  @override
  String get voiceScreenHideVarmTooltip => 'Masquer VARM';

  @override
  String get voiceScreenShowChatTooltip => 'Afficher le chat';

  @override
  String get voiceScreenHideChatTooltip => 'Masquer le chat';

  @override
  String get voiceScreenStartCameraTooltip => 'Démarrer la caméra';

  @override
  String get voiceScreenStopCameraTooltip => 'Arrêter la caméra';

  @override
  String get voiceScreenShareScreenTooltip => 'Partager l\'écran';

  @override
  String get voiceScreenStopSharingTooltip => 'Arrêter le partage';

  @override
  String get voiceScreenPopOutTooltip =>
      'Détacher la voix dans une fenêtre séparée';

  @override
  String get voiceScreenCouldNotPopOut => 'Impossible de détacher la voix.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Quitter le vocal';

  @override
  String get voiceScreenPinTooltip => 'Épingler (garder ouvert)';

  @override
  String get voiceScreenUnpinTooltip => 'Désépingler';

  @override
  String get voiceScreenSizeSmall => 'Petit (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Moyen (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Grand (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, $count connectés';
  }

  @override
  String get voiceBarSpeakingSuffix => ', vous parlez';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count connectés · touchez pour agrandir';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Démarrer la caméra';

  @override
  String get voiceBarStopCameraTooltip => 'Arrêter la caméra';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Quitter le vocal';

  @override
  String get popOutVideoFallbackTitle => 'Vocal';

  @override
  String get popOutVideoMissingTokenError => 'Jeton ou URL manquant';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Délai de connexion dépassé après 15 secondes';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Erreur : $error';
  }

  @override
  String get popOutVideoNoParticipants => 'Aucun participant';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Scène';

  @override
  String get stageCouldNotJoin => 'Impossible de rejoindre la scène.';

  @override
  String get stageThisStageFallback => 'Cette scène';

  @override
  String get stageRequiresTicketToJoin =>
      'nécessite un billet pour la rejoindre';

  @override
  String get stagePleaseWaitLabel => 'Veuillez patienter...';

  @override
  String get stageGetFreeTicketButton => 'Obtenir un billet gratuit';

  @override
  String stageBuyTicketButton(String price) {
    return 'Acheter un billet -- $price';
  }

  @override
  String get stageNotNowButton => 'Pas maintenant';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'Impossible de démarrer l\'achat du billet.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'En attente de ce paiement -- réessayez de rejoindre une fois confirmé.';

  @override
  String get stageSpeakerBadge => 'Intervenant';

  @override
  String get stageListenerBadge => 'Auditeur';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'Impossible de rejoindre : $error';
  }

  @override
  String get stageSpeakersHeader => 'INTERVENANTS';

  @override
  String get stageRaisedHandsHeader => 'MAINS LEVÉES';

  @override
  String get stageAllowButton => 'Autoriser';

  @override
  String get stageIgnoreButton => 'Ignorer';

  @override
  String get stageListenersHeader => 'AUDITEURS';

  @override
  String get stageRaiseHandTooltip => 'Lever la main';

  @override
  String get stageLowerHandTooltip => 'Baisser la main';

  @override
  String get stageLeaveStageTooltip => 'Quitter la scène';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (vous)';
  }

  @override
  String get stageMoveToListenersButton => 'Déplacer vers les auditeurs';

  @override
  String get stageYouFallbackName => 'Vous';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'Avatar de $username';
  }

  @override
  String get channelEditDialogNewTitle => 'Nouveau salon';

  @override
  String get channelEditDialogEditTitle => 'Modifier le salon';

  @override
  String get channelEditDialogNameHint => 'Nom du salon';

  @override
  String get channelEditDialogTypeLabel => 'Type';

  @override
  String get channelEditDialogTypeText => 'Texte';

  @override
  String get channelEditDialogTypeVoice => 'Vocal';

  @override
  String get channelEditDialogTypeGallery => 'Galerie';

  @override
  String get channelEditDialogTypeStage => 'Scène';

  @override
  String get channelEditDialogTypeRules => 'Règles';

  @override
  String get channelEditDialogTypeRoleSelection => 'Sélection de rôle';

  @override
  String get channelEditDialogTypeCalendar => 'Calendrier';

  @override
  String get channelEditDialogAnnouncementTitle => 'Salon d\'annonces';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Seuls les membres pouvant gérer les messages peuvent publier';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Publier ici les annonces de diffusion en direct et de mises en ligne';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'Publication automatique lorsqu\'un membre disposant de la permission « Annoncer en direct » commence un live sur Twitch ou publie une nouvelle vidéo YouTube';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Notifier ces rôles lors d\'une publication (facultatif)';

  @override
  String get channelEditDialogCategoryLabel => 'Catégorie';

  @override
  String get channelEditDialogNoCategory => 'Aucune catégorie';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Accès par rôle (laisser vide pour tous)';

  @override
  String get channelEditDialogContentLabelsLabel => 'Étiquettes de contenu';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Marque ce salon pour les filtres de contenu des membres ; totalement bloqué pour les comptes supervisés';

  @override
  String get categoryEditDialogNewTitle => 'Nouvelle catégorie';

  @override
  String get categoryEditDialogEditTitle => 'Modifier la catégorie';

  @override
  String get categoryEditDialogNameHint => 'Nom de la catégorie';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Accès par rôle (laisser vide pour tous)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Membres — $count en ligne';
  }

  @override
  String get memberPanelRefreshTooltip => 'Actualiser la liste des membres';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membres',
      one: '$count membre',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Hors ligne';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', palier $tier';
  }

  @override
  String get memberPanelUnknownUser => 'Inconnu';

  @override
  String get memberPanelModerationActionsTooltip => 'Actions de modération';

  @override
  String get reportDialogReasonSpam => 'Spam';

  @override
  String get reportDialogReasonHarassment => 'Harcèlement ou abus';

  @override
  String get reportDialogReasonIllegal => 'Contenu illégal';

  @override
  String get reportDialogReasonOther => 'Autre';

  @override
  String get reportDialogReasonLabel => 'Raison';

  @override
  String get reportDialogNoteHint =>
      'Autre chose que les modérateurs devraient savoir ? (facultatif)';

  @override
  String get reportDialogDisclosureNote =>
      'Le contenu du message qui vous est présenté et son expéditeur seront partagés avec les modérateurs de ce serveur.';

  @override
  String get reportDialogSubmitButton => 'Envoyer le signalement';

  @override
  String get reportDialogSubmitError => 'Impossible d\'envoyer le signalement.';

  @override
  String get notificationBellTitle => 'Notifications';

  @override
  String get notificationBellMarkAllRead => 'Tout marquer comme lu';

  @override
  String get notificationBellEmptyState =>
      'Aucune notification pour l\'instant';

  @override
  String get notificationBellUnreadLabel => 'Non lu';

  @override
  String get invitePreviewTitle => 'Invitation au serveur';

  @override
  String get invitePreviewInvalidOrExpired => 'Invitation invalide ou expirée.';

  @override
  String get invitePreviewCouldNotJoin => 'Impossible de rejoindre le serveur.';

  @override
  String get invitePreviewUnknownServer => 'Serveur inconnu';

  @override
  String get shippingAddressFullNameHint => 'Nom complet';

  @override
  String get shippingAddressLine1Hint => 'Adresse ligne 1';

  @override
  String get shippingAddressLine2Hint => 'Adresse ligne 2 (facultatif)';

  @override
  String get shippingAddressCityHint => 'Ville';

  @override
  String get shippingAddressStateHint => 'État / région';

  @override
  String get shippingAddressZipHint => 'Code postal';

  @override
  String get shippingAddressCountryCodeHint => 'Code pays (p. ex. FR)';

  @override
  String get shippingAddressPhoneHint => 'Téléphone (facultatif)';

  @override
  String get shippingAddressPrivacyNote =>
      'Utilisé uniquement pour expédier cette commande -- consultez la politique de confidentialité de Printful pour savoir comment elle est traitée une fois la commande passée.';

  @override
  String get updateNudgeAvailableTitle => 'Mise à jour disponible';

  @override
  String get updateNudgeRequiredTitle => 'Mise à jour requise';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $version est disponible -- vous utilisez une version plus ancienne.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'Cette version n\'est plus prise en charge. Mettez à jour vers Koda $version pour continuer à utiliser Koda.';
  }

  @override
  String get updateNudgeLaterButton => 'Plus tard';

  @override
  String get tierBadgeSparkSubscriber => 'Abonné Spark';

  @override
  String get tierBadgePulseSubscriber => 'Abonné Pulse';

  @override
  String get vispAvatarInDevelopment => 'EN DÉVELOPPEMENT';

  @override
  String get vispBoostAdvisorCouldNotAnswer =>
      'Visp n\'a pas pu formuler de réponse.';

  @override
  String get vispBoostAdvisorTitle =>
      'Demander à Visp : Conseiller ROI des boosts';

  @override
  String get vispBoostAdvisorFollowUpHint =>
      'Poser une question complémentaire...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Envoyer';

  @override
  String get vispBoostAdvisorBasedOn => 'Basé sur :';

  @override
  String get vispEventDialogCouldNotGenerate =>
      'Visp n\'a pas pu générer d\'événement.';

  @override
  String get vispEventDialogCouldNotCreate =>
      'Impossible de créer cet événement.';

  @override
  String get vispEventDialogRecurrenceNone => 'Ponctuel';

  @override
  String get vispEventDialogRecurrenceDaily => 'Se répète tous les jours';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Se répète toutes les semaines';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Se répète tous les mois';

  @override
  String get vispEventDialogTitle => 'Demander à Visp de créer un événement';

  @override
  String get vispEventDialogDescription =>
      'Décrivez l\'événement -- Visp proposera un titre, une date/heure et d\'autres détails.';

  @override
  String get vispEventDialogPromptHint =>
      'p. ex. « Session hebdomadaire de D&D tous les vendredis à 19h pendant environ 3 heures »';

  @override
  String get vispEventDialogPrivacyNote =>
      'Votre description est envoyée à Visp (un assistant auto-hébergé -- rien ne quitte les serveurs de Koda) pour générer ce plan.';

  @override
  String get vispEventDialogStartOver => 'Recommencer';

  @override
  String get vispEventDialogCreateEvent => 'Créer l\'événement';

  @override
  String get vispEventDialogThinking => 'Réflexion en cours...';

  @override
  String get vispEventDialogGeneratePlan => 'Générer le plan';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'Impossible d\'interpréter une date -- essayez de reformuler';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Se termine $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price par billet';
  }

  @override
  String get vispEventDialogBasedOn => 'Basé sur :';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Question $questionNumber sur $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'Ou tapez votre propre réponse...';

  @override
  String get vispQuestionStepSendTooltip => 'Envoyer';

  @override
  String get vispQuestionStepSkip => 'Ignorer et générer maintenant';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp n\'a pas pu générer de plan.';

  @override
  String get vispSetupDialogCouldNotApplyPlan =>
      'Impossible d\'appliquer ce plan.';

  @override
  String get vispSetupDialogTitleNew => 'Décrivez votre serveur à Visp';

  @override
  String get vispSetupDialogTitleExisting =>
      'Demander à Visp d\'ajouter à ce serveur';

  @override
  String get vispSetupDialogDescriptionNew =>
      'Décrivez le serveur que vous voulez -- Visp proposera un nom ainsi qu\'un ensemble de rôles, catégories et salons.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Décrivez ce que vous aimeriez ajouter -- Visp proposera des rôles, catégories et salons à créer.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'p. ex. « Un serveur convivial pour mon groupe de D&D avec des salons vocaux pour deux tables »';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'p. ex. « Ajoute quelques salons de plus pour nos équipes de raid »';

  @override
  String get vispSetupDialogPrivacyNote =>
      'Votre description est envoyée à Visp (un assistant auto-hébergé -- rien ne quitte les serveurs de Koda) pour générer ce plan.';

  @override
  String get vispSetupDialogStartOver => 'Recommencer';

  @override
  String get vispSetupDialogCreateServer => 'Créer le serveur';

  @override
  String get vispSetupDialogAddToServer => 'Ajouter au serveur';

  @override
  String get vispSetupDialogThinking => 'Réflexion en cours...';

  @override
  String get vispSetupDialogGeneratePlan => 'Générer le plan';

  @override
  String get vispSetupDialogNewServerLabel => 'Nouveau serveur';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rôles',
      one: '$count rôle',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count catégories',
      one: '$count catégorie',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count salons',
      one: '$count salon',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'Basé sur :';

  @override
  String get childLockoutTitle =>
      'Ceci est en dehors de vos horaires autorisés';

  @override
  String get childLockoutBody =>
      'Un parent ou tuteur a défini des horaires pour l\'utilisation de Koda avec ce compte. Demandez-lui plus de temps, ou revenez lors de votre prochaine période autorisée.';

  @override
  String get childLockoutLogOutButton => 'Se déconnecter';

  @override
  String get forcePasswordChangeError =>
      'Impossible de mettre à jour le mot de passe. Réessayez.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Bienvenue, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Votre compte nécessite un nouveau mot de passe avant de pouvoir continuer.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'Nouveau mot de passe';

  @override
  String get forcePasswordChangeConfirmPasswordHint =>
      'Confirmer le nouveau mot de passe';

  @override
  String get forcePasswordChangeReqLength => 'Au moins 12 caractères';

  @override
  String get forcePasswordChangeReqUpper => 'Une lettre majuscule';

  @override
  String get forcePasswordChangeReqLower => 'Une lettre minuscule';

  @override
  String get forcePasswordChangeReqDigit => 'Un chiffre';

  @override
  String get forcePasswordChangeReqMatch => 'Les mots de passe correspondent';

  @override
  String get forcePasswordChangeSubmitButton =>
      'Définir le nouveau mot de passe';

  @override
  String get forgotPasswordEnterEmailError => 'Saisissez votre adresse e-mail.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'Si ce compte existe, un code de réinitialisation a été envoyé.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Saisissez le code et un mot de passe d\'au moins 8 caractères.';

  @override
  String get forgotPasswordInvalidCode => 'Code invalide ou expiré.';

  @override
  String get forgotPasswordTitle => 'Réinitialiser le mot de passe';

  @override
  String get forgotPasswordEmailHint => 'Adresse e-mail';

  @override
  String get forgotPasswordSendCodeButton =>
      'Envoyer le code de réinitialisation';

  @override
  String get forgotPasswordCodeHint => 'Code à 6 chiffres';

  @override
  String get forgotPasswordNewPasswordHint => 'Nouveau mot de passe';

  @override
  String get forgotPasswordSetNewPasswordButton =>
      'Définir le nouveau mot de passe';

  @override
  String get verifyEmailEnterCodeError =>
      'Saisissez le code à 6 chiffres reçu par e-mail.';

  @override
  String get verifyEmailInvalidCode => 'Code invalide ou expiré.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'Un nouveau code a été envoyé à $email.';
  }

  @override
  String get verifyEmailResendFailed =>
      'Impossible de renvoyer pour le moment.';

  @override
  String get verifyEmailTitle => 'Consultez votre e-mail';

  @override
  String verifyEmailSentCode(String email) {
    return 'Nous avons envoyé un code à 6 chiffres à $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'Vérifier l\'e-mail';

  @override
  String get verifyEmailResendButton => 'Renvoyer le code';

  @override
  String get safetyNumberKeysNotSetUp =>
      'Vos propres clés n\'ont pas encore été configurées.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName n\'a pas encore de trousseau de clés.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'Impossible de calculer le numéro de sécurité : $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName n\'a plus cet appareil.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'Numéro de sécurité avec $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Comparez ce numéro avec $peerName via un autre canal -- en personne, par téléphone, n\'importe où sauf cette conversation. S\'il correspond des deux côtés, vous parlez bien à qui vous pensez parler.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName a $count appareils, chacun avec son propre numéro de sécurité -- en vérifier un ne couvre pas les autres.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Appareil $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Marquer comme vérifié';

  @override
  String get contentFiltersDescription =>
      'Les serveurs peuvent étiqueter des salons avec des labels de contenu. Choisissez comment vous voulez que se comportent les salons étiquetés -- ceci est votre préférence personnelle et n\'affecte jamais ce que voient les autres.';

  @override
  String get contentFiltersLabelAdult => 'Contenu réservé aux adultes';

  @override
  String get contentFiltersLabelSuggestive => 'Suggestif';

  @override
  String get contentFiltersLabelGraphic => 'Médias explicites';

  @override
  String get contentFiltersLabelNudity => 'Nudité non sexuelle';

  @override
  String get contentFiltersDescAdult => 'Contenu sexuellement explicite';

  @override
  String get contentFiltersDescSuggestive =>
      'Contenu suggestif mais non explicite';

  @override
  String get contentFiltersDescGraphic => 'Violence ou gore';

  @override
  String get contentFiltersDescNudity => 'Nudité dans un contexte non sexuel';

  @override
  String get contentFiltersHide => 'Masquer';

  @override
  String get contentFiltersWarn => 'Avertir';

  @override
  String get contentFiltersShow => 'Afficher';

  @override
  String get deviceTestCouldNotGetToken =>
      'Impossible d\'obtenir un jeton de test.';

  @override
  String get deviceTestLabelTest => 'Tester';

  @override
  String get deviceTestLabelRecording => 'Enregistrement...';

  @override
  String get deviceTestLabelPlayingBack => 'Lecture en cours...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'Impossible de démarrer la caméra : $error';
  }

  @override
  String get deviceTestTitle => 'Tester les périphériques';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'Connexion impossible : $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Microphone';

  @override
  String get deviceTestHearYourselfLabel => 'S\'entendre soi-même (avec délai)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Haut-parleur / Sortie';

  @override
  String get deviceTestCameraLabel => 'Caméra';

  @override
  String get deviceTestSystemDefault => 'Par défaut du système';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Parlez, puis écoutez un extrait de ${seconds}s être rejoué';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '${seconds}s';
  }

  @override
  String get deviceTestCameraPreviewOff => 'Aperçu caméra désactivé';

  @override
  String get deviceTestStopCameraButton => 'Arrêter le test de la caméra';

  @override
  String get deviceTestTestCameraButton => 'Tester la caméra';

  @override
  String get deviceTestInputLevelLabel => 'Niveau d\'entrée';

  @override
  String get devicesScreenRemoveConfirmTitle => 'Retirer cet appareil ?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'Il devra se reconnecter, et les messages qui lui seront envoyés pendant qu\'il est retiré ne lui parviendront pas ensuite -- les sessions Double Ratchet ne comblent pas les lacunes rétroactivement.';

  @override
  String get devicesScreenRemoveFailed => 'Impossible de retirer cet appareil.';

  @override
  String get devicesScreenNeverActive => 'Jamais actif';

  @override
  String devicesScreenActiveDate(String date) {
    return 'Actif $date';
  }

  @override
  String get devicesScreenDescription =>
      'Chaque appareil sur lequel vous vous connectez possède sa propre identité de chiffrement -- un message qui vous est envoyé atteint chacun des appareils ci-dessous. Retirez ceux que vous n\'utilisez pas ou ne reconnaissez pas.';

  @override
  String get devicesScreenNoDevicesFound => 'Aucun appareil trouvé.';

  @override
  String get devicesScreenUnknownDevice => 'Appareil inconnu';

  @override
  String get devicesScreenThisDeviceBadge => 'Cet appareil';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Retirer l\'appareil';

  @override
  String get totpSetupInvalidCode => 'Code invalide. Réessayez.';

  @override
  String get totpSetupEnabledMessage =>
      'L\'authentification à deux facteurs est activée.';

  @override
  String get totpSetupScanInstructions =>
      'Scannez ce secret dans votre application d\'authentification (Google Authenticator, 1Password, Authy) :';

  @override
  String get totpSetupCodeHint =>
      'Saisissez le code à 6 chiffres pour confirmer';

  @override
  String get totpSetupVerifyButton => 'Vérifier et activer';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'Appuyer pour parler';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'Appuyez sur une touche pour l\'associer...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Tester les périphériques';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Traitement vocal';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'Suppression du bruit';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Réduit le bruit de fond de votre micro';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Suppression du bruit avancée (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'Suppression du bruit par IA en temps réel, plus puissante que la suppression standard -- la remplace lorsqu’elle est activée';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'Suppression d\'écho';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Empêche votre propre audio de créer un écho';

  @override
  String get voiceVideoSettingsAutoGainTitle => 'Contrôle automatique du gain';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Équilibre automatiquement le volume du micro (normalisation du volume)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'Atténuation automatique';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Baisse le volume des autres participants pendant que vous parlez';

  @override
  String get voiceVideoSettingsHighPassTitle => 'Filtre passe-haut';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Coupe les ronflements basse fréquence (ventilateurs, climatisation, chocs sur le bureau)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle =>
      'Détection du bruit de frappe';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Supprime le cliquetis du clavier capté par votre micro';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Isolation vocale';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Se concentre sur votre voix, en filtrant les autres personnes et bruits environnants';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Boost micro';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Activer le boost';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Gain de préamplification pour un micro faible ou distant -- appliqué avant l\'égaliseur';

  @override
  String get voiceVideoSettingsBandBoost => 'Boost';

  @override
  String get voiceVideoSettingsSectionMicEq => 'Égaliseur micro';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'Activer l\'égaliseur';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Façonne votre micro avant qu\'il n\'atteigne les autres';

  @override
  String get voiceVideoSettingsBandBass => 'Graves';

  @override
  String get voiceVideoSettingsBandMid => 'Médiums';

  @override
  String get voiceVideoSettingsBandTreble => 'Aigus';

  @override
  String get voiceVideoSettingsSectionVad =>
      'Détection d\'activité vocale (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'Activer VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Ne transmet que lorsque vous parlez réellement';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Sensibilité';

  @override
  String get voiceVideoSettingsVadHint =>
      'Plus bas = capte les sons plus doux. Plus haut = seule une parole plus forte déclenche la transmission.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Touche associée';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'Non définie — le micro reste actif tant qu\'il n\'est pas coupé';

  @override
  String get voiceVideoSettingsClearButton => 'Effacer';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Définir la touche';

  @override
  String get voiceVideoSettingsChangeButton => 'Modifier';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'Quand une touche est associée, votre micro ne transmet que lorsque vous maintenez cette touche enfoncée. Ceci est prioritaire sur VOX pendant que vous êtes dans un salon vocal.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Modèle Réactif d\'Avatar Virtuel';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Importez deux images qui s\'échangent lorsque vous parlez. Visible uniquement par vous.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'Silencieux';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'En train de parler';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel =>
      'Seuil de prise de parole';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Plus bas = passe plus facilement à l\'image « en train de parler ».';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'Retirer VARM';

  @override
  String get gifPickerNoGifsFound => 'Aucun GIF trouvé';

  @override
  String get gifPickerSearchHint => 'Rechercher des GIFs...';

  @override
  String get messageSearchHint => 'Rechercher dans ce salon...';

  @override
  String get messageSearchTooltip => 'Rechercher';

  @override
  String get messageSearchInitialHint =>
      'Recherche parmi les messages déjà chargés sur cet appareil -- l\'historique plus ancien est récupéré (et déchiffré localement) au fur et à mesure que vous remontez.';

  @override
  String get messageSearchNoMatches => 'Aucun résultat';

  @override
  String get messageSearchStartOfHistory => 'Début de l\'historique du salon';

  @override
  String get messageSearchFurtherBackButton =>
      'Rechercher plus loin dans l\'historique';

  @override
  String get messageSearchUnknownAuthor => 'Inconnu';
}
