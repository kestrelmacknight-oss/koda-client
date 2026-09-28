// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonCreate => 'Crear';

  @override
  String get commonClose => 'Cerrar';

  @override
  String get commonDone => 'Listo';

  @override
  String get commonDownload => 'Descargar';

  @override
  String get commonDisconnect => 'Desconectar';

  @override
  String get commonNone => 'Ninguno';

  @override
  String get commonJoin => 'Unirse';

  @override
  String get commonDismiss => 'Descartar';

  @override
  String get commonSubmit => 'Enviar';

  @override
  String get commonConfirm => 'Confirmar';

  @override
  String get commonRemove => 'Quitar';

  @override
  String get commonRetry => 'Reintentar';

  @override
  String get commonOk => 'Aceptar';

  @override
  String get commonYes => 'Sí';

  @override
  String get commonNo => 'No';

  @override
  String get commonSearch => 'Buscar';

  @override
  String get commonSettings => 'Configuración';

  @override
  String get commonLoading => 'Cargando...';

  @override
  String get settingsLanguageSection => 'Idioma';

  @override
  String get settingsLanguageTitle => 'Idioma de la aplicación';

  @override
  String get settingsLanguageSystemDefault => 'Predeterminado del sistema';

  @override
  String get settingsLanguageDescription =>
      'Elige el idioma en el que se muestra la interfaz de Koda. Esto es independiente del idioma principal de cualquier servidor o del idioma en el que escribes mensajes.';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get settingsSignOut => 'Cerrar sesión';

  @override
  String get settingsSectionMyAccount => 'Mi cuenta';

  @override
  String get settingsSectionSecurity => 'Seguridad';

  @override
  String get settingsSectionAccessibility => 'Accesibilidad';

  @override
  String get settingsSectionBilling => 'Facturación';

  @override
  String get settingsSectionFamily => 'Familia';

  @override
  String get settingsSectionVoiceVideo => 'Voz y video';

  @override
  String get settingsSectionDesktop => 'Escritorio';

  @override
  String get settingsSectionAbout => 'Acerca de';

  @override
  String get settingsTwoFactorTitle => 'Autenticación de dos factores';

  @override
  String get settingsTwoFactorSubtitle =>
      'Añade una app de autenticación para mayor seguridad';

  @override
  String get settingsLinkedDevicesTitle => 'Dispositivos vinculados';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'Ver y quitar los dispositivos con sesión iniciada en esta cuenta';

  @override
  String get settingsContentFiltersTitle => 'Filtros de contenido';

  @override
  String get settingsContentFiltersSubtitle =>
      'Elige cómo quieres que se muestre el contenido etiquetado';

  @override
  String get settingsDmFriendsOnlyTitle => 'Permitir DM solo de amigos';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Quienes no sean amigos no podrán iniciarte una conversación';

  @override
  String get settingsDmPrivacyError =>
      'No se pudo actualizar la privacidad de mensajes directos.';

  @override
  String get settingsShowVispAvatarTitle => 'Mostrar el avatar de Visp';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Muestra la cara y el estado de Visp en sus diálogos de configuración, eventos y asesoría';

  @override
  String get settingsHighContrastTitle => 'Alto contraste';

  @override
  String get settingsHighContrastSubtitle =>
      'Colores de alto contraste en blanco y negro puros en toda la app -- al cambiar se recarga brevemente la pantalla actual.';

  @override
  String get settingsDyslexiaFontTitle => 'Fuente para dislexia';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Cambia el texto del cuerpo a OpenDyslexic en toda la app';

  @override
  String get settingsFontSizeTitle => 'Tamaño de fuente';

  @override
  String get settingsFontSizeSample =>
      'El veloz murciélago hindú comía feliz cardillo y kiwi';

  @override
  String get settingsDensityTitle => 'Densidad';

  @override
  String get settingsDensityDescription =>
      'Afecta el espaciado de los controles estándar -- botones, interruptores, diálogos -- no todos los diseños personalizados.';

  @override
  String get settingsDensityCompact => 'Compacta';

  @override
  String get settingsDensityStandard => 'Estándar';

  @override
  String get settingsDensityComfortable => 'Cómoda';

  @override
  String get settingsStreamingTitle => 'Cuentas de streaming';

  @override
  String get settingsStreamingDescription =>
      'Conecta Twitch/YouTube para que los servidores donde tengas el permiso \"Anunciar en vivo\" publiquen automáticamente cuando salgas en vivo o subas un video nuevo.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform conectado como $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform no conectado';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- en vivo ahora';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- nueva subida';

  @override
  String get settingsStreamingConnecting => 'Conectando...';

  @override
  String get settingsStreamingConnect => 'Conectar';

  @override
  String get settingsAnnounceLiveTwitch => 'Anunciar cuando salga en vivo';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Anunciar transmisiones en vivo y subidas nuevas';

  @override
  String get settingsRefreshStatus =>
      '¿Ya conectaste desde el navegador? Actualiza el estado';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'No se pudo iniciar la conexión con $platform.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Termina de conectar en tu navegador y luego vuelve y actualiza.';

  @override
  String get settingsThroneTitle => 'Webhook de Throne';

  @override
  String get settingsThroneDescription =>
      'Pega esta URL en la configuración del webhook de Throne.com para recibir notificaciones en Koda cada vez que alguien te envíe un regalo.';

  @override
  String get settingsThroneGetUrl => 'Obtener mi URL de webhook';

  @override
  String get settingsThroneCopyTooltip => 'Copiar';

  @override
  String get settingsThroneCopiedToast => 'Copiado al portapapeles';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Regenerar (invalida la URL anterior)';

  @override
  String get settingsThroneRegenerateConfirmTitle =>
      '¿Regenerar la URL del webhook?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'Tu URL anterior dejará de funcionar, así que actualízala luego en Throne.com.';

  @override
  String get settingsThroneRegenerate => 'Regenerar';

  @override
  String get settingsUploadPhoto => 'Subir foto';

  @override
  String get settingsOrPasteUrl => 'o pega una URL abajo';

  @override
  String get settingsAvatarUrlHint => 'https://ejemplo.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'Subir imágenes requiere Cloudflare R2 — pegar una URL siempre funciona.';

  @override
  String get settingsDisplayNameLabel => 'NOMBRE VISIBLE';

  @override
  String get settingsDisplayNameHint => 'Nombre visible';

  @override
  String get settingsBioLabel => 'BIOGRAFÍA';

  @override
  String get settingsBioHint => 'Cuéntale a la gente un poco sobre ti';

  @override
  String get settingsPronounsLabel => 'PRONOMBRES';

  @override
  String get settingsPronounsHint => 'p. ej. elle';

  @override
  String get settingsShowPronounsTitle => 'Mostrar mis pronombres a otros';

  @override
  String get settingsShowPronounsSubtitle =>
      'Se muestran junto a tu nombre en el chat, listas de miembros y voz';

  @override
  String get settingsStatusLabel => 'ESTADO';

  @override
  String get statusOnline => 'En línea';

  @override
  String get statusAway => 'Ausente';

  @override
  String get statusDnd => 'No molestar';

  @override
  String get statusInvisible => 'Invisible';

  @override
  String get settingsFamilyNotAvailable =>
      'Los controles parentales no están disponibles en una cuenta supervisada.';

  @override
  String get settingsAboutTitle => 'Acerca de Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Términos y condiciones';

  @override
  String get settingsPrivacyTitle => 'Política de privacidad';

  @override
  String get settingsSupportTitle => 'Soporte';

  @override
  String get settingsReportSecurityTitle => 'Reportar un problema de seguridad';

  @override
  String get settingsDesktopNotAvailable =>
      'Estas son configuraciones exclusivas de escritorio -- esta plataforma no tiene ventana ni bandeja del sistema.';

  @override
  String get settingsCloseToTrayTitle => 'Minimizar a la bandeja del sistema';

  @override
  String get settingsCloseToTraySubtitle =>
      'Cerrar la ventana mantiene Koda funcionando en segundo plano para que sigas recibiendo notificaciones -- desactívalo para que cerrar la ventana cierre la app de verdad.';

  @override
  String get authErrorEmailPasswordRequired =>
      'Se requieren correo y contraseña.';

  @override
  String get authErrorIncorrectCredentials =>
      'Correo o contraseña incorrectos.';

  @override
  String get authErrorMustAcceptTerms =>
      'Por favor acepta los Términos y condiciones.';

  @override
  String get authErrorAllFieldsRequired => 'Todos los campos son obligatorios.';

  @override
  String get authErrorPasswordsDontMatch => 'Las contraseñas no coinciden.';

  @override
  String get authErrorPasswordTooShort =>
      'La contraseña debe tener al menos 8 caracteres.';

  @override
  String get authErrorRegistrationFailed =>
      'El registro falló. Es posible que ese correo ya esté en uso.';

  @override
  String get authTabSignIn => 'Iniciar sesión';

  @override
  String get authTabCreateAccount => 'Crear cuenta';

  @override
  String get authAgreementPrefix => 'Al usar Koda aceptas nuestros ';

  @override
  String get authTermsLink => 'Términos y condiciones';

  @override
  String get authAgreementMiddle => ' y nuestra ';

  @override
  String get authPrivacyLink => 'Política de privacidad';

  @override
  String get authAgreementSuffix => '.';

  @override
  String get authEmailHint => 'Correo electrónico';

  @override
  String get authPasswordHint => 'Contraseña';

  @override
  String get authForgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get authSignInButton => 'Iniciar sesión';

  @override
  String get authUsernameHint => 'Nombre de usuario';

  @override
  String get authConfirmPasswordHint => 'Confirmar contraseña';

  @override
  String get authAgreeToTerms =>
      'Acepto los Términos y condiciones y la Política de privacidad';

  @override
  String get authCreateAccountButton => 'Crear cuenta';

  @override
  String get dmSafetyNumberChangedWarning =>
      'El número de seguridad de esta conversación cambió -- verifícalo antes de enviar.';

  @override
  String get dmMessageNotSent => 'Mensaje no enviado.';

  @override
  String dmEncryptMessageError(String error) {
    return 'No se pudo cifrar el mensaje: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'Error al subir el archivo adjunto.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'No se pudo cifrar el archivo adjunto: $error';
  }

  @override
  String get dmReportMessage => 'Reportar mensaje';

  @override
  String get dmReportSubmitted => 'Reporte enviado.';

  @override
  String get dmTitle => 'Mensajes';

  @override
  String get dmNewMessage => 'Nuevo mensaje';

  @override
  String get dmNoConversationsYet => 'Aún no hay conversaciones';

  @override
  String get dmSelectConversation => 'Selecciona una conversación';

  @override
  String get dmVerifySafetyNumberTooltip => 'Verificar número de seguridad';

  @override
  String get dmSeenLabel => 'Visto';

  @override
  String get dmMessageActionsTooltip => 'Acciones del mensaje';

  @override
  String get dmRemoveAttachmentTooltip => 'Quitar archivo adjunto';

  @override
  String get dmAttachFileTooltip => 'Adjuntar archivo';

  @override
  String get dmMessageHint => 'Mensaje...';

  @override
  String get dmSendMessageTooltip => 'Enviar mensaje';

  @override
  String get dmNoFriendsYet =>
      'Aún no tienes amigos.\nEnvía una solicitud de amistad para empezar.';

  @override
  String get dmUnfriendTooltip => 'Eliminar amistad';

  @override
  String get dmNoPendingRequests => 'No hay solicitudes de amistad pendientes.';

  @override
  String get dmIncomingRequestsLabel => 'RECIBIDAS';

  @override
  String get dmSentRequestsLabel => 'ENVIADAS';

  @override
  String get dmAcceptTooltip => 'Aceptar';

  @override
  String get dmDeclineTooltip => 'Rechazar';

  @override
  String get dmPendingLabel => 'Pendiente';

  @override
  String get dmNewMessageDialogTitle => 'Nuevo mensaje';

  @override
  String get dmEnterUsernameHint => 'Ingresa un nombre de usuario';

  @override
  String get dmOpenButton => 'Abrir';

  @override
  String dmSavedAttachment(String fileName) {
    return 'Se guardó $fileName';
  }

  @override
  String get dmUnknownUser => 'Desconocido';

  @override
  String get dmEndToEndEncryptedTooltip => 'Cifrado de extremo a extremo';

  @override
  String get homeContentWarningTitle => 'Advertencia de contenido';

  @override
  String homeContentWarningBody(String labels) {
    return 'Este canal está marcado por: $labels.\n\nCambia esto en Configuración > Seguridad > Filtros de contenido.';
  }

  @override
  String get homeViewAnyway => 'Ver de todos modos';

  @override
  String get homeCouldNotConnectVoice => 'No se pudo conectar a voz.';

  @override
  String get homeCreateServer => 'Crear servidor';

  @override
  String get homeJoinServer => 'Unirse a un servidor';

  @override
  String get homeRedeemCode => 'Canjear código';

  @override
  String get homeJoinServerDialogTitle => 'Unirse a un servidor';

  @override
  String get homeEnterInviteCode => 'Ingresa un código o URL de invitación:';

  @override
  String get homeInviteCodeHint => 'p. ej. XK9MP2';

  @override
  String get homeJoined => '¡Te uniste!';

  @override
  String get homeInvalidInvite => 'Código de invitación inválido o vencido.';

  @override
  String get homeJoinButton => 'Unirse';

  @override
  String get homeRedeemCodeDialogTitle => 'Canjear código';

  @override
  String get homeEnterBackerCode =>
      'Ingresa tu código de patrocinador o recompensa:';

  @override
  String get homeRewardCodeHint => 'Código de recompensa';

  @override
  String get homeCodeRedeemed =>
      '¡Código canjeado! Tus recompensas fueron aplicadas.';

  @override
  String get homeInvalidRedeemCode => 'Código inválido, vencido o ya canjeado.';

  @override
  String get homeRedeemButton => 'Canjear';

  @override
  String get homeAreFriends => 'Son amigos';

  @override
  String get homeAddFriend => 'Agregar amigo';

  @override
  String homeFriendRequestSent(String username) {
    return '¡Solicitud de amistad enviada a $username!';
  }

  @override
  String get homeMessageButton => 'Mensaje';

  @override
  String get homeSendTip => 'Enviar propina';

  @override
  String get homeSwitchToServer => 'Cambiar a este servidor';

  @override
  String get homeInvitePeople => 'Invitar personas';

  @override
  String get homeServerSettingsMenuItem => 'Configuración del servidor';

  @override
  String get homeLeaveServerMenuItem => 'Abandonar servidor';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return '¿Abandonar $serverName? Podrás volver a unirte con una invitación.';
  }

  @override
  String get homeLeaveButton => 'Abandonar';

  @override
  String get homeCreateAServer => 'Crear un servidor';

  @override
  String get homeServerNameHint => 'Nombre del servidor';

  @override
  String get homeDescribeToVisp => 'Descríbelo a Visp en su lugar';

  @override
  String get homeMarkAsRead => 'Marcar como leído';

  @override
  String get homeEditChannel => 'Editar canal';

  @override
  String get homeDeleteChannel => 'Eliminar canal';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return '¿Eliminar #$channelName? Esto no se puede deshacer.';
  }

  @override
  String get homeDeleteButton => 'Eliminar';

  @override
  String get homeCreateChannelHere => 'Crear canal aquí';

  @override
  String get homeEditCategory => 'Editar categoría';

  @override
  String get homeDeleteCategory => 'Eliminar categoría';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return '¿Eliminar \"$categoryName\"? Los canales dentro quedarán sin categoría.';
  }

  @override
  String get homeReplyAction => 'Responder';

  @override
  String get homeCreateThreadAction => 'Crear hilo';

  @override
  String get homeEditMessageAction => 'Editar mensaje';

  @override
  String get homeDeleteMessageAction => 'Eliminar mensaje';

  @override
  String get homePinMessageAction => 'Fijar mensaje';

  @override
  String get homeUnpinMessageAction => 'Desfijar mensaje';

  @override
  String get homeReportMessageAction => 'Reportar mensaje';

  @override
  String get homeReportSubmitted => 'Reporte enviado.';

  @override
  String get homeAddReactionTitle => 'Agregar reacción';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hilos',
      one: '$count hilo',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'Opciones de categoría';

  @override
  String get homeChannelOptionsTooltip => 'Opciones de canal';

  @override
  String get homeOpenVoiceChatTooltip => 'Abrir chat';

  @override
  String get homeMarketplaceLabel => 'Mercado';

  @override
  String get homeSelectChannelPrompt => 'Selecciona un canal';

  @override
  String get homeSearchTooltip => 'Buscar';

  @override
  String get homePinnedMessagesTooltip => 'Mensajes fijados';

  @override
  String get homeWaitingForKey =>
      'Esperando a que llegue la clave de cifrado...';

  @override
  String get homeUnableToDecrypt => 'No se pudo descifrar este mensaje.';

  @override
  String get homeMessageActionsTooltip => 'Acciones del mensaje';

  @override
  String get homeCancelReplyTooltip => 'Cancelar respuesta';

  @override
  String get homeRemoveAttachmentTooltip => 'Quitar archivo adjunto';

  @override
  String get homeAttachFileTooltip => 'Adjuntar archivo';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'Mensaje #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'Enviar mensaje';

  @override
  String get homeEditMessageTitle => 'Editar mensaje';

  @override
  String get homeMessageLabel => 'Mensaje';

  @override
  String get homePinnedMessagesTitle => 'Mensajes fijados';

  @override
  String get homeNoPinnedMessages => 'No hay mensajes fijados';

  @override
  String get homeUnpinTooltip => 'Desfijar';

  @override
  String get homeCreateThreadTitle => 'Crear hilo';

  @override
  String get homeThreadNameHint => 'Nombre del hilo';

  @override
  String homeThreadCreated(String name) {
    return '¡Se creó el hilo \"$name\"!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Crear o unirse';

  @override
  String get homeKodaMarketplaceTooltip => 'Mercado de Koda';

  @override
  String get homeAdminPanelTooltip => 'Panel de administración';

  @override
  String get homeServerSettingsTooltip => 'Configuración del servidor';

  @override
  String get homeSettingsTooltip => 'Configuración';

  @override
  String get homeContentWarningBadge => 'Advertencia de contenido';

  @override
  String get homeDirectMessagesTooltip => 'Mensajes directos';

  @override
  String homeReplyingTo(String username) {
    return 'Respondiendo a $username';
  }

  @override
  String get homeAttachmentFallback => 'Archivo adjunto';

  @override
  String serverConnectError(String service) {
    return 'No se pudo iniciar la conexión con $service.';
  }

  @override
  String get serverDisconnectPrintfulTitle => '¿Desconectar Printful?';

  @override
  String get serverDisconnectPrintfulBody =>
      'Este servidor ya no podrá surtir pedidos de mercancía hasta que se reconecte.';

  @override
  String get serverDisconnectTiltifyTitle => '¿Desconectar Tiltify?';

  @override
  String get serverDisconnectTiltifyBody =>
      'Este servidor dejará de mostrar el progreso de su campaña benéfica hasta que se reconecte.';

  @override
  String get serverNewRoleTitle => 'Nuevo rol';

  @override
  String get serverEditRoleTitle => 'Editar rol';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Color $hex';
  }

  @override
  String get permViewChannels => 'Ver canales';

  @override
  String get permSendMessages => 'Enviar mensajes';

  @override
  String get permConnectVoice => 'Conectarse a voz';

  @override
  String get permManageServer => 'Administrar servidor';

  @override
  String get permManageChannels => 'Administrar canales';

  @override
  String get permManageRoles => 'Administrar roles';

  @override
  String get permManageMessages => 'Administrar mensajes';

  @override
  String get permKickMembers => 'Expulsar miembros';

  @override
  String get permBanMembers => 'Vetar miembros';

  @override
  String get permMuteMembers => 'Silenciar miembros';

  @override
  String get permMentionEveryone => 'Mencionar a @everyone';

  @override
  String get permManageMarketplace => 'Administrar mercado';

  @override
  String get permAnnounceLive => 'Anunciar en vivo';

  @override
  String get permMoveMembers => 'Mover miembros (voz)';

  @override
  String get serverRoleNameHint => 'Nombre del rol';

  @override
  String get serverColorLabel => 'Color';

  @override
  String get serverPermissionsLabel => 'Permisos';

  @override
  String get serverSelfAssignableTitle => 'Autoasignable';

  @override
  String get serverSelfAssignableSubtitle =>
      'Los miembros pueden asignarse este rol ellos mismos';

  @override
  String get serverDefaultRoleUndeletable =>
      'El rol predeterminado no se puede eliminar.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return '¿Eliminar el rol \"$roleName\"?';
  }

  @override
  String get serverCouldNotDeleteRole => 'No se pudo eliminar ese rol.';

  @override
  String get serverMemberFallback => 'Miembro';

  @override
  String get serverNoRolesYet => 'Aún no hay roles.';

  @override
  String get serverRefreshStatus =>
      '¿Ya conectaste desde el navegador? Actualiza el estado';

  @override
  String get serverPrintfulConnected => 'Printful conectado';

  @override
  String get serverPrintfulNotConnected => 'Printful no conectado';

  @override
  String get serverPrintfulDescription =>
      'Conecta la cuenta de Printful de este servidor para surtir pedidos de mercancía hechos a través de Koda. Cada servidor conecta su propia tienda.';

  @override
  String get serverConnecting => 'Conectando...';

  @override
  String get serverConnectPrintful => 'Conectar Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify conectado';

  @override
  String get serverTiltifyNotConnected => 'Tiltify no conectado';

  @override
  String get serverTiltifyDescription =>
      'Conecta la cuenta de Tiltify de este servidor para mostrar el progreso en vivo de una campaña benéfica a todos los miembros. Solo lectura -- Koda nunca publica ni cambia nada del lado de Tiltify.';

  @override
  String get serverConnectTiltify => 'Conectar Tiltify';

  @override
  String get serverNoTiltifyCampaigns =>
      'No se encontraron campañas en esta cuenta de Tiltify.';

  @override
  String get serverPickCampaign => 'Elige qué campaña mostrar';

  @override
  String get serverUntitledCampaign => 'Campaña sin título';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '$currency $raised recaudados de una meta de $goal';
  }

  @override
  String get serverViewCampaign => 'Ver campaña';

  @override
  String get serverRefreshButton => 'Actualizar';

  @override
  String get serverUploadButton => 'Subir';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '$used / $limit espacios usados -- nivel de impulso $level';
  }

  @override
  String get serverNoCustomEmoji => 'Aún no hay emojis personalizados.';

  @override
  String get serverDeleteEmojiTooltip => 'Eliminar emoji';

  @override
  String get serverUploadEmojiTitle => 'Subir emoji';

  @override
  String get serverEmojiNameHint => 'nombre (letras, números, _)';

  @override
  String get serverChooseImage => 'Elegir imagen';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Nivel de impulso actual: $level';
  }

  @override
  String get serverBackgroundTitle => 'Fondo del servidor';

  @override
  String get serverBackgroundDescription =>
      'Un fondo personalizado que se muestra detrás de la vista de canales a todos en este servidor.';

  @override
  String get serverBackgroundLockedHint =>
      'Alcanza el nivel de impulso 4 para desbloquear un fondo personalizado.';

  @override
  String get serverIconBorderTitle => 'Borde del ícono del servidor';

  @override
  String get serverIconBorderDescription =>
      'Un borde de acento alrededor del ícono de este servidor en la lista de servidores de cada miembro.';

  @override
  String get serverIconBorderLockedHint =>
      'Alcanza el nivel de impulso 5 para desbloquear un borde de ícono personalizado.';

  @override
  String get serverBoostFromBank =>
      'Impulsa este servidor desde el Banco del Servidor en el Mercado para subir su nivel.';

  @override
  String get serverMarketplaceListingLabel => 'LISTADO EN EL MERCADO';

  @override
  String get serverListInMarketplace => 'Listar en el Mercado de Koda';

  @override
  String get serverListInMarketplaceDescription =>
      'Incluye este servidor en la pestaña de Descubrir de toda la plataforma, con posibilidad de aparecer en la rotación semanal destacada. Es independiente de la posibilidad general de unirse al servidor.';

  @override
  String get serverSocialLinkLabel =>
      'Enlace social o de invitación (opcional)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Guardar enlace';

  @override
  String get serverPricingLabel => 'PRECIOS';

  @override
  String get serverPrimaryCurrencyLabel => 'Moneda principal';

  @override
  String get serverPrimaryCurrencyDescription =>
      'Se aplica a los niveles de suscripción del servidor y a los precios de bienes digitales que configures para este servidor.';

  @override
  String get serverPrimaryLanguageLabel => 'Idioma principal';

  @override
  String get serverPrimaryLanguageDescription =>
      'Los mensajes que los miembros publiquen en otro idioma reciben una pequeña insignia de idioma, comparada con esta configuración.';

  @override
  String get serverMarketplaceLinkSaved => 'Enlace del mercado guardado.';

  @override
  String get serverIconUpdated => '¡Ícono del servidor actualizado!';

  @override
  String get serverTemplateImported => '¡Plantilla importada!';

  @override
  String get serverImportFromDiscord => 'Importar desde Discord';

  @override
  String get serverVispPlanLive => '¡El plan de Visp está listo!';

  @override
  String get serverAskVisp => 'Preguntarle a Visp';

  @override
  String get serverAddCategoryButton => 'Agregar categoría';

  @override
  String get serverAddChannelHereTooltip => 'Agregar canal aquí';

  @override
  String get serverRename => 'Renombrar';

  @override
  String get serverUncategorized => 'SIN CATEGORÍA';

  @override
  String get serverAddChannel => 'Agregar canal';

  @override
  String get serverEditRulesContent => 'Editar contenido de las reglas';

  @override
  String get serverRulesContentHint =>
      'Escribe aquí las reglas de tu servidor...';

  @override
  String get serverRulesUpdated => '¡Reglas actualizadas!';

  @override
  String get serverAddRole => 'Agregar rol';

  @override
  String get serverDefaultRoleLabel => 'Rol predeterminado';

  @override
  String get serverManageRolesTooltip => 'Administrar roles';

  @override
  String get serverMutedLabel => 'Silenciado';

  @override
  String get serverExpandedLabel => 'expandido';

  @override
  String get serverCollapsedLabel => 'contraído';

  @override
  String get serverUnmute => 'Reactivar sonido';

  @override
  String get serverMute => 'Silenciar';

  @override
  String get serverKick => 'Expulsar';

  @override
  String get serverBan => 'Vetar';

  @override
  String serverBannedUsersLabel(int count) {
    return 'USUARIOS VETADOS — $count';
  }

  @override
  String get serverNoBannedUsers => 'No hay usuarios vetados.';

  @override
  String get serverUnban => 'Quitar veto';

  @override
  String get serverMemberFallbackGeneric => 'este miembro';

  @override
  String serverBanConfirm(String username, String serverName) {
    return '¿Vetar a $username de $serverName? No podrá volver a unirse a menos que se le quite el veto.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return '¿Expulsar a $username de $serverName? Podrá volver a unirse con una invitación.';
  }

  @override
  String get serverMuteDuration60Sec => '60 segundos';

  @override
  String get serverMuteDuration5Min => '5 minutos';

  @override
  String get serverMuteDuration10Min => '10 minutos';

  @override
  String get serverMuteDuration1Hour => '1 hora';

  @override
  String get serverMuteDuration1Day => '1 día';

  @override
  String get serverMuteDuration1Week => '1 semana';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'No se pudo $action a $username.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return 'Silenciar a $username';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'No se pudo silenciar a $username.';
  }

  @override
  String get serverUnlockInvites => 'Desbloquear invitaciones';

  @override
  String get serverInvitesUnlocked => 'Invitaciones desbloqueadas.';

  @override
  String get serverAuditLogDescription =>
      'Actividad de moderación de Nivel 1 -- expulsiones, vetos, silencios y protección automática contra inundación de mensajes/incursiones. Solo metadatos; nunca contenido de mensajes.';

  @override
  String get serverSystemActor => 'Sistema';

  @override
  String get serverActionKicked => 'expulsó a';

  @override
  String get serverActionBanned => 'vetó a';

  @override
  String get serverActionUnbanned => 'quitó el veto a';

  @override
  String get serverActionMuted => 'silenció a';

  @override
  String get serverActionUnmuted => 'reactivó el sonido de';

  @override
  String get serverActionFloodDetected =>
      'silenciado automáticamente por inundación de mensajes';

  @override
  String get serverActionRaidLockdownEnabled =>
      'bloqueó las invitaciones (protección contra incursiones)';

  @override
  String get serverActionRaidLockdownDisabled => 'desbloqueó las invitaciones';

  @override
  String get serverActionMoved => 'movió a';

  @override
  String get serverUnknownAction => 'acción desconocida';

  @override
  String get serverNoModerationActivity =>
      'Aún no hay actividad de moderación.';

  @override
  String get serverReportsDescription =>
      'Mensajes reportados por miembros de este servidor -- la propia copia ya descifrada del reportante, revelada al hacer el reporte.';

  @override
  String get serverNoPendingReports => 'No hay reportes pendientes.';

  @override
  String get serverReportReasonOther => 'otro';

  @override
  String get serverReportStatusActioned => 'Resuelto';

  @override
  String get serverReportStatusDismissed => 'Descartado';

  @override
  String get serverResolvedLabel => 'RESUELTOS';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'Reportado por $reporter -- enviado por $target';
  }

  @override
  String serverReportNote(String note) {
    return 'Nota: $note';
  }

  @override
  String get serverDismissButton => 'Descartar';

  @override
  String get serverMarkActioned => 'Marcar como resuelto';

  @override
  String get serverCreateInvite => 'Crear invitación';

  @override
  String get serverInviteCreatedTitle => 'Invitación creada';

  @override
  String get serverNoActiveInvites => 'No hay invitaciones activas';

  @override
  String serverUsesLabel(String uses) {
    return 'Usos: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Eliminar invitación';

  @override
  String get serverChangeIconLabel => 'Cambiar ícono del servidor';

  @override
  String get serverFallbackName => 'Servidor';

  @override
  String serverSettingsTitle(String serverName) {
    return 'Configuración de $serverName';
  }

  @override
  String get serverTabChannels => 'Canales';

  @override
  String get serverTabRoles => 'Roles';

  @override
  String get serverTabMembers => 'Miembros';

  @override
  String get serverTabInvites => 'Invitaciones';

  @override
  String get serverTabMerch => 'Mercancía';

  @override
  String get serverTabEmoji => 'Emojis';

  @override
  String get serverTabCustomize => 'Personalizar';

  @override
  String get serverTabAuditLog => 'Registro de auditoría';

  @override
  String get serverTabReports => 'Reportes';

  @override
  String get serverTabThresholdMod => 'Moderación por umbral';

  @override
  String get serverTabCharity => 'Beneficencia';

  @override
  String get homeCustomEmojiFallback => 'emoji personalizado';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reacciones',
      one: '$count reacción',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted => ', reaccionaste, actívalo para quitarla';

  @override
  String get homeReactionActivateToAdd => ', actívalo para agregarla';

  @override
  String get homeAddReactionLabel => 'Agregar reacción';

  @override
  String homeViewProfile(String username) {
    return 'Ver el perfil de $username';
  }

  @override
  String get homeMoveToVoiceChannel => 'Mover a canal de voz…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Elige un canal de voz';

  @override
  String get homeNoOtherVoiceChannels => 'No hay otros canales de voz';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username ahora está en $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'No se pudo mover a $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'Ahora estás en $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'Únete a $channel para hablar';
  }

  @override
  String get adminPanelTitle => 'Panel de Administración';

  @override
  String get adminTabBackerCodes => 'Códigos de Patrocinador';

  @override
  String get adminTabUsers => 'Usuarios';

  @override
  String get adminTabDmReports => 'Reportes de MD';

  @override
  String get adminTabSpamFlags => 'Marcas de Spam';

  @override
  String get adminTabWiki => 'Wiki';

  @override
  String get adminTabBoosts => 'Impulsos';

  @override
  String get adminCreateBackerCodeTitle => 'Crear Código de Patrocinador';

  @override
  String get adminCodeHint =>
      'Código (deja en blanco para generar automáticamente)';

  @override
  String get adminNoteHint => 'Nota (p. ej. \"Kickstarter Nivel 2\")';

  @override
  String get adminFlagsJsonHint =>
      'Marcas como JSON, p. ej. \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint => 'Usos máximos (deja en blanco = ilimitado)';

  @override
  String get adminCodeCreatedTitle => 'Código Creado';

  @override
  String get adminCodeLabel => 'Código:';

  @override
  String get adminCopyCodeTooltip => 'Copiar código';

  @override
  String adminFlagsValue(String flags) {
    return 'Marcas: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Códigos de Patrocinador y Recompensa';

  @override
  String get adminNewCodeButton => 'Nuevo Código';

  @override
  String get adminNoCodesYet => 'Aún no hay códigos';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses usos';
  }

  @override
  String get adminSearchUsersHint => 'Buscar usuarios por nombre de usuario...';

  @override
  String get adminSearchUsersPrompt => 'Busca un usuario arriba';

  @override
  String get adminNoDmReports => 'No hay reportes de MD.';

  @override
  String get adminResolvedLabel => 'RESUELTO';

  @override
  String get adminReasonOther => 'otro';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Denunciante: $reporterId\nRemitente revelado: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Nota: $note';
  }

  @override
  String get adminDismissButton => 'Descartar';

  @override
  String get adminMarkActionedButton => 'Marcar Actuado';

  @override
  String get adminStatusActioned => 'Actuado';

  @override
  String get adminStatusDismissed => 'Descartado';

  @override
  String get adminNoSpamFlags => 'No hay marcas de spam.';

  @override
  String get adminFlagMassDmSpam => 'Spam de MD masivos';

  @override
  String get adminFlagRaidLockdown => 'Bloqueo por invasión';

  @override
  String get adminFlagBotBehavior => 'Comportamiento tipo bot';

  @override
  String get adminFlagChannelFlooding => 'Inundación de canal';

  @override
  String get adminAutoEscalatedBadge => 'AUTOESCALADO';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Confianza: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'Usuario: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Servidor: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount de $totalJoiners recién llegados aún silenciados';
  }

  @override
  String get adminNoJoinersMuted =>
      'No hay recién llegados silenciados actualmente';

  @override
  String adminRestrictedUntil(String until) {
    return 'Actualmente restringido hasta $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'No restringido actualmente';

  @override
  String get adminDismissUndoButton => 'Descartar y Deshacer';

  @override
  String get adminConfirmRestrictButton => 'Confirmar y Restringir';

  @override
  String get adminDeleteArticleTitle => '¿Eliminar artículo?';

  @override
  String adminDeleteArticleBody(String title) {
    return '\"$title\" se eliminará de la base de conocimientos de Visp.';
  }

  @override
  String get adminNewArticleTitle => 'Nuevo Artículo';

  @override
  String get adminEditArticleTitle => 'Editar Artículo';

  @override
  String get adminArticleTitleHint => 'Título';

  @override
  String get adminArticleContentHint => 'Contenido del artículo (markdown)';

  @override
  String get adminWikiArticlesHeader => 'Artículos de la Wiki';

  @override
  String get adminNoArticlesYet => 'Aún no hay artículos';

  @override
  String get adminEditArticleTooltip => 'Editar artículo';

  @override
  String get adminDeleteArticleTooltip => 'Eliminar artículo';

  @override
  String get adminSearchServersHint => 'Buscar servidores por nombre...';

  @override
  String get adminSearchServersPrompt => 'Busca un servidor arriba';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'Otorgar impulsos a $serverName';
  }

  @override
  String get adminNumBoostsHint => 'Número de impulsos';

  @override
  String get adminGrantButton => 'Otorgar';

  @override
  String get adminPositiveNumberError => 'Introduce un número entero positivo.';

  @override
  String get adminGrantBoostsFailed => 'No se pudieron otorgar los impulsos.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Se otorgaron $count impulsos a $serverName -- ahora nivel $level ($activeCount activos).',
      one:
          'Se otorgó $count impulso a $serverName -- ahora nivel $level ($activeCount activos).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count miembros';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Otorgar Impulsos';

  @override
  String get parentalDashboardTitle => 'Familia';

  @override
  String get parentalDashboardCreateChildTitle => 'Crear Cuenta Infantil';

  @override
  String get parentalDashboardUsernameHint => 'Nombre de usuario';

  @override
  String get parentalDashboardEmailHint => 'Correo electrónico';

  @override
  String get parentalDashboardPasswordHint => 'Contraseña';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'Esto crea una cuenta totalmente supervisada: los canales etiquetados se bloquean, y podrás establecer horarios permitidos y ver (pero no leer) sus amigos y servidores.';

  @override
  String get parentalDashboardValidationError =>
      'Se requieren nombre de usuario, correo electrónico y una contraseña de 8 o más caracteres.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'No se pudo crear la cuenta infantil -- el nombre de usuario o el correo puede que ya estén en uso.';

  @override
  String get parentalDashboardCreatingLabel => 'Creando...';

  @override
  String get parentalDashboardNoChildren => 'Aún no hay cuentas vinculadas.';

  @override
  String get parentalDashboardSupervisedLabel => 'Cuenta supervisada';

  @override
  String get parentalDashboardUnknownUser => 'Desconocido';

  @override
  String get childDetailFallbackTitle => 'Cuenta infantil';

  @override
  String get childDetailTabFriends => 'Amigos';

  @override
  String get childDetailTabServers => 'Servidores';

  @override
  String get childDetailTabSchedule => 'Horario';

  @override
  String get childDetailTabOverride => 'Anulación';

  @override
  String get childDetailNoFriends => 'No hay amigos.';

  @override
  String get childDetailUnknownUser => 'Desconocido';

  @override
  String get childDetailRemoveFriendTooltip => 'Eliminar amigo';

  @override
  String get childDetailNoServers => 'No está en ningún servidor.';

  @override
  String childDetailMemberCount(int count) {
    return '$count miembros';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Eliminar del servidor';

  @override
  String get childDetailRestrictAccessTitle =>
      'Restringir el acceso a horarios establecidos';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Desactivado significa acceso sin restricciones en cualquier momento';

  @override
  String get childDetailTimezoneLabel => 'Zona horaria';

  @override
  String get childDetailMonday => 'Lunes';

  @override
  String get childDetailTuesday => 'Martes';

  @override
  String get childDetailWednesday => 'Miércoles';

  @override
  String get childDetailThursday => 'Jueves';

  @override
  String get childDetailFriday => 'Viernes';

  @override
  String get childDetailSaturday => 'Sábado';

  @override
  String get childDetailSunday => 'Domingo';

  @override
  String get childDetailNoAccessLabel => 'Sin acceso';

  @override
  String get childDetailToLabel => 'a';

  @override
  String get childDetailSavingLabel => 'Guardando...';

  @override
  String get childDetailSaveScheduleButton => 'Guardar Horario';

  @override
  String get childDetailScheduleSaved => 'Horario guardado.';

  @override
  String get childDetailOverrideExplanation =>
      'Concede acceso temporal fuera del horario normal -- útil para una excepción puntual sin cambiar el horario semanal.';

  @override
  String get childDetailReasonHint => 'Motivo (opcional)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes min';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+${hours}h';
  }

  @override
  String get childDetailRevokeOverrideButton => 'Revocar Anulación Activa';

  @override
  String get childDetailAccessGranted => 'Acceso temporal concedido.';

  @override
  String get childDetailOverrideRevoked => 'Anulación revocada.';

  @override
  String get digitalGoodsTitle => 'Bienes Digitales';

  @override
  String get digitalGoodsMyProductsTitle => 'Mis Productos';

  @override
  String get digitalGoodsManageProductsTooltip =>
      'Gestionar los productos de este servidor';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Cambiar a Explorar';

  @override
  String get digitalGoodsCreateProductTooltip => 'Crear producto';

  @override
  String get digitalGoodsBrowseTab => 'Explorar';

  @override
  String get digitalGoodsMyListingsTab => 'Mis Publicaciones';

  @override
  String get digitalGoodsMyPurchasesTab => 'Mis Compras';

  @override
  String get digitalGoodsNoProductsYet => 'Aún no hay productos';

  @override
  String get digitalGoodsNoProductsAvailable => 'No hay productos disponibles';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Crea tu primer producto para empezar a vender';

  @override
  String get digitalGoodsCheckBackLater =>
      'Vuelve más tarde para ver bienes digitales';

  @override
  String get digitalGoodsCreateProductButton => 'Crear Producto';

  @override
  String get digitalGoodsLicenseKeyBadge => 'Clave de Licencia';

  @override
  String get digitalGoodsFileBadge => 'Archivo';

  @override
  String get digitalGoodsAllServersBadge => 'Todos los Servidores';

  @override
  String get digitalGoodsFreeForYou => 'Gratis para ti';

  @override
  String get digitalGoodsFreeLabel => 'Gratis';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count vendidos';
  }

  @override
  String get digitalGoodsKeysButton => 'Claves';

  @override
  String get digitalGoodsGetForFree => 'Obtener Gratis';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'Comprar por $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'Aún no hay compras';

  @override
  String get digitalGoodsUnknownProduct => 'Producto Desconocido';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'Comprado el $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Copiar clave';

  @override
  String get digitalGoodsLicenseKeyCopied => '¡Clave de licencia copiada!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'Expira el $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'Tu Clave de Licencia';

  @override
  String get digitalGoodsCopyKeyButton => 'Copiar Clave';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'No se pudo iniciar el pago -- puede que este creador aún no haya conectado Stripe.';

  @override
  String get digitalGoodsPurchaseComplete =>
      '¡Compra completada! Encuéntrala en Mis Compras.';

  @override
  String get digitalGoodsPurchasePending =>
      'Todavía estamos esperando ese pago -- aparecerá en Mis Compras una vez completado.';

  @override
  String get digitalGoodsCreateProductTitle => 'Crear Producto';

  @override
  String get digitalGoodsEditProductTitle => 'Editar Producto';

  @override
  String get digitalGoodsProductTitleHint => 'Título del producto';

  @override
  String get digitalGoodsDescriptionHint => 'Descripción (opcional)';

  @override
  String get digitalGoodsPriceHint => 'Precio en USD (deja vacío para gratis)';

  @override
  String get digitalGoodsProductTypeLabel => 'Tipo de producto';

  @override
  String get digitalGoodsFileDownloadOption => 'Descarga de archivo';

  @override
  String get digitalGoodsLicenseKeyOption => 'Clave de licencia';

  @override
  String get digitalGoodsAvailabilityLabel => 'Disponibilidad';

  @override
  String get digitalGoodsThisServerOnlyOption => 'Solo este servidor';

  @override
  String get digitalGoodsAllKodaServersOption => 'Todos los servidores de Koda';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'Después de crearlo, usa el botón \"Claves\" para subir tus claves de licencia.';

  @override
  String get digitalGoodsProductFileLabel => 'Archivo del producto';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName (${sizeMb}MB)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Eliminar archivo';

  @override
  String get digitalGoodsUploadingLabel => 'Subiendo...';

  @override
  String get digitalGoodsChooseFileButton => 'Elegir Archivo';

  @override
  String get digitalGoodsReplaceFileButton => 'Reemplazar Archivo';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Elige un archivo para este producto antes de guardar.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'Subir Claves de Licencia';

  @override
  String get digitalGoodsPasteKeysHint => 'Pega una clave por línea:';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Subir Claves';

  @override
  String get digitalGoodsLicenseKeysUploaded => '¡Claves de licencia subidas!';

  @override
  String get serverSubscriptionManageTitle => 'Gestionar Suscripciones';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return 'Suscripciones de $serverName';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Añadir nivel';

  @override
  String get serverSubscriptionNoTiersYet =>
      'Aún no hay niveles de suscripción';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Crea hasta 3 niveles para tu comunidad';

  @override
  String get serverSubscriptionCreateFirstTierButton => 'Crear Primer Nivel';

  @override
  String get serverSubscriptionShowSubscriberCounts =>
      'Mostrar número de suscriptores';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/mes';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count suscriptores activos',
      one: '$count suscriptor activo',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned =>
      'Rol asignado automáticamente';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '$discount% de descuento en la tienda';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'Este servidor no tiene niveles de suscripción';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Suscriptor Activo';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'Expira $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk =>
      'Rol exclusivo de suscriptor';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return '$discount% de descuento en compras de la tienda';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Canales solo para suscriptores';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Actualmente Suscrito';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'Suscribirse por $price/mes';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Crear Nivel';

  @override
  String get serverSubscriptionEditTierTitle => 'Editar Nivel';

  @override
  String get serverSubscriptionTierNameHint =>
      'Nombre del nivel (p. ej. Fan, Seguidor, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Descripción (opcional)';

  @override
  String get serverSubscriptionPriceHint => 'Precio por mes (USD)';

  @override
  String get serverSubscriptionDiscountLabel => '% de descuento en la tienda';

  @override
  String get serverSubscriptionPositionLabel => 'Posición';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Nivel $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Otorga un rol al suscribirse — opcional';

  @override
  String get serverSubscriptionRoleFallback => 'rol';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Se otorga automáticamente a un miembro en el momento en que se suscribe, y se retira en el momento en que su suscripción expira.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Nivel creado -- conecta Stripe en Tienda → Creador antes de que los miembros puedan suscribirse.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Eliminar Nivel';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return '¿Eliminar \"$tierName\"? Los suscriptores actuales conservarán el acceso hasta que expire.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'Suscribirse a $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel =>
      'Suscripción mensual';

  @override
  String get serverSubscriptionServerBankEarnsLabel =>
      'El banco del servidor gana';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points pts';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Pago procesado de forma segura por Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'Suscribirse';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'No se pudo iniciar el pago -- puede que el propietario de este servidor aún no haya conectado Stripe.';

  @override
  String get serverSubscriptionSubscribed => '¡Suscrito!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'Todavía estamos esperando ese pago -- se activará una vez completado.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'Dar propina a $username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Selecciona la cantidad';

  @override
  String get tipDialogMessageHint => 'Añade un mensaje (opcional)';

  @override
  String get tipDialogYouPayLabel => 'Tú pagas';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username recibe';
  }

  @override
  String get tipDialogSendTipButton => 'Enviar Propina';

  @override
  String get tipDialogFailedToSendTip =>
      'No se pudo enviar la propina. Puede que el creador no esté conectado a Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'No se pudo iniciar el pago. Vuelve a intentarlo en un momento.';

  @override
  String get tipDialogTipSent => '¡Propina enviada!';

  @override
  String get tipDialogTipPending =>
      'Todavía estamos esperando ese pago -- se procesará una vez completado.';

  @override
  String get tipDialogUnknownUser => 'Desconocido';

  @override
  String get marketplaceTitle => 'Tienda';

  @override
  String get marketplaceCreatorPayoutsTitle => 'Pagos a Creadores';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Recibe propinas directamente vía Stripe';

  @override
  String get marketplaceTabServerBank => 'Banco del Servidor';

  @override
  String get marketplaceTabDigitalGoods => 'Bienes Digitales';

  @override
  String get marketplaceTabMerch => 'Merch';

  @override
  String get marketplaceTabSubscription => 'Suscripción';

  @override
  String get marketplaceTabRevenue => 'Ingresos';

  @override
  String get marketplaceSelectServerSubscription =>
      'Selecciona un servidor para ver su suscripción';

  @override
  String get marketplaceSelectServerBank =>
      'Selecciona un servidor para ver su banco';

  @override
  String get marketplaceSelectServerRevenue =>
      'Selecciona un servidor para ver sus ingresos';

  @override
  String get marketplaceStripeAccountStatus => 'Cuenta de Stripe';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Incorporación completa';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'Aceptando pagos';

  @override
  String get marketplaceConnectStripeButton => 'Conectar Cuenta de Stripe';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Completar Incorporación a Stripe';

  @override
  String get marketplaceRefreshStatusButton => 'Actualizar Estado';

  @override
  String get marketplaceReadyToReceiveTips =>
      '¡Estás listo para recibir propinas!';

  @override
  String get marketplaceHowItWorksTitle => 'Cómo funciona';

  @override
  String get marketplaceHowItWorksStep1 => 'Conecta tu cuenta de Stripe';

  @override
  String get marketplaceHowItWorksStep2 =>
      'Completa la verificación de identidad';

  @override
  String get marketplaceHowItWorksStep3 =>
      'Recibe propinas directamente en tu banco';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda cobra una comisión de procesamiento del 5%. La comisión va al banco de tu servidor en forma de puntos.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Solo el propietario del servidor o alguien con el permiso Gestionar Tienda puede ver el Banco del Servidor.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '¡$serverName impulsado!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit espacios de emoji personalizados';
  }

  @override
  String get marketplaceServerFallback => 'Servidor';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance pts';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount en actividad';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'Los puntos se obtienen de la comisión de procesamiento del 5% sobre las propinas y suscripciones de este servidor. Usa los puntos para desbloquear mejoras del servidor.';

  @override
  String get marketplaceServerBoostsTitle => 'Impulsos del Servidor';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Nivel $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count impulsos activos',
      one: '$count impulso activo',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: '$more impulsos más para alcanzar el nivel $level',
      one: '$more impulso más para alcanzar el nivel $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' y desbloquea un fondo de servidor personalizado';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' y desbloquea un borde de icono de servidor personalizado';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tienes $count tokens de impulso disponibles.',
      one: 'Tienes $count token de impulso disponible.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'Los tokens de impulso provienen de una suscripción Pulse (1/mes). Suscríbete en la pestaña Suscripciones para conseguir uno.';

  @override
  String get marketplaceBoostingLabel => 'Impulsando...';

  @override
  String get marketplaceBoostThisServerButton => 'Impulsar Este Servidor';

  @override
  String get marketplaceComingSoonUpgradesTitle =>
      'Próximamente — Mejoras del servidor';

  @override
  String get marketplaceSpendPointsList =>
      'Gasta los puntos del banco del servidor en:\n• Dominio de servidor personalizado\n• Límite de miembros aumentado\n• Soporte prioritario\n• Insignia exclusiva de servidor';

  @override
  String get marketplaceSourceTip => 'Propinas';

  @override
  String get marketplaceSourceSubscription => 'Suscripciones de Koda';

  @override
  String get marketplaceSourceServerSubscription =>
      'Suscripciones del Servidor';

  @override
  String get marketplaceSourceDigitalProduct => 'Bienes Digitales';

  @override
  String get marketplaceSourceStageTicket => 'Entradas de Escenario';

  @override
  String get marketplaceSourcePrintfulOrder => 'Pedidos de Merch';

  @override
  String get marketplaceJustNow => 'justo ahora';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return 'hace ${minutes}m';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return 'hace ${hours}h';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return 'hace ${days}d';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Solo los miembros que pueden gestionar la tienda pueden ver los ingresos de este servidor.';

  @override
  String get marketplaceBalanceLabel => 'Saldo';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Ganado en Total';

  @override
  String get marketplaceLast30DaysTitle => 'Últimos 30 Días';

  @override
  String get marketplaceRevenueBySourceTitle => 'Ingresos por Fuente';

  @override
  String get marketplaceNoRevenueYet => 'Aún no hay ingresos.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count transacciones',
      one: '$count transacción',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'Transacciones Recientes';

  @override
  String get marketplaceNoTransactionsYet => 'Aún no hay transacciones.';

  @override
  String get marketplaceNoActivityYet => 'Aún no hay actividad';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se sincronizaron $count productos de Printful',
      one: 'Se sincronizó $count producto de Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'No se pudo sincronizar con Printful -- revisa la conexión en la configuración de Merch.';

  @override
  String get printfulMerchSelectServer =>
      'Selecciona un servidor para ver su merch';

  @override
  String get printfulMerchManageCatalogTitle => 'Gestionar Catálogo de Merch';

  @override
  String get printfulMerchTitle => 'Merch';

  @override
  String get printfulMerchSyncingLabel => 'Sincronizando...';

  @override
  String get printfulMerchSyncCatalogButton => 'Sincronizar Catálogo';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'Cambiar a Explorar';

  @override
  String get printfulMerchManageTooltip =>
      'Gestionar el merch de este servidor';

  @override
  String get printfulMerchNothingSyncedYet => 'Aún no se ha sincronizado nada';

  @override
  String get printfulMerchNoMerchAvailable => 'Aún no hay merch disponible';

  @override
  String get printfulMerchSyncHint =>
      'Sincroniza tu tienda de Printful para importar tu catálogo de productos';

  @override
  String get printfulMerchCheckBackLater =>
      'Vuelve más tarde para ver el merch de este servidor';

  @override
  String get printfulMerchOutOfStock => 'Agotado';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Desde $price • $count opciones',
      one: 'Desde $price • $count opción',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'Ver';

  @override
  String get printfulMerchCartTooltip => 'Carrito';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productName añadido al carrito';
  }

  @override
  String get printfulMerchQuantityLabel => 'Cantidad';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Disminuir cantidad';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Aumentar cantidad';

  @override
  String get printfulMerchAddToCartButton => 'Añadir al Carrito';

  @override
  String get printfulMerchOptionLabel => 'Opción';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Estilo';

  @override
  String get printfulMerchSizeLabel => 'Talla';

  @override
  String get printfulMerchYourCartTitle => 'Tu Carrito';

  @override
  String get printfulMerchCartEmpty => 'Tu carrito está vacío.';

  @override
  String get printfulMerchSubtotalLabel => 'Subtotal';

  @override
  String get printfulMerchCheckoutLabel => 'Pagar';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'Eliminar del carrito';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Completa primero tu dirección de envío.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'No se pudieron obtener las tarifas de envío para esa dirección.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'No se pudo iniciar el pago. Vuelve a intentarlo en un momento.';

  @override
  String get printfulMerchOrderPlaced => '¡Pedido realizado!';

  @override
  String get printfulMerchOrderPending =>
      'Todavía estamos esperando ese pago -- se realizará una vez completado.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Velocidad de envío';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max días hábiles';
  }

  @override
  String get printfulMerchGetShippingQuoteButton =>
      'Obtener Cotización de Envío';

  @override
  String get printfulMerchPayButton => 'Pagar';

  @override
  String get kodaMarketplaceTitle => 'Koda Marketplace';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Suscripciones';

  @override
  String get kodaMarketplaceTabBoosts => 'Impulsos';

  @override
  String get kodaMarketplaceTabDiscover => 'Descubrir';

  @override
  String get kodaMarketplaceTierFreeName => 'Gratis';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'Expira $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks =>
      'Mejora para obtener ventajas exclusivas';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tokens de impulso disponibles',
      one: '$count token de impulso disponible',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Regala un token a cualquier servidor en el que estés desde su pestaña de Banco del Servidor';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame =>
      'Marco de avatar personalizado';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Insignia Spark en el perfil';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Límite de subida de archivos aumentado (50MB)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality =>
      'Calidad de voz prioritaria';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'Todo lo de Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => 'Marco de avatar animado';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Insignia Pulse en el perfil';

  @override
  String get kodaMarketplacePulsePerkFileLimit =>
      'Límite de subida de archivos de 100MB';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      '1 token de impulso de servidor al mes';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/mes';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Plan Actual';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'Obtener $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return 'Regalar $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return 'Regalar $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'Suscribirse a $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel => 'Nombre de usuario a regalar:';

  @override
  String get kodaMarketplaceUsernameHint => 'Nombre de usuario';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Suscripción';

  @override
  String get kodaMarketplaceTotalLabel => 'Total';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Pago procesado de forma segura por Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'Continuar al Pago';

  @override
  String get kodaMarketplaceUserNotFound => 'Usuario no encontrado';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'No se pudo iniciar el pago. Vuelve a intentarlo en un momento.';

  @override
  String get kodaMarketplaceSubscriptionActive => '¡Suscripción activa!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'Todavía estamos esperando ese pago -- se activará una vez completado.';

  @override
  String get kodaMarketplaceBoostPurchased => '¡Impulso comprado!';

  @override
  String get kodaMarketplaceBoostPending =>
      'Todavía estamos esperando ese pago -- estará listo una vez completado.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count disponibles';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Comprar un Impulso';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'Una compra única -- los suscriptores de Pulse también reciben un token gratis en cada renovación, lo que sigue siendo la mejor opción si impulsas con regularidad.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Comprar un Impulso -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Ningún servidor se ha unido aún al Koda Marketplace. Los propietarios de servidores pueden activarlo en la configuración de Personalizar de su servidor.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => 'DESTACADOS ESTA SEMANA';

  @override
  String get kodaMarketplaceAllListedServersHeader =>
      'TODOS LOS SERVIDORES LISTADOS';

  @override
  String get kodaMarketplaceServerFallback => 'Servidor';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count miembros',
      one: '$count miembro',
    );
    return '$_temp0';
  }

  @override
  String get calendarFallbackTitle => 'Calendario';

  @override
  String get calendarAskVispTooltip => 'Preguntar a Visp';

  @override
  String get calendarCreateEventTooltip => 'Crear Evento';

  @override
  String get calendarPreviousMonthTooltip => 'Mes anterior';

  @override
  String get calendarNextMonthTooltip => 'Mes siguiente';

  @override
  String get calendarTodayButton => 'Hoy';

  @override
  String get calendarWeekdaySun => 'dom';

  @override
  String get calendarWeekdayMon => 'lun';

  @override
  String get calendarWeekdayTue => 'mar';

  @override
  String get calendarWeekdayWed => 'mié';

  @override
  String get calendarWeekdayThu => 'jue';

  @override
  String get calendarWeekdayFri => 'vie';

  @override
  String get calendarWeekdaySat => 'sáb';

  @override
  String get calendarTodaySuffix => ', hoy';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count eventos',
      one: ', $count evento',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'Selecciona un día';

  @override
  String get calendarNoEvents => 'No hay eventos';

  @override
  String get calendarSubscribeTooltip => 'Suscribirse';

  @override
  String get calendarUnsubscribeTooltip => 'Cancelar suscripción';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'Se repite $recurrence';
  }

  @override
  String get calendarTicketOwned => 'Entrada adquirida';

  @override
  String calendarTicketPrice(String price) {
    return 'Entrada $price';
  }

  @override
  String get calendarDeleteEventTitle => 'Eliminar Evento';

  @override
  String calendarDeleteEventConfirm(String title) {
    return '¿Eliminar \"$title\"? Esto no se puede deshacer.';
  }

  @override
  String get calendarEditEventTitle => 'Editar Evento';

  @override
  String get calendarCreateEventTitle => 'Crear Evento';

  @override
  String get calendarEventTitleHint => 'Título del evento';

  @override
  String get calendarDescriptionHint => 'Descripción (opcional)';

  @override
  String get calendarLocationHint => 'Ubicación (opcional)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Inicio ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Fecha y hora de inicio, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'Fin — opcional ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'Fecha y hora de fin, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'no establecido';

  @override
  String get calendarTapToSetEndTime => 'Toca para establecer la hora de fin';

  @override
  String get calendarRecurrenceLabel => 'Recurrencia';

  @override
  String get calendarRecurrenceNone => 'No se repite';

  @override
  String get calendarRecurrenceDaily => 'Diaria';

  @override
  String get calendarRecurrenceWeekly => 'Semanal';

  @override
  String get calendarRecurrenceMonthly => 'Mensual';

  @override
  String get calendarColorLabel => 'Color';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Color $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Precio de la entrada — opcional';

  @override
  String get calendarLinkStageChannelLabel =>
      'Vincular a canal de escenario — opcional';

  @override
  String get calendarStageChannelFallback => 'escenario';

  @override
  String get discordImportFetchError => 'No se pudo obtener la plantilla.';

  @override
  String get discordImportApplyError =>
      'No se pudo aplicar la plantilla. Inténtalo de nuevo.';

  @override
  String get discordImportTitle => 'Importar Plantilla de Discord';

  @override
  String get discordImportDescription =>
      'Pega un enlace de discord.new o un código de plantilla para importar roles, categorías y canales a este servidor.';

  @override
  String get discordImportCodeHint =>
      'discord.new/ABC123 o código de plantilla';

  @override
  String get discordImportPreviewButton => 'Vista Previa';

  @override
  String get discordImportTemplateFallback => 'Plantilla';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count roles',
      one: '$count rol',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categorías',
      one: '$count categoría',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count canales',
      one: '$count canal',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel =>
      'REEMPLAZAR ESTRUCTURA EXISTENTE';

  @override
  String get discordImportReplaceWarning =>
      'Todos los canales, categorías y roles existentes se eliminarán permanentemente.';

  @override
  String get discordImportAddDescription =>
      'La plantilla se añadirá a la estructura existente de tu servidor.';

  @override
  String get discordImportReplaceConfirmTitle =>
      '¿Reemplazar la estructura del servidor?';

  @override
  String get discordImportReplaceConfirmBody =>
      'Esto eliminará permanentemente TODOS los canales, categorías y roles existentes antes de importar. Esto no se puede deshacer.';

  @override
  String get discordImportYesReplace => 'Sí, Reemplazar';

  @override
  String get discordImportReplaceAndImportButton =>
      'Reemplazar e Importar Plantilla';

  @override
  String get discordImportAddToServerButton => 'Añadir Plantilla al Servidor';

  @override
  String get thresholdModConfigureTitle => 'Configurar Moderación por Umbral';

  @override
  String get thresholdModConfigureExplanation =>
      'Elige moderadores de confianza y cuántos de ellos deben estar de acuerdo antes de que cualquiera de ellos pueda descifrar una época del historial de un canal. Ni siquiera tú tienes una clave unilateral -- solo estás exento si también estás en esta lista.';

  @override
  String get thresholdModThresholdLabel => 'Umbral:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Disminuir umbral';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Aumentar umbral';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'de $count moderadores',
      one: 'de $count moderador',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle =>
      'Solicitar Descifrado por Umbral';

  @override
  String get thresholdModChannelLabel => 'Canal';

  @override
  String get thresholdModReasonHint =>
      'Motivo -- se muestra a cada moderador designado';

  @override
  String get thresholdModRequestButton => 'Solicitar';

  @override
  String get thresholdModShareRelayed =>
      'Parte compartida enviada al solicitante.';

  @override
  String get thresholdModNotEnoughShares =>
      'Aún no se han compartido suficientes partes -- inténtalo de nuevo cuando más moderadores hayan compartido las suyas.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mensajes',
      one: '$count mensaje',
    );
    return 'Época $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'No hay mensajes descifrables en esta época.';

  @override
  String get thresholdModExplanation =>
      'Descifrado real del historial de un canal, condicionado a que varios moderadores designados estén de acuerdo activamente -- nunca una sola persona, ni siquiera el propietario del servidor. Solo desbloquea una época completa (todo lo enviado desde el último cambio de membresía), nunca un solo mensaje.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Habilitado -- $count moderadores, umbral $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'No configurado';

  @override
  String get thresholdModReconfigureButton => 'Reconfigurar';

  @override
  String get thresholdModEnableButton => 'Habilitar';

  @override
  String get thresholdModNotEnabledForServer =>
      'La moderación por umbral no está habilitada para este servidor.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Habilitada para este servidor. No eres uno de los moderadores designados.';

  @override
  String get thresholdModRequestsLabel => 'Solicitudes';

  @override
  String get thresholdModRequestDecryptButton => 'Solicitar Descifrado';

  @override
  String get thresholdModNoActiveRequests => 'No hay solicitudes activas.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- época $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'pendiente';

  @override
  String get thresholdModStatusApproved => 'aprobada';

  @override
  String get thresholdModApproveButton => 'Aprobar';

  @override
  String get thresholdModRelayShareButton => 'Transmitir Mi Parte';

  @override
  String get thresholdModTryReconstructButton => 'Intentar Reconstruir';

  @override
  String get roleSelectNoRolesAvailable =>
      'No hay roles autoasignables disponibles.';

  @override
  String get roleSelectInstructions =>
      'Selecciona los roles que quieras. Toca un rol para añadirlo o quitarlo.';

  @override
  String get rulesScreenAcceptError =>
      'No se pudieron aceptar las reglas. Inténtalo de nuevo.';

  @override
  String get rulesScreenSubtitle => 'Reglas del Servidor';

  @override
  String get rulesScreenScrollToRead =>
      'Desplázate hacia abajo para leer todas las reglas';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'Al hacer clic en Aceptar, aceptas seguir estas reglas.\nLas infracciones pueden resultar en la expulsión del servidor.';

  @override
  String get rulesScreenAcceptButton => 'Acepto las Reglas';

  @override
  String get rulesScreenReadAllToContinue =>
      'Lee todas las reglas para continuar';

  @override
  String get galleryNewPostTitle => 'Nueva Publicación';

  @override
  String get galleryChooseFileButton => 'Elegir Archivo';

  @override
  String get galleryOrDivider => 'o';

  @override
  String get galleryPasteUrlHint => 'Pega la URL de la imagen o video';

  @override
  String get galleryTypeLabel => 'Tipo';

  @override
  String get galleryImageOption => 'Imagen';

  @override
  String get galleryVideoOption => 'Video';

  @override
  String get galleryCaptionHint => 'Leyenda (opcional)';

  @override
  String get galleryPostButton => 'Publicar';

  @override
  String get galleryNewCollectionTitle => 'Nueva Colección';

  @override
  String get galleryCollectionNameHint => 'Nombre de la colección';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return '¿Eliminar \"$collectionName\"? Las publicaciones dentro dejarán de estar agrupadas.';
  }

  @override
  String get galleryFeedTab => 'Feed';

  @override
  String get galleryCollectionsTab => 'Colecciones';

  @override
  String get galleryNoPostsYet => 'Aún no hay publicaciones';

  @override
  String get galleryNoCollectionsYet => 'Aún no hay colecciones';

  @override
  String get gallerySelectACollection => 'Selecciona una colección';

  @override
  String get galleryNoPostsInCollection =>
      'No hay publicaciones en esta colección';

  @override
  String get galleryAddPostButton => 'Añadir Publicación';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Error al compartir pantalla: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return 'Volumen de $username';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'Solo afecta a lo que escuchas -- este dispositivo, esta llamada.';

  @override
  String get voiceScreenResetVolumeButton => 'Restablecer';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'No se pudo conectar: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Tu pantalla, toca para ver en pantalla completa';

  @override
  String get voiceScreenYourScreenLabel => 'Tu pantalla';

  @override
  String get voiceScreenTapToClose => 'Toca para cerrar';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (tú)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', hablando';

  @override
  String get voiceScreenCameraOnSuffix => ', cámara encendida';

  @override
  String get voiceScreenActivateToPopOut =>
      ', actívalo para abrir en una ventana aparte';

  @override
  String get voiceScreenShowVarmTooltip => 'Mostrar VARM';

  @override
  String get voiceScreenHideVarmTooltip => 'Ocultar VARM';

  @override
  String get voiceScreenShowChatTooltip => 'Mostrar chat';

  @override
  String get voiceScreenHideChatTooltip => 'Ocultar chat';

  @override
  String get voiceScreenStartCameraTooltip => 'Iniciar cámara';

  @override
  String get voiceScreenStopCameraTooltip => 'Detener cámara';

  @override
  String get voiceScreenShareScreenTooltip => 'Compartir pantalla';

  @override
  String get voiceScreenStopSharingTooltip => 'Dejar de compartir';

  @override
  String get voiceScreenPopOutTooltip => 'Desanclar voz en una ventana aparte';

  @override
  String get voiceScreenCouldNotPopOut => 'No se pudo desanclar la voz.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Salir de Voz';

  @override
  String get voiceScreenPinTooltip => 'Fijar (mantener abierto)';

  @override
  String get voiceScreenUnpinTooltip => 'Desfijar';

  @override
  String get voiceScreenSizeSmall => 'Pequeño (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Mediano (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Grande (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, $count conectados';
  }

  @override
  String get voiceBarSpeakingSuffix => ', estás hablando';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count conectados · toca para expandir';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Iniciar cámara';

  @override
  String get voiceBarStopCameraTooltip => 'Detener cámara';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Salir de Voz';

  @override
  String get popOutVideoFallbackTitle => 'Voz';

  @override
  String get popOutVideoMissingTokenError => 'Falta el token o la URL';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Se agotó el tiempo de conexión tras 15 segundos';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Error: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'Sin participantes';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Escenario';

  @override
  String get stageCouldNotJoin => 'No se pudo unir al escenario.';

  @override
  String get stageThisStageFallback => 'Este escenario';

  @override
  String get stageRequiresTicketToJoin => 'requiere una entrada para unirte';

  @override
  String get stagePleaseWaitLabel => 'Espera por favor...';

  @override
  String get stageGetFreeTicketButton => 'Obtener Entrada Gratis';

  @override
  String stageBuyTicketButton(String price) {
    return 'Comprar Entrada -- $price';
  }

  @override
  String get stageNotNowButton => 'Ahora no';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'No se pudo iniciar la compra de la entrada.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'Todavía estamos esperando ese pago -- intenta unirte de nuevo una vez confirmado.';

  @override
  String get stageSpeakerBadge => 'Orador';

  @override
  String get stageListenerBadge => 'Oyente';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'No se pudo unir: $error';
  }

  @override
  String get stageSpeakersHeader => 'ORADORES';

  @override
  String get stageRaisedHandsHeader => 'MANOS LEVANTADAS';

  @override
  String get stageAllowButton => 'Permitir';

  @override
  String get stageIgnoreButton => 'Ignorar';

  @override
  String get stageListenersHeader => 'OYENTES';

  @override
  String get stageRaiseHandTooltip => 'Levantar la mano';

  @override
  String get stageLowerHandTooltip => 'Bajar la mano';

  @override
  String get stageLeaveStageTooltip => 'Salir del Escenario';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (tú)';
  }

  @override
  String get stageMoveToListenersButton => 'Mover a oyentes';

  @override
  String get stageYouFallbackName => 'Tú';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'Avatar de $username';
  }

  @override
  String get channelEditDialogNewTitle => 'Nuevo Canal';

  @override
  String get channelEditDialogEditTitle => 'Editar Canal';

  @override
  String get channelEditDialogNameHint => 'Nombre del canal';

  @override
  String get channelEditDialogTypeLabel => 'Tipo';

  @override
  String get channelEditDialogTypeText => 'Texto';

  @override
  String get channelEditDialogTypeVoice => 'Voz';

  @override
  String get channelEditDialogTypeGallery => 'Galería';

  @override
  String get channelEditDialogTypeStage => 'Escenario';

  @override
  String get channelEditDialogTypeRules => 'Reglas';

  @override
  String get channelEditDialogTypeRoleSelection => 'Selección de Rol';

  @override
  String get channelEditDialogTypeCalendar => 'Calendario';

  @override
  String get channelEditDialogAnnouncementTitle => 'Canal de anuncios';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Solo los miembros que pueden gestionar mensajes pueden publicar';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Publicar aquí anuncios de transmisiones en vivo y subidas';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'Se publica automáticamente cuando un miembro con el permiso \"Anunciar en vivo\" transmite en Twitch, o sube un nuevo video en YouTube';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Notificar a estos roles al publicar (opcional)';

  @override
  String get channelEditDialogCategoryLabel => 'Categoría';

  @override
  String get channelEditDialogNoCategory => 'Sin categoría';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Acceso por Rol (deja vacío para todos)';

  @override
  String get channelEditDialogContentLabelsLabel => 'Etiquetas de Contenido';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Marca este canal para los filtros de contenido de los miembros; bloqueado de forma estricta para cuentas supervisadas';

  @override
  String get categoryEditDialogNewTitle => 'Nueva Categoría';

  @override
  String get categoryEditDialogEditTitle => 'Editar Categoría';

  @override
  String get categoryEditDialogNameHint => 'Nombre de la categoría';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Acceso por Rol (deja vacío para todos)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Miembros — $count en línea';
  }

  @override
  String get memberPanelRefreshTooltip => 'Actualizar lista de miembros';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count miembros',
      one: '$count miembro',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Sin conexión';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', nivel $tier';
  }

  @override
  String get memberPanelUnknownUser => 'Desconocido';

  @override
  String get memberPanelModerationActionsTooltip => 'Acciones de moderación';

  @override
  String get reportDialogReasonSpam => 'Spam';

  @override
  String get reportDialogReasonHarassment => 'Acoso o abuso';

  @override
  String get reportDialogReasonIllegal => 'Contenido ilegal';

  @override
  String get reportDialogReasonOther => 'Otro';

  @override
  String get reportDialogReasonLabel => 'Motivo';

  @override
  String get reportDialogNoteHint =>
      '¿Algo más que los moderadores deban saber? (opcional)';

  @override
  String get reportDialogDisclosureNote =>
      'El contenido del mensaje que ves y quién lo envió se compartirá con los moderadores de este servidor.';

  @override
  String get reportDialogSubmitButton => 'Enviar Reporte';

  @override
  String get reportDialogSubmitError => 'No se pudo enviar el reporte.';

  @override
  String get notificationBellTitle => 'Notificaciones';

  @override
  String get notificationBellMarkAllRead => 'Marcar todo como leído';

  @override
  String get notificationBellEmptyState => 'Aún no hay notificaciones';

  @override
  String get notificationBellUnreadLabel => 'No leído';

  @override
  String get invitePreviewTitle => 'Invitación al Servidor';

  @override
  String get invitePreviewInvalidOrExpired =>
      'Invitación no válida o expirada.';

  @override
  String get invitePreviewCouldNotJoin => 'No se pudo unir al servidor.';

  @override
  String get invitePreviewUnknownServer => 'Servidor desconocido';

  @override
  String get shippingAddressFullNameHint => 'Nombre completo';

  @override
  String get shippingAddressLine1Hint => 'Dirección línea 1';

  @override
  String get shippingAddressLine2Hint => 'Dirección línea 2 (opcional)';

  @override
  String get shippingAddressCityHint => 'Ciudad';

  @override
  String get shippingAddressStateHint => 'Estado';

  @override
  String get shippingAddressZipHint => 'Código postal';

  @override
  String get shippingAddressCountryCodeHint => 'Código de país (p. ej. US)';

  @override
  String get shippingAddressPhoneHint => 'Teléfono (opcional)';

  @override
  String get shippingAddressPrivacyNote =>
      'Se usa solo para enviar este pedido -- consulta la política de privacidad de Printful para saber cómo la gestionan una vez realizado el pedido.';

  @override
  String get updateNudgeAvailableTitle => 'Actualización Disponible';

  @override
  String get updateNudgeRequiredTitle => 'Actualización Requerida';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $version está disponible -- tienes una versión anterior.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'Esta versión ya no es compatible. Actualiza a Koda $version para seguir usando Koda.';
  }

  @override
  String get updateNudgeLaterButton => 'Más tarde';

  @override
  String get tierBadgeSparkSubscriber => 'Suscriptor Spark';

  @override
  String get tierBadgePulseSubscriber => 'Suscriptor Pulse';

  @override
  String get vispAvatarInDevelopment => 'EN DESARROLLO';

  @override
  String get vispBoostAdvisorCouldNotAnswer =>
      'Visp no pudo elaborar una respuesta.';

  @override
  String get vispBoostAdvisorTitle =>
      'Preguntar a Visp: Asesor de ROI de Impulsos';

  @override
  String get vispBoostAdvisorFollowUpHint =>
      'Haz una pregunta de seguimiento...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Enviar';

  @override
  String get vispBoostAdvisorBasedOn => 'Basado en:';

  @override
  String get vispEventDialogCouldNotGenerate =>
      'Visp no pudo generar un evento.';

  @override
  String get vispEventDialogCouldNotCreate => 'No se pudo crear ese evento.';

  @override
  String get vispEventDialogRecurrenceNone => 'Una vez';

  @override
  String get vispEventDialogRecurrenceDaily => 'Se repite diariamente';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Se repite semanalmente';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Se repite mensualmente';

  @override
  String get vispEventDialogTitle => 'Pedir a Visp que cree un evento';

  @override
  String get vispEventDialogDescription =>
      'Describe el evento -- Visp propondrá un título, fecha/hora y otros detalles.';

  @override
  String get vispEventDialogPromptHint =>
      'p. ej. \"Sesión semanal de D&D todos los viernes a las 19:00 durante unas 3 horas\"';

  @override
  String get vispEventDialogPrivacyNote =>
      'Tu descripción se envía a Visp (un asistente autoalojado -- nada sale de los servidores de Koda) para generar este plan.';

  @override
  String get vispEventDialogStartOver => 'Empezar de Nuevo';

  @override
  String get vispEventDialogCreateEvent => 'Crear Evento';

  @override
  String get vispEventDialogThinking => 'Pensando...';

  @override
  String get vispEventDialogGeneratePlan => 'Generar Plan';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'No se pudo interpretar una fecha -- intenta reformularlo';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Termina $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price por entrada';
  }

  @override
  String get vispEventDialogBasedOn => 'Basado en:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Pregunta $questionNumber de $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'O escribe tu propia respuesta...';

  @override
  String get vispQuestionStepSendTooltip => 'Enviar';

  @override
  String get vispQuestionStepSkip => 'Omitir y generar ahora';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp no pudo generar un plan.';

  @override
  String get vispSetupDialogCouldNotApplyPlan => 'No se pudo aplicar ese plan.';

  @override
  String get vispSetupDialogTitleNew => 'Describe tu servidor a Visp';

  @override
  String get vispSetupDialogTitleExisting =>
      'Pedir a Visp que añada a este servidor';

  @override
  String get vispSetupDialogDescriptionNew =>
      'Describe el servidor que quieres -- Visp propondrá un nombre y un conjunto de roles, categorías y canales.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Describe lo que te gustaría añadir -- Visp propondrá roles, categorías y canales para crear.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'p. ej. \"Un servidor acogedor para mi grupo de D&D con canales de voz para dos mesas\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'p. ej. \"Añade un par de canales más para nuestros equipos de raid\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      'Tu descripción se envía a Visp (un asistente autoalojado -- nada sale de los servidores de Koda) para generar este plan.';

  @override
  String get vispSetupDialogStartOver => 'Empezar de Nuevo';

  @override
  String get vispSetupDialogCreateServer => 'Crear Servidor';

  @override
  String get vispSetupDialogAddToServer => 'Añadir al Servidor';

  @override
  String get vispSetupDialogThinking => 'Pensando...';

  @override
  String get vispSetupDialogGeneratePlan => 'Generar Plan';

  @override
  String get vispSetupDialogNewServerLabel => 'Servidor nuevo';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count roles',
      one: '$count rol',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categorías',
      one: '$count categoría',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count canales',
      one: '$count canal',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'Basado en:';

  @override
  String get childLockoutTitle => 'Está fuera de tu horario permitido';

  @override
  String get childLockoutBody =>
      'Un padre, madre o tutor ha establecido los horarios en los que esta cuenta puede usar Koda. Pídele más tiempo, o vuelve a comprobarlo durante tu próxima ventana permitida.';

  @override
  String get childLockoutLogOutButton => 'Cerrar Sesión';

  @override
  String get forcePasswordChangeError =>
      'No se pudo actualizar la contraseña. Inténtalo de nuevo.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Bienvenido/a, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Tu cuenta requiere una nueva contraseña antes de que puedas continuar.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'Nueva contraseña';

  @override
  String get forcePasswordChangeConfirmPasswordHint =>
      'Confirmar nueva contraseña';

  @override
  String get forcePasswordChangeReqLength => 'Al menos 12 caracteres';

  @override
  String get forcePasswordChangeReqUpper => 'Una letra mayúscula';

  @override
  String get forcePasswordChangeReqLower => 'Una letra minúscula';

  @override
  String get forcePasswordChangeReqDigit => 'Un número';

  @override
  String get forcePasswordChangeReqMatch => 'Las contraseñas coinciden';

  @override
  String get forcePasswordChangeSubmitButton => 'Establecer Nueva Contraseña';

  @override
  String get forgotPasswordEnterEmailError =>
      'Introduce tu dirección de correo electrónico.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'Si esa cuenta existe, se ha enviado un código de restablecimiento.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Introduce el código y una contraseña de al menos 8 caracteres.';

  @override
  String get forgotPasswordInvalidCode => 'Código no válido o expirado.';

  @override
  String get forgotPasswordTitle => 'Restablecer contraseña';

  @override
  String get forgotPasswordEmailHint => 'Dirección de correo electrónico';

  @override
  String get forgotPasswordSendCodeButton =>
      'Enviar código de restablecimiento';

  @override
  String get forgotPasswordCodeHint => 'Código de 6 dígitos';

  @override
  String get forgotPasswordNewPasswordHint => 'Nueva contraseña';

  @override
  String get forgotPasswordSetNewPasswordButton =>
      'Establecer nueva contraseña';

  @override
  String get verifyEmailEnterCodeError =>
      'Introduce el código de 6 dígitos de tu correo electrónico.';

  @override
  String get verifyEmailInvalidCode => 'Código no válido o expirado.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'Se ha enviado un nuevo código a $email.';
  }

  @override
  String get verifyEmailResendFailed => 'No se pudo reenviar en este momento.';

  @override
  String get verifyEmailTitle => 'Revisa tu correo electrónico';

  @override
  String verifyEmailSentCode(String email) {
    return 'Te enviamos un código de 6 dígitos a $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'Verificar Correo Electrónico';

  @override
  String get verifyEmailResendButton => 'Reenviar código';

  @override
  String get safetyNumberKeysNotSetUp =>
      'Tus propias claves aún no se han configurado.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName aún no tiene un paquete de claves.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'No se pudo calcular el número de seguridad: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName ya no tiene ese dispositivo.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'Número de Seguridad con $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Compara este número con $peerName a través de otro canal -- en persona, una llamada telefónica, cualquier lugar que no sea este chat. Si coincide en ambos lados, estás hablando con quien crees que estás hablando.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName tiene $count dispositivos, cada uno con su propio número de seguridad -- verificar uno no cubre los demás.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Dispositivo $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Marcar como Verificado';

  @override
  String get contentFiltersDescription =>
      'Los servidores pueden etiquetar canales con etiquetas de contenido. Elige cómo quieres que se comporten los canales etiquetados -- esta es tu propia preferencia y nunca afecta a lo que ve cualquier otra persona.';

  @override
  String get contentFiltersLabelAdult => 'Contenido para adultos';

  @override
  String get contentFiltersLabelSuggestive => 'Sugerente';

  @override
  String get contentFiltersLabelGraphic => 'Contenido gráfico';

  @override
  String get contentFiltersLabelNudity => 'Desnudez no sexual';

  @override
  String get contentFiltersDescAdult => 'Contenido sexualmente explícito';

  @override
  String get contentFiltersDescSuggestive =>
      'Contenido sexualmente sugerente pero no explícito';

  @override
  String get contentFiltersDescGraphic => 'Violencia o gore';

  @override
  String get contentFiltersDescNudity => 'Desnudez en un contexto no sexual';

  @override
  String get contentFiltersHide => 'Ocultar';

  @override
  String get contentFiltersWarn => 'Advertir';

  @override
  String get contentFiltersShow => 'Mostrar';

  @override
  String get deviceTestCouldNotGetToken =>
      'No se pudo obtener un token de prueba.';

  @override
  String get deviceTestLabelTest => 'Probar';

  @override
  String get deviceTestLabelRecording => 'Grabando...';

  @override
  String get deviceTestLabelPlayingBack => 'Reproduciendo...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'No se pudo iniciar la cámara: $error';
  }

  @override
  String get deviceTestTitle => 'Probar Dispositivos';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'No se pudo conectar: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Micrófono';

  @override
  String get deviceTestHearYourselfLabel => 'Escúchate a Ti Mismo (Retrasado)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Altavoz / Salida';

  @override
  String get deviceTestCameraLabel => 'Cámara';

  @override
  String get deviceTestSystemDefault => 'Predeterminado del sistema';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Habla, luego escucha un clip de ${seconds}s reproducirse';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '${seconds}s';
  }

  @override
  String get deviceTestCameraPreviewOff => 'Vista previa de cámara desactivada';

  @override
  String get deviceTestStopCameraButton => 'Detener Prueba de Cámara';

  @override
  String get deviceTestTestCameraButton => 'Probar Cámara';

  @override
  String get deviceTestInputLevelLabel => 'Nivel de entrada';

  @override
  String get devicesScreenRemoveConfirmTitle => '¿Eliminar este dispositivo?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'Tendrá que iniciar sesión de nuevo, y los mensajes enviados mientras estuvo eliminado no le llegarán después -- las sesiones de Doble Trinquete no rellenan huecos retroactivamente.';

  @override
  String get devicesScreenRemoveFailed =>
      'No se pudo eliminar ese dispositivo.';

  @override
  String get devicesScreenNeverActive => 'Nunca activo';

  @override
  String devicesScreenActiveDate(String date) {
    return 'Activo $date';
  }

  @override
  String get devicesScreenDescription =>
      'Cada dispositivo en el que inicias sesión tiene su propia identidad de cifrado -- un mensaje que se te envía llega a todos los dispositivos de abajo. Elimina uno que no uses o no reconozcas.';

  @override
  String get devicesScreenNoDevicesFound => 'No se encontraron dispositivos.';

  @override
  String get devicesScreenUnknownDevice => 'Dispositivo desconocido';

  @override
  String get devicesScreenThisDeviceBadge => 'Este dispositivo';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Eliminar dispositivo';

  @override
  String get totpSetupInvalidCode => 'Código no válido. Inténtalo de nuevo.';

  @override
  String get totpSetupEnabledMessage =>
      'La autenticación de dos factores está habilitada.';

  @override
  String get totpSetupScanInstructions =>
      'Escanea este secreto en tu app de autenticación (Google Authenticator, 1Password, Authy):';

  @override
  String get totpSetupCodeHint =>
      'Introduce el código de 6 dígitos para confirmar';

  @override
  String get totpSetupVerifyButton => 'Verificar y Habilitar';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'Pulsar para Hablar';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'Pulsa cualquier tecla para vincularla...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Probar Dispositivos';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Procesamiento de Voz';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'Supresión de Ruido';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Reduce el ruido de fondo de tu micrófono';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Supresión de Ruido Avanzada (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'Eliminación de ruido con IA en tiempo real, más potente que la supresión estándar -- la reemplaza cuando está activada';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'Cancelación de Eco';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Evita que tu propio audio haga eco';

  @override
  String get voiceVideoSettingsAutoGainTitle =>
      'Control Automático de Ganancia';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Equilibra automáticamente el volumen del micrófono (normalización de volumen)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'Atenuación Automática';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Reduce el volumen de otros participantes mientras hablas';

  @override
  String get voiceVideoSettingsHighPassTitle => 'Filtro de Paso Alto';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Corta el zumbido de baja frecuencia (ventiladores, aire acondicionado, golpes en la mesa)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle =>
      'Detección de Ruido de Escritura';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Suprime el ruido del teclado captado por tu micrófono';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Aislamiento de Voz';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Se enfoca en tu voz, filtrando otras personas y sonidos cercanos';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Impulso de Micrófono';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Habilitar Impulso';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Ganancia de preamplificación para un micrófono silencioso o distante -- se aplica antes del ecualizador';

  @override
  String get voiceVideoSettingsBandBoost => 'Impulso';

  @override
  String get voiceVideoSettingsSectionMicEq => 'Ecualizador de Micrófono';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'Habilitar Ecualizador';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Da forma a tu micrófono antes de que llegue a otras personas';

  @override
  String get voiceVideoSettingsBandBass => 'Graves';

  @override
  String get voiceVideoSettingsBandMid => 'Medios';

  @override
  String get voiceVideoSettingsBandTreble => 'Agudos';

  @override
  String get voiceVideoSettingsSectionVad =>
      'Detección de Actividad de Voz (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'Habilitar VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Solo transmite cuando realmente estás hablando';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Sensibilidad';

  @override
  String get voiceVideoSettingsVadHint =>
      'Menor = capta sonidos más suaves. Mayor = solo el habla más fuerte activa la transmisión.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Tecla vinculada';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'No establecida — el micrófono permanece activo siempre que no esté silenciado';

  @override
  String get voiceVideoSettingsClearButton => 'Borrar';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Establecer Tecla';

  @override
  String get voiceVideoSettingsChangeButton => 'Cambiar';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'Cuando se vincula una tecla, tu micrófono transmite solo mientras mantienes esa tecla pulsada. Esto tiene prioridad sobre VOX mientras estás en un canal de voz.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Modelo Reactivo de Avatar Virtual';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Sube dos imágenes que se intercambian cuando hablas. Visible solo para ti.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'En silencio';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'Hablando';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'Umbral de habla';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Menor = cambia a la imagen de hablar más fácilmente.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'Eliminar VARM';

  @override
  String get gifPickerNoGifsFound => 'No se encontraron GIFs';

  @override
  String get gifPickerSearchHint => 'Buscar GIFs...';

  @override
  String get messageSearchHint => 'Buscar en este canal...';

  @override
  String get messageSearchTooltip => 'Buscar';

  @override
  String get messageSearchInitialHint =>
      'Busca mensajes ya cargados en este dispositivo -- el historial más antiguo se obtiene (y se descifra localmente) a medida que retrocedes más.';

  @override
  String get messageSearchNoMatches => 'Sin resultados';

  @override
  String get messageSearchStartOfHistory => 'Inicio del historial del canal';

  @override
  String get messageSearchFurtherBackButton => 'Buscar más atrás';

  @override
  String get messageSearchUnknownAuthor => 'Desconocido';
}
