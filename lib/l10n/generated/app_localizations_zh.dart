// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => '取消';

  @override
  String get commonSave => '保存';

  @override
  String get commonEdit => '编辑';

  @override
  String get commonDelete => '删除';

  @override
  String get commonCreate => '创建';

  @override
  String get commonClose => '关闭';

  @override
  String get commonDone => '完成';

  @override
  String get commonDownload => '下载';

  @override
  String get commonDisconnect => '断开连接';

  @override
  String get commonNone => '无';

  @override
  String get commonJoin => '加入';

  @override
  String get commonDismiss => '关闭';

  @override
  String get commonSubmit => '提交';

  @override
  String get commonConfirm => '确认';

  @override
  String get commonRemove => '移除';

  @override
  String get commonRetry => '重试';

  @override
  String get commonOk => '确定';

  @override
  String get commonYes => '是';

  @override
  String get commonNo => '否';

  @override
  String get commonSearch => '搜索';

  @override
  String get commonSettings => '设置';

  @override
  String get commonLoading => '加载中...';

  @override
  String get settingsLanguageSection => '语言';

  @override
  String get settingsLanguageTitle => '应用语言';

  @override
  String get settingsLanguageSystemDefault => '系统默认';

  @override
  String get settingsLanguageDescription =>
      '选择 Koda 界面本身显示的语言。这与任何服务器的主要语言，或你输入消息所用的语言无关。';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsSignOut => '退出登录';

  @override
  String get settingsSectionMyAccount => '我的账户';

  @override
  String get settingsSectionSecurity => '安全';

  @override
  String get settingsSectionAccessibility => '无障碍';

  @override
  String get settingsSectionBilling => '账单';

  @override
  String get settingsSectionFamily => '家庭';

  @override
  String get settingsSectionVoiceVideo => '语音与视频';

  @override
  String get settingsSectionDesktop => '桌面';

  @override
  String get settingsSectionAbout => '关于';

  @override
  String get settingsTwoFactorTitle => '双重验证';

  @override
  String get settingsTwoFactorSubtitle => '添加身份验证器应用以增强安全性';

  @override
  String get settingsLinkedDevicesTitle => '已关联设备';

  @override
  String get settingsLinkedDevicesSubtitle => '查看并移除已登录此账户的设备';

  @override
  String get settingsContentFiltersTitle => '内容过滤';

  @override
  String get settingsContentFiltersSubtitle => '选择被标记的内容如何显示';

  @override
  String get settingsDmFriendsOnlyTitle => '仅允许好友发送私信';

  @override
  String get settingsDmFriendsOnlySubtitle => '非好友无法向你发起新对话';

  @override
  String get settingsDmPrivacyError => '无法更新私信隐私设置。';

  @override
  String get settingsShowVispAvatarTitle => '显示 Visp 的头像';

  @override
  String get settingsShowVispAvatarSubtitle => '在设置/事件/顾问对话框中显示 Visp 的表情和心情';

  @override
  String get settingsHighContrastTitle => '高对比度';

  @override
  String get settingsHighContrastSubtitle =>
      '整个应用使用纯黑白高对比度配色 -- 切换时会短暂重新加载当前界面。';

  @override
  String get settingsDyslexiaFontTitle => '易读障碍友好字体';

  @override
  String get settingsDyslexiaFontSubtitle => '将应用内正文文本切换为 OpenDyslexic 字体';

  @override
  String get settingsFontSizeTitle => '字体大小';

  @override
  String get settingsFontSizeSample => '视风漫卷云舒，落霞与孤鹜齐飞';

  @override
  String get settingsDensityTitle => '密度';

  @override
  String get settingsDensityDescription => '影响按钮、开关、对话框等标准控件的间距 -- 不影响所有自定义布局。';

  @override
  String get settingsDensityCompact => '紧凑';

  @override
  String get settingsDensityStandard => '标准';

  @override
  String get settingsDensityComfortable => '舒适';

  @override
  String get settingsStreamingTitle => '直播账号';

  @override
  String get settingsStreamingDescription =>
      '连接 Twitch/YouTube 后，拥有“开播通知”权限的服务器可在你开播或发布新视频时自动发布消息。';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform 已连接为 $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform 未连接';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- 正在直播';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- 新上传视频';

  @override
  String get settingsStreamingConnecting => '连接中...';

  @override
  String get settingsStreamingConnect => '连接';

  @override
  String get settingsAnnounceLiveTwitch => '开播时通知';

  @override
  String get settingsAnnounceLiveYoutube => '通知直播开始和新视频上传';

  @override
  String get settingsRefreshStatus => '已在浏览器中连接？刷新状态';

  @override
  String settingsStreamingConnectError(String platform) {
    return '无法开始连接 $platform。';
  }

  @override
  String get settingsStreamingFinishInBrowser => '请在浏览器中完成连接，然后返回并刷新。';

  @override
  String get settingsThroneTitle => 'Throne Webhook';

  @override
  String get settingsThroneDescription =>
      '将此网址粘贴到你的 Throne.com Webhook 设置中，这样有人送出礼物时你就能在 Koda 收到通知。';

  @override
  String get settingsThroneGetUrl => '获取我的 Webhook 网址';

  @override
  String get settingsThroneCopyTooltip => '复制';

  @override
  String get settingsThroneCopiedToast => '已复制到剪贴板';

  @override
  String get settingsThroneRegenerateTooltip => '重新生成（旧网址将失效）';

  @override
  String get settingsThroneRegenerateConfirmTitle => '重新生成 Webhook 网址？';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      '旧网址将停止工作，请之后在 Throne.com 中更新它。';

  @override
  String get settingsThroneRegenerate => '重新生成';

  @override
  String get settingsUploadPhoto => '上传照片';

  @override
  String get settingsOrPasteUrl => '或在下方粘贴网址';

  @override
  String get settingsAvatarUrlHint => 'https://example.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote => '上传图片需要 Cloudflare R2 — 粘贴网址始终可用。';

  @override
  String get settingsDisplayNameLabel => '显示名称';

  @override
  String get settingsDisplayNameHint => '显示名称';

  @override
  String get settingsBioLabel => '简介';

  @override
  String get settingsBioHint => '简单介绍一下自己';

  @override
  String get settingsPronounsLabel => '代词';

  @override
  String get settingsPronounsHint => '例如：他/她';

  @override
  String get settingsShowPronounsTitle => '向他人显示我的代词';

  @override
  String get settingsShowPronounsSubtitle => '会显示在聊天、成员列表和语音中你的名字旁边';

  @override
  String get settingsStatusLabel => '状态';

  @override
  String get statusOnline => '在线';

  @override
  String get statusAway => '离开';

  @override
  String get statusDnd => '请勿打扰';

  @override
  String get statusInvisible => '隐身';

  @override
  String get settingsFamilyNotAvailable => '受监护账户无法使用家长控制功能。';

  @override
  String get settingsAboutTitle => '关于 Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => '条款与条件';

  @override
  String get settingsPrivacyTitle => '隐私政策';

  @override
  String get settingsSupportTitle => '支持';

  @override
  String get settingsReportSecurityTitle => '报告安全问题';

  @override
  String get settingsDesktopNotAvailable => '这些是仅限桌面端的设置 -- 该平台没有窗口或系统托盘。';

  @override
  String get settingsCloseToTrayTitle => '关闭时最小化到系统托盘';

  @override
  String get settingsCloseToTraySubtitle =>
      '关闭窗口后 Koda 仍会在后台运行，你仍会收到通知 -- 关闭此选项后，关闭窗口将真正退出应用。';

  @override
  String get authErrorEmailPasswordRequired => '请填写邮箱和密码。';

  @override
  String get authErrorIncorrectCredentials => '邮箱或密码不正确。';

  @override
  String get authErrorMustAcceptTerms => '请接受条款与条件。';

  @override
  String get authErrorAllFieldsRequired => '所有字段均为必填项。';

  @override
  String get authErrorPasswordsDontMatch => '两次输入的密码不一致。';

  @override
  String get authErrorPasswordTooShort => '密码至少需要 8 个字符。';

  @override
  String get authErrorRegistrationFailed => '注册失败。该邮箱可能已被使用。';

  @override
  String get authTabSignIn => '登录';

  @override
  String get authTabCreateAccount => '创建账户';

  @override
  String get authAgreementPrefix => '使用 Koda 即表示你同意我们的';

  @override
  String get authTermsLink => '条款与条件';

  @override
  String get authAgreementMiddle => '和';

  @override
  String get authPrivacyLink => '隐私政策';

  @override
  String get authAgreementSuffix => '。';

  @override
  String get authEmailHint => '邮箱地址';

  @override
  String get authPasswordHint => '密码';

  @override
  String get authForgotPassword => '忘记密码？';

  @override
  String get authSignInButton => '登录';

  @override
  String get authUsernameHint => '用户名';

  @override
  String get authConfirmPasswordHint => '确认密码';

  @override
  String get authAgreeToTerms => '我同意条款与条件及隐私政策';

  @override
  String get authCreateAccountButton => '创建账户';

  @override
  String get dmSafetyNumberChangedWarning => '此对话的安全码已更改 -- 发送前请先验证。';

  @override
  String get dmMessageNotSent => '消息未发送。';

  @override
  String dmEncryptMessageError(String error) {
    return '无法加密消息：$error';
  }

  @override
  String get dmAttachmentUploadFailed => '附件上传失败。';

  @override
  String dmEncryptAttachmentError(String error) {
    return '无法加密附件：$error';
  }

  @override
  String get dmReportMessage => '举报消息';

  @override
  String get dmReportSubmitted => '举报已提交。';

  @override
  String get dmTitle => '消息';

  @override
  String get dmNewMessage => '新建消息';

  @override
  String get dmNoConversationsYet => '暂无对话';

  @override
  String get dmSelectConversation => '选择一个对话';

  @override
  String get dmVerifySafetyNumberTooltip => '验证安全码';

  @override
  String get dmSeenLabel => '已读';

  @override
  String get dmMessageActionsTooltip => '消息操作';

  @override
  String get dmRemoveAttachmentTooltip => '移除附件';

  @override
  String get dmAttachFileTooltip => '添加附件';

  @override
  String get dmMessageHint => '发送消息...';

  @override
  String get dmSendMessageTooltip => '发送消息';

  @override
  String get dmNoFriendsYet => '暂时还没有好友。\n发送好友请求开始吧。';

  @override
  String get dmUnfriendTooltip => '删除好友';

  @override
  String get dmNoPendingRequests => '没有待处理的好友请求。';

  @override
  String get dmIncomingRequestsLabel => '收到的请求';

  @override
  String get dmSentRequestsLabel => '已发送的请求';

  @override
  String get dmAcceptTooltip => '接受';

  @override
  String get dmDeclineTooltip => '拒绝';

  @override
  String get dmPendingLabel => '待处理';

  @override
  String get dmNewMessageDialogTitle => '新建消息';

  @override
  String get dmEnterUsernameHint => '输入用户名';

  @override
  String get dmOpenButton => '打开';

  @override
  String dmSavedAttachment(String fileName) {
    return '已保存 $fileName';
  }

  @override
  String get dmUnknownUser => '未知';

  @override
  String get dmEndToEndEncryptedTooltip => '端到端加密';

  @override
  String get homeContentWarningTitle => '内容警告';

  @override
  String homeContentWarningBody(String labels) {
    return '此频道被标记为：$labels。\n\n可在“设置 > 安全 > 内容过滤”中更改此设置。';
  }

  @override
  String get homeViewAnyway => '仍然查看';

  @override
  String get homeCouldNotConnectVoice => '无法连接语音。';

  @override
  String get homeCreateServer => '创建服务器';

  @override
  String get homeJoinServer => '加入服务器';

  @override
  String get homeRedeemCode => '兑换代码';

  @override
  String get homeJoinServerDialogTitle => '加入服务器';

  @override
  String get homeEnterInviteCode => '请输入邀请代码或链接：';

  @override
  String get homeInviteCodeHint => '例如：XK9MP2';

  @override
  String get homeJoined => '已加入！';

  @override
  String get homeInvalidInvite => '邀请代码无效或已过期。';

  @override
  String get homeJoinButton => '加入';

  @override
  String get homeRedeemCodeDialogTitle => '兑换代码';

  @override
  String get homeEnterBackerCode => '请输入你的赞助者代码或奖励代码：';

  @override
  String get homeRewardCodeHint => '奖励代码';

  @override
  String get homeCodeRedeemed => '代码已兑换！你的奖励已生效。';

  @override
  String get homeInvalidRedeemCode => '代码无效、已过期或已被兑换。';

  @override
  String get homeRedeemButton => '兑换';

  @override
  String get homeAreFriends => '你们是好友';

  @override
  String get homeAddFriend => '添加好友';

  @override
  String homeFriendRequestSent(String username) {
    return '已向 $username 发送好友请求！';
  }

  @override
  String get homeMessageButton => '发消息';

  @override
  String get homeSendTip => '发送打赏';

  @override
  String get homeSwitchToServer => '切换到该服务器';

  @override
  String get homeInvitePeople => '邀请好友';

  @override
  String get homeServerSettingsMenuItem => '服务器设置';

  @override
  String get homeLeaveServerMenuItem => '退出服务器';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return '要退出 $serverName 吗？之后可通过邀请重新加入。';
  }

  @override
  String get homeLeaveButton => '退出';

  @override
  String get homeCreateAServer => '创建一个服务器';

  @override
  String get homeServerNameHint => '服务器名称';

  @override
  String get homeDescribeToVisp => '改为向 Visp 描述';

  @override
  String get homeMarkAsRead => '标记为已读';

  @override
  String get homeEditChannel => '编辑频道';

  @override
  String get homeDeleteChannel => '删除频道';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return '要删除 #$channelName 吗？此操作无法撤销。';
  }

  @override
  String get homeDeleteButton => '删除';

  @override
  String get homeCreateChannelHere => '在此创建频道';

  @override
  String get homeEditCategory => '编辑分类';

  @override
  String get homeDeleteCategory => '删除分类';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return '要删除“$categoryName”吗？其中的频道将变为未分类。';
  }

  @override
  String get homeReplyAction => '回复';

  @override
  String get homeCreateThreadAction => '创建帖子';

  @override
  String get homeEditMessageAction => '编辑消息';

  @override
  String get homeDeleteMessageAction => '删除消息';

  @override
  String get homePinMessageAction => '置顶消息';

  @override
  String get homeUnpinMessageAction => '取消置顶';

  @override
  String get homeReportMessageAction => '举报消息';

  @override
  String get homeReportSubmitted => '举报已提交。';

  @override
  String get homeAddReactionTitle => '添加表情回应';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个帖子',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => '分类选项';

  @override
  String get homeChannelOptionsTooltip => '频道选项';

  @override
  String get homeOpenVoiceChatTooltip => '打开聊天';

  @override
  String get homeMarketplaceLabel => '市场';

  @override
  String get homeSelectChannelPrompt => '请选择一个频道';

  @override
  String get homeSearchTooltip => '搜索';

  @override
  String get homePinnedMessagesTooltip => '置顶消息';

  @override
  String get homeWaitingForKey => '正在等待加密密钥送达...';

  @override
  String get homeUnableToDecrypt => '无法解密此消息。';

  @override
  String get homeMessageActionsTooltip => '消息操作';

  @override
  String get homeCancelReplyTooltip => '取消回复';

  @override
  String get homeRemoveAttachmentTooltip => '移除附件';

  @override
  String get homeAttachFileTooltip => '添加附件';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return '发消息到 #$channelName';
  }

  @override
  String get homeSendMessageTooltip => '发送消息';

  @override
  String get homeEditMessageTitle => '编辑消息';

  @override
  String get homeMessageLabel => '消息';

  @override
  String get homePinnedMessagesTitle => '置顶消息';

  @override
  String get homeNoPinnedMessages => '没有置顶消息';

  @override
  String get homeUnpinTooltip => '取消置顶';

  @override
  String get homeCreateThreadTitle => '创建帖子';

  @override
  String get homeThreadNameHint => '帖子名称';

  @override
  String homeThreadCreated(String name) {
    return '帖子“$name”已创建！';
  }

  @override
  String get homeCreateOrJoinTooltip => '创建或加入';

  @override
  String get homeKodaMarketplaceTooltip => 'Koda 市场';

  @override
  String get homeAdminPanelTooltip => '管理面板';

  @override
  String get homeServerSettingsTooltip => '服务器设置';

  @override
  String get homeSettingsTooltip => '设置';

  @override
  String get homeContentWarningBadge => '内容警告';

  @override
  String get homeDirectMessagesTooltip => '私信';

  @override
  String homeReplyingTo(String username) {
    return '正在回复 $username';
  }

  @override
  String get homeAttachmentFallback => '附件';

  @override
  String serverConnectError(String service) {
    return '无法开始连接 $service。';
  }

  @override
  String get serverDisconnectPrintfulTitle => '断开 Printful 连接？';

  @override
  String get serverDisconnectPrintfulBody => '重新连接之前，此服务器将无法处理周边订单。';

  @override
  String get serverDisconnectTiltifyTitle => '断开 Tiltify 连接？';

  @override
  String get serverDisconnectTiltifyBody => '重新连接之前，此服务器将停止显示其慈善活动的进度。';

  @override
  String get serverNewRoleTitle => '新建身份组';

  @override
  String get serverEditRoleTitle => '编辑身份组';

  @override
  String serverColorSwatchLabel(String hex) {
    return '颜色 $hex';
  }

  @override
  String get permViewChannels => '查看频道';

  @override
  String get permSendMessages => '发送消息';

  @override
  String get permConnectVoice => '连接语音';

  @override
  String get permManageServer => '管理服务器';

  @override
  String get permManageChannels => '管理频道';

  @override
  String get permManageRoles => '管理身份组';

  @override
  String get permManageMessages => '管理消息';

  @override
  String get permKickMembers => '踢出成员';

  @override
  String get permBanMembers => '封禁成员';

  @override
  String get permMuteMembers => '禁言成员';

  @override
  String get permMentionEveryone => '提及 @everyone';

  @override
  String get permManageMarketplace => '管理市场';

  @override
  String get permAnnounceLive => '开播通知';

  @override
  String get permMoveMembers => '移动成员(语音)';

  @override
  String get serverRoleNameHint => '身份组名称';

  @override
  String get serverColorLabel => '颜色';

  @override
  String get serverPermissionsLabel => '权限';

  @override
  String get serverSelfAssignableTitle => '可自助领取';

  @override
  String get serverSelfAssignableSubtitle => '成员可以自行领取此身份组';

  @override
  String get serverDefaultRoleUndeletable => '默认身份组无法删除。';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return '要删除身份组“$roleName”吗？';
  }

  @override
  String get serverCouldNotDeleteRole => '无法删除该身份组。';

  @override
  String get serverMemberFallback => '成员';

  @override
  String get serverNoRolesYet => '暂无身份组。';

  @override
  String get serverRefreshStatus => '已在浏览器中连接？刷新状态';

  @override
  String get serverPrintfulConnected => 'Printful 已连接';

  @override
  String get serverPrintfulNotConnected => 'Printful 未连接';

  @override
  String get serverPrintfulDescription =>
      '连接此服务器的 Printful 账户，以处理通过 Koda 提交的周边订单。每个服务器需连接各自的店铺。';

  @override
  String get serverConnecting => '连接中...';

  @override
  String get serverConnectPrintful => '连接 Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify 已连接';

  @override
  String get serverTiltifyNotConnected => 'Tiltify 未连接';

  @override
  String get serverTiltifyDescription =>
      '连接此服务器的 Tiltify 账户，向所有成员展示慈善活动的实时进度。仅限只读 -- Koda 不会在 Tiltify 一侧发布或更改任何内容。';

  @override
  String get serverConnectTiltify => '连接 Tiltify';

  @override
  String get serverNoTiltifyCampaigns => '在此 Tiltify 账户中未找到任何活动。';

  @override
  String get serverPickCampaign => '选择要展示的活动';

  @override
  String get serverUntitledCampaign => '未命名活动';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '已筹集 $currency $raised，目标为 $goal';
  }

  @override
  String get serverViewCampaign => '查看活动';

  @override
  String get serverRefreshButton => '刷新';

  @override
  String get serverUploadButton => '上传';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '已使用 $used / $limit 个位置 -- 助力等级 $level';
  }

  @override
  String get serverNoCustomEmoji => '暂无自定义表情。';

  @override
  String get serverDeleteEmojiTooltip => '删除表情';

  @override
  String get serverUploadEmojiTitle => '上传表情';

  @override
  String get serverEmojiNameHint => '名称（字母、数字、_）';

  @override
  String get serverChooseImage => '选择图片';

  @override
  String serverCurrentBoostLevel(int level) {
    return '当前助力等级：$level';
  }

  @override
  String get serverBackgroundTitle => '服务器背景';

  @override
  String get serverBackgroundDescription => '显示在频道视图后方、所有成员可见的自定义背景。';

  @override
  String get serverBackgroundLockedHint => '达到助力等级 4 即可解锁自定义背景。';

  @override
  String get serverIconBorderTitle => '服务器图标边框';

  @override
  String get serverIconBorderDescription => '在每位成员的服务器列表中，此服务器图标周围显示的强调边框。';

  @override
  String get serverIconBorderLockedHint => '达到助力等级 5 即可解锁自定义图标边框。';

  @override
  String get serverBoostFromBank => '在市场的服务器银行中助力此服务器，以提升其等级。';

  @override
  String get serverMarketplaceListingLabel => '市场展示';

  @override
  String get serverListInMarketplace => '在 Koda 市场中展示';

  @override
  String get serverListInMarketplaceDescription =>
      '将此服务器纳入全平台的“发现”标签页，并有机会入选每周精选轮播。这与常规的服务器可发现性设置是分开的。';

  @override
  String get serverSocialLinkLabel => '社交/邀请链接（可选）';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => '保存链接';

  @override
  String get serverPricingLabel => '定价';

  @override
  String get serverPrimaryCurrencyLabel => '主要货币';

  @override
  String get serverPrimaryCurrencyDescription => '适用于你为此服务器设置的服务器订阅档位和数字商品价格。';

  @override
  String get serverPrimaryLanguageLabel => '主要语言';

  @override
  String get serverPrimaryLanguageDescription => '成员发布的与此设置不同语言的消息，将显示一个小语言徽章。';

  @override
  String get serverMarketplaceLinkSaved => '市场链接已保存。';

  @override
  String get serverIconUpdated => '服务器图标已更新！';

  @override
  String get serverTemplateImported => '模板已导入！';

  @override
  String get serverImportFromDiscord => '从 Discord 导入';

  @override
  String get serverVispPlanLive => 'Visp 的方案已就绪！';

  @override
  String get serverAskVisp => '询问 Visp';

  @override
  String get serverAddCategoryButton => '添加分类';

  @override
  String get serverAddChannelHereTooltip => '在此添加频道';

  @override
  String get serverRename => '重命名';

  @override
  String get serverUncategorized => '未分类';

  @override
  String get serverAddChannel => '添加频道';

  @override
  String get serverEditRulesContent => '编辑规则内容';

  @override
  String get serverRulesContentHint => '在此输入你的服务器规则...';

  @override
  String get serverRulesUpdated => '规则已更新！';

  @override
  String get serverAddRole => '添加身份组';

  @override
  String get serverDefaultRoleLabel => '默认身份组';

  @override
  String get serverManageRolesTooltip => '管理身份组';

  @override
  String get serverMutedLabel => '已禁言';

  @override
  String get serverExpandedLabel => '已展开';

  @override
  String get serverCollapsedLabel => '已折叠';

  @override
  String get serverUnmute => '取消禁言';

  @override
  String get serverMute => '禁言';

  @override
  String get serverKick => '踢出';

  @override
  String get serverBan => '封禁';

  @override
  String serverBannedUsersLabel(int count) {
    return '已封禁用户 — $count';
  }

  @override
  String get serverNoBannedUsers => '没有已封禁的用户。';

  @override
  String get serverUnban => '解除封禁';

  @override
  String get serverMemberFallbackGeneric => '该成员';

  @override
  String serverBanConfirm(String username, String serverName) {
    return '要将 $username 从 $serverName 封禁吗？在被解除封禁之前，他们将无法重新加入。';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return '要将 $username 从 $serverName 踢出吗？他们可以通过邀请重新加入。';
  }

  @override
  String get serverMuteDuration60Sec => '60 秒';

  @override
  String get serverMuteDuration5Min => '5 分钟';

  @override
  String get serverMuteDuration10Min => '10 分钟';

  @override
  String get serverMuteDuration1Hour => '1 小时';

  @override
  String get serverMuteDuration1Day => '1 天';

  @override
  String get serverMuteDuration1Week => '1 周';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return '无法对 $username 执行$action操作。';
  }

  @override
  String serverMuteUserTitle(String username) {
    return '禁言 $username';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return '无法禁言 $username。';
  }

  @override
  String get serverUnlockInvites => '解锁邀请';

  @override
  String get serverInvitesUnlocked => '邀请已解锁。';

  @override
  String get serverAuditLogDescription =>
      '一级管理活动 -- 踢出、封禁、禁言，以及自动刷屏/突袭防护。仅包含元数据，绝不包含消息内容。';

  @override
  String get serverSystemActor => '系统';

  @override
  String get serverActionKicked => '踢出了';

  @override
  String get serverActionBanned => '封禁了';

  @override
  String get serverActionUnbanned => '解除封禁了';

  @override
  String get serverActionMuted => '禁言了';

  @override
  String get serverActionUnmuted => '取消禁言了';

  @override
  String get serverActionFloodDetected => '因刷屏被自动禁言';

  @override
  String get serverActionRaidLockdownEnabled => '锁定了邀请（突袭防护）';

  @override
  String get serverActionRaidLockdownDisabled => '解锁了邀请';

  @override
  String get serverActionMoved => '移动了';

  @override
  String get serverUnknownAction => '未知操作';

  @override
  String get serverNoModerationActivity => '暂无管理活动。';

  @override
  String get serverReportsDescription => '此服务器成员举报的消息 -- 为举报者本人已解密的副本，因举报而披露。';

  @override
  String get serverNoPendingReports => '没有待处理的举报。';

  @override
  String get serverReportReasonOther => '其他';

  @override
  String get serverReportStatusActioned => '已处理';

  @override
  String get serverReportStatusDismissed => '已驳回';

  @override
  String get serverResolvedLabel => '已解决';

  @override
  String serverReportedBy(String reporter, String target) {
    return '由 $reporter 举报 -- 发送者为 $target';
  }

  @override
  String serverReportNote(String note) {
    return '备注：$note';
  }

  @override
  String get serverDismissButton => '驳回';

  @override
  String get serverMarkActioned => '标记为已处理';

  @override
  String get serverCreateInvite => '创建邀请';

  @override
  String get serverInviteCreatedTitle => '邀请已创建';

  @override
  String get serverNoActiveInvites => '没有有效邀请';

  @override
  String serverUsesLabel(String uses) {
    return '使用次数：$uses';
  }

  @override
  String get serverDeleteInviteTooltip => '删除邀请';

  @override
  String get serverChangeIconLabel => '更改服务器图标';

  @override
  String get serverFallbackName => '服务器';

  @override
  String serverSettingsTitle(String serverName) {
    return '$serverName 设置';
  }

  @override
  String get serverTabChannels => '频道';

  @override
  String get serverTabRoles => '身份组';

  @override
  String get serverTabMembers => '成员';

  @override
  String get serverTabInvites => '邀请';

  @override
  String get serverTabMerch => '周边';

  @override
  String get serverTabEmoji => '表情';

  @override
  String get serverTabCustomize => '自定义';

  @override
  String get serverTabAuditLog => '审计日志';

  @override
  String get serverTabReports => '举报';

  @override
  String get serverTabThresholdMod => '阈值管理';

  @override
  String get serverTabCharity => '慈善';

  @override
  String get homeCustomEmojiFallback => '自定义表情';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个表情回应',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted => '，你已回应，激活以移除';

  @override
  String get homeReactionActivateToAdd => '，激活以添加';

  @override
  String get homeAddReactionLabel => '添加表情回应';

  @override
  String homeViewProfile(String username) {
    return '查看 $username 的资料';
  }

  @override
  String get homeMoveToVoiceChannel => '移动到语音频道…';

  @override
  String get homeMoveVoiceChannelDialogTitle => '选择一个语音频道';

  @override
  String get homeNoOtherVoiceChannels => '没有其他语音频道';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '已将 $username 移动到 $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return '无法移动 $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return '你已被移动到 $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return '加入 $channel 以通话';
  }

  @override
  String get adminPanelTitle => '管理面板';

  @override
  String get adminTabBackerCodes => '支持者代码';

  @override
  String get adminTabUsers => '用户';

  @override
  String get adminTabDmReports => '私信举报';

  @override
  String get adminTabSpamFlags => '垃圾信息标记';

  @override
  String get adminTabWiki => '百科';

  @override
  String get adminTabBoosts => '助力';

  @override
  String get adminCreateBackerCodeTitle => '创建支持者代码';

  @override
  String get adminCodeHint => '代码（留空以自动生成）';

  @override
  String get adminNoteHint => '备注（例如“Kickstarter Tier 2”）';

  @override
  String get adminFlagsJsonHint =>
      '以 JSON 格式填写标记，例如 \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint => '最大使用次数（留空表示无限制）';

  @override
  String get adminCodeCreatedTitle => '代码已创建';

  @override
  String get adminCodeLabel => '代码：';

  @override
  String get adminCopyCodeTooltip => '复制代码';

  @override
  String adminFlagsValue(String flags) {
    return '标记：$flags';
  }

  @override
  String get adminBackerCodesHeader => '支持者与奖励代码';

  @override
  String get adminNewCodeButton => '新建代码';

  @override
  String get adminNoCodesYet => '暂无代码';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '已使用 $uses 次';
  }

  @override
  String get adminSearchUsersHint => '按用户名搜索用户...';

  @override
  String get adminSearchUsersPrompt => '请在上方搜索用户';

  @override
  String get adminNoDmReports => '暂无私信举报。';

  @override
  String get adminResolvedLabel => '已解决';

  @override
  String get adminReasonOther => '其他';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return '举报人：$reporterId\n已披露的发送者：$targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return '备注：$note';
  }

  @override
  String get adminDismissButton => '驳回';

  @override
  String get adminMarkActionedButton => '标记为已处理';

  @override
  String get adminStatusActioned => '已处理';

  @override
  String get adminStatusDismissed => '已驳回';

  @override
  String get adminNoSpamFlags => '暂无垃圾信息标记。';

  @override
  String get adminFlagMassDmSpam => '批量私信骚扰';

  @override
  String get adminFlagRaidLockdown => '突袭锁定';

  @override
  String get adminFlagBotBehavior => '疑似机器人行为';

  @override
  String get adminFlagChannelFlooding => '刷屏';

  @override
  String get adminAutoEscalatedBadge => '自动升级';

  @override
  String adminConfidenceLabel(String score, String label) {
    return '置信度：$score%（$label）';
  }

  @override
  String adminFlagUserLine(String userId) {
    return '用户：$userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return '服务器：$serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$totalJoiners 名加入者中有 $mutedCount 名仍被静音';
  }

  @override
  String get adminNoJoinersMuted => '当前没有加入者被静音';

  @override
  String adminRestrictedUntil(String until) {
    return '当前限制至 $until';
  }

  @override
  String get adminNotCurrentlyRestricted => '当前未受限制';

  @override
  String get adminDismissUndoButton => '驳回并撤销';

  @override
  String get adminConfirmRestrictButton => '确认并限制';

  @override
  String get adminDeleteArticleTitle => '删除文章？';

  @override
  String adminDeleteArticleBody(String title) {
    return '“$title”将从 Visp 的知识库中移除。';
  }

  @override
  String get adminNewArticleTitle => '新建文章';

  @override
  String get adminEditArticleTitle => '编辑文章';

  @override
  String get adminArticleTitleHint => '标题';

  @override
  String get adminArticleContentHint => '文章内容（Markdown）';

  @override
  String get adminWikiArticlesHeader => '百科文章';

  @override
  String get adminNoArticlesYet => '暂无文章';

  @override
  String get adminEditArticleTooltip => '编辑文章';

  @override
  String get adminDeleteArticleTooltip => '删除文章';

  @override
  String get adminSearchServersHint => '按名称搜索服务器...';

  @override
  String get adminSearchServersPrompt => '请在上方搜索服务器';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return '向 $serverName 授予助力';
  }

  @override
  String get adminNumBoostsHint => '助力数量';

  @override
  String get adminGrantButton => '授予';

  @override
  String get adminPositiveNumberError => '请输入一个正整数。';

  @override
  String get adminGrantBoostsFailed => '授予助力失败。';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已向 $serverName 授予 $count 个助力 -- 现在等级为 $level（$activeCount 个生效中）。',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count 名成员';
  }

  @override
  String get adminGrantBoostsButtonLabel => '授予助力';

  @override
  String get parentalDashboardTitle => '家庭';

  @override
  String get parentalDashboardCreateChildTitle => '创建儿童账号';

  @override
  String get parentalDashboardUsernameHint => '用户名';

  @override
  String get parentalDashboardEmailHint => '邮箱';

  @override
  String get parentalDashboardPasswordHint => '密码';

  @override
  String get parentalDashboardCreateChildExplanation =>
      '这将创建一个完全受监护的账号：带标签的频道会被屏蔽，你可以设置允许使用的时间段，并查看（但无法阅读内容）他们的好友和服务器。';

  @override
  String get parentalDashboardValidationError => '需要填写用户名、邮箱，以及至少 8 位的密码。';

  @override
  String get parentalDashboardCreateChildFailed => '无法创建儿童账号 -- 用户名/邮箱可能已被占用。';

  @override
  String get parentalDashboardCreatingLabel => '创建中...';

  @override
  String get parentalDashboardNoChildren => '尚未关联任何账号。';

  @override
  String get parentalDashboardSupervisedLabel => '受监护账号';

  @override
  String get parentalDashboardUnknownUser => '未知';

  @override
  String get childDetailFallbackTitle => '儿童账号';

  @override
  String get childDetailTabFriends => '好友';

  @override
  String get childDetailTabServers => '服务器';

  @override
  String get childDetailTabSchedule => '时间表';

  @override
  String get childDetailTabOverride => '临时许可';

  @override
  String get childDetailNoFriends => '暂无好友。';

  @override
  String get childDetailUnknownUser => '未知';

  @override
  String get childDetailRemoveFriendTooltip => '移除好友';

  @override
  String get childDetailNoServers => '未加入任何服务器。';

  @override
  String childDetailMemberCount(int count) {
    return '$count 名成员';
  }

  @override
  String get childDetailRemoveServerTooltip => '从服务器中移除';

  @override
  String get childDetailRestrictAccessTitle => '限制访问时间段';

  @override
  String get childDetailRestrictAccessSubtitle => '关闭表示任何时候都可以不受限制地访问';

  @override
  String get childDetailTimezoneLabel => '时区';

  @override
  String get childDetailMonday => '周一';

  @override
  String get childDetailTuesday => '周二';

  @override
  String get childDetailWednesday => '周三';

  @override
  String get childDetailThursday => '周四';

  @override
  String get childDetailFriday => '周五';

  @override
  String get childDetailSaturday => '周六';

  @override
  String get childDetailSunday => '周日';

  @override
  String get childDetailNoAccessLabel => '禁止访问';

  @override
  String get childDetailToLabel => '至';

  @override
  String get childDetailSavingLabel => '保存中...';

  @override
  String get childDetailSaveScheduleButton => '保存时间表';

  @override
  String get childDetailScheduleSaved => '时间表已保存。';

  @override
  String get childDetailOverrideExplanation =>
      '在正常时间表之外临时授予访问权限 -- 适合一次性例外情况，而无需更改每周的时间表。';

  @override
  String get childDetailReasonHint => '原因（可选）';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes 分钟';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours 小时';
  }

  @override
  String get childDetailRevokeOverrideButton => '撤销当前临时许可';

  @override
  String get childDetailAccessGranted => '已授予临时访问权限。';

  @override
  String get childDetailOverrideRevoked => '临时许可已撤销。';

  @override
  String get digitalGoodsTitle => '数字商品';

  @override
  String get digitalGoodsMyProductsTitle => '我的商品';

  @override
  String get digitalGoodsManageProductsTooltip => '管理此服务器的商品';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => '切换到浏览';

  @override
  String get digitalGoodsCreateProductTooltip => '创建商品';

  @override
  String get digitalGoodsBrowseTab => '浏览';

  @override
  String get digitalGoodsMyListingsTab => '我的上架商品';

  @override
  String get digitalGoodsMyPurchasesTab => '我的购买记录';

  @override
  String get digitalGoodsNoProductsYet => '暂无商品';

  @override
  String get digitalGoodsNoProductsAvailable => '暂无可用商品';

  @override
  String get digitalGoodsCreateFirstProductHint => '创建你的第一个商品以开始销售';

  @override
  String get digitalGoodsCheckBackLater => '数字商品请稍后再来查看';

  @override
  String get digitalGoodsCreateProductButton => '创建商品';

  @override
  String get digitalGoodsLicenseKeyBadge => '许可证密钥';

  @override
  String get digitalGoodsFileBadge => '文件';

  @override
  String get digitalGoodsAllServersBadge => '所有服务器';

  @override
  String get digitalGoodsFreeForYou => '对你免费';

  @override
  String get digitalGoodsFreeLabel => '免费';

  @override
  String digitalGoodsSoldCount(int count) {
    return '已售出 $count 件';
  }

  @override
  String get digitalGoodsKeysButton => '密钥';

  @override
  String get digitalGoodsGetForFree => '免费获取';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return '以 $price 购买';
  }

  @override
  String get digitalGoodsNoPurchasesYet => '暂无购买记录';

  @override
  String get digitalGoodsUnknownProduct => '未知商品';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return '购买于 $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => '复制密钥';

  @override
  String get digitalGoodsLicenseKeyCopied => '许可证密钥已复制！';

  @override
  String digitalGoodsExpiresOn(String date) {
    return '$date 过期';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => '你的许可证密钥';

  @override
  String get digitalGoodsCopyKeyButton => '复制密钥';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      '无法开始结账 -- 该创作者可能尚未连接 Stripe。';

  @override
  String get digitalGoodsPurchaseComplete => '购买完成！可在“我的购买记录”中查看。';

  @override
  String get digitalGoodsPurchasePending => '仍在等待该笔付款完成 -- 完成后将显示在“我的购买记录”中。';

  @override
  String get digitalGoodsCreateProductTitle => '创建商品';

  @override
  String get digitalGoodsEditProductTitle => '编辑商品';

  @override
  String get digitalGoodsProductTitleHint => '商品标题';

  @override
  String get digitalGoodsDescriptionHint => '描述（可选）';

  @override
  String get digitalGoodsPriceHint => '价格（美元，留空表示免费）';

  @override
  String get digitalGoodsProductTypeLabel => '商品类型';

  @override
  String get digitalGoodsFileDownloadOption => '文件下载';

  @override
  String get digitalGoodsLicenseKeyOption => '许可证密钥';

  @override
  String get digitalGoodsAvailabilityLabel => '可见范围';

  @override
  String get digitalGoodsThisServerOnlyOption => '仅限此服务器';

  @override
  String get digitalGoodsAllKodaServersOption => '所有 Koda 服务器';

  @override
  String get digitalGoodsAfterCreatingKeysHint => '创建后，使用“密钥”按钮上传你的许可证密钥。';

  @override
  String get digitalGoodsProductFileLabel => '商品文件';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName（${sizeMb}MB）';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => '移除文件';

  @override
  String get digitalGoodsUploadingLabel => '上传中...';

  @override
  String get digitalGoodsChooseFileButton => '选择文件';

  @override
  String get digitalGoodsReplaceFileButton => '替换文件';

  @override
  String get digitalGoodsChooseFileBeforeSaving => '保存前请为此商品选择一个文件。';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => '上传许可证密钥';

  @override
  String get digitalGoodsPasteKeysHint => '每行粘贴一个密钥：';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => '上传密钥';

  @override
  String get digitalGoodsLicenseKeysUploaded => '许可证密钥已上传！';

  @override
  String get serverSubscriptionManageTitle => '管理订阅';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return '$serverName 订阅';
  }

  @override
  String get serverSubscriptionAddTierTooltip => '添加档位';

  @override
  String get serverSubscriptionNoTiersYet => '暂无订阅档位';

  @override
  String get serverSubscriptionCreateUpTo3Tiers => '为你的社区创建最多 3 个档位';

  @override
  String get serverSubscriptionCreateFirstTierButton => '创建第一个档位';

  @override
  String get serverSubscriptionShowSubscriberCounts => '显示订阅者数量';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/月';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 名活跃订阅者',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned => '自动分配身份组';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '市场 $discount% 折扣';
  }

  @override
  String get serverSubscriptionNoTiersMember => '此服务器没有订阅档位';

  @override
  String get serverSubscriptionActiveSubscriberBadge => '活跃订阅者';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return '$date 到期';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk => '专属订阅者身份组';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return '市场购买 $discount% 折扣';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk => '仅限订阅者的频道';

  @override
  String get serverSubscriptionCurrentlySubscribed => '已订阅';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return '以 $price/月 订阅';
  }

  @override
  String get serverSubscriptionCreateTierTitle => '创建档位';

  @override
  String get serverSubscriptionEditTierTitle => '编辑档位';

  @override
  String get serverSubscriptionTierNameHint => '档位名称（例如 Fan、Supporter、VIP）';

  @override
  String get serverSubscriptionDescriptionHint => '描述（可选）';

  @override
  String get serverSubscriptionPriceHint => '每月价格（美元）';

  @override
  String get serverSubscriptionDiscountLabel => '市场折扣百分比';

  @override
  String get serverSubscriptionPositionLabel => '位置';

  @override
  String serverSubscriptionTierOption(int position) {
    return '档位 $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel => '订阅时授予的身份组 — 可选';

  @override
  String get serverSubscriptionRoleFallback => '身份组';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      '成员订阅的瞬间自动授予，订阅到期的瞬间自动移除。';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      '档位已创建 -- 请在市场 → 创作者中连接 Stripe，之后成员才能订阅该档位。';

  @override
  String get serverSubscriptionDeleteTierTitle => '删除档位';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return '删除“$tierName”吗？现有订阅者将保留访问权限直至到期。';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return '订阅 $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel => '月度订阅';

  @override
  String get serverSubscriptionServerBankEarnsLabel => '服务器银行获得';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points 点';
  }

  @override
  String get serverSubscriptionPaymentSecureNote => '付款由 Stripe 安全处理';

  @override
  String get serverSubscriptionSubscribeButton => '订阅';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      '无法开始结账 -- 此服务器的所有者可能尚未连接 Stripe。';

  @override
  String get serverSubscriptionSubscribed => '已订阅！';

  @override
  String get serverSubscriptionSubscriptionPending => '仍在等待该笔付款完成 -- 完成后将激活。';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return '打赏 $username';
  }

  @override
  String get tipDialogSelectAmountLabel => '选择金额';

  @override
  String get tipDialogMessageHint => '添加留言（可选）';

  @override
  String get tipDialogYouPayLabel => '你支付';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username 收到';
  }

  @override
  String get tipDialogSendTipButton => '发送打赏';

  @override
  String get tipDialogFailedToSendTip => '打赏发送失败。创作者可能尚未连接 Stripe。';

  @override
  String get tipDialogCouldNotStartCheckout => '无法开始结账。请稍后再试。';

  @override
  String get tipDialogTipSent => '打赏已发送！';

  @override
  String get tipDialogTipPending => '仍在等待该笔付款完成 -- 完成后将会到账。';

  @override
  String get tipDialogUnknownUser => '未知';

  @override
  String get marketplaceTitle => '市场';

  @override
  String get marketplaceCreatorPayoutsTitle => '创作者收款';

  @override
  String get marketplaceReceiveTipsSubtitle => '通过 Stripe 直接接收打赏';

  @override
  String get marketplaceTabServerBank => '服务器银行';

  @override
  String get marketplaceTabDigitalGoods => '数字商品';

  @override
  String get marketplaceTabMerch => '周边';

  @override
  String get marketplaceTabSubscription => '订阅';

  @override
  String get marketplaceTabRevenue => '收益';

  @override
  String get marketplaceSelectServerSubscription => '选择一个服务器以查看其订阅';

  @override
  String get marketplaceSelectServerBank => '选择一个服务器以查看其银行';

  @override
  String get marketplaceSelectServerRevenue => '选择一个服务器以查看其收益';

  @override
  String get marketplaceStripeAccountStatus => 'Stripe 账户';

  @override
  String get marketplaceOnboardingCompleteStatus => '入驻已完成';

  @override
  String get marketplaceAcceptingPaymentsStatus => '正在接受付款';

  @override
  String get marketplaceConnectStripeButton => '连接 Stripe 账户';

  @override
  String get marketplaceCompleteStripeOnboardingButton => '完成 Stripe 入驻流程';

  @override
  String get marketplaceRefreshStatusButton => '刷新状态';

  @override
  String get marketplaceReadyToReceiveTips => '你已准备好接收打赏！';

  @override
  String get marketplaceHowItWorksTitle => '使用方法';

  @override
  String get marketplaceHowItWorksStep1 => '连接你的 Stripe 账户';

  @override
  String get marketplaceHowItWorksStep2 => '完成身份验证';

  @override
  String get marketplaceHowItWorksStep3 => '直接将打赏收入你的银行账户';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda 收取 5% 的手续费。该费用将以积分形式计入你服务器的银行。';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      '只有服务器所有者或拥有“管理市场”权限的人才能查看服务器银行。';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName 已获得助力！';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit 个自定义表情位';
  }

  @override
  String get marketplaceServerFallback => '服务器';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance 点';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount 活跃度';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      '积分来自此服务器打赏和订阅收取的 5% 手续费。使用积分解锁服务器升级项目。';

  @override
  String get marketplaceServerBoostsTitle => '服务器助力';

  @override
  String marketplaceLevelLabel(int level) {
    return '等级 $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个生效中的助力',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: '还差 $more 个助力即可达到等级 $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix => '，并解锁自定义服务器背景';

  @override
  String get marketplaceUnlockIconBorderSuffix => '，并解锁自定义服务器图标边框';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你有 $count 个可用的助力代币。',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      '助力代币来自 Pulse 订阅（每月 1 个）。在订阅标签页中订阅即可获得。';

  @override
  String get marketplaceBoostingLabel => '助力中...';

  @override
  String get marketplaceBoostThisServerButton => '为此服务器助力';

  @override
  String get marketplaceComingSoonUpgradesTitle => '即将推出 — 服务器升级';

  @override
  String get marketplaceSpendPointsList =>
      '使用服务器银行积分兑换：\n• 自定义服务器域名\n• 提高成员上限\n• 优先支持\n• 专属服务器徽章';

  @override
  String get marketplaceSourceTip => '打赏';

  @override
  String get marketplaceSourceSubscription => 'Koda 订阅';

  @override
  String get marketplaceSourceServerSubscription => '服务器订阅';

  @override
  String get marketplaceSourceDigitalProduct => '数字商品';

  @override
  String get marketplaceSourceStageTicket => '舞台活动门票';

  @override
  String get marketplaceSourcePrintfulOrder => '周边订单';

  @override
  String get marketplaceJustNow => '刚刚';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return '$minutes分钟前';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return '$hours小时前';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return '$days天前';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue => '只有可以管理市场的成员才能查看此服务器的收益。';

  @override
  String get marketplaceBalanceLabel => '余额';

  @override
  String get marketplaceLifetimeEarnedLabel => '累计收益';

  @override
  String get marketplaceLast30DaysTitle => '最近 30 天';

  @override
  String get marketplaceRevenueBySourceTitle => '按来源划分的收益';

  @override
  String get marketplaceNoRevenueYet => '暂无收益。';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 笔交易',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => '最近交易';

  @override
  String get marketplaceNoTransactionsYet => '暂无交易。';

  @override
  String get marketplaceNoActivityYet => '暂无活动';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date：$amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已从 Printful 同步 $count 件商品',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed => '无法与 Printful 同步 -- 请在周边设置中检查连接状态。';

  @override
  String get printfulMerchSelectServer => '选择一个服务器以查看其周边';

  @override
  String get printfulMerchManageCatalogTitle => '管理周边目录';

  @override
  String get printfulMerchTitle => '周边';

  @override
  String get printfulMerchSyncingLabel => '同步中...';

  @override
  String get printfulMerchSyncCatalogButton => '同步目录';

  @override
  String get printfulMerchSwitchToBrowseTooltip => '切换到浏览';

  @override
  String get printfulMerchManageTooltip => '管理此服务器的周边';

  @override
  String get printfulMerchNothingSyncedYet => '尚未同步任何内容';

  @override
  String get printfulMerchNoMerchAvailable => '暂无可用周边';

  @override
  String get printfulMerchSyncHint => '同步你的 Printful 商店以导入商品目录';

  @override
  String get printfulMerchCheckBackLater => '此服务器的周边请稍后再来查看';

  @override
  String get printfulMerchOutOfStock => '缺货';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$price 起 • $count 个选项',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => '查看';

  @override
  String get printfulMerchCartTooltip => '购物车';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '已将 $productName 加入购物车';
  }

  @override
  String get printfulMerchQuantityLabel => '数量';

  @override
  String get printfulMerchDecreaseQuantityTooltip => '减少数量';

  @override
  String get printfulMerchIncreaseQuantityTooltip => '增加数量';

  @override
  String get printfulMerchAddToCartButton => '加入购物车';

  @override
  String get printfulMerchOptionLabel => '选项';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => '款式';

  @override
  String get printfulMerchSizeLabel => '尺码';

  @override
  String get printfulMerchYourCartTitle => '你的购物车';

  @override
  String get printfulMerchCartEmpty => '购物车是空的。';

  @override
  String get printfulMerchSubtotalLabel => '小计';

  @override
  String get printfulMerchCheckoutLabel => '结账';

  @override
  String get printfulMerchRemoveFromCartTooltip => '从购物车中移除';

  @override
  String get printfulMerchFillShippingAddressFirst => '请先填写收货地址。';

  @override
  String get printfulMerchCouldNotGetShippingRates => '无法获取该地址的运费。';

  @override
  String get printfulMerchCouldNotStartCheckout => '无法开始结账。请稍后再试。';

  @override
  String get printfulMerchOrderPlaced => '订单已提交！';

  @override
  String get printfulMerchOrderPending => '仍在等待该笔付款完成 -- 完成后将下单。';

  @override
  String get printfulMerchShippingSpeedLabel => '配送速度';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max 个工作日';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => '获取运费报价';

  @override
  String get printfulMerchPayButton => '支付';

  @override
  String get kodaMarketplaceTitle => 'Koda 市场';

  @override
  String get kodaMarketplaceTabSubscriptions => '订阅';

  @override
  String get kodaMarketplaceTabBoosts => '助力';

  @override
  String get kodaMarketplaceTabDiscover => '发现';

  @override
  String get kodaMarketplaceTierFreeName => '免费';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return '$date 到期';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks => '升级以解锁专属特权';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你有 $count 个可用的助力代币',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint => '你可以在所在任意服务器的服务器银行标签页中，将代币赠送给该服务器';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => '自定义头像框';

  @override
  String get kodaMarketplaceSparkPerkBadge => '个人资料上的 Spark 徽章';

  @override
  String get kodaMarketplaceSparkPerkFileLimit => '文件上传上限提升（50MB）';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality => '优先语音质量';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => '包含 Spark 的所有权益';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => '动态头像框';

  @override
  String get kodaMarketplacePulsePerkBadge => '个人资料上的 Pulse 徽章';

  @override
  String get kodaMarketplacePulsePerkFileLimit => '文件上传上限 100MB';

  @override
  String get kodaMarketplacePulsePerkBoostToken => '每月 1 个服务器助力代币';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/月';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => '当前方案';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return '获取 $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return '赠送 $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return '赠送 $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return '订阅 $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel => '赠送对象用户名：';

  @override
  String get kodaMarketplaceUsernameHint => '用户名';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => '订阅';

  @override
  String get kodaMarketplaceTotalLabel => '总计';

  @override
  String get kodaMarketplacePaymentSecureNote => '付款由 Stripe 安全处理';

  @override
  String get kodaMarketplaceProceedToPaymentButton => '前往付款';

  @override
  String get kodaMarketplaceUserNotFound => '未找到用户';

  @override
  String get kodaMarketplaceCouldNotStartCheckout => '无法开始结账。请稍后再试。';

  @override
  String get kodaMarketplaceSubscriptionActive => '订阅已生效！';

  @override
  String get kodaMarketplaceSubscriptionPending => '仍在等待该笔付款完成 -- 完成后将激活。';

  @override
  String get kodaMarketplaceBoostPurchased => '助力购买成功！';

  @override
  String get kodaMarketplaceBoostPending => '仍在等待该笔付款完成 -- 完成后即可使用。';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count 个可用';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => '购买助力';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      '这是一次性购买 -- Pulse 订阅者每次续订还可获得 1 个免费代币，如果你经常助力，订阅会更划算。';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return '购买助力 -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      '目前还没有服务器加入 Koda 市场。服务器所有者可以在其服务器的自定义设置中开启此功能。';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => '本周精选';

  @override
  String get kodaMarketplaceAllListedServersHeader => '所有已上架服务器';

  @override
  String get kodaMarketplaceServerFallback => '服务器';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 名成员',
    );
    return '$_temp0';
  }

  @override
  String get calendarFallbackTitle => '日历';

  @override
  String get calendarAskVispTooltip => '询问 Visp';

  @override
  String get calendarCreateEventTooltip => '创建活动';

  @override
  String get calendarPreviousMonthTooltip => '上个月';

  @override
  String get calendarNextMonthTooltip => '下个月';

  @override
  String get calendarTodayButton => '今天';

  @override
  String get calendarWeekdaySun => '日';

  @override
  String get calendarWeekdayMon => '一';

  @override
  String get calendarWeekdayTue => '二';

  @override
  String get calendarWeekdayWed => '三';

  @override
  String get calendarWeekdayThu => '四';

  @override
  String get calendarWeekdayFri => '五';

  @override
  String get calendarWeekdaySat => '六';

  @override
  String get calendarTodaySuffix => '，今天';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '，$count 个活动',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => '选择一天';

  @override
  String get calendarNoEvents => '没有活动';

  @override
  String get calendarSubscribeTooltip => '订阅';

  @override
  String get calendarUnsubscribeTooltip => '取消订阅';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return '重复：$recurrence';
  }

  @override
  String get calendarTicketOwned => '已持有门票';

  @override
  String calendarTicketPrice(String price) {
    return '$price 门票';
  }

  @override
  String get calendarDeleteEventTitle => '删除活动';

  @override
  String calendarDeleteEventConfirm(String title) {
    return '删除“$title”吗？此操作无法撤销。';
  }

  @override
  String get calendarEditEventTitle => '编辑活动';

  @override
  String get calendarCreateEventTitle => '创建活动';

  @override
  String get calendarEventTitleHint => '活动标题';

  @override
  String get calendarDescriptionHint => '描述（可选）';

  @override
  String get calendarLocationHint => '地点（可选）';

  @override
  String calendarStartLabel(String timezone) {
    return '开始（$timezone）';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return '开始日期和时间，$formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return '结束 — 可选（$timezone）';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return '结束日期和时间，$formatted';
  }

  @override
  String get calendarNotSetLabel => '未设置';

  @override
  String get calendarTapToSetEndTime => '点按以设置结束时间';

  @override
  String get calendarRecurrenceLabel => '重复';

  @override
  String get calendarRecurrenceNone => '不重复';

  @override
  String get calendarRecurrenceDaily => '每天';

  @override
  String get calendarRecurrenceWeekly => '每周';

  @override
  String get calendarRecurrenceMonthly => '每月';

  @override
  String get calendarColorLabel => '颜色';

  @override
  String calendarColorSwatchLabel(String hex) {
    return '颜色 $hex';
  }

  @override
  String get calendarTicketPriceLabel => '门票价格 — 可选';

  @override
  String get calendarLinkStageChannelLabel => '关联舞台频道 — 可选';

  @override
  String get calendarStageChannelFallback => '舞台';

  @override
  String get discordImportFetchError => '无法获取模板。';

  @override
  String get discordImportApplyError => '应用模板失败，请重试。';

  @override
  String get discordImportTitle => '导入 Discord 模板';

  @override
  String get discordImportDescription =>
      '粘贴 discord.new 链接或模板代码，即可将身份组、分类和频道导入此服务器。';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 或模板代码';

  @override
  String get discordImportPreviewButton => '预览';

  @override
  String get discordImportTemplateFallback => '模板';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个身份组',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个分类',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个频道',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel => '替换现有结构';

  @override
  String get discordImportReplaceWarning => '所有现有的频道、分类和身份组都将被永久删除。';

  @override
  String get discordImportAddDescription => '模板将被添加到你现有的服务器结构中。';

  @override
  String get discordImportReplaceConfirmTitle => '替换服务器结构？';

  @override
  String get discordImportReplaceConfirmBody =>
      '这将在导入前永久删除所有现有的频道、分类和身份组。此操作无法撤销。';

  @override
  String get discordImportYesReplace => '是，替换';

  @override
  String get discordImportReplaceAndImportButton => '替换并导入模板';

  @override
  String get discordImportAddToServerButton => '将模板添加到服务器';

  @override
  String get thresholdModConfigureTitle => '配置阈值管理';

  @override
  String get thresholdModConfigureExplanation =>
      '选择受信任的管理员，以及在解密频道历史记录的一个纪元之前需要多少人同意。即使是你，也无法单独持有密钥 -- 只有当你也在此列表中时才是例外。';

  @override
  String get thresholdModThresholdLabel => '阈值：';

  @override
  String get thresholdModDecreaseThresholdTooltip => '减少阈值';

  @override
  String get thresholdModIncreaseThresholdTooltip => '增加阈值';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '共 $count 名管理员中',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle => '请求阈值解密';

  @override
  String get thresholdModChannelLabel => '频道';

  @override
  String get thresholdModReasonHint => '原因 -- 将显示给每位指定管理员';

  @override
  String get thresholdModRequestButton => '请求';

  @override
  String get thresholdModShareRelayed => '份额已转发给请求者。';

  @override
  String get thresholdModNotEnoughShares => '目前转发的份额还不够 -- 请等更多管理员转发后再试。';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条消息',
    );
    return '纪元 $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages => '此纪元内没有可解密的消息。';

  @override
  String get thresholdModExplanation =>
      '真正解密频道历史记录，需要多位指定管理员主动一致同意 -- 绝不会由一个人单独完成，即使是服务器所有者也不例外。每次只能解锁整整一个纪元（自上次成员变动以来发送的全部内容），绝不会只解锁单条消息。';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return '已启用 -- $count 名管理员，阈值 $threshold';
  }

  @override
  String get thresholdModNotConfigured => '尚未配置';

  @override
  String get thresholdModReconfigureButton => '重新配置';

  @override
  String get thresholdModEnableButton => '启用';

  @override
  String get thresholdModNotEnabledForServer => '此服务器尚未启用阈值管理。';

  @override
  String get thresholdModEnabledNotDesignated => '此服务器已启用该功能。你不是指定管理员之一。';

  @override
  String get thresholdModRequestsLabel => '请求';

  @override
  String get thresholdModRequestDecryptButton => '请求解密';

  @override
  String get thresholdModNoActiveRequests => '没有进行中的请求。';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- 纪元 $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => '待处理';

  @override
  String get thresholdModStatusApproved => '已批准';

  @override
  String get thresholdModApproveButton => '批准';

  @override
  String get thresholdModRelayShareButton => '转发我的份额';

  @override
  String get thresholdModTryReconstructButton => '尝试重建';

  @override
  String get roleSelectNoRolesAvailable => '没有可自助分配的身份组。';

  @override
  String get roleSelectInstructions => '选择你想要的身份组。点按某个身份组即可添加或移除。';

  @override
  String get rulesScreenAcceptError => '无法接受规则，请重试。';

  @override
  String get rulesScreenSubtitle => '服务器规则';

  @override
  String get rulesScreenScrollToRead => '向下滚动以阅读全部规则';

  @override
  String get rulesScreenAcceptDisclaimer =>
      '点击“接受”即表示你同意遵守这些规则。\n违反规则可能导致被移出服务器。';

  @override
  String get rulesScreenAcceptButton => '我接受规则';

  @override
  String get rulesScreenReadAllToContinue => '请阅读全部规则后再继续';

  @override
  String get galleryNewPostTitle => '新帖子';

  @override
  String get galleryChooseFileButton => '选择文件';

  @override
  String get galleryOrDivider => '或';

  @override
  String get galleryPasteUrlHint => '粘贴图片/视频链接';

  @override
  String get galleryTypeLabel => '类型';

  @override
  String get galleryImageOption => '图片';

  @override
  String get galleryVideoOption => '视频';

  @override
  String get galleryCaptionHint => '说明文字（可选）';

  @override
  String get galleryPostButton => '发布';

  @override
  String get galleryNewCollectionTitle => '新建收藏集';

  @override
  String get galleryCollectionNameHint => '收藏集名称';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return '删除“$collectionName”吗？其中的帖子将变为未分类状态。';
  }

  @override
  String get galleryFeedTab => '动态';

  @override
  String get galleryCollectionsTab => '收藏集';

  @override
  String get galleryNoPostsYet => '暂无帖子';

  @override
  String get galleryNoCollectionsYet => '暂无收藏集';

  @override
  String get gallerySelectACollection => '请选择一个收藏集';

  @override
  String get galleryNoPostsInCollection => '此收藏集中没有帖子';

  @override
  String get galleryAddPostButton => '添加帖子';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return '屏幕共享失败：$error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return '$username 的音量';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou => '仅影响你所听到的声音 -- 仅限此设备、此通话。';

  @override
  String get voiceScreenResetVolumeButton => '重置';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return '无法连接：$error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen => '你的屏幕，点按以全屏查看';

  @override
  String get voiceScreenYourScreenLabel => '你的屏幕';

  @override
  String get voiceScreenTapToClose => '点按以关闭';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name（你）';
  }

  @override
  String get voiceScreenSpeakingSuffix => '，正在说话';

  @override
  String get voiceScreenCameraOnSuffix => '，摄像头已开启';

  @override
  String get voiceScreenActivateToPopOut => '，激活以弹出显示';

  @override
  String get voiceScreenShowVarmTooltip => '显示 VARM';

  @override
  String get voiceScreenHideVarmTooltip => '隐藏 VARM';

  @override
  String get voiceScreenShowChatTooltip => '显示聊天';

  @override
  String get voiceScreenHideChatTooltip => '隐藏聊天';

  @override
  String get voiceScreenStartCameraTooltip => '开启摄像头';

  @override
  String get voiceScreenStopCameraTooltip => '关闭摄像头';

  @override
  String get voiceScreenShareScreenTooltip => '共享屏幕';

  @override
  String get voiceScreenStopSharingTooltip => '停止共享';

  @override
  String get voiceScreenPopOutTooltip => '将语音弹出到独立窗口';

  @override
  String get voiceScreenCouldNotPopOut => '无法弹出语音窗口。';

  @override
  String get voiceScreenLeaveVoiceTooltip => '退出语音';

  @override
  String get voiceScreenPinTooltip => '置顶（保持展开）';

  @override
  String get voiceScreenUnpinTooltip => '取消置顶';

  @override
  String get voiceScreenSizeSmall => '小（320x180）';

  @override
  String get voiceScreenSizeMedium => '中（480x270）';

  @override
  String get voiceScreenSizeLarge => '大（640x360）';

  @override
  String get voiceScreenSizeXl => '超大（960x540）';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName，$count 人已连接';
  }

  @override
  String get voiceBarSpeakingSuffix => '，你正在说话';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count 人已连接 · 点按以展开';
  }

  @override
  String get voiceBarStartCameraTooltip => '开启摄像头';

  @override
  String get voiceBarStopCameraTooltip => '关闭摄像头';

  @override
  String get voiceBarLeaveVoiceTooltip => '退出语音';

  @override
  String get popOutVideoFallbackTitle => '语音';

  @override
  String get popOutVideoMissingTokenError => '缺少令牌或链接';

  @override
  String get popOutVideoConnectionTimedOut => '连接在 15 秒后超时';

  @override
  String popOutVideoErrorLabel(String error) {
    return '错误：$error';
  }

  @override
  String get popOutVideoNoParticipants => '暂无参与者';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => '舞台';

  @override
  String get stageCouldNotJoin => '无法加入舞台。';

  @override
  String get stageThisStageFallback => '此舞台';

  @override
  String get stageRequiresTicketToJoin => '需要门票才能加入';

  @override
  String get stagePleaseWaitLabel => '请稍候...';

  @override
  String get stageGetFreeTicketButton => '领取免费门票';

  @override
  String stageBuyTicketButton(String price) {
    return '购买门票 -- $price';
  }

  @override
  String get stageNotNowButton => '暂不';

  @override
  String get stageCouldNotStartTicketPurchase => '无法开始购票。';

  @override
  String get stagePaymentStillPendingTryAgain => '仍在等待该笔付款完成 -- 确认后请再次尝试加入。';

  @override
  String get stageSpeakerBadge => '发言者';

  @override
  String get stageListenerBadge => '听众';

  @override
  String stageCouldNotJoinWithError(String error) {
    return '无法加入：$error';
  }

  @override
  String get stageSpeakersHeader => '发言者';

  @override
  String get stageRaisedHandsHeader => '举手中';

  @override
  String get stageAllowButton => '允许';

  @override
  String get stageIgnoreButton => '忽略';

  @override
  String get stageListenersHeader => '听众';

  @override
  String get stageRaiseHandTooltip => '举手';

  @override
  String get stageLowerHandTooltip => '放下手';

  @override
  String get stageLeaveStageTooltip => '离开舞台';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name（你）';
  }

  @override
  String get stageMoveToListenersButton => '移至听众';

  @override
  String get stageYouFallbackName => '你';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return '$username 的头像';
  }

  @override
  String get channelEditDialogNewTitle => '新建频道';

  @override
  String get channelEditDialogEditTitle => '编辑频道';

  @override
  String get channelEditDialogNameHint => '频道名称';

  @override
  String get channelEditDialogTypeLabel => '类型';

  @override
  String get channelEditDialogTypeText => '文字';

  @override
  String get channelEditDialogTypeVoice => '语音';

  @override
  String get channelEditDialogTypeGallery => '图库';

  @override
  String get channelEditDialogTypeStage => '舞台';

  @override
  String get channelEditDialogTypeRules => '规则';

  @override
  String get channelEditDialogTypeRoleSelection => '身份组选择';

  @override
  String get channelEditDialogTypeCalendar => '日历';

  @override
  String get channelEditDialogAnnouncementTitle => '公告频道';

  @override
  String get channelEditDialogAnnouncementSubtitle => '只有可以管理消息的成员才能发布';

  @override
  String get channelEditDialogLiveAnnouncementsTitle => '在此发布直播和上传通知';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      '当拥有“上线时通知”权限的成员在 Twitch 开始直播，或发布新的 YouTube 视频时会自动发布';

  @override
  String get channelEditDialogNotifyRolesLabel => '发布时通知这些身份组（可选）';

  @override
  String get channelEditDialogCategoryLabel => '分类';

  @override
  String get channelEditDialogNoCategory => '无分类';

  @override
  String get channelEditDialogRoleAccessLabel => '身份组访问权限（留空表示所有人可见）';

  @override
  String get channelEditDialogContentLabelsLabel => '内容标签';

  @override
  String get channelEditDialogContentLabelsDescription =>
      '为此频道标记成员的内容过滤器；受监护账号将被强制屏蔽';

  @override
  String get categoryEditDialogNewTitle => '新建分类';

  @override
  String get categoryEditDialogEditTitle => '编辑分类';

  @override
  String get categoryEditDialogNameHint => '分类名称';

  @override
  String get categoryEditDialogRoleAccessLabel => '身份组访问权限（留空表示所有人可见）';

  @override
  String memberPanelHeaderLabel(int count) {
    return '成员 — $count 人在线';
  }

  @override
  String get memberPanelRefreshTooltip => '刷新成员列表';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 名成员',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => '离线';

  @override
  String memberPanelTierSuffix(String tier) {
    return '，$tier 档位';
  }

  @override
  String get memberPanelUnknownUser => '未知';

  @override
  String get memberPanelModerationActionsTooltip => '管理操作';

  @override
  String get reportDialogReasonSpam => '垃圾信息';

  @override
  String get reportDialogReasonHarassment => '骚扰或辱骂';

  @override
  String get reportDialogReasonIllegal => '违法内容';

  @override
  String get reportDialogReasonOther => '其他';

  @override
  String get reportDialogReasonLabel => '原因';

  @override
  String get reportDialogNoteHint => '还有什么需要告知管理员的吗？（可选）';

  @override
  String get reportDialogDisclosureNote => '你所看到的消息内容及发送者身份，将与此服务器的管理员共享。';

  @override
  String get reportDialogSubmitButton => '提交举报';

  @override
  String get reportDialogSubmitError => '无法提交举报。';

  @override
  String get notificationBellTitle => '通知';

  @override
  String get notificationBellMarkAllRead => '全部标记为已读';

  @override
  String get notificationBellEmptyState => '暂无通知';

  @override
  String get notificationBellUnreadLabel => '未读';

  @override
  String get invitePreviewTitle => '服务器邀请';

  @override
  String get invitePreviewInvalidOrExpired => '邀请无效或已过期。';

  @override
  String get invitePreviewCouldNotJoin => '无法加入服务器。';

  @override
  String get invitePreviewUnknownServer => '未知服务器';

  @override
  String get shippingAddressFullNameHint => '姓名';

  @override
  String get shippingAddressLine1Hint => '地址第一行';

  @override
  String get shippingAddressLine2Hint => '地址第二行（可选）';

  @override
  String get shippingAddressCityHint => '城市';

  @override
  String get shippingAddressStateHint => '省/州';

  @override
  String get shippingAddressZipHint => '邮政编码';

  @override
  String get shippingAddressCountryCodeHint => '国家代码（例如 US）';

  @override
  String get shippingAddressPhoneHint => '电话（可选）';

  @override
  String get shippingAddressPrivacyNote =>
      '仅用于配送此订单 -- 订单完成后 Printful 如何处理这些信息，请参阅其隐私政策。';

  @override
  String get updateNudgeAvailableTitle => '有可用更新';

  @override
  String get updateNudgeRequiredTitle => '需要更新';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $version 已发布 -- 你使用的是较旧版本。';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return '此版本已不再受支持。请更新到 Koda $version 以继续使用 Koda。';
  }

  @override
  String get updateNudgeLaterButton => '以后再说';

  @override
  String get tierBadgeSparkSubscriber => 'Spark 订阅者';

  @override
  String get tierBadgePulseSubscriber => 'Pulse 订阅者';

  @override
  String get vispAvatarInDevelopment => '开发中';

  @override
  String get vispBoostAdvisorCouldNotAnswer => 'Visp 未能给出回答。';

  @override
  String get vispBoostAdvisorTitle => '询问 Visp：助力投资回报顾问';

  @override
  String get vispBoostAdvisorFollowUpHint => '追加提问...';

  @override
  String get vispBoostAdvisorSendTooltip => '发送';

  @override
  String get vispBoostAdvisorBasedOn => '依据：';

  @override
  String get vispEventDialogCouldNotGenerate => 'Visp 未能生成活动。';

  @override
  String get vispEventDialogCouldNotCreate => '无法创建该活动。';

  @override
  String get vispEventDialogRecurrenceNone => '单次';

  @override
  String get vispEventDialogRecurrenceDaily => '每天重复';

  @override
  String get vispEventDialogRecurrenceWeekly => '每周重复';

  @override
  String get vispEventDialogRecurrenceMonthly => '每月重复';

  @override
  String get vispEventDialogTitle => '让 Visp 创建活动';

  @override
  String get vispEventDialogDescription => '描述这个活动 -- Visp 会提议标题、日期/时间及其他细节。';

  @override
  String get vispEventDialogPromptHint => '例如“每周五晚上 7 点，持续约 3 小时的每周 D&D 场次”';

  @override
  String get vispEventDialogPrivacyNote =>
      '你的描述将被发送给 Visp（一个自托管助手 -- 任何内容都不会离开 Koda 的服务器）以生成此方案。';

  @override
  String get vispEventDialogStartOver => '重新开始';

  @override
  String get vispEventDialogCreateEvent => '创建活动';

  @override
  String get vispEventDialogThinking => '思考中...';

  @override
  String get vispEventDialogGeneratePlan => '生成方案';

  @override
  String get vispEventDialogCouldNotParseDate => '无法解析日期 -- 请尝试换一种说法';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return '结束：$ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '每张门票 $price';
  }

  @override
  String get vispEventDialogBasedOn => '依据：';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return '问题 $questionNumber/$maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => '或输入你自己的回答...';

  @override
  String get vispQuestionStepSendTooltip => '发送';

  @override
  String get vispQuestionStepSkip => '跳过并立即生成';

  @override
  String get vispSetupDialogCouldNotGeneratePlan => 'Visp 未能生成方案。';

  @override
  String get vispSetupDialogCouldNotApplyPlan => '无法应用该方案。';

  @override
  String get vispSetupDialogTitleNew => '向 Visp 描述你的服务器';

  @override
  String get vispSetupDialogTitleExisting => '让 Visp 为此服务器添加内容';

  @override
  String get vispSetupDialogDescriptionNew =>
      '描述你想要的服务器 -- Visp 会提议名称，以及一套身份组、分类和频道。';

  @override
  String get vispSetupDialogDescriptionExisting =>
      '描述你想添加的内容 -- Visp 会提议要创建的身份组、分类和频道。';

  @override
  String get vispSetupDialogPromptHintNew =>
      '例如“一个适合我的 D&D 小组的温馨服务器，带有两桌用的语音频道”';

  @override
  String get vispSetupDialogPromptHintExisting => '例如“为我们的团队再多加几个频道”';

  @override
  String get vispSetupDialogPrivacyNote =>
      '你的描述将被发送给 Visp（一个自托管助手 -- 任何内容都不会离开 Koda 的服务器）以生成此方案。';

  @override
  String get vispSetupDialogStartOver => '重新开始';

  @override
  String get vispSetupDialogCreateServer => '创建服务器';

  @override
  String get vispSetupDialogAddToServer => '添加到服务器';

  @override
  String get vispSetupDialogThinking => '思考中...';

  @override
  String get vispSetupDialogGeneratePlan => '生成方案';

  @override
  String get vispSetupDialogNewServerLabel => '新服务器';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个身份组',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个分类',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个频道',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => '依据：';

  @override
  String get childLockoutTitle => '当前不在你的可用时间内';

  @override
  String get childLockoutBody =>
      '家长或监护人已设置此账号可使用 Koda 的时间段。可以请他们延长时间，或在下一个可用时间段再来查看。';

  @override
  String get childLockoutLogOutButton => '退出登录';

  @override
  String get forcePasswordChangeError => '无法更新密码，请重试。';

  @override
  String forcePasswordChangeWelcome(String username) {
    return '欢迎，$username';
  }

  @override
  String get forcePasswordChangeSubtitle => '你的账号需要设置新密码才能继续。';

  @override
  String get forcePasswordChangeNewPasswordHint => '新密码';

  @override
  String get forcePasswordChangeConfirmPasswordHint => '确认新密码';

  @override
  String get forcePasswordChangeReqLength => '至少 12 个字符';

  @override
  String get forcePasswordChangeReqUpper => '至少一个大写字母';

  @override
  String get forcePasswordChangeReqLower => '至少一个小写字母';

  @override
  String get forcePasswordChangeReqDigit => '至少一个数字';

  @override
  String get forcePasswordChangeReqMatch => '密码一致';

  @override
  String get forcePasswordChangeSubmitButton => '设置新密码';

  @override
  String get forgotPasswordEnterEmailError => '请输入你的邮箱地址。';

  @override
  String get forgotPasswordCodeSentInfo => '如果该账号存在，重置代码已发送。';

  @override
  String get forgotPasswordEnterCodeError => '请输入代码和至少 8 位的密码。';

  @override
  String get forgotPasswordInvalidCode => '代码无效或已过期。';

  @override
  String get forgotPasswordTitle => '重置密码';

  @override
  String get forgotPasswordEmailHint => '邮箱地址';

  @override
  String get forgotPasswordSendCodeButton => '发送重置代码';

  @override
  String get forgotPasswordCodeHint => '6 位代码';

  @override
  String get forgotPasswordNewPasswordHint => '新密码';

  @override
  String get forgotPasswordSetNewPasswordButton => '设置新密码';

  @override
  String get verifyEmailEnterCodeError => '请输入邮件中的 6 位代码。';

  @override
  String get verifyEmailInvalidCode => '代码无效或已过期。';

  @override
  String verifyEmailResentInfo(String email) {
    return '新代码已发送至 $email。';
  }

  @override
  String get verifyEmailResendFailed => '目前无法重新发送。';

  @override
  String get verifyEmailTitle => '请查看你的邮箱';

  @override
  String verifyEmailSentCode(String email) {
    return '我们已将 6 位代码发送至 $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => '验证邮箱';

  @override
  String get verifyEmailResendButton => '重新发送代码';

  @override
  String get safetyNumberKeysNotSetUp => '你自己的密钥尚未设置。';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName 尚无密钥包。';
  }

  @override
  String safetyNumberComputeError(String error) {
    return '无法计算安全码：$error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName 已不再拥有该设备。';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return '与 $peerName 的安全码';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return '请通过其他渠道 -- 当面、电话，任何非此聊天的方式 -- 与 $peerName 核对此号码。如果双方一致，说明你正在与你所认为的对象交谈。';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName 拥有 $count 台设备，每台都有各自的安全码 -- 验证一台并不能覆盖其他设备。';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return '设备 $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => '标记为已验证';

  @override
  String get contentFiltersDescription =>
      '服务器可以为频道标记内容标签。选择你希望被标记的频道如何显示 -- 这只是你个人的偏好设置，绝不会影响其他人所看到的内容。';

  @override
  String get contentFiltersLabelAdult => '成人内容';

  @override
  String get contentFiltersLabelSuggestive => '性暗示内容';

  @override
  String get contentFiltersLabelGraphic => '血腥暴力媒体';

  @override
  String get contentFiltersLabelNudity => '非性相关裸露';

  @override
  String get contentFiltersDescAdult => '露骨的性内容';

  @override
  String get contentFiltersDescSuggestive => '具有性暗示但不露骨的内容';

  @override
  String get contentFiltersDescGraphic => '暴力或血腥内容';

  @override
  String get contentFiltersDescNudity => '非性相关情境下的裸露';

  @override
  String get contentFiltersHide => '隐藏';

  @override
  String get contentFiltersWarn => '警告';

  @override
  String get contentFiltersShow => '显示';

  @override
  String get deviceTestCouldNotGetToken => '无法获取测试令牌。';

  @override
  String get deviceTestLabelTest => '测试';

  @override
  String get deviceTestLabelRecording => '录制中...';

  @override
  String get deviceTestLabelPlayingBack => '正在回放...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return '无法启动摄像头：$error';
  }

  @override
  String get deviceTestTitle => '测试设备';

  @override
  String deviceTestCouldNotConnect(String error) {
    return '无法连接：$error';
  }

  @override
  String get deviceTestMicrophoneLabel => '麦克风';

  @override
  String get deviceTestHearYourselfLabel => '听到自己的声音（有延迟）';

  @override
  String get deviceTestSpeakerOutputLabel => '扬声器／输出';

  @override
  String get deviceTestCameraLabel => '摄像头';

  @override
  String get deviceTestSystemDefault => '系统默认';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return '说话后，将播放 $seconds 秒的录音片段';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '$seconds 秒';
  }

  @override
  String get deviceTestCameraPreviewOff => '摄像头预览已关闭';

  @override
  String get deviceTestStopCameraButton => '停止摄像头测试';

  @override
  String get deviceTestTestCameraButton => '测试摄像头';

  @override
  String get deviceTestInputLevelLabel => '输入电平';

  @override
  String get devicesScreenRemoveConfirmTitle => '移除此设备？';

  @override
  String get devicesScreenRemoveConfirmBody =>
      '该设备需要重新登录，且在被移除期间发送给它的消息之后将无法送达 -- 双棘轮会话不会追溯性地补齐空缺。';

  @override
  String get devicesScreenRemoveFailed => '无法移除该设备。';

  @override
  String get devicesScreenNeverActive => '从未活跃';

  @override
  String devicesScreenActiveDate(String date) {
    return '上次活跃：$date';
  }

  @override
  String get devicesScreenDescription =>
      '你登录的每台设备都有各自的加密身份 -- 发送给你的消息会送达以下所有设备。请移除你不再使用或不认识的设备。';

  @override
  String get devicesScreenNoDevicesFound => '未找到任何设备。';

  @override
  String get devicesScreenUnknownDevice => '未知设备';

  @override
  String get devicesScreenThisDeviceBadge => '本设备';

  @override
  String get devicesScreenRemoveDeviceTooltip => '移除设备';

  @override
  String get totpSetupInvalidCode => '代码无效，请重试。';

  @override
  String get totpSetupEnabledMessage => '双重验证已启用。';

  @override
  String get totpSetupScanInstructions =>
      '请将此密钥扫描到你的身份验证器应用中（如 Google Authenticator、1Password、Authy）：';

  @override
  String get totpSetupCodeHint => '输入 6 位代码以确认';

  @override
  String get totpSetupVerifyButton => '验证并启用';

  @override
  String get voiceVideoSettingsPushToTalkLabel => '按键说话';

  @override
  String get voiceVideoSettingsPressAnyKeyHint => '按下任意键以绑定...';

  @override
  String get voiceVideoSettingsTestDevicesButton => '测试设备';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => '语音处理';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => '降噪';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle => '降低麦克风拾取的背景噪音';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle => '深度降噪 (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      '实时 AI 降噪，比标准降噪更强 -- 开启后将替代标准降噪';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => '回声消除';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle => '防止你自己的声音回声传回';

  @override
  String get voiceVideoSettingsAutoGainTitle => '自动增益控制';

  @override
  String get voiceVideoSettingsAutoGainSubtitle => '自动平衡麦克风音量（响度归一化）';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => '自动闪避';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle => '在你说话时降低其他参与者的音量';

  @override
  String get voiceVideoSettingsHighPassTitle => '高通滤波器';

  @override
  String get voiceVideoSettingsHighPassSubtitle => '消除低频噪音（风扇、空调、桌面震动等）';

  @override
  String get voiceVideoSettingsTypingNoiseTitle => '打字噪音检测';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle => '抑制麦克风拾取的键盘敲击声';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => '人声隔离';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle => '聚焦于你的声音，过滤掉周围其他人和声音';

  @override
  String get voiceVideoSettingsSectionMicBoost => '麦克风增益';

  @override
  String get voiceVideoSettingsEnableBoostTitle => '启用增益';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      '为音量小或距离远的麦克风提供前级增益 -- 在均衡器之前应用';

  @override
  String get voiceVideoSettingsBandBoost => '增益';

  @override
  String get voiceVideoSettingsSectionMicEq => '麦克风均衡器';

  @override
  String get voiceVideoSettingsEnableEqTitle => '启用均衡器';

  @override
  String get voiceVideoSettingsEnableEqSubtitle => '在麦克风声音传给他人之前进行调音';

  @override
  String get voiceVideoSettingsBandBass => '低音';

  @override
  String get voiceVideoSettingsBandMid => '中音';

  @override
  String get voiceVideoSettingsBandTreble => '高音';

  @override
  String get voiceVideoSettingsSectionVad => '语音活动检测（VOX）';

  @override
  String get voiceVideoSettingsEnableVoxTitle => '启用 VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle => '仅在你实际说话时才传输';

  @override
  String get voiceVideoSettingsSensitivityLabel => '灵敏度';

  @override
  String get voiceVideoSettingsVadHint =>
      '数值越低，越能捕捉到更安静的声音；数值越高，只有更大声的说话才会触发传输。';

  @override
  String get voiceVideoSettingsBoundKeyLabel => '已绑定按键';

  @override
  String get voiceVideoSettingsKeyNotSet => '未设置 — 取消静音后麦克风将始终开启';

  @override
  String get voiceVideoSettingsClearButton => '清除';

  @override
  String get voiceVideoSettingsSetKeyButton => '设置按键';

  @override
  String get voiceVideoSettingsChangeButton => '更改';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      '绑定按键后，只有按住该键时麦克风才会传输。在语音频道中，此设置优先于 VOX。';

  @override
  String get voiceVideoSettingsSectionVarm => 'VARM - 虚拟头像反应模型';

  @override
  String get voiceVideoSettingsVarmDescription => '上传两张图片，在你说话时自动切换。仅你自己可见。';

  @override
  String get voiceVideoSettingsVarmSilentLabel => '静默时';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => '说话时';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => '说话阈值';

  @override
  String get voiceVideoSettingsVarmThresholdHint => '数值越低，越容易切换到说话图片。';

  @override
  String get voiceVideoSettingsRemoveVarmButton => '移除 VARM';

  @override
  String get gifPickerNoGifsFound => '未找到 GIF';

  @override
  String get gifPickerSearchHint => '搜索 GIF...';

  @override
  String get messageSearchHint => '搜索此频道...';

  @override
  String get messageSearchTooltip => '搜索';

  @override
  String get messageSearchInitialHint =>
      '搜索此设备上已加载的消息 -- 继续向前查看时会获取（并在本地解密）更早的历史记录。';

  @override
  String get messageSearchNoMatches => '无匹配结果';

  @override
  String get messageSearchStartOfHistory => '频道历史记录的开头';

  @override
  String get messageSearchFurtherBackButton => '搜索更早的记录';

  @override
  String get messageSearchUnknownAuthor => '未知';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => '取消';

  @override
  String get commonSave => '儲存';

  @override
  String get commonEdit => '編輯';

  @override
  String get commonDelete => '刪除';

  @override
  String get commonCreate => '建立';

  @override
  String get commonClose => '關閉';

  @override
  String get commonDone => '完成';

  @override
  String get commonDownload => '下載';

  @override
  String get commonDisconnect => '中斷連線';

  @override
  String get commonNone => '無';

  @override
  String get commonJoin => '加入';

  @override
  String get commonDismiss => '關閉';

  @override
  String get commonSubmit => '送出';

  @override
  String get commonConfirm => '確認';

  @override
  String get commonRemove => '移除';

  @override
  String get commonRetry => '重試';

  @override
  String get commonOk => '確定';

  @override
  String get commonYes => '是';

  @override
  String get commonNo => '否';

  @override
  String get commonSearch => '搜尋';

  @override
  String get commonSettings => '設定';

  @override
  String get commonLoading => '載入中...';

  @override
  String get settingsLanguageSection => '語言';

  @override
  String get settingsLanguageTitle => '應用程式語言';

  @override
  String get settingsLanguageSystemDefault => '系統預設';

  @override
  String get settingsLanguageDescription =>
      '選擇 Koda 介面本身顯示的語言。這與任何伺服器的主要語言，或你輸入訊息所用的語言無關。';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsSignOut => '登出';

  @override
  String get settingsSectionMyAccount => '我的帳戶';

  @override
  String get settingsSectionSecurity => '安全性';

  @override
  String get settingsSectionAccessibility => '無障礙';

  @override
  String get settingsSectionBilling => '帳單';

  @override
  String get settingsSectionFamily => '家庭';

  @override
  String get settingsSectionVoiceVideo => '語音與視訊';

  @override
  String get settingsSectionDesktop => '桌面';

  @override
  String get settingsSectionAbout => '關於';

  @override
  String get settingsTwoFactorTitle => '雙重驗證';

  @override
  String get settingsTwoFactorSubtitle => '新增驗證器應用程式以加強安全性';

  @override
  String get settingsLinkedDevicesTitle => '已連結裝置';

  @override
  String get settingsLinkedDevicesSubtitle => '查看並移除已登入此帳戶的裝置';

  @override
  String get settingsContentFiltersTitle => '內容過濾';

  @override
  String get settingsContentFiltersSubtitle => '選擇已標記內容的顯示方式';

  @override
  String get settingsDmFriendsOnlyTitle => '僅允許好友傳送私訊';

  @override
  String get settingsDmFriendsOnlySubtitle => '非好友無法向你發起新對話';

  @override
  String get settingsDmPrivacyError => '無法更新私訊隱私設定。';

  @override
  String get settingsShowVispAvatarTitle => '顯示 Visp 的頭像';

  @override
  String get settingsShowVispAvatarSubtitle => '在設定／事件／顧問對話框中顯示 Visp 的表情與心情';

  @override
  String get settingsHighContrastTitle => '高對比';

  @override
  String get settingsHighContrastSubtitle =>
      '整個應用程式使用純黑白高對比色彩 -- 切換時會短暫重新載入目前畫面。';

  @override
  String get settingsDyslexiaFontTitle => '閱讀障礙友善字型';

  @override
  String get settingsDyslexiaFontSubtitle => '將應用程式內文字全部切換為 OpenDyslexic 字型';

  @override
  String get settingsFontSizeTitle => '字型大小';

  @override
  String get settingsFontSizeSample => '視風漫捲雲舒，落霞與孤鶩齊飛';

  @override
  String get settingsDensityTitle => '密度';

  @override
  String get settingsDensityDescription =>
      '影響按鈕、開關、對話框等標準控制項的間距 -- 不影響所有自訂版面配置。';

  @override
  String get settingsDensityCompact => '緊湊';

  @override
  String get settingsDensityStandard => '標準';

  @override
  String get settingsDensityComfortable => '舒適';

  @override
  String get settingsStreamingTitle => '直播帳號';

  @override
  String get settingsStreamingDescription =>
      '連結 Twitch/YouTube 後，擁有「開播通知」權限的伺服器可在你開播或發布新影片時自動發文。';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform 已連結為 $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform 未連結';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- 直播中';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- 新上傳影片';

  @override
  String get settingsStreamingConnecting => '連結中...';

  @override
  String get settingsStreamingConnect => '連結';

  @override
  String get settingsAnnounceLiveTwitch => '開播時通知';

  @override
  String get settingsAnnounceLiveYoutube => '通知直播開始與新影片上傳';

  @override
  String get settingsRefreshStatus => '已在瀏覽器完成連結？重新整理狀態';

  @override
  String settingsStreamingConnectError(String platform) {
    return '無法開始連結 $platform。';
  }

  @override
  String get settingsStreamingFinishInBrowser => '請在瀏覽器中完成連結，然後回來重新整理。';

  @override
  String get settingsThroneTitle => 'Throne Webhook';

  @override
  String get settingsThroneDescription =>
      '將此網址貼到你的 Throne.com Webhook 設定中，這樣有人送出禮物時你就能在 Koda 收到通知。';

  @override
  String get settingsThroneGetUrl => '取得我的 Webhook 網址';

  @override
  String get settingsThroneCopyTooltip => '複製';

  @override
  String get settingsThroneCopiedToast => '已複製到剪貼簿';

  @override
  String get settingsThroneRegenerateTooltip => '重新產生（舊網址將失效）';

  @override
  String get settingsThroneRegenerateConfirmTitle => '要重新產生 Webhook 網址嗎？';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      '舊網址將停止運作，請之後在 Throne.com 更新它。';

  @override
  String get settingsThroneRegenerate => '重新產生';

  @override
  String get settingsUploadPhoto => '上傳照片';

  @override
  String get settingsOrPasteUrl => '或在下方貼上網址';

  @override
  String get settingsAvatarUrlHint => 'https://example.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote => '上傳圖片需要 Cloudflare R2 — 貼上網址則一律可用。';

  @override
  String get settingsDisplayNameLabel => '顯示名稱';

  @override
  String get settingsDisplayNameHint => '顯示名稱';

  @override
  String get settingsBioLabel => '個人簡介';

  @override
  String get settingsBioHint => '簡單介紹一下自己';

  @override
  String get settingsPronounsLabel => '代名詞';

  @override
  String get settingsPronounsHint => '例如：他/她';

  @override
  String get settingsShowPronounsTitle => '向他人顯示我的代名詞';

  @override
  String get settingsShowPronounsSubtitle => '會顯示在聊天、成員清單與語音中你的名稱旁';

  @override
  String get settingsStatusLabel => '狀態';

  @override
  String get statusOnline => '上線';

  @override
  String get statusAway => '離開';

  @override
  String get statusDnd => '請勿打擾';

  @override
  String get statusInvisible => '隱身';

  @override
  String get settingsFamilyNotAvailable => '受監護帳戶無法使用家長監護功能。';

  @override
  String get settingsAboutTitle => '關於 Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => '條款與細則';

  @override
  String get settingsPrivacyTitle => '隱私權政策';

  @override
  String get settingsSupportTitle => '支援';

  @override
  String get settingsReportSecurityTitle => '回報安全問題';

  @override
  String get settingsDesktopNotAvailable => '這些是僅限桌面版的設定 -- 此平台沒有視窗或系統匣。';

  @override
  String get settingsCloseToTrayTitle => '關閉時縮到系統匣';

  @override
  String get settingsCloseToTraySubtitle =>
      '關閉視窗後 Koda 仍會在背景執行，你仍會收到通知 -- 關閉此選項後，關閉視窗會真正結束應用程式。';

  @override
  String get authErrorEmailPasswordRequired => '請輸入電子郵件與密碼。';

  @override
  String get authErrorIncorrectCredentials => '電子郵件或密碼不正確。';

  @override
  String get authErrorMustAcceptTerms => '請接受條款與細則。';

  @override
  String get authErrorAllFieldsRequired => '所有欄位皆為必填。';

  @override
  String get authErrorPasswordsDontMatch => '兩次輸入的密碼不一致。';

  @override
  String get authErrorPasswordTooShort => '密碼至少須為 8 個字元。';

  @override
  String get authErrorRegistrationFailed => '註冊失敗，該電子郵件可能已被使用。';

  @override
  String get authTabSignIn => '登入';

  @override
  String get authTabCreateAccount => '建立帳戶';

  @override
  String get authAgreementPrefix => '使用 Koda 即表示你同意我們的';

  @override
  String get authTermsLink => '條款與細則';

  @override
  String get authAgreementMiddle => '以及';

  @override
  String get authPrivacyLink => '隱私權政策';

  @override
  String get authAgreementSuffix => '。';

  @override
  String get authEmailHint => '電子郵件地址';

  @override
  String get authPasswordHint => '密碼';

  @override
  String get authForgotPassword => '忘記密碼？';

  @override
  String get authSignInButton => '登入';

  @override
  String get authUsernameHint => '使用者名稱';

  @override
  String get authConfirmPasswordHint => '確認密碼';

  @override
  String get authAgreeToTerms => '我同意條款與細則及隱私權政策';

  @override
  String get authCreateAccountButton => '建立帳戶';

  @override
  String get dmSafetyNumberChangedWarning => '此對話的安全碼已變更 -- 傳送前請先驗證。';

  @override
  String get dmMessageNotSent => '訊息未送出。';

  @override
  String dmEncryptMessageError(String error) {
    return '無法加密訊息：$error';
  }

  @override
  String get dmAttachmentUploadFailed => '附件上傳失敗。';

  @override
  String dmEncryptAttachmentError(String error) {
    return '無法加密附件：$error';
  }

  @override
  String get dmReportMessage => '檢舉訊息';

  @override
  String get dmReportSubmitted => '檢舉已送出。';

  @override
  String get dmTitle => '訊息';

  @override
  String get dmNewMessage => '新增訊息';

  @override
  String get dmNoConversationsYet => '尚無對話';

  @override
  String get dmSelectConversation => '選擇一個對話';

  @override
  String get dmVerifySafetyNumberTooltip => '驗證安全碼';

  @override
  String get dmSeenLabel => '已讀';

  @override
  String get dmMessageActionsTooltip => '訊息操作';

  @override
  String get dmRemoveAttachmentTooltip => '移除附件';

  @override
  String get dmAttachFileTooltip => '附加檔案';

  @override
  String get dmMessageHint => '訊息...';

  @override
  String get dmSendMessageTooltip => '傳送訊息';

  @override
  String get dmNoFriendsYet => '尚無好友。\n傳送好友邀請開始吧。';

  @override
  String get dmUnfriendTooltip => '取消好友';

  @override
  String get dmNoPendingRequests => '沒有待處理的好友邀請。';

  @override
  String get dmIncomingRequestsLabel => '收到的邀請';

  @override
  String get dmSentRequestsLabel => '已送出的邀請';

  @override
  String get dmAcceptTooltip => '接受';

  @override
  String get dmDeclineTooltip => '拒絕';

  @override
  String get dmPendingLabel => '待處理';

  @override
  String get dmNewMessageDialogTitle => '新增訊息';

  @override
  String get dmEnterUsernameHint => '輸入使用者名稱';

  @override
  String get dmOpenButton => '開啟';

  @override
  String dmSavedAttachment(String fileName) {
    return '已儲存 $fileName';
  }

  @override
  String get dmUnknownUser => '未知';

  @override
  String get dmEndToEndEncryptedTooltip => '端對端加密';

  @override
  String get homeContentWarningTitle => '內容警告';

  @override
  String homeContentWarningBody(String labels) {
    return '此頻道被標記為：$labels。\n\n可在「設定 > 安全性 > 內容過濾」中變更此設定。';
  }

  @override
  String get homeViewAnyway => '仍要檢視';

  @override
  String get homeCouldNotConnectVoice => '無法連線至語音。';

  @override
  String get homeCreateServer => '建立伺服器';

  @override
  String get homeJoinServer => '加入伺服器';

  @override
  String get homeRedeemCode => '兌換代碼';

  @override
  String get homeJoinServerDialogTitle => '加入伺服器';

  @override
  String get homeEnterInviteCode => '請輸入邀請代碼或網址：';

  @override
  String get homeInviteCodeHint => '例如：XK9MP2';

  @override
  String get homeJoined => '已加入！';

  @override
  String get homeInvalidInvite => '邀請代碼無效或已過期。';

  @override
  String get homeJoinButton => '加入';

  @override
  String get homeRedeemCodeDialogTitle => '兌換代碼';

  @override
  String get homeEnterBackerCode => '請輸入你的贊助者代碼或獎勵代碼：';

  @override
  String get homeRewardCodeHint => '獎勵代碼';

  @override
  String get homeCodeRedeemed => '代碼已兌換！你的獎勵已套用。';

  @override
  String get homeInvalidRedeemCode => '代碼無效、已過期或已被兌換。';

  @override
  String get homeRedeemButton => '兌換';

  @override
  String get homeAreFriends => '你們是好友';

  @override
  String get homeAddFriend => '新增好友';

  @override
  String homeFriendRequestSent(String username) {
    return '已向 $username 傳送好友邀請！';
  }

  @override
  String get homeMessageButton => '傳訊息';

  @override
  String get homeSendTip => '傳送小費';

  @override
  String get homeSwitchToServer => '切換至此伺服器';

  @override
  String get homeInvitePeople => '邀請他人';

  @override
  String get homeServerSettingsMenuItem => '伺服器設定';

  @override
  String get homeLeaveServerMenuItem => '離開伺服器';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return '要離開 $serverName 嗎？之後可透過邀請重新加入。';
  }

  @override
  String get homeLeaveButton => '離開';

  @override
  String get homeCreateAServer => '建立一個伺服器';

  @override
  String get homeServerNameHint => '伺服器名稱';

  @override
  String get homeDescribeToVisp => '改為向 Visp 描述';

  @override
  String get homeMarkAsRead => '標示為已讀';

  @override
  String get homeEditChannel => '編輯頻道';

  @override
  String get homeDeleteChannel => '刪除頻道';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return '要刪除 #$channelName 嗎？此操作無法復原。';
  }

  @override
  String get homeDeleteButton => '刪除';

  @override
  String get homeCreateChannelHere => '在此建立頻道';

  @override
  String get homeEditCategory => '編輯分類';

  @override
  String get homeDeleteCategory => '刪除分類';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return '要刪除「$categoryName」嗎？其中的頻道將變為未分類。';
  }

  @override
  String get homeReplyAction => '回覆';

  @override
  String get homeCreateThreadAction => '建立討論串';

  @override
  String get homeEditMessageAction => '編輯訊息';

  @override
  String get homeDeleteMessageAction => '刪除訊息';

  @override
  String get homePinMessageAction => '釘選訊息';

  @override
  String get homeUnpinMessageAction => '取消釘選';

  @override
  String get homeReportMessageAction => '檢舉訊息';

  @override
  String get homeReportSubmitted => '檢舉已送出。';

  @override
  String get homeAddReactionTitle => '新增表情回應';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 則討論串',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => '分類選項';

  @override
  String get homeChannelOptionsTooltip => '頻道選項';

  @override
  String get homeOpenVoiceChatTooltip => '開啟聊天';

  @override
  String get homeMarketplaceLabel => '市集';

  @override
  String get homeSelectChannelPrompt => '請選擇一個頻道';

  @override
  String get homeSearchTooltip => '搜尋';

  @override
  String get homePinnedMessagesTooltip => '釘選的訊息';

  @override
  String get homeWaitingForKey => '正在等待加密金鑰送達...';

  @override
  String get homeUnableToDecrypt => '無法解密此訊息。';

  @override
  String get homeMessageActionsTooltip => '訊息操作';

  @override
  String get homeCancelReplyTooltip => '取消回覆';

  @override
  String get homeRemoveAttachmentTooltip => '移除附件';

  @override
  String get homeAttachFileTooltip => '附加檔案';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return '傳送訊息至 #$channelName';
  }

  @override
  String get homeSendMessageTooltip => '傳送訊息';

  @override
  String get homeEditMessageTitle => '編輯訊息';

  @override
  String get homeMessageLabel => '訊息';

  @override
  String get homePinnedMessagesTitle => '釘選的訊息';

  @override
  String get homeNoPinnedMessages => '沒有釘選的訊息';

  @override
  String get homeUnpinTooltip => '取消釘選';

  @override
  String get homeCreateThreadTitle => '建立討論串';

  @override
  String get homeThreadNameHint => '討論串名稱';

  @override
  String homeThreadCreated(String name) {
    return '討論串「$name」已建立！';
  }

  @override
  String get homeCreateOrJoinTooltip => '建立或加入';

  @override
  String get homeKodaMarketplaceTooltip => 'Koda 市集';

  @override
  String get homeAdminPanelTooltip => '管理面板';

  @override
  String get homeServerSettingsTooltip => '伺服器設定';

  @override
  String get homeSettingsTooltip => '設定';

  @override
  String get homeContentWarningBadge => '內容警告';

  @override
  String get homeDirectMessagesTooltip => '私訊';

  @override
  String homeReplyingTo(String username) {
    return '正在回覆 $username';
  }

  @override
  String get homeAttachmentFallback => '附件';

  @override
  String serverConnectError(String service) {
    return '無法開始連結 $service。';
  }

  @override
  String get serverDisconnectPrintfulTitle => '要中斷 Printful 連結嗎？';

  @override
  String get serverDisconnectPrintfulBody => '重新連結之前，此伺服器將無法處理周邊商品訂單。';

  @override
  String get serverDisconnectTiltifyTitle => '要中斷 Tiltify 連結嗎？';

  @override
  String get serverDisconnectTiltifyBody => '重新連結之前，此伺服器將停止顯示其慈善活動的進度。';

  @override
  String get serverNewRoleTitle => '新增身分組';

  @override
  String get serverEditRoleTitle => '編輯身分組';

  @override
  String serverColorSwatchLabel(String hex) {
    return '顏色 $hex';
  }

  @override
  String get permViewChannels => '檢視頻道';

  @override
  String get permSendMessages => '傳送訊息';

  @override
  String get permConnectVoice => '連線語音';

  @override
  String get permManageServer => '管理伺服器';

  @override
  String get permManageChannels => '管理頻道';

  @override
  String get permManageRoles => '管理身分組';

  @override
  String get permManageMessages => '管理訊息';

  @override
  String get permKickMembers => '踢出成員';

  @override
  String get permBanMembers => '封鎖成員';

  @override
  String get permMuteMembers => '將成員靜音';

  @override
  String get permMentionEveryone => '提及 @everyone';

  @override
  String get permManageMarketplace => '管理市集';

  @override
  String get permAnnounceLive => '開播通知';

  @override
  String get permMoveMembers => '移動成員(語音)';

  @override
  String get serverRoleNameHint => '身分組名稱';

  @override
  String get serverColorLabel => '顏色';

  @override
  String get serverPermissionsLabel => '權限';

  @override
  String get serverSelfAssignableTitle => '可自助領取';

  @override
  String get serverSelfAssignableSubtitle => '成員可自行指派此身分組';

  @override
  String get serverDefaultRoleUndeletable => '預設身分組無法刪除。';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return '要刪除身分組「$roleName」嗎？';
  }

  @override
  String get serverCouldNotDeleteRole => '無法刪除該身分組。';

  @override
  String get serverMemberFallback => '成員';

  @override
  String get serverNoRolesYet => '尚無身分組。';

  @override
  String get serverRefreshStatus => '已在瀏覽器完成連結？重新整理狀態';

  @override
  String get serverPrintfulConnected => 'Printful 已連結';

  @override
  String get serverPrintfulNotConnected => 'Printful 未連結';

  @override
  String get serverPrintfulDescription =>
      '連結此伺服器的 Printful 帳戶，以處理透過 Koda 送出的周邊商品訂單。每個伺服器須各自連結自己的商店。';

  @override
  String get serverConnecting => '連結中...';

  @override
  String get serverConnectPrintful => '連結 Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify 已連結';

  @override
  String get serverTiltifyNotConnected => 'Tiltify 未連結';

  @override
  String get serverTiltifyDescription =>
      '連結此伺服器的 Tiltify 帳戶，向所有成員顯示慈善活動的即時進度。僅限唯讀 -- Koda 不會在 Tiltify 那一端發布或變更任何內容。';

  @override
  String get serverConnectTiltify => '連結 Tiltify';

  @override
  String get serverNoTiltifyCampaigns => '在此 Tiltify 帳戶中找不到任何活動。';

  @override
  String get serverPickCampaign => '選擇要顯示的活動';

  @override
  String get serverUntitledCampaign => '未命名活動';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '已籌得 $currency $raised，目標為 $goal';
  }

  @override
  String get serverViewCampaign => '檢視活動';

  @override
  String get serverRefreshButton => '重新整理';

  @override
  String get serverUploadButton => '上傳';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '已使用 $used / $limit 個欄位 -- 加成等級 $level';
  }

  @override
  String get serverNoCustomEmoji => '尚無自訂表情符號。';

  @override
  String get serverDeleteEmojiTooltip => '刪除表情符號';

  @override
  String get serverUploadEmojiTitle => '上傳表情符號';

  @override
  String get serverEmojiNameHint => '名稱（字母、數字、_）';

  @override
  String get serverChooseImage => '選擇圖片';

  @override
  String serverCurrentBoostLevel(int level) {
    return '目前加成等級：$level';
  }

  @override
  String get serverBackgroundTitle => '伺服器背景';

  @override
  String get serverBackgroundDescription => '顯示在頻道畫面後方、伺服器內所有人皆可見的自訂背景。';

  @override
  String get serverBackgroundLockedHint => '達到加成等級 4 即可解鎖自訂背景。';

  @override
  String get serverIconBorderTitle => '伺服器圖示邊框';

  @override
  String get serverIconBorderDescription => '在每位成員的伺服器清單中，此伺服器圖示周圍顯示的強調邊框。';

  @override
  String get serverIconBorderLockedHint => '達到加成等級 5 即可解鎖自訂圖示邊框。';

  @override
  String get serverBoostFromBank => '在市集的伺服器銀行中為此伺服器加成，以提升其等級。';

  @override
  String get serverMarketplaceListingLabel => '市集上架資訊';

  @override
  String get serverListInMarketplace => '於 Koda 市集上架';

  @override
  String get serverListInMarketplaceDescription =>
      '將此伺服器納入全平台的「探索」分頁，並有機會入選每週精選輪播。此設定與一般的伺服器加入可見度是分開的。';

  @override
  String get serverSocialLinkLabel => '社群／邀請連結（選填）';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => '儲存連結';

  @override
  String get serverPricingLabel => '定價';

  @override
  String get serverPrimaryCurrencyLabel => '主要貨幣';

  @override
  String get serverPrimaryCurrencyDescription => '適用於你為此伺服器設定的伺服器訂閱等級與數位商品價格。';

  @override
  String get serverPrimaryLanguageLabel => '主要語言';

  @override
  String get serverPrimaryLanguageDescription =>
      '成員以不同語言發布的訊息，會顯示一個與此設定比對的小語言徽章。';

  @override
  String get serverMarketplaceLinkSaved => '市集連結已儲存。';

  @override
  String get serverIconUpdated => '伺服器圖示已更新！';

  @override
  String get serverTemplateImported => '範本已匯入！';

  @override
  String get serverImportFromDiscord => '從 Discord 匯入';

  @override
  String get serverVispPlanLive => 'Visp 的方案已完成！';

  @override
  String get serverAskVisp => '詢問 Visp';

  @override
  String get serverAddCategoryButton => '新增分類';

  @override
  String get serverAddChannelHereTooltip => '在此新增頻道';

  @override
  String get serverRename => '重新命名';

  @override
  String get serverUncategorized => '未分類';

  @override
  String get serverAddChannel => '新增頻道';

  @override
  String get serverEditRulesContent => '編輯規則內容';

  @override
  String get serverRulesContentHint => '在此輸入你的伺服器規則...';

  @override
  String get serverRulesUpdated => '規則已更新！';

  @override
  String get serverAddRole => '新增身分組';

  @override
  String get serverDefaultRoleLabel => '預設身分組';

  @override
  String get serverManageRolesTooltip => '管理身分組';

  @override
  String get serverMutedLabel => '已靜音';

  @override
  String get serverExpandedLabel => '已展開';

  @override
  String get serverCollapsedLabel => '已摺疊';

  @override
  String get serverUnmute => '取消靜音';

  @override
  String get serverMute => '靜音';

  @override
  String get serverKick => '踢出';

  @override
  String get serverBan => '封鎖';

  @override
  String serverBannedUsersLabel(int count) {
    return '已封鎖使用者 — $count';
  }

  @override
  String get serverNoBannedUsers => '沒有已封鎖的使用者。';

  @override
  String get serverUnban => '解除封鎖';

  @override
  String get serverMemberFallbackGeneric => '此成員';

  @override
  String serverBanConfirm(String username, String serverName) {
    return '要將 $username 從 $serverName 封鎖嗎？在解除封鎖之前，他們將無法重新加入。';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return '要將 $username 從 $serverName 踢出嗎？他們可透過邀請重新加入。';
  }

  @override
  String get serverMuteDuration60Sec => '60 秒';

  @override
  String get serverMuteDuration5Min => '5 分鐘';

  @override
  String get serverMuteDuration10Min => '10 分鐘';

  @override
  String get serverMuteDuration1Hour => '1 小時';

  @override
  String get serverMuteDuration1Day => '1 天';

  @override
  String get serverMuteDuration1Week => '1 週';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return '無法對 $username 執行$action。';
  }

  @override
  String serverMuteUserTitle(String username) {
    return '將 $username 靜音';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return '無法將 $username 靜音。';
  }

  @override
  String get serverUnlockInvites => '解鎖邀請';

  @override
  String get serverInvitesUnlocked => '邀請已解鎖。';

  @override
  String get serverAuditLogDescription =>
      '第一級管理活動 -- 踢出、封鎖、靜音，以及自動洗版／突襲防護。僅包含中繼資料，絕不包含訊息內容。';

  @override
  String get serverSystemActor => '系統';

  @override
  String get serverActionKicked => '踢出了';

  @override
  String get serverActionBanned => '封鎖了';

  @override
  String get serverActionUnbanned => '解除封鎖了';

  @override
  String get serverActionMuted => '靜音了';

  @override
  String get serverActionUnmuted => '取消靜音了';

  @override
  String get serverActionFloodDetected => '因洗版被自動靜音';

  @override
  String get serverActionRaidLockdownEnabled => '鎖定了邀請（突襲防護）';

  @override
  String get serverActionRaidLockdownDisabled => '解鎖了邀請';

  @override
  String get serverActionMoved => '移動了';

  @override
  String get serverUnknownAction => '未知操作';

  @override
  String get serverNoModerationActivity => '尚無管理活動。';

  @override
  String get serverReportsDescription => '此伺服器成員檢舉的訊息 -- 為檢舉者本人已解密的副本，因檢舉而揭露。';

  @override
  String get serverNoPendingReports => '沒有待處理的檢舉。';

  @override
  String get serverReportReasonOther => '其他';

  @override
  String get serverReportStatusActioned => '已處理';

  @override
  String get serverReportStatusDismissed => '已駁回';

  @override
  String get serverResolvedLabel => '已解決';

  @override
  String serverReportedBy(String reporter, String target) {
    return '由 $reporter 檢舉 -- 傳送者為 $target';
  }

  @override
  String serverReportNote(String note) {
    return '備註：$note';
  }

  @override
  String get serverDismissButton => '駁回';

  @override
  String get serverMarkActioned => '標示為已處理';

  @override
  String get serverCreateInvite => '建立邀請';

  @override
  String get serverInviteCreatedTitle => '邀請已建立';

  @override
  String get serverNoActiveInvites => '沒有有效邀請';

  @override
  String serverUsesLabel(String uses) {
    return '使用次數：$uses';
  }

  @override
  String get serverDeleteInviteTooltip => '刪除邀請';

  @override
  String get serverChangeIconLabel => '變更伺服器圖示';

  @override
  String get serverFallbackName => '伺服器';

  @override
  String serverSettingsTitle(String serverName) {
    return '$serverName 設定';
  }

  @override
  String get serverTabChannels => '頻道';

  @override
  String get serverTabRoles => '身分組';

  @override
  String get serverTabMembers => '成員';

  @override
  String get serverTabInvites => '邀請';

  @override
  String get serverTabMerch => '周邊商品';

  @override
  String get serverTabEmoji => '表情符號';

  @override
  String get serverTabCustomize => '自訂';

  @override
  String get serverTabAuditLog => '稽核紀錄';

  @override
  String get serverTabReports => '檢舉';

  @override
  String get serverTabThresholdMod => '門檻管理';

  @override
  String get serverTabCharity => '慈善';

  @override
  String get homeCustomEmojiFallback => '自訂表情符號';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 則表情回應',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted => '，你已回應，啟用以移除';

  @override
  String get homeReactionActivateToAdd => '，啟用以新增';

  @override
  String get homeAddReactionLabel => '新增表情回應';

  @override
  String homeViewProfile(String username) {
    return '檢視 $username 的個人檔案';
  }

  @override
  String get homeMoveToVoiceChannel => '移動到語音頻道…';

  @override
  String get homeMoveVoiceChannelDialogTitle => '選擇一個語音頻道';

  @override
  String get homeNoOtherVoiceChannels => '沒有其他語音頻道';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '已將 $username 移動到 $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return '無法移動 $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return '你已被移動到 $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return '加入 $channel 以通話';
  }

  @override
  String get adminPanelTitle => '管理面板';

  @override
  String get adminTabBackerCodes => '贊助者代碼';

  @override
  String get adminTabUsers => '使用者';

  @override
  String get adminTabDmReports => '私訊檢舉';

  @override
  String get adminTabSpamFlags => '垃圾訊息標記';

  @override
  String get adminTabWiki => '百科';

  @override
  String get adminTabBoosts => '加成';

  @override
  String get adminCreateBackerCodeTitle => '建立贊助者代碼';

  @override
  String get adminCodeHint => '代碼（留空以自動產生）';

  @override
  String get adminNoteHint => '備註（例如「Kickstarter Tier 2」）';

  @override
  String get adminFlagsJsonHint =>
      '以 JSON 格式填寫標記，例如 \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint => '最大使用次數（留空表示無限制）';

  @override
  String get adminCodeCreatedTitle => '代碼已建立';

  @override
  String get adminCodeLabel => '代碼：';

  @override
  String get adminCopyCodeTooltip => '複製代碼';

  @override
  String adminFlagsValue(String flags) {
    return '標記：$flags';
  }

  @override
  String get adminBackerCodesHeader => '贊助者與獎勵代碼';

  @override
  String get adminNewCodeButton => '新增代碼';

  @override
  String get adminNoCodesYet => '尚無代碼';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '已使用 $uses 次';
  }

  @override
  String get adminSearchUsersHint => '依使用者名稱搜尋使用者...';

  @override
  String get adminSearchUsersPrompt => '請在上方搜尋使用者';

  @override
  String get adminNoDmReports => '尚無私訊檢舉。';

  @override
  String get adminResolvedLabel => '已解決';

  @override
  String get adminReasonOther => '其他';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return '檢舉人：$reporterId\n已揭露的寄件者：$targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return '備註：$note';
  }

  @override
  String get adminDismissButton => '駁回';

  @override
  String get adminMarkActionedButton => '標記為已處理';

  @override
  String get adminStatusActioned => '已處理';

  @override
  String get adminStatusDismissed => '已駁回';

  @override
  String get adminNoSpamFlags => '尚無垃圾訊息標記。';

  @override
  String get adminFlagMassDmSpam => '大量私訊騷擾';

  @override
  String get adminFlagRaidLockdown => '突襲鎖定';

  @override
  String get adminFlagBotBehavior => '疑似機器人行為';

  @override
  String get adminFlagChannelFlooding => '洗版';

  @override
  String get adminAutoEscalatedBadge => '自動升級';

  @override
  String adminConfidenceLabel(String score, String label) {
    return '信心度：$score%（$label）';
  }

  @override
  String adminFlagUserLine(String userId) {
    return '使用者：$userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return '伺服器：$serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$totalJoiners 位加入者中有 $mutedCount 位仍被靜音';
  }

  @override
  String get adminNoJoinersMuted => '目前沒有加入者被靜音';

  @override
  String adminRestrictedUntil(String until) {
    return '目前限制至 $until';
  }

  @override
  String get adminNotCurrentlyRestricted => '目前未受限制';

  @override
  String get adminDismissUndoButton => '駁回並復原';

  @override
  String get adminConfirmRestrictButton => '確認並限制';

  @override
  String get adminDeleteArticleTitle => '刪除文章？';

  @override
  String adminDeleteArticleBody(String title) {
    return '「$title」將從 Visp 的知識庫中移除。';
  }

  @override
  String get adminNewArticleTitle => '新增文章';

  @override
  String get adminEditArticleTitle => '編輯文章';

  @override
  String get adminArticleTitleHint => '標題';

  @override
  String get adminArticleContentHint => '文章內容（Markdown）';

  @override
  String get adminWikiArticlesHeader => '百科文章';

  @override
  String get adminNoArticlesYet => '尚無文章';

  @override
  String get adminEditArticleTooltip => '編輯文章';

  @override
  String get adminDeleteArticleTooltip => '刪除文章';

  @override
  String get adminSearchServersHint => '依名稱搜尋伺服器...';

  @override
  String get adminSearchServersPrompt => '請在上方搜尋伺服器';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return '為 $serverName 授予加成';
  }

  @override
  String get adminNumBoostsHint => '加成數量';

  @override
  String get adminGrantButton => '授予';

  @override
  String get adminPositiveNumberError => '請輸入正整數。';

  @override
  String get adminGrantBoostsFailed => '授予加成失敗。';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已為 $serverName 授予 $count 個加成 -- 目前等級為 $level（$activeCount 個生效中）。',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count 位成員';
  }

  @override
  String get adminGrantBoostsButtonLabel => '授予加成';

  @override
  String get parentalDashboardTitle => '家庭';

  @override
  String get parentalDashboardCreateChildTitle => '建立兒童帳號';

  @override
  String get parentalDashboardUsernameHint => '使用者名稱';

  @override
  String get parentalDashboardEmailHint => '電子郵件';

  @override
  String get parentalDashboardPasswordHint => '密碼';

  @override
  String get parentalDashboardCreateChildExplanation =>
      '這將建立一個完全受監護的帳號：已標記的頻道會被封鎖，你可以設定允許使用的時段，並檢視（但無法閱讀內容）他們的好友與伺服器。';

  @override
  String get parentalDashboardValidationError => '需要使用者名稱、電子郵件，以及至少 8 個字元的密碼。';

  @override
  String get parentalDashboardCreateChildFailed =>
      '無法建立兒童帳號 -- 使用者名稱／電子郵件可能已被使用。';

  @override
  String get parentalDashboardCreatingLabel => '建立中...';

  @override
  String get parentalDashboardNoChildren => '尚未連結任何帳號。';

  @override
  String get parentalDashboardSupervisedLabel => '受監護帳號';

  @override
  String get parentalDashboardUnknownUser => '未知';

  @override
  String get childDetailFallbackTitle => '兒童帳號';

  @override
  String get childDetailTabFriends => '好友';

  @override
  String get childDetailTabServers => '伺服器';

  @override
  String get childDetailTabSchedule => '時間表';

  @override
  String get childDetailTabOverride => '臨時許可';

  @override
  String get childDetailNoFriends => '尚無好友。';

  @override
  String get childDetailUnknownUser => '未知';

  @override
  String get childDetailRemoveFriendTooltip => '移除好友';

  @override
  String get childDetailNoServers => '尚未加入任何伺服器。';

  @override
  String childDetailMemberCount(int count) {
    return '$count 位成員';
  }

  @override
  String get childDetailRemoveServerTooltip => '從伺服器中移除';

  @override
  String get childDetailRestrictAccessTitle => '限制存取時段';

  @override
  String get childDetailRestrictAccessSubtitle => '關閉表示隨時都能不受限制地存取';

  @override
  String get childDetailTimezoneLabel => '時區';

  @override
  String get childDetailMonday => '星期一';

  @override
  String get childDetailTuesday => '星期二';

  @override
  String get childDetailWednesday => '星期三';

  @override
  String get childDetailThursday => '星期四';

  @override
  String get childDetailFriday => '星期五';

  @override
  String get childDetailSaturday => '星期六';

  @override
  String get childDetailSunday => '星期日';

  @override
  String get childDetailNoAccessLabel => '禁止存取';

  @override
  String get childDetailToLabel => '至';

  @override
  String get childDetailSavingLabel => '儲存中...';

  @override
  String get childDetailSaveScheduleButton => '儲存時間表';

  @override
  String get childDetailScheduleSaved => '時間表已儲存。';

  @override
  String get childDetailOverrideExplanation =>
      '在正常時間表之外臨時授予存取權限 -- 適合單次例外情況，而不必變更每週的時間表。';

  @override
  String get childDetailReasonHint => '原因（選填）';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes 分鐘';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours 小時';
  }

  @override
  String get childDetailRevokeOverrideButton => '撤銷目前的臨時許可';

  @override
  String get childDetailAccessGranted => '已授予臨時存取權限。';

  @override
  String get childDetailOverrideRevoked => '臨時許可已撤銷。';

  @override
  String get digitalGoodsTitle => '數位商品';

  @override
  String get digitalGoodsMyProductsTitle => '我的商品';

  @override
  String get digitalGoodsManageProductsTooltip => '管理此伺服器的商品';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => '切換至瀏覽';

  @override
  String get digitalGoodsCreateProductTooltip => '建立商品';

  @override
  String get digitalGoodsBrowseTab => '瀏覽';

  @override
  String get digitalGoodsMyListingsTab => '我的上架商品';

  @override
  String get digitalGoodsMyPurchasesTab => '我的購買紀錄';

  @override
  String get digitalGoodsNoProductsYet => '尚無商品';

  @override
  String get digitalGoodsNoProductsAvailable => '目前沒有可用商品';

  @override
  String get digitalGoodsCreateFirstProductHint => '建立你的第一個商品以開始銷售';

  @override
  String get digitalGoodsCheckBackLater => '數位商品請稍後再查看';

  @override
  String get digitalGoodsCreateProductButton => '建立商品';

  @override
  String get digitalGoodsLicenseKeyBadge => '授權金鑰';

  @override
  String get digitalGoodsFileBadge => '檔案';

  @override
  String get digitalGoodsAllServersBadge => '所有伺服器';

  @override
  String get digitalGoodsFreeForYou => '對你免費';

  @override
  String get digitalGoodsFreeLabel => '免費';

  @override
  String digitalGoodsSoldCount(int count) {
    return '已售出 $count 件';
  }

  @override
  String get digitalGoodsKeysButton => '金鑰';

  @override
  String get digitalGoodsGetForFree => '免費取得';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return '以 $price 購買';
  }

  @override
  String get digitalGoodsNoPurchasesYet => '尚無購買紀錄';

  @override
  String get digitalGoodsUnknownProduct => '未知商品';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return '購買於 $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => '複製金鑰';

  @override
  String get digitalGoodsLicenseKeyCopied => '授權金鑰已複製！';

  @override
  String digitalGoodsExpiresOn(String date) {
    return '$date 到期';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => '你的授權金鑰';

  @override
  String get digitalGoodsCopyKeyButton => '複製金鑰';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      '無法開始結帳 -- 此創作者可能尚未連結 Stripe。';

  @override
  String get digitalGoodsPurchaseComplete => '購買完成！可在「我的購買紀錄」中查看。';

  @override
  String get digitalGoodsPurchasePending => '仍在等待該筆付款完成 -- 完成後將顯示在「我的購買紀錄」中。';

  @override
  String get digitalGoodsCreateProductTitle => '建立商品';

  @override
  String get digitalGoodsEditProductTitle => '編輯商品';

  @override
  String get digitalGoodsProductTitleHint => '商品標題';

  @override
  String get digitalGoodsDescriptionHint => '說明（選填）';

  @override
  String get digitalGoodsPriceHint => '價格（美元，留空表示免費）';

  @override
  String get digitalGoodsProductTypeLabel => '商品類型';

  @override
  String get digitalGoodsFileDownloadOption => '檔案下載';

  @override
  String get digitalGoodsLicenseKeyOption => '授權金鑰';

  @override
  String get digitalGoodsAvailabilityLabel => '可見範圍';

  @override
  String get digitalGoodsThisServerOnlyOption => '僅限此伺服器';

  @override
  String get digitalGoodsAllKodaServersOption => '所有 Koda 伺服器';

  @override
  String get digitalGoodsAfterCreatingKeysHint => '建立後，使用「金鑰」按鈕上傳你的授權金鑰。';

  @override
  String get digitalGoodsProductFileLabel => '商品檔案';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName（${sizeMb}MB）';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => '移除檔案';

  @override
  String get digitalGoodsUploadingLabel => '上傳中...';

  @override
  String get digitalGoodsChooseFileButton => '選擇檔案';

  @override
  String get digitalGoodsReplaceFileButton => '取代檔案';

  @override
  String get digitalGoodsChooseFileBeforeSaving => '儲存前請為此商品選擇一個檔案。';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => '上傳授權金鑰';

  @override
  String get digitalGoodsPasteKeysHint => '每行貼上一個金鑰：';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => '上傳金鑰';

  @override
  String get digitalGoodsLicenseKeysUploaded => '授權金鑰已上傳！';

  @override
  String get serverSubscriptionManageTitle => '管理訂閱';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return '$serverName 訂閱';
  }

  @override
  String get serverSubscriptionAddTierTooltip => '新增等級';

  @override
  String get serverSubscriptionNoTiersYet => '尚無訂閱等級';

  @override
  String get serverSubscriptionCreateUpTo3Tiers => '為你的社群建立最多 3 個等級';

  @override
  String get serverSubscriptionCreateFirstTierButton => '建立第一個等級';

  @override
  String get serverSubscriptionShowSubscriberCounts => '顯示訂閱者人數';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/月';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位活躍訂閱者',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned => '自動指派身分組';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '市集 $discount% 折扣';
  }

  @override
  String get serverSubscriptionNoTiersMember => '此伺服器沒有訂閱等級';

  @override
  String get serverSubscriptionActiveSubscriberBadge => '活躍訂閱者';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return '$date 到期';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk => '專屬訂閱者身分組';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return '市集購買 $discount% 折扣';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk => '僅限訂閱者的頻道';

  @override
  String get serverSubscriptionCurrentlySubscribed => '已訂閱';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return '以 $price/月 訂閱';
  }

  @override
  String get serverSubscriptionCreateTierTitle => '建立等級';

  @override
  String get serverSubscriptionEditTierTitle => '編輯等級';

  @override
  String get serverSubscriptionTierNameHint => '等級名稱（例如 Fan、Supporter、VIP）';

  @override
  String get serverSubscriptionDescriptionHint => '說明（選填）';

  @override
  String get serverSubscriptionPriceHint => '每月價格（美元）';

  @override
  String get serverSubscriptionDiscountLabel => '市集折扣百分比';

  @override
  String get serverSubscriptionPositionLabel => '位置';

  @override
  String serverSubscriptionTierOption(int position) {
    return '等級 $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel => '訂閱時授予的身分組 — 選填';

  @override
  String get serverSubscriptionRoleFallback => '身分組';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      '成員訂閱的瞬間會自動授予，訂閱到期的瞬間會自動移除。';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      '等級已建立 -- 請在市集 → 創作者中連結 Stripe，成員才能訂閱此等級。';

  @override
  String get serverSubscriptionDeleteTierTitle => '刪除等級';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return '刪除「$tierName」嗎？現有訂閱者將保留存取權限直到到期為止。';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return '訂閱 $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel => '月度訂閱';

  @override
  String get serverSubscriptionServerBankEarnsLabel => '伺服器銀行獲得';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points 點';
  }

  @override
  String get serverSubscriptionPaymentSecureNote => '付款由 Stripe 安全處理';

  @override
  String get serverSubscriptionSubscribeButton => '訂閱';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      '無法開始結帳 -- 此伺服器的擁有者可能尚未連結 Stripe。';

  @override
  String get serverSubscriptionSubscribed => '已訂閱！';

  @override
  String get serverSubscriptionSubscriptionPending => '仍在等待該筆付款完成 -- 完成後將啟用。';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return '給 $username 小費';
  }

  @override
  String get tipDialogSelectAmountLabel => '選擇金額';

  @override
  String get tipDialogMessageHint => '新增訊息（選填）';

  @override
  String get tipDialogYouPayLabel => '你支付';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username 收到';
  }

  @override
  String get tipDialogSendTipButton => '傳送小費';

  @override
  String get tipDialogFailedToSendTip => '小費傳送失敗。創作者可能尚未連結 Stripe。';

  @override
  String get tipDialogCouldNotStartCheckout => '無法開始結帳。請稍後再試。';

  @override
  String get tipDialogTipSent => '小費已傳送！';

  @override
  String get tipDialogTipPending => '仍在等待該筆付款完成 -- 完成後將會入帳。';

  @override
  String get tipDialogUnknownUser => '未知';

  @override
  String get marketplaceTitle => '市集';

  @override
  String get marketplaceCreatorPayoutsTitle => '創作者收款';

  @override
  String get marketplaceReceiveTipsSubtitle => '透過 Stripe 直接接收小費';

  @override
  String get marketplaceTabServerBank => '伺服器銀行';

  @override
  String get marketplaceTabDigitalGoods => '數位商品';

  @override
  String get marketplaceTabMerch => '周邊商品';

  @override
  String get marketplaceTabSubscription => '訂閱';

  @override
  String get marketplaceTabRevenue => '收益';

  @override
  String get marketplaceSelectServerSubscription => '選擇一個伺服器以檢視其訂閱';

  @override
  String get marketplaceSelectServerBank => '選擇一個伺服器以檢視其銀行';

  @override
  String get marketplaceSelectServerRevenue => '選擇一個伺服器以檢視其收益';

  @override
  String get marketplaceStripeAccountStatus => 'Stripe 帳戶';

  @override
  String get marketplaceOnboardingCompleteStatus => '引導設定已完成';

  @override
  String get marketplaceAcceptingPaymentsStatus => '正在接受付款';

  @override
  String get marketplaceConnectStripeButton => '連結 Stripe 帳戶';

  @override
  String get marketplaceCompleteStripeOnboardingButton => '完成 Stripe 引導設定';

  @override
  String get marketplaceRefreshStatusButton => '重新整理狀態';

  @override
  String get marketplaceReadyToReceiveTips => '你已準備好接收小費！';

  @override
  String get marketplaceHowItWorksTitle => '運作方式';

  @override
  String get marketplaceHowItWorksStep1 => '連結你的 Stripe 帳戶';

  @override
  String get marketplaceHowItWorksStep2 => '完成身分驗證';

  @override
  String get marketplaceHowItWorksStep3 => '直接將小費收入你的銀行帳戶';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda 收取 5% 的處理費。該費用將以點數形式計入你伺服器的銀行。';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      '只有伺服器擁有者或擁有「管理市集」權限的人才能檢視伺服器銀行。';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName 已獲得加成！';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit 個自訂表情符號欄位';
  }

  @override
  String get marketplaceServerFallback => '伺服器';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance 點';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount 活躍度';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      '點數來自此伺服器小費與訂閱所收取的 5% 處理費。使用點數解鎖伺服器升級項目。';

  @override
  String get marketplaceServerBoostsTitle => '伺服器加成';

  @override
  String marketplaceLevelLabel(int level) {
    return '等級 $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個生效中的加成',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: '還差 $more 個加成即可達到等級 $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix => '，並解鎖自訂伺服器背景';

  @override
  String get marketplaceUnlockIconBorderSuffix => '，並解鎖自訂伺服器圖示邊框';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你有 $count 個可用的加成代幣。',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      '加成代幣來自 Pulse 訂閱（每月 1 個）。在訂閱分頁中訂閱即可獲得。';

  @override
  String get marketplaceBoostingLabel => '加成中...';

  @override
  String get marketplaceBoostThisServerButton => '為此伺服器加成';

  @override
  String get marketplaceComingSoonUpgradesTitle => '即將推出 — 伺服器升級';

  @override
  String get marketplaceSpendPointsList =>
      '使用伺服器銀行點數兌換：\n• 自訂伺服器網域\n• 提高成員上限\n• 優先支援\n• 專屬伺服器徽章';

  @override
  String get marketplaceSourceTip => '小費';

  @override
  String get marketplaceSourceSubscription => 'Koda 訂閱';

  @override
  String get marketplaceSourceServerSubscription => '伺服器訂閱';

  @override
  String get marketplaceSourceDigitalProduct => '數位商品';

  @override
  String get marketplaceSourceStageTicket => '舞台活動門票';

  @override
  String get marketplaceSourcePrintfulOrder => '周邊訂單';

  @override
  String get marketplaceJustNow => '剛剛';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return '$minutes 分鐘前';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return '$hours 小時前';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return '$days 天前';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue => '只有能夠管理市集的成員才能檢視此伺服器的收益。';

  @override
  String get marketplaceBalanceLabel => '餘額';

  @override
  String get marketplaceLifetimeEarnedLabel => '累計收益';

  @override
  String get marketplaceLast30DaysTitle => '最近 30 天';

  @override
  String get marketplaceRevenueBySourceTitle => '依來源劃分的收益';

  @override
  String get marketplaceNoRevenueYet => '尚無收益。';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 筆交易',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => '最近交易';

  @override
  String get marketplaceNoTransactionsYet => '尚無交易。';

  @override
  String get marketplaceNoActivityYet => '尚無活動';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date：$amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已從 Printful 同步 $count 件商品',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed => '無法與 Printful 同步 -- 請在周邊商品設定中檢查連結狀態。';

  @override
  String get printfulMerchSelectServer => '選擇一個伺服器以檢視其周邊商品';

  @override
  String get printfulMerchManageCatalogTitle => '管理周邊商品目錄';

  @override
  String get printfulMerchTitle => '周邊商品';

  @override
  String get printfulMerchSyncingLabel => '同步中...';

  @override
  String get printfulMerchSyncCatalogButton => '同步目錄';

  @override
  String get printfulMerchSwitchToBrowseTooltip => '切換至瀏覽';

  @override
  String get printfulMerchManageTooltip => '管理此伺服器的周邊商品';

  @override
  String get printfulMerchNothingSyncedYet => '尚未同步任何項目';

  @override
  String get printfulMerchNoMerchAvailable => '目前沒有可用的周邊商品';

  @override
  String get printfulMerchSyncHint => '同步你的 Printful 商店以匯入商品目錄';

  @override
  String get printfulMerchCheckBackLater => '此伺服器的周邊商品請稍後再查看';

  @override
  String get printfulMerchOutOfStock => '缺貨';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$price 起 • $count 個選項',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => '查看';

  @override
  String get printfulMerchCartTooltip => '購物車';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '已將 $productName 加入購物車';
  }

  @override
  String get printfulMerchQuantityLabel => '數量';

  @override
  String get printfulMerchDecreaseQuantityTooltip => '減少數量';

  @override
  String get printfulMerchIncreaseQuantityTooltip => '增加數量';

  @override
  String get printfulMerchAddToCartButton => '加入購物車';

  @override
  String get printfulMerchOptionLabel => '選項';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => '款式';

  @override
  String get printfulMerchSizeLabel => '尺寸';

  @override
  String get printfulMerchYourCartTitle => '你的購物車';

  @override
  String get printfulMerchCartEmpty => '購物車是空的。';

  @override
  String get printfulMerchSubtotalLabel => '小計';

  @override
  String get printfulMerchCheckoutLabel => '結帳';

  @override
  String get printfulMerchRemoveFromCartTooltip => '從購物車中移除';

  @override
  String get printfulMerchFillShippingAddressFirst => '請先填寫收件地址。';

  @override
  String get printfulMerchCouldNotGetShippingRates => '無法取得該地址的運費。';

  @override
  String get printfulMerchCouldNotStartCheckout => '無法開始結帳。請稍後再試。';

  @override
  String get printfulMerchOrderPlaced => '訂單已送出！';

  @override
  String get printfulMerchOrderPending => '仍在等待該筆付款完成 -- 完成後將會下單。';

  @override
  String get printfulMerchShippingSpeedLabel => '配送速度';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max 個工作天';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => '取得運費報價';

  @override
  String get printfulMerchPayButton => '付款';

  @override
  String get kodaMarketplaceTitle => 'Koda 市集';

  @override
  String get kodaMarketplaceTabSubscriptions => '訂閱';

  @override
  String get kodaMarketplaceTabBoosts => '加成';

  @override
  String get kodaMarketplaceTabDiscover => '探索';

  @override
  String get kodaMarketplaceTierFreeName => '免費';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return '$date 到期';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks => '升級以解鎖專屬特權';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你有 $count 個可用的加成代幣',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint => '你可以在所在任何伺服器的伺服器銀行分頁中，將代幣贈送給該伺服器';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => '自訂頭像框';

  @override
  String get kodaMarketplaceSparkPerkBadge => '個人檔案上的 Spark 徽章';

  @override
  String get kodaMarketplaceSparkPerkFileLimit => '檔案上傳上限提升（50MB）';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality => '優先語音品質';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => '包含 Spark 的所有權益';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => '動態頭像框';

  @override
  String get kodaMarketplacePulsePerkBadge => '個人檔案上的 Pulse 徽章';

  @override
  String get kodaMarketplacePulsePerkFileLimit => '檔案上傳上限 100MB';

  @override
  String get kodaMarketplacePulsePerkBoostToken => '每月 1 個伺服器加成代幣';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/月';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => '目前方案';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return '取得 $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return '贈送 $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return '贈送 $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return '訂閱 $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel => '贈送對象使用者名稱：';

  @override
  String get kodaMarketplaceUsernameHint => '使用者名稱';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => '訂閱';

  @override
  String get kodaMarketplaceTotalLabel => '總計';

  @override
  String get kodaMarketplacePaymentSecureNote => '付款由 Stripe 安全處理';

  @override
  String get kodaMarketplaceProceedToPaymentButton => '前往付款';

  @override
  String get kodaMarketplaceUserNotFound => '找不到使用者';

  @override
  String get kodaMarketplaceCouldNotStartCheckout => '無法開始結帳。請稍後再試。';

  @override
  String get kodaMarketplaceSubscriptionActive => '訂閱已生效！';

  @override
  String get kodaMarketplaceSubscriptionPending => '仍在等待該筆付款完成 -- 完成後將啟用。';

  @override
  String get kodaMarketplaceBoostPurchased => '加成購買成功！';

  @override
  String get kodaMarketplaceBoostPending => '仍在等待該筆付款完成 -- 完成後即可使用。';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count 個可用';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => '購買加成';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      '這是一次性購買 -- Pulse 訂閱者每次續訂還可獲得 1 個免費代幣，若你經常加成，訂閱會更划算。';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return '購買加成 -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      '目前還沒有伺服器加入 Koda 市集。伺服器擁有者可以在其伺服器的自訂設定中開啟此功能。';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => '本週精選';

  @override
  String get kodaMarketplaceAllListedServersHeader => '所有已上架伺服器';

  @override
  String get kodaMarketplaceServerFallback => '伺服器';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位成員',
    );
    return '$_temp0';
  }

  @override
  String get calendarFallbackTitle => '行事曆';

  @override
  String get calendarAskVispTooltip => '詢問 Visp';

  @override
  String get calendarCreateEventTooltip => '建立活動';

  @override
  String get calendarPreviousMonthTooltip => '上個月';

  @override
  String get calendarNextMonthTooltip => '下個月';

  @override
  String get calendarTodayButton => '今天';

  @override
  String get calendarWeekdaySun => '日';

  @override
  String get calendarWeekdayMon => '一';

  @override
  String get calendarWeekdayTue => '二';

  @override
  String get calendarWeekdayWed => '三';

  @override
  String get calendarWeekdayThu => '四';

  @override
  String get calendarWeekdayFri => '五';

  @override
  String get calendarWeekdaySat => '六';

  @override
  String get calendarTodaySuffix => '，今天';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '，$count 個活動',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => '選擇一天';

  @override
  String get calendarNoEvents => '沒有活動';

  @override
  String get calendarSubscribeTooltip => '訂閱';

  @override
  String get calendarUnsubscribeTooltip => '取消訂閱';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return '重複：$recurrence';
  }

  @override
  String get calendarTicketOwned => '已持有票券';

  @override
  String calendarTicketPrice(String price) {
    return '$price 票券';
  }

  @override
  String get calendarDeleteEventTitle => '刪除活動';

  @override
  String calendarDeleteEventConfirm(String title) {
    return '刪除「$title」嗎？此操作無法復原。';
  }

  @override
  String get calendarEditEventTitle => '編輯活動';

  @override
  String get calendarCreateEventTitle => '建立活動';

  @override
  String get calendarEventTitleHint => '活動標題';

  @override
  String get calendarDescriptionHint => '說明（選填）';

  @override
  String get calendarLocationHint => '地點（選填）';

  @override
  String calendarStartLabel(String timezone) {
    return '開始（$timezone）';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return '開始日期與時間，$formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return '結束 — 選填（$timezone）';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return '結束日期與時間，$formatted';
  }

  @override
  String get calendarNotSetLabel => '未設定';

  @override
  String get calendarTapToSetEndTime => '點按以設定結束時間';

  @override
  String get calendarRecurrenceLabel => '重複';

  @override
  String get calendarRecurrenceNone => '不重複';

  @override
  String get calendarRecurrenceDaily => '每天';

  @override
  String get calendarRecurrenceWeekly => '每週';

  @override
  String get calendarRecurrenceMonthly => '每月';

  @override
  String get calendarColorLabel => '顏色';

  @override
  String calendarColorSwatchLabel(String hex) {
    return '顏色 $hex';
  }

  @override
  String get calendarTicketPriceLabel => '票券價格 — 選填';

  @override
  String get calendarLinkStageChannelLabel => '連結舞台頻道 — 選填';

  @override
  String get calendarStageChannelFallback => '舞台';

  @override
  String get discordImportFetchError => '無法取得範本。';

  @override
  String get discordImportApplyError => '套用範本失敗，請再試一次。';

  @override
  String get discordImportTitle => '匯入 Discord 範本';

  @override
  String get discordImportDescription =>
      '貼上 discord.new 連結或範本代碼，即可將身分組、分類和頻道匯入此伺服器。';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 或範本代碼';

  @override
  String get discordImportPreviewButton => '預覽';

  @override
  String get discordImportTemplateFallback => '範本';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個身分組',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個分類',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個頻道',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel => '取代現有結構';

  @override
  String get discordImportReplaceWarning => '所有現有的頻道、分類與身分組都將被永久刪除。';

  @override
  String get discordImportAddDescription => '範本將被加入你現有的伺服器結構中。';

  @override
  String get discordImportReplaceConfirmTitle => '要取代伺服器結構嗎？';

  @override
  String get discordImportReplaceConfirmBody =>
      '這將在匯入前永久刪除所有現有的頻道、分類與身分組。此操作無法復原。';

  @override
  String get discordImportYesReplace => '是，取代';

  @override
  String get discordImportReplaceAndImportButton => '取代並匯入範本';

  @override
  String get discordImportAddToServerButton => '將範本加入伺服器';

  @override
  String get thresholdModConfigureTitle => '設定門檻管理';

  @override
  String get thresholdModConfigureExplanation =>
      '選擇受信任的管理員，以及在解密頻道歷史紀錄的一個紀元之前需要多少人同意。即使是你，也無法單獨持有金鑰 -- 只有當你也在這份名單中時才是例外。';

  @override
  String get thresholdModThresholdLabel => '門檻：';

  @override
  String get thresholdModDecreaseThresholdTooltip => '減少門檻';

  @override
  String get thresholdModIncreaseThresholdTooltip => '增加門檻';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '共 $count 位管理員中',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle => '請求門檻解密';

  @override
  String get thresholdModChannelLabel => '頻道';

  @override
  String get thresholdModReasonHint => '原因 -- 將顯示給每位指定管理員';

  @override
  String get thresholdModRequestButton => '請求';

  @override
  String get thresholdModShareRelayed => '份額已轉發給請求者。';

  @override
  String get thresholdModNotEnoughShares => '目前轉發的份額還不夠 -- 請等更多管理員轉發後再試一次。';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 則訊息',
    );
    return '紀元 $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages => '此紀元內沒有可解密的訊息。';

  @override
  String get thresholdModExplanation =>
      '真正解密頻道的歷史紀錄，需要多位指定管理員主動一致同意 -- 絕不會由一人單獨完成，即使是伺服器擁有者也不例外。每次只會解鎖整整一個紀元（自上次成員異動以來傳送的所有內容），絕不會只解鎖單一則訊息。';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return '已啟用 -- $count 位管理員，門檻 $threshold';
  }

  @override
  String get thresholdModNotConfigured => '尚未設定';

  @override
  String get thresholdModReconfigureButton => '重新設定';

  @override
  String get thresholdModEnableButton => '啟用';

  @override
  String get thresholdModNotEnabledForServer => '此伺服器尚未啟用門檻管理。';

  @override
  String get thresholdModEnabledNotDesignated => '此伺服器已啟用此功能。你並非指定管理員之一。';

  @override
  String get thresholdModRequestsLabel => '請求';

  @override
  String get thresholdModRequestDecryptButton => '請求解密';

  @override
  String get thresholdModNoActiveRequests => '目前沒有進行中的請求。';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- 紀元 $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => '待處理';

  @override
  String get thresholdModStatusApproved => '已核准';

  @override
  String get thresholdModApproveButton => '核准';

  @override
  String get thresholdModRelayShareButton => '轉發我的份額';

  @override
  String get thresholdModTryReconstructButton => '嘗試重建';

  @override
  String get roleSelectNoRolesAvailable => '沒有可自行指派的身分組。';

  @override
  String get roleSelectInstructions => '選擇你想要的身分組。點按某個身分組即可新增或移除。';

  @override
  String get rulesScreenAcceptError => '無法接受規則，請再試一次。';

  @override
  String get rulesScreenSubtitle => '伺服器規則';

  @override
  String get rulesScreenScrollToRead => '向下捲動以閱讀所有規則';

  @override
  String get rulesScreenAcceptDisclaimer =>
      '點擊「接受」即表示你同意遵守這些規則。\n違反規則可能導致你被移出伺服器。';

  @override
  String get rulesScreenAcceptButton => '我接受規則';

  @override
  String get rulesScreenReadAllToContinue => '請先閱讀所有規則才能繼續';

  @override
  String get galleryNewPostTitle => '新貼文';

  @override
  String get galleryChooseFileButton => '選擇檔案';

  @override
  String get galleryOrDivider => '或';

  @override
  String get galleryPasteUrlHint => '貼上圖片／影片網址';

  @override
  String get galleryTypeLabel => '類型';

  @override
  String get galleryImageOption => '圖片';

  @override
  String get galleryVideoOption => '影片';

  @override
  String get galleryCaptionHint => '說明文字（選填）';

  @override
  String get galleryPostButton => '發佈';

  @override
  String get galleryNewCollectionTitle => '新增收藏集';

  @override
  String get galleryCollectionNameHint => '收藏集名稱';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return '刪除「$collectionName」嗎？其中的貼文將變為未分類狀態。';
  }

  @override
  String get galleryFeedTab => '動態';

  @override
  String get galleryCollectionsTab => '收藏集';

  @override
  String get galleryNoPostsYet => '尚無貼文';

  @override
  String get galleryNoCollectionsYet => '尚無收藏集';

  @override
  String get gallerySelectACollection => '請選擇一個收藏集';

  @override
  String get galleryNoPostsInCollection => '此收藏集中沒有貼文';

  @override
  String get galleryAddPostButton => '新增貼文';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return '螢幕共享失敗：$error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return '$username 的音量';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou => '僅影響你所聽到的聲音 -- 僅限此裝置、此通話。';

  @override
  String get voiceScreenResetVolumeButton => '重設';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return '無法連線：$error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen => '你的畫面，點按以全螢幕檢視';

  @override
  String get voiceScreenYourScreenLabel => '你的畫面';

  @override
  String get voiceScreenTapToClose => '點按以關閉';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name（你）';
  }

  @override
  String get voiceScreenSpeakingSuffix => '，正在說話';

  @override
  String get voiceScreenCameraOnSuffix => '，攝影機已開啟';

  @override
  String get voiceScreenActivateToPopOut => '，啟用以彈出顯示';

  @override
  String get voiceScreenShowVarmTooltip => '顯示 VARM';

  @override
  String get voiceScreenHideVarmTooltip => '隱藏 VARM';

  @override
  String get voiceScreenShowChatTooltip => '顯示聊天';

  @override
  String get voiceScreenHideChatTooltip => '隱藏聊天';

  @override
  String get voiceScreenStartCameraTooltip => '開啟攝影機';

  @override
  String get voiceScreenStopCameraTooltip => '關閉攝影機';

  @override
  String get voiceScreenShareScreenTooltip => '共享螢幕';

  @override
  String get voiceScreenStopSharingTooltip => '停止共享';

  @override
  String get voiceScreenPopOutTooltip => '將語音彈出至獨立視窗';

  @override
  String get voiceScreenCouldNotPopOut => '無法彈出語音視窗。';

  @override
  String get voiceScreenLeaveVoiceTooltip => '離開語音';

  @override
  String get voiceScreenPinTooltip => '釘選（保持展開）';

  @override
  String get voiceScreenUnpinTooltip => '取消釘選';

  @override
  String get voiceScreenSizeSmall => '小（320x180）';

  @override
  String get voiceScreenSizeMedium => '中（480x270）';

  @override
  String get voiceScreenSizeLarge => '大（640x360）';

  @override
  String get voiceScreenSizeXl => '特大（960x540）';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName，$count 人已連線';
  }

  @override
  String get voiceBarSpeakingSuffix => '，你正在說話';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count 人已連線 · 點按以展開';
  }

  @override
  String get voiceBarStartCameraTooltip => '開啟攝影機';

  @override
  String get voiceBarStopCameraTooltip => '關閉攝影機';

  @override
  String get voiceBarLeaveVoiceTooltip => '離開語音';

  @override
  String get popOutVideoFallbackTitle => '語音';

  @override
  String get popOutVideoMissingTokenError => '缺少權杖或網址';

  @override
  String get popOutVideoConnectionTimedOut => '連線在 15 秒後逾時';

  @override
  String popOutVideoErrorLabel(String error) {
    return '錯誤：$error';
  }

  @override
  String get popOutVideoNoParticipants => '暫無參與者';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => '舞台';

  @override
  String get stageCouldNotJoin => '無法加入舞台。';

  @override
  String get stageThisStageFallback => '此舞台';

  @override
  String get stageRequiresTicketToJoin => '需要票券才能加入';

  @override
  String get stagePleaseWaitLabel => '請稍候...';

  @override
  String get stageGetFreeTicketButton => '領取免費票券';

  @override
  String stageBuyTicketButton(String price) {
    return '購買票券 -- $price';
  }

  @override
  String get stageNotNowButton => '暫不';

  @override
  String get stageCouldNotStartTicketPurchase => '無法開始購買票券。';

  @override
  String get stagePaymentStillPendingTryAgain => '仍在等待該筆付款完成 -- 確認後請再次嘗試加入。';

  @override
  String get stageSpeakerBadge => '發言者';

  @override
  String get stageListenerBadge => '聽眾';

  @override
  String stageCouldNotJoinWithError(String error) {
    return '無法加入：$error';
  }

  @override
  String get stageSpeakersHeader => '發言者';

  @override
  String get stageRaisedHandsHeader => '舉手中';

  @override
  String get stageAllowButton => '允許';

  @override
  String get stageIgnoreButton => '忽略';

  @override
  String get stageListenersHeader => '聽眾';

  @override
  String get stageRaiseHandTooltip => '舉手';

  @override
  String get stageLowerHandTooltip => '放下手';

  @override
  String get stageLeaveStageTooltip => '離開舞台';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name（你）';
  }

  @override
  String get stageMoveToListenersButton => '移至聽眾';

  @override
  String get stageYouFallbackName => '你';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return '$username 的頭像';
  }

  @override
  String get channelEditDialogNewTitle => '新增頻道';

  @override
  String get channelEditDialogEditTitle => '編輯頻道';

  @override
  String get channelEditDialogNameHint => '頻道名稱';

  @override
  String get channelEditDialogTypeLabel => '類型';

  @override
  String get channelEditDialogTypeText => '文字';

  @override
  String get channelEditDialogTypeVoice => '語音';

  @override
  String get channelEditDialogTypeGallery => '圖庫';

  @override
  String get channelEditDialogTypeStage => '舞台';

  @override
  String get channelEditDialogTypeRules => '規則';

  @override
  String get channelEditDialogTypeRoleSelection => '身分組選擇';

  @override
  String get channelEditDialogTypeCalendar => '行事曆';

  @override
  String get channelEditDialogAnnouncementTitle => '公告頻道';

  @override
  String get channelEditDialogAnnouncementSubtitle => '只有擁有管理訊息權限的成員才能發文';

  @override
  String get channelEditDialogLiveAnnouncementsTitle => '在此發布直播與上傳通知';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      '當擁有「直播時通知」權限的成員在 Twitch 開始直播，或發布新的 YouTube 影片時會自動發文';

  @override
  String get channelEditDialogNotifyRolesLabel => '發文時通知這些身分組（選填）';

  @override
  String get channelEditDialogCategoryLabel => '分類';

  @override
  String get channelEditDialogNoCategory => '無分類';

  @override
  String get channelEditDialogRoleAccessLabel => '身分組存取權限（留空表示所有人可見）';

  @override
  String get channelEditDialogContentLabelsLabel => '內容標籤';

  @override
  String get channelEditDialogContentLabelsDescription =>
      '為此頻道標記成員的內容篩選器；受監護帳號將被強制封鎖';

  @override
  String get categoryEditDialogNewTitle => '新增分類';

  @override
  String get categoryEditDialogEditTitle => '編輯分類';

  @override
  String get categoryEditDialogNameHint => '分類名稱';

  @override
  String get categoryEditDialogRoleAccessLabel => '身分組存取權限（留空表示所有人可見）';

  @override
  String memberPanelHeaderLabel(int count) {
    return '成員 — $count 人在線';
  }

  @override
  String get memberPanelRefreshTooltip => '重新整理成員清單';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位成員',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => '離線';

  @override
  String memberPanelTierSuffix(String tier) {
    return '，$tier 等級';
  }

  @override
  String get memberPanelUnknownUser => '未知';

  @override
  String get memberPanelModerationActionsTooltip => '管理操作';

  @override
  String get reportDialogReasonSpam => '垃圾訊息';

  @override
  String get reportDialogReasonHarassment => '騷擾或辱罵';

  @override
  String get reportDialogReasonIllegal => '違法內容';

  @override
  String get reportDialogReasonOther => '其他';

  @override
  String get reportDialogReasonLabel => '原因';

  @override
  String get reportDialogNoteHint => '還有什麼需要讓管理員知道的嗎？（選填）';

  @override
  String get reportDialogDisclosureNote => '你所看到的訊息內容及寄件者身分，將會與此伺服器的管理員共享。';

  @override
  String get reportDialogSubmitButton => '送出檢舉';

  @override
  String get reportDialogSubmitError => '無法送出檢舉。';

  @override
  String get notificationBellTitle => '通知';

  @override
  String get notificationBellMarkAllRead => '全部標為已讀';

  @override
  String get notificationBellEmptyState => '尚無通知';

  @override
  String get notificationBellUnreadLabel => '未讀';

  @override
  String get invitePreviewTitle => '伺服器邀請';

  @override
  String get invitePreviewInvalidOrExpired => '邀請無效或已過期。';

  @override
  String get invitePreviewCouldNotJoin => '無法加入伺服器。';

  @override
  String get invitePreviewUnknownServer => '未知伺服器';

  @override
  String get shippingAddressFullNameHint => '姓名';

  @override
  String get shippingAddressLine1Hint => '地址第一行';

  @override
  String get shippingAddressLine2Hint => '地址第二行（選填）';

  @override
  String get shippingAddressCityHint => '城市';

  @override
  String get shippingAddressStateHint => '省/州';

  @override
  String get shippingAddressZipHint => '郵遞區號';

  @override
  String get shippingAddressCountryCodeHint => '國家代碼（例如 US）';

  @override
  String get shippingAddressPhoneHint => '電話（選填）';

  @override
  String get shippingAddressPrivacyNote =>
      '僅用於配送此訂單 -- 訂單完成後 Printful 如何處理這些資訊，請參閱其隱私權政策。';

  @override
  String get updateNudgeAvailableTitle => '有可用更新';

  @override
  String get updateNudgeRequiredTitle => '需要更新';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $version 已推出 -- 你目前使用的是較舊版本。';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return '此版本已不再受支援。請更新至 Koda $version 以繼續使用 Koda。';
  }

  @override
  String get updateNudgeLaterButton => '稍後再說';

  @override
  String get tierBadgeSparkSubscriber => 'Spark 訂閱者';

  @override
  String get tierBadgePulseSubscriber => 'Pulse 訂閱者';

  @override
  String get vispAvatarInDevelopment => '開發中';

  @override
  String get vispBoostAdvisorCouldNotAnswer => 'Visp 無法整理出答案。';

  @override
  String get vispBoostAdvisorTitle => '詢問 Visp：加成投資報酬顧問';

  @override
  String get vispBoostAdvisorFollowUpHint => '追加提問...';

  @override
  String get vispBoostAdvisorSendTooltip => '傳送';

  @override
  String get vispBoostAdvisorBasedOn => '依據：';

  @override
  String get vispEventDialogCouldNotGenerate => 'Visp 無法產生活動。';

  @override
  String get vispEventDialogCouldNotCreate => '無法建立該活動。';

  @override
  String get vispEventDialogRecurrenceNone => '單次';

  @override
  String get vispEventDialogRecurrenceDaily => '每天重複';

  @override
  String get vispEventDialogRecurrenceWeekly => '每週重複';

  @override
  String get vispEventDialogRecurrenceMonthly => '每月重複';

  @override
  String get vispEventDialogTitle => '請 Visp 建立活動';

  @override
  String get vispEventDialogDescription => '描述這個活動 -- Visp 會提議標題、日期／時間及其他細節。';

  @override
  String get vispEventDialogPromptHint => '例如「每週五晚上 7 點、為時約 3 小時的每週 D&D 場次」';

  @override
  String get vispEventDialogPrivacyNote =>
      '你的描述會傳送給 Visp（一個自架代管的助理 -- 任何內容都不會離開 Koda 的伺服器）以產生此計畫。';

  @override
  String get vispEventDialogStartOver => '重新開始';

  @override
  String get vispEventDialogCreateEvent => '建立活動';

  @override
  String get vispEventDialogThinking => '思考中...';

  @override
  String get vispEventDialogGeneratePlan => '產生計畫';

  @override
  String get vispEventDialogCouldNotParseDate => '無法解析日期 -- 請嘗試換個說法';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return '結束：$ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '每張票券 $price';
  }

  @override
  String get vispEventDialogBasedOn => '依據：';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return '問題 $questionNumber/$maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => '或輸入你自己的答案...';

  @override
  String get vispQuestionStepSendTooltip => '傳送';

  @override
  String get vispQuestionStepSkip => '略過並立即產生';

  @override
  String get vispSetupDialogCouldNotGeneratePlan => 'Visp 無法產生計畫。';

  @override
  String get vispSetupDialogCouldNotApplyPlan => '無法套用該計畫。';

  @override
  String get vispSetupDialogTitleNew => '向 Visp 描述你的伺服器';

  @override
  String get vispSetupDialogTitleExisting => '請 Visp 為此伺服器新增內容';

  @override
  String get vispSetupDialogDescriptionNew =>
      '描述你想要的伺服器 -- Visp 會提議名稱，以及一組身分組、分類和頻道。';

  @override
  String get vispSetupDialogDescriptionExisting =>
      '描述你想新增的內容 -- Visp 會提議要建立的身分組、分類和頻道。';

  @override
  String get vispSetupDialogPromptHintNew => '例如「適合我的 D&D 小隊、有兩桌用語音頻道的溫馨伺服器」';

  @override
  String get vispSetupDialogPromptHintExisting => '例如「為我們的團隊再多加幾個頻道」';

  @override
  String get vispSetupDialogPrivacyNote =>
      '你的描述會傳送給 Visp（一個自架代管的助理 -- 任何內容都不會離開 Koda 的伺服器）以產生此計畫。';

  @override
  String get vispSetupDialogStartOver => '重新開始';

  @override
  String get vispSetupDialogCreateServer => '建立伺服器';

  @override
  String get vispSetupDialogAddToServer => '新增至伺服器';

  @override
  String get vispSetupDialogThinking => '思考中...';

  @override
  String get vispSetupDialogGeneratePlan => '產生計畫';

  @override
  String get vispSetupDialogNewServerLabel => '新伺服器';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個身分組',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個分類',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個頻道',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => '依據：';

  @override
  String get childLockoutTitle => '目前不在你可使用的時段內';

  @override
  String get childLockoutBody =>
      '家長或監護人已為此帳號設定可使用 Koda 的時段。可以請他們延長使用時間，或於下一個可用時段再回來查看。';

  @override
  String get childLockoutLogOutButton => '登出';

  @override
  String get forcePasswordChangeError => '無法更新密碼，請再試一次。';

  @override
  String forcePasswordChangeWelcome(String username) {
    return '歡迎，$username';
  }

  @override
  String get forcePasswordChangeSubtitle => '你的帳號需要設定新密碼才能繼續。';

  @override
  String get forcePasswordChangeNewPasswordHint => '新密碼';

  @override
  String get forcePasswordChangeConfirmPasswordHint => '確認新密碼';

  @override
  String get forcePasswordChangeReqLength => '至少 12 個字元';

  @override
  String get forcePasswordChangeReqUpper => '至少一個大寫字母';

  @override
  String get forcePasswordChangeReqLower => '至少一個小寫字母';

  @override
  String get forcePasswordChangeReqDigit => '至少一個數字';

  @override
  String get forcePasswordChangeReqMatch => '密碼相符';

  @override
  String get forcePasswordChangeSubmitButton => '設定新密碼';

  @override
  String get forgotPasswordEnterEmailError => '請輸入你的電子郵件地址。';

  @override
  String get forgotPasswordCodeSentInfo => '如果該帳號存在，重設代碼已寄出。';

  @override
  String get forgotPasswordEnterCodeError => '請輸入代碼與至少 8 個字元的密碼。';

  @override
  String get forgotPasswordInvalidCode => '代碼無效或已過期。';

  @override
  String get forgotPasswordTitle => '重設密碼';

  @override
  String get forgotPasswordEmailHint => '電子郵件地址';

  @override
  String get forgotPasswordSendCodeButton => '傳送重設代碼';

  @override
  String get forgotPasswordCodeHint => '6 位數代碼';

  @override
  String get forgotPasswordNewPasswordHint => '新密碼';

  @override
  String get forgotPasswordSetNewPasswordButton => '設定新密碼';

  @override
  String get verifyEmailEnterCodeError => '請輸入電子郵件中的 6 位數代碼。';

  @override
  String get verifyEmailInvalidCode => '代碼無效或已過期。';

  @override
  String verifyEmailResentInfo(String email) {
    return '新代碼已寄至 $email。';
  }

  @override
  String get verifyEmailResendFailed => '目前無法重新寄送。';

  @override
  String get verifyEmailTitle => '請查看你的電子郵件';

  @override
  String verifyEmailSentCode(String email) {
    return '我們已將 6 位數代碼寄至 $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => '驗證電子郵件';

  @override
  String get verifyEmailResendButton => '重新寄送代碼';

  @override
  String get safetyNumberKeysNotSetUp => '你自己的金鑰尚未設定。';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName 尚無金鑰包。';
  }

  @override
  String safetyNumberComputeError(String error) {
    return '無法計算安全碼：$error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName 已不再擁有該裝置。';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return '與 $peerName 的安全碼';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return '請透過其他管道 -- 當面、電話，任何非此聊天的方式 -- 與 $peerName 核對此號碼。若雙方一致，代表你正在與你認為的對象交談。';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName 擁有 $count 台裝置，每台都有各自的安全碼 -- 驗證一台並不能涵蓋其他裝置。';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return '裝置 $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => '標示為已驗證';

  @override
  String get contentFiltersDescription =>
      '伺服器可以為頻道標記內容標籤。選擇你希望被標記的頻道如何顯示 -- 這僅是你個人的偏好設定，絕不會影響其他人所看到的內容。';

  @override
  String get contentFiltersLabelAdult => '成人內容';

  @override
  String get contentFiltersLabelSuggestive => '性暗示內容';

  @override
  String get contentFiltersLabelGraphic => '血腥暴力媒體';

  @override
  String get contentFiltersLabelNudity => '非性相關裸露';

  @override
  String get contentFiltersDescAdult => '露骨的性內容';

  @override
  String get contentFiltersDescSuggestive => '具性暗示但不露骨的內容';

  @override
  String get contentFiltersDescGraphic => '暴力或血腥內容';

  @override
  String get contentFiltersDescNudity => '非性相關情境下的裸露';

  @override
  String get contentFiltersHide => '隱藏';

  @override
  String get contentFiltersWarn => '警告';

  @override
  String get contentFiltersShow => '顯示';

  @override
  String get deviceTestCouldNotGetToken => '無法取得測試權杖。';

  @override
  String get deviceTestLabelTest => '測試';

  @override
  String get deviceTestLabelRecording => '錄音中...';

  @override
  String get deviceTestLabelPlayingBack => '播放中...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return '無法啟動攝影機：$error';
  }

  @override
  String get deviceTestTitle => '測試裝置';

  @override
  String deviceTestCouldNotConnect(String error) {
    return '無法連線：$error';
  }

  @override
  String get deviceTestMicrophoneLabel => '麥克風';

  @override
  String get deviceTestHearYourselfLabel => '聽到自己的聲音（有延遲）';

  @override
  String get deviceTestSpeakerOutputLabel => '喇叭／輸出';

  @override
  String get deviceTestCameraLabel => '攝影機';

  @override
  String get deviceTestSystemDefault => '系統預設';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return '說話後，將播放 $seconds 秒的錄音片段';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '$seconds 秒';
  }

  @override
  String get deviceTestCameraPreviewOff => '攝影機預覽已關閉';

  @override
  String get deviceTestStopCameraButton => '停止攝影機測試';

  @override
  String get deviceTestTestCameraButton => '測試攝影機';

  @override
  String get deviceTestInputLevelLabel => '輸入電平';

  @override
  String get devicesScreenRemoveConfirmTitle => '要移除此裝置嗎？';

  @override
  String get devicesScreenRemoveConfirmBody =>
      '該裝置需要重新登入，且在被移除期間傳送給它的訊息之後將無法送達 -- 雙棘輪會談不會追溯性地補齊空缺。';

  @override
  String get devicesScreenRemoveFailed => '無法移除該裝置。';

  @override
  String get devicesScreenNeverActive => '從未使用過';

  @override
  String devicesScreenActiveDate(String date) {
    return '上次使用：$date';
  }

  @override
  String get devicesScreenDescription =>
      '你登入的每台裝置都有各自的加密身分 -- 傳送給你的訊息會送達以下所有裝置。請移除你不再使用或不認得的裝置。';

  @override
  String get devicesScreenNoDevicesFound => '找不到任何裝置。';

  @override
  String get devicesScreenUnknownDevice => '未知裝置';

  @override
  String get devicesScreenThisDeviceBadge => '本裝置';

  @override
  String get devicesScreenRemoveDeviceTooltip => '移除裝置';

  @override
  String get totpSetupInvalidCode => '代碼無效，請再試一次。';

  @override
  String get totpSetupEnabledMessage => '雙重驗證已啟用。';

  @override
  String get totpSetupScanInstructions =>
      '請將此金鑰掃描至你的驗證器應用程式中（如 Google Authenticator、1Password、Authy）：';

  @override
  String get totpSetupCodeHint => '輸入 6 位數代碼以確認';

  @override
  String get totpSetupVerifyButton => '驗證並啟用';

  @override
  String get voiceVideoSettingsPushToTalkLabel => '按鍵說話';

  @override
  String get voiceVideoSettingsPressAnyKeyHint => '按下任意按鍵以綁定...';

  @override
  String get voiceVideoSettingsTestDevicesButton => '測試裝置';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => '語音處理';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => '降噪';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle => '降低麥克風收到的背景噪音';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle => '深度降噪 (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      '即時 AI 降噪，比標準降噪更強 -- 開啟後將取代標準降噪';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => '回音消除';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle => '防止你自己的聲音回音傳回';

  @override
  String get voiceVideoSettingsAutoGainTitle => '自動增益控制';

  @override
  String get voiceVideoSettingsAutoGainSubtitle => '自動平衡麥克風音量（音量正規化）';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => '自動閃避';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle => '在你說話時降低其他參與者的音量';

  @override
  String get voiceVideoSettingsHighPassTitle => '高通濾波器';

  @override
  String get voiceVideoSettingsHighPassSubtitle => '消除低頻噪音（風扇、空調、桌面震動等）';

  @override
  String get voiceVideoSettingsTypingNoiseTitle => '打字噪音偵測';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle => '抑制麥克風收到的鍵盤敲擊聲';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => '人聲隔離';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle => '聚焦於你的聲音，過濾掉周圍其他人與聲音';

  @override
  String get voiceVideoSettingsSectionMicBoost => '麥克風增益';

  @override
  String get voiceVideoSettingsEnableBoostTitle => '啟用增益';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      '為音量小或距離遠的麥克風提供前級增益 -- 在等化器之前套用';

  @override
  String get voiceVideoSettingsBandBoost => '增益';

  @override
  String get voiceVideoSettingsSectionMicEq => '麥克風等化器';

  @override
  String get voiceVideoSettingsEnableEqTitle => '啟用等化器';

  @override
  String get voiceVideoSettingsEnableEqSubtitle => '在麥克風聲音傳給他人之前進行調音';

  @override
  String get voiceVideoSettingsBandBass => '低音';

  @override
  String get voiceVideoSettingsBandMid => '中音';

  @override
  String get voiceVideoSettingsBandTreble => '高音';

  @override
  String get voiceVideoSettingsSectionVad => '語音活動偵測（VOX）';

  @override
  String get voiceVideoSettingsEnableVoxTitle => '啟用 VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle => '僅在你實際說話時才傳輸';

  @override
  String get voiceVideoSettingsSensitivityLabel => '靈敏度';

  @override
  String get voiceVideoSettingsVadHint =>
      '數值越低，越能偵測到較輕微的聲音；數值越高，只有較大聲的說話才會觸發傳輸。';

  @override
  String get voiceVideoSettingsBoundKeyLabel => '已綁定按鍵';

  @override
  String get voiceVideoSettingsKeyNotSet => '未設定 — 取消靜音後麥克風將持續開啟';

  @override
  String get voiceVideoSettingsClearButton => '清除';

  @override
  String get voiceVideoSettingsSetKeyButton => '設定按鍵';

  @override
  String get voiceVideoSettingsChangeButton => '變更';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      '綁定按鍵後，只有按住該鍵時麥克風才會傳輸。在語音頻道中，此設定優先於 VOX。';

  @override
  String get voiceVideoSettingsSectionVarm => 'VARM - 虛擬頭像反應模型';

  @override
  String get voiceVideoSettingsVarmDescription => '上傳兩張圖片，會在你說話時自動切換。僅你自己可見。';

  @override
  String get voiceVideoSettingsVarmSilentLabel => '靜默時';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => '說話時';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => '說話門檻';

  @override
  String get voiceVideoSettingsVarmThresholdHint => '數值越低，越容易切換到說話圖片。';

  @override
  String get voiceVideoSettingsRemoveVarmButton => '移除 VARM';

  @override
  String get gifPickerNoGifsFound => '找不到 GIF';

  @override
  String get gifPickerSearchHint => '搜尋 GIF...';

  @override
  String get messageSearchHint => '搜尋此頻道...';

  @override
  String get messageSearchTooltip => '搜尋';

  @override
  String get messageSearchInitialHint =>
      '搜尋此裝置上已載入的訊息 -- 繼續向前查看時會取得（並在本機解密）更早的歷史紀錄。';

  @override
  String get messageSearchNoMatches => '沒有相符結果';

  @override
  String get messageSearchStartOfHistory => '頻道歷史紀錄的開頭';

  @override
  String get messageSearchFurtherBackButton => '搜尋更早的紀錄';

  @override
  String get messageSearchUnknownAuthor => '未知';
}
