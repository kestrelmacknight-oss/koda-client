// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Salvar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonDelete => 'Excluir';

  @override
  String get commonCreate => 'Criar';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonDone => 'Concluído';

  @override
  String get commonDownload => 'Baixar';

  @override
  String get commonDisconnect => 'Desconectar';

  @override
  String get commonNone => 'Nenhum';

  @override
  String get commonJoin => 'Entrar';

  @override
  String get commonDismiss => 'Dispensar';

  @override
  String get commonSubmit => 'Enviar';

  @override
  String get commonConfirm => 'Confirmar';

  @override
  String get commonRemove => 'Remover';

  @override
  String get commonRetry => 'Tentar novamente';

  @override
  String get commonOk => 'OK';

  @override
  String get commonYes => 'Sim';

  @override
  String get commonNo => 'Não';

  @override
  String get commonSearch => 'Pesquisar';

  @override
  String get commonSettings => 'Configurações';

  @override
  String get commonLoading => 'Carregando...';

  @override
  String get settingsLanguageSection => 'Idioma';

  @override
  String get settingsLanguageTitle => 'Idioma do aplicativo';

  @override
  String get settingsLanguageSystemDefault => 'Padrão do sistema';

  @override
  String get settingsLanguageDescription =>
      'Escolha o idioma de exibição da interface do Koda. Isso é independente do idioma principal de um servidor ou do idioma em que você escreve mensagens.';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsSignOut => 'Sair';

  @override
  String get settingsSectionMyAccount => 'Minha conta';

  @override
  String get settingsSectionSecurity => 'Segurança';

  @override
  String get settingsSectionAccessibility => 'Acessibilidade';

  @override
  String get settingsSectionBilling => 'Cobrança';

  @override
  String get settingsSectionFamily => 'Família';

  @override
  String get settingsSectionVoiceVideo => 'Voz e vídeo';

  @override
  String get settingsSectionDesktop => 'Desktop';

  @override
  String get settingsSectionAbout => 'Sobre';

  @override
  String get settingsTwoFactorTitle => 'Autenticação de dois fatores';

  @override
  String get settingsTwoFactorSubtitle =>
      'Adicione um aplicativo autenticador para mais segurança';

  @override
  String get settingsLinkedDevicesTitle => 'Dispositivos vinculados';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'Veja e remova os dispositivos conectados a esta conta';

  @override
  String get settingsContentFiltersTitle => 'Filtros de conteúdo';

  @override
  String get settingsContentFiltersSubtitle =>
      'Escolha como o conteúdo marcado deve ser exibido';

  @override
  String get settingsDmFriendsOnlyTitle => 'Permitir DMs apenas de amigos';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Pessoas que não são suas amigas não podem iniciar uma conversa com você';

  @override
  String get settingsDmPrivacyError =>
      'Não foi possível atualizar a privacidade de DM.';

  @override
  String get settingsShowVispAvatarTitle => 'Mostrar avatar do Visp';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Exibe o rosto e o humor do Visp em suas caixas de diálogo de configuração, evento e conselho';

  @override
  String get settingsDeleteAccountTitle => 'Excluir conta';

  @override
  String get settingsDeleteAccountSubtitle =>
      'Remove permanentemente suas informações pessoais do Koda';

  @override
  String get settingsDeleteAccountWarning =>
      'Isso exclui permanentemente as informações do seu perfil e não pode ser desfeito. Suas mensagens anteriores podem continuar visíveis para outras pessoas, exibidas como enviadas por um usuário excluído. Digite sua senha para confirmar.';

  @override
  String get settingsDeleteAccountPasswordHint => 'Senha';

  @override
  String get settingsDeleteAccountConfirm => 'Excluir conta';

  @override
  String get settingsDeleteAccountWrongPassword => 'Senha incorreta.';

  @override
  String get settingsHighContrastTitle => 'Alto contraste';

  @override
  String get settingsHighContrastSubtitle =>
      'Cores em preto e branco puro de alto contraste em todo o aplicativo -- a alternância recarrega brevemente a tela atual.';

  @override
  String get settingsDyslexiaFontTitle => 'Fonte amigável para dislexia';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Alterna o texto principal para OpenDyslexic em todo o aplicativo';

  @override
  String get settingsNewestAtTopTitle =>
      'Mostrar Mensagens Mais Recentes no Topo';

  @override
  String get settingsNewestAtTopSubtitle =>
      'Aplica-se a canais, DMs e chat de canal de voz igualmente';

  @override
  String get settingsFontSizeTitle => 'Tamanho da fonte';

  @override
  String get settingsFontSizeSample =>
      'Um pequeno jabuti xereta viu dez cegonhas felizes';

  @override
  String get settingsDensityTitle => 'Densidade';

  @override
  String get settingsDensityDescription =>
      'Afeta o espaçamento dos controles padrão -- botões, interruptores, caixas de diálogo -- mas não todos os layouts personalizados.';

  @override
  String get settingsDensityCompact => 'Compacta';

  @override
  String get settingsDensityStandard => 'Padrão';

  @override
  String get settingsDensityComfortable => 'Confortável';

  @override
  String get settingsStreamingTitle => 'Contas de streaming';

  @override
  String get settingsStreamingDescription =>
      'Conecte Twitch/YouTube/Kick para que os servidores em que você tem a permissão \"Anunciar ao vivo\" possam publicar automaticamente quando você estiver ao vivo ou publicar um novo vídeo.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform conectado como $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform não conectado';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- ao vivo agora';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- nova publicação';

  @override
  String get settingsStreamingLiveSuffixKick => ' -- ao vivo agora';

  @override
  String get settingsStreamingConnecting => 'Conectando...';

  @override
  String get settingsStreamingConnect => 'Conectar';

  @override
  String get settingsAnnounceLiveTwitch => 'Anunciar quando eu estiver ao vivo';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Anunciar transmissões ao vivo e novas publicações';

  @override
  String get settingsAnnounceLiveKick => 'Anunciar quando eu estiver ao vivo';

  @override
  String get settingsRefreshStatus =>
      'Já conectado pelo seu navegador? Atualize o status';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'Não foi possível iniciar a conexão com $platform.';
  }

  @override
  String settingsStreamingConsentRequired(String platform) {
    return 'Peça ao pai, mãe ou responsável da criança para permitir primeiro a conexão com $platform no Painel dos Pais.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Conclua a conexão no seu navegador e depois volte e atualize.';

  @override
  String get settingsDeveloperPortalTitle => 'Portal do desenvolvedor';

  @override
  String get settingsDeveloperPortalSubtitle =>
      'Registre bots e apps que usam a API da Koda';

  @override
  String get devPortalScreenTitle => 'Portal do desenvolvedor';

  @override
  String get devPortalNewAppTooltip => 'Novo aplicativo';

  @override
  String get devPortalEmptyState =>
      'Nenhum aplicativo ainda. Crie um para obter uma chave de API para seu bot.';

  @override
  String get devPortalNewAppTitle => 'Novo aplicativo';

  @override
  String get devPortalAppNameHint => 'Nome do app';

  @override
  String get devPortalAppDescriptionHint => 'Descrição (opcional)';

  @override
  String get devPortalBotUsernameHint => 'Nome de usuário do bot';

  @override
  String get devPortalInteractionDataOnlyNote =>
      'Seu bot só recebe o comando e as opções que um usuário envia explicitamente a ele -- nunca o histórico de mensagens de um canal.';

  @override
  String get devPortalCreateError =>
      'Não foi possível criar este aplicativo agora.';

  @override
  String get devPortalKeyRevealTitle => 'Sua chave de API';

  @override
  String get devPortalKeyRevealWarning =>
      'Esta é a única vez que esta chave será exibida. Copie-a agora -- a Koda não a armazena de forma recuperável.';

  @override
  String get devPortalCopyKeyTooltip => 'Copiar chave';

  @override
  String get devPortalKeyCopiedToast => 'Chave de API copiada.';

  @override
  String get devPortalKeySavedIt => 'Já salvei';

  @override
  String get devPortalRegenerate => 'Gerar nova';

  @override
  String get devPortalRegenerateConfirmTitle => 'Gerar nova chave de API?';

  @override
  String get devPortalRegenerateConfirmBody =>
      'A chave atual deixará de funcionar imediatamente -- qualquer coisa que já a use vai precisar da nova.';

  @override
  String get devPortalDeleteConfirmTitle => 'Excluir este aplicativo?';

  @override
  String get devPortalDeleteConfirmBody =>
      'Sua chave de API será revogada e a conta do bot desativada. Isso não pode ser desfeito.';

  @override
  String get devPortalOAuthSectionTitle => 'OAuth2 (Entrar com Koda)';

  @override
  String get devPortalNoRedirectUris =>
      'Nenhuma URI de redirecionamento registrada ainda.';

  @override
  String get devPortalEditRedirectUris => 'Editar URIs de redirecionamento';

  @override
  String get devPortalEditRedirectUrisTitle => 'URIs de redirecionamento';

  @override
  String get devPortalRedirectUrisHelp =>
      'Uma por linha. O redirect_uri de uma solicitação de consentimento deve corresponder exatamente a uma destas.';

  @override
  String get devPortalRedirectUrisHint => 'https://example.com/callback';

  @override
  String get devPortalGenerateClientSecret => 'Gerar segredo do cliente';

  @override
  String get devPortalRegenerateClientSecret => 'Gerar novo segredo do cliente';

  @override
  String devPortalClientSecretEndingIn(String lastFour) {
    return 'Segredo do cliente terminando em $lastFour';
  }

  @override
  String get oauthConsentTitle => 'Autorizar aplicativo';

  @override
  String get oauthConsentUnknownApp => 'Este aplicativo não foi encontrado.';

  @override
  String oauthConsentAllowQuestion(String appName) {
    return 'Permitir que $appName acesse sua conta Koda?';
  }

  @override
  String get oauthConsentWillBeAbleTo => 'Isso permitirá que o app:';

  @override
  String get oauthConsentAllow => 'Permitir';

  @override
  String get oauthConsentDeny => 'Negar';

  @override
  String get oauthConsentError =>
      'Não foi possível concluir -- tente novamente.';

  @override
  String get commonNext => 'Próximo';

  @override
  String get serverTabBots => 'Bots';

  @override
  String get botInstallTitle => 'Instalar bot';

  @override
  String get botInstallSuccess => 'Bot instalado.';

  @override
  String get botInstallNoEligibleServers =>
      'Você não administra nenhum servidor onde seja possível instalar bots.';

  @override
  String get botInstallSelectServer => 'Instalar em';

  @override
  String get botInstallSelectPermissions => 'Permissões a conceder';

  @override
  String get botInstallPermissionsHelp =>
      'Só é possível conceder permissões que você mesmo possui -- as acinzentadas não são suas para conceder.';

  @override
  String get botInstallConfirm => 'Instalar';

  @override
  String get botsTabDescription =>
      'Bots instalados neste servidor, e o que podem fazer.';

  @override
  String get botsTabInstallButton => 'Instalar um bot';

  @override
  String get botsTabInstallDialogTitle => 'Instalar um bot';

  @override
  String get botsTabClientIdHint => 'Cole o ID do aplicativo do bot';

  @override
  String get botsTabEmptyState => 'Nenhum bot instalado ainda.';

  @override
  String get botsTabNoPermissions => 'Nenhuma permissão concedida';

  @override
  String get botsTabUninstall => 'Desinstalar';

  @override
  String get devPortalCommandsSectionTitle => 'Comandos de barra';

  @override
  String get devPortalNoInteractionsUrl =>
      'Nenhuma URL de interações definida ainda.';

  @override
  String get devPortalEditInteractionsUrl => 'Editar URL de interações';

  @override
  String get devPortalEditInteractionsUrlTitle => 'URL de interações';

  @override
  String get devPortalInteractionsUrlHelp =>
      'Para onde a Koda envia um POST assinado sempre que alguém invoca um dos comandos deste app. Deve responder em cerca de 3 segundos.';

  @override
  String get devPortalInteractionsUrlHint =>
      'https://example.com/koda/interactions';

  @override
  String get devPortalGenerateSigningSecret => 'Gerar segredo de assinatura';

  @override
  String get devPortalRegenerateSigningSecret =>
      'Gerar novo segredo de assinatura';

  @override
  String get homeSlashCommandsTooltip => 'Comandos de barra';

  @override
  String get slashCommandsNoneAvailable =>
      'Nenhum bot com comandos instalado neste servidor.';

  @override
  String get slashCommandsPickerTitle => 'Escolha um comando';

  @override
  String get slashCommandsRun => 'Executar';

  @override
  String get devPortalEventsSectionTitle => 'Eventos de webhook';

  @override
  String get devPortalEventsSectionHelp =>
      'A Koda notifica a URL de interações deste app quando ocorre um evento assinado -- ative apenas o que você precisa.';

  @override
  String get devPortalSandboxSection => 'Sandbox';

  @override
  String get devPortalSandboxCommandLabel => 'Nome do comando';

  @override
  String get devPortalSandboxOptionsLabel => 'Opções (JSON)';

  @override
  String get devPortalSandboxSendInteraction => 'Enviar interação de teste';

  @override
  String get devPortalSandboxTestEvent => 'Enviar teste';

  @override
  String get devPortalSandboxReplyLabel => 'Resposta:';

  @override
  String get devPortalSandboxErrorPrefix => 'Erro:';

  @override
  String get devPortalSandboxNotReady =>
      'Defina primeiro uma URL de interações e um segredo de assinatura';

  @override
  String get homeBrowsePublicServersTooltip => 'Explorar servidores públicos';

  @override
  String get homeUpcomingEventsTooltip => 'Próximos eventos';

  @override
  String get homeActivityFeedTooltip => 'Feed de atividade';

  @override
  String get serverDiscoveryTitle => 'Explorar Servidores';

  @override
  String get serverDiscoverySearchHint => 'Pesquisar servidores';

  @override
  String get serverDiscoveryEmptyState => 'Nenhum servidor público encontrado.';

  @override
  String get serverDiscoveryMatureBadge => 'CONTEÚDO ADULTO';

  @override
  String get serverDiscoveryNoDescription => 'Nenhuma descrição fornecida.';

  @override
  String serverDiscoveryMemberCount(int count) {
    return '$count membros';
  }

  @override
  String get serverDiscoveryJoinError =>
      'Não foi possível entrar neste servidor';

  @override
  String get serverDiscoveryNotFound =>
      'Este servidor não está mais disponível.';

  @override
  String get serverDiscoveryJoinButton => 'Entrar no Servidor';

  @override
  String get serverDiscoveryPreviewChannelsLabel =>
      'Canais de pré-visualização';

  @override
  String get serverDiscoveryPreviewReadOnlyNote =>
      'Você está vendo este canal sem ter entrado. Entre no servidor para responder.';

  @override
  String get serverDiscoveryPreviewEmptyState => 'Ainda sem mensagens.';

  @override
  String get serverPublicListingLabel => 'Listagem pública';

  @override
  String get serverListPublicly => 'Listar este servidor publicamente';

  @override
  String get serverListPubliclyDescription =>
      'Permita que qualquer pessoa encontre e entre neste servidor pela Explorar Servidores, sem precisar de convite.';

  @override
  String get serverDescriptionLabel => 'Descrição';

  @override
  String get serverDescriptionHint => 'Sobre o que é este servidor?';

  @override
  String get serverMatureContentLabel => 'Contém conteúdo adulto';

  @override
  String get serverRulesGateNote =>
      'Novos membros verão apenas seu canal de regras (e quaisquer canais de pré-visualização) até aceitarem as regras.';

  @override
  String get serverMakePublicTitle => 'Tornar este servidor público?';

  @override
  String get serverMakePublicBody =>
      'Qualquer pessoa poderá encontrar e entrar neste servidor sem convite. Certifique-se de que a descrição está correta e o conteúdo está sinalizado adequadamente antes de continuar.';

  @override
  String get serverMakePublicConfirm => 'Tornar Público';

  @override
  String get serverMakePublicNeedsDescription =>
      'Adicione uma descrição antes de tornar o servidor público.';

  @override
  String get serverMakePublicGenericError =>
      'Não foi possível atualizar a listagem pública';

  @override
  String homeFeaturedServerTooltip(String name) {
    return 'Em destaque: $name';
  }

  @override
  String get serverRolePriorityHelp =>
      'Arraste para definir qual cargo é exibido primeiro quando um membro tem mais de um.';

  @override
  String get steamHideUnplayedTitle => 'Ocultar jogos nunca jogados?';

  @override
  String steamHideUnplayedBody(int count) {
    return '$count jogos na sua biblioteca têm 0 tempo de jogo -- demos, gratuitos ou coisas que você nunca chegou a jogar. Ocultar todos da comparação?';
  }

  @override
  String get steamHideUnplayedConfirm => 'Ocultar Todos';

  @override
  String steamHideUnplayedButton(int count) {
    return 'Ocultar $count jogos nunca jogados';
  }

  @override
  String steamUnresolvedGameLabel(int appId) {
    return 'App $appId';
  }

  @override
  String get steamNeverPlayedLabel => 'Nunca jogado';

  @override
  String get steamVisibleInComparison => 'Visível na comparação';

  @override
  String get channelEditDialogTypePreview => 'Prévia Pública';

  @override
  String get channelEditDialogPreviewHelp =>
      'Visível para qualquer pessoa sem entrar, se este servidor for público. Para postar ainda é necessário entrar (e aceitar as regras, se houver).';

  @override
  String get channelEditDialogGeneralSection => 'Geral';

  @override
  String get channelEditDialogBehaviorSection => 'Comportamento';

  @override
  String get channelEditDialogAccessSection => 'Acesso';

  @override
  String get serverThemeLibraryTitle => 'Modelos do servidor';

  @override
  String get serverThemeLibraryEmptyState =>
      'Ainda não há modelos disponíveis.';

  @override
  String serverThemeLockedHint(int level) {
    return 'Requer nível de impulso $level';
  }

  @override
  String serverThemePreviewTitle(String name) {
    return 'Pré-visualização: $name';
  }

  @override
  String get serverThemePreviewNote =>
      'Isto é uma pré-visualização — nada foi aplicado ainda.';

  @override
  String get serverThemeApplyButton => 'Aplicar modelo';

  @override
  String get serverThemeApplyError => 'Não foi possível aplicar este modelo';

  @override
  String get serverThemeCardTitle => 'Modelos do servidor';

  @override
  String get serverThemeCardDescription =>
      'Explore visuais selecionados e pré-visualize antes de aplicar.';

  @override
  String get serverThemeBrowseButton => 'Explorar modelos';

  @override
  String get settingsSteamTitle => 'Steam';

  @override
  String get settingsSteamDescription =>
      'Conecte o Steam para compartilhar o que você está jogando e/ou comparar bibliotecas de jogos com amigos -- são dois interruptores independentes, ativar um nunca ativa o outro.';

  @override
  String settingsSteamConnected(String personaName) {
    return 'Steam conectado como $personaName';
  }

  @override
  String get settingsSteamNotConnected => 'Steam não conectado';

  @override
  String get settingsSteamSharePresence => 'Compartilhar o que estou jogando';

  @override
  String get settingsSteamSharePresenceSubtitle =>
      'Amigos e membros do servidor veem seu jogo atual perto do seu status';

  @override
  String get settingsSteamShareLibrary => 'Permitir comparação de biblioteca';

  @override
  String get settingsSteamShareLibrarySubtitle =>
      'Amigos e membros do servidor podem comparar sua biblioteca Steam com a sua';

  @override
  String profilePlayingGame(String game) {
    return 'Jogando $game';
  }

  @override
  String get profileCompareSteamLibraries => 'Comparar bibliotecas Steam';

  @override
  String get profileUpcomingEventsLabel => 'UPCOMING EVENTS';

  @override
  String get profileSeeAllEvents => 'See all';

  @override
  String get steamCompareScreenTitle => 'Biblioteca Steam compartilhada';

  @override
  String steamCompareSharedCount(int count) {
    return 'Vocês dois têm $count jogos';
  }

  @override
  String get steamCompareEmptyState => 'Nenhum jogo em comum ainda.';

  @override
  String get steamCompareError =>
      'Não foi possível carregar os jogos compartilhados agora.';

  @override
  String get steamSyncNow => 'Sincronizar agora';

  @override
  String get steamSyncSuccess => 'Biblioteca Steam sincronizada.';

  @override
  String get steamSyncError =>
      'Não foi possível sincronizar agora -- tente novamente em breve.';

  @override
  String get steamManageLibraryTitle => 'Gerenciar jogos sincronizados';

  @override
  String get steamManageLibraryDescription =>
      'Jogos que você marcar como ocultos aqui nunca aparecerão em uma comparação de bibliotecas, mesmo que o Steam ainda os considere públicos.';

  @override
  String get steamManageLibraryEmptyState =>
      'Nenhum jogo sincronizado ainda -- tente Sincronizar agora.';

  @override
  String get steamHiddenFromComparison => 'Oculto da comparação';

  @override
  String get settingsThroneTitle => 'Webhook do Throne';

  @override
  String get settingsThroneDescription =>
      'Cole esta URL nas configurações de webhook do Throne.com para ser notificado no Koda sempre que alguém lhe enviar um presente.';

  @override
  String get settingsThroneGetUrl => 'Obter minha URL de webhook';

  @override
  String get settingsThroneCopyTooltip => 'Copiar';

  @override
  String get settingsThroneCopiedToast =>
      'Copiado para a área de transferência';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Regenerar (invalida a URL antiga)';

  @override
  String get settingsThroneRegenerateConfirmTitle =>
      'Regenerar a URL do webhook?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'Sua URL antiga deixará de funcionar, lembre-se de atualizá-la no Throne.com depois.';

  @override
  String get settingsThroneRegenerate => 'Regenerar';

  @override
  String get settingsUploadPhoto => 'Enviar foto';

  @override
  String get settingsOrPasteUrl => 'ou cole uma URL abaixo';

  @override
  String get settingsAvatarUrlHint => 'https://exemplo.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'O envio de imagem requer Cloudflare R2 -- colar uma URL ainda funciona.';

  @override
  String get settingsDisplayNameLabel => 'NOME DE EXIBIÇÃO';

  @override
  String get settingsDisplayNameHint => 'Nome de exibição';

  @override
  String get settingsBioLabel => 'BIOGRAFIA';

  @override
  String get settingsBioHint => 'Conte um pouco sobre você';

  @override
  String get settingsPronounsLabel => 'PRONOMES';

  @override
  String get settingsPronounsHint => 'ex.: ela/dela';

  @override
  String get settingsShowPronounsTitle =>
      'Mostrar meus pronomes para os outros';

  @override
  String get settingsShowPronounsSubtitle =>
      'Exibido ao lado do seu nome no chat, listas de membros e voz';

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
  String get settingsCustomStatusLabel => 'STATUS PERSONALIZADO';

  @override
  String get settingsCustomStatusHint => 'No que você está pensando?';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusAway => 'Ausente';

  @override
  String get statusDnd => 'Não perturbe';

  @override
  String get statusInvisible => 'Invisível';

  @override
  String get settingsFamilyNotAvailable =>
      'Os controles parentais não estão disponíveis em uma conta supervisionada.';

  @override
  String get settingsAboutTitle => 'Sobre o Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Termos de Serviço';

  @override
  String get settingsPrivacyTitle => 'Política de Privacidade';

  @override
  String get settingsSupportTitle => 'Suporte';

  @override
  String get settingsReportSecurityTitle => 'Relatar um problema de segurança';

  @override
  String get settingsDesktopNotAvailable =>
      'Estas são configurações exclusivas para desktop -- não há janela nem bandeja do sistema nesta plataforma.';

  @override
  String get settingsCloseToTrayTitle => 'Minimizar para a bandeja do sistema';

  @override
  String get settingsCloseToTraySubtitle =>
      'Fechar a janela deixa o Koda em execução em segundo plano para continuar recebendo notificações -- desative isso para que fechar a janela realmente encerre o aplicativo.';

  @override
  String get authErrorEmailPasswordRequired =>
      'E-mail e senha são obrigatórios.';

  @override
  String get authErrorIncorrectCredentials => 'E-mail ou senha incorretos.';

  @override
  String get authErrorMustAcceptTerms => 'Aceite os Termos de Serviço.';

  @override
  String get authErrorAllFieldsRequired => 'Todos os campos são obrigatórios.';

  @override
  String get authErrorPasswordsDontMatch => 'As senhas não coincidem.';

  @override
  String get authErrorPasswordTooShort =>
      'A senha deve ter pelo menos 8 caracteres.';

  @override
  String get authErrorRegistrationFailed =>
      'Falha no cadastro. Este e-mail já pode estar em uso.';

  @override
  String get authTabSignIn => 'Entrar';

  @override
  String get authTabCreateAccount => 'Criar conta';

  @override
  String get authAgreementPrefix => 'Ao usar o Koda, você concorda com nossos ';

  @override
  String get authTermsLink => 'Termos de Serviço';

  @override
  String get authAgreementMiddle => ' e nossa ';

  @override
  String get authPrivacyLink => 'Política de Privacidade';

  @override
  String get authAgreementSuffix => '.';

  @override
  String get authEmailHint => 'E-mail';

  @override
  String get authPasswordHint => 'Senha';

  @override
  String get authForgotPassword => 'Esqueceu a senha?';

  @override
  String get authSignInButton => 'Entrar';

  @override
  String get authUsernameHint => 'Nome de usuário';

  @override
  String get authConfirmPasswordHint => 'Confirmar senha';

  @override
  String get authAccessCodeHint => 'Código de acesso (se tiver um)';

  @override
  String get authAgreeToTerms =>
      'Concordo com os Termos de Serviço e a Política de Privacidade';

  @override
  String get authCreateAccountButton => 'Criar conta';

  @override
  String get dmSafetyNumberChangedWarning =>
      'O número de segurança desta conversa mudou -- verifique antes de enviar.';

  @override
  String get dmMessageNotSent => 'Mensagem não enviada.';

  @override
  String dmEncryptMessageError(String error) {
    return 'Não foi possível criptografar a mensagem: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'Falha ao enviar o anexo.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'Não foi possível criptografar o anexo: $error';
  }

  @override
  String get dmReportMessage => 'Denunciar mensagem';

  @override
  String get dmReportSubmitted => 'Denúncia enviada.';

  @override
  String get dmTitle => 'Mensagens';

  @override
  String get dmNewMessage => 'Nova mensagem';

  @override
  String get dmNoConversationsYet => 'Ainda não há conversas';

  @override
  String get dmSelectConversation => 'Selecione uma conversa';

  @override
  String get dmVerifySafetyNumberTooltip => 'Verificar número de segurança';

  @override
  String get dmSeenLabel => 'Visto';

  @override
  String get dmMessageActionsTooltip => 'Ações da mensagem';

  @override
  String get dmRemoveAttachmentTooltip => 'Remover anexo';

  @override
  String get dmAttachFileTooltip => 'Anexar arquivo';

  @override
  String get dmMessageHint => 'Mensagem...';

  @override
  String get dmSendMessageTooltip => 'Enviar mensagem';

  @override
  String get dmNoFriendsYet =>
      'Ainda não há amigos.\nEnvie uma solicitação de amizade para começar.';

  @override
  String get dmUnfriendTooltip => 'Desfazer amizade';

  @override
  String get dmNoPendingRequests => 'Nenhuma solicitação de amizade pendente.';

  @override
  String get dmIncomingRequestsLabel => 'RECEBIDAS';

  @override
  String get dmSentRequestsLabel => 'ENVIADAS';

  @override
  String get dmAcceptTooltip => 'Aceitar';

  @override
  String get dmDeclineTooltip => 'Recusar';

  @override
  String get dmPendingLabel => 'Pendente';

  @override
  String get dmNewMessageDialogTitle => 'Nova mensagem';

  @override
  String get dmEnterUsernameHint => 'Digite um nome de usuário';

  @override
  String get dmOpenButton => 'Abrir';

  @override
  String dmSavedAttachment(String fileName) {
    return '$fileName salvo';
  }

  @override
  String get dmUnknownUser => 'Desconhecido';

  @override
  String get dmEndToEndEncryptedTooltip => 'Criptografado de ponta a ponta';

  @override
  String get homeContentWarningTitle => 'Aviso de conteúdo';

  @override
  String homeContentWarningBody(String labels) {
    return 'Este canal está sinalizado por: $labels.\n\nAltere isso em Configurações > Segurança > Filtros de conteúdo.';
  }

  @override
  String get homeViewAnyway => 'Ver mesmo assim';

  @override
  String get homeCouldNotConnectVoice => 'Não foi possível conectar à voz.';

  @override
  String get homeVoiceChannelFull => 'Este canal de voz está cheio.';

  @override
  String get homeCreateServer => 'Criar servidor';

  @override
  String get homeJoinServer => 'Entrar em um servidor';

  @override
  String get homeRedeemCode => 'Resgatar código';

  @override
  String get homeJoinServerDialogTitle => 'Entrar em um servidor';

  @override
  String get homeEnterInviteCode => 'Digite um código ou URL de convite:';

  @override
  String get homeInviteCodeHint => 'ex.: XK9MP2';

  @override
  String get homeJoined => 'Entrou!';

  @override
  String get homeInvalidInvite => 'Código de convite inválido ou expirado.';

  @override
  String get homeJoinButton => 'Entrar';

  @override
  String get homeRedeemCodeDialogTitle => 'Resgatar código';

  @override
  String get homeEnterBackerCode =>
      'Digite seu código de apoiador ou recompensa:';

  @override
  String get homeRewardCodeHint => 'Código de recompensa';

  @override
  String get homeCodeRedeemed =>
      'Código resgatado! Suas recompensas foram aplicadas.';

  @override
  String get homeInvalidRedeemCode =>
      'Código inválido, expirado ou já resgatado.';

  @override
  String get homeRedeemButton => 'Resgatar';

  @override
  String get homeAreFriends => 'Vocês são amigos';

  @override
  String get homeAddFriend => 'Adicionar como amigo';

  @override
  String homeFriendRequestSent(String username) {
    return 'Solicitação de amizade enviada para $username!';
  }

  @override
  String get homeMessageButton => 'Mensagem';

  @override
  String get homeSendTip => 'Enviar gorjeta';

  @override
  String get homeSwitchToServer => 'Mudar para este servidor';

  @override
  String get homeInvitePeople => 'Convidar pessoas';

  @override
  String get homeServerSettingsMenuItem => 'Configurações do servidor';

  @override
  String get homeLeaveServerMenuItem => 'Sair do servidor';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return 'Sair de $serverName? Você poderá entrar novamente com um convite.';
  }

  @override
  String get homeLeaveButton => 'Sair';

  @override
  String get homeCreateAServer => 'Criar um servidor';

  @override
  String get homeServerNameHint => 'Nome do servidor';

  @override
  String get homeDescribeToVisp => 'Descrever para o Visp em vez disso';

  @override
  String get homeMarkAsRead => 'Marcar como lida';

  @override
  String get homeEditChannel => 'Editar canal';

  @override
  String get homeDeleteChannel => 'Excluir canal';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return 'Excluir #$channelName? Isso não pode ser desfeito.';
  }

  @override
  String get homeDeleteButton => 'Excluir';

  @override
  String get homeCreateChannelHere => 'Criar canal aqui';

  @override
  String get homeEditCategory => 'Editar categoria';

  @override
  String get homeDeleteCategory => 'Excluir categoria';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return 'Excluir \"$categoryName\"? Os canais nela ficarão sem categoria.';
  }

  @override
  String get homeReplyAction => 'Responder';

  @override
  String get homeCreateThreadAction => 'Criar tópico';

  @override
  String get homeEditMessageAction => 'Editar mensagem';

  @override
  String get homeDeleteMessageAction => 'Excluir mensagem';

  @override
  String get homePinMessageAction => 'Fixar mensagem';

  @override
  String get homeUnpinMessageAction => 'Desafixar mensagem';

  @override
  String get homeReportMessageAction => 'Denunciar mensagem';

  @override
  String get homeReportSubmitted => 'Denúncia enviada.';

  @override
  String get messageActionForward => 'Encaminhar';

  @override
  String messageForwardedFromLabel(String name) {
    return 'Encaminhado de $name';
  }

  @override
  String get forwardDestinationPickerTitle => 'Encaminhar mensagem';

  @override
  String get forwardDestinationPickerChannelsTab => 'Canais';

  @override
  String get forwardDestinationPickerDmsTab => 'Mensagens Diretas';

  @override
  String get forwardDestinationPickerNoServers =>
      'Você ainda não está em nenhum servidor.';

  @override
  String get forwardDestinationPickerNoChannels =>
      'Nenhum canal de texto neste servidor.';

  @override
  String get forwardDestinationPickerNoConversations =>
      'Ainda não há conversas.';

  @override
  String get forwardSuccessToast => 'Mensagem encaminhada.';

  @override
  String get forwardFailedToast =>
      'Não foi possível encaminhar a mensagem -- tente novamente.';

  @override
  String get homeAddReactionTitle => 'Adicionar reação';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tópicos',
      one: '$count tópico',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'Opções da categoria';

  @override
  String get homeChannelOptionsTooltip => 'Opções do canal';

  @override
  String get homeOpenVoiceChatTooltip => 'Abrir chat';

  @override
  String get homeMarketplaceLabel => 'Mercado';

  @override
  String get homeSelectChannelPrompt => 'Selecione um canal';

  @override
  String get homeSearchTooltip => 'Pesquisar';

  @override
  String get homePinnedMessagesTooltip => 'Mensagens fixadas';

  @override
  String get homeWaitingForKey => 'Aguardando a chave de criptografia...';

  @override
  String get homeUnableToDecrypt =>
      'Não foi possível descriptografar esta mensagem.';

  @override
  String get homeMessageActionsTooltip => 'Ações da mensagem';

  @override
  String get homeCancelReplyTooltip => 'Cancelar resposta';

  @override
  String get homeRemoveAttachmentTooltip => 'Remover anexo';

  @override
  String get homeAttachFileTooltip => 'Anexar arquivo';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'Mensagem em #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'Enviar mensagem';

  @override
  String get homeEditMessageTitle => 'Editar mensagem';

  @override
  String get homeMessageLabel => 'Mensagem';

  @override
  String get homePinnedMessagesTitle => 'Mensagens fixadas';

  @override
  String get homeNoPinnedMessages => 'Nenhuma mensagem fixada';

  @override
  String get homeUnpinTooltip => 'Desafixar';

  @override
  String get homeCreateThreadTitle => 'Criar tópico';

  @override
  String get homeThreadNameHint => 'Nome do tópico';

  @override
  String homeThreadCreated(String name) {
    return 'Tópico \"$name\" criado!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Criar ou entrar';

  @override
  String get homeKodaMarketplaceTooltip => 'Mercado Koda';

  @override
  String get homeAdminPanelTooltip => 'Painel de administração';

  @override
  String get homeServerSettingsTooltip => 'Configurações do servidor';

  @override
  String get homeSettingsTooltip => 'Configurações';

  @override
  String get homeContentWarningBadge => 'Aviso de conteúdo';

  @override
  String get homeDirectMessagesTooltip => 'Mensagens diretas';

  @override
  String homeReplyingTo(String username) {
    return 'Respondendo a $username';
  }

  @override
  String get homeAttachmentFallback => 'Anexo';

  @override
  String get homeAttachmentUploadFailed => 'Falha ao enviar o anexo.';

  @override
  String homeSavedAttachment(String fileName) {
    return '$fileName salvo';
  }

  @override
  String serverConnectError(String service) {
    return 'Não foi possível iniciar a conexão com $service.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Desconectar o Printful?';

  @override
  String get serverDisconnectPrintfulBody =>
      'Este servidor não poderá mais processar pedidos de produtos até que seja reconectado.';

  @override
  String get serverDisconnectTiltifyTitle => 'Desconectar o Tiltify?';

  @override
  String get serverDisconnectTiltifyBody =>
      'Este servidor deixará de exibir o progresso da campanha beneficente até que seja reconectado.';

  @override
  String get serverNewRoleTitle => 'Novo cargo';

  @override
  String get serverEditRoleTitle => 'Editar cargo';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Cor $hex';
  }

  @override
  String get permViewChannels => 'Ver canais';

  @override
  String get permSendMessages => 'Enviar mensagens';

  @override
  String get permConnectVoice => 'Conectar-se à voz';

  @override
  String get permManageServer => 'Gerenciar servidor';

  @override
  String get permManageChannels => 'Gerenciar canais';

  @override
  String get permManageRoles => 'Gerenciar cargos';

  @override
  String get permManageMessages => 'Gerenciar mensagens';

  @override
  String get permKickMembers => 'Expulsar membros';

  @override
  String get permBanMembers => 'Banir membros';

  @override
  String get permMuteMembers => 'Silenciar membros';

  @override
  String get permMentionEveryone => 'Mencionar @everyone';

  @override
  String get permManageMarketplace => 'Gerenciar mercado';

  @override
  String get permAnnounceLive => 'Anunciar ao vivo';

  @override
  String get permMoveMembers => 'Mover membros (voz)';

  @override
  String get serverRoleNameHint => 'Nome do cargo';

  @override
  String get serverColorLabel => 'Cor';

  @override
  String get serverPermissionsLabel => 'Permissões';

  @override
  String get serverSelfAssignableTitle => 'Autoatribuível';

  @override
  String get serverSelfAssignableSubtitle =>
      'Os membros podem atribuir este cargo a si mesmos';

  @override
  String get serverDefaultRoleUndeletable =>
      'O cargo padrão não pode ser excluído.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'Excluir o cargo \"$roleName\"?';
  }

  @override
  String get serverCouldNotDeleteRole => 'Não foi possível excluir este cargo.';

  @override
  String get serverMemberFallback => 'Membro';

  @override
  String get serverNoRolesYet => 'Ainda não há cargos.';

  @override
  String get serverRefreshStatus =>
      'Já conectado pelo seu navegador? Atualize o status';

  @override
  String get serverPrintfulConnected => 'Printful conectado';

  @override
  String get serverPrintfulNotConnected => 'Printful não conectado';

  @override
  String get serverPrintfulDescription =>
      'Conecte a conta Printful deste servidor para processar pedidos de produtos feitos pelo Koda. Cada servidor conecta sua própria loja.';

  @override
  String get serverConnecting => 'Conectando...';

  @override
  String get serverConnectPrintful => 'Conectar Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify conectado';

  @override
  String get serverTiltifyNotConnected => 'Tiltify não conectado';

  @override
  String get serverTiltifyDescription =>
      'Conecte a conta Tiltify deste servidor para exibir o progresso ao vivo de uma campanha beneficente para todos os membros. Somente leitura -- o Koda nunca publica nem altera nada no Tiltify.';

  @override
  String get serverConnectTiltify => 'Conectar Tiltify';

  @override
  String get serverNoTiltifyCampaigns =>
      'Nenhuma campanha encontrada nesta conta Tiltify.';

  @override
  String get serverPickCampaign => 'Escolha qual campanha exibir';

  @override
  String get serverUntitledCampaign => 'Campanha sem título';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '$currency $raised arrecadados de $goal de meta';
  }

  @override
  String get serverViewCampaign => 'Ver campanha';

  @override
  String get serverRefreshButton => 'Atualizar';

  @override
  String get serverUploadButton => 'Enviar';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '$used / $limit vagas usadas -- nível de impulso $level';
  }

  @override
  String get serverNoCustomEmoji => 'Ainda não há emojis personalizados.';

  @override
  String get serverDeleteEmojiTooltip => 'Excluir emoji';

  @override
  String get serverUploadEmojiTitle => 'Enviar emoji';

  @override
  String get serverEmojiNameHint => 'nome (letras, números, _)';

  @override
  String get serverChooseImage => 'Escolher imagem';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Nível de impulso atual: $level';
  }

  @override
  String get serverBackgroundTitle => 'Plano de fundo do servidor';

  @override
  String get serverBackgroundDescription =>
      'Um plano de fundo personalizado exibido atrás da visualização de canais para todos os membros deste servidor.';

  @override
  String get serverBackgroundLockedHint =>
      'Alcance o nível de impulso 4 para desbloquear um plano de fundo personalizado.';

  @override
  String get serverIconBorderTitle => 'Borda do ícone do servidor';

  @override
  String get serverIconBorderDescription =>
      'Uma borda de destaque ao redor do ícone deste servidor na lista de servidores de cada membro.';

  @override
  String get serverIconBorderLockedHint =>
      'Alcance o nível de impulso 5 para desbloquear uma borda de ícone personalizada.';

  @override
  String get serverAchievementsCardTitle => 'Conquistas';

  @override
  String get serverAchievementsCardDescription =>
      'Crie emblemas personalizados e conceda-os aos membros.';

  @override
  String get serverAchievementsLockedHint =>
      'Alcance o nível de impulso 3 para criar conquistas.';

  @override
  String get serverOpenAchievements => 'Gerenciar Conquistas';

  @override
  String get serverBoostFromBank =>
      'Impulsione este servidor a partir do Banco do servidor no mercado para aumentar seu nível.';

  @override
  String get serverMarketplaceListingLabel => 'LISTAGEM NO MERCADO';

  @override
  String get serverListInMarketplace => 'Listar no Mercado Koda';

  @override
  String get serverListInMarketplaceDescription =>
      'Lista a loja deste servidor no Koda Marketplace, com chance de entrar na rotação semanal de destaques. Isso é sobre compras, não sobre encontrar servidores para entrar -- não afeta a pesquisa geral de servidores.';

  @override
  String get serverSocialLinkLabel => 'Link social/de convite (opcional)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Salvar link';

  @override
  String get serverPricingLabel => 'PREÇOS';

  @override
  String get serverPrimaryCurrencyLabel => 'Moeda principal';

  @override
  String get serverPrimaryCurrencyDescription =>
      'Aplica-se aos níveis de assinatura do servidor e aos preços de bens digitais que você definir para este servidor.';

  @override
  String get serverPrimaryLanguageLabel => 'Idioma principal';

  @override
  String get serverPrimaryLanguageDescription =>
      'Mensagens que os membros publicam em outro idioma recebem um pequeno selo de idioma, comparado a esta configuração.';

  @override
  String get serverMarketplaceLinkSaved => 'Link do mercado salvo.';

  @override
  String get serverIconUpdated => 'Ícone do servidor atualizado!';

  @override
  String get serverTemplateImported => 'Modelo importado!';

  @override
  String get serverImportFromDiscord => 'Importar do Discord';

  @override
  String get serverVispPlanLive => 'O plano do Visp está pronto!';

  @override
  String get serverAskVisp => 'Perguntar ao Visp';

  @override
  String get serverAddCategoryButton => 'Adicionar categoria';

  @override
  String get serverAddChannelHereTooltip => 'Adicionar canal aqui';

  @override
  String get serverRename => 'Renomear';

  @override
  String get serverUncategorized => 'SEM CATEGORIA';

  @override
  String get serverAddChannel => 'Adicionar canal';

  @override
  String get serverEditRulesContent => 'Editar conteúdo das regras';

  @override
  String get serverRulesContentHint =>
      'Escreva aqui as regras do seu servidor...';

  @override
  String get serverRulesUpdated => 'Regras atualizadas!';

  @override
  String get serverAddRole => 'Adicionar cargo';

  @override
  String get serverSaveRoleOrder => 'Salvar ordem';

  @override
  String get serverRoleOrderSaved => 'Ordem dos cargos salva.';

  @override
  String get serverRoleOrderSaveFailed =>
      'Não foi possível salvar a ordem dos cargos. Tente novamente.';

  @override
  String get serverDefaultRoleLabel => 'Cargo padrão';

  @override
  String get serverManageRolesTooltip => 'Gerenciar cargos';

  @override
  String get serverMutedLabel => 'Silenciado';

  @override
  String get serverExpandedLabel => 'expandido';

  @override
  String get serverCollapsedLabel => 'recolhido';

  @override
  String get serverUnmute => 'Reativar som';

  @override
  String get serverMute => 'Silenciar';

  @override
  String get serverKick => 'Expulsar';

  @override
  String get serverBan => 'Banir';

  @override
  String serverBannedUsersLabel(int count) {
    return 'USUÁRIOS BANIDOS — $count';
  }

  @override
  String get serverNoBannedUsers => 'Nenhum usuário banido.';

  @override
  String get serverUnban => 'Desbanir';

  @override
  String get serverMemberFallbackGeneric => 'este membro';

  @override
  String serverBanConfirm(String username, String serverName) {
    return 'Banir $username de $serverName? Esta pessoa não poderá voltar sem ser desbanida.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return 'Expulsar $username de $serverName? Esta pessoa poderá voltar com um convite.';
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
  String get serverMuteDuration1Day => '1 dia';

  @override
  String get serverMuteDuration1Week => '1 semana';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'Não foi possível $action $username.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return 'Silenciar $username';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'Não foi possível silenciar $username.';
  }

  @override
  String get serverUnlockInvites => 'Desbloquear convites';

  @override
  String get serverInvitesUnlocked => 'Convites desbloqueados.';

  @override
  String get serverAuditLogDescription =>
      'Atividade de moderação de nível 1 -- expulsões, banimentos, silenciamentos e proteção automática contra flood/invasões. Somente metadados; nunca o conteúdo das mensagens.';

  @override
  String get serverSystemActor => 'Sistema';

  @override
  String get serverActionKicked => 'expulsou';

  @override
  String get serverActionBanned => 'baniu';

  @override
  String get serverActionUnbanned => 'desbaniu';

  @override
  String get serverActionMuted => 'silenciou';

  @override
  String get serverActionUnmuted => 'reativou o som de';

  @override
  String get serverActionFloodDetected =>
      'silenciado automaticamente por flood';

  @override
  String get serverActionRaidLockdownEnabled =>
      'bloqueou os convites (proteção anti-invasão)';

  @override
  String get serverActionRaidLockdownDisabled => 'desbloqueou os convites';

  @override
  String get serverActionMoved => 'moveu';

  @override
  String get serverUnknownAction => 'ação desconhecida';

  @override
  String get serverNoModerationActivity =>
      'Ainda não há atividade de moderação.';

  @override
  String get serverReportsDescription =>
      'Mensagens denunciadas por membros deste servidor -- a própria cópia já descriptografada de quem denunciou, revelada ao denunciar.';

  @override
  String get serverNoPendingReports => 'Nenhuma denúncia pendente.';

  @override
  String get serverReportReasonOther => 'outro';

  @override
  String get serverReportStatusActioned => 'Resolvida';

  @override
  String get serverReportStatusDismissed => 'Descartada';

  @override
  String get serverResolvedLabel => 'RESOLVIDAS';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'Denunciado por $reporter -- enviado por $target';
  }

  @override
  String serverReportNote(String note) {
    return 'Nota: $note';
  }

  @override
  String get serverDismissButton => 'Descartar';

  @override
  String get serverMarkActioned => 'Marcar como resolvida';

  @override
  String get serverCreateInvite => 'Criar convite';

  @override
  String get serverInviteCreatedTitle => 'Convite criado';

  @override
  String get serverNoActiveInvites => 'Nenhum convite ativo';

  @override
  String serverUsesLabel(String uses) {
    return 'Usos: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Excluir convite';

  @override
  String get serverChangeIconLabel => 'Alterar ícone do servidor';

  @override
  String get serverFallbackName => 'Servidor';

  @override
  String serverSettingsTitle(String serverName) {
    return 'Configurações de $serverName';
  }

  @override
  String get serverTabChannels => 'Canais';

  @override
  String get serverTabRoles => 'Cargos';

  @override
  String get serverTabMembers => 'Membros';

  @override
  String get serverTabInvites => 'Convites';

  @override
  String get serverTabMerch => 'Produtos';

  @override
  String get serverTabEmoji => 'Emojis';

  @override
  String get serverTabCustomize => 'Personalizar';

  @override
  String get serverTabAuditLog => 'Registro de auditoria';

  @override
  String get serverTabReports => 'Denúncias';

  @override
  String get serverTabThresholdMod => 'Moderação por limite';

  @override
  String get serverTabCharity => 'Caridade';

  @override
  String get homeCustomEmojiFallback => 'emoji personalizado';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reações',
      one: '$count reação',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted => ', você reagiu, ativar para remover';

  @override
  String get homeReactionActivateToAdd => ', ativar para adicionar';

  @override
  String get homeAddReactionLabel => 'Adicionar reação';

  @override
  String homeViewProfile(String username) {
    return 'Ver perfil de $username';
  }

  @override
  String get homeMoveToVoiceChannel => 'Mover para canal de voz…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Escolha um canal de voz';

  @override
  String get homeNoOtherVoiceChannels => 'Nenhum outro canal de voz';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username agora está em $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'Não foi possível mover $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'Você agora está em $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'Entre em $channel para falar';
  }

  @override
  String get adminPanelTitle => 'Painel de Administração';

  @override
  String get adminTabBackerCodes => 'Códigos de Apoiador';

  @override
  String get adminTabUsers => 'Usuários';

  @override
  String get adminTabDmReports => 'Denúncias de MD';

  @override
  String get adminTabSpamFlags => 'Sinalizações de Spam';

  @override
  String get adminTabWiki => 'Wiki';

  @override
  String get adminTabBoosts => 'Impulsos';

  @override
  String get adminCreateBackerCodeTitle => 'Criar Código de Apoiador';

  @override
  String get adminCodeHint =>
      'Código (deixe em branco para gerar automaticamente)';

  @override
  String get adminNoteHint => 'Nota (ex.: \"Kickstarter Nível 2\")';

  @override
  String get adminFlagsJsonHint =>
      'Sinalizações como JSON, ex.: \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint => 'Usos máximos (deixe em branco = ilimitado)';

  @override
  String get adminCodeCreatedTitle => 'Código Criado';

  @override
  String get adminCodeLabel => 'Código:';

  @override
  String get adminCopyCodeTooltip => 'Copiar código';

  @override
  String adminFlagsValue(String flags) {
    return 'Sinalizações: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Códigos de Apoiador e Recompensa';

  @override
  String get adminNewCodeButton => 'Novo Código';

  @override
  String get adminNoCodesYet => 'Ainda não há códigos';

  @override
  String get adminRewardsHeader => 'Recompensas';

  @override
  String get adminRewardAlphaBetaAccess =>
      'Acesso Alpha/Beta + Insígnia Alpha Spark';

  @override
  String get adminRewardLifetimePulse =>
      'Status Pulse vitalício + Insígnia Founder + Taxa de bits melhorada';

  @override
  String get adminRewardMonthlyBoostTokenOne =>
      'Token de boost de servidor mensal (Áudio/Vídeo melhorado)';

  @override
  String get adminRewardAnimatedFrameBundle =>
      'Moldura de perfil animada + Founders Hall + 2 tokens de servidor mensais';

  @override
  String get adminRewardTitanGlow =>
      'Brilho permanente de nome de usuário \"Titan\"';

  @override
  String get adminRewardAnimatedFrame => 'Moldura animada';

  @override
  String get adminRewardFoundersHall => 'Founders Hall';

  @override
  String adminRewardMonthlyBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tokens de boost/mês',
      one: '1 token de boost/mês',
    );
    return '$_temp0';
  }

  @override
  String get adminRewardsNone => 'Sem recompensas';

  @override
  String get adminRegistrationOpenLabel => 'O registro está aberto para todos';

  @override
  String get adminRegistrationInviteOnlyLabel =>
      'O registro é somente por convite (código de apoiador necessário)';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses usos';
  }

  @override
  String get adminSearchUsersHint => 'Buscar usuários por nome de usuário...';

  @override
  String get adminSearchUsersPrompt => 'Busque um usuário acima';

  @override
  String get adminNoDmReports => 'Nenhuma denúncia de MD.';

  @override
  String get adminResolvedLabel => 'RESOLVIDO';

  @override
  String get adminReasonOther => 'outro';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Denunciante: $reporterId\nRemetente revelado: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Nota: $note';
  }

  @override
  String get adminDismissButton => 'Dispensar';

  @override
  String get adminMarkActionedButton => 'Marcar como Resolvido';

  @override
  String get adminStatusActioned => 'Resolvido';

  @override
  String get adminStatusDismissed => 'Dispensado';

  @override
  String get adminNoSpamFlags => 'Nenhuma sinalização de spam.';

  @override
  String get adminFlagMassDmSpam => 'Spam de MD em massa';

  @override
  String get adminFlagRaidLockdown => 'Bloqueio por invasão';

  @override
  String get adminFlagBotBehavior => 'Comportamento de bot';

  @override
  String get adminFlagChannelFlooding => 'Inundação de canal';

  @override
  String get adminAutoEscalatedBadge => 'AUTOESCALADO';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Confiança: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'Usuário: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Servidor: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount de $totalJoiners novos membros ainda silenciados';
  }

  @override
  String get adminNoJoinersMuted => 'Nenhum novo membro silenciado no momento';

  @override
  String adminRestrictedUntil(String until) {
    return 'Atualmente restrito até $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'Não restrito atualmente';

  @override
  String get adminDismissUndoButton => 'Dispensar e Desfazer';

  @override
  String get adminConfirmRestrictButton => 'Confirmar e Restringir';

  @override
  String get adminDeleteArticleTitle => 'Excluir artigo?';

  @override
  String adminDeleteArticleBody(String title) {
    return '\"$title\" será removido da base de conhecimento da Visp.';
  }

  @override
  String get adminNewArticleTitle => 'Novo Artigo';

  @override
  String get adminEditArticleTitle => 'Editar Artigo';

  @override
  String get adminArticleTitleHint => 'Título';

  @override
  String get adminArticleContentHint => 'Conteúdo do artigo (markdown)';

  @override
  String get adminWikiArticlesHeader => 'Artigos da Wiki';

  @override
  String get adminNoArticlesYet => 'Ainda não há artigos';

  @override
  String get adminEditArticleTooltip => 'Editar artigo';

  @override
  String get adminDeleteArticleTooltip => 'Excluir artigo';

  @override
  String get adminSearchServersHint => 'Buscar servidores por nome...';

  @override
  String get adminSearchServersPrompt => 'Busque um servidor acima';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'Conceder impulsos a $serverName';
  }

  @override
  String get adminNumBoostsHint => 'Número de impulsos';

  @override
  String get adminGrantButton => 'Conceder';

  @override
  String get adminPositiveNumberError => 'Digite um número inteiro positivo.';

  @override
  String get adminGrantBoostsFailed => 'Falha ao conceder impulsos.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count impulsos concedidos a $serverName -- agora nível $level ($activeCount ativos).',
      one:
          '$count impulso concedido a $serverName -- agora nível $level ($activeCount ativos).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count membros';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Conceder Impulsos';

  @override
  String get parentalDashboardTitle => 'Família';

  @override
  String get parentalDashboardCreateChildTitle => 'Criar Conta Infantil';

  @override
  String get parentalDashboardUsernameHint => 'Nome de usuário';

  @override
  String get parentalDashboardEmailHint => 'E-mail';

  @override
  String get parentalDashboardPasswordHint => 'Senha';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'Isso inicia uma solicitação para criar uma conta totalmente supervisionada para seu filho/a: canais rotulados são bloqueados, e você poderá definir horários permitidos e ver (mas não ler) os amigos e servidores dela. Verificamos que você é o pai, a mãe ou responsável autorizado antes de criar a conta -- escolha um método de verificação abaixo.';

  @override
  String get parentalDashboardValidationError =>
      'Nome de usuário, e-mail e uma senha com 8 ou mais caracteres são obrigatórios.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'Não foi possível iniciar a solicitação -- o nome de usuário/e-mail já pode estar em uso.';

  @override
  String get parentalDashboardCreatingLabel => 'Iniciando...';

  @override
  String get parentalDashboardNoChildren => 'Ainda não há contas vinculadas.';

  @override
  String get parentalDashboardSupervisedLabel => 'Conta supervisionada';

  @override
  String get parentalDashboardUnknownUser => 'Desconhecido';

  @override
  String get parentalConsentMethodLabel =>
      'Como devemos verificar que você é o pai, a mãe ou responsável?';

  @override
  String get parentalConsentMethodCardTitle => 'Cartão de crédito ou débito';

  @override
  String get parentalConsentMethodCardSubtitle =>
      'Uma pequena cobrança de \$0,50 verifica que você possui o cartão e é reembolsada imediatamente.';

  @override
  String get parentalConsentMethodFormTitle =>
      'Formulário de consentimento assinado';

  @override
  String get parentalConsentMethodFormSubtitle =>
      'Envie um formulário assinado. Um membro da equipe o analisará antes da criação da conta.';

  @override
  String get parentalConsentAttestation =>
      'Confirmo que sou o pai, a mãe ou responsável legal autorizado desta criança.';

  @override
  String get parentalConsentUploadFormHint =>
      'A seguir, envie seu formulário de consentimento assinado abaixo.';

  @override
  String get parentalConsentFinishInBrowser =>
      'Termine a verificação no seu navegador e depois volte -- isso será atualizado automaticamente.';

  @override
  String parentalConsentStatusRejected(String reason) {
    return 'Recusado: $reason';
  }

  @override
  String get parentalConsentStatusExpired =>
      'Solicitação expirada -- comece novamente';

  @override
  String get parentalConsentStatusAwaitingUpload =>
      'Aguardando seu formulário assinado';

  @override
  String get parentalConsentUploadFormButton => 'Enviar formulário';

  @override
  String get parentalConsentStatusAwaitingReview =>
      'Aguardando revisão da equipe';

  @override
  String get parentalConsentStatusAwaitingPayment =>
      'Aguardando verificação de pagamento';

  @override
  String get parentalConsentPendingSectionTitle => 'SOLICITAÇÕES PENDENTES';

  @override
  String get parentalConsentPrivacyNoticePrefix => 'Leia nossa ';

  @override
  String get parentalConsentPrivacyNoticeSuffix =>
      ' para ver exatamente quais informações coletamos sobre seu filho/a e como são usadas.';

  @override
  String get childDetailFallbackTitle => 'Conta infantil';

  @override
  String get childDetailTabFriends => 'Amigos';

  @override
  String get childDetailTabServers => 'Servidores';

  @override
  String get childDetailTabSchedule => 'Horário';

  @override
  String get childDetailTabOverride => 'Substituição';

  @override
  String get childDetailTabThirdParty => 'Conexões';

  @override
  String get childDetailNoFriends => 'Nenhum amigo.';

  @override
  String get childDetailUnknownUser => 'Desconhecido';

  @override
  String get childDetailRemoveFriendTooltip => 'Remover amigo';

  @override
  String get childDetailNoServers => 'Não está em nenhum servidor.';

  @override
  String childDetailMemberCount(int count) {
    return '$count membros';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Remover do servidor';

  @override
  String get childDetailRestrictAccessTitle =>
      'Restringir acesso a horários definidos';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Desativado significa acesso irrestrito a qualquer momento';

  @override
  String get childDetailTimezoneLabel => 'Fuso horário';

  @override
  String get childDetailMonday => 'Segunda-feira';

  @override
  String get childDetailTuesday => 'Terça-feira';

  @override
  String get childDetailWednesday => 'Quarta-feira';

  @override
  String get childDetailThursday => 'Quinta-feira';

  @override
  String get childDetailFriday => 'Sexta-feira';

  @override
  String get childDetailSaturday => 'Sábado';

  @override
  String get childDetailSunday => 'Domingo';

  @override
  String get childDetailNoAccessLabel => 'Sem acesso';

  @override
  String get childDetailToLabel => 'até';

  @override
  String get childDetailSavingLabel => 'Salvando...';

  @override
  String get childDetailSaveScheduleButton => 'Salvar Horário';

  @override
  String get childDetailScheduleSaved => 'Horário salvo.';

  @override
  String get childDetailOverrideExplanation =>
      'Concede acesso temporário fora do horário normal -- útil para uma exceção pontual sem alterar o horário semanal.';

  @override
  String get childDetailThirdPartyExplanation =>
      'Conectar um serviço como Twitch, Kick, YouTube, Steam ou Spotify compartilha o nome de usuário do Koda do seu filho/a e sua atividade com essa plataforma externa. Isso é separado do consentimento que criou a conta dele(a), e vem desativado por padrão -- ative apenas se quiser que seu filho/a possa vincular essas contas.';

  @override
  String get childDetailThirdPartyToggleTitle =>
      'Permitir conexões de terceiros';

  @override
  String get childDetailThirdPartyToggleSubtitle =>
      'Desativar isso desconecta imediatamente qualquer conta já vinculada';

  @override
  String get childDetailDeleteAccountTitle => 'Excluir conta';

  @override
  String childDetailDeleteAccountWarning(String username) {
    return 'Isso exclui permanentemente a conta e as informações pessoais de $username. Isso não pode ser desfeito.';
  }

  @override
  String get childDetailDeleteAccountConfirm => 'Excluir conta';

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
  String get childDetailRevokeOverrideButton => 'Revogar Substituição Ativa';

  @override
  String get childDetailAccessGranted => 'Acesso temporário concedido.';

  @override
  String get childDetailOverrideRevoked => 'Substituição revogada.';

  @override
  String get digitalGoodsTitle => 'Produtos Digitais';

  @override
  String get digitalGoodsMyProductsTitle => 'Meus Produtos';

  @override
  String get digitalGoodsManageProductsTooltip =>
      'Gerenciar os produtos deste servidor';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Mudar para Explorar';

  @override
  String get digitalGoodsCreateProductTooltip => 'Criar produto';

  @override
  String get digitalGoodsBrowseTab => 'Explorar';

  @override
  String get digitalGoodsMyListingsTab => 'Meus Anúncios';

  @override
  String get digitalGoodsMyPurchasesTab => 'Minhas Compras';

  @override
  String get digitalGoodsNoProductsYet => 'Ainda não há produtos';

  @override
  String get digitalGoodsNoProductsAvailable => 'Nenhum produto disponível';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Crie seu primeiro produto para começar a vender';

  @override
  String get digitalGoodsCheckBackLater =>
      'Volte mais tarde para ver produtos digitais';

  @override
  String get digitalGoodsCreateProductButton => 'Criar Produto';

  @override
  String get digitalGoodsLicenseKeyBadge => 'Chave de Licença';

  @override
  String get digitalGoodsFileBadge => 'Arquivo';

  @override
  String get digitalGoodsAllServersBadge => 'Todos os Servidores';

  @override
  String get digitalGoodsFreeForYou => 'Grátis para você';

  @override
  String get digitalGoodsFreeLabel => 'Grátis';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count vendidos';
  }

  @override
  String get digitalGoodsKeysButton => 'Chaves';

  @override
  String get digitalGoodsGetForFree => 'Obter Grátis';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'Comprar por $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'Ainda não há compras';

  @override
  String get digitalGoodsUnknownProduct => 'Produto Desconhecido';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'Comprado em $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Copiar chave';

  @override
  String get digitalGoodsLicenseKeyCopied => 'Chave de licença copiada!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'Expira em $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'Sua Chave de Licença';

  @override
  String get digitalGoodsCopyKeyButton => 'Copiar Chave';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'Não foi possível iniciar o checkout -- este criador pode ainda não ter conectado o Stripe.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'Compra concluída! Encontre-a em Minhas Compras.';

  @override
  String get digitalGoodsPurchasePending =>
      'Ainda aguardando esse pagamento -- ele aparecerá em Minhas Compras assim que for concluído.';

  @override
  String get digitalGoodsCreateProductTitle => 'Criar Produto';

  @override
  String get digitalGoodsEditProductTitle => 'Editar Produto';

  @override
  String get digitalGoodsProductTitleHint => 'Título do produto';

  @override
  String get digitalGoodsDescriptionHint => 'Descrição (opcional)';

  @override
  String get digitalGoodsPriceHint => 'Preço em USD (deixe vazio para grátis)';

  @override
  String get digitalGoodsProductTypeLabel => 'Tipo de produto';

  @override
  String get digitalGoodsFileDownloadOption => 'Download de arquivo';

  @override
  String get digitalGoodsLicenseKeyOption => 'Chave de licença';

  @override
  String get digitalGoodsAvailabilityLabel => 'Disponibilidade';

  @override
  String get digitalGoodsThisServerOnlyOption => 'Somente este servidor';

  @override
  String get digitalGoodsAllKodaServersOption => 'Todos os servidores Koda';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'Depois de criar, use o botão \"Chaves\" para enviar suas chaves de licença.';

  @override
  String get digitalGoodsProductFileLabel => 'Arquivo do produto';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName (${sizeMb}MB)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Remover arquivo';

  @override
  String get digitalGoodsUploadingLabel => 'Enviando...';

  @override
  String get digitalGoodsChooseFileButton => 'Escolher Arquivo';

  @override
  String get digitalGoodsReplaceFileButton => 'Substituir Arquivo';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Escolha um arquivo para este produto antes de salvar.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'Enviar Chaves de Licença';

  @override
  String get digitalGoodsPasteKeysHint => 'Cole uma chave por linha:';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Enviar Chaves';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'Chaves de licença enviadas!';

  @override
  String get serverSubscriptionManageTitle => 'Gerenciar Assinaturas';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return 'Assinaturas de $serverName';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Adicionar nível';

  @override
  String get serverSubscriptionNoTiersYet =>
      'Ainda não há níveis de assinatura';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Crie até 3 níveis para sua comunidade';

  @override
  String get serverSubscriptionCreateFirstTierButton => 'Criar Primeiro Nível';

  @override
  String get serverSubscriptionShowSubscriberCounts =>
      'Mostrar número de assinantes';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/mês';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count assinantes ativos',
      one: '$count assinante ativo',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned =>
      'Cargo atribuído automaticamente';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '$discount% de desconto na loja';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'Este servidor não tem níveis de assinatura';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Assinante Ativo';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'Expira em $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk =>
      'Cargo exclusivo de assinante';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return '$discount% de desconto em compras na loja';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Canais exclusivos para assinantes';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Atualmente Assinante';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'Assinar por $price/mês';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Criar Nível';

  @override
  String get serverSubscriptionEditTierTitle => 'Editar Nível';

  @override
  String get serverSubscriptionTierNameHint =>
      'Nome do nível (ex.: Fã, Apoiador, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Descrição (opcional)';

  @override
  String get serverSubscriptionPriceHint => 'Preço por mês (USD)';

  @override
  String get serverSubscriptionDiscountLabel => '% de desconto na loja';

  @override
  String get serverSubscriptionPositionLabel => 'Posição';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Nível $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Concede um cargo ao assinar — opcional';

  @override
  String get serverSubscriptionRoleFallback => 'cargo';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Concedido automaticamente a um membro no momento em que ele assina, e removido no momento em que sua assinatura expira.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Nível criado -- conecte o Stripe em Loja → Criador antes que os membros possam assinar.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Excluir Nível';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return 'Excluir \"$tierName\"? Os assinantes atuais manterão o acesso até o vencimento.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'Assinar $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel => 'Assinatura mensal';

  @override
  String get serverSubscriptionServerBankEarnsLabel =>
      'O banco do servidor ganha';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points pts';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Pagamento processado com segurança pelo Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'Assinar';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'Não foi possível iniciar o checkout -- o proprietário deste servidor pode ainda não ter conectado o Stripe.';

  @override
  String get serverSubscriptionSubscribed => 'Assinado!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'Ainda aguardando esse pagamento -- será ativado assim que for concluído.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'Dar gorjeta para $username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Selecionar valor';

  @override
  String get tipDialogMessageHint => 'Adicionar uma mensagem (opcional)';

  @override
  String get tipDialogYouPayLabel => 'Você paga';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username recebe';
  }

  @override
  String get tipDialogSendTipButton => 'Enviar Gorjeta';

  @override
  String get tipDialogFailedToSendTip =>
      'Falha ao enviar a gorjeta. O criador pode não estar conectado ao Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'Não foi possível iniciar o checkout. Tente novamente em instantes.';

  @override
  String get tipDialogTipSent => 'Gorjeta enviada!';

  @override
  String get tipDialogTipPending =>
      'Ainda aguardando esse pagamento -- será processada assim que for concluído.';

  @override
  String get tipDialogUnknownUser => 'Desconhecido';

  @override
  String get marketplaceTitle => 'Loja';

  @override
  String get marketplaceCreatorPayoutsTitle => 'Pagamentos a Criadores';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Receba gorjetas diretamente via Stripe';

  @override
  String get marketplaceTabServerBank => 'Banco do Servidor';

  @override
  String get marketplaceTabDigitalGoods => 'Produtos Digitais';

  @override
  String get marketplaceTabMerch => 'Produtos';

  @override
  String get marketplaceTabSubscription => 'Assinatura';

  @override
  String get marketplaceTabRevenue => 'Receita';

  @override
  String get marketplaceSelectServerSubscription =>
      'Selecione um servidor para ver a assinatura dele';

  @override
  String get marketplaceSelectServerBank =>
      'Selecione um servidor para ver o banco dele';

  @override
  String get marketplaceSelectServerRevenue =>
      'Selecione um servidor para ver a receita dele';

  @override
  String get marketplaceStripeAccountStatus => 'Conta Stripe';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Integração concluída';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'Aceitando pagamentos';

  @override
  String get marketplaceConnectStripeButton => 'Conectar Conta Stripe';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Concluir Integração do Stripe';

  @override
  String get marketplaceRefreshStatusButton => 'Atualizar Status';

  @override
  String get marketplaceReadyToReceiveTips =>
      'Você está pronto para receber gorjetas!';

  @override
  String get marketplaceHowItWorksTitle => 'Como funciona';

  @override
  String get marketplaceHowItWorksStep1 => 'Conecte sua conta Stripe';

  @override
  String get marketplaceHowItWorksStep2 =>
      'Conclua a verificação de identidade';

  @override
  String get marketplaceHowItWorksStep3 =>
      'Receba gorjetas diretamente no seu banco';

  @override
  String get marketplaceProcessingFeeNote =>
      'A Koda cobra uma taxa de processamento de 5%. A taxa vai para o banco do seu servidor em forma de pontos.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Somente o dono do servidor ou alguém com a permissão Gerenciar Loja pode ver o Banco do Servidor.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName impulsionado!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit espaços de emoji personalizados';
  }

  @override
  String get marketplaceServerFallback => 'Servidor';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance pts';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount em atividade';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'Os pontos vêm da taxa de processamento de 5% sobre gorjetas e assinaturas neste servidor. Use os pontos para desbloquear melhorias do servidor.';

  @override
  String get marketplaceServerBoostsTitle => 'Impulsos do Servidor';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Nível $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count impulsos ativos',
      one: '$count impulso ativo',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: 'Faltam $more impulsos para alcançar o nível $level',
      one: 'Faltam $more impulso para alcançar o nível $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' e desbloqueia um fundo de servidor personalizado';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' e desbloqueia uma borda de ícone de servidor personalizada';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Você tem $count tokens de impulso disponíveis.',
      one: 'Você tem $count token de impulso disponível.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'Os tokens de impulso vêm de uma assinatura Pulse (1/mês). Assine na aba Assinaturas para conseguir um.';

  @override
  String get marketplaceBoostingLabel => 'Impulsionando...';

  @override
  String get marketplaceBoostThisServerButton => 'Impulsionar Este Servidor';

  @override
  String get marketplaceComingSoonUpgradesTitle =>
      'Em breve — Melhorias do servidor';

  @override
  String get marketplaceSpendPointsList =>
      'Gaste os pontos do banco do servidor em:\n• Domínio de servidor personalizado\n• Limite de membros aumentado\n• Suporte prioritário\n• Selo exclusivo de servidor';

  @override
  String get marketplaceSourceTip => 'Gorjetas';

  @override
  String get marketplaceSourceSubscription => 'Assinaturas Koda';

  @override
  String get marketplaceSourceServerSubscription => 'Assinaturas do Servidor';

  @override
  String get marketplaceSourceDigitalProduct => 'Produtos Digitais';

  @override
  String get marketplaceSourceStageTicket => 'Ingressos de Palco';

  @override
  String get marketplaceSourcePrintfulOrder => 'Pedidos de Produtos';

  @override
  String get marketplaceJustNow => 'agora mesmo';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return 'há ${minutes}m';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return 'há ${hours}h';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return 'há ${days}d';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Somente membros que podem gerenciar a loja podem ver a receita deste servidor.';

  @override
  String get marketplaceBalanceLabel => 'Saldo';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Total Ganho';

  @override
  String get marketplaceLast30DaysTitle => 'Últimos 30 Dias';

  @override
  String get marketplaceRevenueBySourceTitle => 'Receita por Origem';

  @override
  String get marketplaceNoRevenueYet => 'Ainda não há receita.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count transações',
      one: '$count transação',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'Transações Recentes';

  @override
  String get marketplaceNoTransactionsYet => 'Ainda não há transações.';

  @override
  String get marketplaceNoActivityYet => 'Ainda não há atividade';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count produtos sincronizados do Printful',
      one: '$count produto sincronizado do Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Não foi possível sincronizar com o Printful -- verifique a conexão nas configurações de Produtos.';

  @override
  String get printfulMerchSelectServer =>
      'Selecione um servidor para ver seus produtos';

  @override
  String get printfulMerchManageCatalogTitle =>
      'Gerenciar Catálogo de Produtos';

  @override
  String get printfulMerchTitle => 'Produtos';

  @override
  String get printfulMerchSyncingLabel => 'Sincronizando...';

  @override
  String get printfulMerchSyncCatalogButton => 'Sincronizar Catálogo';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'Mudar para Explorar';

  @override
  String get printfulMerchManageTooltip =>
      'Gerenciar os produtos deste servidor';

  @override
  String get printfulMerchNothingSyncedYet => 'Nada sincronizado ainda';

  @override
  String get printfulMerchNoMerchAvailable => 'Nenhum produto disponível ainda';

  @override
  String get printfulMerchSyncHint =>
      'Sincronize sua loja Printful para importar seu catálogo de produtos';

  @override
  String get printfulMerchCheckBackLater =>
      'Volte mais tarde para ver produtos deste servidor';

  @override
  String get printfulMerchOutOfStock => 'Esgotado';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'A partir de $price • $count opções',
      one: 'A partir de $price • $count opção',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'Ver';

  @override
  String printfulMerchPayoutTo(String username) {
    return 'Pagamento para: $username';
  }

  @override
  String get printfulMerchPayoutToYou => 'Pagamento para: você';

  @override
  String get printfulMerchPayoutChangeButton => 'Alterar';

  @override
  String get printfulMerchPayoutDialogTitle => 'Destinatário do Pagamento';

  @override
  String get printfulMerchPayoutDialogBody =>
      'Direcione a parte da receita do pedido deste item para outro usuário em vez de você -- essa pessoa precisará conectar sua própria conta Stripe e concluir o cadastro antes que alguém possa comprá-lo.';

  @override
  String get printfulMerchPayoutUsernameHint => 'Nome de usuário';

  @override
  String get printfulMerchPayoutLookupButton => 'Buscar';

  @override
  String get printfulMerchPayoutUserNotFound =>
      'Nenhum usuário encontrado com esse nome.';

  @override
  String printfulMerchPayoutResolvedAs(String username) {
    return 'Encontrado: $username';
  }

  @override
  String get printfulMerchPayoutResetButton => 'Redefinir para mim';

  @override
  String get printfulMerchCartTooltip => 'Carrinho';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productName adicionado ao carrinho';
  }

  @override
  String get printfulMerchQuantityLabel => 'Quantidade';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Diminuir quantidade';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Aumentar quantidade';

  @override
  String get printfulMerchAddToCartButton => 'Adicionar ao Carrinho';

  @override
  String get printfulMerchOptionLabel => 'Opção';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Estilo';

  @override
  String get printfulMerchSizeLabel => 'Tamanho';

  @override
  String get printfulMerchYourCartTitle => 'Seu Carrinho';

  @override
  String get printfulMerchCartEmpty => 'Seu carrinho está vazio.';

  @override
  String get printfulMerchSubtotalLabel => 'Subtotal';

  @override
  String get printfulMerchCheckoutLabel => 'Finalizar Compra';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'Remover do carrinho';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Preencha seu endereço de entrega primeiro.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'Não foi possível obter as taxas de envio para esse endereço.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'Não foi possível iniciar o checkout. Tente novamente em instantes.';

  @override
  String get printfulMerchOrderPlaced => 'Pedido realizado!';

  @override
  String get printfulMerchOrderPending =>
      'Ainda aguardando esse pagamento -- será realizado assim que for concluído.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Velocidade de envio';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max dias úteis';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => 'Obter Cotação de Frete';

  @override
  String get printfulMerchPayButton => 'Pagar';

  @override
  String get kodaMarketplaceTitle => 'Koda Marketplace';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Assinaturas';

  @override
  String get kodaMarketplaceTabBoosts => 'Impulsos';

  @override
  String get kodaMarketplaceTabDiscover => 'Descobrir';

  @override
  String get kodaMarketplaceTierFreeName => 'Grátis';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'Expira em $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks =>
      'Faça upgrade para vantagens exclusivas';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tokens de impulso disponíveis',
      one: '$count token de impulso disponível',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Presenteie um token a qualquer servidor do qual você participe, pela aba Banco do Servidor dele';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame =>
      'Moldura de avatar personalizada';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Selo Spark no perfil';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Limite de upload de arquivo aumentado (50MB)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality =>
      'Qualidade de voz prioritária';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'Tudo do Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame =>
      'Moldura de avatar animada';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Selo Pulse no perfil';

  @override
  String get kodaMarketplacePulsePerkFileLimit =>
      'Limite de upload de arquivo de 100MB';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      '1 token de impulso de servidor por mês';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/mês';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Plano Atual';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'Obter $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return 'Presentear $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return 'Presentear $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'Assinar $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel =>
      'Nome de usuário do presenteado:';

  @override
  String get kodaMarketplaceUsernameHint => 'Nome de usuário';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Assinatura';

  @override
  String get kodaMarketplaceTotalLabel => 'Total';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Pagamento processado com segurança pelo Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton =>
      'Prosseguir para o Pagamento';

  @override
  String get kodaMarketplaceUserNotFound => 'Usuário não encontrado';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'Não foi possível iniciar o checkout. Tente novamente em instantes.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'Assinatura ativa!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'Ainda aguardando esse pagamento -- será ativado assim que for concluído.';

  @override
  String get kodaMarketplaceBoostPurchased => 'Impulso comprado!';

  @override
  String get kodaMarketplaceBoostPending =>
      'Ainda aguardando esse pagamento -- estará pronto assim que for concluído.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count disponíveis';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Comprar um Impulso';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'Uma compra única -- assinantes Pulse também recebem um token grátis a cada renovação, o que continua sendo a melhor opção se você impulsiona regularmente.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Comprar um Impulso -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Nenhum servidor optou pelo Koda Marketplace ainda. Donos de servidor podem ativar isso nas configurações de Personalização do servidor.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => 'EM DESTAQUE ESTA SEMANA';

  @override
  String get kodaMarketplaceAllListedServersHeader =>
      'TODOS OS SERVIDORES LISTADOS';

  @override
  String get kodaMarketplaceFeaturedItemsHeader => 'ITENS EM DESTAQUE';

  @override
  String get kodaMarketplaceAllItemsHeader => 'TODOS OS ITENS';

  @override
  String get kodaMarketplaceServerFallback => 'Servidor';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membros',
      one: '$count membro',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceVisitStore => 'Visitar loja';

  @override
  String get calendarFallbackTitle => 'Calendário';

  @override
  String get calendarAskVispTooltip => 'Perguntar à Visp';

  @override
  String get calendarCreateEventTooltip => 'Criar Evento';

  @override
  String get calendarSyncTooltip => 'Sincronizar com seu app de calendário';

  @override
  String get calendarSyncDialogTitle => 'Sincronizar este calendário';

  @override
  String get calendarSyncDialogDescription =>
      'Inscreva-se nesta URL no Google Agenda, Apple Calendário, Outlook ou qualquer app que suporte \"inscrever-se por URL\" para ver os eventos deste servidor no seu próprio calendário. Somente leitura, e inclui apenas eventos de canais que você pode ver.';

  @override
  String get calendarSyncCopyTooltip => 'Copiar URL';

  @override
  String get calendarSyncCopiedToast => 'URL do calendário copiada.';

  @override
  String get calendarSyncRegenerateTooltip => 'Gerar nova URL';

  @override
  String get calendarSyncRegenerate => 'Gerar nova';

  @override
  String get calendarSyncRegenerateConfirmTitle =>
      'Gerar nova URL do calendário?';

  @override
  String get calendarSyncRegenerateConfirmBody =>
      'A URL antiga deixará de funcionar imediatamente -- onde você já se inscreveu, será preciso a nova.';

  @override
  String get calendarSyncInstructions =>
      'Google Agenda: Outros calendários > Por URL. Apple Calendário: Arquivo > Nova inscrição de calendário. Outlook: Adicionar calendário > Inscrever-se pela web.';

  @override
  String get calendarPreviousMonthTooltip => 'Mês anterior';

  @override
  String get calendarNextMonthTooltip => 'Próximo mês';

  @override
  String get calendarTodayButton => 'Hoje';

  @override
  String get calendarWeekdaySun => 'dom';

  @override
  String get calendarWeekdayMon => 'seg';

  @override
  String get calendarWeekdayTue => 'ter';

  @override
  String get calendarWeekdayWed => 'qua';

  @override
  String get calendarWeekdayThu => 'qui';

  @override
  String get calendarWeekdayFri => 'sex';

  @override
  String get calendarWeekdaySat => 'sáb';

  @override
  String get calendarTodaySuffix => ', hoje';

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
  String get calendarSelectADay => 'Selecione um dia';

  @override
  String get calendarNoEvents => 'Nenhum evento';

  @override
  String get calendarSubscribeTooltip => 'Assinar';

  @override
  String get calendarUnsubscribeTooltip => 'Cancelar assinatura';

  @override
  String get calendarReminderOffTooltip => 'Lembrar-me';

  @override
  String get calendarReminderOnTooltip => 'Desativar lembrete';

  @override
  String get calendarAddToCalendarTooltip => 'Adicionar ao meu calendário';

  @override
  String get calendarIcsSaved => 'Arquivo de calendário salvo';

  @override
  String get upcomingEventsTitle => 'Próximos';

  @override
  String get upcomingEventsEmptyState =>
      'Nenhum evento próximo nos seus servidores';

  @override
  String get userCalendarMyTitle => 'My calendar';

  @override
  String userCalendarOtherTitle(String username) {
    return '$username\'s calendar';
  }

  @override
  String get userCalendarEmptyState => 'No confirmed events yet';

  @override
  String get upcomingEventsPublicBadge => 'Público';

  @override
  String upcomingEventsFriendGoing(String name) {
    return '$name vai participar';
  }

  @override
  String upcomingEventsTwoFriendsGoing(String name1, String name2) {
    return '$name1 e $name2 vão participar';
  }

  @override
  String upcomingEventsManyFriendsGoing(String name, int count) {
    return '$name e mais $count vão participar';
  }

  @override
  String get activityFeedTitle => 'Feed de Atividade';

  @override
  String get activityFeedEmptyState => 'Ainda não há atividade dos seus amigos';

  @override
  String activityFeedAchievement(
      String username, String achievement, String server) {
    return '$username conquistou $achievement em $server';
  }

  @override
  String activityFeedWentLive(String username, String platform) {
    return '$username está ao vivo na $platform';
  }

  @override
  String activityFeedServerJoined(String username, String server) {
    return '$username entrou em $server';
  }

  @override
  String activityFeedArcadeHighScore(String username, String game, int score) {
    return '$username conseguiu uma nova pontuação máxima em $game: $score';
  }

  @override
  String get activityFeedJustNow => 'Agora mesmo';

  @override
  String activityFeedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count minutos',
      one: 'há 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String activityFeedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count horas',
      one: 'há 1 hora',
    );
    return '$_temp0';
  }

  @override
  String activityFeedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count dias',
      one: 'há 1 dia',
    );
    return '$_temp0';
  }

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'Repete $recurrence';
  }

  @override
  String get calendarTicketOwned => 'Ingresso adquirido';

  @override
  String calendarTicketPrice(String price) {
    return 'Ingresso $price';
  }

  @override
  String get calendarDeleteEventTitle => 'Excluir Evento';

  @override
  String calendarDeleteEventConfirm(String title) {
    return 'Excluir \"$title\"? Isso não pode ser desfeito.';
  }

  @override
  String get calendarEditEventTitle => 'Editar Evento';

  @override
  String get calendarCreateEventTitle => 'Criar Evento';

  @override
  String get calendarEventTitleHint => 'Título do evento';

  @override
  String get calendarDescriptionHint => 'Descrição (opcional)';

  @override
  String get calendarLocationHint => 'Local (opcional)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Início ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Data e hora de início, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'Fim — opcional ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'Data e hora de término, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'não definido';

  @override
  String get calendarTapToSetEndTime => 'Toque para definir a hora de término';

  @override
  String get calendarRecurrenceLabel => 'Recorrência';

  @override
  String get calendarRecurrenceNone => 'Não se repete';

  @override
  String get calendarRecurrenceDaily => 'Diariamente';

  @override
  String get calendarRecurrenceWeekly => 'Semanalmente';

  @override
  String get calendarRecurrenceMonthly => 'Mensalmente';

  @override
  String get calendarColorLabel => 'Cor';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Cor $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Preço do ingresso — opcional';

  @override
  String get calendarLinkStageChannelLabel =>
      'Vincular a canal de palco — opcional';

  @override
  String get calendarStageChannelFallback => 'palco';

  @override
  String get discordImportFetchError => 'Não foi possível obter o modelo.';

  @override
  String get discordImportApplyError =>
      'Falha ao aplicar o modelo. Tente novamente.';

  @override
  String get discordImportTitle => 'Importar Modelo do Discord';

  @override
  String get discordImportDescription =>
      'Cole um link discord.new ou código de modelo para importar cargos, categorias e canais para este servidor.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 ou código do modelo';

  @override
  String get discordImportPreviewButton => 'Pré-visualizar';

  @override
  String get discordImportTemplateFallback => 'Modelo';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cargos',
      one: '$count cargo',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categorias',
      one: '$count categoria',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count canais',
      one: '$count canal',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel =>
      'SUBSTITUIR ESTRUTURA EXISTENTE';

  @override
  String get discordImportReplaceWarning =>
      'Todos os canais, categorias e cargos existentes serão excluídos permanentemente.';

  @override
  String get discordImportAddDescription =>
      'O modelo será adicionado à estrutura existente do seu servidor.';

  @override
  String get discordImportReplaceConfirmTitle =>
      'Substituir a estrutura do servidor?';

  @override
  String get discordImportReplaceConfirmBody =>
      'Isso excluirá permanentemente TODOS os canais, categorias e cargos existentes antes de importar. Isso não pode ser desfeito.';

  @override
  String get discordImportYesReplace => 'Sim, Substituir';

  @override
  String get discordImportReplaceAndImportButton =>
      'Substituir e Importar Modelo';

  @override
  String get discordImportAddToServerButton => 'Adicionar Modelo ao Servidor';

  @override
  String get thresholdModConfigureTitle => 'Configurar Moderação por Limiar';

  @override
  String get thresholdModConfigureExplanation =>
      'Escolha moderadores de confiança e quantos deles devem concordar antes que qualquer um possa descriptografar uma época do histórico de um canal. Nem mesmo você tem uma chave unilateral -- você só fica isento se também estiver nesta lista.';

  @override
  String get thresholdModThresholdLabel => 'Limiar:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Diminuir limiar';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Aumentar limiar';

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
      'Solicitar Descriptografia por Limiar';

  @override
  String get thresholdModChannelLabel => 'Canal';

  @override
  String get thresholdModReasonHint =>
      'Motivo -- exibido para cada moderador designado';

  @override
  String get thresholdModRequestButton => 'Solicitar';

  @override
  String get thresholdModShareRelayed => 'Parte retransmitida ao solicitante.';

  @override
  String get thresholdModNotEnoughShares =>
      'Ainda não há partes suficientes retransmitidas -- tente novamente quando mais moderadores retransmitirem as suas.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mensagens',
      one: '$count mensagem',
    );
    return 'Época $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'Nenhuma mensagem descriptografável nesta época.';

  @override
  String get thresholdModExplanation =>
      'Descriptografia real do histórico de um canal, condicionada à concordância ativa de vários moderadores designados -- nunca uma única pessoa sozinha, nem mesmo o dono do servidor. Só desbloqueia uma época inteira (tudo que foi enviado desde a última mudança de membros), nunca uma única mensagem.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Ativado -- $count moderadores, limiar $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'Não configurado';

  @override
  String get thresholdModReconfigureButton => 'Reconfigurar';

  @override
  String get thresholdModEnableButton => 'Ativar';

  @override
  String get thresholdModNotEnabledForServer =>
      'A moderação por limiar não está ativada para este servidor.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Ativada para este servidor. Você não é um dos moderadores designados.';

  @override
  String get thresholdModRequestsLabel => 'Solicitações';

  @override
  String get thresholdModRequestDecryptButton => 'Solicitar Descriptografia';

  @override
  String get thresholdModNoActiveRequests => 'Nenhuma solicitação ativa.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- época $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'pendente';

  @override
  String get thresholdModStatusApproved => 'aprovada';

  @override
  String get thresholdModApproveButton => 'Aprovar';

  @override
  String get thresholdModRelayShareButton => 'Retransmitir Minha Parte';

  @override
  String get thresholdModTryReconstructButton => 'Tentar Reconstruir';

  @override
  String get roleSelectNoRolesAvailable =>
      'Nenhum cargo autoatribuível disponível.';

  @override
  String get roleSelectInstructions =>
      'Selecione os cargos que deseja. Toque em um cargo para adicioná-lo ou removê-lo.';

  @override
  String get rulesScreenAcceptError =>
      'Não foi possível aceitar as regras. Tente novamente.';

  @override
  String get rulesScreenSubtitle => 'Regras do Servidor';

  @override
  String get rulesScreenScrollToRead =>
      'Role para baixo para ler todas as regras';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'Ao clicar em Aceitar, você concorda em seguir estas regras.\nViolações podem resultar em remoção do servidor.';

  @override
  String get rulesScreenAcceptButton => 'Eu Aceito as Regras';

  @override
  String get rulesScreenReadAllToContinue =>
      'Leia todas as regras para continuar';

  @override
  String get galleryNewPostTitle => 'Nova Publicação';

  @override
  String get galleryChooseFileButton => 'Escolher Arquivo';

  @override
  String get galleryOrDivider => 'ou';

  @override
  String get galleryPasteUrlHint => 'Cole a URL da imagem/vídeo';

  @override
  String get galleryTypeLabel => 'Tipo';

  @override
  String get galleryImageOption => 'Imagem';

  @override
  String get galleryVideoOption => 'Vídeo';

  @override
  String get galleryCaptionHint => 'Legenda (opcional)';

  @override
  String get galleryPostButton => 'Publicar';

  @override
  String get galleryNewCollectionTitle => 'Nova Coleção';

  @override
  String get galleryCollectionNameHint => 'Nome da coleção';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return 'Excluir \"$collectionName\"? As publicações dentro dela ficarão sem coleção.';
  }

  @override
  String get galleryFeedTab => 'Feed';

  @override
  String get galleryCollectionsTab => 'Coleções';

  @override
  String get galleryNoPostsYet => 'Ainda não há publicações';

  @override
  String get galleryNoCollectionsYet => 'Ainda não há coleções';

  @override
  String get gallerySelectACollection => 'Selecione uma coleção';

  @override
  String get galleryNoPostsInCollection => 'Nenhuma publicação nesta coleção';

  @override
  String get galleryAddPostButton => 'Adicionar Publicação';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Falha ao compartilhar tela: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return 'Volume de $username';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'Afeta apenas o que você ouve -- este dispositivo, esta chamada.';

  @override
  String get voiceScreenResetVolumeButton => 'Redefinir';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'Não foi possível conectar: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Sua tela, toque para ver em tela cheia';

  @override
  String get voiceScreenYourScreenLabel => 'Sua tela';

  @override
  String get voiceScreenTapToClose => 'Toque para fechar';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (você)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', falando';

  @override
  String get voiceScreenCameraOnSuffix => ', câmera ligada';

  @override
  String get voiceScreenActivateToPopOut => ', ative para destacar em janela';

  @override
  String get voiceScreenShowVarmTooltip => 'Mostrar VARM';

  @override
  String get voiceScreenHideVarmTooltip => 'Ocultar VARM';

  @override
  String get voiceScreenShowChatTooltip => 'Mostrar chat';

  @override
  String get voiceScreenHideChatTooltip => 'Ocultar chat';

  @override
  String get voiceScreenStartCameraTooltip => 'Iniciar câmera';

  @override
  String get voiceScreenStopCameraTooltip => 'Parar câmera';

  @override
  String get voiceScreenShareScreenTooltip => 'Compartilhar tela';

  @override
  String get voiceScreenStopSharingTooltip => 'Parar compartilhamento';

  @override
  String get voiceScreenPopOutTooltip => 'Destacar voz em janela separada';

  @override
  String get voiceScreenCouldNotPopOut => 'Não foi possível destacar a voz.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Sair da Chamada de Voz';

  @override
  String get voiceScreenPinTooltip => 'Fixar (manter aberto)';

  @override
  String get voiceScreenUnpinTooltip => 'Desafixar';

  @override
  String get voiceScreenSizeSmall => 'Pequeno (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Médio (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Grande (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, $count conectados';
  }

  @override
  String get voiceBarSpeakingSuffix => ', você está falando';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count conectados · toque para expandir';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Iniciar câmera';

  @override
  String get voiceBarStopCameraTooltip => 'Parar câmera';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Sair da Chamada de Voz';

  @override
  String get popOutVideoFallbackTitle => 'Voz';

  @override
  String get popOutVideoMissingTokenError => 'Token ou URL ausente';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Conexão expirou após 15 segundos';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Erro: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'Nenhum participante';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Palco';

  @override
  String get stageCouldNotJoin => 'Não foi possível entrar no palco.';

  @override
  String get stageThisStageFallback => 'Este palco';

  @override
  String get stageRequiresTicketToJoin => 'requer um ingresso para entrar';

  @override
  String get stagePleaseWaitLabel => 'Aguarde...';

  @override
  String get stageGetFreeTicketButton => 'Obter Ingresso Grátis';

  @override
  String stageBuyTicketButton(String price) {
    return 'Comprar Ingresso -- $price';
  }

  @override
  String get stageNotNowButton => 'Agora não';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'Não foi possível iniciar a compra do ingresso.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'Ainda aguardando esse pagamento -- tente entrar novamente assim que for confirmado.';

  @override
  String get stageSpeakerBadge => 'Palestrante';

  @override
  String get stageListenerBadge => 'Ouvinte';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'Não foi possível entrar: $error';
  }

  @override
  String get stageSpeakersHeader => 'PALESTRANTES';

  @override
  String get stageRaisedHandsHeader => 'MÃOS LEVANTADAS';

  @override
  String get stageAllowButton => 'Permitir';

  @override
  String get stageIgnoreButton => 'Ignorar';

  @override
  String get stageListenersHeader => 'OUVINTES';

  @override
  String get stageRaiseHandTooltip => 'Levantar a mão';

  @override
  String get stageLowerHandTooltip => 'Abaixar a mão';

  @override
  String get stageLeaveStageTooltip => 'Sair do Palco';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (você)';
  }

  @override
  String get stageMoveToListenersButton => 'Mover para ouvintes';

  @override
  String get stageYouFallbackName => 'Você';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'Avatar de $username';
  }

  @override
  String get channelEditDialogNewTitle => 'Novo Canal';

  @override
  String get channelEditDialogEditTitle => 'Editar Canal';

  @override
  String get channelEditDialogNameHint => 'Nome do canal';

  @override
  String get channelEditDialogDescriptionHint => 'Tópico (opcional)';

  @override
  String get channelEditDialogTypeLabel => 'Tipo';

  @override
  String get channelEditDialogTypeText => 'Texto';

  @override
  String get channelEditDialogTypeVoice => 'Voz';

  @override
  String get channelEditDialogTypeGallery => 'Galeria';

  @override
  String get channelEditDialogTypeStage => 'Palco';

  @override
  String get channelEditDialogTypeRules => 'Regras';

  @override
  String get channelEditDialogTypeRoleSelection => 'Seleção de Cargo';

  @override
  String get channelEditDialogTypeCalendar => 'Calendário';

  @override
  String get channelEditDialogAnnouncementTitle => 'Canal de anúncios';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Somente membros que podem gerenciar mensagens podem publicar';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Publique aqui anúncios de transmissões ao vivo e uploads';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'Publica automaticamente quando um membro com a permissão \"Anunciar ao vivo\" entra ao vivo na Twitch ou publica um novo vídeo no YouTube';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Notificar esses cargos ao publicar (opcional)';

  @override
  String get channelEditDialogSlowmodeLabel => 'Modo lento';

  @override
  String get channelEditDialogSlowmodeOff => 'Desativado';

  @override
  String get channelEditDialogUserLimitLabel => 'Limite de usuários';

  @override
  String get channelEditDialogUserLimitOff => 'Sem limite';

  @override
  String get channelEditDialogCategoryLabel => 'Categoria';

  @override
  String get channelEditDialogNoCategory => 'Sem categoria';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Acesso por Cargo (deixe vazio para todos)';

  @override
  String get channelEditDialogContentLabelsLabel => 'Rótulos de Conteúdo';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Sinaliza este canal para os filtros de conteúdo dos membros; totalmente bloqueado para contas supervisionadas';

  @override
  String get categoryEditDialogNewTitle => 'Nova Categoria';

  @override
  String get categoryEditDialogEditTitle => 'Editar Categoria';

  @override
  String get categoryEditDialogNameHint => 'Nome da categoria';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Acesso por Cargo (deixe vazio para todos)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Membros — $count online';
  }

  @override
  String get memberPanelRefreshTooltip => 'Atualizar lista de membros';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membros',
      one: '$count membro',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Offline';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', nível $tier';
  }

  @override
  String get memberPanelUnknownUser => 'Desconhecido';

  @override
  String get memberPanelModerationActionsTooltip => 'Ações de moderação';

  @override
  String get reportDialogReasonSpam => 'Spam';

  @override
  String get reportDialogReasonHarassment => 'Assédio ou abuso';

  @override
  String get reportDialogReasonIllegal => 'Conteúdo ilegal';

  @override
  String get reportDialogReasonOther => 'Outro';

  @override
  String get reportDialogReasonLabel => 'Motivo';

  @override
  String get reportDialogNoteHint =>
      'Mais alguma coisa que os moderadores devam saber? (opcional)';

  @override
  String get reportDialogDisclosureNote =>
      'O conteúdo da mensagem exibido para você e quem a enviou serão compartilhados com os moderadores deste servidor.';

  @override
  String get reportDialogSubmitButton => 'Enviar Denúncia';

  @override
  String get reportDialogSubmitError => 'Não foi possível enviar a denúncia.';

  @override
  String get notificationBellTitle => 'Notificações';

  @override
  String get notificationBellMarkAllRead => 'Marcar tudo como lido';

  @override
  String get notificationBellEmptyState => 'Ainda não há notificações';

  @override
  String get notificationBellUnreadLabel => 'Não lido';

  @override
  String get invitePreviewTitle => 'Convite do Servidor';

  @override
  String get invitePreviewInvalidOrExpired => 'Convite inválido ou expirado.';

  @override
  String get invitePreviewCouldNotJoin =>
      'Não foi possível entrar no servidor.';

  @override
  String get invitePreviewUnknownServer => 'Servidor desconhecido';

  @override
  String get shippingAddressFullNameHint => 'Nome completo';

  @override
  String get shippingAddressLine1Hint => 'Endereço linha 1';

  @override
  String get shippingAddressLine2Hint => 'Endereço linha 2 (opcional)';

  @override
  String get shippingAddressCityHint => 'Cidade';

  @override
  String get shippingAddressStateHint => 'Estado';

  @override
  String get shippingAddressZipHint => 'CEP';

  @override
  String get shippingAddressCountryCodeHint => 'Código do país (ex.: BR)';

  @override
  String get shippingAddressPhoneHint => 'Telefone (opcional)';

  @override
  String get shippingAddressPrivacyNote =>
      'Usado apenas para enviar este pedido -- consulte a política de privacidade da própria Printful para saber como eles lidam com isso após o pedido ser feito.';

  @override
  String get updateNudgeAvailableTitle => 'Atualização Disponível';

  @override
  String get updateNudgeRequiredTitle => 'Atualização Necessária';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'O Koda $version está disponível -- você está usando uma versão mais antiga.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'Esta versão não é mais suportada. Atualize para o Koda $version para continuar usando o Koda.';
  }

  @override
  String get updateNudgeLaterButton => 'Mais tarde';

  @override
  String get updateNudgeUpdateNowButton => 'Atualizar Agora';

  @override
  String updateNudgeDownloading(int percent) {
    return 'Baixando atualização... $percent%';
  }

  @override
  String get updateNudgeVerifying => 'Verificando download...';

  @override
  String get updateNudgeLaunching => 'Iniciando o instalador...';

  @override
  String get updateNudgeFailed =>
      'Não foi possível concluir a atualização. Você pode baixá-la manualmente.';

  @override
  String get tierBadgeSparkSubscriber => 'Assinante Spark';

  @override
  String get tierBadgePulseSubscriber => 'Assinante Pulse';

  @override
  String get tierBadgeAlphaSpark => 'Alpha Spark';

  @override
  String get tierBadgeFounder => 'Founder';

  @override
  String get foundersHallTitle => 'Founders Hall';

  @override
  String get foundersHallSubtitle =>
      'Os primeiros apoiadores que tornaram o Koda possível.';

  @override
  String get foundersHallEmptyState => 'Ainda não há founders.';

  @override
  String get settingsFoundersHallTitle => 'Founders Hall';

  @override
  String get settingsFoundersHallSubtitle =>
      'Veja quem ajudou a construir o Koda';

  @override
  String get settingsWikiTitle => 'Ajuda e Wiki';

  @override
  String get settingsWikiSubtitle =>
      'Navegue pela base de conhecimento do Koda';

  @override
  String get wikiScreenTitle => 'Ajuda e Wiki';

  @override
  String get wikiScreenEmptyState => 'Ainda não há nada aqui.';

  @override
  String get vispAvatarInDevelopment => 'EM DESENVOLVIMENTO';

  @override
  String get vispBoostAdvisorCouldNotAnswer =>
      'A Visp não conseguiu elaborar uma resposta.';

  @override
  String get vispBoostAdvisorTitle =>
      'Perguntar à Visp: Consultor de ROI de Impulsos';

  @override
  String get vispBoostAdvisorFollowUpHint =>
      'Fazer uma pergunta de acompanhamento...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Enviar';

  @override
  String get vispBoostAdvisorBasedOn => 'Baseado em:';

  @override
  String get vispEventDialogCouldNotGenerate =>
      'A Visp não conseguiu gerar um evento.';

  @override
  String get vispEventDialogCouldNotCreate =>
      'Não foi possível criar esse evento.';

  @override
  String get vispEventDialogRecurrenceNone => 'Único';

  @override
  String get vispEventDialogRecurrenceDaily => 'Repete diariamente';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Repete semanalmente';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Repete mensalmente';

  @override
  String get vispEventDialogTitle => 'Pedir à Visp para criar um evento';

  @override
  String get vispEventDialogDescription =>
      'Descreva o evento -- a Visp proporá um título, data/hora e outros detalhes.';

  @override
  String get vispEventDialogPromptHint =>
      'ex.: \"Sessão semanal de D&D toda sexta-feira às 19h por cerca de 3 horas\"';

  @override
  String get vispEventDialogPrivacyNote =>
      'Sua descrição é enviada à Visp (uma assistente auto-hospedada -- nada sai dos servidores do Koda) para gerar este plano.';

  @override
  String get vispEventDialogStartOver => 'Recomeçar';

  @override
  String get vispEventDialogCreateEvent => 'Criar Evento';

  @override
  String get vispEventDialogThinking => 'Pensando...';

  @override
  String get vispEventDialogGeneratePlan => 'Gerar Plano';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'Não foi possível interpretar uma data -- tente reformular';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Termina $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price por ingresso';
  }

  @override
  String get vispEventDialogBasedOn => 'Baseado em:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Pergunta $questionNumber de $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'Ou digite sua própria resposta...';

  @override
  String get vispQuestionStepSendTooltip => 'Enviar';

  @override
  String get vispQuestionStepSkip => 'Pular e gerar agora';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'A Visp não conseguiu gerar um plano.';

  @override
  String get vispSetupDialogCouldNotApplyPlan =>
      'Não foi possível aplicar esse plano.';

  @override
  String get vispSetupDialogTitleNew => 'Descreva seu servidor para a Visp';

  @override
  String get vispSetupDialogTitleExisting =>
      'Pedir à Visp para adicionar a este servidor';

  @override
  String get vispSetupDialogDescriptionNew =>
      'Descreva o servidor que você deseja -- a Visp proporá um nome e um conjunto de cargos, categorias e canais.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Descreva o que você gostaria de adicionar -- a Visp proporá cargos, categorias e canais para criar.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'ex.: \"Um servidor aconchegante para meu grupo de D&D com canais de voz para duas mesas\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'ex.: \"Adicione mais alguns canais para nossas equipes de raid\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      'Sua descrição é enviada à Visp (uma assistente auto-hospedada -- nada sai dos servidores do Koda) para gerar este plano.';

  @override
  String get vispSetupDialogStartOver => 'Recomeçar';

  @override
  String get vispSetupDialogCreateServer => 'Criar Servidor';

  @override
  String get vispSetupDialogAddToServer => 'Adicionar ao Servidor';

  @override
  String get vispSetupDialogThinking => 'Pensando...';

  @override
  String get vispSetupDialogGeneratePlan => 'Gerar Plano';

  @override
  String get vispSetupDialogNewServerLabel => 'Novo servidor';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cargos',
      one: '$count cargo',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categorias',
      one: '$count categoria',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count canais',
      one: '$count canal',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'Baseado em:';

  @override
  String get childLockoutTitle => 'Está fora do seu horário permitido';

  @override
  String get childLockoutBody =>
      'Um pai, mãe ou responsável definiu os horários em que esta conta pode usar o Koda. Peça mais tempo a ele, ou volte a verificar na próxima janela permitida.';

  @override
  String get childLockoutLogOutButton => 'Sair';

  @override
  String get forcePasswordChangeError =>
      'Não foi possível atualizar a senha. Tente novamente.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Bem-vindo(a), $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Sua conta requer uma nova senha antes que você possa continuar.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'Nova senha';

  @override
  String get forcePasswordChangeConfirmPasswordHint => 'Confirmar nova senha';

  @override
  String get forcePasswordChangeReqLength => 'Pelo menos 12 caracteres';

  @override
  String get forcePasswordChangeReqUpper => 'Uma letra maiúscula';

  @override
  String get forcePasswordChangeReqLower => 'Uma letra minúscula';

  @override
  String get forcePasswordChangeReqDigit => 'Um número';

  @override
  String get forcePasswordChangeReqMatch => 'As senhas coincidem';

  @override
  String get forcePasswordChangeSubmitButton => 'Definir Nova Senha';

  @override
  String get forgotPasswordEnterEmailError => 'Digite seu endereço de e-mail.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'Se essa conta existir, um código de redefinição foi enviado.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Digite o código e uma senha com pelo menos 8 caracteres.';

  @override
  String get forgotPasswordInvalidCode => 'Código inválido ou expirado.';

  @override
  String get forgotPasswordTitle => 'Redefinir senha';

  @override
  String get forgotPasswordEmailHint => 'Endereço de e-mail';

  @override
  String get forgotPasswordSendCodeButton => 'Enviar código de redefinição';

  @override
  String get forgotPasswordCodeHint => 'Código de 6 dígitos';

  @override
  String get forgotPasswordNewPasswordHint => 'Nova senha';

  @override
  String get forgotPasswordSetNewPasswordButton => 'Definir nova senha';

  @override
  String get verifyEmailEnterCodeError =>
      'Digite o código de 6 dígitos do seu e-mail.';

  @override
  String get verifyEmailInvalidCode => 'Código inválido ou expirado.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'Um novo código foi enviado para $email.';
  }

  @override
  String get verifyEmailResendFailed => 'Não foi possível reenviar agora.';

  @override
  String get verifyEmailTitle => 'Verifique seu e-mail';

  @override
  String verifyEmailSentCode(String email) {
    return 'Enviamos um código de 6 dígitos para $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'Verificar E-mail';

  @override
  String get verifyEmailResendButton => 'Reenviar código';

  @override
  String get safetyNumberKeysNotSetUp =>
      'Suas próprias chaves ainda não foram configuradas.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName ainda não tem um pacote de chaves.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'Não foi possível calcular o número de segurança: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName não tem mais esse dispositivo.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'Número de Segurança com $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Compare este número com $peerName por outro meio -- pessoalmente, por telefone, em qualquer lugar que não seja este chat. Se corresponder dos dois lados, você está falando com quem pensa que está falando.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName tem $count dispositivos, cada um com seu próprio número de segurança -- verificar um não cobre os outros.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Dispositivo $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Marcar como Verificado';

  @override
  String get contentFiltersDescription =>
      'Servidores podem sinalizar canais com rótulos de conteúdo. Escolha como você quer que os canais rotulados se comportem -- essa é sua própria preferência e nunca afeta o que qualquer outra pessoa vê.';

  @override
  String get contentFiltersLabelAdult => 'Conteúdo adulto';

  @override
  String get contentFiltersLabelSuggestive => 'Sugestivo';

  @override
  String get contentFiltersLabelGraphic => 'Mídia gráfica';

  @override
  String get contentFiltersLabelNudity => 'Nudez não sexual';

  @override
  String get contentFiltersDescAdult => 'Conteúdo sexualmente explícito';

  @override
  String get contentFiltersDescSuggestive =>
      'Conteúdo sexualmente sugestivo, mas não explícito';

  @override
  String get contentFiltersDescGraphic => 'Violência ou gore';

  @override
  String get contentFiltersDescNudity => 'Nudez em contexto não sexual';

  @override
  String get contentFiltersHide => 'Ocultar';

  @override
  String get contentFiltersWarn => 'Avisar';

  @override
  String get contentFiltersShow => 'Mostrar';

  @override
  String get deviceTestCouldNotGetToken =>
      'Não foi possível obter um token de teste.';

  @override
  String get deviceTestLabelTest => 'Testar';

  @override
  String get deviceTestLabelRecording => 'Gravando...';

  @override
  String get deviceTestLabelPlayingBack => 'Reproduzindo...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'Não foi possível iniciar a câmera: $error';
  }

  @override
  String get deviceTestTitle => 'Testar Dispositivos';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'Não foi possível conectar: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Microfone';

  @override
  String get deviceTestHearYourselfLabel => 'Ouvir a Si Mesmo (Com Atraso)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Alto-falante / Saída';

  @override
  String get deviceTestCameraLabel => 'Câmera';

  @override
  String get deviceTestSystemDefault => 'Padrão do sistema';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Fale e depois ouça a reprodução de um trecho de ${seconds}s';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '${seconds}s';
  }

  @override
  String get deviceTestCameraPreviewOff =>
      'Pré-visualização da câmera desativada';

  @override
  String get deviceTestStopCameraButton => 'Parar Teste de Câmera';

  @override
  String get deviceTestTestCameraButton => 'Testar Câmera';

  @override
  String get deviceTestInputLevelLabel => 'Nível de entrada';

  @override
  String get devicesScreenRemoveConfirmTitle => 'Remover este dispositivo?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'Ele precisará entrar novamente, e mensagens enviadas a ele enquanto estava removido não chegarão depois -- sessões de Duplo Trinquete não preenchem lacunas retroativamente.';

  @override
  String get devicesScreenRemoveFailed =>
      'Não foi possível remover esse dispositivo.';

  @override
  String get devicesScreenNeverActive => 'Nunca ativo';

  @override
  String devicesScreenActiveDate(String date) {
    return 'Ativo $date';
  }

  @override
  String get devicesScreenDescription =>
      'Cada dispositivo em que você entra tem sua própria identidade de criptografia -- uma mensagem enviada a você chega a todos os dispositivos abaixo. Remova algum que você não use ou não reconheça.';

  @override
  String get devicesScreenNoDevicesFound => 'Nenhum dispositivo encontrado.';

  @override
  String get devicesScreenUnknownDevice => 'Dispositivo desconhecido';

  @override
  String get devicesScreenThisDeviceBadge => 'Este dispositivo';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Remover dispositivo';

  @override
  String get totpSetupInvalidCode => 'Código inválido. Tente novamente.';

  @override
  String get totpSetupEnabledMessage =>
      'A autenticação de dois fatores está ativada.';

  @override
  String get totpSetupScanInstructions =>
      'Escaneie este segredo no seu aplicativo autenticador (Google Authenticator, 1Password, Authy):';

  @override
  String get totpSetupCodeHint => 'Digite o código de 6 dígitos para confirmar';

  @override
  String get totpSetupVerifyButton => 'Verificar e Ativar';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'Pressionar para Falar';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'Pressione qualquer tecla para vinculá-la...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Testar Dispositivos';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Processamento de Voz';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'Supressão de Ruído';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Reduz o ruído de fundo no seu microfone';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Supressão de Ruído Avançada (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'Remoção de ruído por IA em tempo real, mais forte que a supressão padrão -- substitui-a quando ativada';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'Cancelamento de Eco';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Evita que seu próprio áudio ecoe de volta';

  @override
  String get voiceVideoSettingsAutoGainTitle => 'Controle Automático de Ganho';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Equilibra automaticamente o volume do microfone (normalização de volume)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle =>
      'Redução Automática (Ducking)';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Reduz o volume de outros participantes enquanto você fala';

  @override
  String get voiceVideoSettingsHighPassTitle => 'Filtro Passa-Alta';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Corta ruídos de baixa frequência (ventiladores, ar-condicionado, batidas na mesa)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle =>
      'Detecção de Ruído de Digitação';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Suprime o ruído do teclado captado pelo seu microfone';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Isolamento de Voz';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Foca na sua voz, filtrando outras pessoas e sons próximos';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Reforço do Microfone';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Ativar Reforço';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Ganho de pré-amplificação para um microfone baixo ou distante -- aplicado antes do equalizador';

  @override
  String get voiceVideoSettingsBandBoost => 'Reforço';

  @override
  String get voiceVideoSettingsSectionMicEq => 'Equalizador do Microfone';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'Ativar Equalizador';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Molda seu microfone antes que chegue a outras pessoas';

  @override
  String get voiceVideoSettingsBandBass => 'Graves';

  @override
  String get voiceVideoSettingsBandMid => 'Médios';

  @override
  String get voiceVideoSettingsBandTreble => 'Agudos';

  @override
  String get voiceVideoSettingsSectionVad =>
      'Detecção de Atividade de Voz (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'Ativar VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Transmite somente quando você está realmente falando';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Sensibilidade';

  @override
  String get voiceVideoSettingsVadHint =>
      'Menor = capta sons mais suaves. Maior = somente fala mais alta aciona a transmissão.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Tecla vinculada';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'Não definida — o microfone permanece ativo sempre que não estiver silenciado';

  @override
  String get voiceVideoSettingsClearButton => 'Limpar';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Definir Tecla';

  @override
  String get voiceVideoSettingsChangeButton => 'Alterar';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'Quando uma tecla é vinculada, seu microfone transmite apenas enquanto você mantém essa tecla pressionada. Isso tem prioridade sobre o VOX enquanto você está em um canal de voz.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Modelo Reativo de Avatar Virtual';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Envie duas imagens que alternam quando você fala. Visível apenas para você.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'Silencioso';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'Falando';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'Limite de fala';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Menor = alterna para a imagem de fala mais facilmente.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'Remover VARM';

  @override
  String get gifPickerNoGifsFound => 'Nenhum GIF encontrado';

  @override
  String get gifPickerSearchHint => 'Buscar GIFs...';

  @override
  String get messageSearchHint => 'Buscar neste canal...';

  @override
  String get messageSearchTooltip => 'Buscar';

  @override
  String get messageSearchInitialHint =>
      'Pesquisa mensagens já carregadas neste dispositivo -- o histórico mais antigo é buscado (e descriptografado localmente) conforme você avança mais para trás.';

  @override
  String get messageSearchNoMatches => 'Nenhum resultado';

  @override
  String get messageSearchStartOfHistory => 'Início do histórico do canal';

  @override
  String get messageSearchFurtherBackButton => 'Buscar mais atrás';

  @override
  String get messageSearchUnknownAuthor => 'Desconhecido';

  @override
  String get serverTabLeveling => 'Níveis';

  @override
  String get permManageLeaderboards => 'Gerenciar Classificações';

  @override
  String get serverLevelingEnableLabel => 'XP do servidor';

  @override
  String get serverLevelingEnableDescription =>
      'Os membros ganham XP e níveis ao conversar. Ativado por padrão.';

  @override
  String get serverGifLevelGateLabel => 'Nível necessário para GIFs';

  @override
  String get serverGifLevelGateDescription =>
      'Nível mínimo para enviar GIFs neste servidor. 0 = sem restrição.';

  @override
  String get serverOpenLeaderboards => 'Ver Classificações';

  @override
  String get leaderboardScreenTitle => 'Classificações';

  @override
  String get leaderboardCreateTitle => 'Criar Classificação';

  @override
  String get leaderboardNameHint => 'Nome da classificação';

  @override
  String get leaderboardResetTitle => 'Reiniciar Temporada';

  @override
  String leaderboardResetBody(String name) {
    return 'Isso arquivará a classificação atual de \"$name\" e iniciará uma nova temporada. Isso não pode ser desfeito.';
  }

  @override
  String get leaderboardResetConfirm => 'Reiniciar Temporada';

  @override
  String get leaderboardAdjustTitle => 'Ajustar Pontuação';

  @override
  String get leaderboardUserIdHint => 'ID do usuário';

  @override
  String get leaderboardScoreHint => 'Pontuação';

  @override
  String leaderboardSeasonLabel(int number) {
    return 'Temporada $number';
  }

  @override
  String get leaderboardEmptyState => 'Ainda sem entradas';

  @override
  String leaderboardYourRank(int rank, int score) {
    return 'Sua posição: #$rank ($score)';
  }

  @override
  String leaderboardXpScore(int score, int level) {
    return '$score XP · Nível $level';
  }

  @override
  String memberPanelLevelLabel(int level) {
    return 'Nív. $level';
  }

  @override
  String get achievementScreenTitle => 'Conquistas';

  @override
  String get achievementCreateTitle => 'Criar Conquista';

  @override
  String get achievementNameHint => 'Nome da conquista';

  @override
  String get achievementDescriptionHint => 'Descrição (opcional)';

  @override
  String get achievementDeleteTitle => 'Excluir Conquista';

  @override
  String achievementDeleteConfirm(String name) {
    return 'Excluir \"$name\"? Quem já a possui a mantém, mas ela será removida do servidor. Isso não pode ser desfeito.';
  }

  @override
  String get achievementAwardTitle => 'Conceder Conquista';

  @override
  String get achievementAwardButton => 'Conceder';

  @override
  String get achievementUserIdHint => 'ID do usuário';

  @override
  String get achievementLockedBanner =>
      'Este servidor está abaixo do nível de impulso 3, então as conquistas existentes e seus detentores permanecem exatamente como estão, mas nenhuma pode ser concedida a alguém novo até que o servidor volte ao nível 3.';

  @override
  String get achievementEmptyState => 'Ainda não há conquistas';

  @override
  String get achievementNoRecipients => 'Ainda ninguém tem isso';

  @override
  String chatGifLevelGated(int level) {
    return 'Você precisa do nível $level para enviar GIFs aqui';
  }

  @override
  String get arcadeNavLabel => 'Arcade';

  @override
  String get arcadeHomeTitle => 'Koda Arcade';

  @override
  String get arcadeViewLeaderboardsButton => 'Ver Melhores Pontuações';

  @override
  String get arcadeMinesweeperTitle => 'Campo Minado';

  @override
  String get arcadeMinesweeperSubtitle =>
      'Descubra todo o tabuleiro sem acertar uma mina';

  @override
  String get arcadeMatch3Title => 'Combinar Gemas';

  @override
  String get arcadeMatch3Subtitle =>
      'Combine 3 ou mais gemas para marcar pontos';

  @override
  String get arcadeDifficultyBeginner => 'Iniciante';

  @override
  String get arcadeDifficultyIntermediate => 'Intermediário';

  @override
  String get arcadeDifficultyExpert => 'Especialista';

  @override
  String arcadeMinesLeftLabel(int count) {
    return 'Minas: $count';
  }

  @override
  String arcadeTimeLabel(int seconds) {
    return 'Tempo: ${seconds}s';
  }

  @override
  String get arcadeNewGameButton => 'Novo Jogo';

  @override
  String get arcadeMinesweeperWinTitle => 'Tabuleiro Limpo!';

  @override
  String arcadeMinesweeperWinBody(int score) {
    return 'Você marcou $score pontos.';
  }

  @override
  String get arcadeMinesweeperLoseTitle => 'Bum!';

  @override
  String get arcadeMinesweeperLoseBody =>
      'Você acertou uma mina. Tentar novamente?';

  @override
  String get arcadeScoreSubmittedNote =>
      'Pontuação enviada para o ranking deste servidor';

  @override
  String arcadeMatch3ScoreLabel(int score) {
    return 'Pontuação: $score';
  }

  @override
  String arcadeMatch3MovesLeftLabel(int count) {
    return 'Movimentos restantes: $count';
  }

  @override
  String get arcadeMatch3GameOverTitle => 'Sem Movimentos';

  @override
  String arcadeMatch3GameOverBody(int score) {
    return 'Pontuação final: $score';
  }

  @override
  String get commonContinue => 'Continuar';

  @override
  String get adminTabEnterprise => 'Empresas';

  @override
  String get adminTabStatus => 'Status';

  @override
  String get adminTabParentalConsent => 'Consentimento dos pais';

  @override
  String get adminParentalConsentDescription =>
      'Revise os formulários de consentimento assinados enviados antes de criar uma conta infantil. A verificação por cartão é resolvida automaticamente e nunca aparece aqui.';

  @override
  String get adminParentalConsentEmptyState => 'Nenhuma revisão pendente.';

  @override
  String get adminParentalConsentViewDocument => 'Ver documento';

  @override
  String get adminParentalConsentApprove => 'Aprovar';

  @override
  String get adminParentalConsentReject => 'Recusar';

  @override
  String get adminParentalConsentRejectTitle =>
      'Recusar solicitação de consentimento';

  @override
  String get adminParentalConsentRejectReasonHint =>
      'Motivo (mostrado ao pai/mãe/responsável)';

  @override
  String get adminParentalConsentRejectConfirm => 'Recusar';

  @override
  String get serverTabSso => 'SSO';

  @override
  String get serverSsoCardTitle => 'Logon único SAML';

  @override
  String get serverSsoCardDescription =>
      'Permita que os membros façam login através do provedor de identidade da sua empresa em vez de e-mail e senha.';

  @override
  String get serverSsoLockedHint =>
      'O SSO está disponível no nível Empresarial. Entre em contato para fazer upgrade.';

  @override
  String get serverSsoEnabledLabel => 'SSO ativado';

  @override
  String get serverSsoEmailDomainLabel => 'Domínio de e-mail da empresa';

  @override
  String get serverSsoEmailDomainHint => 'acme.com';

  @override
  String get serverSsoEntityIdLabel =>
      'ID de entidade do provedor de identidade';

  @override
  String get serverSsoEntityIdHint => 'https://idp.example.com/entity';

  @override
  String get serverSsoSsoUrlLabel => 'URL de SSO do provedor de identidade';

  @override
  String get serverSsoSsoUrlHint => 'https://idp.example.com/sso/redirect';

  @override
  String get serverSsoCertLabel =>
      'Certificado X.509 do provedor de identidade (PEM)';

  @override
  String get serverSsoCertHint => '-----BEGIN CERTIFICATE-----';

  @override
  String get ssoSignInButton => 'Entrar com SSO';

  @override
  String get ssoLoginTitle => 'Entrar com SSO';

  @override
  String get ssoLoginDescription =>
      'Digite seu e-mail de trabalho -- vamos redirecioná-lo ao provedor de identidade da sua empresa para concluir o login.';

  @override
  String get ssoWorkEmailHint => 'voce@empresa.com';

  @override
  String get ssoNoConfigError =>
      'Nenhum SSO configurado para esse e-mail. Tente sua senha.';

  @override
  String get ssoGenericError => 'Algo deu errado ao iniciar o login com SSO.';

  @override
  String get ssoExpiredError =>
      'Essa tentativa de login expirou. Tente novamente.';

  @override
  String get ssoWaitingForBrowser =>
      'Conclua o login com seu provedor de identidade na janela do navegador. Esta página continuará automaticamente.';

  @override
  String get statusPostIncidentTitle => 'Publicar Incidente';

  @override
  String get statusIncidentTitleHint => 'Título do incidente';

  @override
  String get statusIncidentBodyHint => 'O que está acontecendo? (opcional)';

  @override
  String get statusAllSystemsNormal => 'Todos os sistemas normais';

  @override
  String get statusDegraded => 'Degradado -- banco de dados inacessível';

  @override
  String get statusNoIncidents => 'Nenhum incidente relatado';

  @override
  String get statusResolvedLabel => 'Resolvido';

  @override
  String get statusResolveButton => 'Resolver';

  @override
  String get commonCopy => 'Copiar';

  @override
  String get permManageWebhooks => 'Gerenciar Webhooks';

  @override
  String get permManageAchievements => 'Gerenciar Conquistas';

  @override
  String get channelEditDialogManageWebhooks => 'Gerenciar Webhooks';

  @override
  String get webhookScreenTitle => 'Webhooks';

  @override
  String get webhookScreenDescription =>
      'Qualquer serviço que possa enviar uma solicitação web pode publicar mensagens neste canal. Compatível com ferramentas que já suportam postar em um webhook do Discord -- basta colar esta URL no lugar.';

  @override
  String get webhookEmptyState => 'Ainda sem webhooks';

  @override
  String get webhookCreateTitle => 'Criar Webhook';

  @override
  String get webhookNameHint => 'Nome do webhook';

  @override
  String get webhookRegenerateTitle => 'Regenerar URL';

  @override
  String get webhookRegenerateBody =>
      'A URL atual deixará de funcionar imediatamente. Qualquer coisa que ainda a use precisará da nova.';

  @override
  String get webhookRegenerateConfirm => 'Regenerar';

  @override
  String get webhookUrlRevealTitle => 'URL do Webhook';

  @override
  String get webhookUrlRevealWarning =>
      'Copie isso agora -- você não poderá vê-lo novamente. Qualquer pessoa com esta URL pode publicar mensagens neste canal.';

  @override
  String get webhookUrlCopiedToast => 'URL copiada';

  @override
  String get webhookUrlSavedIt => 'Eu salvei';

  @override
  String get chatWebhookBadge => 'WEBHOOK';

  @override
  String adminReportWebhookTarget(String reporterId, String webhookName) {
    return 'Denunciante: $reporterId\nWebhook: $webhookName';
  }

  @override
  String get commonActionFailed => 'Algo deu errado. Tente novamente.';

  @override
  String get ssoBrowserLaunchError =>
      'Não foi possível abrir um navegador para continuar o login.';

  @override
  String get settingsSpotifyTitle => 'Spotify';

  @override
  String get settingsSpotifyDescription =>
      'Conecte o Spotify para compartilhar o que você está ouvindo em um canal. O Koda não pode sincronizar a reprodução em tempo real -- isso publica um link para que outros possam reproduzir a mesma faixa por conta própria.';

  @override
  String settingsSpotifyConnected(String username) {
    return 'Conectado como $username';
  }

  @override
  String get settingsSpotifyNotConnected => 'Spotify não conectado';

  @override
  String settingsSpotifyNowPlaying(String track, String artist) {
    return 'Tocando agora: $track de $artist';
  }

  @override
  String get settingsSpotifyShareHint =>
      'Compartilhe isso pelo ícone de nota musical na caixa de mensagens de qualquer canal.';

  @override
  String get chatShareSpotifyTooltip => 'Compartilhar o que você está ouvindo';

  @override
  String get chatSpotifyShareFailed =>
      'Não foi possível compartilhar -- verifique se o Spotify está tocando algo.';

  @override
  String get chatPreviewBadgeLive => 'AO VIVO';

  @override
  String get chatPreviewBadgeListening => 'OUVINDO';

  @override
  String get chatPreviewBadgeEnded => 'ENCERRADO';

  @override
  String get serverAuditLogExportDescription =>
      'Exporte o log de auditoria completo como CSV ou JSON Lines para conformidade ou ingestão em um SIEM.';

  @override
  String get serverAuditLogExportLockedHint =>
      'A exportação do log de auditoria está disponível no nível Empresarial. Entre em contato para fazer upgrade.';

  @override
  String get serverExportAuditLog => 'Exportar';

  @override
  String get serverExportFormatPrompt =>
      'Escolha um formato. O JSON Lines geralmente é melhor para alimentar um SIEM ou pipeline de logs; o CSV abre diretamente em uma planilha.';

  @override
  String get serverAuditLogExported => 'Log de auditoria exportado';

  @override
  String get chatPreviewBadgePremiere => 'PRÉMIERE';
}
