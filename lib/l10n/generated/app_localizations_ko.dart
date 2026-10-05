// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => '취소';

  @override
  String get commonSave => '저장';

  @override
  String get commonEdit => '편집';

  @override
  String get commonDelete => '삭제';

  @override
  String get commonCreate => '만들기';

  @override
  String get commonClose => '닫기';

  @override
  String get commonDone => '완료';

  @override
  String get commonDownload => '다운로드';

  @override
  String get commonDisconnect => '연결 해제';

  @override
  String get commonNone => '없음';

  @override
  String get commonJoin => '참가';

  @override
  String get commonDismiss => '닫기';

  @override
  String get commonSubmit => '제출';

  @override
  String get commonConfirm => '확인';

  @override
  String get commonRemove => '제거';

  @override
  String get commonRetry => '다시 시도';

  @override
  String get commonOk => '확인';

  @override
  String get commonYes => '예';

  @override
  String get commonNo => '아니요';

  @override
  String get commonSearch => '검색';

  @override
  String get commonSettings => '설정';

  @override
  String get commonLoading => '불러오는 중...';

  @override
  String get settingsLanguageSection => '언어';

  @override
  String get settingsLanguageTitle => '앱 언어';

  @override
  String get settingsLanguageSystemDefault => '시스템 기본값';

  @override
  String get settingsLanguageDescription =>
      'Koda 자체 인터페이스가 표시되는 언어를 선택하세요. 이는 서버의 기본 언어나 메시지를 작성하는 언어와는 별개입니다.';

  @override
  String get settingsTitle => '설정';

  @override
  String get settingsSignOut => '로그아웃';

  @override
  String get settingsSectionMyAccount => '내 계정';

  @override
  String get settingsSectionSecurity => '보안';

  @override
  String get settingsSectionAccessibility => '접근성';

  @override
  String get settingsSectionBilling => '결제';

  @override
  String get settingsSectionFamily => '가족';

  @override
  String get settingsSectionVoiceVideo => '음성 및 영상';

  @override
  String get settingsSectionDesktop => '데스크톱';

  @override
  String get settingsSectionAbout => '정보';

  @override
  String get settingsTwoFactorTitle => '2단계 인증';

  @override
  String get settingsTwoFactorSubtitle => '추가 보안을 위해 인증 앱을 추가하세요';

  @override
  String get settingsLinkedDevicesTitle => '연결된 기기';

  @override
  String get settingsLinkedDevicesSubtitle => '이 계정에 로그인된 기기를 확인하고 제거합니다';

  @override
  String get settingsContentFiltersTitle => '콘텐츠 필터';

  @override
  String get settingsContentFiltersSubtitle => '라벨이 지정된 콘텐츠를 표시하는 방식을 선택하세요';

  @override
  String get settingsDmFriendsOnlyTitle => '친구만 DM 허용';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      '친구가 아닌 사용자는 당신과 새 대화를 시작할 수 없습니다';

  @override
  String get settingsDmPrivacyError => 'DM 개인정보 설정을 업데이트할 수 없습니다.';

  @override
  String get settingsShowVispAvatarTitle => 'Visp의 아바타 표시';

  @override
  String get settingsShowVispAvatarSubtitle =>
      '설정/이벤트/어드바이저 대화상자에서 Visp의 얼굴과 기분을 표시합니다';

  @override
  String get settingsHighContrastTitle => '고대비';

  @override
  String get settingsHighContrastSubtitle =>
      '앱 전체를 순수한 흑백의 고대비 색상으로 표시합니다 -- 전환 시 현재 화면이 잠시 다시 로드됩니다.';

  @override
  String get settingsDyslexiaFontTitle => '난독증 친화 글꼴';

  @override
  String get settingsDyslexiaFontSubtitle =>
      '앱 전체의 본문 텍스트를 OpenDyslexic으로 전환합니다';

  @override
  String get settingsFontSizeTitle => '글꼴 크기';

  @override
  String get settingsFontSizeSample => '다람쥐 헌 쳇바퀴에 타고파';

  @override
  String get settingsDensityTitle => '밀도';

  @override
  String get settingsDensityDescription =>
      '버튼, 토글, 대화상자 등 표준 컨트롤의 간격에 영향을 줍니다 -- 모든 사용자 지정 레이아웃에 적용되지는 않습니다.';

  @override
  String get settingsDensityCompact => '간결하게';

  @override
  String get settingsDensityStandard => '표준';

  @override
  String get settingsDensityComfortable => '여유롭게';

  @override
  String get settingsStreamingTitle => '스트리밍 계정';

  @override
  String get settingsStreamingDescription =>
      'Twitch/YouTube를 연결하면 “방송 시작 알림” 권한이 있는 서버에서 방송을 시작하거나 새 영상을 올릴 때 자동으로 게시할 수 있습니다.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform이(가) $username(으)로 연결됨$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform 연결 안 됨';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- 방송 중';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- 새 영상 업로드';

  @override
  String get settingsStreamingConnecting => '연결 중...';

  @override
  String get settingsStreamingConnect => '연결';

  @override
  String get settingsAnnounceLiveTwitch => '방송을 시작하면 알림';

  @override
  String get settingsAnnounceLiveYoutube => '라이브 방송과 새 영상 업로드 알림';

  @override
  String get settingsRefreshStatus => '브라우저에서 이미 연결하셨나요? 상태 새로고침';

  @override
  String settingsStreamingConnectError(String platform) {
    return '$platform 연결을 시작할 수 없습니다.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      '브라우저에서 연결을 완료한 후 돌아와서 새로고침하세요.';

  @override
  String get settingsThroneTitle => 'Throne 웹훅';

  @override
  String get settingsThroneDescription =>
      '이 URL을 Throne.com의 웹훅 설정에 붙여넣으면 누군가 선물을 보낼 때마다 Koda에서 알림을 받을 수 있습니다.';

  @override
  String get settingsThroneGetUrl => '웹훅 URL 받기';

  @override
  String get settingsThroneCopyTooltip => '복사';

  @override
  String get settingsThroneCopiedToast => '클립보드에 복사됨';

  @override
  String get settingsThroneRegenerateTooltip => '재생성 (이전 URL은 무효화됩니다)';

  @override
  String get settingsThroneRegenerateConfirmTitle => '웹훅 URL을 재생성하시겠어요?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      '이전 URL은 더 이상 작동하지 않으니, 이후 Throne.com에서도 업데이트해 주세요.';

  @override
  String get settingsThroneRegenerate => '재생성';

  @override
  String get settingsUploadPhoto => '사진 업로드';

  @override
  String get settingsOrPasteUrl => '또는 아래에 URL 붙여넣기';

  @override
  String get settingsAvatarUrlHint => 'https://example.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      '이미지 업로드에는 Cloudflare R2가 필요합니다 — URL 붙여넣기는 항상 가능합니다.';

  @override
  String get settingsDisplayNameLabel => '표시 이름';

  @override
  String get settingsDisplayNameHint => '표시 이름';

  @override
  String get settingsBioLabel => '소개';

  @override
  String get settingsBioHint => '자신에 대해 간단히 소개해 주세요';

  @override
  String get settingsPronounsLabel => '대명사';

  @override
  String get settingsPronounsHint => '예: 그/그녀';

  @override
  String get settingsShowPronounsTitle => '내 대명사를 다른 사람에게 표시';

  @override
  String get settingsShowPronounsSubtitle => '채팅, 멤버 목록, 음성에서 이름 옆에 표시됩니다';

  @override
  String get settingsStatusLabel => '상태';

  @override
  String get settingsCustomStatusLabel => '사용자 지정 상태';

  @override
  String get settingsCustomStatusHint => '무슨 생각을 하고 계신가요?';

  @override
  String get statusOnline => '온라인';

  @override
  String get statusAway => '자리 비움';

  @override
  String get statusDnd => '방해 금지';

  @override
  String get statusInvisible => '오프라인으로 표시';

  @override
  String get settingsFamilyNotAvailable => '보호 계정에서는 자녀 보호 기능을 사용할 수 없습니다.';

  @override
  String get settingsAboutTitle => 'Koda 정보';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => '이용약관';

  @override
  String get settingsPrivacyTitle => '개인정보 처리방침';

  @override
  String get settingsSupportTitle => '지원';

  @override
  String get settingsReportSecurityTitle => '보안 문제 신고';

  @override
  String get settingsDesktopNotAvailable =>
      '이 설정은 데스크톱 전용입니다 -- 이 플랫폼에는 창이나 시스템 트레이가 없습니다.';

  @override
  String get settingsCloseToTrayTitle => '시스템 트레이로 닫기';

  @override
  String get settingsCloseToTraySubtitle =>
      '창을 닫아도 Koda가 백그라운드에서 계속 실행되어 알림을 계속 받을 수 있습니다 -- 이 옵션을 끄면 창을 닫을 때 앱이 완전히 종료됩니다.';

  @override
  String get authErrorEmailPasswordRequired => '이메일과 비밀번호를 입력해야 합니다.';

  @override
  String get authErrorIncorrectCredentials => '이메일 또는 비밀번호가 올바르지 않습니다.';

  @override
  String get authErrorMustAcceptTerms => '이용약관에 동의해 주세요.';

  @override
  String get authErrorAllFieldsRequired => '모든 항목을 입력해야 합니다.';

  @override
  String get authErrorPasswordsDontMatch => '비밀번호가 일치하지 않습니다.';

  @override
  String get authErrorPasswordTooShort => '비밀번호는 8자 이상이어야 합니다.';

  @override
  String get authErrorRegistrationFailed => '가입에 실패했습니다. 이미 사용 중인 이메일일 수 있습니다.';

  @override
  String get authTabSignIn => '로그인';

  @override
  String get authTabCreateAccount => '계정 만들기';

  @override
  String get authAgreementPrefix => 'Koda를 이용하면 다음에 동의하는 것으로 간주됩니다: ';

  @override
  String get authTermsLink => '이용약관';

  @override
  String get authAgreementMiddle => ' 및 ';

  @override
  String get authPrivacyLink => '개인정보 처리방침';

  @override
  String get authAgreementSuffix => '.';

  @override
  String get authEmailHint => '이메일 주소';

  @override
  String get authPasswordHint => '비밀번호';

  @override
  String get authForgotPassword => '비밀번호를 잊으셨나요?';

  @override
  String get authSignInButton => '로그인';

  @override
  String get authUsernameHint => '사용자 이름';

  @override
  String get authConfirmPasswordHint => '비밀번호 확인';

  @override
  String get authAccessCodeHint => '액세스 코드 (있는 경우)';

  @override
  String get authAgreeToTerms => '이용약관 및 개인정보 처리방침에 동의합니다';

  @override
  String get authCreateAccountButton => '계정 만들기';

  @override
  String get dmSafetyNumberChangedWarning =>
      '이 대화의 안전 번호가 변경되었습니다 -- 전송 전에 확인하세요.';

  @override
  String get dmMessageNotSent => '메시지가 전송되지 않았습니다.';

  @override
  String dmEncryptMessageError(String error) {
    return '메시지를 암호화할 수 없습니다: $error';
  }

  @override
  String get dmAttachmentUploadFailed => '첨부 파일 업로드에 실패했습니다.';

  @override
  String dmEncryptAttachmentError(String error) {
    return '첨부 파일을 암호화할 수 없습니다: $error';
  }

  @override
  String get dmReportMessage => '메시지 신고';

  @override
  String get dmReportSubmitted => '신고가 접수되었습니다.';

  @override
  String get dmTitle => '메시지';

  @override
  String get dmNewMessage => '새 메시지';

  @override
  String get dmNoConversationsYet => '아직 대화가 없습니다';

  @override
  String get dmSelectConversation => '대화를 선택하세요';

  @override
  String get dmVerifySafetyNumberTooltip => '안전 번호 확인';

  @override
  String get dmSeenLabel => '읽음';

  @override
  String get dmMessageActionsTooltip => '메시지 작업';

  @override
  String get dmRemoveAttachmentTooltip => '첨부 파일 제거';

  @override
  String get dmAttachFileTooltip => '파일 첨부';

  @override
  String get dmMessageHint => '메시지...';

  @override
  String get dmSendMessageTooltip => '메시지 보내기';

  @override
  String get dmNoFriendsYet => '아직 친구가 없습니다.\n친구 요청을 보내 시작해 보세요.';

  @override
  String get dmUnfriendTooltip => '친구 삭제';

  @override
  String get dmNoPendingRequests => '대기 중인 친구 요청이 없습니다.';

  @override
  String get dmIncomingRequestsLabel => '받은 요청';

  @override
  String get dmSentRequestsLabel => '보낸 요청';

  @override
  String get dmAcceptTooltip => '수락';

  @override
  String get dmDeclineTooltip => '거절';

  @override
  String get dmPendingLabel => '대기 중';

  @override
  String get dmNewMessageDialogTitle => '새 메시지';

  @override
  String get dmEnterUsernameHint => '사용자 이름 입력';

  @override
  String get dmOpenButton => '열기';

  @override
  String dmSavedAttachment(String fileName) {
    return '$fileName 저장됨';
  }

  @override
  String get dmUnknownUser => '알 수 없음';

  @override
  String get dmEndToEndEncryptedTooltip => '종단간 암호화됨';

  @override
  String get homeContentWarningTitle => '콘텐츠 경고';

  @override
  String homeContentWarningBody(String labels) {
    return '이 채널은 다음 사유로 표시되었습니다: $labels.\n\n설정 > 보안 > 콘텐츠 필터에서 변경할 수 있습니다.';
  }

  @override
  String get homeViewAnyway => '그래도 보기';

  @override
  String get homeCouldNotConnectVoice => '음성에 연결할 수 없습니다.';

  @override
  String get homeVoiceChannelFull => '이 음성 채널은 가득 찼습니다.';

  @override
  String get homeCreateServer => '서버 만들기';

  @override
  String get homeJoinServer => '서버 참가';

  @override
  String get homeRedeemCode => '코드 사용';

  @override
  String get homeJoinServerDialogTitle => '서버 참가';

  @override
  String get homeEnterInviteCode => '초대 코드 또는 URL을 입력하세요:';

  @override
  String get homeInviteCodeHint => '예: XK9MP2';

  @override
  String get homeJoined => '참가했습니다!';

  @override
  String get homeInvalidInvite => '초대 코드가 잘못되었거나 만료되었습니다.';

  @override
  String get homeJoinButton => '참가';

  @override
  String get homeRedeemCodeDialogTitle => '코드 사용';

  @override
  String get homeEnterBackerCode => '후원자 코드 또는 리워드 코드를 입력하세요:';

  @override
  String get homeRewardCodeHint => '리워드 코드';

  @override
  String get homeCodeRedeemed => '코드가 사용되었습니다! 리워드가 적용되었습니다.';

  @override
  String get homeInvalidRedeemCode => '잘못되었거나, 만료되었거나, 이미 사용된 코드입니다.';

  @override
  String get homeRedeemButton => '사용하기';

  @override
  String get homeAreFriends => '친구 사이입니다';

  @override
  String get homeAddFriend => '친구 추가';

  @override
  String homeFriendRequestSent(String username) {
    return '$username님에게 친구 요청을 보냈습니다!';
  }

  @override
  String get homeMessageButton => '메시지';

  @override
  String get homeSendTip => '팁 보내기';

  @override
  String get homeSwitchToServer => '이 서버로 전환';

  @override
  String get homeInvitePeople => '사람들 초대하기';

  @override
  String get homeServerSettingsMenuItem => '서버 설정';

  @override
  String get homeLeaveServerMenuItem => '서버 나가기';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return '$serverName에서 나가시겠어요? 초대를 통해 다시 참가할 수 있습니다.';
  }

  @override
  String get homeLeaveButton => '나가기';

  @override
  String get homeCreateAServer => '서버 만들기';

  @override
  String get homeServerNameHint => '서버 이름';

  @override
  String get homeDescribeToVisp => '대신 Visp에게 설명하기';

  @override
  String get homeMarkAsRead => '읽음으로 표시';

  @override
  String get homeEditChannel => '채널 편집';

  @override
  String get homeDeleteChannel => '채널 삭제';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return '#$channelName 채널을 삭제하시겠어요? 이 작업은 되돌릴 수 없습니다.';
  }

  @override
  String get homeDeleteButton => '삭제';

  @override
  String get homeCreateChannelHere => '여기에 채널 만들기';

  @override
  String get homeEditCategory => '카테고리 편집';

  @override
  String get homeDeleteCategory => '카테고리 삭제';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return '“$categoryName”을(를) 삭제하시겠어요? 안에 있는 채널은 미분류 상태가 됩니다.';
  }

  @override
  String get homeReplyAction => '답장';

  @override
  String get homeCreateThreadAction => '스레드 만들기';

  @override
  String get homeEditMessageAction => '메시지 편집';

  @override
  String get homeDeleteMessageAction => '메시지 삭제';

  @override
  String get homePinMessageAction => '메시지 고정';

  @override
  String get homeUnpinMessageAction => '메시지 고정 해제';

  @override
  String get homeReportMessageAction => '메시지 신고';

  @override
  String get homeReportSubmitted => '신고가 접수되었습니다.';

  @override
  String get messageActionForward => '전달';

  @override
  String messageForwardedFromLabel(String name) {
    return '$name님이 전달함';
  }

  @override
  String get forwardDestinationPickerTitle => '메시지 전달';

  @override
  String get forwardDestinationPickerChannelsTab => '채널';

  @override
  String get forwardDestinationPickerDmsTab => '다이렉트 메시지';

  @override
  String get forwardDestinationPickerNoServers => '아직 참여한 서버가 없습니다.';

  @override
  String get forwardDestinationPickerNoChannels => '이 서버에 텍스트 채널이 없습니다.';

  @override
  String get forwardDestinationPickerNoConversations => '아직 대화가 없습니다.';

  @override
  String get forwardSuccessToast => '메시지를 전달했습니다.';

  @override
  String get forwardFailedToast => '메시지를 전달하지 못했습니다 -- 다시 시도하세요.';

  @override
  String get homeAddReactionTitle => '반응 추가';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '스레드 $count개',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => '카테고리 옵션';

  @override
  String get homeChannelOptionsTooltip => '채널 옵션';

  @override
  String get homeOpenVoiceChatTooltip => '채팅 열기';

  @override
  String get homeMarketplaceLabel => '마켓플레이스';

  @override
  String get homeSelectChannelPrompt => '채널을 선택하세요';

  @override
  String get homeSearchTooltip => '검색';

  @override
  String get homePinnedMessagesTooltip => '고정된 메시지';

  @override
  String get homeWaitingForKey => '암호화 키를 기다리는 중...';

  @override
  String get homeUnableToDecrypt => '이 메시지를 복호화할 수 없습니다.';

  @override
  String get homeMessageActionsTooltip => '메시지 작업';

  @override
  String get homeCancelReplyTooltip => '답장 취소';

  @override
  String get homeRemoveAttachmentTooltip => '첨부 파일 제거';

  @override
  String get homeAttachFileTooltip => '파일 첨부';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return '#$channelName에 메시지 보내기';
  }

  @override
  String get homeSendMessageTooltip => '메시지 보내기';

  @override
  String get homeEditMessageTitle => '메시지 편집';

  @override
  String get homeMessageLabel => '메시지';

  @override
  String get homePinnedMessagesTitle => '고정된 메시지';

  @override
  String get homeNoPinnedMessages => '고정된 메시지가 없습니다';

  @override
  String get homeUnpinTooltip => '고정 해제';

  @override
  String get homeCreateThreadTitle => '스레드 만들기';

  @override
  String get homeThreadNameHint => '스레드 이름';

  @override
  String homeThreadCreated(String name) {
    return '“$name” 스레드가 생성되었습니다!';
  }

  @override
  String get homeCreateOrJoinTooltip => '만들기 또는 참가';

  @override
  String get homeKodaMarketplaceTooltip => 'Koda 마켓플레이스';

  @override
  String get homeAdminPanelTooltip => '관리자 패널';

  @override
  String get homeServerSettingsTooltip => '서버 설정';

  @override
  String get homeSettingsTooltip => '설정';

  @override
  String get homeContentWarningBadge => '콘텐츠 경고';

  @override
  String get homeDirectMessagesTooltip => '다이렉트 메시지';

  @override
  String homeReplyingTo(String username) {
    return '$username님에게 답장 중';
  }

  @override
  String get homeAttachmentFallback => '첨부 파일';

  @override
  String get homeAttachmentUploadFailed => '첨부 파일 업로드에 실패했습니다.';

  @override
  String homeSavedAttachment(String fileName) {
    return '$fileName 저장됨';
  }

  @override
  String serverConnectError(String service) {
    return '$service 연결을 시작할 수 없습니다.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Printful 연결을 해제하시겠어요?';

  @override
  String get serverDisconnectPrintfulBody =>
      '다시 연결할 때까지 이 서버는 굿즈 주문을 처리할 수 없습니다.';

  @override
  String get serverDisconnectTiltifyTitle => 'Tiltify 연결을 해제하시겠어요?';

  @override
  String get serverDisconnectTiltifyBody =>
      '다시 연결할 때까지 이 서버는 자선 캠페인 진행 상황을 표시하지 않습니다.';

  @override
  String get serverNewRoleTitle => '새 역할';

  @override
  String get serverEditRoleTitle => '역할 편집';

  @override
  String serverColorSwatchLabel(String hex) {
    return '색상 $hex';
  }

  @override
  String get permViewChannels => '채널 보기';

  @override
  String get permSendMessages => '메시지 보내기';

  @override
  String get permConnectVoice => '음성 채널 연결';

  @override
  String get permManageServer => '서버 관리';

  @override
  String get permManageChannels => '채널 관리';

  @override
  String get permManageRoles => '역할 관리';

  @override
  String get permManageMessages => '메시지 관리';

  @override
  String get permKickMembers => '멤버 추방';

  @override
  String get permBanMembers => '멤버 차단';

  @override
  String get permMuteMembers => '멤버 음소거';

  @override
  String get permMentionEveryone => '@everyone 멘션';

  @override
  String get permManageMarketplace => '마켓플레이스 관리';

  @override
  String get permAnnounceLive => '방송 시작 알림';

  @override
  String get permMoveMembers => '멤버 이동 (음성)';

  @override
  String get serverRoleNameHint => '역할 이름';

  @override
  String get serverColorLabel => '색상';

  @override
  String get serverPermissionsLabel => '권한';

  @override
  String get serverSelfAssignableTitle => '자가 지정 가능';

  @override
  String get serverSelfAssignableSubtitle => '멤버가 스스로 이 역할을 부여할 수 있습니다';

  @override
  String get serverDefaultRoleUndeletable => '기본 역할은 삭제할 수 없습니다.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return '“$roleName” 역할을 삭제하시겠어요?';
  }

  @override
  String get serverCouldNotDeleteRole => '해당 역할을 삭제할 수 없습니다.';

  @override
  String get serverMemberFallback => '멤버';

  @override
  String get serverNoRolesYet => '아직 역할이 없습니다.';

  @override
  String get serverRefreshStatus => '브라우저에서 이미 연결하셨나요? 상태 새로고침';

  @override
  String get serverPrintfulConnected => 'Printful 연결됨';

  @override
  String get serverPrintfulNotConnected => 'Printful 연결 안 됨';

  @override
  String get serverPrintfulDescription =>
      '이 서버의 Printful 계정을 연결하면 Koda를 통해 접수된 굿즈 주문을 처리할 수 있습니다. 서버마다 자체 스토어를 연결합니다.';

  @override
  String get serverConnecting => '연결 중...';

  @override
  String get serverConnectPrintful => 'Printful 연결';

  @override
  String get serverTiltifyConnected => 'Tiltify 연결됨';

  @override
  String get serverTiltifyNotConnected => 'Tiltify 연결 안 됨';

  @override
  String get serverTiltifyDescription =>
      '이 서버의 Tiltify 계정을 연결하면 자선 캠페인의 실시간 진행 상황을 모든 멤버에게 보여줄 수 있습니다. 읽기 전용입니다 -- Koda는 Tiltify 측에서 어떤 게시나 변경도 하지 않습니다.';

  @override
  String get serverConnectTiltify => 'Tiltify 연결';

  @override
  String get serverNoTiltifyCampaigns => '이 Tiltify 계정에서 캠페인을 찾을 수 없습니다.';

  @override
  String get serverPickCampaign => '표시할 캠페인을 선택하세요';

  @override
  String get serverUntitledCampaign => '제목 없는 캠페인';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '목표 $goal 중 $currency $raised 모금됨';
  }

  @override
  String get serverViewCampaign => '캠페인 보기';

  @override
  String get serverRefreshButton => '새로고침';

  @override
  String get serverUploadButton => '업로드';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '$used / $limit 슬롯 사용 중 -- 부스트 레벨 $level';
  }

  @override
  String get serverNoCustomEmoji => '아직 커스텀 이모지가 없습니다.';

  @override
  String get serverDeleteEmojiTooltip => '이모지 삭제';

  @override
  String get serverUploadEmojiTitle => '이모지 업로드';

  @override
  String get serverEmojiNameHint => '이름 (영문, 숫자, _)';

  @override
  String get serverChooseImage => '이미지 선택';

  @override
  String serverCurrentBoostLevel(int level) {
    return '현재 부스트 레벨: $level';
  }

  @override
  String get serverBackgroundTitle => '서버 배경';

  @override
  String get serverBackgroundDescription =>
      '이 서버의 모든 사람에게 채널 화면 뒤로 표시되는 사용자 지정 배경입니다.';

  @override
  String get serverBackgroundLockedHint => '부스트 레벨 4에 도달하면 사용자 지정 배경이 해제됩니다.';

  @override
  String get serverIconBorderTitle => '서버 아이콘 테두리';

  @override
  String get serverIconBorderDescription =>
      '모든 멤버의 서버 목록에서 이 서버 아이콘 주변에 표시되는 강조 테두리입니다.';

  @override
  String get serverIconBorderLockedHint =>
      '부스트 레벨 5에 도달하면 사용자 지정 아이콘 테두리가 해제됩니다.';

  @override
  String get serverBoostFromBank => '마켓플레이스의 서버 뱅크에서 이 서버를 부스트하여 레벨을 올리세요.';

  @override
  String get serverMarketplaceListingLabel => '마켓플레이스 등록';

  @override
  String get serverListInMarketplace => 'Koda 마켓플레이스에 등록';

  @override
  String get serverListInMarketplaceDescription =>
      '이 서버의 스토어를 Koda 마켓플레이스에 등록하고, 매주 진행되는 추천 상품 로테이션에 포함될 기회를 얻습니다. 이는 쇼핑에 관한 것이며 가입할 서버를 찾는 것과는 무관합니다 -- 일반 서버 검색에는 영향을 주지 않습니다.';

  @override
  String get serverSocialLinkLabel => '소셜 / 초대 링크 (선택)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => '링크 저장';

  @override
  String get serverPricingLabel => '가격';

  @override
  String get serverPrimaryCurrencyLabel => '기본 통화';

  @override
  String get serverPrimaryCurrencyDescription =>
      '이 서버에 설정하는 서버 구독 등급 및 디지털 상품 가격에 적용됩니다.';

  @override
  String get serverPrimaryLanguageLabel => '기본 언어';

  @override
  String get serverPrimaryLanguageDescription =>
      '멤버가 이 설정과 다른 언어로 게시한 메시지에는 작은 언어 배지가 표시됩니다.';

  @override
  String get serverMarketplaceLinkSaved => '마켓플레이스 링크가 저장되었습니다.';

  @override
  String get serverIconUpdated => '서버 아이콘이 업데이트되었습니다!';

  @override
  String get serverTemplateImported => '템플릿을 가져왔습니다!';

  @override
  String get serverImportFromDiscord => 'Discord에서 가져오기';

  @override
  String get serverVispPlanLive => 'Visp의 계획이 완성되었습니다!';

  @override
  String get serverAskVisp => 'Visp에게 물어보기';

  @override
  String get serverAddCategoryButton => '카테고리 추가';

  @override
  String get serverAddChannelHereTooltip => '여기에 채널 추가';

  @override
  String get serverRename => '이름 바꾸기';

  @override
  String get serverUncategorized => '미분류';

  @override
  String get serverAddChannel => '채널 추가';

  @override
  String get serverEditRulesContent => '규칙 내용 편집';

  @override
  String get serverRulesContentHint => '여기에 서버 규칙을 입력하세요...';

  @override
  String get serverRulesUpdated => '규칙이 업데이트되었습니다!';

  @override
  String get serverAddRole => '역할 추가';

  @override
  String get serverDefaultRoleLabel => '기본 역할';

  @override
  String get serverManageRolesTooltip => '역할 관리';

  @override
  String get serverMutedLabel => '음소거됨';

  @override
  String get serverExpandedLabel => '펼침';

  @override
  String get serverCollapsedLabel => '접음';

  @override
  String get serverUnmute => '음소거 해제';

  @override
  String get serverMute => '음소거';

  @override
  String get serverKick => '추방';

  @override
  String get serverBan => '차단';

  @override
  String serverBannedUsersLabel(int count) {
    return '차단된 사용자 — $count';
  }

  @override
  String get serverNoBannedUsers => '차단된 사용자가 없습니다.';

  @override
  String get serverUnban => '차단 해제';

  @override
  String get serverMemberFallbackGeneric => '이 멤버';

  @override
  String serverBanConfirm(String username, String serverName) {
    return '$username님을 $serverName에서 차단하시겠어요? 차단이 해제되기 전까지는 다시 참가할 수 없습니다.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return '$username님을 $serverName에서 추방하시겠어요? 초대를 통해 다시 참가할 수 있습니다.';
  }

  @override
  String get serverMuteDuration60Sec => '60초';

  @override
  String get serverMuteDuration5Min => '5분';

  @override
  String get serverMuteDuration10Min => '10분';

  @override
  String get serverMuteDuration1Hour => '1시간';

  @override
  String get serverMuteDuration1Day => '1일';

  @override
  String get serverMuteDuration1Week => '1주';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return '$username님을 $action 처리할 수 없습니다.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return '$username님 음소거';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return '$username님을 음소거할 수 없습니다.';
  }

  @override
  String get serverUnlockInvites => '초대 잠금 해제';

  @override
  String get serverInvitesUnlocked => '초대가 잠금 해제되었습니다.';

  @override
  String get serverAuditLogDescription =>
      '1단계 모더레이션 활동 -- 추방, 차단, 음소거, 자동 도배/공격 방지 조치입니다. 메타데이터만 포함되며 메시지 내용은 포함되지 않습니다.';

  @override
  String get serverSystemActor => '시스템';

  @override
  String get serverActionKicked => '추방함';

  @override
  String get serverActionBanned => '차단함';

  @override
  String get serverActionUnbanned => '차단 해제함';

  @override
  String get serverActionMuted => '음소거함';

  @override
  String get serverActionUnmuted => '음소거 해제함';

  @override
  String get serverActionFloodDetected => '도배로 인해 자동 음소거됨';

  @override
  String get serverActionRaidLockdownEnabled => '초대를 잠금 (공격 방지)';

  @override
  String get serverActionRaidLockdownDisabled => '초대 잠금 해제';

  @override
  String get serverActionMoved => '이동시킴';

  @override
  String get serverUnknownAction => '알 수 없는 작업';

  @override
  String get serverNoModerationActivity => '아직 모더레이션 활동이 없습니다.';

  @override
  String get serverReportsDescription =>
      '이 서버의 멤버가 신고한 메시지입니다 -- 신고자 본인의 이미 복호화된 사본이며, 신고를 통해 공개되었습니다.';

  @override
  String get serverNoPendingReports => '대기 중인 신고가 없습니다.';

  @override
  String get serverReportReasonOther => '기타';

  @override
  String get serverReportStatusActioned => '처리됨';

  @override
  String get serverReportStatusDismissed => '기각됨';

  @override
  String get serverResolvedLabel => '해결됨';

  @override
  String serverReportedBy(String reporter, String target) {
    return '$reporter님이 신고함 -- 보낸 사람: $target';
  }

  @override
  String serverReportNote(String note) {
    return '메모: $note';
  }

  @override
  String get serverDismissButton => '기각';

  @override
  String get serverMarkActioned => '처리 완료로 표시';

  @override
  String get serverCreateInvite => '초대 만들기';

  @override
  String get serverInviteCreatedTitle => '초대가 생성되었습니다';

  @override
  String get serverNoActiveInvites => '활성화된 초대가 없습니다';

  @override
  String serverUsesLabel(String uses) {
    return '사용 횟수: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => '초대 삭제';

  @override
  String get serverChangeIconLabel => '서버 아이콘 변경';

  @override
  String get serverFallbackName => '서버';

  @override
  String serverSettingsTitle(String serverName) {
    return '$serverName 설정';
  }

  @override
  String get serverTabChannels => '채널';

  @override
  String get serverTabRoles => '역할';

  @override
  String get serverTabMembers => '멤버';

  @override
  String get serverTabInvites => '초대';

  @override
  String get serverTabMerch => '굿즈';

  @override
  String get serverTabEmoji => '이모지';

  @override
  String get serverTabCustomize => '사용자 지정';

  @override
  String get serverTabAuditLog => '감사 로그';

  @override
  String get serverTabReports => '신고';

  @override
  String get serverTabThresholdMod => '임계값 모더레이션';

  @override
  String get serverTabCharity => '자선';

  @override
  String get homeCustomEmojiFallback => '커스텀 이모지';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '반응 $count개',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted => ', 회원님이 반응했습니다. 활성화하면 제거됩니다';

  @override
  String get homeReactionActivateToAdd => ', 활성화하면 추가됩니다';

  @override
  String get homeAddReactionLabel => '반응 추가';

  @override
  String homeViewProfile(String username) {
    return '$username님의 프로필 보기';
  }

  @override
  String get homeMoveToVoiceChannel => '음성 채널로 이동…';

  @override
  String get homeMoveVoiceChannelDialogTitle => '음성 채널 선택';

  @override
  String get homeNoOtherVoiceChannels => '다른 음성 채널이 없습니다';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username님이 지금 $channel에 있습니다';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return '$username님을 이동할 수 없습니다';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return '이제 $channel에 있습니다';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return '대화하려면 $channel에 참가하세요';
  }

  @override
  String get adminPanelTitle => '관리자 패널';

  @override
  String get adminTabBackerCodes => '후원자 코드';

  @override
  String get adminTabUsers => '사용자';

  @override
  String get adminTabDmReports => 'DM 신고';

  @override
  String get adminTabSpamFlags => '스팸 플래그';

  @override
  String get adminTabWiki => '위키';

  @override
  String get adminTabBoosts => '부스트';

  @override
  String get adminCreateBackerCodeTitle => '후원자 코드 만들기';

  @override
  String get adminCodeHint => '코드 (비워두면 자동 생성)';

  @override
  String get adminNoteHint => '메모 (예: \"Kickstarter Tier 2\")';

  @override
  String get adminFlagsJsonHint =>
      'JSON 형식의 플래그, 예: \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint => '최대 사용 횟수 (비워두면 무제한)';

  @override
  String get adminCodeCreatedTitle => '코드 생성됨';

  @override
  String get adminCodeLabel => '코드:';

  @override
  String get adminCopyCodeTooltip => '코드 복사';

  @override
  String adminFlagsValue(String flags) {
    return '플래그: $flags';
  }

  @override
  String get adminBackerCodesHeader => '후원자 및 리워드 코드';

  @override
  String get adminNewCodeButton => '새 코드';

  @override
  String get adminNoCodesYet => '아직 코드가 없습니다';

  @override
  String get adminRewardsHeader => '보상';

  @override
  String get adminRewardAlphaBetaAccess => '알파/베타 액세스 + Alpha Spark 배지';

  @override
  String get adminRewardLifetimePulse => '영구 Pulse 상태 + Founder 배지 + 향상된 비트레이트';

  @override
  String get adminRewardMonthlyBoostTokenOne => '월간 서버 부스트 토큰 (향상된 오디오/비디오)';

  @override
  String get adminRewardAnimatedFrameBundle =>
      '애니메이션 프로필 프레임 + Founders Hall + 월간 서버 토큰 2개';

  @override
  String get adminRewardTitanGlow => '영구적인 \"Titan\" 사용자 이름 글로우';

  @override
  String get adminRewardAnimatedFrame => '애니메이션 프레임';

  @override
  String get adminRewardFoundersHall => 'Founders Hall';

  @override
  String adminRewardMonthlyBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '월 $count개 부스트 토큰',
    );
    return '$_temp0';
  }

  @override
  String get adminRewardsNone => '보상 없음';

  @override
  String get adminRegistrationOpenLabel => '가입이 모두에게 열려 있습니다';

  @override
  String get adminRegistrationInviteOnlyLabel => '가입은 초대 전용입니다 (후원자 코드 필요)';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses회 사용';
  }

  @override
  String get adminSearchUsersHint => '사용자 이름으로 사용자 검색...';

  @override
  String get adminSearchUsersPrompt => '위에서 사용자를 검색하세요';

  @override
  String get adminNoDmReports => 'DM 신고가 없습니다.';

  @override
  String get adminResolvedLabel => '해결됨';

  @override
  String get adminReasonOther => '기타';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return '신고자: $reporterId\n공개된 발신자: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return '메모: $note';
  }

  @override
  String get adminDismissButton => '무시';

  @override
  String get adminMarkActionedButton => '조치 완료로 표시';

  @override
  String get adminStatusActioned => '조치됨';

  @override
  String get adminStatusDismissed => '무시됨';

  @override
  String get adminNoSpamFlags => '스팸 플래그가 없습니다.';

  @override
  String get adminFlagMassDmSpam => '대량 DM 스팸';

  @override
  String get adminFlagRaidLockdown => '레이드 잠금';

  @override
  String get adminFlagBotBehavior => '봇 같은 행동';

  @override
  String get adminFlagChannelFlooding => '채널 도배';

  @override
  String get adminAutoEscalatedBadge => '자동 상향 조정됨';

  @override
  String adminConfidenceLabel(String score, String label) {
    return '신뢰도: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return '사용자: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return '서버: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '참가자 $totalJoiners명 중 $mutedCount명이 아직 음소거 상태';
  }

  @override
  String get adminNoJoinersMuted => '현재 음소거된 참가자가 없습니다';

  @override
  String adminRestrictedUntil(String until) {
    return '현재 $until까지 제한됨';
  }

  @override
  String get adminNotCurrentlyRestricted => '현재 제한되어 있지 않습니다';

  @override
  String get adminDismissUndoButton => '무시 및 실행 취소';

  @override
  String get adminConfirmRestrictButton => '확인 및 제한';

  @override
  String get adminDeleteArticleTitle => '문서를 삭제할까요?';

  @override
  String adminDeleteArticleBody(String title) {
    return '“$title”이(가) Visp의 지식 베이스에서 삭제됩니다.';
  }

  @override
  String get adminNewArticleTitle => '새 문서';

  @override
  String get adminEditArticleTitle => '문서 편집';

  @override
  String get adminArticleTitleHint => '제목';

  @override
  String get adminArticleContentHint => '문서 내용 (마크다운)';

  @override
  String get adminWikiArticlesHeader => '위키 문서';

  @override
  String get adminNoArticlesYet => '아직 문서가 없습니다';

  @override
  String get adminEditArticleTooltip => '문서 편집';

  @override
  String get adminDeleteArticleTooltip => '문서 삭제';

  @override
  String get adminSearchServersHint => '서버 이름으로 서버 검색...';

  @override
  String get adminSearchServersPrompt => '위에서 서버를 검색하세요';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return '$serverName에 부스트 지급';
  }

  @override
  String get adminNumBoostsHint => '부스트 개수';

  @override
  String get adminGrantButton => '지급';

  @override
  String get adminPositiveNumberError => '양의 정수를 입력하세요.';

  @override
  String get adminGrantBoostsFailed => '부스트 지급에 실패했습니다.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$serverName에 부스트 $count개를 지급했습니다 -- 이제 레벨 $level ($activeCount개 활성).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '멤버 $count명';
  }

  @override
  String get adminGrantBoostsButtonLabel => '부스트 지급';

  @override
  String get parentalDashboardTitle => '가족';

  @override
  String get parentalDashboardCreateChildTitle => '자녀 계정 만들기';

  @override
  String get parentalDashboardUsernameHint => '사용자 이름';

  @override
  String get parentalDashboardEmailHint => '이메일';

  @override
  String get parentalDashboardPasswordHint => '비밀번호';

  @override
  String get parentalDashboardCreateChildExplanation =>
      '완전히 보호자 관리하에 있는 계정이 생성됩니다. 라벨이 지정된 채널은 차단되며, 허용 시간대를 설정하고 자녀의 친구와 서버를 확인(내용은 열람 불가)할 수 있습니다.';

  @override
  String get parentalDashboardValidationError =>
      '사용자 이름, 이메일, 8자 이상의 비밀번호가 필요합니다.';

  @override
  String get parentalDashboardCreateChildFailed =>
      '자녀 계정을 만들 수 없습니다 -- 사용자 이름/이메일이 이미 사용 중일 수 있습니다.';

  @override
  String get parentalDashboardCreatingLabel => '만드는 중...';

  @override
  String get parentalDashboardNoChildren => '연결된 계정이 아직 없습니다.';

  @override
  String get parentalDashboardSupervisedLabel => '보호되는 계정';

  @override
  String get parentalDashboardUnknownUser => '알 수 없음';

  @override
  String get childDetailFallbackTitle => '자녀 계정';

  @override
  String get childDetailTabFriends => '친구';

  @override
  String get childDetailTabServers => '서버';

  @override
  String get childDetailTabSchedule => '일정';

  @override
  String get childDetailTabOverride => '예외 허용';

  @override
  String get childDetailNoFriends => '친구가 없습니다.';

  @override
  String get childDetailUnknownUser => '알 수 없음';

  @override
  String get childDetailRemoveFriendTooltip => '친구 삭제';

  @override
  String get childDetailNoServers => '가입된 서버가 없습니다.';

  @override
  String childDetailMemberCount(int count) {
    return '멤버 $count명';
  }

  @override
  String get childDetailRemoveServerTooltip => '서버에서 제거';

  @override
  String get childDetailRestrictAccessTitle => '지정 시간에만 접근 허용';

  @override
  String get childDetailRestrictAccessSubtitle => '끄면 언제든지 제한 없이 접근할 수 있습니다';

  @override
  String get childDetailTimezoneLabel => '시간대';

  @override
  String get childDetailMonday => '월요일';

  @override
  String get childDetailTuesday => '화요일';

  @override
  String get childDetailWednesday => '수요일';

  @override
  String get childDetailThursday => '목요일';

  @override
  String get childDetailFriday => '금요일';

  @override
  String get childDetailSaturday => '토요일';

  @override
  String get childDetailSunday => '일요일';

  @override
  String get childDetailNoAccessLabel => '접근 불가';

  @override
  String get childDetailToLabel => '~';

  @override
  String get childDetailSavingLabel => '저장 중...';

  @override
  String get childDetailSaveScheduleButton => '일정 저장';

  @override
  String get childDetailScheduleSaved => '일정이 저장되었습니다.';

  @override
  String get childDetailOverrideExplanation =>
      '정상 일정 외에 일시적으로 접근을 허용합니다 -- 주간 일정을 바꾸지 않고 일회성 예외를 두고 싶을 때 유용합니다.';

  @override
  String get childDetailReasonHint => '사유 (선택 사항)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes분';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours시간';
  }

  @override
  String get childDetailRevokeOverrideButton => '활성 예외 허용 취소';

  @override
  String get childDetailAccessGranted => '일시적 접근이 허용되었습니다.';

  @override
  String get childDetailOverrideRevoked => '예외 허용이 취소되었습니다.';

  @override
  String get digitalGoodsTitle => '디지털 상품';

  @override
  String get digitalGoodsMyProductsTitle => '내 상품';

  @override
  String get digitalGoodsManageProductsTooltip => '이 서버의 상품 관리';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => '둘러보기로 전환';

  @override
  String get digitalGoodsCreateProductTooltip => '상품 만들기';

  @override
  String get digitalGoodsBrowseTab => '둘러보기';

  @override
  String get digitalGoodsMyListingsTab => '내 등록 상품';

  @override
  String get digitalGoodsMyPurchasesTab => '내 구매 내역';

  @override
  String get digitalGoodsNoProductsYet => '아직 상품이 없습니다';

  @override
  String get digitalGoodsNoProductsAvailable => '이용 가능한 상품이 없습니다';

  @override
  String get digitalGoodsCreateFirstProductHint => '첫 상품을 만들어 판매를 시작하세요';

  @override
  String get digitalGoodsCheckBackLater => '디지털 상품은 나중에 다시 확인해 주세요';

  @override
  String get digitalGoodsCreateProductButton => '상품 만들기';

  @override
  String get digitalGoodsLicenseKeyBadge => '라이선스 키';

  @override
  String get digitalGoodsFileBadge => '파일';

  @override
  String get digitalGoodsAllServersBadge => '모든 서버';

  @override
  String get digitalGoodsFreeForYou => '회원님에게는 무료';

  @override
  String get digitalGoodsFreeLabel => '무료';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count개 판매됨';
  }

  @override
  String get digitalGoodsKeysButton => '키';

  @override
  String get digitalGoodsGetForFree => '무료로 받기';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return '$price에 구매';
  }

  @override
  String get digitalGoodsNoPurchasesYet => '아직 구매 내역이 없습니다';

  @override
  String get digitalGoodsUnknownProduct => '알 수 없는 상품';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return '$date에 구매함';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => '키 복사';

  @override
  String get digitalGoodsLicenseKeyCopied => '라이선스 키가 복사되었습니다!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return '$date에 만료';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => '내 라이선스 키';

  @override
  String get digitalGoodsCopyKeyButton => '키 복사';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      '결제를 시작할 수 없습니다 -- 이 제작자가 아직 Stripe를 연결하지 않았을 수 있습니다.';

  @override
  String get digitalGoodsPurchaseComplete => '구매가 완료되었습니다! 내 구매 내역에서 확인하세요.';

  @override
  String get digitalGoodsPurchasePending =>
      '아직 결제 완료를 기다리는 중입니다 -- 완료되면 내 구매 내역에 표시됩니다.';

  @override
  String get digitalGoodsCreateProductTitle => '상품 만들기';

  @override
  String get digitalGoodsEditProductTitle => '상품 편집';

  @override
  String get digitalGoodsProductTitleHint => '상품 제목';

  @override
  String get digitalGoodsDescriptionHint => '설명 (선택 사항)';

  @override
  String get digitalGoodsPriceHint => '가격 (USD, 무료라면 비워두세요)';

  @override
  String get digitalGoodsProductTypeLabel => '상품 유형';

  @override
  String get digitalGoodsFileDownloadOption => '파일 다운로드';

  @override
  String get digitalGoodsLicenseKeyOption => '라이선스 키';

  @override
  String get digitalGoodsAvailabilityLabel => '공개 범위';

  @override
  String get digitalGoodsThisServerOnlyOption => '이 서버에서만';

  @override
  String get digitalGoodsAllKodaServersOption => '모든 Koda 서버';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      '만든 후 \"키\" 버튼으로 라이선스 키를 업로드하세요.';

  @override
  String get digitalGoodsProductFileLabel => '상품 파일';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName (${sizeMb}MB)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => '파일 제거';

  @override
  String get digitalGoodsUploadingLabel => '업로드 중...';

  @override
  String get digitalGoodsChooseFileButton => '파일 선택';

  @override
  String get digitalGoodsReplaceFileButton => '파일 교체';

  @override
  String get digitalGoodsChooseFileBeforeSaving => '저장하기 전에 이 상품의 파일을 선택하세요.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => '라이선스 키 업로드';

  @override
  String get digitalGoodsPasteKeysHint => '한 줄에 하나씩 키를 붙여넣으세요:';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => '키 업로드';

  @override
  String get digitalGoodsLicenseKeysUploaded => '라이선스 키가 업로드되었습니다!';

  @override
  String get serverSubscriptionManageTitle => '구독 관리';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return '$serverName 구독';
  }

  @override
  String get serverSubscriptionAddTierTooltip => '등급 추가';

  @override
  String get serverSubscriptionNoTiersYet => '아직 구독 등급이 없습니다';

  @override
  String get serverSubscriptionCreateUpTo3Tiers => '커뮤니티를 위한 등급을 최대 3개까지 만드세요';

  @override
  String get serverSubscriptionCreateFirstTierButton => '첫 등급 만들기';

  @override
  String get serverSubscriptionShowSubscriberCounts => '구독자 수 표시';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/월';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '활성 구독자 $count명',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned => '역할 자동 부여';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '마켓플레이스 $discount% 할인';
  }

  @override
  String get serverSubscriptionNoTiersMember => '이 서버에는 구독 등급이 없습니다';

  @override
  String get serverSubscriptionActiveSubscriberBadge => '활성 구독자';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return '$date에 만료';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk => '구독자 전용 역할';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return '마켓플레이스 구매 $discount% 할인';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk => '구독자 전용 채널';

  @override
  String get serverSubscriptionCurrentlySubscribed => '구독 중';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return '$price/월로 구독하기';
  }

  @override
  String get serverSubscriptionCreateTierTitle => '등급 만들기';

  @override
  String get serverSubscriptionEditTierTitle => '등급 편집';

  @override
  String get serverSubscriptionTierNameHint => '등급 이름 (예: Fan, Supporter, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => '설명 (선택 사항)';

  @override
  String get serverSubscriptionPriceHint => '월 요금 (USD)';

  @override
  String get serverSubscriptionDiscountLabel => '마켓플레이스 할인율';

  @override
  String get serverSubscriptionPositionLabel => '위치';

  @override
  String serverSubscriptionTierOption(int position) {
    return '등급 $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel => '구독 시 부여할 역할 — 선택 사항';

  @override
  String get serverSubscriptionRoleFallback => '역할';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      '멤버가 구독하는 즉시 자동으로 부여되며, 구독이 만료되는 즉시 제거됩니다.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      '등급이 생성되었습니다 -- 멤버가 구독할 수 있으려면 마켓플레이스 → 제작자에서 Stripe를 연결하세요.';

  @override
  String get serverSubscriptionDeleteTierTitle => '등급 삭제';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return '\"$tierName\"을(를) 삭제할까요? 기존 구독자는 만료될 때까지 계속 이용할 수 있습니다.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return '$tierName 구독하기';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel => '월간 구독';

  @override
  String get serverSubscriptionServerBankEarnsLabel => '서버 뱅크 수익';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points점';
  }

  @override
  String get serverSubscriptionPaymentSecureNote => '결제는 Stripe를 통해 안전하게 처리됩니다';

  @override
  String get serverSubscriptionSubscribeButton => '구독하기';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      '결제를 시작할 수 없습니다 -- 이 서버의 소유자가 아직 Stripe를 연결하지 않았을 수 있습니다.';

  @override
  String get serverSubscriptionSubscribed => '구독했습니다!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      '아직 결제 완료를 기다리는 중입니다 -- 완료되면 활성화됩니다.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return '$username님에게 팁 보내기';
  }

  @override
  String get tipDialogSelectAmountLabel => '금액 선택';

  @override
  String get tipDialogMessageHint => '메시지 추가 (선택 사항)';

  @override
  String get tipDialogYouPayLabel => '결제 금액';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username님이 받는 금액';
  }

  @override
  String get tipDialogSendTipButton => '팁 보내기';

  @override
  String get tipDialogFailedToSendTip =>
      '팁 전송에 실패했습니다. 제작자가 Stripe에 연결되어 있지 않을 수 있습니다.';

  @override
  String get tipDialogCouldNotStartCheckout => '결제를 시작할 수 없습니다. 잠시 후 다시 시도하세요.';

  @override
  String get tipDialogTipSent => '팁을 보냈습니다!';

  @override
  String get tipDialogTipPending => '아직 결제 완료를 기다리는 중입니다 -- 완료되면 처리됩니다.';

  @override
  String get tipDialogUnknownUser => '알 수 없음';

  @override
  String get marketplaceTitle => '마켓플레이스';

  @override
  String get marketplaceCreatorPayoutsTitle => '제작자 수익금';

  @override
  String get marketplaceReceiveTipsSubtitle => 'Stripe를 통해 직접 팁 받기';

  @override
  String get marketplaceTabServerBank => '서버 뱅크';

  @override
  String get marketplaceTabDigitalGoods => '디지털 상품';

  @override
  String get marketplaceTabMerch => '굿즈';

  @override
  String get marketplaceTabSubscription => '구독';

  @override
  String get marketplaceTabRevenue => '수익';

  @override
  String get marketplaceSelectServerSubscription => '구독을 확인할 서버를 선택하세요';

  @override
  String get marketplaceSelectServerBank => '뱅크를 확인할 서버를 선택하세요';

  @override
  String get marketplaceSelectServerRevenue => '수익을 확인할 서버를 선택하세요';

  @override
  String get marketplaceStripeAccountStatus => 'Stripe 계정';

  @override
  String get marketplaceOnboardingCompleteStatus => '온보딩 완료';

  @override
  String get marketplaceAcceptingPaymentsStatus => '결제 수락 중';

  @override
  String get marketplaceConnectStripeButton => 'Stripe 계정 연결';

  @override
  String get marketplaceCompleteStripeOnboardingButton => 'Stripe 온보딩 완료하기';

  @override
  String get marketplaceRefreshStatusButton => '상태 새로고침';

  @override
  String get marketplaceReadyToReceiveTips => '팁을 받을 준비가 되었습니다!';

  @override
  String get marketplaceHowItWorksTitle => '작동 방식';

  @override
  String get marketplaceHowItWorksStep1 => 'Stripe 계정 연결하기';

  @override
  String get marketplaceHowItWorksStep2 => '본인 확인 완료하기';

  @override
  String get marketplaceHowItWorksStep3 => '계좌로 직접 팁 받기';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda는 5%의 처리 수수료를 부과합니다. 수수료는 포인트로 서버 뱅크에 적립됩니다.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      '서버 소유자 또는 마켓플레이스 관리 권한이 있는 사람만 서버 뱅크를 볼 수 있습니다.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName 서버를 부스트했습니다!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '커스텀 이모지 슬롯 $limit개';
  }

  @override
  String get marketplaceServerFallback => '서버';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance점';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '활동 $amount';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      '포인트는 이 서버의 팁과 구독에 부과되는 5% 수수료에서 적립됩니다. 포인트로 서버 업그레이드를 잠금 해제하세요.';

  @override
  String get marketplaceServerBoostsTitle => '서버 부스트';

  @override
  String marketplaceLevelLabel(int level) {
    return '레벨 $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '활성 부스트 $count개',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: '레벨 $level까지 부스트 $more개 더 필요',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix => ', 커스텀 서버 배경 잠금 해제';

  @override
  String get marketplaceUnlockIconBorderSuffix => ', 커스텀 서버 아이콘 테두리 잠금 해제';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사용 가능한 부스트 토큰이 $count개 있습니다.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      '부스트 토큰은 Pulse 구독(월 1개)을 통해 얻을 수 있습니다. 구독 탭에서 구독하면 획득할 수 있습니다.';

  @override
  String get marketplaceBoostingLabel => '부스트 중...';

  @override
  String get marketplaceBoostThisServerButton => '이 서버 부스트하기';

  @override
  String get marketplaceComingSoonUpgradesTitle => '출시 예정 — 서버 업그레이드';

  @override
  String get marketplaceSpendPointsList =>
      '서버 뱅크 포인트 사용처:\n• 커스텀 서버 도메인\n• 멤버 제한 증가\n• 우선 지원\n• 전용 서버 배지';

  @override
  String get marketplaceSourceTip => '팁';

  @override
  String get marketplaceSourceSubscription => 'Koda 구독';

  @override
  String get marketplaceSourceServerSubscription => '서버 구독';

  @override
  String get marketplaceSourceDigitalProduct => '디지털 상품';

  @override
  String get marketplaceSourceStageTicket => '스테이지 티켓';

  @override
  String get marketplaceSourcePrintfulOrder => '굿즈 주문';

  @override
  String get marketplaceJustNow => '방금';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return '$minutes분 전';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return '$hours시간 전';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return '$days일 전';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      '마켓플레이스를 관리할 수 있는 멤버만 이 서버의 수익을 볼 수 있습니다.';

  @override
  String get marketplaceBalanceLabel => '잔액';

  @override
  String get marketplaceLifetimeEarnedLabel => '누적 수익';

  @override
  String get marketplaceLast30DaysTitle => '최근 30일';

  @override
  String get marketplaceRevenueBySourceTitle => '출처별 수익';

  @override
  String get marketplaceNoRevenueYet => '아직 수익이 없습니다.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '거래 $count건',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => '최근 거래';

  @override
  String get marketplaceNoTransactionsYet => '아직 거래가 없습니다.';

  @override
  String get marketplaceNoActivityYet => '아직 활동이 없습니다';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Printful에서 상품 $count개를 동기화했습니다',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Printful과 동기화할 수 없습니다 -- 굿즈 설정에서 연결 상태를 확인하세요.';

  @override
  String get printfulMerchSelectServer => '굿즈를 확인할 서버를 선택하세요';

  @override
  String get printfulMerchManageCatalogTitle => '굿즈 카탈로그 관리';

  @override
  String get printfulMerchTitle => '굿즈';

  @override
  String get printfulMerchSyncingLabel => '동기화 중...';

  @override
  String get printfulMerchSyncCatalogButton => '카탈로그 동기화';

  @override
  String get printfulMerchSwitchToBrowseTooltip => '둘러보기로 전환';

  @override
  String get printfulMerchManageTooltip => '이 서버의 굿즈 관리';

  @override
  String get printfulMerchNothingSyncedYet => '아직 동기화된 항목이 없습니다';

  @override
  String get printfulMerchNoMerchAvailable => '아직 이용 가능한 굿즈가 없습니다';

  @override
  String get printfulMerchSyncHint => 'Printful 스토어를 동기화하여 상품 카탈로그를 가져오세요';

  @override
  String get printfulMerchCheckBackLater => '이 서버의 굿즈는 나중에 다시 확인해 주세요';

  @override
  String get printfulMerchOutOfStock => '품절';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$price부터 • 옵션 $count개',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => '보기';

  @override
  String printfulMerchPayoutTo(String username) {
    return '정산 대상: $username';
  }

  @override
  String get printfulMerchPayoutToYou => '정산 대상: 나';

  @override
  String get printfulMerchPayoutChangeButton => '변경';

  @override
  String get printfulMerchPayoutDialogTitle => '정산 수령인';

  @override
  String get printfulMerchPayoutDialogBody =>
      '이 상품의 주문 수익 몫을 본인이 아닌 다른 사용자에게 지급하도록 설정합니다 -- 누군가 구매하기 전에 해당 사용자가 자신의 Stripe 계정을 연결하고 온보딩을 완료해야 합니다.';

  @override
  String get printfulMerchPayoutUsernameHint => '사용자 이름';

  @override
  String get printfulMerchPayoutLookupButton => '조회';

  @override
  String get printfulMerchPayoutUserNotFound => '해당 이름의 사용자를 찾을 수 없습니다.';

  @override
  String printfulMerchPayoutResolvedAs(String username) {
    return '찾음: $username';
  }

  @override
  String get printfulMerchPayoutResetButton => '나로 재설정';

  @override
  String get printfulMerchCartTooltip => '장바구니';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productName을(를) 장바구니에 담았습니다';
  }

  @override
  String get printfulMerchQuantityLabel => '수량';

  @override
  String get printfulMerchDecreaseQuantityTooltip => '수량 줄이기';

  @override
  String get printfulMerchIncreaseQuantityTooltip => '수량 늘리기';

  @override
  String get printfulMerchAddToCartButton => '장바구니에 담기';

  @override
  String get printfulMerchOptionLabel => '옵션';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => '스타일';

  @override
  String get printfulMerchSizeLabel => '사이즈';

  @override
  String get printfulMerchYourCartTitle => '내 장바구니';

  @override
  String get printfulMerchCartEmpty => '장바구니가 비어 있습니다.';

  @override
  String get printfulMerchSubtotalLabel => '소계';

  @override
  String get printfulMerchCheckoutLabel => '결제';

  @override
  String get printfulMerchRemoveFromCartTooltip => '장바구니에서 제거';

  @override
  String get printfulMerchFillShippingAddressFirst => '먼저 배송 주소를 입력하세요.';

  @override
  String get printfulMerchCouldNotGetShippingRates => '해당 주소의 배송비를 가져올 수 없습니다.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      '결제를 시작할 수 없습니다. 잠시 후 다시 시도하세요.';

  @override
  String get printfulMerchOrderPlaced => '주문이 완료되었습니다!';

  @override
  String get printfulMerchOrderPending =>
      '아직 결제 완료를 기다리는 중입니다 -- 완료되면 주문이 진행됩니다.';

  @override
  String get printfulMerchShippingSpeedLabel => '배송 속도';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '영업일 기준 $min~$max일';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => '배송비 견적 받기';

  @override
  String get printfulMerchPayButton => '결제하기';

  @override
  String get kodaMarketplaceTitle => 'Koda 마켓플레이스';

  @override
  String get kodaMarketplaceTabSubscriptions => '구독';

  @override
  String get kodaMarketplaceTabBoosts => '부스트';

  @override
  String get kodaMarketplaceTabDiscover => '디스커버리';

  @override
  String get kodaMarketplaceTierFreeName => '무료';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return '$date에 만료';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks => '업그레이드하고 전용 혜택 받기';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사용 가능한 부스트 토큰이 $count개 있습니다',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      '참여 중인 서버의 서버 뱅크 탭에서 어떤 서버에든 토큰을 선물할 수 있습니다';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => '커스텀 아바타 프레임';

  @override
  String get kodaMarketplaceSparkPerkBadge => '프로필에 Spark 배지 표시';

  @override
  String get kodaMarketplaceSparkPerkFileLimit => '파일 업로드 용량 증가 (50MB)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality => '우선 음성 품질';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'Spark의 모든 혜택';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => '애니메이션 아바타 프레임';

  @override
  String get kodaMarketplacePulsePerkBadge => '프로필에 Pulse 배지 표시';

  @override
  String get kodaMarketplacePulsePerkFileLimit => '파일 업로드 용량 100MB';

  @override
  String get kodaMarketplacePulsePerkBoostToken => '매월 서버 부스트 토큰 1개';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/월';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => '현재 요금제';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return '$name 시작하기';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return '$name 선물하기';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return '$tier 선물하기';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return '$tier 구독하기';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel => '선물 받을 사용자 이름:';

  @override
  String get kodaMarketplaceUsernameHint => '사용자 이름';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => '구독';

  @override
  String get kodaMarketplaceTotalLabel => '합계';

  @override
  String get kodaMarketplacePaymentSecureNote => '결제는 Stripe를 통해 안전하게 처리됩니다';

  @override
  String get kodaMarketplaceProceedToPaymentButton => '결제 진행하기';

  @override
  String get kodaMarketplaceUserNotFound => '사용자를 찾을 수 없습니다';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      '결제를 시작할 수 없습니다. 잠시 후 다시 시도하세요.';

  @override
  String get kodaMarketplaceSubscriptionActive => '구독이 활성화되었습니다!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      '아직 결제 완료를 기다리는 중입니다 -- 완료되면 활성화됩니다.';

  @override
  String get kodaMarketplaceBoostPurchased => '부스트를 구매했습니다!';

  @override
  String get kodaMarketplaceBoostPending =>
      '아직 결제 완료를 기다리는 중입니다 -- 완료되면 준비됩니다.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count개 사용 가능';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => '부스트 구매';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      '일회성 구매입니다 -- Pulse 구독자는 갱신할 때마다 무료 토큰도 1개 받으므로, 정기적으로 부스트한다면 그쪽이 더 이득입니다.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return '부스트 구매 -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      '아직 Koda 마켓플레이스에 등록한 서버가 없습니다. 서버 소유자는 서버의 커스터마이즈 설정에서 이 기능을 켤 수 있습니다.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => '이번 주 추천';

  @override
  String get kodaMarketplaceAllListedServersHeader => '등록된 모든 서버';

  @override
  String get kodaMarketplaceFeaturedItemsHeader => '추천 아이템';

  @override
  String get kodaMarketplaceAllItemsHeader => '전체 아이템';

  @override
  String get kodaMarketplaceServerFallback => '서버';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '멤버 $count명',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceVisitStore => '스토어 방문';

  @override
  String get calendarFallbackTitle => '캘린더';

  @override
  String get calendarAskVispTooltip => 'Visp에게 물어보기';

  @override
  String get calendarCreateEventTooltip => '이벤트 만들기';

  @override
  String get calendarPreviousMonthTooltip => '이전 달';

  @override
  String get calendarNextMonthTooltip => '다음 달';

  @override
  String get calendarTodayButton => '오늘';

  @override
  String get calendarWeekdaySun => '일';

  @override
  String get calendarWeekdayMon => '월';

  @override
  String get calendarWeekdayTue => '화';

  @override
  String get calendarWeekdayWed => '수';

  @override
  String get calendarWeekdayThu => '목';

  @override
  String get calendarWeekdayFri => '금';

  @override
  String get calendarWeekdaySat => '토';

  @override
  String get calendarTodaySuffix => ', 오늘';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', 이벤트 $count개',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => '날짜를 선택하세요';

  @override
  String get calendarNoEvents => '이벤트 없음';

  @override
  String get calendarSubscribeTooltip => '구독';

  @override
  String get calendarUnsubscribeTooltip => '구독 취소';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return '반복: $recurrence';
  }

  @override
  String get calendarTicketOwned => '티켓 보유 중';

  @override
  String calendarTicketPrice(String price) {
    return '티켓 $price';
  }

  @override
  String get calendarDeleteEventTitle => '이벤트 삭제';

  @override
  String calendarDeleteEventConfirm(String title) {
    return '\"$title\"을(를) 삭제할까요? 이 작업은 되돌릴 수 없습니다.';
  }

  @override
  String get calendarEditEventTitle => '이벤트 편집';

  @override
  String get calendarCreateEventTitle => '이벤트 만들기';

  @override
  String get calendarEventTitleHint => '이벤트 제목';

  @override
  String get calendarDescriptionHint => '설명 (선택 사항)';

  @override
  String get calendarLocationHint => '장소 (선택 사항)';

  @override
  String calendarStartLabel(String timezone) {
    return '시작 ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return '시작 날짜 및 시간, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return '종료 — 선택 사항 ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return '종료 날짜 및 시간, $formatted';
  }

  @override
  String get calendarNotSetLabel => '설정 안 됨';

  @override
  String get calendarTapToSetEndTime => '탭하여 종료 시간 설정';

  @override
  String get calendarRecurrenceLabel => '반복';

  @override
  String get calendarRecurrenceNone => '반복 안 함';

  @override
  String get calendarRecurrenceDaily => '매일';

  @override
  String get calendarRecurrenceWeekly => '매주';

  @override
  String get calendarRecurrenceMonthly => '매월';

  @override
  String get calendarColorLabel => '색상';

  @override
  String calendarColorSwatchLabel(String hex) {
    return '색상 $hex';
  }

  @override
  String get calendarTicketPriceLabel => '티켓 가격 — 선택 사항';

  @override
  String get calendarLinkStageChannelLabel => '스테이지 채널에 연결 — 선택 사항';

  @override
  String get calendarStageChannelFallback => '스테이지';

  @override
  String get discordImportFetchError => '템플릿을 가져올 수 없습니다.';

  @override
  String get discordImportApplyError => '템플릿 적용에 실패했습니다. 다시 시도하세요.';

  @override
  String get discordImportTitle => 'Discord 템플릿 가져오기';

  @override
  String get discordImportDescription =>
      'discord.new 링크나 템플릿 코드를 붙여넣어 역할, 카테고리, 채널을 이 서버로 가져오세요.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 또는 템플릿 코드';

  @override
  String get discordImportPreviewButton => '미리보기';

  @override
  String get discordImportTemplateFallback => '템플릿';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '역할 $count개',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '카테고리 $count개',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '채널 $count개',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel => '기존 구조 교체';

  @override
  String get discordImportReplaceWarning => '기존의 모든 채널, 카테고리, 역할이 영구적으로 삭제됩니다.';

  @override
  String get discordImportAddDescription => '템플릿이 기존 서버 구조에 추가됩니다.';

  @override
  String get discordImportReplaceConfirmTitle => '서버 구조를 교체할까요?';

  @override
  String get discordImportReplaceConfirmBody =>
      '가져오기 전에 기존의 모든 채널, 카테고리, 역할이 영구적으로 삭제됩니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get discordImportYesReplace => '예, 교체합니다';

  @override
  String get discordImportReplaceAndImportButton => '교체 후 템플릿 가져오기';

  @override
  String get discordImportAddToServerButton => '서버에 템플릿 추가';

  @override
  String get thresholdModConfigureTitle => '임계값 모더레이션 설정';

  @override
  String get thresholdModConfigureExplanation =>
      '신뢰하는 모더레이터와, 채널 기록의 한 에포크를 복호화하기 전에 몇 명이 동의해야 하는지를 선택하세요. 회원님도 단독으로는 키를 가질 수 없습니다 -- 이 목록에 포함된 경우에만 예외입니다.';

  @override
  String get thresholdModThresholdLabel => '임계값:';

  @override
  String get thresholdModDecreaseThresholdTooltip => '임계값 줄이기';

  @override
  String get thresholdModIncreaseThresholdTooltip => '임계값 늘리기';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '모더레이터 $count명 중',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle => '임계값 복호화 요청';

  @override
  String get thresholdModChannelLabel => '채널';

  @override
  String get thresholdModReasonHint => '사유 -- 지정된 모든 모더레이터에게 표시됩니다';

  @override
  String get thresholdModRequestButton => '요청';

  @override
  String get thresholdModShareRelayed => '조각이 요청자에게 전달되었습니다.';

  @override
  String get thresholdModNotEnoughShares =>
      '아직 전달된 조각이 충분하지 않습니다 -- 더 많은 모더레이터가 전달한 후 다시 시도하세요.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '메시지 $count개',
    );
    return '에포크 $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages => '이 에포크에는 복호화 가능한 메시지가 없습니다.';

  @override
  String get thresholdModExplanation =>
      '채널 기록의 실제 복호화는 여러 지정 모더레이터가 적극적으로 동의해야만 가능합니다 -- 서버 소유자라도 혼자서는 불가능합니다. 항상 한 에포크 전체(마지막 멤버 변경 이후 전송된 모든 것)만 해제되며, 개별 메시지 하나만 해제되는 일은 없습니다.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return '활성화됨 -- 모더레이터 $count명, 임계값 $threshold';
  }

  @override
  String get thresholdModNotConfigured => '설정되지 않음';

  @override
  String get thresholdModReconfigureButton => '다시 설정';

  @override
  String get thresholdModEnableButton => '활성화';

  @override
  String get thresholdModNotEnabledForServer =>
      '이 서버에서는 임계값 모더레이션이 활성화되어 있지 않습니다.';

  @override
  String get thresholdModEnabledNotDesignated =>
      '이 서버에서 활성화되어 있습니다. 회원님은 지정된 모더레이터가 아닙니다.';

  @override
  String get thresholdModRequestsLabel => '요청';

  @override
  String get thresholdModRequestDecryptButton => '복호화 요청';

  @override
  String get thresholdModNoActiveRequests => '진행 중인 요청이 없습니다.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- 에포크 $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => '대기 중';

  @override
  String get thresholdModStatusApproved => '승인됨';

  @override
  String get thresholdModApproveButton => '승인';

  @override
  String get thresholdModRelayShareButton => '내 조각 전달';

  @override
  String get thresholdModTryReconstructButton => '재구성 시도';

  @override
  String get roleSelectNoRolesAvailable => '자율 부여 가능한 역할이 없습니다.';

  @override
  String get roleSelectInstructions =>
      '원하는 역할을 선택하세요. 역할을 탭하여 추가하거나 제거할 수 있습니다.';

  @override
  String get rulesScreenAcceptError => '규칙에 동의할 수 없습니다. 다시 시도하세요.';

  @override
  String get rulesScreenSubtitle => '서버 규칙';

  @override
  String get rulesScreenScrollToRead => '아래로 스크롤하여 모든 규칙을 읽어보세요';

  @override
  String get rulesScreenAcceptDisclaimer =>
      '동의를 클릭하면 이 규칙을 따르는 데 동의하는 것입니다.\n위반 시 서버에서 제거될 수 있습니다.';

  @override
  String get rulesScreenAcceptButton => '규칙에 동의합니다';

  @override
  String get rulesScreenReadAllToContinue => '계속하려면 모든 규칙을 읽어주세요';

  @override
  String get galleryNewPostTitle => '새 게시물';

  @override
  String get galleryChooseFileButton => '파일 선택';

  @override
  String get galleryOrDivider => '또는';

  @override
  String get galleryPasteUrlHint => '이미지/동영상 URL 붙여넣기';

  @override
  String get galleryTypeLabel => '유형';

  @override
  String get galleryImageOption => '이미지';

  @override
  String get galleryVideoOption => '동영상';

  @override
  String get galleryCaptionHint => '캡션 (선택 사항)';

  @override
  String get galleryPostButton => '게시';

  @override
  String get galleryNewCollectionTitle => '새 컬렉션';

  @override
  String get galleryCollectionNameHint => '컬렉션 이름';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return '\"$collectionName\"을(를) 삭제할까요? 안에 있던 게시물은 미분류 상태가 됩니다.';
  }

  @override
  String get galleryFeedTab => '피드';

  @override
  String get galleryCollectionsTab => '컬렉션';

  @override
  String get galleryNoPostsYet => '아직 게시물이 없습니다';

  @override
  String get galleryNoCollectionsYet => '아직 컬렉션이 없습니다';

  @override
  String get gallerySelectACollection => '컬렉션을 선택하세요';

  @override
  String get galleryNoPostsInCollection => '이 컬렉션에는 게시물이 없습니다';

  @override
  String get galleryAddPostButton => '게시물 추가';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return '화면 공유 실패: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return '$username님의 음량';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      '회원님에게 들리는 소리에만 영향을 줍니다 -- 이 기기, 이 통화에서만.';

  @override
  String get voiceScreenResetVolumeButton => '초기화';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return '연결할 수 없습니다: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen => '내 화면, 탭하여 전체 화면으로 보기';

  @override
  String get voiceScreenYourScreenLabel => '내 화면';

  @override
  String get voiceScreenTapToClose => '탭하여 닫기';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (나)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', 말하는 중';

  @override
  String get voiceScreenCameraOnSuffix => ', 카메라 켜짐';

  @override
  String get voiceScreenActivateToPopOut => ', 활성화하면 팝아웃됩니다';

  @override
  String get voiceScreenShowVarmTooltip => 'VARM 표시';

  @override
  String get voiceScreenHideVarmTooltip => 'VARM 숨기기';

  @override
  String get voiceScreenShowChatTooltip => '채팅 표시';

  @override
  String get voiceScreenHideChatTooltip => '채팅 숨기기';

  @override
  String get voiceScreenStartCameraTooltip => '카메라 시작';

  @override
  String get voiceScreenStopCameraTooltip => '카메라 중지';

  @override
  String get voiceScreenShareScreenTooltip => '화면 공유';

  @override
  String get voiceScreenStopSharingTooltip => '공유 중지';

  @override
  String get voiceScreenPopOutTooltip => '음성을 별도 창으로 팝아웃';

  @override
  String get voiceScreenCouldNotPopOut => '음성을 팝아웃할 수 없습니다.';

  @override
  String get voiceScreenLeaveVoiceTooltip => '음성 채널 나가기';

  @override
  String get voiceScreenPinTooltip => '고정 (열어 두기)';

  @override
  String get voiceScreenUnpinTooltip => '고정 해제';

  @override
  String get voiceScreenSizeSmall => '작게 (320x180)';

  @override
  String get voiceScreenSizeMedium => '보통 (480x270)';

  @override
  String get voiceScreenSizeLarge => '크게 (640x360)';

  @override
  String get voiceScreenSizeXl => '특대 (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, $count명 연결됨';
  }

  @override
  String get voiceBarSpeakingSuffix => ', 회원님이 말하는 중입니다';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count명 연결됨 · 탭하여 펼치기';
  }

  @override
  String get voiceBarStartCameraTooltip => '카메라 시작';

  @override
  String get voiceBarStopCameraTooltip => '카메라 중지';

  @override
  String get voiceBarLeaveVoiceTooltip => '음성 채널 나가기';

  @override
  String get popOutVideoFallbackTitle => '음성';

  @override
  String get popOutVideoMissingTokenError => '토큰 또는 URL이 없습니다';

  @override
  String get popOutVideoConnectionTimedOut => '15초 후 연결 시간이 초과되었습니다';

  @override
  String popOutVideoErrorLabel(String error) {
    return '오류: $error';
  }

  @override
  String get popOutVideoNoParticipants => '참가자 없음';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => '스테이지';

  @override
  String get stageCouldNotJoin => '스테이지에 참가할 수 없습니다.';

  @override
  String get stageThisStageFallback => '이 스테이지';

  @override
  String get stageRequiresTicketToJoin => '참가하려면 티켓이 필요합니다';

  @override
  String get stagePleaseWaitLabel => '잠시만 기다려 주세요...';

  @override
  String get stageGetFreeTicketButton => '무료 티켓 받기';

  @override
  String stageBuyTicketButton(String price) {
    return '티켓 구매 -- $price';
  }

  @override
  String get stageNotNowButton => '나중에';

  @override
  String get stageCouldNotStartTicketPurchase => '티켓 구매를 시작할 수 없습니다.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      '아직 결제 완료를 기다리는 중입니다 -- 확인되면 다시 참가해 보세요.';

  @override
  String get stageSpeakerBadge => '발언자';

  @override
  String get stageListenerBadge => '청취자';

  @override
  String stageCouldNotJoinWithError(String error) {
    return '참가할 수 없습니다: $error';
  }

  @override
  String get stageSpeakersHeader => '발언자';

  @override
  String get stageRaisedHandsHeader => '손 든 사람';

  @override
  String get stageAllowButton => '허용';

  @override
  String get stageIgnoreButton => '무시';

  @override
  String get stageListenersHeader => '청취자';

  @override
  String get stageRaiseHandTooltip => '손 들기';

  @override
  String get stageLowerHandTooltip => '손 내리기';

  @override
  String get stageLeaveStageTooltip => '스테이지 나가기';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (나)';
  }

  @override
  String get stageMoveToListenersButton => '청취자로 이동';

  @override
  String get stageYouFallbackName => '나';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return '$username님의 아바타';
  }

  @override
  String get channelEditDialogNewTitle => '새 채널';

  @override
  String get channelEditDialogEditTitle => '채널 편집';

  @override
  String get channelEditDialogNameHint => '채널 이름';

  @override
  String get channelEditDialogDescriptionHint => '주제 (선택 사항)';

  @override
  String get channelEditDialogTypeLabel => '유형';

  @override
  String get channelEditDialogTypeText => '텍스트';

  @override
  String get channelEditDialogTypeVoice => '음성';

  @override
  String get channelEditDialogTypeGallery => '갤러리';

  @override
  String get channelEditDialogTypeStage => '스테이지';

  @override
  String get channelEditDialogTypeRules => '규칙';

  @override
  String get channelEditDialogTypeRoleSelection => '역할 선택';

  @override
  String get channelEditDialogTypeCalendar => '캘린더';

  @override
  String get channelEditDialogAnnouncementTitle => '공지 채널';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      '메시지 관리 권한이 있는 멤버만 게시할 수 있습니다';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      '여기에 라이브 스트림 및 업로드 알림 게시';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      '\"라이브 알림\" 권한이 있는 멤버가 Twitch에서 방송을 시작하거나 YouTube에 새 동영상을 올리면 자동으로 게시됩니다';

  @override
  String get channelEditDialogNotifyRolesLabel => '게시 시 알릴 역할 (선택 사항)';

  @override
  String get channelEditDialogSlowmodeLabel => '슬로우 모드';

  @override
  String get channelEditDialogSlowmodeOff => '꺼짐';

  @override
  String get channelEditDialogUserLimitLabel => '사용자 제한';

  @override
  String get channelEditDialogUserLimitOff => '제한 없음';

  @override
  String get channelEditDialogCategoryLabel => '카테고리';

  @override
  String get channelEditDialogNoCategory => '카테고리 없음';

  @override
  String get channelEditDialogRoleAccessLabel => '역할 접근 권한 (비워두면 전체 허용)';

  @override
  String get channelEditDialogContentLabelsLabel => '콘텐츠 라벨';

  @override
  String get channelEditDialogContentLabelsDescription =>
      '이 채널에 멤버의 콘텐츠 필터 플래그를 지정합니다. 보호되는 계정에는 강제로 차단됩니다';

  @override
  String get categoryEditDialogNewTitle => '새 카테고리';

  @override
  String get categoryEditDialogEditTitle => '카테고리 편집';

  @override
  String get categoryEditDialogNameHint => '카테고리 이름';

  @override
  String get categoryEditDialogRoleAccessLabel => '역할 접근 권한 (비워두면 전체 허용)';

  @override
  String memberPanelHeaderLabel(int count) {
    return '멤버 — 온라인 $count명';
  }

  @override
  String get memberPanelRefreshTooltip => '멤버 목록 새로고침';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '멤버 $count명',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => '오프라인';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', $tier 등급';
  }

  @override
  String get memberPanelUnknownUser => '알 수 없음';

  @override
  String get memberPanelModerationActionsTooltip => '모더레이션 작업';

  @override
  String get reportDialogReasonSpam => '스팸';

  @override
  String get reportDialogReasonHarassment => '괴롭힘 또는 학대';

  @override
  String get reportDialogReasonIllegal => '불법 콘텐츠';

  @override
  String get reportDialogReasonOther => '기타';

  @override
  String get reportDialogReasonLabel => '사유';

  @override
  String get reportDialogNoteHint => '모더레이터가 알아야 할 다른 사항이 있나요? (선택 사항)';

  @override
  String get reportDialogDisclosureNote =>
      '회원님에게 표시된 메시지 내용과 발신자는 이 서버의 모더레이터와 공유됩니다.';

  @override
  String get reportDialogSubmitButton => '신고 제출';

  @override
  String get reportDialogSubmitError => '신고를 제출할 수 없습니다.';

  @override
  String get notificationBellTitle => '알림';

  @override
  String get notificationBellMarkAllRead => '모두 읽음으로 표시';

  @override
  String get notificationBellEmptyState => '아직 알림이 없습니다';

  @override
  String get notificationBellUnreadLabel => '읽지 않음';

  @override
  String get invitePreviewTitle => '서버 초대';

  @override
  String get invitePreviewInvalidOrExpired => '초대가 유효하지 않거나 만료되었습니다.';

  @override
  String get invitePreviewCouldNotJoin => '서버에 참가할 수 없습니다.';

  @override
  String get invitePreviewUnknownServer => '알 수 없는 서버';

  @override
  String get shippingAddressFullNameHint => '성명';

  @override
  String get shippingAddressLine1Hint => '주소 1행';

  @override
  String get shippingAddressLine2Hint => '주소 2행 (선택 사항)';

  @override
  String get shippingAddressCityHint => '시/군/구';

  @override
  String get shippingAddressStateHint => '주/도';

  @override
  String get shippingAddressZipHint => '우편번호';

  @override
  String get shippingAddressCountryCodeHint => '국가 코드 (예: US)';

  @override
  String get shippingAddressPhoneHint => '전화번호 (선택 사항)';

  @override
  String get shippingAddressPrivacyNote =>
      '이 주문의 배송 목적으로만 사용됩니다 -- 주문 완료 후 처리 방식은 Printful의 개인정보처리방침을 참고하세요.';

  @override
  String get updateNudgeAvailableTitle => '업데이트 가능';

  @override
  String get updateNudgeRequiredTitle => '업데이트 필요';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $version을(를) 사용할 수 있습니다 -- 현재 이전 버전을 사용 중입니다.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return '이 버전은 더 이상 지원되지 않습니다. Koda를 계속 사용하려면 $version으로 업데이트하세요.';
  }

  @override
  String get updateNudgeLaterButton => '나중에';

  @override
  String get tierBadgeSparkSubscriber => 'Spark 구독자';

  @override
  String get tierBadgePulseSubscriber => 'Pulse 구독자';

  @override
  String get tierBadgeAlphaSpark => 'Alpha Spark';

  @override
  String get tierBadgeFounder => 'Founder';

  @override
  String get foundersHallTitle => 'Founders Hall';

  @override
  String get foundersHallSubtitle => 'Koda를 가능하게 만든 가장 초기 후원자들.';

  @override
  String get foundersHallEmptyState => '아직 창립자가 없습니다.';

  @override
  String get settingsFoundersHallTitle => 'Founders Hall';

  @override
  String get settingsFoundersHallSubtitle => 'Koda를 만드는 데 도움을 준 사람을 확인하세요';

  @override
  String get vispAvatarInDevelopment => '개발 중';

  @override
  String get vispBoostAdvisorCouldNotAnswer => 'Visp가 답변을 준비하지 못했습니다.';

  @override
  String get vispBoostAdvisorTitle => 'Visp에게 묻기: 부스트 ROI 어드바이저';

  @override
  String get vispBoostAdvisorFollowUpHint => '추가 질문하기...';

  @override
  String get vispBoostAdvisorSendTooltip => '전송';

  @override
  String get vispBoostAdvisorBasedOn => '참고 자료:';

  @override
  String get vispEventDialogCouldNotGenerate => 'Visp가 이벤트를 생성하지 못했습니다.';

  @override
  String get vispEventDialogCouldNotCreate => '해당 이벤트를 만들 수 없습니다.';

  @override
  String get vispEventDialogRecurrenceNone => '일회성';

  @override
  String get vispEventDialogRecurrenceDaily => '매일 반복';

  @override
  String get vispEventDialogRecurrenceWeekly => '매주 반복';

  @override
  String get vispEventDialogRecurrenceMonthly => '매월 반복';

  @override
  String get vispEventDialogTitle => 'Visp에게 이벤트 생성 요청';

  @override
  String get vispEventDialogDescription =>
      '이벤트를 설명해 주세요 -- Visp가 제목, 날짜/시간, 그 외 세부 사항을 제안합니다.';

  @override
  String get vispEventDialogPromptHint =>
      '예: \"매주 금요일 저녁 7시부터 약 3시간 동안 진행하는 주간 D&D 세션\"';

  @override
  String get vispEventDialogPrivacyNote =>
      '회원님의 설명은 Visp(자체 호스팅 어시스턴트 -- 어떤 것도 Koda 서버 밖으로 나가지 않습니다)로 전송되어 이 계획을 생성하는 데 사용됩니다.';

  @override
  String get vispEventDialogStartOver => '처음부터 다시';

  @override
  String get vispEventDialogCreateEvent => '이벤트 만들기';

  @override
  String get vispEventDialogThinking => '생각 중...';

  @override
  String get vispEventDialogGeneratePlan => '계획 생성';

  @override
  String get vispEventDialogCouldNotParseDate =>
      '날짜를 인식할 수 없습니다 -- 다르게 표현해 보세요';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return '종료: $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '티켓당 $price';
  }

  @override
  String get vispEventDialogBasedOn => '참고 자료:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return '질문 $questionNumber/$maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => '또는 직접 답변 입력...';

  @override
  String get vispQuestionStepSendTooltip => '전송';

  @override
  String get vispQuestionStepSkip => '건너뛰고 지금 생성';

  @override
  String get vispSetupDialogCouldNotGeneratePlan => 'Visp가 계획을 생성하지 못했습니다.';

  @override
  String get vispSetupDialogCouldNotApplyPlan => '해당 계획을 적용할 수 없습니다.';

  @override
  String get vispSetupDialogTitleNew => 'Visp에게 서버를 설명해 주세요';

  @override
  String get vispSetupDialogTitleExisting => 'Visp에게 이 서버에 추가할 내용 요청';

  @override
  String get vispSetupDialogDescriptionNew =>
      '원하는 서버를 설명해 주세요 -- Visp가 이름과 역할, 카테고리, 채널 구성을 제안합니다.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      '추가하고 싶은 내용을 설명해 주세요 -- Visp가 만들 역할, 카테고리, 채널을 제안합니다.';

  @override
  String get vispSetupDialogPromptHintNew =>
      '예: \"두 개의 테이블을 위한 음성 채널이 있는, 아늑한 D&D 그룹용 서버\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      '예: \"레이드 팀을 위한 채널을 몇 개 더 추가\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      '회원님의 설명은 Visp(자체 호스팅 어시스턴트 -- 어떤 것도 Koda 서버 밖으로 나가지 않습니다)로 전송되어 이 계획을 생성하는 데 사용됩니다.';

  @override
  String get vispSetupDialogStartOver => '처음부터 다시';

  @override
  String get vispSetupDialogCreateServer => '서버 만들기';

  @override
  String get vispSetupDialogAddToServer => '서버에 추가';

  @override
  String get vispSetupDialogThinking => '생각 중...';

  @override
  String get vispSetupDialogGeneratePlan => '계획 생성';

  @override
  String get vispSetupDialogNewServerLabel => '새 서버';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '역할 $count개',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '카테고리 $count개',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '채널 $count개',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => '참고 자료:';

  @override
  String get childLockoutTitle => '지금은 이용 가능한 시간이 아닙니다';

  @override
  String get childLockoutBody =>
      '부모님 또는 보호자가 이 계정으로 Koda를 사용할 수 있는 시간을 설정했습니다. 이용 시간을 늘려달라고 요청하거나, 다음 이용 가능 시간에 다시 확인해 주세요.';

  @override
  String get childLockoutLogOutButton => '로그아웃';

  @override
  String get forcePasswordChangeError => '비밀번호를 업데이트할 수 없습니다. 다시 시도하세요.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return '환영합니다, $username님';
  }

  @override
  String get forcePasswordChangeSubtitle => '계속하려면 계정에 새 비밀번호를 설정해야 합니다.';

  @override
  String get forcePasswordChangeNewPasswordHint => '새 비밀번호';

  @override
  String get forcePasswordChangeConfirmPasswordHint => '새 비밀번호 확인';

  @override
  String get forcePasswordChangeReqLength => '12자 이상';

  @override
  String get forcePasswordChangeReqUpper => '대문자 1개 이상';

  @override
  String get forcePasswordChangeReqLower => '소문자 1개 이상';

  @override
  String get forcePasswordChangeReqDigit => '숫자 1개 이상';

  @override
  String get forcePasswordChangeReqMatch => '비밀번호가 일치합니다';

  @override
  String get forcePasswordChangeSubmitButton => '새 비밀번호 설정';

  @override
  String get forgotPasswordEnterEmailError => '이메일 주소를 입력하세요.';

  @override
  String get forgotPasswordCodeSentInfo => '해당 계정이 존재하는 경우, 재설정 코드가 전송되었습니다.';

  @override
  String get forgotPasswordEnterCodeError => '코드와 8자 이상의 비밀번호를 입력하세요.';

  @override
  String get forgotPasswordInvalidCode => '코드가 유효하지 않거나 만료되었습니다.';

  @override
  String get forgotPasswordTitle => '비밀번호 재설정';

  @override
  String get forgotPasswordEmailHint => '이메일 주소';

  @override
  String get forgotPasswordSendCodeButton => '재설정 코드 보내기';

  @override
  String get forgotPasswordCodeHint => '6자리 코드';

  @override
  String get forgotPasswordNewPasswordHint => '새 비밀번호';

  @override
  String get forgotPasswordSetNewPasswordButton => '새 비밀번호 설정';

  @override
  String get verifyEmailEnterCodeError => '이메일로 받은 6자리 코드를 입력하세요.';

  @override
  String get verifyEmailInvalidCode => '코드가 유효하지 않거나 만료되었습니다.';

  @override
  String verifyEmailResentInfo(String email) {
    return '$email(으)로 새 코드를 보냈습니다.';
  }

  @override
  String get verifyEmailResendFailed => '지금은 재전송할 수 없습니다.';

  @override
  String get verifyEmailTitle => '이메일을 확인하세요';

  @override
  String verifyEmailSentCode(String email) {
    return '$email(으)로 6자리 코드를 보냈습니다';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => '이메일 인증';

  @override
  String get verifyEmailResendButton => '코드 재전송';

  @override
  String get safetyNumberKeysNotSetUp => '회원님의 키가 아직 설정되지 않았습니다.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName님은 아직 키 번들이 없습니다.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return '안전 번호를 계산할 수 없습니다: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName님은 더 이상 해당 기기를 가지고 있지 않습니다.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return '$peerName님과의 안전 번호';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return '이 채팅이 아닌 다른 방법 -- 직접 만나거나 전화 통화 등 -- 으로 $peerName님과 이 번호를 비교하세요. 양쪽에서 일치한다면, 회원님이 생각하는 상대와 대화하고 있는 것입니다.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName님은 기기가 $count대 있으며, 각 기기마다 고유한 안전 번호가 있습니다 -- 하나를 확인해도 나머지는 확인되지 않습니다.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return '기기 $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => '확인됨으로 표시';

  @override
  String get contentFiltersDescription =>
      '서버는 채널에 콘텐츠 라벨을 지정할 수 있습니다. 라벨이 지정된 채널이 어떻게 표시될지 선택하세요 -- 이는 회원님만의 설정이며 다른 사람이 보는 내용에는 영향을 주지 않습니다.';

  @override
  String get contentFiltersLabelAdult => '성인 콘텐츠';

  @override
  String get contentFiltersLabelSuggestive => '선정적 콘텐츠';

  @override
  String get contentFiltersLabelGraphic => '자극적인 미디어';

  @override
  String get contentFiltersLabelNudity => '비성적 노출';

  @override
  String get contentFiltersDescAdult => '노골적인 성적 콘텐츠';

  @override
  String get contentFiltersDescSuggestive => '노골적이지 않지만 선정적인 콘텐츠';

  @override
  String get contentFiltersDescGraphic => '폭력적이거나 잔인한 내용';

  @override
  String get contentFiltersDescNudity => '비성적 맥락에서의 노출';

  @override
  String get contentFiltersHide => '숨기기';

  @override
  String get contentFiltersWarn => '경고 표시';

  @override
  String get contentFiltersShow => '표시';

  @override
  String get deviceTestCouldNotGetToken => '테스트 토큰을 가져올 수 없습니다.';

  @override
  String get deviceTestLabelTest => '테스트';

  @override
  String get deviceTestLabelRecording => '녹음 중...';

  @override
  String get deviceTestLabelPlayingBack => '재생 중...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return '카메라를 시작할 수 없습니다: $error';
  }

  @override
  String get deviceTestTitle => '기기 테스트';

  @override
  String deviceTestCouldNotConnect(String error) {
    return '연결할 수 없습니다: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => '마이크';

  @override
  String get deviceTestHearYourselfLabel => '내 목소리 듣기 (지연됨)';

  @override
  String get deviceTestSpeakerOutputLabel => '스피커 / 출력';

  @override
  String get deviceTestCameraLabel => '카메라';

  @override
  String get deviceTestSystemDefault => '시스템 기본값';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return '말한 후, $seconds초 분량의 클립이 재생됩니다';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '$seconds초';
  }

  @override
  String get deviceTestCameraPreviewOff => '카메라 미리보기 꺼짐';

  @override
  String get deviceTestStopCameraButton => '카메라 테스트 중지';

  @override
  String get deviceTestTestCameraButton => '카메라 테스트';

  @override
  String get deviceTestInputLevelLabel => '입력 수준';

  @override
  String get devicesScreenRemoveConfirmTitle => '이 기기를 제거할까요?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      '다시 로그인해야 하며, 제거되어 있던 동안 전송된 메시지는 이후에도 도착하지 않습니다 -- 더블 래칫 세션은 소급하여 공백을 채우지 않습니다.';

  @override
  String get devicesScreenRemoveFailed => '해당 기기를 제거할 수 없습니다.';

  @override
  String get devicesScreenNeverActive => '활성화된 적 없음';

  @override
  String devicesScreenActiveDate(String date) {
    return '마지막 활성: $date';
  }

  @override
  String get devicesScreenDescription =>
      '로그인한 각 기기는 고유한 암호화 아이덴티티를 가집니다 -- 회원님에게 온 메시지는 아래의 모든 기기에 도달합니다. 사용하지 않거나 알아볼 수 없는 기기는 제거하세요.';

  @override
  String get devicesScreenNoDevicesFound => '기기를 찾을 수 없습니다.';

  @override
  String get devicesScreenUnknownDevice => '알 수 없는 기기';

  @override
  String get devicesScreenThisDeviceBadge => '이 기기';

  @override
  String get devicesScreenRemoveDeviceTooltip => '기기 제거';

  @override
  String get totpSetupInvalidCode => '코드가 유효하지 않습니다. 다시 시도하세요.';

  @override
  String get totpSetupEnabledMessage => '2단계 인증이 활성화되었습니다.';

  @override
  String get totpSetupScanInstructions =>
      '이 비밀 값을 인증 앱(Google Authenticator, 1Password, Authy 등)에 스캔하세요:';

  @override
  String get totpSetupCodeHint => '확인을 위해 6자리 코드를 입력하세요';

  @override
  String get totpSetupVerifyButton => '확인 및 활성화';

  @override
  String get voiceVideoSettingsPushToTalkLabel => '푸시 투 토크';

  @override
  String get voiceVideoSettingsPressAnyKeyHint => '할당할 키를 누르세요...';

  @override
  String get voiceVideoSettingsTestDevicesButton => '기기 테스트';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => '음성 처리';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => '노이즈 억제';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle => '마이크의 배경 소음을 줄입니다';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      '고급 노이즈 억제 (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      '실시간 AI 노이즈 제거, 표준 억제보다 강력함 -- 켜면 표준 억제를 대체합니다';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => '에코 제거';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      '내 음성이 에코로 되돌아오는 것을 방지합니다';

  @override
  String get voiceVideoSettingsAutoGainTitle => '자동 게인 컨트롤';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      '마이크 음량을 자동으로 조절합니다 (음량 정규화)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => '오토 덕킹';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      '회원님이 말하는 동안 다른 참가자의 음량을 낮춥니다';

  @override
  String get voiceVideoSettingsHighPassTitle => '하이패스 필터';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      '저주파 잡음(선풍기, 에어컨, 책상 진동 등)을 차단합니다';

  @override
  String get voiceVideoSettingsTypingNoiseTitle => '타이핑 소음 감지';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      '마이크에 잡히는 키보드 타이핑 소리를 억제합니다';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => '음성 분리';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      '회원님의 목소리에 집중하고 주변의 다른 사람과 소리를 걸러냅니다';

  @override
  String get voiceVideoSettingsSectionMicBoost => '마이크 부스트';

  @override
  String get voiceVideoSettingsEnableBoostTitle => '부스트 활성화';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      '작거나 먼 마이크를 위한 프리앰프 게인 -- EQ 적용 전에 처리됩니다';

  @override
  String get voiceVideoSettingsBandBoost => '부스트';

  @override
  String get voiceVideoSettingsSectionMicEq => '마이크 EQ';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'EQ 활성화';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      '다른 사람에게 전달되기 전에 마이크 음질을 조정합니다';

  @override
  String get voiceVideoSettingsBandBass => '저음';

  @override
  String get voiceVideoSettingsBandMid => '중음';

  @override
  String get voiceVideoSettingsBandTreble => '고음';

  @override
  String get voiceVideoSettingsSectionVad => '음성 활동 감지 (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'VOX 활성화';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle => '실제로 말하고 있을 때만 전송합니다';

  @override
  String get voiceVideoSettingsSensitivityLabel => '민감도';

  @override
  String get voiceVideoSettingsVadHint =>
      '낮게 설정할수록 더 작은 소리도 감지합니다. 높게 설정할수록 더 큰 목소리만 전송을 트리거합니다.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => '할당된 키';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      '설정 안 됨 — 음소거 해제 상태에서는 항상 마이크가 켜져 있습니다';

  @override
  String get voiceVideoSettingsClearButton => '지우기';

  @override
  String get voiceVideoSettingsSetKeyButton => '키 설정';

  @override
  String get voiceVideoSettingsChangeButton => '변경';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      '키가 할당되면, 그 키를 누르고 있는 동안에만 마이크가 전송됩니다. 음성 채널에 있는 동안에는 이것이 VOX보다 우선합니다.';

  @override
  String get voiceVideoSettingsSectionVarm => 'VARM - 가상 아바타 반응형 모델';

  @override
  String get voiceVideoSettingsVarmDescription =>
      '말할 때 서로 전환되는 이미지 두 장을 업로드하세요. 회원님에게만 보입니다.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => '무음 시';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => '발화 시';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => '발화 임계값';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      '낮게 설정할수록 발화 이미지로 더 쉽게 전환됩니다.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'VARM 제거';

  @override
  String get gifPickerNoGifsFound => 'GIF를 찾을 수 없습니다';

  @override
  String get gifPickerSearchHint => 'GIF 검색...';

  @override
  String get messageSearchHint => '이 채널 검색...';

  @override
  String get messageSearchTooltip => '검색';

  @override
  String get messageSearchInitialHint =>
      '이 기기에 이미 로드된 메시지를 검색합니다 -- 더 과거로 스크롤하면 이전 기록을 가져와(로컬에서 복호화하여) 표시합니다.';

  @override
  String get messageSearchNoMatches => '일치하는 항목 없음';

  @override
  String get messageSearchStartOfHistory => '채널 기록의 시작';

  @override
  String get messageSearchFurtherBackButton => '더 과거 검색';

  @override
  String get messageSearchUnknownAuthor => '알 수 없음';
}
