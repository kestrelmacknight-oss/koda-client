// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonSave => 'Save';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonCreate => 'Create';

  @override
  String get commonClose => 'Close';

  @override
  String get commonDone => 'Done';

  @override
  String get commonDownload => 'Download';

  @override
  String get commonDisconnect => 'Disconnect';

  @override
  String get commonNone => 'None';

  @override
  String get commonJoin => 'Join';

  @override
  String get commonDismiss => 'Dismiss';

  @override
  String get commonSubmit => 'Submit';

  @override
  String get commonConfirm => 'Confirm';

  @override
  String get commonRemove => 'Remove';

  @override
  String get commonRetry => 'Retry';

  @override
  String get commonOk => 'OK';

  @override
  String get commonYes => 'Yes';

  @override
  String get commonNo => 'No';

  @override
  String get commonSearch => 'Search';

  @override
  String get commonSettings => 'Settings';

  @override
  String get commonLoading => 'Loading...';

  @override
  String get settingsLanguageSection => 'Language';

  @override
  String get settingsLanguageTitle => 'App Language';

  @override
  String get settingsLanguageSystemDefault => 'System default';

  @override
  String get settingsLanguageDescription =>
      'Choose the language Koda\'s own interface displays in. This is separate from any server\'s primary language, or the language you type messages in.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsSignOut => 'Sign out';

  @override
  String get settingsSectionMyAccount => 'My Account';

  @override
  String get settingsSectionSecurity => 'Security';

  @override
  String get settingsSectionAccessibility => 'Accessibility';

  @override
  String get settingsSectionBilling => 'Billing';

  @override
  String get settingsSectionFamily => 'Family';

  @override
  String get settingsSectionVoiceVideo => 'Voice & Video';

  @override
  String get settingsSectionDesktop => 'Desktop';

  @override
  String get settingsSectionAbout => 'About';

  @override
  String get settingsTwoFactorTitle => 'Two-Factor Authentication';

  @override
  String get settingsTwoFactorSubtitle =>
      'Add an authenticator app for extra security';

  @override
  String get settingsLinkedDevicesTitle => 'Linked Devices';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'See and remove devices signed into this account';

  @override
  String get settingsContentFiltersTitle => 'Content Filters';

  @override
  String get settingsContentFiltersSubtitle =>
      'Choose how you want labeled content to appear';

  @override
  String get settingsDmFriendsOnlyTitle => 'Only allow DMs from friends';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Non-friends cannot start a new conversation with you';

  @override
  String get settingsDmPrivacyError => 'Could not update DM privacy.';

  @override
  String get settingsShowVispAvatarTitle => 'Show Visp\'s avatar';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Shows Visp\'s face and mood in its setup/event/advisor dialogs';

  @override
  String get settingsHighContrastTitle => 'High Contrast';

  @override
  String get settingsHighContrastSubtitle =>
      'Pure black/white, high-contrast colors app-wide -- switching briefly reloads the current screen.';

  @override
  String get settingsDyslexiaFontTitle => 'Dyslexia-friendly font';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Switches body text to OpenDyslexic app-wide';

  @override
  String get settingsFontSizeTitle => 'Font size';

  @override
  String get settingsFontSizeSample =>
      'The quick brown fox jumps over the lazy dog';

  @override
  String get settingsDensityTitle => 'Density';

  @override
  String get settingsDensityDescription =>
      'Affects spacing on standard controls -- buttons, toggles, dialogs -- not every custom layout.';

  @override
  String get settingsDensityCompact => 'Compact';

  @override
  String get settingsDensityStandard => 'Standard';

  @override
  String get settingsDensityComfortable => 'Comfortable';

  @override
  String get settingsStreamingTitle => 'Streaming Accounts';

  @override
  String get settingsStreamingDescription =>
      'Connect Twitch/YouTube so servers where you have the \"Announce When Live\" permission can automatically post when you go live or post a new video.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform connected as $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform not connected';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- live now';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- a new upload';

  @override
  String get settingsStreamingConnecting => 'Connecting...';

  @override
  String get settingsStreamingConnect => 'Connect';

  @override
  String get settingsAnnounceLiveTwitch => 'Announce when I go live';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Announce live streams and new uploads';

  @override
  String get settingsRefreshStatus =>
      'Already connected in your browser? Refresh status';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'Could not start $platform connection.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Finish connecting in your browser, then come back and refresh.';

  @override
  String get settingsThroneTitle => 'Throne Webhook';

  @override
  String get settingsThroneDescription =>
      'Paste this URL into your Throne.com webhook settings to get notified in Koda whenever someone sends you a gift.';

  @override
  String get settingsThroneGetUrl => 'Get my webhook URL';

  @override
  String get settingsThroneCopyTooltip => 'Copy';

  @override
  String get settingsThroneCopiedToast => 'Copied to clipboard';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Regenerate (invalidates the old URL)';

  @override
  String get settingsThroneRegenerateConfirmTitle => 'Regenerate webhook URL?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'Your old URL will stop working, so update it in Throne.com afterward.';

  @override
  String get settingsThroneRegenerate => 'Regenerate';

  @override
  String get settingsUploadPhoto => 'Upload Photo';

  @override
  String get settingsOrPasteUrl => 'or paste a URL below';

  @override
  String get settingsAvatarUrlHint => 'https://example.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'Image upload requires Cloudflare R2 — URL paste always works.';

  @override
  String get settingsDisplayNameLabel => 'DISPLAY NAME';

  @override
  String get settingsDisplayNameHint => 'Display name';

  @override
  String get settingsBioLabel => 'BIO';

  @override
  String get settingsBioHint => 'Tell people a little about yourself';

  @override
  String get settingsPronounsLabel => 'PRONOUNS';

  @override
  String get settingsPronounsHint => 'e.g. they/them';

  @override
  String get settingsShowPronounsTitle => 'Show my pronouns to others';

  @override
  String get settingsShowPronounsSubtitle =>
      'Shown next to your name in chat, member lists, and voice';

  @override
  String get settingsStatusLabel => 'STATUS';

  @override
  String get settingsCustomStatusLabel => 'CUSTOM STATUS';

  @override
  String get settingsCustomStatusHint => 'What\'s on your mind?';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusAway => 'Away';

  @override
  String get statusDnd => 'Do Not Disturb';

  @override
  String get statusInvisible => 'Invisible';

  @override
  String get settingsFamilyNotAvailable =>
      'Parental controls aren\'t available on a supervised account.';

  @override
  String get settingsAboutTitle => 'About Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Terms & Conditions';

  @override
  String get settingsPrivacyTitle => 'Privacy Policy';

  @override
  String get settingsSupportTitle => 'Support';

  @override
  String get settingsReportSecurityTitle => 'Report a Security Issue';

  @override
  String get settingsDesktopNotAvailable =>
      'These are desktop-only settings -- there\'s no window or system tray on this platform.';

  @override
  String get settingsCloseToTrayTitle => 'Close to system tray';

  @override
  String get settingsCloseToTraySubtitle =>
      'Closing the window keeps Koda running in the background so you still get notifications -- turn this off to make closing the window actually quit.';

  @override
  String get authErrorEmailPasswordRequired =>
      'Email and password are required.';

  @override
  String get authErrorIncorrectCredentials => 'Incorrect email or password.';

  @override
  String get authErrorMustAcceptTerms =>
      'Please accept the Terms & Conditions.';

  @override
  String get authErrorAllFieldsRequired => 'All fields are required.';

  @override
  String get authErrorPasswordsDontMatch => 'Passwords do not match.';

  @override
  String get authErrorPasswordTooShort =>
      'Password must be at least 8 characters.';

  @override
  String get authErrorRegistrationFailed =>
      'Registration failed. That email may already be in use.';

  @override
  String get authTabSignIn => 'Sign In';

  @override
  String get authTabCreateAccount => 'Create Account';

  @override
  String get authAgreementPrefix => 'By using Koda you agree to our ';

  @override
  String get authTermsLink => 'Terms & Conditions';

  @override
  String get authAgreementMiddle => ' and ';

  @override
  String get authPrivacyLink => 'Privacy Policy';

  @override
  String get authAgreementSuffix => '.';

  @override
  String get authEmailHint => 'Email address';

  @override
  String get authPasswordHint => 'Password';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String get authSignInButton => 'Sign In';

  @override
  String get authUsernameHint => 'Username';

  @override
  String get authConfirmPasswordHint => 'Confirm password';

  @override
  String get authAccessCodeHint => 'Access code (if you have one)';

  @override
  String get authAgreeToTerms =>
      'I agree to the Terms & Conditions and Privacy Policy';

  @override
  String get authCreateAccountButton => 'Create Account';

  @override
  String get dmSafetyNumberChangedWarning =>
      'This conversation\'s safety number changed -- verify it before sending.';

  @override
  String get dmMessageNotSent => 'Message not sent.';

  @override
  String dmEncryptMessageError(String error) {
    return 'Could not encrypt message: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'Attachment upload failed.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'Could not encrypt attachment: $error';
  }

  @override
  String get dmReportMessage => 'Report Message';

  @override
  String get dmReportSubmitted => 'Report submitted.';

  @override
  String get dmTitle => 'Messages';

  @override
  String get dmNewMessage => 'New Message';

  @override
  String get dmNoConversationsYet => 'No conversations yet';

  @override
  String get dmSelectConversation => 'Select a conversation';

  @override
  String get dmVerifySafetyNumberTooltip => 'Verify Safety Number';

  @override
  String get dmSeenLabel => 'Seen';

  @override
  String get dmMessageActionsTooltip => 'Message actions';

  @override
  String get dmRemoveAttachmentTooltip => 'Remove attachment';

  @override
  String get dmAttachFileTooltip => 'Attach file';

  @override
  String get dmMessageHint => 'Message...';

  @override
  String get dmSendMessageTooltip => 'Send message';

  @override
  String get dmNoFriendsYet =>
      'No friends yet.\nSend a friend request to get started.';

  @override
  String get dmUnfriendTooltip => 'Unfriend';

  @override
  String get dmNoPendingRequests => 'No pending friend requests.';

  @override
  String get dmIncomingRequestsLabel => 'INCOMING';

  @override
  String get dmSentRequestsLabel => 'SENT';

  @override
  String get dmAcceptTooltip => 'Accept';

  @override
  String get dmDeclineTooltip => 'Decline';

  @override
  String get dmPendingLabel => 'Pending';

  @override
  String get dmNewMessageDialogTitle => 'New Message';

  @override
  String get dmEnterUsernameHint => 'Enter username';

  @override
  String get dmOpenButton => 'Open';

  @override
  String dmSavedAttachment(String fileName) {
    return 'Saved $fileName';
  }

  @override
  String get dmUnknownUser => 'Unknown';

  @override
  String get dmEndToEndEncryptedTooltip => 'End-to-end encrypted';

  @override
  String get homeContentWarningTitle => 'Content Warning';

  @override
  String homeContentWarningBody(String labels) {
    return 'This channel is flagged for: $labels.\n\nChange this in Settings > Security > Content Filters.';
  }

  @override
  String get homeViewAnyway => 'View Anyway';

  @override
  String get homeCouldNotConnectVoice => 'Could not connect to voice.';

  @override
  String get homeVoiceChannelFull => 'This voice channel is full.';

  @override
  String get homeCreateServer => 'Create Server';

  @override
  String get homeJoinServer => 'Join Server';

  @override
  String get homeRedeemCode => 'Redeem Code';

  @override
  String get homeJoinServerDialogTitle => 'Join Server';

  @override
  String get homeEnterInviteCode => 'Enter an invite code or URL:';

  @override
  String get homeInviteCodeHint => 'e.g. XK9MP2';

  @override
  String get homeJoined => 'Joined!';

  @override
  String get homeInvalidInvite => 'Invalid or expired invite code.';

  @override
  String get homeJoinButton => 'Join';

  @override
  String get homeRedeemCodeDialogTitle => 'Redeem Code';

  @override
  String get homeEnterBackerCode => 'Enter your backer or reward code:';

  @override
  String get homeRewardCodeHint => 'Reward code';

  @override
  String get homeCodeRedeemed =>
      'Code redeemed! Your rewards have been applied.';

  @override
  String get homeInvalidRedeemCode =>
      'Invalid, expired, or already redeemed code.';

  @override
  String get homeRedeemButton => 'Redeem';

  @override
  String get homeAreFriends => 'You are friends';

  @override
  String get homeAddFriend => 'Add Friend';

  @override
  String homeFriendRequestSent(String username) {
    return 'Friend request sent to $username!';
  }

  @override
  String get homeMessageButton => 'Message';

  @override
  String get homeSendTip => 'Send Tip';

  @override
  String get homeSwitchToServer => 'Switch to Server';

  @override
  String get homeInvitePeople => 'Invite People';

  @override
  String get homeServerSettingsMenuItem => 'Server Settings';

  @override
  String get homeLeaveServerMenuItem => 'Leave Server';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return 'Leave $serverName? You can rejoin with an invite.';
  }

  @override
  String get homeLeaveButton => 'Leave';

  @override
  String get homeCreateAServer => 'Create a server';

  @override
  String get homeServerNameHint => 'Server name';

  @override
  String get homeDescribeToVisp => 'Describe it to Visp instead';

  @override
  String get homeMarkAsRead => 'Mark as Read';

  @override
  String get homeEditChannel => 'Edit Channel';

  @override
  String get homeDeleteChannel => 'Delete Channel';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return 'Delete #$channelName? This cannot be undone.';
  }

  @override
  String get homeDeleteButton => 'Delete';

  @override
  String get homeCreateChannelHere => 'Create Channel Here';

  @override
  String get homeEditCategory => 'Edit Category';

  @override
  String get homeDeleteCategory => 'Delete Category';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return 'Delete \"$categoryName\"? Channels inside will become uncategorized.';
  }

  @override
  String get homeReplyAction => 'Reply';

  @override
  String get homeCreateThreadAction => 'Create Thread';

  @override
  String get homeEditMessageAction => 'Edit Message';

  @override
  String get homeDeleteMessageAction => 'Delete Message';

  @override
  String get homePinMessageAction => 'Pin Message';

  @override
  String get homeUnpinMessageAction => 'Unpin Message';

  @override
  String get homeReportMessageAction => 'Report Message';

  @override
  String get homeReportSubmitted => 'Report submitted.';

  @override
  String get messageActionForward => 'Forward';

  @override
  String messageForwardedFromLabel(String name) {
    return 'Forwarded from $name';
  }

  @override
  String get forwardDestinationPickerTitle => 'Forward message';

  @override
  String get forwardDestinationPickerChannelsTab => 'Channels';

  @override
  String get forwardDestinationPickerDmsTab => 'Direct Messages';

  @override
  String get forwardDestinationPickerNoServers =>
      'You\'re not in any servers yet.';

  @override
  String get forwardDestinationPickerNoChannels =>
      'No text channels in this server.';

  @override
  String get forwardDestinationPickerNoConversations => 'No conversations yet.';

  @override
  String get forwardSuccessToast => 'Message forwarded.';

  @override
  String get forwardFailedToast =>
      'Couldn\'t forward the message -- try again.';

  @override
  String get homeAddReactionTitle => 'Add Reaction';

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
  String get homeCategoryOptionsTooltip => 'Category options';

  @override
  String get homeChannelOptionsTooltip => 'Channel options';

  @override
  String get homeOpenVoiceChatTooltip => 'Open chat';

  @override
  String get homeMarketplaceLabel => 'Marketplace';

  @override
  String get homeSelectChannelPrompt => 'Select a channel';

  @override
  String get homeSearchTooltip => 'Search';

  @override
  String get homePinnedMessagesTooltip => 'Pinned Messages';

  @override
  String get homeWaitingForKey => 'Waiting for the encryption key to arrive...';

  @override
  String get homeUnableToDecrypt => 'Unable to decrypt this message.';

  @override
  String get homeMessageActionsTooltip => 'Message actions';

  @override
  String get homeCancelReplyTooltip => 'Cancel reply';

  @override
  String get homeRemoveAttachmentTooltip => 'Remove attachment';

  @override
  String get homeAttachFileTooltip => 'Attach file';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'Message #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'Send message';

  @override
  String get homeEditMessageTitle => 'Edit Message';

  @override
  String get homeMessageLabel => 'Message';

  @override
  String get homePinnedMessagesTitle => 'Pinned Messages';

  @override
  String get homeNoPinnedMessages => 'No pinned messages';

  @override
  String get homeUnpinTooltip => 'Unpin';

  @override
  String get homeCreateThreadTitle => 'Create Thread';

  @override
  String get homeThreadNameHint => 'Thread name';

  @override
  String homeThreadCreated(String name) {
    return 'Thread \"$name\" created!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Create or Join';

  @override
  String get homeKodaMarketplaceTooltip => 'Koda Marketplace';

  @override
  String get homeAdminPanelTooltip => 'Admin Panel';

  @override
  String get homeServerSettingsTooltip => 'Server Settings';

  @override
  String get homeSettingsTooltip => 'Settings';

  @override
  String get homeContentWarningBadge => 'Content warning';

  @override
  String get homeDirectMessagesTooltip => 'Direct Messages';

  @override
  String homeReplyingTo(String username) {
    return 'Replying to $username';
  }

  @override
  String get homeAttachmentFallback => 'Attachment';

  @override
  String get homeAttachmentUploadFailed => 'Attachment upload failed.';

  @override
  String homeSavedAttachment(String fileName) {
    return 'Saved $fileName';
  }

  @override
  String serverConnectError(String service) {
    return 'Could not start $service connection.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Disconnect Printful?';

  @override
  String get serverDisconnectPrintfulBody =>
      'This server will no longer be able to fulfill merch orders until reconnected.';

  @override
  String get serverDisconnectTiltifyTitle => 'Disconnect Tiltify?';

  @override
  String get serverDisconnectTiltifyBody =>
      'This server will stop showing its charity campaign\'s progress until reconnected.';

  @override
  String get serverNewRoleTitle => 'New Role';

  @override
  String get serverEditRoleTitle => 'Edit Role';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Color $hex';
  }

  @override
  String get permViewChannels => 'View Channels';

  @override
  String get permSendMessages => 'Send Messages';

  @override
  String get permConnectVoice => 'Connect to Voice';

  @override
  String get permManageServer => 'Manage Server';

  @override
  String get permManageChannels => 'Manage Channels';

  @override
  String get permManageRoles => 'Manage Roles';

  @override
  String get permManageMessages => 'Manage Messages';

  @override
  String get permKickMembers => 'Kick Members';

  @override
  String get permBanMembers => 'Ban Members';

  @override
  String get permMuteMembers => 'Mute Members';

  @override
  String get permMentionEveryone => 'Mention @everyone';

  @override
  String get permManageMarketplace => 'Manage Marketplace';

  @override
  String get permAnnounceLive => 'Announce When Live';

  @override
  String get permMoveMembers => 'Move Members (Voice)';

  @override
  String get serverRoleNameHint => 'Role name';

  @override
  String get serverColorLabel => 'Color';

  @override
  String get serverPermissionsLabel => 'Permissions';

  @override
  String get serverSelfAssignableTitle => 'Self-assignable';

  @override
  String get serverSelfAssignableSubtitle =>
      'Members can assign this role themselves';

  @override
  String get serverDefaultRoleUndeletable =>
      'The default role cannot be deleted.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'Delete role \"$roleName\"?';
  }

  @override
  String get serverCouldNotDeleteRole => 'Could not delete that role.';

  @override
  String get serverMemberFallback => 'Member';

  @override
  String get serverNoRolesYet => 'No roles yet.';

  @override
  String get serverRefreshStatus =>
      'Already connected in your browser? Refresh status';

  @override
  String get serverPrintfulConnected => 'Printful Connected';

  @override
  String get serverPrintfulNotConnected => 'Printful Not Connected';

  @override
  String get serverPrintfulDescription =>
      'Connect this server\'s Printful account to fulfill merch orders placed through Koda. Each server connects its own store.';

  @override
  String get serverConnecting => 'Connecting...';

  @override
  String get serverConnectPrintful => 'Connect Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify Connected';

  @override
  String get serverTiltifyNotConnected => 'Tiltify Not Connected';

  @override
  String get serverTiltifyDescription =>
      'Connect this server\'s Tiltify account to show a charity campaign\'s live progress to every member. Read-only -- Koda never posts or changes anything on Tiltify\'s side.';

  @override
  String get serverConnectTiltify => 'Connect Tiltify';

  @override
  String get serverNoTiltifyCampaigns =>
      'No campaigns found on this Tiltify account.';

  @override
  String get serverPickCampaign => 'Pick which campaign to display';

  @override
  String get serverUntitledCampaign => 'Untitled campaign';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '$currency $raised raised of $goal goal';
  }

  @override
  String get serverViewCampaign => 'View campaign';

  @override
  String get serverRefreshButton => 'Refresh';

  @override
  String get serverUploadButton => 'Upload';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '$used / $limit slots used -- boost level $level';
  }

  @override
  String get serverNoCustomEmoji => 'No custom emoji yet.';

  @override
  String get serverDeleteEmojiTooltip => 'Delete emoji';

  @override
  String get serverUploadEmojiTitle => 'Upload Emoji';

  @override
  String get serverEmojiNameHint => 'name (letters, numbers, _)';

  @override
  String get serverChooseImage => 'Choose Image';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Current boost level: $level';
  }

  @override
  String get serverBackgroundTitle => 'Server Background';

  @override
  String get serverBackgroundDescription =>
      'A custom background shown behind the channel view to everyone in this server.';

  @override
  String get serverBackgroundLockedHint =>
      'Reach boost level 4 to unlock a custom background.';

  @override
  String get serverIconBorderTitle => 'Server Icon Border';

  @override
  String get serverIconBorderDescription =>
      'An accent border around this server\'s icon in every member\'s server list.';

  @override
  String get serverIconBorderLockedHint =>
      'Reach boost level 5 to unlock a custom icon border.';

  @override
  String get serverBoostFromBank =>
      'Boost this server from the Server Bank in Marketplace to raise its level.';

  @override
  String get serverMarketplaceListingLabel => 'MARKETPLACE LISTING';

  @override
  String get serverListInMarketplace => 'List in Koda Marketplace';

  @override
  String get serverListInMarketplaceDescription =>
      'Lists this server\'s store in the Koda Marketplace, with a chance at the weekly featured rotation. This is about shopping, not finding servers to join -- it has no effect on general server search.';

  @override
  String get serverSocialLinkLabel => 'Social / Invite Link (optional)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Save Link';

  @override
  String get serverPricingLabel => 'PRICING';

  @override
  String get serverPrimaryCurrencyLabel => 'Primary Currency';

  @override
  String get serverPrimaryCurrencyDescription =>
      'Applies to Server Subscription tiers and Digital Goods prices you set for this server.';

  @override
  String get serverPrimaryLanguageLabel => 'Primary Language';

  @override
  String get serverPrimaryLanguageDescription =>
      'Messages members post in a different language get a small language badge, compared against this setting.';

  @override
  String get serverMarketplaceLinkSaved => 'Marketplace link saved.';

  @override
  String get serverIconUpdated => 'Server icon updated!';

  @override
  String get serverTemplateImported => 'Template imported!';

  @override
  String get serverImportFromDiscord => 'Import from Discord';

  @override
  String get serverVispPlanLive => 'Visp\'s plan is live!';

  @override
  String get serverAskVisp => 'Ask Visp';

  @override
  String get serverAddCategoryButton => 'Add Category';

  @override
  String get serverAddChannelHereTooltip => 'Add channel here';

  @override
  String get serverRename => 'Rename';

  @override
  String get serverUncategorized => 'UNCATEGORIZED';

  @override
  String get serverAddChannel => 'Add Channel';

  @override
  String get serverEditRulesContent => 'Edit Rules Content';

  @override
  String get serverRulesContentHint => 'Enter your server rules here...';

  @override
  String get serverRulesUpdated => 'Rules updated!';

  @override
  String get serverAddRole => 'Add Role';

  @override
  String get serverDefaultRoleLabel => 'Default role';

  @override
  String get serverManageRolesTooltip => 'Manage Roles';

  @override
  String get serverMutedLabel => 'Muted';

  @override
  String get serverExpandedLabel => 'expanded';

  @override
  String get serverCollapsedLabel => 'collapsed';

  @override
  String get serverUnmute => 'Unmute';

  @override
  String get serverMute => 'Mute';

  @override
  String get serverKick => 'Kick';

  @override
  String get serverBan => 'Ban';

  @override
  String serverBannedUsersLabel(int count) {
    return 'BANNED USERS — $count';
  }

  @override
  String get serverNoBannedUsers => 'No banned users.';

  @override
  String get serverUnban => 'Unban';

  @override
  String get serverMemberFallbackGeneric => 'this member';

  @override
  String serverBanConfirm(String username, String serverName) {
    return 'Ban $username from $serverName? They will not be able to rejoin without being unbanned.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return 'Kick $username from $serverName? They can rejoin with an invite.';
  }

  @override
  String get serverMuteDuration60Sec => '60 seconds';

  @override
  String get serverMuteDuration5Min => '5 minutes';

  @override
  String get serverMuteDuration10Min => '10 minutes';

  @override
  String get serverMuteDuration1Hour => '1 hour';

  @override
  String get serverMuteDuration1Day => '1 day';

  @override
  String get serverMuteDuration1Week => '1 week';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'Could not $action $username.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return 'Mute $username';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'Could not mute $username.';
  }

  @override
  String get serverUnlockInvites => 'Unlock Invites';

  @override
  String get serverInvitesUnlocked => 'Invites unlocked.';

  @override
  String get serverAuditLogDescription =>
      'Tier 1 moderation activity -- kicks, bans, mutes, and automated flood/raid protection. Metadata only; never message content.';

  @override
  String get serverSystemActor => 'System';

  @override
  String get serverActionKicked => 'kicked';

  @override
  String get serverActionBanned => 'banned';

  @override
  String get serverActionUnbanned => 'unbanned';

  @override
  String get serverActionMuted => 'muted';

  @override
  String get serverActionUnmuted => 'unmuted';

  @override
  String get serverActionFloodDetected => 'auto-muted for flooding';

  @override
  String get serverActionRaidLockdownEnabled =>
      'locked invites (raid protection)';

  @override
  String get serverActionRaidLockdownDisabled => 'unlocked invites';

  @override
  String get serverActionMoved => 'moved';

  @override
  String get serverUnknownAction => 'unknown action';

  @override
  String get serverNoModerationActivity => 'No moderation activity yet.';

  @override
  String get serverReportsDescription =>
      'Messages reported by members of this server -- the reporter\'s own already-decrypted copy, disclosed by reporting.';

  @override
  String get serverNoPendingReports => 'No pending reports.';

  @override
  String get serverReportReasonOther => 'other';

  @override
  String get serverReportStatusActioned => 'Actioned';

  @override
  String get serverReportStatusDismissed => 'Dismissed';

  @override
  String get serverResolvedLabel => 'RESOLVED';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'Reported by $reporter -- sent by $target';
  }

  @override
  String serverReportNote(String note) {
    return 'Note: $note';
  }

  @override
  String get serverDismissButton => 'Dismiss';

  @override
  String get serverMarkActioned => 'Mark Actioned';

  @override
  String get serverCreateInvite => 'Create Invite';

  @override
  String get serverInviteCreatedTitle => 'Invite Created';

  @override
  String get serverNoActiveInvites => 'No active invites';

  @override
  String serverUsesLabel(String uses) {
    return 'Uses: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Delete invite';

  @override
  String get serverChangeIconLabel => 'Change server icon';

  @override
  String get serverFallbackName => 'Server';

  @override
  String serverSettingsTitle(String serverName) {
    return '$serverName Settings';
  }

  @override
  String get serverTabChannels => 'Channels';

  @override
  String get serverTabRoles => 'Roles';

  @override
  String get serverTabMembers => 'Members';

  @override
  String get serverTabInvites => 'Invites';

  @override
  String get serverTabMerch => 'Merch';

  @override
  String get serverTabEmoji => 'Emoji';

  @override
  String get serverTabCustomize => 'Customize';

  @override
  String get serverTabAuditLog => 'Audit Log';

  @override
  String get serverTabReports => 'Reports';

  @override
  String get serverTabThresholdMod => 'Threshold Mod';

  @override
  String get serverTabCharity => 'Charity';

  @override
  String get homeCustomEmojiFallback => 'custom emoji';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reactions',
      one: '$count reaction',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted => ', you reacted, activate to remove';

  @override
  String get homeReactionActivateToAdd => ', activate to add';

  @override
  String get homeAddReactionLabel => 'Add reaction';

  @override
  String homeViewProfile(String username) {
    return 'View $username\'s profile';
  }

  @override
  String get homeMoveToVoiceChannel => 'Move to voice channel…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Choose a voice channel';

  @override
  String get homeNoOtherVoiceChannels => 'No other voice channels';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return 'Moved $username to $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'Couldn\'t move $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'You were moved to $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'Join $channel to talk';
  }

  @override
  String get adminPanelTitle => 'Admin Panel';

  @override
  String get adminTabBackerCodes => 'Backer Codes';

  @override
  String get adminTabUsers => 'Users';

  @override
  String get adminTabDmReports => 'DM Reports';

  @override
  String get adminTabSpamFlags => 'Spam Flags';

  @override
  String get adminTabWiki => 'Wiki';

  @override
  String get adminTabBoosts => 'Boosts';

  @override
  String get adminCreateBackerCodeTitle => 'Create Backer Code';

  @override
  String get adminCodeHint => 'Code (leave blank to auto-generate)';

  @override
  String get adminNoteHint => 'Note (e.g. \"Kickstarter Tier 2\")';

  @override
  String get adminFlagsJsonHint => 'Advanced: extra flags as JSON (optional)';

  @override
  String get adminMaxUsesHint => 'Max uses (leave blank = unlimited)';

  @override
  String get adminCodeCreatedTitle => 'Code Created';

  @override
  String get adminCodeLabel => 'Code:';

  @override
  String get adminCopyCodeTooltip => 'Copy code';

  @override
  String adminFlagsValue(String flags) {
    return 'Flags: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Backer & Reward Codes';

  @override
  String get adminNewCodeButton => 'New Code';

  @override
  String get adminNoCodesYet => 'No codes yet';

  @override
  String get adminRewardsHeader => 'Rewards';

  @override
  String get adminRewardAlphaBetaAccess =>
      'Alpha/Beta Access + Alpha Spark Badge';

  @override
  String get adminRewardLifetimePulse =>
      'Lifetime Pulse + Founder Badge + Enhanced Bitrate';

  @override
  String get adminRewardMonthlyBoostTokenOne =>
      'Monthly Server Boost Token (Enhanced Audio/Video)';

  @override
  String get adminRewardAnimatedFrameBundle =>
      'Animated Profile Frame + Founders Hall + 2 Monthly Server Tokens';

  @override
  String get adminRewardTitanGlow => 'Permanent \"Titan\" Username Glow';

  @override
  String get adminRewardAnimatedFrame => 'Animated Frame';

  @override
  String get adminRewardFoundersHall => 'Founders Hall';

  @override
  String adminRewardMonthlyBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count boost tokens/month',
      one: '1 boost token/month',
    );
    return '$_temp0';
  }

  @override
  String get adminRewardsNone => 'No rewards';

  @override
  String get adminRegistrationOpenLabel => 'Registration is open to everyone';

  @override
  String get adminRegistrationInviteOnlyLabel =>
      'Registration is invite-only (backer code required)';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses uses';
  }

  @override
  String get adminSearchUsersHint => 'Search users by username...';

  @override
  String get adminSearchUsersPrompt => 'Search for a user above';

  @override
  String get adminNoDmReports => 'No DM reports.';

  @override
  String get adminResolvedLabel => 'RESOLVED';

  @override
  String get adminReasonOther => 'other';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Reporter: $reporterId\nRevealed sender: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Note: $note';
  }

  @override
  String get adminDismissButton => 'Dismiss';

  @override
  String get adminMarkActionedButton => 'Mark Actioned';

  @override
  String get adminStatusActioned => 'Actioned';

  @override
  String get adminStatusDismissed => 'Dismissed';

  @override
  String get adminNoSpamFlags => 'No spam flags.';

  @override
  String get adminFlagMassDmSpam => 'Mass-DM spam';

  @override
  String get adminFlagRaidLockdown => 'Raid lockdown';

  @override
  String get adminFlagBotBehavior => 'Bot-like behavior';

  @override
  String get adminFlagChannelFlooding => 'Channel flooding';

  @override
  String get adminAutoEscalatedBadge => 'AUTO-ESCALATED';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Confidence: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'User: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Server: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount of $totalJoiners joiners still muted';
  }

  @override
  String get adminNoJoinersMuted => 'No joiners currently muted';

  @override
  String adminRestrictedUntil(String until) {
    return 'Currently restricted until $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'Not currently restricted';

  @override
  String get adminDismissUndoButton => 'Dismiss & Undo';

  @override
  String get adminConfirmRestrictButton => 'Confirm & Restrict';

  @override
  String get adminDeleteArticleTitle => 'Delete article?';

  @override
  String adminDeleteArticleBody(String title) {
    return '\"$title\" will be removed from Visp\'s knowledge base.';
  }

  @override
  String get adminNewArticleTitle => 'New Article';

  @override
  String get adminEditArticleTitle => 'Edit Article';

  @override
  String get adminArticleTitleHint => 'Title';

  @override
  String get adminArticleContentHint => 'Article content (markdown)';

  @override
  String get adminWikiArticlesHeader => 'Wiki Articles';

  @override
  String get adminNoArticlesYet => 'No articles yet';

  @override
  String get adminEditArticleTooltip => 'Edit article';

  @override
  String get adminDeleteArticleTooltip => 'Delete article';

  @override
  String get adminSearchServersHint => 'Search servers by name...';

  @override
  String get adminSearchServersPrompt => 'Search for a server above';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'Grant boosts to $serverName';
  }

  @override
  String get adminNumBoostsHint => 'Number of boosts';

  @override
  String get adminGrantButton => 'Grant';

  @override
  String get adminPositiveNumberError => 'Enter a positive whole number.';

  @override
  String get adminGrantBoostsFailed => 'Failed to grant boosts.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Granted $count boosts to $serverName -- now level $level ($activeCount active).',
      one:
          'Granted $count boost to $serverName -- now level $level ($activeCount active).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count members';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Grant Boosts';

  @override
  String get parentalDashboardTitle => 'Family';

  @override
  String get parentalDashboardCreateChildTitle => 'Create Child Account';

  @override
  String get parentalDashboardUsernameHint => 'Username';

  @override
  String get parentalDashboardEmailHint => 'Email';

  @override
  String get parentalDashboardPasswordHint => 'Password';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'This creates a fully supervised account: labeled channels are blocked, and you\'ll be able to set allowed hours and see (but not read) their friends and servers.';

  @override
  String get parentalDashboardValidationError =>
      'Username, email, and an 8+ character password are required.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'Could not create child account -- username/email may already be taken.';

  @override
  String get parentalDashboardCreatingLabel => 'Creating...';

  @override
  String get parentalDashboardNoChildren => 'No linked accounts yet.';

  @override
  String get parentalDashboardSupervisedLabel => 'Supervised account';

  @override
  String get parentalDashboardUnknownUser => 'Unknown';

  @override
  String get childDetailFallbackTitle => 'Child account';

  @override
  String get childDetailTabFriends => 'Friends';

  @override
  String get childDetailTabServers => 'Servers';

  @override
  String get childDetailTabSchedule => 'Schedule';

  @override
  String get childDetailTabOverride => 'Override';

  @override
  String get childDetailNoFriends => 'No friends.';

  @override
  String get childDetailUnknownUser => 'Unknown';

  @override
  String get childDetailRemoveFriendTooltip => 'Remove friend';

  @override
  String get childDetailNoServers => 'Not in any servers.';

  @override
  String childDetailMemberCount(int count) {
    return '$count members';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Remove from server';

  @override
  String get childDetailRestrictAccessTitle => 'Restrict access to set hours';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Off means unrestricted access at any time';

  @override
  String get childDetailTimezoneLabel => 'Timezone';

  @override
  String get childDetailMonday => 'Monday';

  @override
  String get childDetailTuesday => 'Tuesday';

  @override
  String get childDetailWednesday => 'Wednesday';

  @override
  String get childDetailThursday => 'Thursday';

  @override
  String get childDetailFriday => 'Friday';

  @override
  String get childDetailSaturday => 'Saturday';

  @override
  String get childDetailSunday => 'Sunday';

  @override
  String get childDetailNoAccessLabel => 'No access';

  @override
  String get childDetailToLabel => 'to';

  @override
  String get childDetailSavingLabel => 'Saving...';

  @override
  String get childDetailSaveScheduleButton => 'Save Schedule';

  @override
  String get childDetailScheduleSaved => 'Schedule saved.';

  @override
  String get childDetailOverrideExplanation =>
      'Grant temporary access outside the normal schedule -- useful for a one-off exception without changing the weekly schedule.';

  @override
  String get childDetailReasonHint => 'Reason (optional)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes min';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+${hours}h';
  }

  @override
  String get childDetailRevokeOverrideButton => 'Revoke Active Override';

  @override
  String get childDetailAccessGranted => 'Temporary access granted.';

  @override
  String get childDetailOverrideRevoked => 'Override revoked.';

  @override
  String get digitalGoodsTitle => 'Digital Goods';

  @override
  String get digitalGoodsMyProductsTitle => 'My Products';

  @override
  String get digitalGoodsManageProductsTooltip =>
      'Manage this server\'s products';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Switch to Browse';

  @override
  String get digitalGoodsCreateProductTooltip => 'Create product';

  @override
  String get digitalGoodsBrowseTab => 'Browse';

  @override
  String get digitalGoodsMyListingsTab => 'My Listings';

  @override
  String get digitalGoodsMyPurchasesTab => 'My Purchases';

  @override
  String get digitalGoodsNoProductsYet => 'No products yet';

  @override
  String get digitalGoodsNoProductsAvailable => 'No products available';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Create your first product to start selling';

  @override
  String get digitalGoodsCheckBackLater => 'Check back later for digital goods';

  @override
  String get digitalGoodsCreateProductButton => 'Create Product';

  @override
  String get digitalGoodsLicenseKeyBadge => 'License Key';

  @override
  String get digitalGoodsFileBadge => 'File';

  @override
  String get digitalGoodsAllServersBadge => 'All Servers';

  @override
  String get digitalGoodsFreeForYou => 'Free for you';

  @override
  String get digitalGoodsFreeLabel => 'Free';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count sold';
  }

  @override
  String get digitalGoodsKeysButton => 'Keys';

  @override
  String get digitalGoodsGetForFree => 'Get for Free';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'Buy for $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'No purchases yet';

  @override
  String get digitalGoodsUnknownProduct => 'Unknown Product';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'Purchased on $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Copy key';

  @override
  String get digitalGoodsLicenseKeyCopied => 'License key copied!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'Expires $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'Your License Key';

  @override
  String get digitalGoodsCopyKeyButton => 'Copy Key';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'Could not start checkout -- this creator may not have connected Stripe yet.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'Purchase complete! Find it under My Purchases.';

  @override
  String get digitalGoodsPurchasePending =>
      'Still waiting on that payment -- it\'ll show up under My Purchases once completed.';

  @override
  String get digitalGoodsCreateProductTitle => 'Create Product';

  @override
  String get digitalGoodsEditProductTitle => 'Edit Product';

  @override
  String get digitalGoodsProductTitleHint => 'Product title';

  @override
  String get digitalGoodsDescriptionHint => 'Description (optional)';

  @override
  String get digitalGoodsPriceHint => 'Price in USD (leave empty for free)';

  @override
  String get digitalGoodsProductTypeLabel => 'Product type';

  @override
  String get digitalGoodsFileDownloadOption => 'File download';

  @override
  String get digitalGoodsLicenseKeyOption => 'License key';

  @override
  String get digitalGoodsAvailabilityLabel => 'Availability';

  @override
  String get digitalGoodsThisServerOnlyOption => 'This server only';

  @override
  String get digitalGoodsAllKodaServersOption => 'All Koda servers';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'After creating, use the \"Keys\" button to upload your license keys.';

  @override
  String get digitalGoodsProductFileLabel => 'Product file';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName (${sizeMb}MB)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Remove file';

  @override
  String get digitalGoodsUploadingLabel => 'Uploading...';

  @override
  String get digitalGoodsChooseFileButton => 'Choose File';

  @override
  String get digitalGoodsReplaceFileButton => 'Replace File';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Choose a file for this product before saving.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'Upload License Keys';

  @override
  String get digitalGoodsPasteKeysHint => 'Paste one key per line:';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Upload Keys';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'License keys uploaded!';

  @override
  String get serverSubscriptionManageTitle => 'Manage Subscriptions';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return '$serverName Subscriptions';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Add tier';

  @override
  String get serverSubscriptionNoTiersYet => 'No subscription tiers yet';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Create up to 3 tiers for your community';

  @override
  String get serverSubscriptionCreateFirstTierButton => 'Create First Tier';

  @override
  String get serverSubscriptionShowSubscriberCounts => 'Show subscriber counts';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/mo';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count active subscribers',
      one: '$count active subscriber',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned => 'Role auto-assigned';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '$discount% marketplace discount';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'This server has no subscription tiers';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Active Subscriber';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'Expires $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk => 'Exclusive subscriber role';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return '$discount% off marketplace purchases';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Subscriber-only channels';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Currently Subscribed';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'Subscribe for $price/mo';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Create Tier';

  @override
  String get serverSubscriptionEditTierTitle => 'Edit Tier';

  @override
  String get serverSubscriptionTierNameHint =>
      'Tier name (e.g. Fan, Supporter, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Description (optional)';

  @override
  String get serverSubscriptionPriceHint => 'Price per month (USD)';

  @override
  String get serverSubscriptionDiscountLabel => 'Marketplace discount %';

  @override
  String get serverSubscriptionPositionLabel => 'Position';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Tier $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Grants role on subscribe — optional';

  @override
  String get serverSubscriptionRoleFallback => 'role';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Automatically given to a member the moment they subscribe, and taken away the moment their subscription expires.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Tier created -- connect Stripe under Marketplace → Creator before members can subscribe to it.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Delete Tier';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return 'Delete \"$tierName\"? Existing subscribers will keep access until expiry.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'Subscribe to $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel =>
      'Monthly subscription';

  @override
  String get serverSubscriptionServerBankEarnsLabel => 'Server bank earns';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points pts';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Payment processed securely by Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'Subscribe';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'Could not start checkout -- this server\'s owner may not have connected Stripe yet.';

  @override
  String get serverSubscriptionSubscribed => 'Subscribed!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'Still waiting on that payment -- it\'ll activate once completed.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'Tip $username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Select amount';

  @override
  String get tipDialogMessageHint => 'Add a message (optional)';

  @override
  String get tipDialogYouPayLabel => 'You pay';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username receives';
  }

  @override
  String get tipDialogSendTipButton => 'Send Tip';

  @override
  String get tipDialogFailedToSendTip =>
      'Failed to send tip. Creator may not be connected to Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'Could not start checkout. Try again in a moment.';

  @override
  String get tipDialogTipSent => 'Tip sent!';

  @override
  String get tipDialogTipPending =>
      'Still waiting on that payment -- it\'ll go through once completed.';

  @override
  String get tipDialogUnknownUser => 'Unknown';

  @override
  String get marketplaceTitle => 'Marketplace';

  @override
  String get marketplaceCreatorPayoutsTitle => 'Creator Payouts';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Receive tips directly via Stripe';

  @override
  String get marketplaceTabServerBank => 'Server Bank';

  @override
  String get marketplaceTabDigitalGoods => 'Digital Goods';

  @override
  String get marketplaceTabMerch => 'Merch';

  @override
  String get marketplaceTabSubscription => 'Subscription';

  @override
  String get marketplaceTabRevenue => 'Revenue';

  @override
  String get marketplaceSelectServerSubscription =>
      'Select a server to view its subscription';

  @override
  String get marketplaceSelectServerBank => 'Select a server to view its bank';

  @override
  String get marketplaceSelectServerRevenue =>
      'Select a server to view its revenue';

  @override
  String get marketplaceStripeAccountStatus => 'Stripe account';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Onboarding complete';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'Accepting payments';

  @override
  String get marketplaceConnectStripeButton => 'Connect Stripe Account';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Complete Stripe Onboarding';

  @override
  String get marketplaceRefreshStatusButton => 'Refresh Status';

  @override
  String get marketplaceReadyToReceiveTips => 'You\'re ready to receive tips!';

  @override
  String get marketplaceHowItWorksTitle => 'How it works';

  @override
  String get marketplaceHowItWorksStep1 => 'Connect your Stripe account';

  @override
  String get marketplaceHowItWorksStep2 => 'Complete identity verification';

  @override
  String get marketplaceHowItWorksStep3 => 'Receive tips directly to your bank';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda charges a 5% processing fee. The fee goes to your server\'s bank as points.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Only the server owner or someone with the Manage Marketplace permission can view the Server Bank.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName boosted!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit custom emoji slots';
  }

  @override
  String get marketplaceServerFallback => 'Server';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance pts';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount in activity';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'Points are earned from the 5% processing fee on tips and subscriptions in this server. Use points to unlock server upgrades.';

  @override
  String get marketplaceServerBoostsTitle => 'Server Boosts';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Level $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count active boosts',
      one: '$count active boost',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: '$more more boosts to reach level $level',
      one: '$more more boost to reach level $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' and unlock a custom server background';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' and unlock a custom server icon border';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'You have $count boost tokens available.',
      one: 'You have $count boost token available.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'Boost tokens come from a Pulse subscription (1/month). Subscribe on the Subscriptions tab to earn one.';

  @override
  String get marketplaceBoostingLabel => 'Boosting...';

  @override
  String get marketplaceBoostThisServerButton => 'Boost This Server';

  @override
  String get marketplaceComingSoonUpgradesTitle =>
      'Coming soon — Server upgrades';

  @override
  String get marketplaceSpendPointsList =>
      'Spend server bank points on:\n• Custom server domain\n• Increased member limit\n• Priority support\n• Exclusive server badge';

  @override
  String get marketplaceSourceTip => 'Tips';

  @override
  String get marketplaceSourceSubscription => 'Koda Subscriptions';

  @override
  String get marketplaceSourceServerSubscription => 'Server Subscriptions';

  @override
  String get marketplaceSourceDigitalProduct => 'Digital Goods';

  @override
  String get marketplaceSourceStageTicket => 'Stage Tickets';

  @override
  String get marketplaceSourcePrintfulOrder => 'Merch Orders';

  @override
  String get marketplaceJustNow => 'just now';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return '${minutes}m ago';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return '${hours}h ago';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return '${days}d ago';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Only members who can manage the marketplace can view this server\'s revenue.';

  @override
  String get marketplaceBalanceLabel => 'Balance';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Lifetime Earned';

  @override
  String get marketplaceLast30DaysTitle => 'Last 30 Days';

  @override
  String get marketplaceRevenueBySourceTitle => 'Revenue by Source';

  @override
  String get marketplaceNoRevenueYet => 'No revenue yet.';

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
  String get marketplaceRecentTransactionsTitle => 'Recent Transactions';

  @override
  String get marketplaceNoTransactionsYet => 'No transactions yet.';

  @override
  String get marketplaceNoActivityYet => 'No activity yet';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Synced $count products from Printful',
      one: 'Synced $count product from Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Could not sync with Printful -- check the connection in Merch settings.';

  @override
  String get printfulMerchSelectServer => 'Select a server to view its merch';

  @override
  String get printfulMerchManageCatalogTitle => 'Manage Merch Catalog';

  @override
  String get printfulMerchTitle => 'Merch';

  @override
  String get printfulMerchSyncingLabel => 'Syncing...';

  @override
  String get printfulMerchSyncCatalogButton => 'Sync Catalog';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'Switch to Browse';

  @override
  String get printfulMerchManageTooltip => 'Manage this server\'s merch';

  @override
  String get printfulMerchNothingSyncedYet => 'Nothing synced yet';

  @override
  String get printfulMerchNoMerchAvailable => 'No merch available yet';

  @override
  String get printfulMerchSyncHint =>
      'Sync your Printful store to pull in your product catalog';

  @override
  String get printfulMerchCheckBackLater =>
      'Check back later for merch from this server';

  @override
  String get printfulMerchOutOfStock => 'Out of stock';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'From $price • $count options',
      one: 'From $price • $count option',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'View';

  @override
  String printfulMerchPayoutTo(String username) {
    return 'Payout to: $username';
  }

  @override
  String get printfulMerchPayoutToYou => 'Payout to: you';

  @override
  String get printfulMerchPayoutChangeButton => 'Change';

  @override
  String get printfulMerchPayoutDialogTitle => 'Payout Recipient';

  @override
  String get printfulMerchPayoutDialogBody =>
      'Route this item\'s share of order proceeds to another user instead of yourself -- they\'ll need their own Stripe account connected and onboarded before anyone can buy it.';

  @override
  String get printfulMerchPayoutUsernameHint => 'Username';

  @override
  String get printfulMerchPayoutLookupButton => 'Look Up';

  @override
  String get printfulMerchPayoutUserNotFound =>
      'No user found with that username.';

  @override
  String printfulMerchPayoutResolvedAs(String username) {
    return 'Found: $username';
  }

  @override
  String get printfulMerchPayoutResetButton => 'Reset to Me';

  @override
  String get printfulMerchCartTooltip => 'Cart';

  @override
  String printfulMerchAddedToCart(String productName) {
    return 'Added $productName to cart';
  }

  @override
  String get printfulMerchQuantityLabel => 'Quantity';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Decrease quantity';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Increase quantity';

  @override
  String get printfulMerchAddToCartButton => 'Add to Cart';

  @override
  String get printfulMerchOptionLabel => 'Option';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Style';

  @override
  String get printfulMerchSizeLabel => 'Size';

  @override
  String get printfulMerchYourCartTitle => 'Your Cart';

  @override
  String get printfulMerchCartEmpty => 'Your cart is empty.';

  @override
  String get printfulMerchSubtotalLabel => 'Subtotal';

  @override
  String get printfulMerchCheckoutLabel => 'Checkout';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'Remove from cart';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Fill in your shipping address first.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'Could not get shipping rates for that address.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'Could not start checkout. Try again in a moment.';

  @override
  String get printfulMerchOrderPlaced => 'Order placed!';

  @override
  String get printfulMerchOrderPending =>
      'Still waiting on that payment -- it\'ll be placed once completed.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Shipping speed';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max business days';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => 'Get Shipping Quote';

  @override
  String get printfulMerchPayButton => 'Pay';

  @override
  String get kodaMarketplaceTitle => 'Koda Marketplace';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Subscriptions';

  @override
  String get kodaMarketplaceTabBoosts => 'Boosts';

  @override
  String get kodaMarketplaceTabDiscover => 'Discover';

  @override
  String get kodaMarketplaceTierFreeName => 'Free';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'Expires $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks => 'Upgrade for exclusive perks';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count boost tokens available',
      one: '$count boost token available',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Gift a token to any server you\'re in from its Server Bank tab';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => 'Custom avatar frame';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Spark badge on profile';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Increased file upload limit (50MB)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality => 'Priority voice quality';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'Everything in Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => 'Animated avatar frame';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Pulse badge on profile';

  @override
  String get kodaMarketplacePulsePerkFileLimit => '100MB file upload limit';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      '1 server boost token per month';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/mo';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Current Plan';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'Get $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return 'Gift $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return 'Gift $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'Subscribe to $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel => 'Gift username:';

  @override
  String get kodaMarketplaceUsernameHint => 'Username';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Subscription';

  @override
  String get kodaMarketplaceTotalLabel => 'Total';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Payment processed securely by Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'Proceed to Payment';

  @override
  String get kodaMarketplaceUserNotFound => 'User not found';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'Could not start checkout. Try again in a moment.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'Subscription active!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'Still waiting on that payment -- it\'ll activate once completed.';

  @override
  String get kodaMarketplaceBoostPurchased => 'Boost purchased!';

  @override
  String get kodaMarketplaceBoostPending =>
      'Still waiting on that payment -- it\'ll be ready once completed.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count available';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Buy a Boost';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'A one-time purchase -- Pulse subscribers also get one free token every renewal, which stays the better deal if you boost regularly.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Buy a Boost -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'No servers have opted into the Koda Marketplace yet. Server owners can turn this on in their server\'s Customize settings.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => 'FEATURED THIS WEEK';

  @override
  String get kodaMarketplaceAllListedServersHeader => 'ALL LISTED SERVERS';

  @override
  String get kodaMarketplaceFeaturedItemsHeader => 'FEATURED ITEMS';

  @override
  String get kodaMarketplaceAllItemsHeader => 'ALL ITEMS';

  @override
  String get kodaMarketplaceServerFallback => 'Server';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '$count member',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceVisitStore => 'Visit Store';

  @override
  String get calendarFallbackTitle => 'Calendar';

  @override
  String get calendarAskVispTooltip => 'Ask Visp';

  @override
  String get calendarCreateEventTooltip => 'Create Event';

  @override
  String get calendarPreviousMonthTooltip => 'Previous month';

  @override
  String get calendarNextMonthTooltip => 'Next month';

  @override
  String get calendarTodayButton => 'Today';

  @override
  String get calendarWeekdaySun => 'Sun';

  @override
  String get calendarWeekdayMon => 'Mon';

  @override
  String get calendarWeekdayTue => 'Tue';

  @override
  String get calendarWeekdayWed => 'Wed';

  @override
  String get calendarWeekdayThu => 'Thu';

  @override
  String get calendarWeekdayFri => 'Fri';

  @override
  String get calendarWeekdaySat => 'Sat';

  @override
  String get calendarTodaySuffix => ', today';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count events',
      one: ', $count event',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'Select a day';

  @override
  String get calendarNoEvents => 'No events';

  @override
  String get calendarSubscribeTooltip => 'Subscribe';

  @override
  String get calendarUnsubscribeTooltip => 'Unsubscribe';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'Repeats $recurrence';
  }

  @override
  String get calendarTicketOwned => 'Ticket owned';

  @override
  String calendarTicketPrice(String price) {
    return '$price ticket';
  }

  @override
  String get calendarDeleteEventTitle => 'Delete Event';

  @override
  String calendarDeleteEventConfirm(String title) {
    return 'Delete \"$title\"? This cannot be undone.';
  }

  @override
  String get calendarEditEventTitle => 'Edit Event';

  @override
  String get calendarCreateEventTitle => 'Create Event';

  @override
  String get calendarEventTitleHint => 'Event title';

  @override
  String get calendarDescriptionHint => 'Description (optional)';

  @override
  String get calendarLocationHint => 'Location (optional)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Start ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Start date and time, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'End — optional ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'End date and time, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'not set';

  @override
  String get calendarTapToSetEndTime => 'Tap to set end time';

  @override
  String get calendarRecurrenceLabel => 'Recurrence';

  @override
  String get calendarRecurrenceNone => 'Does not repeat';

  @override
  String get calendarRecurrenceDaily => 'Daily';

  @override
  String get calendarRecurrenceWeekly => 'Weekly';

  @override
  String get calendarRecurrenceMonthly => 'Monthly';

  @override
  String get calendarColorLabel => 'Color';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Color $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Ticket price — optional';

  @override
  String get calendarLinkStageChannelLabel =>
      'Link to stage channel — optional';

  @override
  String get calendarStageChannelFallback => 'stage';

  @override
  String get discordImportFetchError => 'Could not fetch template.';

  @override
  String get discordImportApplyError =>
      'Failed to apply template. Please try again.';

  @override
  String get discordImportTitle => 'Import Discord Template';

  @override
  String get discordImportDescription =>
      'Paste a discord.new link or template code to import roles, categories, and channels into this server.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 or template code';

  @override
  String get discordImportPreviewButton => 'Preview';

  @override
  String get discordImportTemplateFallback => 'Template';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count roles',
      one: '$count role',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categories',
      one: '$count category',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count channels',
      one: '$count channel',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel => 'REPLACE EXISTING STRUCTURE';

  @override
  String get discordImportReplaceWarning =>
      'All existing channels, categories and roles will be permanently deleted.';

  @override
  String get discordImportAddDescription =>
      'Template will be added to your existing server structure.';

  @override
  String get discordImportReplaceConfirmTitle => 'Replace server structure?';

  @override
  String get discordImportReplaceConfirmBody =>
      'This will permanently delete ALL existing channels, categories, and roles before importing. This cannot be undone.';

  @override
  String get discordImportYesReplace => 'Yes, Replace';

  @override
  String get discordImportReplaceAndImportButton => 'Replace & Import Template';

  @override
  String get discordImportAddToServerButton => 'Add Template to Server';

  @override
  String get thresholdModConfigureTitle => 'Configure Threshold Moderation';

  @override
  String get thresholdModConfigureExplanation =>
      'Pick trusted moderators and how many of them must agree before any of them can decrypt one epoch of a channel\'s history. Not even you get a unilateral key -- you\'re only exempt if you\'re also in this list.';

  @override
  String get thresholdModThresholdLabel => 'Threshold:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Decrease threshold';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Increase threshold';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'of $count moderators',
      one: 'of $count moderator',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle => 'Request Threshold Decrypt';

  @override
  String get thresholdModChannelLabel => 'Channel';

  @override
  String get thresholdModReasonHint =>
      'Reason -- shown to every designated moderator';

  @override
  String get thresholdModRequestButton => 'Request';

  @override
  String get thresholdModShareRelayed => 'Share relayed to the requester.';

  @override
  String get thresholdModNotEnoughShares =>
      'Not enough shares relayed yet -- try again once more moderators have relayed theirs.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count messages',
      one: '$count message',
    );
    return 'Epoch $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'No decryptable messages in this epoch.';

  @override
  String get thresholdModExplanation =>
      'Real decryption of a channel\'s history, gated on multiple designated moderators actively agreeing -- never one person alone, not even the server owner. Only ever unlocks one whole epoch (everything sent since the last membership change), never a single message.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Enabled -- $count moderators, threshold $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'Not configured';

  @override
  String get thresholdModReconfigureButton => 'Reconfigure';

  @override
  String get thresholdModEnableButton => 'Enable';

  @override
  String get thresholdModNotEnabledForServer =>
      'Threshold moderation is not enabled for this server.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Enabled for this server. You are not one of the designated moderators.';

  @override
  String get thresholdModRequestsLabel => 'Requests';

  @override
  String get thresholdModRequestDecryptButton => 'Request Decrypt';

  @override
  String get thresholdModNoActiveRequests => 'No active requests.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- epoch $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'pending';

  @override
  String get thresholdModStatusApproved => 'approved';

  @override
  String get thresholdModApproveButton => 'Approve';

  @override
  String get thresholdModRelayShareButton => 'Relay My Share';

  @override
  String get thresholdModTryReconstructButton => 'Try Reconstruct';

  @override
  String get roleSelectNoRolesAvailable =>
      'No self-assignable roles available.';

  @override
  String get roleSelectInstructions =>
      'Select the roles you want. Tap a role to add or remove it.';

  @override
  String get rulesScreenAcceptError => 'Could not accept rules. Try again.';

  @override
  String get rulesScreenSubtitle => 'Server Rules';

  @override
  String get rulesScreenScrollToRead => 'Scroll down to read all rules';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'By clicking Accept, you agree to follow these rules.\nViolations may result in removal from the server.';

  @override
  String get rulesScreenAcceptButton => 'I Accept the Rules';

  @override
  String get rulesScreenReadAllToContinue => 'Read all rules to continue';

  @override
  String get galleryNewPostTitle => 'New Post';

  @override
  String get galleryChooseFileButton => 'Choose File';

  @override
  String get galleryOrDivider => 'or';

  @override
  String get galleryPasteUrlHint => 'Paste image/video URL';

  @override
  String get galleryTypeLabel => 'Type';

  @override
  String get galleryImageOption => 'Image';

  @override
  String get galleryVideoOption => 'Video';

  @override
  String get galleryCaptionHint => 'Caption (optional)';

  @override
  String get galleryPostButton => 'Post';

  @override
  String get galleryNewCollectionTitle => 'New Collection';

  @override
  String get galleryCollectionNameHint => 'Collection name';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return 'Delete \"$collectionName\"? Posts inside will become uncollected.';
  }

  @override
  String get galleryFeedTab => 'Feed';

  @override
  String get galleryCollectionsTab => 'Collections';

  @override
  String get galleryNoPostsYet => 'No posts yet';

  @override
  String get galleryNoCollectionsYet => 'No collections yet';

  @override
  String get gallerySelectACollection => 'Select a collection';

  @override
  String get galleryNoPostsInCollection => 'No posts in this collection';

  @override
  String get galleryAddPostButton => 'Add Post';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Screen share failed: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return '$username\'s Volume';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'Only affects what you hear -- this device, this call.';

  @override
  String get voiceScreenResetVolumeButton => 'Reset';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'Could not connect: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Your screen, tap to view full-screen';

  @override
  String get voiceScreenYourScreenLabel => 'Your screen';

  @override
  String get voiceScreenTapToClose => 'Tap to close';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (you)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', speaking';

  @override
  String get voiceScreenCameraOnSuffix => ', camera on';

  @override
  String get voiceScreenActivateToPopOut => ', activate to pop out';

  @override
  String get voiceScreenShowVarmTooltip => 'Show VARM';

  @override
  String get voiceScreenHideVarmTooltip => 'Hide VARM';

  @override
  String get voiceScreenShowChatTooltip => 'Show Chat';

  @override
  String get voiceScreenHideChatTooltip => 'Hide Chat';

  @override
  String get voiceScreenStartCameraTooltip => 'Start camera';

  @override
  String get voiceScreenStopCameraTooltip => 'Stop camera';

  @override
  String get voiceScreenShareScreenTooltip => 'Share screen';

  @override
  String get voiceScreenStopSharingTooltip => 'Stop sharing';

  @override
  String get voiceScreenPopOutTooltip => 'Pop out voice to separate window';

  @override
  String get voiceScreenCouldNotPopOut => 'Could not pop out voice.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Leave Voice';

  @override
  String get voiceScreenPinTooltip => 'Pin (keep open)';

  @override
  String get voiceScreenUnpinTooltip => 'Unpin';

  @override
  String get voiceScreenSizeSmall => 'Small (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Medium (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Large (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, $count connected';
  }

  @override
  String get voiceBarSpeakingSuffix => ', you are speaking';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count connected · tap to expand';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Start camera';

  @override
  String get voiceBarStopCameraTooltip => 'Stop camera';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Leave Voice';

  @override
  String get popOutVideoFallbackTitle => 'Voice';

  @override
  String get popOutVideoMissingTokenError => 'Missing token or URL';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Connection timed out after 15 seconds';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Error: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'No participants';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Stage';

  @override
  String get stageCouldNotJoin => 'Could not join stage.';

  @override
  String get stageThisStageFallback => 'This stage';

  @override
  String get stageRequiresTicketToJoin => 'requires a ticket to join';

  @override
  String get stagePleaseWaitLabel => 'Please wait...';

  @override
  String get stageGetFreeTicketButton => 'Get Free Ticket';

  @override
  String stageBuyTicketButton(String price) {
    return 'Buy Ticket -- $price';
  }

  @override
  String get stageNotNowButton => 'Not now';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'Could not start ticket purchase.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'Still waiting on that payment -- try joining again once it\'s confirmed.';

  @override
  String get stageSpeakerBadge => 'Speaker';

  @override
  String get stageListenerBadge => 'Listener';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'Could not join: $error';
  }

  @override
  String get stageSpeakersHeader => 'SPEAKERS';

  @override
  String get stageRaisedHandsHeader => 'RAISED HANDS';

  @override
  String get stageAllowButton => 'Allow';

  @override
  String get stageIgnoreButton => 'Ignore';

  @override
  String get stageListenersHeader => 'LISTENERS';

  @override
  String get stageRaiseHandTooltip => 'Raise hand';

  @override
  String get stageLowerHandTooltip => 'Lower hand';

  @override
  String get stageLeaveStageTooltip => 'Leave Stage';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (you)';
  }

  @override
  String get stageMoveToListenersButton => 'Move to listeners';

  @override
  String get stageYouFallbackName => 'You';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'Avatar for $username';
  }

  @override
  String get channelEditDialogNewTitle => 'New Channel';

  @override
  String get channelEditDialogEditTitle => 'Edit Channel';

  @override
  String get channelEditDialogNameHint => 'Channel name';

  @override
  String get channelEditDialogDescriptionHint => 'Topic (optional)';

  @override
  String get channelEditDialogTypeLabel => 'Type';

  @override
  String get channelEditDialogTypeText => 'Text';

  @override
  String get channelEditDialogTypeVoice => 'Voice';

  @override
  String get channelEditDialogTypeGallery => 'Gallery';

  @override
  String get channelEditDialogTypeStage => 'Stage';

  @override
  String get channelEditDialogTypeRules => 'Rules';

  @override
  String get channelEditDialogTypeRoleSelection => 'Role Selection';

  @override
  String get channelEditDialogTypeCalendar => 'Calendar';

  @override
  String get channelEditDialogAnnouncementTitle => 'Announcement channel';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Only members who can manage messages may post';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Post live-stream & upload announcements here';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'Auto-posts when a member with the \"Announce when live\" permission goes live on Twitch, or posts a new YouTube video';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Notify these roles when posted (optional)';

  @override
  String get channelEditDialogSlowmodeLabel => 'Slowmode';

  @override
  String get channelEditDialogSlowmodeOff => 'Off';

  @override
  String get channelEditDialogUserLimitLabel => 'User Limit';

  @override
  String get channelEditDialogUserLimitOff => 'No limit';

  @override
  String get channelEditDialogCategoryLabel => 'Category';

  @override
  String get channelEditDialogNoCategory => 'No category';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Role Access (leave empty for all)';

  @override
  String get channelEditDialogContentLabelsLabel => 'Content Labels';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Flags this channel for members\' content filters; hard-blocked for supervised accounts';

  @override
  String get categoryEditDialogNewTitle => 'New Category';

  @override
  String get categoryEditDialogEditTitle => 'Edit Category';

  @override
  String get categoryEditDialogNameHint => 'Category name';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Role Access (leave empty for all)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Members — $count online';
  }

  @override
  String get memberPanelRefreshTooltip => 'Refresh member list';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '$count member',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Offline';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', $tier tier';
  }

  @override
  String get memberPanelUnknownUser => 'Unknown';

  @override
  String get memberPanelModerationActionsTooltip => 'Moderation actions';

  @override
  String get reportDialogReasonSpam => 'Spam';

  @override
  String get reportDialogReasonHarassment => 'Harassment or abuse';

  @override
  String get reportDialogReasonIllegal => 'Illegal content';

  @override
  String get reportDialogReasonOther => 'Other';

  @override
  String get reportDialogReasonLabel => 'Reason';

  @override
  String get reportDialogNoteHint =>
      'Anything else moderators should know? (optional)';

  @override
  String get reportDialogDisclosureNote =>
      'The message content shown to you and who sent it will be shared with this server\'s moderators.';

  @override
  String get reportDialogSubmitButton => 'Submit Report';

  @override
  String get reportDialogSubmitError => 'Could not submit report.';

  @override
  String get notificationBellTitle => 'Notifications';

  @override
  String get notificationBellMarkAllRead => 'Mark all read';

  @override
  String get notificationBellEmptyState => 'No notifications yet';

  @override
  String get notificationBellUnreadLabel => 'Unread';

  @override
  String get invitePreviewTitle => 'Server Invite';

  @override
  String get invitePreviewInvalidOrExpired => 'Invalid or expired invite.';

  @override
  String get invitePreviewCouldNotJoin => 'Could not join server.';

  @override
  String get invitePreviewUnknownServer => 'Unknown server';

  @override
  String get shippingAddressFullNameHint => 'Full name';

  @override
  String get shippingAddressLine1Hint => 'Address line 1';

  @override
  String get shippingAddressLine2Hint => 'Address line 2 (optional)';

  @override
  String get shippingAddressCityHint => 'City';

  @override
  String get shippingAddressStateHint => 'State';

  @override
  String get shippingAddressZipHint => 'ZIP / postal code';

  @override
  String get shippingAddressCountryCodeHint => 'Country code (e.g. US)';

  @override
  String get shippingAddressPhoneHint => 'Phone (optional)';

  @override
  String get shippingAddressPrivacyNote =>
      'Used only to ship this order -- see Printful\'s own privacy policy for how they handle it once the order is placed.';

  @override
  String get updateNudgeAvailableTitle => 'Update Available';

  @override
  String get updateNudgeRequiredTitle => 'Update Required';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $version is available -- you\'re on an older build.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'This build is no longer supported. Update to Koda $version to keep using Koda.';
  }

  @override
  String get updateNudgeLaterButton => 'Later';

  @override
  String get tierBadgeSparkSubscriber => 'Spark subscriber';

  @override
  String get tierBadgePulseSubscriber => 'Pulse subscriber';

  @override
  String get tierBadgeAlphaSpark => 'Alpha Spark';

  @override
  String get tierBadgeFounder => 'Founder';

  @override
  String get foundersHallTitle => 'Founders Hall';

  @override
  String get foundersHallSubtitle =>
      'The earliest backers who helped make Koda possible.';

  @override
  String get foundersHallEmptyState => 'No founders yet.';

  @override
  String get settingsFoundersHallTitle => 'Founders Hall';

  @override
  String get settingsFoundersHallSubtitle => 'See who helped build Koda';

  @override
  String get vispAvatarInDevelopment => 'IN DEVELOPMENT';

  @override
  String get vispBoostAdvisorCouldNotAnswer =>
      'Visp could not put together an answer.';

  @override
  String get vispBoostAdvisorTitle => 'Ask Visp: Boost ROI Advisor';

  @override
  String get vispBoostAdvisorFollowUpHint => 'Ask a follow-up...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Send';

  @override
  String get vispBoostAdvisorBasedOn => 'Based on:';

  @override
  String get vispEventDialogCouldNotGenerate =>
      'Visp could not generate an event.';

  @override
  String get vispEventDialogCouldNotCreate => 'Could not create that event.';

  @override
  String get vispEventDialogRecurrenceNone => 'One-time';

  @override
  String get vispEventDialogRecurrenceDaily => 'Repeats daily';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Repeats weekly';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Repeats monthly';

  @override
  String get vispEventDialogTitle => 'Ask Visp to create an event';

  @override
  String get vispEventDialogDescription =>
      'Describe the event -- Visp will propose a title, date/time, and any other details.';

  @override
  String get vispEventDialogPromptHint =>
      'e.g. \"Weekly D&D session every Friday at 7pm for about 3 hours\"';

  @override
  String get vispEventDialogPrivacyNote =>
      'Your description is sent to Visp (a self-hosted assistant -- nothing leaves Koda\'s servers) to generate this plan.';

  @override
  String get vispEventDialogStartOver => 'Start Over';

  @override
  String get vispEventDialogCreateEvent => 'Create Event';

  @override
  String get vispEventDialogThinking => 'Thinking...';

  @override
  String get vispEventDialogGeneratePlan => 'Generate Plan';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'Could not parse a date -- try rephrasing';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Ends $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price per ticket';
  }

  @override
  String get vispEventDialogBasedOn => 'Based on:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Question $questionNumber of $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'Or type your own answer...';

  @override
  String get vispQuestionStepSendTooltip => 'Send';

  @override
  String get vispQuestionStepSkip => 'Skip and generate now';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp could not generate a plan.';

  @override
  String get vispSetupDialogCouldNotApplyPlan => 'Could not apply that plan.';

  @override
  String get vispSetupDialogTitleNew => 'Describe your server to Visp';

  @override
  String get vispSetupDialogTitleExisting => 'Ask Visp to add to this server';

  @override
  String get vispSetupDialogDescriptionNew =>
      'Describe the server you want -- Visp will propose a name and a set of roles, categories, and channels.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Describe what you\'d like to add -- Visp will propose roles, categories, and channels to create.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'e.g. \"A cozy server for my D&D group with voice channels for two tables\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'e.g. \"Add a couple more channels for our raid teams\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      'Your description is sent to Visp (a self-hosted assistant -- nothing leaves Koda\'s servers) to generate this plan.';

  @override
  String get vispSetupDialogStartOver => 'Start Over';

  @override
  String get vispSetupDialogCreateServer => 'Create Server';

  @override
  String get vispSetupDialogAddToServer => 'Add to Server';

  @override
  String get vispSetupDialogThinking => 'Thinking...';

  @override
  String get vispSetupDialogGeneratePlan => 'Generate Plan';

  @override
  String get vispSetupDialogNewServerLabel => 'New server';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count roles',
      one: '$count role',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categories',
      one: '$count category',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count channels',
      one: '$count channel',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'Based on:';

  @override
  String get childLockoutTitle => 'It\'s outside your allowed hours';

  @override
  String get childLockoutBody =>
      'A parent or guardian has set times this account can use Koda. Ask them for more time, or check back during your next allowed window.';

  @override
  String get childLockoutLogOutButton => 'Log Out';

  @override
  String get forcePasswordChangeError =>
      'Could not update password. Try again.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Welcome, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Your account requires a new password before you can continue.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'New password';

  @override
  String get forcePasswordChangeConfirmPasswordHint => 'Confirm new password';

  @override
  String get forcePasswordChangeReqLength => 'At least 12 characters';

  @override
  String get forcePasswordChangeReqUpper => 'One uppercase letter';

  @override
  String get forcePasswordChangeReqLower => 'One lowercase letter';

  @override
  String get forcePasswordChangeReqDigit => 'One number';

  @override
  String get forcePasswordChangeReqMatch => 'Passwords match';

  @override
  String get forcePasswordChangeSubmitButton => 'Set New Password';

  @override
  String get forgotPasswordEnterEmailError => 'Enter your email address.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'If that account exists, a reset code has been sent.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Enter the code and a password of at least 8 characters.';

  @override
  String get forgotPasswordInvalidCode => 'Invalid or expired code.';

  @override
  String get forgotPasswordTitle => 'Reset password';

  @override
  String get forgotPasswordEmailHint => 'Email address';

  @override
  String get forgotPasswordSendCodeButton => 'Send reset code';

  @override
  String get forgotPasswordCodeHint => '6-digit code';

  @override
  String get forgotPasswordNewPasswordHint => 'New password';

  @override
  String get forgotPasswordSetNewPasswordButton => 'Set new password';

  @override
  String get verifyEmailEnterCodeError =>
      'Enter the 6-digit code from your email.';

  @override
  String get verifyEmailInvalidCode => 'Invalid or expired code.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'A new code has been sent to $email.';
  }

  @override
  String get verifyEmailResendFailed => 'Could not resend right now.';

  @override
  String get verifyEmailTitle => 'Check your email';

  @override
  String verifyEmailSentCode(String email) {
    return 'We sent a 6-digit code to $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'Verify Email';

  @override
  String get verifyEmailResendButton => 'Resend code';

  @override
  String get safetyNumberKeysNotSetUp =>
      'Your own keys haven\'t been set up yet.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName has no key bundle yet.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'Could not compute safety number: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName no longer has that device.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'Safety Number with $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Compare this number with $peerName through another channel -- in person, a phone call, anywhere other than this chat. If it matches on both sides, you\'re talking to who you think you\'re talking to.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName has $count devices, each with its own safety number -- verifying one doesn\'t cover the others.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Device $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Mark as Verified';

  @override
  String get contentFiltersDescription =>
      'Servers can flag channels with content labels. Choose how you want labeled channels to behave -- this is your own preference and never affects what anyone else sees.';

  @override
  String get contentFiltersLabelAdult => 'Adult content';

  @override
  String get contentFiltersLabelSuggestive => 'Suggestive';

  @override
  String get contentFiltersLabelGraphic => 'Graphic media';

  @override
  String get contentFiltersLabelNudity => 'Non-sexual nudity';

  @override
  String get contentFiltersDescAdult => 'Sexually explicit content';

  @override
  String get contentFiltersDescSuggestive =>
      'Sexually suggestive but not explicit content';

  @override
  String get contentFiltersDescGraphic => 'Violence or gore';

  @override
  String get contentFiltersDescNudity => 'Nudity in a non-sexual context';

  @override
  String get contentFiltersHide => 'Hide';

  @override
  String get contentFiltersWarn => 'Warn';

  @override
  String get contentFiltersShow => 'Show';

  @override
  String get deviceTestCouldNotGetToken => 'Could not get a test token.';

  @override
  String get deviceTestLabelTest => 'Test';

  @override
  String get deviceTestLabelRecording => 'Recording...';

  @override
  String get deviceTestLabelPlayingBack => 'Playing back...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'Could not start camera: $error';
  }

  @override
  String get deviceTestTitle => 'Test Devices';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'Could not connect: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Microphone';

  @override
  String get deviceTestHearYourselfLabel => 'Hear Yourself (Delayed)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Speaker / Output';

  @override
  String get deviceTestCameraLabel => 'Camera';

  @override
  String get deviceTestSystemDefault => 'System default';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Talk, then hear a ${seconds}s clip play back';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '${seconds}s';
  }

  @override
  String get deviceTestCameraPreviewOff => 'Camera preview off';

  @override
  String get deviceTestStopCameraButton => 'Stop Camera Test';

  @override
  String get deviceTestTestCameraButton => 'Test Camera';

  @override
  String get deviceTestInputLevelLabel => 'Input level';

  @override
  String get devicesScreenRemoveConfirmTitle => 'Remove this device?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'It will need to sign in again, and any messages sent to it while removed won\'t reach it after -- Double Ratchet sessions don\'t retroactively fill in gaps.';

  @override
  String get devicesScreenRemoveFailed => 'Could not remove that device.';

  @override
  String get devicesScreenNeverActive => 'Never active';

  @override
  String devicesScreenActiveDate(String date) {
    return 'Active $date';
  }

  @override
  String get devicesScreenDescription =>
      'Each device you sign into has its own encryption identity -- a message sent to you reaches every device below. Remove one you don\'t use or don\'t recognize.';

  @override
  String get devicesScreenNoDevicesFound => 'No devices found.';

  @override
  String get devicesScreenUnknownDevice => 'Unknown device';

  @override
  String get devicesScreenThisDeviceBadge => 'This device';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Remove device';

  @override
  String get totpSetupInvalidCode => 'Invalid code. Try again.';

  @override
  String get totpSetupEnabledMessage => 'Two-factor authentication is enabled.';

  @override
  String get totpSetupScanInstructions =>
      'Scan this secret into your authenticator app (Google Authenticator, 1Password, Authy):';

  @override
  String get totpSetupCodeHint => 'Enter 6-digit code to confirm';

  @override
  String get totpSetupVerifyButton => 'Verify & Enable';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'Push to Talk';

  @override
  String get voiceVideoSettingsPressAnyKeyHint => 'Press any key to bind it...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Test Devices';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Voice Processing';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'Noise Suppression';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Reduce background noise on your mic';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Deep Noise Suppression (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'Real-time AI noise removal, stronger than standard suppression -- replaces it when on';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'Echo Cancellation';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Prevent your own audio from echoing back';

  @override
  String get voiceVideoSettingsAutoGainTitle => 'Auto Gain Control';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Automatically balance mic volume (loudness normalization)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'Auto-Ducking';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Lower other participants\' volume while you\'re talking';

  @override
  String get voiceVideoSettingsHighPassTitle => 'High-Pass Filter';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Cut low-frequency rumble (fans, AC, desk bumps)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle => 'Typing Noise Detection';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Suppress keyboard clatter picked up by your mic';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Voice Isolation';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Focus on your voice, filtering out other people and sounds nearby';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Mic Boost';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Enable Boost';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Preamp gain for a quiet or distant mic -- applied before EQ';

  @override
  String get voiceVideoSettingsBandBoost => 'Boost';

  @override
  String get voiceVideoSettingsSectionMicEq => 'Mic EQ';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'Enable EQ';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Shape your mic before it reaches other people';

  @override
  String get voiceVideoSettingsBandBass => 'Bass';

  @override
  String get voiceVideoSettingsBandMid => 'Mid';

  @override
  String get voiceVideoSettingsBandTreble => 'Treble';

  @override
  String get voiceVideoSettingsSectionVad => 'Voice Activity Detection (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'Enable VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Only transmit when you\'re actually speaking';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Sensitivity';

  @override
  String get voiceVideoSettingsVadHint =>
      'Lower = picks up quieter sounds. Higher = only louder speech triggers transmission.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Bound key';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'Not set — mic stays live whenever unmuted';

  @override
  String get voiceVideoSettingsClearButton => 'Clear';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Set Key';

  @override
  String get voiceVideoSettingsChangeButton => 'Change';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'When a key is bound, your mic transmits only while you hold that key down. This takes priority over VOX while you\'re in a voice channel.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Virtual Avatar Reactive Model';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Upload two images that swap when you speak. Visible only to you.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'Silent';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'Talking';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'Speaking threshold';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Lower = switches to talking image more easily.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'Remove VARM';

  @override
  String get gifPickerNoGifsFound => 'No GIFs found';

  @override
  String get gifPickerSearchHint => 'Search GIFs...';

  @override
  String get messageSearchHint => 'Search this channel...';

  @override
  String get messageSearchTooltip => 'Search';

  @override
  String get messageSearchInitialHint =>
      'Searches messages already loaded on this device -- older history gets fetched (and decrypted locally) as you scan further back.';

  @override
  String get messageSearchNoMatches => 'No matches';

  @override
  String get messageSearchStartOfHistory => 'Start of channel history';

  @override
  String get messageSearchFurtherBackButton => 'Search further back';

  @override
  String get messageSearchUnknownAuthor => 'Unknown';
}
