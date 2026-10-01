// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get commonSave => '保存';

  @override
  String get commonEdit => '編集';

  @override
  String get commonDelete => '削除';

  @override
  String get commonCreate => '作成';

  @override
  String get commonClose => '閉じる';

  @override
  String get commonDone => '完了';

  @override
  String get commonDownload => 'ダウンロード';

  @override
  String get commonDisconnect => '切断';

  @override
  String get commonNone => 'なし';

  @override
  String get commonJoin => '参加';

  @override
  String get commonDismiss => '閉じる';

  @override
  String get commonSubmit => '送信';

  @override
  String get commonConfirm => '確認';

  @override
  String get commonRemove => '削除';

  @override
  String get commonRetry => '再試行';

  @override
  String get commonOk => 'OK';

  @override
  String get commonYes => 'はい';

  @override
  String get commonNo => 'いいえ';

  @override
  String get commonSearch => '検索';

  @override
  String get commonSettings => '設定';

  @override
  String get commonLoading => '読み込み中...';

  @override
  String get settingsLanguageSection => '言語';

  @override
  String get settingsLanguageTitle => 'アプリの言語';

  @override
  String get settingsLanguageSystemDefault => 'システムの既定値';

  @override
  String get settingsLanguageDescription =>
      'Kodaのインターフェースを表示する言語を選択します。これはサーバーの主要言語やメッセージを入力する言語とは別の設定です。';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsSignOut => 'サインアウト';

  @override
  String get settingsSectionMyAccount => 'マイアカウント';

  @override
  String get settingsSectionSecurity => 'セキュリティ';

  @override
  String get settingsSectionAccessibility => 'アクセシビリティ';

  @override
  String get settingsSectionBilling => 'お支払い';

  @override
  String get settingsSectionFamily => 'ファミリー';

  @override
  String get settingsSectionVoiceVideo => '音声とビデオ';

  @override
  String get settingsSectionDesktop => 'デスクトップ';

  @override
  String get settingsSectionAbout => 'アプリ情報';

  @override
  String get settingsTwoFactorTitle => '二段階認証';

  @override
  String get settingsTwoFactorSubtitle => '認証アプリを追加してセキュリティを強化';

  @override
  String get settingsLinkedDevicesTitle => '連携済みデバイス';

  @override
  String get settingsLinkedDevicesSubtitle => 'このアカウントにサインインしているデバイスの確認と削除';

  @override
  String get settingsContentFiltersTitle => 'コンテンツフィルター';

  @override
  String get settingsContentFiltersSubtitle => 'ラベル付きコンテンツの表示方法を選択';

  @override
  String get settingsDmFriendsOnlyTitle => 'フレンドのみDMを許可';

  @override
  String get settingsDmFriendsOnlySubtitle => 'フレンド以外はあなたに新しい会話を開始できません';

  @override
  String get settingsDmPrivacyError => 'DMのプライバシー設定を更新できませんでした。';

  @override
  String get settingsShowVispAvatarTitle => 'Vispのアバターを表示';

  @override
  String get settingsShowVispAvatarSubtitle =>
      '設定/イベント/アドバイザーのダイアログでVispの表情と気分を表示します';

  @override
  String get settingsHighContrastTitle => 'ハイコントラスト';

  @override
  String get settingsHighContrastSubtitle =>
      'アプリ全体を純粋な白黒の高コントラスト配色にします -- 切り替えると現在の画面が一瞬再読み込みされます。';

  @override
  String get settingsDyslexiaFontTitle => 'ディスレクシア対応フォント';

  @override
  String get settingsDyslexiaFontSubtitle => 'アプリ全体の本文テキストをOpenDyslexicに切り替えます';

  @override
  String get settingsFontSizeTitle => 'フォントサイズ';

  @override
  String get settingsFontSizeSample => 'いろはにほへと ちりぬるを';

  @override
  String get settingsDensityTitle => '密度';

  @override
  String get settingsDensityDescription =>
      '標準コントロール（ボタン、トグル、ダイアログ）の間隔に影響します -- すべてのカスタムレイアウトには適用されません。';

  @override
  String get settingsDensityCompact => 'コンパクト';

  @override
  String get settingsDensityStandard => '標準';

  @override
  String get settingsDensityComfortable => 'ゆったり';

  @override
  String get settingsStreamingTitle => '配信アカウント';

  @override
  String get settingsStreamingDescription =>
      'Twitch/YouTubeを連携すると、「配信通知」の権限を持つサーバーで配信開始時や新しい動画投稿時に自動投稿できます。';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platformを$usernameとして接続済み$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platformは未接続';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- 配信中';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- 新しい動画';

  @override
  String get settingsStreamingConnecting => '接続中...';

  @override
  String get settingsStreamingConnect => '接続';

  @override
  String get settingsAnnounceLiveTwitch => '配信開始時に通知';

  @override
  String get settingsAnnounceLiveYoutube => 'ライブ配信と新しい動画投稿を通知';

  @override
  String get settingsRefreshStatus => 'ブラウザで接続済みですか？ステータスを更新';

  @override
  String settingsStreamingConnectError(String platform) {
    return '$platformへの接続を開始できませんでした。';
  }

  @override
  String get settingsStreamingFinishInBrowser => 'ブラウザで接続を完了してから戻り、更新してください。';

  @override
  String get settingsThroneTitle => 'Throne Webhook';

  @override
  String get settingsThroneDescription =>
      'このURLをThrone.comのWebhook設定に貼り付けると、誰かがギフトを送るたびにKodaで通知を受け取れます。';

  @override
  String get settingsThroneGetUrl => 'WebhookのURLを取得';

  @override
  String get settingsThroneCopyTooltip => 'コピー';

  @override
  String get settingsThroneCopiedToast => 'クリップボードにコピーしました';

  @override
  String get settingsThroneRegenerateTooltip => '再生成（以前のURLは無効になります）';

  @override
  String get settingsThroneRegenerateConfirmTitle => 'WebhookのURLを再生成しますか？';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      '以前のURLは使用できなくなるため、後でThrone.com側も更新してください。';

  @override
  String get settingsThroneRegenerate => '再生成';

  @override
  String get settingsUploadPhoto => '写真をアップロード';

  @override
  String get settingsOrPasteUrl => 'または下にURLを貼り付け';

  @override
  String get settingsAvatarUrlHint => 'https://example.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      '画像のアップロードにはCloudflare R2が必要です — URLの貼り付けは常に利用できます。';

  @override
  String get settingsDisplayNameLabel => '表示名';

  @override
  String get settingsDisplayNameHint => '表示名';

  @override
  String get settingsBioLabel => '自己紹介';

  @override
  String get settingsBioHint => '自分について少し教えてください';

  @override
  String get settingsPronounsLabel => '代名詞';

  @override
  String get settingsPronounsHint => '例: 彼/彼女';

  @override
  String get settingsShowPronounsTitle => '自分の代名詞を他の人に表示';

  @override
  String get settingsShowPronounsSubtitle => 'チャット、メンバーリスト、ボイスであなたの名前の横に表示されます';

  @override
  String get settingsStatusLabel => 'ステータス';

  @override
  String get settingsCustomStatusLabel => 'カスタムステータス';

  @override
  String get settingsCustomStatusHint => '今なにしてる?';

  @override
  String get statusOnline => 'オンライン';

  @override
  String get statusAway => '退席中';

  @override
  String get statusDnd => '取り込み中';

  @override
  String get statusInvisible => 'オフライン表示';

  @override
  String get settingsFamilyNotAvailable => '監視対象アカウントではペアレンタルコントロールを利用できません。';

  @override
  String get settingsAboutTitle => 'Kodaについて';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => '利用規約';

  @override
  String get settingsPrivacyTitle => 'プライバシーポリシー';

  @override
  String get settingsSupportTitle => 'サポート';

  @override
  String get settingsReportSecurityTitle => 'セキュリティ問題を報告';

  @override
  String get settingsDesktopNotAvailable =>
      'これらはデスクトップ専用の設定です -- このプラットフォームにはウィンドウやシステムトレイがありません。';

  @override
  String get settingsCloseToTrayTitle => 'システムトレイに閉じる';

  @override
  String get settingsCloseToTraySubtitle =>
      'ウィンドウを閉じてもKodaはバックグラウンドで動作し続け、通知を受け取れます -- オフにするとウィンドウを閉じたときに実際にアプリが終了します。';

  @override
  String get authErrorEmailPasswordRequired => 'メールアドレスとパスワードを入力してください。';

  @override
  String get authErrorIncorrectCredentials => 'メールアドレスまたはパスワードが正しくありません。';

  @override
  String get authErrorMustAcceptTerms => '利用規約に同意してください。';

  @override
  String get authErrorAllFieldsRequired => 'すべての項目を入力してください。';

  @override
  String get authErrorPasswordsDontMatch => 'パスワードが一致しません。';

  @override
  String get authErrorPasswordTooShort => 'パスワードは8文字以上で入力してください。';

  @override
  String get authErrorRegistrationFailed =>
      '登録に失敗しました。このメールアドレスは既に使用されている可能性があります。';

  @override
  String get authTabSignIn => 'サインイン';

  @override
  String get authTabCreateAccount => 'アカウント作成';

  @override
  String get authAgreementPrefix => 'Kodaを利用することで、次に同意したことになります: ';

  @override
  String get authTermsLink => '利用規約';

  @override
  String get authAgreementMiddle => ' および ';

  @override
  String get authPrivacyLink => 'プライバシーポリシー';

  @override
  String get authAgreementSuffix => '。';

  @override
  String get authEmailHint => 'メールアドレス';

  @override
  String get authPasswordHint => 'パスワード';

  @override
  String get authForgotPassword => 'パスワードをお忘れですか？';

  @override
  String get authSignInButton => 'サインイン';

  @override
  String get authUsernameHint => 'ユーザー名';

  @override
  String get authConfirmPasswordHint => 'パスワードの確認';

  @override
  String get authAgreeToTerms => '利用規約とプライバシーポリシーに同意します';

  @override
  String get authCreateAccountButton => 'アカウント作成';

  @override
  String get dmSafetyNumberChangedWarning =>
      'この会話のセーフティナンバーが変更されました -- 送信前に確認してください。';

  @override
  String get dmMessageNotSent => 'メッセージを送信できませんでした。';

  @override
  String dmEncryptMessageError(String error) {
    return 'メッセージを暗号化できませんでした: $error';
  }

  @override
  String get dmAttachmentUploadFailed => '添付ファイルのアップロードに失敗しました。';

  @override
  String dmEncryptAttachmentError(String error) {
    return '添付ファイルを暗号化できませんでした: $error';
  }

  @override
  String get dmReportMessage => 'メッセージを報告';

  @override
  String get dmReportSubmitted => '報告を送信しました。';

  @override
  String get dmTitle => 'メッセージ';

  @override
  String get dmNewMessage => '新しいメッセージ';

  @override
  String get dmNoConversationsYet => 'まだ会話がありません';

  @override
  String get dmSelectConversation => '会話を選択してください';

  @override
  String get dmVerifySafetyNumberTooltip => 'セーフティナンバーを確認';

  @override
  String get dmSeenLabel => '既読';

  @override
  String get dmMessageActionsTooltip => 'メッセージ操作';

  @override
  String get dmRemoveAttachmentTooltip => '添付ファイルを削除';

  @override
  String get dmAttachFileTooltip => 'ファイルを添付';

  @override
  String get dmMessageHint => 'メッセージ...';

  @override
  String get dmSendMessageTooltip => 'メッセージを送信';

  @override
  String get dmNoFriendsYet => 'まだフレンドがいません。\nフレンドリクエストを送って始めましょう。';

  @override
  String get dmUnfriendTooltip => 'フレンド解除';

  @override
  String get dmNoPendingRequests => '保留中のフレンドリクエストはありません。';

  @override
  String get dmIncomingRequestsLabel => '受信';

  @override
  String get dmSentRequestsLabel => '送信済み';

  @override
  String get dmAcceptTooltip => '承認';

  @override
  String get dmDeclineTooltip => '拒否';

  @override
  String get dmPendingLabel => '保留中';

  @override
  String get dmNewMessageDialogTitle => '新しいメッセージ';

  @override
  String get dmEnterUsernameHint => 'ユーザー名を入力';

  @override
  String get dmOpenButton => '開く';

  @override
  String dmSavedAttachment(String fileName) {
    return '$fileName を保存しました';
  }

  @override
  String get dmUnknownUser => '不明';

  @override
  String get dmEndToEndEncryptedTooltip => 'エンドツーエンド暗号化';

  @override
  String get homeContentWarningTitle => 'コンテンツ警告';

  @override
  String homeContentWarningBody(String labels) {
    return 'このチャンネルは次の理由でフラグが付いています: $labels。\n\n設定 > セキュリティ > コンテンツフィルターで変更できます。';
  }

  @override
  String get homeViewAnyway => 'それでも表示';

  @override
  String get homeCouldNotConnectVoice => 'ボイスに接続できませんでした。';

  @override
  String get homeVoiceChannelFull => 'このボイスチャンネルは満員です。';

  @override
  String get homeCreateServer => 'サーバーを作成';

  @override
  String get homeJoinServer => 'サーバーに参加';

  @override
  String get homeRedeemCode => 'コードを引き換え';

  @override
  String get homeJoinServerDialogTitle => 'サーバーに参加';

  @override
  String get homeEnterInviteCode => '招待コードまたはURLを入力してください:';

  @override
  String get homeInviteCodeHint => '例: XK9MP2';

  @override
  String get homeJoined => '参加しました！';

  @override
  String get homeInvalidInvite => '招待コードが無効か期限切れです。';

  @override
  String get homeJoinButton => '参加';

  @override
  String get homeRedeemCodeDialogTitle => 'コードを引き換え';

  @override
  String get homeEnterBackerCode => 'バッカーコードまたは特典コードを入力してください:';

  @override
  String get homeRewardCodeHint => '特典コード';

  @override
  String get homeCodeRedeemed => 'コードを引き換えました！特典が適用されました。';

  @override
  String get homeInvalidRedeemCode => 'コードが無効か、期限切れか、既に使用されています。';

  @override
  String get homeRedeemButton => '引き換え';

  @override
  String get homeAreFriends => 'フレンドです';

  @override
  String get homeAddFriend => 'フレンド追加';

  @override
  String homeFriendRequestSent(String username) {
    return '$usernameにフレンドリクエストを送信しました！';
  }

  @override
  String get homeMessageButton => 'メッセージ';

  @override
  String get homeSendTip => 'チップを送る';

  @override
  String get homeSwitchToServer => 'このサーバーに切り替え';

  @override
  String get homeInvitePeople => '友達を招待';

  @override
  String get homeServerSettingsMenuItem => 'サーバー設定';

  @override
  String get homeLeaveServerMenuItem => 'サーバーを退出';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return '$serverNameを退出しますか？招待があればいつでも再参加できます。';
  }

  @override
  String get homeLeaveButton => '退出';

  @override
  String get homeCreateAServer => 'サーバーを作成';

  @override
  String get homeServerNameHint => 'サーバー名';

  @override
  String get homeDescribeToVisp => '代わりにVispに説明する';

  @override
  String get homeMarkAsRead => '既読にする';

  @override
  String get homeEditChannel => 'チャンネルを編集';

  @override
  String get homeDeleteChannel => 'チャンネルを削除';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return '#$channelNameを削除しますか？この操作は元に戻せません。';
  }

  @override
  String get homeDeleteButton => '削除';

  @override
  String get homeCreateChannelHere => 'ここにチャンネルを作成';

  @override
  String get homeEditCategory => 'カテゴリーを編集';

  @override
  String get homeDeleteCategory => 'カテゴリーを削除';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return '「$categoryName」を削除しますか？中のチャンネルは未分類になります。';
  }

  @override
  String get homeReplyAction => '返信';

  @override
  String get homeCreateThreadAction => 'スレッドを作成';

  @override
  String get homeEditMessageAction => 'メッセージを編集';

  @override
  String get homeDeleteMessageAction => 'メッセージを削除';

  @override
  String get homePinMessageAction => 'メッセージをピン留め';

  @override
  String get homeUnpinMessageAction => 'ピン留めを解除';

  @override
  String get homeReportMessageAction => 'メッセージを報告';

  @override
  String get homeReportSubmitted => '報告を送信しました。';

  @override
  String get homeAddReactionTitle => 'リアクションを追加';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'スレッド$count件',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'カテゴリーオプション';

  @override
  String get homeChannelOptionsTooltip => 'チャンネルオプション';

  @override
  String get homeOpenVoiceChatTooltip => 'チャットを開く';

  @override
  String get homeMarketplaceLabel => 'マーケットプレイス';

  @override
  String get homeSelectChannelPrompt => 'チャンネルを選択してください';

  @override
  String get homeSearchTooltip => '検索';

  @override
  String get homePinnedMessagesTooltip => 'ピン留めされたメッセージ';

  @override
  String get homeWaitingForKey => '暗号化キーの到着を待っています...';

  @override
  String get homeUnableToDecrypt => 'このメッセージを復号できません。';

  @override
  String get homeMessageActionsTooltip => 'メッセージ操作';

  @override
  String get homeCancelReplyTooltip => '返信をキャンセル';

  @override
  String get homeRemoveAttachmentTooltip => '添付ファイルを削除';

  @override
  String get homeAttachFileTooltip => 'ファイルを添付';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return '#$channelName にメッセージを送信';
  }

  @override
  String get homeSendMessageTooltip => 'メッセージを送信';

  @override
  String get homeEditMessageTitle => 'メッセージを編集';

  @override
  String get homeMessageLabel => 'メッセージ';

  @override
  String get homePinnedMessagesTitle => 'ピン留めされたメッセージ';

  @override
  String get homeNoPinnedMessages => 'ピン留めされたメッセージはありません';

  @override
  String get homeUnpinTooltip => 'ピン留め解除';

  @override
  String get homeCreateThreadTitle => 'スレッドを作成';

  @override
  String get homeThreadNameHint => 'スレッド名';

  @override
  String homeThreadCreated(String name) {
    return 'スレッド「$name」を作成しました！';
  }

  @override
  String get homeCreateOrJoinTooltip => '作成または参加';

  @override
  String get homeKodaMarketplaceTooltip => 'Kodaマーケットプレイス';

  @override
  String get homeAdminPanelTooltip => '管理パネル';

  @override
  String get homeServerSettingsTooltip => 'サーバー設定';

  @override
  String get homeSettingsTooltip => '設定';

  @override
  String get homeContentWarningBadge => 'コンテンツ警告';

  @override
  String get homeDirectMessagesTooltip => 'ダイレクトメッセージ';

  @override
  String homeReplyingTo(String username) {
    return '$usernameに返信中';
  }

  @override
  String get homeAttachmentFallback => '添付ファイル';

  @override
  String get homeAttachmentUploadFailed => '添付ファイルのアップロードに失敗しました。';

  @override
  String homeSavedAttachment(String fileName) {
    return '$fileName を保存しました';
  }

  @override
  String serverConnectError(String service) {
    return '$serviceへの接続を開始できませんでした。';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Printfulとの連携を解除しますか？';

  @override
  String get serverDisconnectPrintfulBody => '再接続するまで、このサーバーはグッズ注文を処理できなくなります。';

  @override
  String get serverDisconnectTiltifyTitle => 'Tiltifyとの連携を解除しますか？';

  @override
  String get serverDisconnectTiltifyBody =>
      '再接続するまで、このサーバーはチャリティキャンペーンの進捗を表示しなくなります。';

  @override
  String get serverNewRoleTitle => '新しいロール';

  @override
  String get serverEditRoleTitle => 'ロールを編集';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'カラー $hex';
  }

  @override
  String get permViewChannels => 'チャンネルを見る';

  @override
  String get permSendMessages => 'メッセージを送信';

  @override
  String get permConnectVoice => 'ボイスに接続';

  @override
  String get permManageServer => 'サーバーを管理';

  @override
  String get permManageChannels => 'チャンネルを管理';

  @override
  String get permManageRoles => 'ロールを管理';

  @override
  String get permManageMessages => 'メッセージを管理';

  @override
  String get permKickMembers => 'メンバーをキック';

  @override
  String get permBanMembers => 'メンバーをBAN';

  @override
  String get permMuteMembers => 'メンバーをミュート';

  @override
  String get permMentionEveryone => '@everyoneをメンション';

  @override
  String get permManageMarketplace => 'マーケットプレイスを管理';

  @override
  String get permAnnounceLive => '配信通知';

  @override
  String get permMoveMembers => 'メンバーの移動 (ボイス)';

  @override
  String get serverRoleNameHint => 'ロール名';

  @override
  String get serverColorLabel => 'カラー';

  @override
  String get serverPermissionsLabel => '権限';

  @override
  String get serverSelfAssignableTitle => '自己割り当て可能';

  @override
  String get serverSelfAssignableSubtitle => 'メンバーが自分でこのロールを付与できます';

  @override
  String get serverDefaultRoleUndeletable => 'デフォルトロールは削除できません。';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'ロール「$roleName」を削除しますか？';
  }

  @override
  String get serverCouldNotDeleteRole => 'そのロールを削除できませんでした。';

  @override
  String get serverMemberFallback => 'メンバー';

  @override
  String get serverNoRolesYet => 'まだロールがありません。';

  @override
  String get serverRefreshStatus => 'ブラウザで接続済みですか？ステータスを更新';

  @override
  String get serverPrintfulConnected => 'Printful連携済み';

  @override
  String get serverPrintfulNotConnected => 'Printful未連携';

  @override
  String get serverPrintfulDescription =>
      'このサーバーのPrintfulアカウントを連携すると、Koda経由で行われたグッズ注文を処理できます。サーバーごとに独自のストアを連携します。';

  @override
  String get serverConnecting => '接続中...';

  @override
  String get serverConnectPrintful => 'Printfulと連携';

  @override
  String get serverTiltifyConnected => 'Tiltify連携済み';

  @override
  String get serverTiltifyNotConnected => 'Tiltify未連携';

  @override
  String get serverTiltifyDescription =>
      'このサーバーのTiltifyアカウントを連携すると、チャリティキャンペーンのライブ進捗を全メンバーに表示できます。読み取り専用です -- KodaがTiltify側で投稿や変更を行うことはありません。';

  @override
  String get serverConnectTiltify => 'Tiltifyと連携';

  @override
  String get serverNoTiltifyCampaigns => 'このTiltifyアカウントにキャンペーンが見つかりません。';

  @override
  String get serverPickCampaign => '表示するキャンペーンを選択してください';

  @override
  String get serverUntitledCampaign => '無題のキャンペーン';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '$goalの目標のうち$currency $raisedを集めました';
  }

  @override
  String get serverViewCampaign => 'キャンペーンを見る';

  @override
  String get serverRefreshButton => '更新';

  @override
  String get serverUploadButton => 'アップロード';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '$used / $limit 枠を使用中 -- ブーストレベル $level';
  }

  @override
  String get serverNoCustomEmoji => 'まだカスタム絵文字がありません。';

  @override
  String get serverDeleteEmojiTooltip => '絵文字を削除';

  @override
  String get serverUploadEmojiTitle => '絵文字をアップロード';

  @override
  String get serverEmojiNameHint => '名前（英数字、_）';

  @override
  String get serverChooseImage => '画像を選択';

  @override
  String serverCurrentBoostLevel(int level) {
    return '現在のブーストレベル: $level';
  }

  @override
  String get serverBackgroundTitle => 'サーバー背景';

  @override
  String get serverBackgroundDescription =>
      'このサーバーの全員にチャンネル画面の背景として表示されるカスタム背景です。';

  @override
  String get serverBackgroundLockedHint => 'ブーストレベル4に到達するとカスタム背景が解放されます。';

  @override
  String get serverIconBorderTitle => 'サーバーアイコンの枠';

  @override
  String get serverIconBorderDescription =>
      '全メンバーのサーバーリストで、このサーバーのアイコン周りに表示されるアクセントの枠です。';

  @override
  String get serverIconBorderLockedHint => 'ブーストレベル5に到達するとカスタムアイコンの枠が解放されます。';

  @override
  String get serverBoostFromBank =>
      'マーケットプレイスのサーバーバンクからこのサーバーをブーストしてレベルを上げましょう。';

  @override
  String get serverMarketplaceListingLabel => 'マーケットプレイス掲載';

  @override
  String get serverListInMarketplace => 'Kodaマーケットプレイスに掲載';

  @override
  String get serverListInMarketplaceDescription =>
      'このサーバーのストアをKoda Marketplaceに掲載し、毎週のおすすめ商品ローテーションに選ばれるチャンスを得ます。これは買い物に関するものであり、参加するサーバーを探すこととは無関係です -- 一般のサーバー検索には影響しません。';

  @override
  String get serverSocialLinkLabel => 'SNS / 招待リンク（任意）';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'リンクを保存';

  @override
  String get serverPricingLabel => '価格設定';

  @override
  String get serverPrimaryCurrencyLabel => '基本通貨';

  @override
  String get serverPrimaryCurrencyDescription =>
      'このサーバーで設定するサーバーサブスクリプションのランクやデジタルグッズの価格に適用されます。';

  @override
  String get serverPrimaryLanguageLabel => '主要言語';

  @override
  String get serverPrimaryLanguageDescription =>
      'メンバーがこの設定と異なる言語で投稿したメッセージには、小さな言語バッジが表示されます。';

  @override
  String get serverMarketplaceLinkSaved => 'マーケットプレイスのリンクを保存しました。';

  @override
  String get serverIconUpdated => 'サーバーアイコンを更新しました！';

  @override
  String get serverTemplateImported => 'テンプレートをインポートしました！';

  @override
  String get serverImportFromDiscord => 'Discordからインポート';

  @override
  String get serverVispPlanLive => 'Vispのプランが完成しました！';

  @override
  String get serverAskVisp => 'Vispに聞く';

  @override
  String get serverAddCategoryButton => 'カテゴリーを追加';

  @override
  String get serverAddChannelHereTooltip => 'ここにチャンネルを追加';

  @override
  String get serverRename => '名前を変更';

  @override
  String get serverUncategorized => '未分類';

  @override
  String get serverAddChannel => 'チャンネルを追加';

  @override
  String get serverEditRulesContent => 'ルールの内容を編集';

  @override
  String get serverRulesContentHint => 'ここにサーバーのルールを入力してください...';

  @override
  String get serverRulesUpdated => 'ルールを更新しました！';

  @override
  String get serverAddRole => 'ロールを追加';

  @override
  String get serverDefaultRoleLabel => 'デフォルトロール';

  @override
  String get serverManageRolesTooltip => 'ロールを管理';

  @override
  String get serverMutedLabel => 'ミュート中';

  @override
  String get serverExpandedLabel => '展開';

  @override
  String get serverCollapsedLabel => '折りたたみ';

  @override
  String get serverUnmute => 'ミュート解除';

  @override
  String get serverMute => 'ミュート';

  @override
  String get serverKick => 'キック';

  @override
  String get serverBan => 'BAN';

  @override
  String serverBannedUsersLabel(int count) {
    return 'BANされたユーザー — $count';
  }

  @override
  String get serverNoBannedUsers => 'BANされたユーザーはいません。';

  @override
  String get serverUnban => 'BAN解除';

  @override
  String get serverMemberFallbackGeneric => 'このメンバー';

  @override
  String serverBanConfirm(String username, String serverName) {
    return '$usernameを$serverNameからBANしますか？BAN解除されるまで再参加できません。';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return '$usernameを$serverNameからキックしますか？招待があれば再参加できます。';
  }

  @override
  String get serverMuteDuration60Sec => '60秒';

  @override
  String get serverMuteDuration5Min => '5分';

  @override
  String get serverMuteDuration10Min => '10分';

  @override
  String get serverMuteDuration1Hour => '1時間';

  @override
  String get serverMuteDuration1Day => '1日';

  @override
  String get serverMuteDuration1Week => '1週間';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return '$usernameを$actionできませんでした。';
  }

  @override
  String serverMuteUserTitle(String username) {
    return '$usernameをミュート';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return '$usernameをミュートできませんでした。';
  }

  @override
  String get serverUnlockInvites => '招待のロックを解除';

  @override
  String get serverInvitesUnlocked => '招待のロックを解除しました。';

  @override
  String get serverAuditLogDescription =>
      'レベル1のモデレーション活動 -- キック、BAN、ミュート、荒らし/フラッド対策の自動処理。メタデータのみで、メッセージ内容は含まれません。';

  @override
  String get serverSystemActor => 'システム';

  @override
  String get serverActionKicked => 'キックしました';

  @override
  String get serverActionBanned => 'BANしました';

  @override
  String get serverActionUnbanned => 'BANを解除しました';

  @override
  String get serverActionMuted => 'ミュートしました';

  @override
  String get serverActionUnmuted => 'ミュートを解除しました';

  @override
  String get serverActionFloodDetected => 'フラッドのため自動ミュートされました';

  @override
  String get serverActionRaidLockdownEnabled => '招待をロックしました（荒らし対策）';

  @override
  String get serverActionRaidLockdownDisabled => '招待のロックを解除しました';

  @override
  String get serverActionMoved => '移動させました';

  @override
  String get serverUnknownAction => '不明な操作';

  @override
  String get serverNoModerationActivity => 'まだモデレーション活動がありません。';

  @override
  String get serverReportsDescription =>
      'このサーバーのメンバーによって報告されたメッセージ -- 報告者自身の復号済みコピーが、報告により開示されたものです。';

  @override
  String get serverNoPendingReports => '保留中の報告はありません。';

  @override
  String get serverReportReasonOther => 'その他';

  @override
  String get serverReportStatusActioned => '対応済み';

  @override
  String get serverReportStatusDismissed => '却下済み';

  @override
  String get serverResolvedLabel => '解決済み';

  @override
  String serverReportedBy(String reporter, String target) {
    return '$reporterが報告 -- 送信者: $target';
  }

  @override
  String serverReportNote(String note) {
    return 'メモ: $note';
  }

  @override
  String get serverDismissButton => '却下';

  @override
  String get serverMarkActioned => '対応済みにする';

  @override
  String get serverCreateInvite => '招待を作成';

  @override
  String get serverInviteCreatedTitle => '招待を作成しました';

  @override
  String get serverNoActiveInvites => '有効な招待がありません';

  @override
  String serverUsesLabel(String uses) {
    return '使用回数: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => '招待を削除';

  @override
  String get serverChangeIconLabel => 'サーバーアイコンを変更';

  @override
  String get serverFallbackName => 'サーバー';

  @override
  String serverSettingsTitle(String serverName) {
    return '$serverNameの設定';
  }

  @override
  String get serverTabChannels => 'チャンネル';

  @override
  String get serverTabRoles => 'ロール';

  @override
  String get serverTabMembers => 'メンバー';

  @override
  String get serverTabInvites => '招待';

  @override
  String get serverTabMerch => 'グッズ';

  @override
  String get serverTabEmoji => '絵文字';

  @override
  String get serverTabCustomize => 'カスタマイズ';

  @override
  String get serverTabAuditLog => '監査ログ';

  @override
  String get serverTabReports => '報告';

  @override
  String get serverTabThresholdMod => 'しきい値モデレーション';

  @override
  String get serverTabCharity => 'チャリティ';

  @override
  String get homeCustomEmojiFallback => 'カスタム絵文字';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'リアクション$count件',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted => '、あなたがリアクションしました。操作すると削除されます';

  @override
  String get homeReactionActivateToAdd => '、操作すると追加されます';

  @override
  String get homeAddReactionLabel => 'リアクションを追加';

  @override
  String homeViewProfile(String username) {
    return '$usernameのプロフィールを見る';
  }

  @override
  String get homeMoveToVoiceChannel => 'ボイスチャンネルに移動…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'ボイスチャンネルを選択';

  @override
  String get homeNoOtherVoiceChannels => '他のボイスチャンネルはありません';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username を $channel に移動しました';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return '$username を移動できませんでした';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return '$channel に移動しました';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return '話すには$channelに参加してください';
  }

  @override
  String get adminPanelTitle => '管理パネル';

  @override
  String get adminTabBackerCodes => 'バッカーコード';

  @override
  String get adminTabUsers => 'ユーザー';

  @override
  String get adminTabDmReports => 'DM通報';

  @override
  String get adminTabSpamFlags => 'スパムフラグ';

  @override
  String get adminTabWiki => 'Wiki';

  @override
  String get adminTabBoosts => 'ブースト';

  @override
  String get adminCreateBackerCodeTitle => 'バッカーコードを作成';

  @override
  String get adminCodeHint => 'コード（空欄で自動生成）';

  @override
  String get adminNoteHint => 'メモ（例：「Kickstarter Tier 2」）';

  @override
  String get adminFlagsJsonHint =>
      'フラグをJSON形式で（例：\"backer_tier\":\"founding\"）';

  @override
  String get adminMaxUsesHint => '最大使用回数（空欄で無制限）';

  @override
  String get adminCodeCreatedTitle => 'コードを作成しました';

  @override
  String get adminCodeLabel => 'コード：';

  @override
  String get adminCopyCodeTooltip => 'コードをコピー';

  @override
  String adminFlagsValue(String flags) {
    return 'フラグ：$flags';
  }

  @override
  String get adminBackerCodesHeader => 'バッカー＆リワードコード';

  @override
  String get adminNewCodeButton => '新規コード';

  @override
  String get adminNoCodesYet => 'コードはまだありません';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses 回使用';
  }

  @override
  String get adminSearchUsersHint => 'ユーザー名でユーザーを検索...';

  @override
  String get adminSearchUsersPrompt => '上でユーザーを検索してください';

  @override
  String get adminNoDmReports => 'DM通報はありません。';

  @override
  String get adminResolvedLabel => '解決済み';

  @override
  String get adminReasonOther => 'その他';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return '通報者：$reporterId\n開示された送信者：$targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'メモ：$note';
  }

  @override
  String get adminDismissButton => '却下';

  @override
  String get adminMarkActionedButton => '対応済みにする';

  @override
  String get adminStatusActioned => '対応済み';

  @override
  String get adminStatusDismissed => '却下済み';

  @override
  String get adminNoSpamFlags => 'スパムフラグはありません。';

  @override
  String get adminFlagMassDmSpam => '大量DMスパム';

  @override
  String get adminFlagRaidLockdown => 'レイド・ロックダウン';

  @override
  String get adminFlagBotBehavior => 'ボットのような挙動';

  @override
  String get adminFlagChannelFlooding => 'チャンネル荒らし';

  @override
  String get adminAutoEscalatedBadge => '自動エスカレーション';

  @override
  String adminConfidenceLabel(String score, String label) {
    return '信頼度：$score%（$label）';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'ユーザー：$userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'サーバー：$serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '参加者$totalJoiners人中$mutedCount人がまだミュート中';
  }

  @override
  String get adminNoJoinersMuted => '現在ミュート中の参加者はいません';

  @override
  String adminRestrictedUntil(String until) {
    return '現在 $until まで制限中';
  }

  @override
  String get adminNotCurrentlyRestricted => '現在制限されていません';

  @override
  String get adminDismissUndoButton => '却下して元に戻す';

  @override
  String get adminConfirmRestrictButton => '確認して制限';

  @override
  String get adminDeleteArticleTitle => '記事を削除しますか？';

  @override
  String adminDeleteArticleBody(String title) {
    return '「$title」はVispのナレッジベースから削除されます。';
  }

  @override
  String get adminNewArticleTitle => '新しい記事';

  @override
  String get adminEditArticleTitle => '記事を編集';

  @override
  String get adminArticleTitleHint => 'タイトル';

  @override
  String get adminArticleContentHint => '記事の内容（Markdown）';

  @override
  String get adminWikiArticlesHeader => 'Wiki記事';

  @override
  String get adminNoArticlesYet => '記事はまだありません';

  @override
  String get adminEditArticleTooltip => '記事を編集';

  @override
  String get adminDeleteArticleTooltip => '記事を削除';

  @override
  String get adminSearchServersHint => 'サーバー名でサーバーを検索...';

  @override
  String get adminSearchServersPrompt => '上でサーバーを検索してください';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return '$serverNameにブーストを付与';
  }

  @override
  String get adminNumBoostsHint => 'ブースト数';

  @override
  String get adminGrantButton => '付与';

  @override
  String get adminPositiveNumberError => '正の整数を入力してください。';

  @override
  String get adminGrantBoostsFailed => 'ブーストの付与に失敗しました。';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$serverNameに$count個のブーストを付与しました -- 現在レベル$level（$activeCount件アクティブ）。',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return 'メンバー$count人';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'ブーストを付与';

  @override
  String get parentalDashboardTitle => 'ファミリー';

  @override
  String get parentalDashboardCreateChildTitle => '子どもアカウントを作成';

  @override
  String get parentalDashboardUsernameHint => 'ユーザー名';

  @override
  String get parentalDashboardEmailHint => 'メールアドレス';

  @override
  String get parentalDashboardPasswordHint => 'パスワード';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'これにより、完全に保護者管理下のアカウントが作成されます。ラベル付けされたチャンネルはブロックされ、利用可能な時間帯を設定できるほか、友だちやサーバーを確認（内容は閲覧不可）できるようになります。';

  @override
  String get parentalDashboardValidationError =>
      'ユーザー名、メールアドレス、8文字以上のパスワードが必要です。';

  @override
  String get parentalDashboardCreateChildFailed =>
      '子どもアカウントを作成できませんでした -- ユーザー名またはメールアドレスがすでに使用されている可能性があります。';

  @override
  String get parentalDashboardCreatingLabel => '作成中...';

  @override
  String get parentalDashboardNoChildren => '連携されたアカウントはまだありません。';

  @override
  String get parentalDashboardSupervisedLabel => '保護者管理下のアカウント';

  @override
  String get parentalDashboardUnknownUser => '不明';

  @override
  String get childDetailFallbackTitle => '子どもアカウント';

  @override
  String get childDetailTabFriends => 'フレンド';

  @override
  String get childDetailTabServers => 'サーバー';

  @override
  String get childDetailTabSchedule => 'スケジュール';

  @override
  String get childDetailTabOverride => '特例許可';

  @override
  String get childDetailNoFriends => 'フレンドはいません。';

  @override
  String get childDetailUnknownUser => '不明';

  @override
  String get childDetailRemoveFriendTooltip => 'フレンドを削除';

  @override
  String get childDetailNoServers => 'どのサーバーにも参加していません。';

  @override
  String childDetailMemberCount(int count) {
    return 'メンバー$count人';
  }

  @override
  String get childDetailRemoveServerTooltip => 'サーバーから削除';

  @override
  String get childDetailRestrictAccessTitle => '指定した時間帯にアクセスを制限';

  @override
  String get childDetailRestrictAccessSubtitle => 'オフの場合、いつでも制限なくアクセスできます';

  @override
  String get childDetailTimezoneLabel => 'タイムゾーン';

  @override
  String get childDetailMonday => '月曜日';

  @override
  String get childDetailTuesday => '火曜日';

  @override
  String get childDetailWednesday => '水曜日';

  @override
  String get childDetailThursday => '木曜日';

  @override
  String get childDetailFriday => '金曜日';

  @override
  String get childDetailSaturday => '土曜日';

  @override
  String get childDetailSunday => '日曜日';

  @override
  String get childDetailNoAccessLabel => 'アクセス不可';

  @override
  String get childDetailToLabel => '〜';

  @override
  String get childDetailSavingLabel => '保存中...';

  @override
  String get childDetailSaveScheduleButton => 'スケジュールを保存';

  @override
  String get childDetailScheduleSaved => 'スケジュールを保存しました。';

  @override
  String get childDetailOverrideExplanation =>
      '通常のスケジュール以外でも一時的にアクセスを許可します -- 週間スケジュールを変更せずに、一度限りの例外を設けたい場合に便利です。';

  @override
  String get childDetailReasonHint => '理由（任意）';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes分';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours時間';
  }

  @override
  String get childDetailRevokeOverrideButton => '有効な特例許可を取り消す';

  @override
  String get childDetailAccessGranted => '一時的なアクセスを許可しました。';

  @override
  String get childDetailOverrideRevoked => '特例許可を取り消しました。';

  @override
  String get digitalGoodsTitle => 'デジタル商品';

  @override
  String get digitalGoodsMyProductsTitle => 'マイ商品';

  @override
  String get digitalGoodsManageProductsTooltip => 'このサーバーの商品を管理';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => '閲覧に切り替え';

  @override
  String get digitalGoodsCreateProductTooltip => '商品を作成';

  @override
  String get digitalGoodsBrowseTab => '閲覧';

  @override
  String get digitalGoodsMyListingsTab => 'マイ出品';

  @override
  String get digitalGoodsMyPurchasesTab => 'マイ購入履歴';

  @override
  String get digitalGoodsNoProductsYet => '商品はまだありません';

  @override
  String get digitalGoodsNoProductsAvailable => '利用できる商品はありません';

  @override
  String get digitalGoodsCreateFirstProductHint => '最初の商品を作成して販売を始めましょう';

  @override
  String get digitalGoodsCheckBackLater => 'デジタル商品は後でまた確認してください';

  @override
  String get digitalGoodsCreateProductButton => '商品を作成';

  @override
  String get digitalGoodsLicenseKeyBadge => 'ライセンスキー';

  @override
  String get digitalGoodsFileBadge => 'ファイル';

  @override
  String get digitalGoodsAllServersBadge => '全サーバー';

  @override
  String get digitalGoodsFreeForYou => 'あなたは無料';

  @override
  String get digitalGoodsFreeLabel => '無料';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count個販売済み';
  }

  @override
  String get digitalGoodsKeysButton => 'キー';

  @override
  String get digitalGoodsGetForFree => '無料で入手';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return '$priceで購入';
  }

  @override
  String get digitalGoodsNoPurchasesYet => '購入履歴はまだありません';

  @override
  String get digitalGoodsUnknownProduct => '不明な商品';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return '$dateに購入';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'キーをコピー';

  @override
  String get digitalGoodsLicenseKeyCopied => 'ライセンスキーをコピーしました！';

  @override
  String digitalGoodsExpiresOn(String date) {
    return '$dateに期限切れ';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'あなたのライセンスキー';

  @override
  String get digitalGoodsCopyKeyButton => 'キーをコピー';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'チェックアウトを開始できませんでした -- この制作者はまだStripeを連携していない可能性があります。';

  @override
  String get digitalGoodsPurchaseComplete => '購入が完了しました！マイ購入履歴からご確認ください。';

  @override
  String get digitalGoodsPurchasePending =>
      'まだ支払いの完了を待っています -- 完了するとマイ購入履歴に表示されます。';

  @override
  String get digitalGoodsCreateProductTitle => '商品を作成';

  @override
  String get digitalGoodsEditProductTitle => '商品を編集';

  @override
  String get digitalGoodsProductTitleHint => '商品タイトル';

  @override
  String get digitalGoodsDescriptionHint => '説明（任意）';

  @override
  String get digitalGoodsPriceHint => '価格（USD、無料の場合は空欄）';

  @override
  String get digitalGoodsProductTypeLabel => '商品タイプ';

  @override
  String get digitalGoodsFileDownloadOption => 'ファイルダウンロード';

  @override
  String get digitalGoodsLicenseKeyOption => 'ライセンスキー';

  @override
  String get digitalGoodsAvailabilityLabel => '公開範囲';

  @override
  String get digitalGoodsThisServerOnlyOption => 'このサーバーのみ';

  @override
  String get digitalGoodsAllKodaServersOption => 'すべてのKodaサーバー';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      '作成後、「キー」ボタンからライセンスキーをアップロードしてください。';

  @override
  String get digitalGoodsProductFileLabel => '商品ファイル';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName（${sizeMb}MB）';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'ファイルを削除';

  @override
  String get digitalGoodsUploadingLabel => 'アップロード中...';

  @override
  String get digitalGoodsChooseFileButton => 'ファイルを選択';

  @override
  String get digitalGoodsReplaceFileButton => 'ファイルを置き換え';

  @override
  String get digitalGoodsChooseFileBeforeSaving => '保存する前に、この商品のファイルを選択してください。';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'ライセンスキーをアップロード';

  @override
  String get digitalGoodsPasteKeysHint => '1行につき1つのキーを貼り付けてください：';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'キーをアップロード';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'ライセンスキーをアップロードしました！';

  @override
  String get serverSubscriptionManageTitle => 'サブスクリプションを管理';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return '$serverNameのサブスクリプション';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'ティアを追加';

  @override
  String get serverSubscriptionNoTiersYet => 'サブスクリプションティアはまだありません';

  @override
  String get serverSubscriptionCreateUpTo3Tiers => 'コミュニティ向けに最大3つのティアを作成できます';

  @override
  String get serverSubscriptionCreateFirstTierButton => '最初のティアを作成';

  @override
  String get serverSubscriptionShowSubscriberCounts => '購読者数を表示';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/月';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'アクティブな購読者$count人',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned => 'ロールを自動付与';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return 'マーケットプレイス$discount%割引';
  }

  @override
  String get serverSubscriptionNoTiersMember => 'このサーバーにはサブスクリプションティアがありません';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'アクティブな購読者';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return '$dateに期限切れ';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk => '購読者専用ロール';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return 'マーケットプレイス購入$discount%オフ';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk => '購読者専用チャンネル';

  @override
  String get serverSubscriptionCurrentlySubscribed => '購読中';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return '$price/月で購読する';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'ティアを作成';

  @override
  String get serverSubscriptionEditTierTitle => 'ティアを編集';

  @override
  String get serverSubscriptionTierNameHint => 'ティア名（例：Fan、Supporter、VIP）';

  @override
  String get serverSubscriptionDescriptionHint => '説明（任意）';

  @override
  String get serverSubscriptionPriceHint => '月額料金（USD）';

  @override
  String get serverSubscriptionDiscountLabel => 'マーケットプレイス割引率';

  @override
  String get serverSubscriptionPositionLabel => '位置';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'ティア$position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel => '購読時に付与するロール — 任意';

  @override
  String get serverSubscriptionRoleFallback => 'ロール';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'メンバーが購読した瞬間に自動的に付与され、購読が終了した瞬間に取り消されます。';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'ティアを作成しました -- メンバーが購読できるようにするには、マーケットプレイス→クリエイターでStripeを連携してください。';

  @override
  String get serverSubscriptionDeleteTierTitle => 'ティアを削除';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return '「$tierName」を削除しますか？既存の購読者は期限まで利用を継続できます。';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return '$tierNameを購読';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel => '月額サブスクリプション';

  @override
  String get serverSubscriptionServerBankEarnsLabel => 'サーバーバンクの収益';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points pt';
  }

  @override
  String get serverSubscriptionPaymentSecureNote => 'お支払いはStripeにより安全に処理されます';

  @override
  String get serverSubscriptionSubscribeButton => '購読する';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'チェックアウトを開始できませんでした -- このサーバーのオーナーはまだStripeを連携していない可能性があります。';

  @override
  String get serverSubscriptionSubscribed => '購読しました！';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'まだ支払いの完了を待っています -- 完了すると有効になります。';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return '$usernameにチップを送る';
  }

  @override
  String get tipDialogSelectAmountLabel => '金額を選択';

  @override
  String get tipDialogMessageHint => 'メッセージを追加（任意）';

  @override
  String get tipDialogYouPayLabel => 'お支払い額';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$usernameの受取額';
  }

  @override
  String get tipDialogSendTipButton => 'チップを送る';

  @override
  String get tipDialogFailedToSendTip =>
      'チップの送信に失敗しました。制作者がStripeと連携していない可能性があります。';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'チェックアウトを開始できませんでした。しばらくしてから再度お試しください。';

  @override
  String get tipDialogTipSent => 'チップを送信しました！';

  @override
  String get tipDialogTipPending => 'まだ支払いの完了を待っています -- 完了すると処理されます。';

  @override
  String get tipDialogUnknownUser => '不明';

  @override
  String get marketplaceTitle => 'マーケットプレイス';

  @override
  String get marketplaceCreatorPayoutsTitle => 'クリエイター報酬';

  @override
  String get marketplaceReceiveTipsSubtitle => 'Stripe経由で直接チップを受け取る';

  @override
  String get marketplaceTabServerBank => 'サーバーバンク';

  @override
  String get marketplaceTabDigitalGoods => 'デジタル商品';

  @override
  String get marketplaceTabMerch => 'グッズ';

  @override
  String get marketplaceTabSubscription => 'サブスクリプション';

  @override
  String get marketplaceTabRevenue => '収益';

  @override
  String get marketplaceSelectServerSubscription =>
      'サブスクリプションを表示するサーバーを選択してください';

  @override
  String get marketplaceSelectServerBank => 'バンクを表示するサーバーを選択してください';

  @override
  String get marketplaceSelectServerRevenue => '収益を表示するサーバーを選択してください';

  @override
  String get marketplaceStripeAccountStatus => 'Stripeアカウント';

  @override
  String get marketplaceOnboardingCompleteStatus => 'オンボーディング完了';

  @override
  String get marketplaceAcceptingPaymentsStatus => '支払いを受付中';

  @override
  String get marketplaceConnectStripeButton => 'Stripeアカウントと連携';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Stripeのオンボーディングを完了する';

  @override
  String get marketplaceRefreshStatusButton => '状態を更新';

  @override
  String get marketplaceReadyToReceiveTips => 'チップを受け取る準備ができました！';

  @override
  String get marketplaceHowItWorksTitle => '使い方';

  @override
  String get marketplaceHowItWorksStep1 => 'Stripeアカウントを連携する';

  @override
  String get marketplaceHowItWorksStep2 => '本人確認を完了する';

  @override
  String get marketplaceHowItWorksStep3 => '銀行口座に直接チップを受け取る';

  @override
  String get marketplaceProcessingFeeNote =>
      'Kodaは5%の手数料を徴収します。手数料はポイントとしてサーバーのバンクに入ります。';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'サーバーオーナー、またはマーケットプレイス管理権限を持つユーザーのみがサーバーバンクを閲覧できます。';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverNameをブーストしました！';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return 'カスタム絵文字スロット$limit個';
  }

  @override
  String get marketplaceServerFallback => 'サーバー';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance pt';
  }

  @override
  String marketplaceInActivity(String amount) {
    return 'アクティビティ $amount';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'ポイントは、このサーバーでのチップとサブスクリプションにかかる5%の手数料から得られます。ポイントを使ってサーバーのアップグレードを解除できます。';

  @override
  String get marketplaceServerBoostsTitle => 'サーバーブースト';

  @override
  String marketplaceLevelLabel(int level) {
    return 'レベル$level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'アクティブなブースト$count個',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: 'レベル$levelまであと$moreブースト',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix => '、カスタムサーバー背景を解除';

  @override
  String get marketplaceUnlockIconBorderSuffix => '、カスタムサーバーアイコンの枠を解除';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '利用可能なブーストトークンが$count個あります。',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'ブーストトークンはPulseサブスクリプション（月1個）から得られます。サブスクリプションタブで購読すると獲得できます。';

  @override
  String get marketplaceBoostingLabel => 'ブースト中...';

  @override
  String get marketplaceBoostThisServerButton => 'このサーバーをブースト';

  @override
  String get marketplaceComingSoonUpgradesTitle => '近日公開 — サーバーアップグレード';

  @override
  String get marketplaceSpendPointsList =>
      'サーバーバンクのポイントの使い道：\n• カスタムサーバードメイン\n• メンバー上限の増加\n• 優先サポート\n• 限定サーバーバッジ';

  @override
  String get marketplaceSourceTip => 'チップ';

  @override
  String get marketplaceSourceSubscription => 'Kodaサブスクリプション';

  @override
  String get marketplaceSourceServerSubscription => 'サーバーサブスクリプション';

  @override
  String get marketplaceSourceDigitalProduct => 'デジタル商品';

  @override
  String get marketplaceSourceStageTicket => 'ステージチケット';

  @override
  String get marketplaceSourcePrintfulOrder => 'グッズ注文';

  @override
  String get marketplaceJustNow => 'たった今';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return '$minutes分前';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return '$hours時間前';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return '$days日前';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'マーケットプレイスを管理できるメンバーのみが、このサーバーの収益を閲覧できます。';

  @override
  String get marketplaceBalanceLabel => '残高';

  @override
  String get marketplaceLifetimeEarnedLabel => '累計獲得額';

  @override
  String get marketplaceLast30DaysTitle => '過去30日間';

  @override
  String get marketplaceRevenueBySourceTitle => '収益源別内訳';

  @override
  String get marketplaceNoRevenueYet => '収益はまだありません。';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '取引$count件',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => '最近の取引';

  @override
  String get marketplaceNoTransactionsYet => '取引はまだありません。';

  @override
  String get marketplaceNoActivityYet => 'アクティビティはまだありません';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date：$amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Printfulから$count件の商品を同期しました',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Printfulとの同期に失敗しました -- グッズ設定で連携状況を確認してください。';

  @override
  String get printfulMerchSelectServer => 'グッズを表示するサーバーを選択してください';

  @override
  String get printfulMerchManageCatalogTitle => 'グッズカタログを管理';

  @override
  String get printfulMerchTitle => 'グッズ';

  @override
  String get printfulMerchSyncingLabel => '同期中...';

  @override
  String get printfulMerchSyncCatalogButton => 'カタログを同期';

  @override
  String get printfulMerchSwitchToBrowseTooltip => '閲覧に切り替え';

  @override
  String get printfulMerchManageTooltip => 'このサーバーのグッズを管理';

  @override
  String get printfulMerchNothingSyncedYet => 'まだ何も同期されていません';

  @override
  String get printfulMerchNoMerchAvailable => '利用できるグッズはまだありません';

  @override
  String get printfulMerchSyncHint => 'Printfulストアを同期して商品カタログを取り込みましょう';

  @override
  String get printfulMerchCheckBackLater => 'このサーバーのグッズは後でまた確認してください';

  @override
  String get printfulMerchOutOfStock => '在庫切れ';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$price〜 • $count個のオプション',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => '見る';

  @override
  String printfulMerchPayoutTo(String username) {
    return '支払い先: $username';
  }

  @override
  String get printfulMerchPayoutToYou => '支払い先: あなた';

  @override
  String get printfulMerchPayoutChangeButton => '変更';

  @override
  String get printfulMerchPayoutDialogTitle => '支払い受取人';

  @override
  String get printfulMerchPayoutDialogBody =>
      'この商品の注文収益の取り分を、自分ではなく別のユーザーに振り込みます -- 購入可能になる前に、その相手が自分自身のStripeアカウントを接続しオンボーディングを完了させる必要があります。';

  @override
  String get printfulMerchPayoutUsernameHint => 'ユーザー名';

  @override
  String get printfulMerchPayoutLookupButton => '検索';

  @override
  String get printfulMerchPayoutUserNotFound => 'その名前のユーザーは見つかりませんでした。';

  @override
  String printfulMerchPayoutResolvedAs(String username) {
    return '見つかりました: $username';
  }

  @override
  String get printfulMerchPayoutResetButton => '自分にリセット';

  @override
  String get printfulMerchCartTooltip => 'カート';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productNameをカートに追加しました';
  }

  @override
  String get printfulMerchQuantityLabel => '数量';

  @override
  String get printfulMerchDecreaseQuantityTooltip => '数量を減らす';

  @override
  String get printfulMerchIncreaseQuantityTooltip => '数量を増やす';

  @override
  String get printfulMerchAddToCartButton => 'カートに追加';

  @override
  String get printfulMerchOptionLabel => 'オプション';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'スタイル';

  @override
  String get printfulMerchSizeLabel => 'サイズ';

  @override
  String get printfulMerchYourCartTitle => 'あなたのカート';

  @override
  String get printfulMerchCartEmpty => 'カートは空です。';

  @override
  String get printfulMerchSubtotalLabel => '小計';

  @override
  String get printfulMerchCheckoutLabel => 'チェックアウト';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'カートから削除';

  @override
  String get printfulMerchFillShippingAddressFirst => 'まず配送先住所を入力してください。';

  @override
  String get printfulMerchCouldNotGetShippingRates => 'その住所の配送料金を取得できませんでした。';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'チェックアウトを開始できませんでした。しばらくしてから再度お試しください。';

  @override
  String get printfulMerchOrderPlaced => '注文が完了しました！';

  @override
  String get printfulMerchOrderPending => 'まだ支払いの完了を待っています -- 完了すると注文が確定します。';

  @override
  String get printfulMerchShippingSpeedLabel => '配送速度';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '営業日$min〜$max日';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => '配送料金を見積もる';

  @override
  String get printfulMerchPayButton => '支払う';

  @override
  String get kodaMarketplaceTitle => 'Kodaマーケットプレイス';

  @override
  String get kodaMarketplaceTabSubscriptions => 'サブスクリプション';

  @override
  String get kodaMarketplaceTabBoosts => 'ブースト';

  @override
  String get kodaMarketplaceTabDiscover => '見つける';

  @override
  String get kodaMarketplaceTierFreeName => '無料';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return '$dateに期限切れ';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks => 'アップグレードして特典を解除';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '利用可能なブーストトークンが$count個あります',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'トークンは、参加しているサーバーのサーバーバンクタブから、どのサーバーにも贈ることができます';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => 'カスタムアバターフレーム';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'プロフィールにSparkバッジ表示';

  @override
  String get kodaMarketplaceSparkPerkFileLimit => 'ファイルアップロード上限アップ（50MB）';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality => '優先ボイス品質';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'Sparkの特典すべて';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => 'アニメーションアバターフレーム';

  @override
  String get kodaMarketplacePulsePerkBadge => 'プロフィールにPulseバッジ表示';

  @override
  String get kodaMarketplacePulsePerkFileLimit => 'ファイルアップロード上限100MB';

  @override
  String get kodaMarketplacePulsePerkBoostToken => '毎月サーバーブーストトークン1個';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/月';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => '現在のプラン';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return '$nameを入手';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return '$nameを贈る';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return '$tierを贈る';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return '$tierを購読';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel => '贈る相手のユーザー名：';

  @override
  String get kodaMarketplaceUsernameHint => 'ユーザー名';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'サブスクリプション';

  @override
  String get kodaMarketplaceTotalLabel => '合計';

  @override
  String get kodaMarketplacePaymentSecureNote => 'お支払いはStripeにより安全に処理されます';

  @override
  String get kodaMarketplaceProceedToPaymentButton => '支払いに進む';

  @override
  String get kodaMarketplaceUserNotFound => 'ユーザーが見つかりません';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'チェックアウトを開始できませんでした。しばらくしてから再度お試しください。';

  @override
  String get kodaMarketplaceSubscriptionActive => 'サブスクリプションが有効になりました！';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'まだ支払いの完了を待っています -- 完了すると有効になります。';

  @override
  String get kodaMarketplaceBoostPurchased => 'ブーストを購入しました！';

  @override
  String get kodaMarketplaceBoostPending => 'まだ支払いの完了を待っています -- 完了すると準備が整います。';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count個利用可能';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'ブーストを購入';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      '一度限りの購入です -- Pulse購読者は更新のたびに無料トークンも1個もらえるため、定期的にブーストするならそちらの方がお得です。';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'ブーストを購入 -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Kodaマーケットプレイスに参加しているサーバーはまだありません。サーバーオーナーは、サーバーの「カスタマイズ」設定でこれをオンにできます。';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => '今週のおすすめ';

  @override
  String get kodaMarketplaceAllListedServersHeader => '掲載中のすべてのサーバー';

  @override
  String get kodaMarketplaceFeaturedItemsHeader => '注目のアイテム';

  @override
  String get kodaMarketplaceAllItemsHeader => 'すべてのアイテム';

  @override
  String get kodaMarketplaceServerFallback => 'サーバー';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'メンバー$count人',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceVisitStore => 'ストアを見る';

  @override
  String get calendarFallbackTitle => 'カレンダー';

  @override
  String get calendarAskVispTooltip => 'Vispに聞く';

  @override
  String get calendarCreateEventTooltip => 'イベントを作成';

  @override
  String get calendarPreviousMonthTooltip => '前の月';

  @override
  String get calendarNextMonthTooltip => '次の月';

  @override
  String get calendarTodayButton => '今日';

  @override
  String get calendarWeekdaySun => '日';

  @override
  String get calendarWeekdayMon => '月';

  @override
  String get calendarWeekdayTue => '火';

  @override
  String get calendarWeekdayWed => '水';

  @override
  String get calendarWeekdayThu => '木';

  @override
  String get calendarWeekdayFri => '金';

  @override
  String get calendarWeekdaySat => '土';

  @override
  String get calendarTodaySuffix => '、今日';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '、イベント$count件',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => '日付を選択してください';

  @override
  String get calendarNoEvents => 'イベントはありません';

  @override
  String get calendarSubscribeTooltip => '購読';

  @override
  String get calendarUnsubscribeTooltip => '購読解除';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return '繰り返し：$recurrence';
  }

  @override
  String get calendarTicketOwned => 'チケット所持済み';

  @override
  String calendarTicketPrice(String price) {
    return 'チケット$price';
  }

  @override
  String get calendarDeleteEventTitle => 'イベントを削除';

  @override
  String calendarDeleteEventConfirm(String title) {
    return '「$title」を削除しますか？この操作は元に戻せません。';
  }

  @override
  String get calendarEditEventTitle => 'イベントを編集';

  @override
  String get calendarCreateEventTitle => 'イベントを作成';

  @override
  String get calendarEventTitleHint => 'イベントタイトル';

  @override
  String get calendarDescriptionHint => '説明（任意）';

  @override
  String get calendarLocationHint => '場所（任意）';

  @override
  String calendarStartLabel(String timezone) {
    return '開始（$timezone）';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return '開始日時、$formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return '終了 — 任意（$timezone）';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return '終了日時、$formatted';
  }

  @override
  String get calendarNotSetLabel => '未設定';

  @override
  String get calendarTapToSetEndTime => 'タップして終了時刻を設定';

  @override
  String get calendarRecurrenceLabel => '繰り返し';

  @override
  String get calendarRecurrenceNone => '繰り返さない';

  @override
  String get calendarRecurrenceDaily => '毎日';

  @override
  String get calendarRecurrenceWeekly => '毎週';

  @override
  String get calendarRecurrenceMonthly => '毎月';

  @override
  String get calendarColorLabel => '色';

  @override
  String calendarColorSwatchLabel(String hex) {
    return '色 $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'チケット価格 — 任意';

  @override
  String get calendarLinkStageChannelLabel => 'ステージチャンネルにリンク — 任意';

  @override
  String get calendarStageChannelFallback => 'ステージ';

  @override
  String get discordImportFetchError => 'テンプレートを取得できませんでした。';

  @override
  String get discordImportApplyError => 'テンプレートの適用に失敗しました。もう一度お試しください。';

  @override
  String get discordImportTitle => 'Discordテンプレートをインポート';

  @override
  String get discordImportDescription =>
      'discord.newのリンクまたはテンプレートコードを貼り付けて、ロール、カテゴリー、チャンネルをこのサーバーにインポートします。';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 またはテンプレートコード';

  @override
  String get discordImportPreviewButton => 'プレビュー';

  @override
  String get discordImportTemplateFallback => 'テンプレート';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ロール$count件',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'カテゴリー$count件',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'チャンネル$count件',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel => '既存の構成を置き換える';

  @override
  String get discordImportReplaceWarning => '既存のチャンネル、カテゴリー、ロールはすべて完全に削除されます。';

  @override
  String get discordImportAddDescription => 'テンプレートは既存のサーバー構成に追加されます。';

  @override
  String get discordImportReplaceConfirmTitle => 'サーバー構成を置き換えますか？';

  @override
  String get discordImportReplaceConfirmBody =>
      'インポート前に、既存のチャンネル、カテゴリー、ロールがすべて完全に削除されます。この操作は元に戻せません。';

  @override
  String get discordImportYesReplace => 'はい、置き換える';

  @override
  String get discordImportReplaceAndImportButton => '置き換えてテンプレートをインポート';

  @override
  String get discordImportAddToServerButton => 'サーバーにテンプレートを追加';

  @override
  String get thresholdModConfigureTitle => 'しきい値モデレーションを設定';

  @override
  String get thresholdModConfigureExplanation =>
      '信頼できるモデレーターと、チャンネルの履歴の1エポックを復号する前に何人の同意が必要かを選択します。あなた自身も一方的な鍵は持てません -- このリストに含まれている場合のみ例外となります。';

  @override
  String get thresholdModThresholdLabel => 'しきい値：';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'しきい値を減らす';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'しきい値を増やす';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'モデレーター$count人中',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle => 'しきい値復号をリクエスト';

  @override
  String get thresholdModChannelLabel => 'チャンネル';

  @override
  String get thresholdModReasonHint => '理由 -- 指定されたすべてのモデレーターに表示されます';

  @override
  String get thresholdModRequestButton => 'リクエスト';

  @override
  String get thresholdModShareRelayed => 'シェアがリクエスト送信者に中継されました。';

  @override
  String get thresholdModNotEnoughShares =>
      '中継されたシェアがまだ足りません -- さらに多くのモデレーターが中継してから再度お試しください。';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'メッセージ$count件',
    );
    return 'エポック$epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages => 'このエポックには復号可能なメッセージがありません。';

  @override
  String get thresholdModExplanation =>
      'チャンネルの履歴を実際に復号するには、複数の指定モデレーターが積極的に同意する必要があります -- サーバーオーナーであっても、一人だけで行うことはできません。常に1つのエポック全体（前回のメンバー変更以降に送信されたすべて）のみが解除され、単一のメッセージが解除されることはありません。';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return '有効 -- モデレーター$count人、しきい値$threshold';
  }

  @override
  String get thresholdModNotConfigured => '未設定';

  @override
  String get thresholdModReconfigureButton => '再設定';

  @override
  String get thresholdModEnableButton => '有効にする';

  @override
  String get thresholdModNotEnabledForServer =>
      'このサーバーではしきい値モデレーションが有効になっていません。';

  @override
  String get thresholdModEnabledNotDesignated =>
      'このサーバーで有効になっています。あなたは指定モデレーターではありません。';

  @override
  String get thresholdModRequestsLabel => 'リクエスト';

  @override
  String get thresholdModRequestDecryptButton => '復号をリクエスト';

  @override
  String get thresholdModNoActiveRequests => 'アクティブなリクエストはありません。';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- エポック$epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => '保留中';

  @override
  String get thresholdModStatusApproved => '承認済み';

  @override
  String get thresholdModApproveButton => '承認';

  @override
  String get thresholdModRelayShareButton => '自分のシェアを中継';

  @override
  String get thresholdModTryReconstructButton => '再構築を試みる';

  @override
  String get roleSelectNoRolesAvailable => '自己割り当て可能なロールはありません。';

  @override
  String get roleSelectInstructions => '希望するロールを選択してください。ロールをタップして追加・削除できます。';

  @override
  String get rulesScreenAcceptError => 'ルールに同意できませんでした。もう一度お試しください。';

  @override
  String get rulesScreenSubtitle => 'サーバールール';

  @override
  String get rulesScreenScrollToRead => 'スクロールしてすべてのルールを読んでください';

  @override
  String get rulesScreenAcceptDisclaimer =>
      '「同意する」をクリックすることで、これらのルールに従うことに同意したものとみなされます。\n違反した場合、サーバーから削除されることがあります。';

  @override
  String get rulesScreenAcceptButton => 'ルールに同意する';

  @override
  String get rulesScreenReadAllToContinue => '続けるにはすべてのルールを読んでください';

  @override
  String get galleryNewPostTitle => '新規投稿';

  @override
  String get galleryChooseFileButton => 'ファイルを選択';

  @override
  String get galleryOrDivider => 'または';

  @override
  String get galleryPasteUrlHint => '画像/動画のURLを貼り付け';

  @override
  String get galleryTypeLabel => '種類';

  @override
  String get galleryImageOption => '画像';

  @override
  String get galleryVideoOption => '動画';

  @override
  String get galleryCaptionHint => 'キャプション（任意）';

  @override
  String get galleryPostButton => '投稿';

  @override
  String get galleryNewCollectionTitle => '新規コレクション';

  @override
  String get galleryCollectionNameHint => 'コレクション名';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return '「$collectionName」を削除しますか？中の投稿は未分類になります。';
  }

  @override
  String get galleryFeedTab => 'フィード';

  @override
  String get galleryCollectionsTab => 'コレクション';

  @override
  String get galleryNoPostsYet => '投稿はまだありません';

  @override
  String get galleryNoCollectionsYet => 'コレクションはまだありません';

  @override
  String get gallerySelectACollection => 'コレクションを選択してください';

  @override
  String get galleryNoPostsInCollection => 'このコレクションには投稿がありません';

  @override
  String get galleryAddPostButton => '投稿を追加';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return '画面共有に失敗しました：$error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return '$usernameの音量';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'これはあなたに聞こえる音にのみ影響します -- このデバイス、この通話のみ。';

  @override
  String get voiceScreenResetVolumeButton => 'リセット';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return '接続できませんでした：$error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen => 'あなたの画面、タップして全画面表示';

  @override
  String get voiceScreenYourScreenLabel => 'あなたの画面';

  @override
  String get voiceScreenTapToClose => 'タップして閉じる';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name（あなた）';
  }

  @override
  String get voiceScreenSpeakingSuffix => '、発言中';

  @override
  String get voiceScreenCameraOnSuffix => '、カメラオン';

  @override
  String get voiceScreenActivateToPopOut => '、操作するとポップアウトします';

  @override
  String get voiceScreenShowVarmTooltip => 'VARMを表示';

  @override
  String get voiceScreenHideVarmTooltip => 'VARMを非表示';

  @override
  String get voiceScreenShowChatTooltip => 'チャットを表示';

  @override
  String get voiceScreenHideChatTooltip => 'チャットを非表示';

  @override
  String get voiceScreenStartCameraTooltip => 'カメラを開始';

  @override
  String get voiceScreenStopCameraTooltip => 'カメラを停止';

  @override
  String get voiceScreenShareScreenTooltip => '画面を共有';

  @override
  String get voiceScreenStopSharingTooltip => '共有を停止';

  @override
  String get voiceScreenPopOutTooltip => 'ボイスを別ウィンドウにポップアウト';

  @override
  String get voiceScreenCouldNotPopOut => 'ボイスをポップアウトできませんでした。';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'ボイスを退出';

  @override
  String get voiceScreenPinTooltip => 'ピン留め（開いたままにする）';

  @override
  String get voiceScreenUnpinTooltip => 'ピン留めを解除';

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
    return '$channelName、$count人接続中';
  }

  @override
  String get voiceBarSpeakingSuffix => '、あなたは発言中です';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count人接続中・タップして展開';
  }

  @override
  String get voiceBarStartCameraTooltip => 'カメラを開始';

  @override
  String get voiceBarStopCameraTooltip => 'カメラを停止';

  @override
  String get voiceBarLeaveVoiceTooltip => 'ボイスを退出';

  @override
  String get popOutVideoFallbackTitle => 'ボイス';

  @override
  String get popOutVideoMissingTokenError => 'トークンまたはURLがありません';

  @override
  String get popOutVideoConnectionTimedOut => '接続が15秒後にタイムアウトしました';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'エラー：$error';
  }

  @override
  String get popOutVideoNoParticipants => '参加者はいません';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'ステージ';

  @override
  String get stageCouldNotJoin => 'ステージに参加できませんでした。';

  @override
  String get stageThisStageFallback => 'このステージ';

  @override
  String get stageRequiresTicketToJoin => 'の参加にはチケットが必要です';

  @override
  String get stagePleaseWaitLabel => 'お待ちください...';

  @override
  String get stageGetFreeTicketButton => '無料チケットを取得';

  @override
  String stageBuyTicketButton(String price) {
    return 'チケットを購入 -- $price';
  }

  @override
  String get stageNotNowButton => '今はしない';

  @override
  String get stageCouldNotStartTicketPurchase => 'チケット購入を開始できませんでした。';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'まだ支払いの完了を待っています -- 確認できたら再度参加してみてください。';

  @override
  String get stageSpeakerBadge => 'スピーカー';

  @override
  String get stageListenerBadge => 'リスナー';

  @override
  String stageCouldNotJoinWithError(String error) {
    return '参加できませんでした：$error';
  }

  @override
  String get stageSpeakersHeader => 'スピーカー';

  @override
  String get stageRaisedHandsHeader => '挙手中';

  @override
  String get stageAllowButton => '許可';

  @override
  String get stageIgnoreButton => '無視';

  @override
  String get stageListenersHeader => 'リスナー';

  @override
  String get stageRaiseHandTooltip => '挙手する';

  @override
  String get stageLowerHandTooltip => '挙手を下げる';

  @override
  String get stageLeaveStageTooltip => 'ステージを退出';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name（あなた）';
  }

  @override
  String get stageMoveToListenersButton => 'リスナーに移動';

  @override
  String get stageYouFallbackName => 'あなた';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return '$usernameのアバター';
  }

  @override
  String get channelEditDialogNewTitle => '新規チャンネル';

  @override
  String get channelEditDialogEditTitle => 'チャンネルを編集';

  @override
  String get channelEditDialogNameHint => 'チャンネル名';

  @override
  String get channelEditDialogDescriptionHint => 'トピック（任意）';

  @override
  String get channelEditDialogTypeLabel => '種類';

  @override
  String get channelEditDialogTypeText => 'テキスト';

  @override
  String get channelEditDialogTypeVoice => 'ボイス';

  @override
  String get channelEditDialogTypeGallery => 'ギャラリー';

  @override
  String get channelEditDialogTypeStage => 'ステージ';

  @override
  String get channelEditDialogTypeRules => 'ルール';

  @override
  String get channelEditDialogTypeRoleSelection => 'ロール選択';

  @override
  String get channelEditDialogTypeCalendar => 'カレンダー';

  @override
  String get channelEditDialogAnnouncementTitle => 'アナウンスチャンネル';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'メッセージ管理権限を持つメンバーのみ投稿できます';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'ここにライブ配信・アップロードのお知らせを投稿';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      '「配信通知」権限を持つメンバーがTwitchで配信を開始した時、またはYouTubeに新しい動画を投稿した時に自動投稿されます';

  @override
  String get channelEditDialogNotifyRolesLabel => '投稿時に通知するロール（任意）';

  @override
  String get channelEditDialogSlowmodeLabel => 'スローモード';

  @override
  String get channelEditDialogSlowmodeOff => 'オフ';

  @override
  String get channelEditDialogUserLimitLabel => 'ユーザー上限';

  @override
  String get channelEditDialogUserLimitOff => '上限なし';

  @override
  String get channelEditDialogCategoryLabel => 'カテゴリー';

  @override
  String get channelEditDialogNoCategory => 'カテゴリーなし';

  @override
  String get channelEditDialogRoleAccessLabel => 'ロールアクセス（空欄で全員に許可）';

  @override
  String get channelEditDialogContentLabelsLabel => 'コンテンツラベル';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'このチャンネルにメンバーのコンテンツフィルターのフラグを立てます。保護者管理下のアカウントでは強制的にブロックされます';

  @override
  String get categoryEditDialogNewTitle => '新規カテゴリー';

  @override
  String get categoryEditDialogEditTitle => 'カテゴリーを編集';

  @override
  String get categoryEditDialogNameHint => 'カテゴリー名';

  @override
  String get categoryEditDialogRoleAccessLabel => 'ロールアクセス（空欄で全員に許可）';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'メンバー — オンライン$count人';
  }

  @override
  String get memberPanelRefreshTooltip => 'メンバーリストを更新';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'メンバー$count人',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'オフライン';

  @override
  String memberPanelTierSuffix(String tier) {
    return '、$tierティア';
  }

  @override
  String get memberPanelUnknownUser => '不明';

  @override
  String get memberPanelModerationActionsTooltip => 'モデレーション操作';

  @override
  String get reportDialogReasonSpam => 'スパム';

  @override
  String get reportDialogReasonHarassment => 'ハラスメントまたは虐待';

  @override
  String get reportDialogReasonIllegal => '違法なコンテンツ';

  @override
  String get reportDialogReasonOther => 'その他';

  @override
  String get reportDialogReasonLabel => '理由';

  @override
  String get reportDialogNoteHint => 'モデレーターに伝えたいことがあれば（任意）';

  @override
  String get reportDialogDisclosureNote =>
      'あなたに表示されているメッセージの内容と送信者は、このサーバーのモデレーターと共有されます。';

  @override
  String get reportDialogSubmitButton => '通報を送信';

  @override
  String get reportDialogSubmitError => '通報を送信できませんでした。';

  @override
  String get notificationBellTitle => '通知';

  @override
  String get notificationBellMarkAllRead => 'すべて既読にする';

  @override
  String get notificationBellEmptyState => '通知はまだありません';

  @override
  String get notificationBellUnreadLabel => '未読';

  @override
  String get invitePreviewTitle => 'サーバー招待';

  @override
  String get invitePreviewInvalidOrExpired => '招待が無効か期限切れです。';

  @override
  String get invitePreviewCouldNotJoin => 'サーバーに参加できませんでした。';

  @override
  String get invitePreviewUnknownServer => '不明なサーバー';

  @override
  String get shippingAddressFullNameHint => '氏名';

  @override
  String get shippingAddressLine1Hint => '住所1行目';

  @override
  String get shippingAddressLine2Hint => '住所2行目（任意）';

  @override
  String get shippingAddressCityHint => '市区町村';

  @override
  String get shippingAddressStateHint => '都道府県／州';

  @override
  String get shippingAddressZipHint => '郵便番号';

  @override
  String get shippingAddressCountryCodeHint => '国コード（例：US）';

  @override
  String get shippingAddressPhoneHint => '電話番号（任意）';

  @override
  String get shippingAddressPrivacyNote =>
      'この注文の配送のみに使用されます -- 注文完了後の取り扱いについてはPrintfulのプライバシーポリシーをご確認ください。';

  @override
  String get updateNudgeAvailableTitle => 'アップデートが利用可能です';

  @override
  String get updateNudgeRequiredTitle => 'アップデートが必要です';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $versionが利用可能です -- ご利用のバージョンは古くなっています。';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'このバージョンはサポートが終了しました。Kodaを引き続き使用するには、$versionにアップデートしてください。';
  }

  @override
  String get updateNudgeLaterButton => '後で';

  @override
  String get tierBadgeSparkSubscriber => 'Spark購読者';

  @override
  String get tierBadgePulseSubscriber => 'Pulse購読者';

  @override
  String get vispAvatarInDevelopment => '開発中';

  @override
  String get vispBoostAdvisorCouldNotAnswer => 'Vispは回答をまとめられませんでした。';

  @override
  String get vispBoostAdvisorTitle => 'Vispに聞く：ブーストROIアドバイザー';

  @override
  String get vispBoostAdvisorFollowUpHint => 'さらに質問する...';

  @override
  String get vispBoostAdvisorSendTooltip => '送信';

  @override
  String get vispBoostAdvisorBasedOn => '参照元：';

  @override
  String get vispEventDialogCouldNotGenerate => 'Vispはイベントを生成できませんでした。';

  @override
  String get vispEventDialogCouldNotCreate => 'そのイベントを作成できませんでした。';

  @override
  String get vispEventDialogRecurrenceNone => '一回限り';

  @override
  String get vispEventDialogRecurrenceDaily => '毎日繰り返す';

  @override
  String get vispEventDialogRecurrenceWeekly => '毎週繰り返す';

  @override
  String get vispEventDialogRecurrenceMonthly => '毎月繰り返す';

  @override
  String get vispEventDialogTitle => 'Vispにイベント作成を依頼';

  @override
  String get vispEventDialogDescription =>
      'イベントの内容を説明してください -- Vispがタイトル、日時、その他の詳細を提案します。';

  @override
  String get vispEventDialogPromptHint => '例：「毎週金曜19時から3時間ほどのD&Dセッション」';

  @override
  String get vispEventDialogPrivacyNote =>
      'あなたの説明はVisp（セルフホスト型アシスタント -- 何もKodaのサーバー外には出ません）に送信され、このプランの生成に使われます。';

  @override
  String get vispEventDialogStartOver => '最初からやり直す';

  @override
  String get vispEventDialogCreateEvent => 'イベントを作成';

  @override
  String get vispEventDialogThinking => '考え中...';

  @override
  String get vispEventDialogGeneratePlan => 'プランを生成';

  @override
  String get vispEventDialogCouldNotParseDate =>
      '日付を解析できませんでした -- 表現を変えてお試しください';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return '終了：$ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return 'チケット1枚あたり$price';
  }

  @override
  String get vispEventDialogBasedOn => '参照元：';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return '質問 $questionNumber / $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'または自分で回答を入力...';

  @override
  String get vispQuestionStepSendTooltip => '送信';

  @override
  String get vispQuestionStepSkip => 'スキップして今すぐ生成';

  @override
  String get vispSetupDialogCouldNotGeneratePlan => 'Vispはプランを生成できませんでした。';

  @override
  String get vispSetupDialogCouldNotApplyPlan => 'そのプランを適用できませんでした。';

  @override
  String get vispSetupDialogTitleNew => 'Vispにサーバーの内容を説明';

  @override
  String get vispSetupDialogTitleExisting => 'Vispにこのサーバーへの追加を依頼';

  @override
  String get vispSetupDialogDescriptionNew =>
      '作りたいサーバーの内容を説明してください -- Vispが名前と、ロール、カテゴリー、チャンネルのセットを提案します。';

  @override
  String get vispSetupDialogDescriptionExisting =>
      '追加したい内容を説明してください -- Vispが作成すべきロール、カテゴリー、チャンネルを提案します。';

  @override
  String get vispSetupDialogPromptHintNew =>
      '例：「2卓分のボイスチャンネルがある、居心地の良いD&Dグループ用サーバー」';

  @override
  String get vispSetupDialogPromptHintExisting => '例：「レイドチーム用にチャンネルをもう少し追加して」';

  @override
  String get vispSetupDialogPrivacyNote =>
      'あなたの説明はVisp（セルフホスト型アシスタント -- 何もKodaのサーバー外には出ません）に送信され、このプランの生成に使われます。';

  @override
  String get vispSetupDialogStartOver => '最初からやり直す';

  @override
  String get vispSetupDialogCreateServer => 'サーバーを作成';

  @override
  String get vispSetupDialogAddToServer => 'サーバーに追加';

  @override
  String get vispSetupDialogThinking => '考え中...';

  @override
  String get vispSetupDialogGeneratePlan => 'プランを生成';

  @override
  String get vispSetupDialogNewServerLabel => '新規サーバー';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ロール$count件',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'カテゴリー$count件',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'チャンネル$count件',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => '参照元：';

  @override
  String get childLockoutTitle => '現在利用できる時間帯ではありません';

  @override
  String get childLockoutBody =>
      '保護者がこのアカウントでKodaを利用できる時間を設定しています。利用時間の延長を保護者に相談するか、次の利用可能時間帯に改めてご確認ください。';

  @override
  String get childLockoutLogOutButton => 'ログアウト';

  @override
  String get forcePasswordChangeError => 'パスワードを更新できませんでした。もう一度お試しください。';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'ようこそ、$usernameさん';
  }

  @override
  String get forcePasswordChangeSubtitle => '続行する前に、アカウントには新しいパスワードの設定が必要です。';

  @override
  String get forcePasswordChangeNewPasswordHint => '新しいパスワード';

  @override
  String get forcePasswordChangeConfirmPasswordHint => '新しいパスワードを確認';

  @override
  String get forcePasswordChangeReqLength => '12文字以上';

  @override
  String get forcePasswordChangeReqUpper => '大文字を1文字以上';

  @override
  String get forcePasswordChangeReqLower => '小文字を1文字以上';

  @override
  String get forcePasswordChangeReqDigit => '数字を1文字以上';

  @override
  String get forcePasswordChangeReqMatch => 'パスワードが一致しています';

  @override
  String get forcePasswordChangeSubmitButton => '新しいパスワードを設定';

  @override
  String get forgotPasswordEnterEmailError => 'メールアドレスを入力してください。';

  @override
  String get forgotPasswordCodeSentInfo => 'そのアカウントが存在する場合、リセットコードが送信されました。';

  @override
  String get forgotPasswordEnterCodeError => 'コードと8文字以上のパスワードを入力してください。';

  @override
  String get forgotPasswordInvalidCode => 'コードが無効か期限切れです。';

  @override
  String get forgotPasswordTitle => 'パスワードをリセット';

  @override
  String get forgotPasswordEmailHint => 'メールアドレス';

  @override
  String get forgotPasswordSendCodeButton => 'リセットコードを送信';

  @override
  String get forgotPasswordCodeHint => '6桁のコード';

  @override
  String get forgotPasswordNewPasswordHint => '新しいパスワード';

  @override
  String get forgotPasswordSetNewPasswordButton => '新しいパスワードを設定';

  @override
  String get verifyEmailEnterCodeError => 'メールに記載された6桁のコードを入力してください。';

  @override
  String get verifyEmailInvalidCode => 'コードが無効か期限切れです。';

  @override
  String verifyEmailResentInfo(String email) {
    return '$email宛に新しいコードを送信しました。';
  }

  @override
  String get verifyEmailResendFailed => '今は再送信できませんでした。';

  @override
  String get verifyEmailTitle => 'メールをご確認ください';

  @override
  String verifyEmailSentCode(String email) {
    return '$email宛に6桁のコードを送信しました';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'メールを確認';

  @override
  String get verifyEmailResendButton => 'コードを再送信';

  @override
  String get safetyNumberKeysNotSetUp => 'あなた自身の鍵はまだ設定されていません。';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerNameはまだ鍵バンドルを持っていません。';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'セーフティナンバーを計算できませんでした：$error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerNameはそのデバイスをもう持っていません。';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return '$peerNameとのセーフティナンバー';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'このチャット以外の方法 -- 対面や電話など -- でこの番号を$peerNameと照合してください。両者で一致すれば、あなたが思っている相手と話していることになります。';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerNameにはデバイスが$count台あり、それぞれに個別のセーフティナンバーがあります -- 1つを確認しても他はカバーされません。';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'デバイス$number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => '確認済みにする';

  @override
  String get contentFiltersDescription =>
      'サーバーはチャンネルにコンテンツラベルを付けることができます。ラベル付けされたチャンネルの挙動を選択してください -- これはあなた個人の設定であり、他の人に見える内容には一切影響しません。';

  @override
  String get contentFiltersLabelAdult => '成人向けコンテンツ';

  @override
  String get contentFiltersLabelSuggestive => '示唆的な内容';

  @override
  String get contentFiltersLabelGraphic => '過激な表現';

  @override
  String get contentFiltersLabelNudity => '性的でないヌード';

  @override
  String get contentFiltersDescAdult => '性的に露骨なコンテンツ';

  @override
  String get contentFiltersDescSuggestive => '露骨ではないが性的に示唆的なコンテンツ';

  @override
  String get contentFiltersDescGraphic => '暴力またはグロテスクな表現';

  @override
  String get contentFiltersDescNudity => '性的でない文脈でのヌード';

  @override
  String get contentFiltersHide => '非表示';

  @override
  String get contentFiltersWarn => '警告表示';

  @override
  String get contentFiltersShow => '表示';

  @override
  String get deviceTestCouldNotGetToken => 'テスト用トークンを取得できませんでした。';

  @override
  String get deviceTestLabelTest => 'テスト';

  @override
  String get deviceTestLabelRecording => '録音中...';

  @override
  String get deviceTestLabelPlayingBack => '再生中...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'カメラを起動できませんでした：$error';
  }

  @override
  String get deviceTestTitle => 'デバイスをテスト';

  @override
  String deviceTestCouldNotConnect(String error) {
    return '接続できませんでした：$error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'マイク';

  @override
  String get deviceTestHearYourselfLabel => '自分の声を聞く（遅延あり）';

  @override
  String get deviceTestSpeakerOutputLabel => 'スピーカー／出力';

  @override
  String get deviceTestCameraLabel => 'カメラ';

  @override
  String get deviceTestSystemDefault => 'システムのデフォルト';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return '話してから、$seconds秒のクリップが再生されます';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '$seconds秒';
  }

  @override
  String get deviceTestCameraPreviewOff => 'カメラプレビューはオフです';

  @override
  String get deviceTestStopCameraButton => 'カメラテストを停止';

  @override
  String get deviceTestTestCameraButton => 'カメラをテスト';

  @override
  String get deviceTestInputLevelLabel => '入力レベル';

  @override
  String get devicesScreenRemoveConfirmTitle => 'このデバイスを削除しますか？';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'このデバイスは再度サインインする必要があります。また、削除されていた間に送信されたメッセージはその後届きません -- ダブルラチェットセッションは後から遡ってギャップを埋めることはありません。';

  @override
  String get devicesScreenRemoveFailed => 'そのデバイスを削除できませんでした。';

  @override
  String get devicesScreenNeverActive => 'アクティブになったことがありません';

  @override
  String devicesScreenActiveDate(String date) {
    return '最終アクティブ：$date';
  }

  @override
  String get devicesScreenDescription =>
      'サインインした各デバイスには、それぞれ独自の暗号化アイデンティティがあります -- あなた宛のメッセージは以下のすべてのデバイスに届きます。使用していない、または見覚えのないデバイスは削除してください。';

  @override
  String get devicesScreenNoDevicesFound => 'デバイスが見つかりません。';

  @override
  String get devicesScreenUnknownDevice => '不明なデバイス';

  @override
  String get devicesScreenThisDeviceBadge => 'このデバイス';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'デバイスを削除';

  @override
  String get totpSetupInvalidCode => 'コードが無効です。もう一度お試しください。';

  @override
  String get totpSetupEnabledMessage => '二段階認証が有効になりました。';

  @override
  String get totpSetupScanInstructions =>
      'この秘密鍵を認証アプリ（Google Authenticator、1Password、Authyなど）にスキャンしてください：';

  @override
  String get totpSetupCodeHint => '確認のため6桁のコードを入力';

  @override
  String get totpSetupVerifyButton => '確認して有効にする';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'プッシュトゥトーク';

  @override
  String get voiceVideoSettingsPressAnyKeyHint => '割り当てるキーを押してください...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'デバイスをテスト';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => '音声処理';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'ノイズ抑制';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle => 'マイクの背景ノイズを軽減します';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      '高度なノイズ抑制 (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'リアルタイムAIノイズ除去。標準の抑制より強力で、オンにすると標準の抑制を置き換えます';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'エコーキャンセレーション';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      '自分の音声がエコーとして返ってくるのを防ぎます';

  @override
  String get voiceVideoSettingsAutoGainTitle => 'オートゲインコントロール';

  @override
  String get voiceVideoSettingsAutoGainSubtitle => 'マイク音量を自動的に調整します（音量正規化）';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'オートダッキング';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle => '自分が話している間、他の参加者の音量を下げます';

  @override
  String get voiceVideoSettingsHighPassTitle => 'ハイパスフィルター';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      '低周波のノイズ（扇風機、エアコン、机の振動など）をカットします';

  @override
  String get voiceVideoSettingsTypingNoiseTitle => 'タイピングノイズ検出';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle => 'マイクが拾うキーボードの打鍵音を抑制します';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'ボイスアイソレーション';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'あなたの声に焦点を当て、周囲の人や音を除去します';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'マイクブースト';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'ブーストを有効にする';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      '小さい音や遠いマイクのためのプリアンプゲイン -- EQの前に適用されます';

  @override
  String get voiceVideoSettingsBandBoost => 'ブースト';

  @override
  String get voiceVideoSettingsSectionMicEq => 'マイクEQ';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'EQを有効にする';

  @override
  String get voiceVideoSettingsEnableEqSubtitle => '他の人に届く前にマイクの音質を調整します';

  @override
  String get voiceVideoSettingsBandBass => '低音';

  @override
  String get voiceVideoSettingsBandMid => '中音';

  @override
  String get voiceVideoSettingsBandTreble => '高音';

  @override
  String get voiceVideoSettingsSectionVad => '音声検出（VOX）';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'VOXを有効にする';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle => '実際に話しているときのみ送信します';

  @override
  String get voiceVideoSettingsSensitivityLabel => '感度';

  @override
  String get voiceVideoSettingsVadHint =>
      '低くするほど小さな音も拾います。高くするほど、大きな声のみが送信のきっかけになります。';

  @override
  String get voiceVideoSettingsBoundKeyLabel => '割り当て済みキー';

  @override
  String get voiceVideoSettingsKeyNotSet => '未設定 — ミュート解除中は常にマイクがオンになります';

  @override
  String get voiceVideoSettingsClearButton => 'クリア';

  @override
  String get voiceVideoSettingsSetKeyButton => 'キーを設定';

  @override
  String get voiceVideoSettingsChangeButton => '変更';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'キーを割り当てると、そのキーを押している間だけマイクが送信されます。ボイスチャンネルにいる間は、これがVOXより優先されます。';

  @override
  String get voiceVideoSettingsSectionVarm => 'VARM - バーチャルアバターリアクティブモデル';

  @override
  String get voiceVideoSettingsVarmDescription =>
      '話すときに切り替わる2枚の画像をアップロードします。あなたにのみ表示されます。';

  @override
  String get voiceVideoSettingsVarmSilentLabel => '無音時';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => '発話時';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => '発話しきい値';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      '低くするほど、発話中の画像に切り替わりやすくなります。';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'VARMを削除';

  @override
  String get gifPickerNoGifsFound => 'GIFが見つかりません';

  @override
  String get gifPickerSearchHint => 'GIFを検索...';

  @override
  String get messageSearchHint => 'このチャンネルを検索...';

  @override
  String get messageSearchTooltip => '検索';

  @override
  String get messageSearchInitialHint =>
      'このデバイスにすでに読み込まれているメッセージを検索します -- さらに遡ると、古い履歴が取得され（ローカルで復号され）ます。';

  @override
  String get messageSearchNoMatches => '一致するものがありません';

  @override
  String get messageSearchStartOfHistory => 'チャンネル履歴の先頭';

  @override
  String get messageSearchFurtherBackButton => 'さらに過去を検索';

  @override
  String get messageSearchUnknownAuthor => '不明';
}
