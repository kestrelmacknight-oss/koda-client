// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonSave => 'Kaydet';

  @override
  String get commonEdit => 'Düzenle';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonCreate => 'Oluştur';

  @override
  String get commonClose => 'Kapat';

  @override
  String get commonDone => 'Bitti';

  @override
  String get commonDownload => 'İndir';

  @override
  String get commonDisconnect => 'Bağlantıyı Kes';

  @override
  String get commonNone => 'Yok';

  @override
  String get commonJoin => 'Katıl';

  @override
  String get commonDismiss => 'Yoksay';

  @override
  String get commonSubmit => 'Gönder';

  @override
  String get commonConfirm => 'Onayla';

  @override
  String get commonRemove => 'Kaldır';

  @override
  String get commonRetry => 'Yeniden Dene';

  @override
  String get commonOk => 'Tamam';

  @override
  String get commonYes => 'Evet';

  @override
  String get commonNo => 'Hayır';

  @override
  String get commonSearch => 'Ara';

  @override
  String get commonSettings => 'Ayarlar';

  @override
  String get commonLoading => 'Yükleniyor...';

  @override
  String get settingsLanguageSection => 'Dil';

  @override
  String get settingsLanguageTitle => 'Uygulama Dili';

  @override
  String get settingsLanguageSystemDefault => 'Sistem varsayılanı';

  @override
  String get settingsLanguageDescription =>
      'Koda\'nın arayüzünün görüntüleneceği dili seçin. Bu, herhangi bir sunucunun birincil dilinden veya mesaj yazdığınız dilden ayrıdır.';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get settingsSignOut => 'Çıkış yap';

  @override
  String get settingsSectionMyAccount => 'Hesabım';

  @override
  String get settingsSectionSecurity => 'Güvenlik';

  @override
  String get settingsSectionAccessibility => 'Erişilebilirlik';

  @override
  String get settingsSectionBilling => 'Faturalandırma';

  @override
  String get settingsSectionFamily => 'Aile';

  @override
  String get settingsSectionVoiceVideo => 'Ses ve Görüntü';

  @override
  String get settingsSectionDesktop => 'Masaüstü';

  @override
  String get settingsSectionAbout => 'Hakkında';

  @override
  String get settingsTwoFactorTitle => 'İki Faktörlü Kimlik Doğrulama';

  @override
  String get settingsTwoFactorSubtitle =>
      'Ekstra güvenlik için bir kimlik doğrulama uygulaması ekleyin';

  @override
  String get settingsLinkedDevicesTitle => 'Bağlı Cihazlar';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'Bu hesapta oturum açmış cihazları görün ve kaldırın';

  @override
  String get settingsContentFiltersTitle => 'İçerik Filtreleri';

  @override
  String get settingsContentFiltersSubtitle =>
      'Etiketlenmiş içeriğin nasıl görüneceğini seçin';

  @override
  String get settingsDmFriendsOnlyTitle =>
      'Yalnızca arkadaşlardan DM\'e izin ver';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Arkadaş olmayanlar sizinle yeni bir görüşme başlatamaz';

  @override
  String get settingsDmPrivacyError => 'DM gizliliği güncellenemedi.';

  @override
  String get settingsShowVispAvatarTitle => 'Visp\'in avatarını göster';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Visp\'in kurulum/etkinlik/danışman pencerelerinde yüzünü ve ruh halini gösterir';

  @override
  String get settingsHighContrastTitle => 'Yüksek Kontrast';

  @override
  String get settingsHighContrastSubtitle =>
      'Uygulama genelinde saf siyah/beyaz, yüksek kontrastlı renkler -- geçiş yapmak mevcut ekranı kısa süreliğine yeniden yükler.';

  @override
  String get settingsDyslexiaFontTitle => 'Disleksi dostu yazı tipi';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Gövde metnini uygulama genelinde OpenDyslexic\'e çevirir';

  @override
  String get settingsFontSizeTitle => 'Yazı tipi boyutu';

  @override
  String get settingsFontSizeSample =>
      'Pijamalı hasta yağız şoföre çabucak güvendi';

  @override
  String get settingsDensityTitle => 'Yoğunluk';

  @override
  String get settingsDensityDescription =>
      'Standart kontrollerin -- düğmeler, anahtarlar, pencereler -- boşluğunu etkiler, özel her düzeni değil.';

  @override
  String get settingsDensityCompact => 'Kompakt';

  @override
  String get settingsDensityStandard => 'Standart';

  @override
  String get settingsDensityComfortable => 'Rahat';

  @override
  String get settingsStreamingTitle => 'Yayın Hesapları';

  @override
  String get settingsStreamingDescription =>
      '\"Canlı Yayına Geçince Duyur\" iznine sahip olduğunuz sunucuların, canlı yayına geçtiğinizde veya yeni bir video paylaştığınızda otomatik olarak paylaşım yapabilmesi için Twitch/YouTube\'u bağlayın.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform, $username$liveSuffix olarak bağlı';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform bağlı değil';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- şu anda canlı';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- yeni bir yükleme';

  @override
  String get settingsStreamingConnecting => 'Bağlanıyor...';

  @override
  String get settingsStreamingConnect => 'Bağlan';

  @override
  String get settingsAnnounceLiveTwitch => 'Canlı yayına geçtiğimde duyur';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Canlı yayınları ve yeni yüklemeleri duyur';

  @override
  String get settingsRefreshStatus =>
      'Tarayıcınızda zaten bağlandınız mı? Durumu yenile';

  @override
  String settingsStreamingConnectError(String platform) {
    return '$platform bağlantısı başlatılamadı.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Bağlantıyı tarayıcınızda tamamlayın, sonra geri dönüp yenileyin.';

  @override
  String get settingsThroneTitle => 'Throne Webhook';

  @override
  String get settingsThroneDescription =>
      'Biri size hediye gönderdiğinde Koda\'da bildirim almak için bu URL\'yi Throne.com webhook ayarlarınıza yapıştırın.';

  @override
  String get settingsThroneGetUrl => 'Webhook URL\'imi al';

  @override
  String get settingsThroneCopyTooltip => 'Kopyala';

  @override
  String get settingsThroneCopiedToast => 'Panoya kopyalandı';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Yeniden oluştur (eski URL\'yi geçersiz kılar)';

  @override
  String get settingsThroneRegenerateConfirmTitle =>
      'Webhook URL\'si yeniden oluşturulsun mu?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'Eski URL\'niz çalışmayı durduracak, bu yüzden daha sonra Throne.com\'da güncelleyin.';

  @override
  String get settingsThroneRegenerate => 'Yeniden oluştur';

  @override
  String get settingsUploadPhoto => 'Fotoğraf Yükle';

  @override
  String get settingsOrPasteUrl => 'veya aşağıya bir URL yapıştırın';

  @override
  String get settingsAvatarUrlHint => 'https://example.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'Görsel yüklemek için Cloudflare R2 gerekir — URL yapıştırma her zaman çalışır.';

  @override
  String get settingsDisplayNameLabel => 'GÖRÜNEN AD';

  @override
  String get settingsDisplayNameHint => 'Görünen ad';

  @override
  String get settingsBioLabel => 'BİYOGRAFİ';

  @override
  String get settingsBioHint => 'İnsanlara kendinizden biraz bahsedin';

  @override
  String get settingsPronounsLabel => 'ZAMİRLER';

  @override
  String get settingsPronounsHint => 'örn. o/onun';

  @override
  String get settingsShowPronounsTitle => 'Zamirlerimi başkalarına göster';

  @override
  String get settingsShowPronounsSubtitle =>
      'Sohbette, üye listelerinde ve seste adınızın yanında gösterilir';

  @override
  String get settingsStatusLabel => 'DURUM';

  @override
  String get settingsCustomStatusLabel => 'ÖZEL DURUM';

  @override
  String get settingsCustomStatusHint => 'Aklında ne var?';

  @override
  String get statusOnline => 'Çevrimiçi';

  @override
  String get statusAway => 'Uzakta';

  @override
  String get statusDnd => 'Rahatsız Etmeyin';

  @override
  String get statusInvisible => 'Görünmez';

  @override
  String get settingsFamilyNotAvailable =>
      'Ebeveyn kontrolleri denetimli bir hesapta kullanılamaz.';

  @override
  String get settingsAboutTitle => 'Koda Hakkında';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Şartlar ve Koşullar';

  @override
  String get settingsPrivacyTitle => 'Gizlilik Politikası';

  @override
  String get settingsSupportTitle => 'Destek';

  @override
  String get settingsReportSecurityTitle => 'Bir Güvenlik Sorunu Bildir';

  @override
  String get settingsDesktopNotAvailable =>
      'Bunlar yalnızca masaüstüne özel ayarlardır -- bu platformda pencere veya sistem tepsisi yok.';

  @override
  String get settingsCloseToTrayTitle => 'Sistem tepsisine küçült';

  @override
  String get settingsCloseToTraySubtitle =>
      'Pencereyi kapatmak Koda\'yı arka planda çalışır durumda tutar, böylece bildirim almaya devam edersiniz -- pencereyi kapatmanın uygulamayı gerçekten kapatmasını sağlamak için bunu kapatın.';

  @override
  String get authErrorEmailPasswordRequired => 'E-posta ve şifre gereklidir.';

  @override
  String get authErrorIncorrectCredentials => 'Hatalı e-posta veya şifre.';

  @override
  String get authErrorMustAcceptTerms =>
      'Lütfen Şartlar ve Koşulları kabul edin.';

  @override
  String get authErrorAllFieldsRequired => 'Tüm alanlar zorunludur.';

  @override
  String get authErrorPasswordsDontMatch => 'Şifreler eşleşmiyor.';

  @override
  String get authErrorPasswordTooShort => 'Şifre en az 8 karakter olmalıdır.';

  @override
  String get authErrorRegistrationFailed =>
      'Kayıt başarısız oldu. Bu e-posta zaten kullanımda olabilir.';

  @override
  String get authTabSignIn => 'Giriş Yap';

  @override
  String get authTabCreateAccount => 'Hesap Oluştur';

  @override
  String get authAgreementPrefix => 'Koda\'yı kullanarak ';

  @override
  String get authTermsLink => 'Şartlar ve Koşulları';

  @override
  String get authAgreementMiddle => ' ile ';

  @override
  String get authPrivacyLink => 'Gizlilik Politikasını';

  @override
  String get authAgreementSuffix => ' kabul etmiş olursunuz.';

  @override
  String get authEmailHint => 'E-posta adresi';

  @override
  String get authPasswordHint => 'Şifre';

  @override
  String get authForgotPassword => 'Şifrenizi mi unuttunuz?';

  @override
  String get authSignInButton => 'Giriş Yap';

  @override
  String get authUsernameHint => 'Kullanıcı adı';

  @override
  String get authConfirmPasswordHint => 'Şifreyi onayla';

  @override
  String get authAccessCodeHint => 'Erişim kodu (varsa)';

  @override
  String get authAgreeToTerms =>
      'Şartlar ve Koşulları ve Gizlilik Politikasını kabul ediyorum';

  @override
  String get authCreateAccountButton => 'Hesap Oluştur';

  @override
  String get dmSafetyNumberChangedWarning =>
      'Bu görüşmenin güvenlik numarası değişti -- göndermeden önce doğrulayın.';

  @override
  String get dmMessageNotSent => 'Mesaj gönderilmedi.';

  @override
  String dmEncryptMessageError(String error) {
    return 'Mesaj şifrelenemedi: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'Ek yükleme başarısız oldu.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'Ek şifrelenemedi: $error';
  }

  @override
  String get dmReportMessage => 'Mesajı Bildir';

  @override
  String get dmReportSubmitted => 'Bildirim gönderildi.';

  @override
  String get dmTitle => 'Mesajlar';

  @override
  String get dmNewMessage => 'Yeni Mesaj';

  @override
  String get dmNoConversationsYet => 'Henüz görüşme yok';

  @override
  String get dmSelectConversation => 'Bir görüşme seçin';

  @override
  String get dmVerifySafetyNumberTooltip => 'Güvenlik Numarasını Doğrula';

  @override
  String get dmSeenLabel => 'Görüldü';

  @override
  String get dmMessageActionsTooltip => 'Mesaj işlemleri';

  @override
  String get dmRemoveAttachmentTooltip => 'Eki kaldır';

  @override
  String get dmAttachFileTooltip => 'Dosya ekle';

  @override
  String get dmMessageHint => 'Mesaj...';

  @override
  String get dmSendMessageTooltip => 'Mesaj gönder';

  @override
  String get dmNoFriendsYet =>
      'Henüz arkadaşınız yok.\nBaşlamak için bir arkadaşlık isteği gönderin.';

  @override
  String get dmUnfriendTooltip => 'Arkadaşlıktan çıkar';

  @override
  String get dmNoPendingRequests => 'Bekleyen arkadaşlık isteği yok.';

  @override
  String get dmIncomingRequestsLabel => 'GELEN';

  @override
  String get dmSentRequestsLabel => 'GÖNDERİLEN';

  @override
  String get dmAcceptTooltip => 'Kabul et';

  @override
  String get dmDeclineTooltip => 'Reddet';

  @override
  String get dmPendingLabel => 'Beklemede';

  @override
  String get dmNewMessageDialogTitle => 'Yeni Mesaj';

  @override
  String get dmEnterUsernameHint => 'Kullanıcı adı girin';

  @override
  String get dmOpenButton => 'Aç';

  @override
  String dmSavedAttachment(String fileName) {
    return '$fileName kaydedildi';
  }

  @override
  String get dmUnknownUser => 'Bilinmiyor';

  @override
  String get dmEndToEndEncryptedTooltip => 'Uçtan uca şifrelenmiş';

  @override
  String get homeContentWarningTitle => 'İçerik Uyarısı';

  @override
  String homeContentWarningBody(String labels) {
    return 'Bu kanal şu nedenle işaretlendi: $labels.\n\nBunu Ayarlar > Güvenlik > İçerik Filtreleri bölümünden değiştirebilirsiniz.';
  }

  @override
  String get homeViewAnyway => 'Yine de Görüntüle';

  @override
  String get homeCouldNotConnectVoice => 'Sese bağlanılamadı.';

  @override
  String get homeVoiceChannelFull => 'Bu ses kanalı dolu.';

  @override
  String get homeCreateServer => 'Sunucu Oluştur';

  @override
  String get homeJoinServer => 'Sunucuya Katıl';

  @override
  String get homeRedeemCode => 'Kodu Kullan';

  @override
  String get homeJoinServerDialogTitle => 'Sunucuya Katıl';

  @override
  String get homeEnterInviteCode => 'Bir davet kodu veya URL girin:';

  @override
  String get homeInviteCodeHint => 'örn. XK9MP2';

  @override
  String get homeJoined => 'Katıldınız!';

  @override
  String get homeInvalidInvite => 'Geçersiz veya süresi dolmuş davet kodu.';

  @override
  String get homeJoinButton => 'Katıl';

  @override
  String get homeRedeemCodeDialogTitle => 'Kodu Kullan';

  @override
  String get homeEnterBackerCode => 'Destekçi veya ödül kodunuzu girin:';

  @override
  String get homeRewardCodeHint => 'Ödül kodu';

  @override
  String get homeCodeRedeemed => 'Kod kullanıldı! Ödülleriniz uygulandı.';

  @override
  String get homeInvalidRedeemCode =>
      'Geçersiz, süresi dolmuş veya zaten kullanılmış kod.';

  @override
  String get homeRedeemButton => 'Kullan';

  @override
  String get homeAreFriends => 'Arkadaşsınız';

  @override
  String get homeAddFriend => 'Arkadaş Ekle';

  @override
  String homeFriendRequestSent(String username) {
    return '$username kullanıcısına arkadaşlık isteği gönderildi!';
  }

  @override
  String get homeMessageButton => 'Mesaj';

  @override
  String get homeSendTip => 'Bahşiş Gönder';

  @override
  String get homeSwitchToServer => 'Sunucuya Geç';

  @override
  String get homeInvitePeople => 'Kişi Davet Et';

  @override
  String get homeServerSettingsMenuItem => 'Sunucu Ayarları';

  @override
  String get homeLeaveServerMenuItem => 'Sunucudan Ayrıl';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return '$serverName sunucusundan ayrılınsın mı? Bir davetle tekrar katılabilirsiniz.';
  }

  @override
  String get homeLeaveButton => 'Ayrıl';

  @override
  String get homeCreateAServer => 'Bir sunucu oluştur';

  @override
  String get homeServerNameHint => 'Sunucu adı';

  @override
  String get homeDescribeToVisp => 'Bunun yerine Visp\'e anlat';

  @override
  String get homeMarkAsRead => 'Okundu Olarak İşaretle';

  @override
  String get homeEditChannel => 'Kanalı Düzenle';

  @override
  String get homeDeleteChannel => 'Kanalı Sil';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return '#$channelName silinsin mi? Bu geri alınamaz.';
  }

  @override
  String get homeDeleteButton => 'Sil';

  @override
  String get homeCreateChannelHere => 'Buraya Kanal Oluştur';

  @override
  String get homeEditCategory => 'Kategoriyi Düzenle';

  @override
  String get homeDeleteCategory => 'Kategoriyi Sil';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return '\"$categoryName\" silinsin mi? İçindeki kanallar kategorisiz kalacak.';
  }

  @override
  String get homeReplyAction => 'Yanıtla';

  @override
  String get homeCreateThreadAction => 'Konu Oluştur';

  @override
  String get homeEditMessageAction => 'Mesajı Düzenle';

  @override
  String get homeDeleteMessageAction => 'Mesajı Sil';

  @override
  String get homePinMessageAction => 'Mesajı Sabitle';

  @override
  String get homeUnpinMessageAction => 'Mesaj Sabitlemesini Kaldır';

  @override
  String get homeReportMessageAction => 'Mesajı Bildir';

  @override
  String get homeReportSubmitted => 'Bildirim gönderildi.';

  @override
  String get messageActionForward => 'İlet';

  @override
  String messageForwardedFromLabel(String name) {
    return '$name tarafından iletildi';
  }

  @override
  String get forwardDestinationPickerTitle => 'Mesajı ilet';

  @override
  String get forwardDestinationPickerChannelsTab => 'Kanallar';

  @override
  String get forwardDestinationPickerDmsTab => 'Doğrudan Mesajlar';

  @override
  String get forwardDestinationPickerNoServers =>
      'Henüz hiçbir sunucuda değilsin.';

  @override
  String get forwardDestinationPickerNoChannels =>
      'Bu sunucuda metin kanalı yok.';

  @override
  String get forwardDestinationPickerNoConversations => 'Henüz konuşma yok.';

  @override
  String get forwardSuccessToast => 'Mesaj iletildi.';

  @override
  String get forwardFailedToast => 'Mesaj iletilemedi -- tekrar deneyin.';

  @override
  String get homeAddReactionTitle => 'Tepki Ekle';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count konu',
      one: '$count konu',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'Kategori seçenekleri';

  @override
  String get homeChannelOptionsTooltip => 'Kanal seçenekleri';

  @override
  String get homeOpenVoiceChatTooltip => 'Sohbeti aç';

  @override
  String get homeMarketplaceLabel => 'Pazar Yeri';

  @override
  String get homeSelectChannelPrompt => 'Bir kanal seçin';

  @override
  String get homeSearchTooltip => 'Ara';

  @override
  String get homePinnedMessagesTooltip => 'Sabitlenmiş Mesajlar';

  @override
  String get homeWaitingForKey => 'Şifreleme anahtarının gelmesi bekleniyor...';

  @override
  String get homeUnableToDecrypt => 'Bu mesajın şifresi çözülemiyor.';

  @override
  String get homeMessageActionsTooltip => 'Mesaj işlemleri';

  @override
  String get homeCancelReplyTooltip => 'Yanıtı iptal et';

  @override
  String get homeRemoveAttachmentTooltip => 'Eki kaldır';

  @override
  String get homeAttachFileTooltip => 'Dosya ekle';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return '#$channelName kanalına mesaj yaz';
  }

  @override
  String get homeSendMessageTooltip => 'Mesaj gönder';

  @override
  String get homeEditMessageTitle => 'Mesajı Düzenle';

  @override
  String get homeMessageLabel => 'Mesaj';

  @override
  String get homePinnedMessagesTitle => 'Sabitlenmiş Mesajlar';

  @override
  String get homeNoPinnedMessages => 'Sabitlenmiş mesaj yok';

  @override
  String get homeUnpinTooltip => 'Sabitlemeyi kaldır';

  @override
  String get homeCreateThreadTitle => 'Konu Oluştur';

  @override
  String get homeThreadNameHint => 'Konu adı';

  @override
  String homeThreadCreated(String name) {
    return '\"$name\" konusu oluşturuldu!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Oluştur veya Katıl';

  @override
  String get homeKodaMarketplaceTooltip => 'Koda Pazar Yeri';

  @override
  String get homeAdminPanelTooltip => 'Yönetim Paneli';

  @override
  String get homeServerSettingsTooltip => 'Sunucu Ayarları';

  @override
  String get homeSettingsTooltip => 'Ayarlar';

  @override
  String get homeContentWarningBadge => 'İçerik uyarısı';

  @override
  String get homeDirectMessagesTooltip => 'Doğrudan Mesajlar';

  @override
  String homeReplyingTo(String username) {
    return '$username kullanıcısına yanıt veriliyor';
  }

  @override
  String get homeAttachmentFallback => 'Ek';

  @override
  String get homeAttachmentUploadFailed => 'Ek yükleme başarısız oldu.';

  @override
  String homeSavedAttachment(String fileName) {
    return '$fileName kaydedildi';
  }

  @override
  String serverConnectError(String service) {
    return '$service bağlantısı başlatılamadı.';
  }

  @override
  String get serverDisconnectPrintfulTitle =>
      'Printful bağlantısı kesilsin mi?';

  @override
  String get serverDisconnectPrintfulBody =>
      'Bu sunucu, yeniden bağlanana kadar ürün siparişlerini karşılayamayacak.';

  @override
  String get serverDisconnectTiltifyTitle => 'Tiltify bağlantısı kesilsin mi?';

  @override
  String get serverDisconnectTiltifyBody =>
      'Bu sunucu, yeniden bağlanana kadar hayır kampanyasının ilerlemesini göstermeyi durduracak.';

  @override
  String get serverNewRoleTitle => 'Yeni Rol';

  @override
  String get serverEditRoleTitle => 'Rolü Düzenle';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Renk $hex';
  }

  @override
  String get permViewChannels => 'Kanalları Görüntüle';

  @override
  String get permSendMessages => 'Mesaj Gönder';

  @override
  String get permConnectVoice => 'Sese Bağlan';

  @override
  String get permManageServer => 'Sunucuyu Yönet';

  @override
  String get permManageChannels => 'Kanalları Yönet';

  @override
  String get permManageRoles => 'Rolleri Yönet';

  @override
  String get permManageMessages => 'Mesajları Yönet';

  @override
  String get permKickMembers => 'Üyeleri At';

  @override
  String get permBanMembers => 'Üyeleri Yasakla';

  @override
  String get permMuteMembers => 'Üyeleri Sustur';

  @override
  String get permMentionEveryone => '@everyone Etiketle';

  @override
  String get permManageMarketplace => 'Pazar Yerini Yönet';

  @override
  String get permAnnounceLive => 'Canlı Yayına Geçince Duyur';

  @override
  String get permMoveMembers => 'Üyeleri Taşı (Sesli)';

  @override
  String get serverRoleNameHint => 'Rol adı';

  @override
  String get serverColorLabel => 'Renk';

  @override
  String get serverPermissionsLabel => 'İzinler';

  @override
  String get serverSelfAssignableTitle => 'Kendi kendine atanabilir';

  @override
  String get serverSelfAssignableSubtitle =>
      'Üyeler bu rolü kendilerine atayabilir';

  @override
  String get serverDefaultRoleUndeletable => 'Varsayılan rol silinemez.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return '\"$roleName\" rolü silinsin mi?';
  }

  @override
  String get serverCouldNotDeleteRole => 'O rol silinemedi.';

  @override
  String get serverMemberFallback => 'Üye';

  @override
  String get serverNoRolesYet => 'Henüz rol yok.';

  @override
  String get serverRefreshStatus =>
      'Tarayıcınızda zaten bağlandınız mı? Durumu yenile';

  @override
  String get serverPrintfulConnected => 'Printful Bağlı';

  @override
  String get serverPrintfulNotConnected => 'Printful Bağlı Değil';

  @override
  String get serverPrintfulDescription =>
      'Koda üzerinden verilen ürün siparişlerini karşılamak için bu sunucunun Printful hesabını bağlayın. Her sunucu kendi mağazasını bağlar.';

  @override
  String get serverConnecting => 'Bağlanıyor...';

  @override
  String get serverConnectPrintful => 'Printful\'ı Bağla';

  @override
  String get serverTiltifyConnected => 'Tiltify Bağlı';

  @override
  String get serverTiltifyNotConnected => 'Tiltify Bağlı Değil';

  @override
  String get serverTiltifyDescription =>
      'Bir hayır kampanyasının canlı ilerlemesini tüm üyelere göstermek için bu sunucunun Tiltify hesabını bağlayın. Yalnızca okunur -- Koda, Tiltify tarafında hiçbir şey paylaşmaz veya değiştirmez.';

  @override
  String get serverConnectTiltify => 'Tiltify\'ı Bağla';

  @override
  String get serverNoTiltifyCampaigns =>
      'Bu Tiltify hesabında kampanya bulunamadı.';

  @override
  String get serverPickCampaign => 'Görüntülenecek kampanyayı seçin';

  @override
  String get serverUntitledCampaign => 'Adsız kampanya';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '$goal hedefinin $currency $raised kadarı toplandı';
  }

  @override
  String get serverViewCampaign => 'Kampanyayı görüntüle';

  @override
  String get serverRefreshButton => 'Yenile';

  @override
  String get serverUploadButton => 'Yükle';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '$used / $limit slot kullanıldı -- boost seviyesi $level';
  }

  @override
  String get serverNoCustomEmoji => 'Henüz özel emoji yok.';

  @override
  String get serverDeleteEmojiTooltip => 'Emojiyi sil';

  @override
  String get serverUploadEmojiTitle => 'Emoji Yükle';

  @override
  String get serverEmojiNameHint => 'ad (harfler, rakamlar, _)';

  @override
  String get serverChooseImage => 'Görsel Seç';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Mevcut boost seviyesi: $level';
  }

  @override
  String get serverBackgroundTitle => 'Sunucu Arka Planı';

  @override
  String get serverBackgroundDescription =>
      'Bu sunucudaki herkese kanal görünümünün arkasında gösterilen özel bir arka plan.';

  @override
  String get serverBackgroundLockedHint =>
      'Özel bir arka planın kilidini açmak için boost seviye 4\'e ulaşın.';

  @override
  String get serverIconBorderTitle => 'Sunucu Simgesi Çerçevesi';

  @override
  String get serverIconBorderDescription =>
      'Her üyenin sunucu listesinde bu sunucunun simgesi etrafında bir vurgu çerçevesi.';

  @override
  String get serverIconBorderLockedHint =>
      'Özel bir simge çerçevesinin kilidini açmak için boost seviye 5\'e ulaşın.';

  @override
  String get serverBoostFromBank =>
      'Seviyesini yükseltmek için bu sunucuyu Pazar Yeri\'ndeki Sunucu Bankası\'ndan güçlendirin.';

  @override
  String get serverMarketplaceListingLabel => 'PAZAR YERİ LİSTELEMESİ';

  @override
  String get serverListInMarketplace => 'Koda Pazar Yeri\'nde Listele';

  @override
  String get serverListInMarketplaceDescription =>
      'Bu sunucunun mağazasını Koda Marketplace\'te listeler ve haftalık öne çıkan ürün rotasyonuna girme şansı tanır. Bu, katılınacak sunucuları bulmakla değil alışverişle ilgilidir -- genel sunucu aramasını etkilemez.';

  @override
  String get serverSocialLinkLabel =>
      'Sosyal / Davet Bağlantısı (isteğe bağlı)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Bağlantıyı Kaydet';

  @override
  String get serverPricingLabel => 'FİYATLANDIRMA';

  @override
  String get serverPrimaryCurrencyLabel => 'Birincil Para Birimi';

  @override
  String get serverPrimaryCurrencyDescription =>
      'Sunucu Aboneliği katmanlarına ve bu sunucu için belirlediğiniz Dijital Ürün fiyatlarına uygulanır.';

  @override
  String get serverPrimaryLanguageLabel => 'Birincil Dil';

  @override
  String get serverPrimaryLanguageDescription =>
      'Üyelerin farklı bir dilde paylaştığı mesajlar, bu ayarla karşılaştırılarak küçük bir dil rozeti alır.';

  @override
  String get serverMarketplaceLinkSaved => 'Pazar yeri bağlantısı kaydedildi.';

  @override
  String get serverIconUpdated => 'Sunucu simgesi güncellendi!';

  @override
  String get serverTemplateImported => 'Şablon içe aktarıldı!';

  @override
  String get serverImportFromDiscord => 'Discord\'dan İçe Aktar';

  @override
  String get serverVispPlanLive => 'Visp\'in planı hazır!';

  @override
  String get serverAskVisp => 'Visp\'e Sor';

  @override
  String get serverAddCategoryButton => 'Kategori Ekle';

  @override
  String get serverAddChannelHereTooltip => 'Buraya kanal ekle';

  @override
  String get serverRename => 'Yeniden Adlandır';

  @override
  String get serverUncategorized => 'KATEGORİSİZ';

  @override
  String get serverAddChannel => 'Kanal Ekle';

  @override
  String get serverEditRulesContent => 'Kuralların İçeriğini Düzenle';

  @override
  String get serverRulesContentHint => 'Sunucu kurallarınızı buraya girin...';

  @override
  String get serverRulesUpdated => 'Kurallar güncellendi!';

  @override
  String get serverAddRole => 'Rol Ekle';

  @override
  String get serverDefaultRoleLabel => 'Varsayılan rol';

  @override
  String get serverManageRolesTooltip => 'Rolleri Yönet';

  @override
  String get serverMutedLabel => 'Susturuldu';

  @override
  String get serverExpandedLabel => 'genişletildi';

  @override
  String get serverCollapsedLabel => 'daraltıldı';

  @override
  String get serverUnmute => 'Susturmayı Kaldır';

  @override
  String get serverMute => 'Sustur';

  @override
  String get serverKick => 'At';

  @override
  String get serverBan => 'Yasakla';

  @override
  String serverBannedUsersLabel(int count) {
    return 'YASAKLI KULLANICILAR — $count';
  }

  @override
  String get serverNoBannedUsers => 'Yasaklı kullanıcı yok.';

  @override
  String get serverUnban => 'Yasağı Kaldır';

  @override
  String get serverMemberFallbackGeneric => 'bu üye';

  @override
  String serverBanConfirm(String username, String serverName) {
    return '$username, $serverName sunucusundan yasaklansın mı? Yasağı kaldırılmadan tekrar katılamaz.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return '$username, $serverName sunucusundan atılsın mı? Bir davetle tekrar katılabilir.';
  }

  @override
  String get serverMuteDuration60Sec => '60 saniye';

  @override
  String get serverMuteDuration5Min => '5 dakika';

  @override
  String get serverMuteDuration10Min => '10 dakika';

  @override
  String get serverMuteDuration1Hour => '1 saat';

  @override
  String get serverMuteDuration1Day => '1 gün';

  @override
  String get serverMuteDuration1Week => '1 hafta';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return '$username için $action işlemi gerçekleştirilemedi.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return '$username kullanıcısını sustur';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return '$username susturulamadı.';
  }

  @override
  String get serverUnlockInvites => 'Davetlerin Kilidini Aç';

  @override
  String get serverInvitesUnlocked => 'Davetlerin kilidi açıldı.';

  @override
  String get serverAuditLogDescription =>
      '1. Kademe moderasyon etkinliği -- atmalar, yasaklamalar, susturmalar ve otomatik akın/baskın koruması. Yalnızca meta veri; asla mesaj içeriği değil.';

  @override
  String get serverSystemActor => 'Sistem';

  @override
  String get serverActionKicked => 'attı';

  @override
  String get serverActionBanned => 'yasakladı';

  @override
  String get serverActionUnbanned => 'yasağını kaldırdı';

  @override
  String get serverActionMuted => 'susturdu';

  @override
  String get serverActionUnmuted => 'susturmasını kaldırdı';

  @override
  String get serverActionFloodDetected => 'akın nedeniyle otomatik susturuldu';

  @override
  String get serverActionRaidLockdownEnabled =>
      'davetleri kilitledi (baskın koruması)';

  @override
  String get serverActionRaidLockdownDisabled => 'davetlerin kilidini açtı';

  @override
  String get serverActionMoved => 'taşıdı';

  @override
  String get serverUnknownAction => 'bilinmeyen işlem';

  @override
  String get serverNoModerationActivity => 'Henüz moderasyon etkinliği yok.';

  @override
  String get serverReportsDescription =>
      'Bu sunucunun üyeleri tarafından bildirilen mesajlar -- bildiren kişinin şifresi zaten çözülmüş kendi kopyası, bildirim sırasında ifşa edilir.';

  @override
  String get serverNoPendingReports => 'Bekleyen bildirim yok.';

  @override
  String get serverReportReasonOther => 'diğer';

  @override
  String get serverReportStatusActioned => 'İşlem Yapıldı';

  @override
  String get serverReportStatusDismissed => 'Reddedildi';

  @override
  String get serverResolvedLabel => 'ÇÖZÜLDÜ';

  @override
  String serverReportedBy(String reporter, String target) {
    return '$reporter tarafından bildirildi -- $target tarafından gönderildi';
  }

  @override
  String serverReportNote(String note) {
    return 'Not: $note';
  }

  @override
  String get serverDismissButton => 'Reddet';

  @override
  String get serverMarkActioned => 'İşlem Yapıldı Olarak İşaretle';

  @override
  String get serverCreateInvite => 'Davet Oluştur';

  @override
  String get serverInviteCreatedTitle => 'Davet Oluşturuldu';

  @override
  String get serverNoActiveInvites => 'Aktif davet yok';

  @override
  String serverUsesLabel(String uses) {
    return 'Kullanım: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Daveti sil';

  @override
  String get serverChangeIconLabel => 'Sunucu simgesini değiştir';

  @override
  String get serverFallbackName => 'Sunucu';

  @override
  String serverSettingsTitle(String serverName) {
    return '$serverName Ayarları';
  }

  @override
  String get serverTabChannels => 'Kanallar';

  @override
  String get serverTabRoles => 'Roller';

  @override
  String get serverTabMembers => 'Üyeler';

  @override
  String get serverTabInvites => 'Davetler';

  @override
  String get serverTabMerch => 'Ürünler';

  @override
  String get serverTabEmoji => 'Emoji';

  @override
  String get serverTabCustomize => 'Özelleştir';

  @override
  String get serverTabAuditLog => 'Denetim Günlüğü';

  @override
  String get serverTabReports => 'Bildirimler';

  @override
  String get serverTabThresholdMod => 'Eşik Moderasyonu';

  @override
  String get serverTabCharity => 'Hayır İşleri';

  @override
  String get homeCustomEmojiFallback => 'özel emoji';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tepki',
      one: '$count tepki',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted =>
      ', tepki verdiniz, kaldırmak için etkinleştirin';

  @override
  String get homeReactionActivateToAdd => ', eklemek için etkinleştirin';

  @override
  String get homeAddReactionLabel => 'Tepki ekle';

  @override
  String homeViewProfile(String username) {
    return '$username kullanıcısının profilini görüntüle';
  }

  @override
  String get homeMoveToVoiceChannel => 'Sesli kanala taşı…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Bir sesli kanal seçin';

  @override
  String get homeNoOtherVoiceChannels => 'Başka sesli kanal yok';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username artık $channel kanalında';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return '$username taşınamadı';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'Artık $channel kanalındasınız';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'Konuşmak için $channel kanalına katılın';
  }

  @override
  String get adminPanelTitle => 'Yönetim Paneli';

  @override
  String get adminTabBackerCodes => 'Destekçi Kodları';

  @override
  String get adminTabUsers => 'Kullanıcılar';

  @override
  String get adminTabDmReports => 'DM Bildirimleri';

  @override
  String get adminTabSpamFlags => 'Spam İşaretleri';

  @override
  String get adminTabWiki => 'Wiki';

  @override
  String get adminTabBoosts => 'Boostlar';

  @override
  String get adminCreateBackerCodeTitle => 'Destekçi Kodu Oluştur';

  @override
  String get adminCodeHint => 'Kod (otomatik oluşturmak için boş bırakın)';

  @override
  String get adminNoteHint => 'Not (örn. \"Kickstarter Tier 2\")';

  @override
  String get adminFlagsJsonHint =>
      'JSON olarak işaretler, örn. \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint =>
      'Maksimum kullanım (sınırsız için boş bırakın)';

  @override
  String get adminCodeCreatedTitle => 'Kod Oluşturuldu';

  @override
  String get adminCodeLabel => 'Kod:';

  @override
  String get adminCopyCodeTooltip => 'Kodu kopyala';

  @override
  String adminFlagsValue(String flags) {
    return 'İşaretler: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Destekçi ve Ödül Kodları';

  @override
  String get adminNewCodeButton => 'Yeni Kod';

  @override
  String get adminNoCodesYet => 'Henüz kod yok';

  @override
  String get adminRewardsHeader => 'Ödüller';

  @override
  String get adminRewardAlphaBetaAccess =>
      'Alfa/Beta Erişimi + Alpha Spark Rozeti';

  @override
  String get adminRewardLifetimePulse =>
      'Ömür Boyu Pulse Durumu + Founder Rozeti + Geliştirilmiş Bit Hızı';

  @override
  String get adminRewardMonthlyBoostTokenOne =>
      'Aylık Sunucu Güçlendirme Jetonu (Geliştirilmiş Ses/Görüntü)';

  @override
  String get adminRewardAnimatedFrameBundle =>
      'Animasyonlu Profil Çerçevesi + Founders Hall + Aylık 2 Sunucu Jetonu';

  @override
  String get adminRewardTitanGlow => 'Kalıcı \"Titan\" Kullanıcı Adı Parıltısı';

  @override
  String get adminRewardAnimatedFrame => 'Animasyonlu çerçeve';

  @override
  String get adminRewardFoundersHall => 'Founders Hall';

  @override
  String adminRewardMonthlyBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ayda $count güçlendirme jetonu',
      one: 'Ayda 1 güçlendirme jetonu',
    );
    return '$_temp0';
  }

  @override
  String get adminRewardsNone => 'Ödül yok';

  @override
  String get adminRegistrationOpenLabel => 'Kayıt herkese açık';

  @override
  String get adminRegistrationInviteOnlyLabel =>
      'Kayıt yalnızca davetle (destekçi kodu gerekli)';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses kullanım';
  }

  @override
  String get adminSearchUsersHint => 'Kullanıcı adına göre ara...';

  @override
  String get adminSearchUsersPrompt => 'Yukarıda bir kullanıcı arayın';

  @override
  String get adminNoDmReports => 'DM bildirimi yok.';

  @override
  String get adminResolvedLabel => 'ÇÖZÜLDÜ';

  @override
  String get adminReasonOther => 'diğer';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Bildiren: $reporterId\\nİfşa edilen gönderen: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Not: $note';
  }

  @override
  String get adminDismissButton => 'Reddet';

  @override
  String get adminMarkActionedButton => 'İşlem Yapıldı Olarak İşaretle';

  @override
  String get adminStatusActioned => 'İşlem Yapıldı';

  @override
  String get adminStatusDismissed => 'Reddedildi';

  @override
  String get adminNoSpamFlags => 'Spam işareti yok.';

  @override
  String get adminFlagMassDmSpam => 'Toplu DM spamı';

  @override
  String get adminFlagRaidLockdown => 'Baskın kilidi';

  @override
  String get adminFlagBotBehavior => 'Bot benzeri davranış';

  @override
  String get adminFlagChannelFlooding => 'Kanal akını';

  @override
  String get adminAutoEscalatedBadge => 'OTOMATİK YÜKSELTİLDİ';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Güven: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'Kullanıcı: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Sunucu: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$totalJoiners katılımcıdan $mutedCount tanesi hâlâ susturulmuş';
  }

  @override
  String get adminNoJoinersMuted => 'Şu anda susturulmuş katılımcı yok';

  @override
  String adminRestrictedUntil(String until) {
    return 'Şu anda $until tarihine kadar kısıtlı';
  }

  @override
  String get adminNotCurrentlyRestricted => 'Şu anda kısıtlı değil';

  @override
  String get adminDismissUndoButton => 'Reddet ve Geri Al';

  @override
  String get adminConfirmRestrictButton => 'Onayla ve Kısıtla';

  @override
  String get adminDeleteArticleTitle => 'Makale silinsin mi?';

  @override
  String adminDeleteArticleBody(String title) {
    return '\"$title\" Visp\'in bilgi tabanından kaldırılacak.';
  }

  @override
  String get adminNewArticleTitle => 'Yeni Makale';

  @override
  String get adminEditArticleTitle => 'Makaleyi Düzenle';

  @override
  String get adminArticleTitleHint => 'Başlık';

  @override
  String get adminArticleContentHint => 'Makale içeriği (markdown)';

  @override
  String get adminWikiArticlesHeader => 'Wiki Makaleleri';

  @override
  String get adminNoArticlesYet => 'Henüz makale yok';

  @override
  String get adminEditArticleTooltip => 'Makaleyi düzenle';

  @override
  String get adminDeleteArticleTooltip => 'Makaleyi sil';

  @override
  String get adminSearchServersHint => 'Sunucuları ada göre ara...';

  @override
  String get adminSearchServersPrompt => 'Yukarıda bir sunucu arayın';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return '$serverName sunucusuna boost ver';
  }

  @override
  String get adminNumBoostsHint => 'Boost sayısı';

  @override
  String get adminGrantButton => 'Ver';

  @override
  String get adminPositiveNumberError => 'Pozitif bir tam sayı girin.';

  @override
  String get adminGrantBoostsFailed => 'Boost verilemedi.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$serverName sunucusuna $count boost verildi -- artık seviye $level ($activeCount aktif).',
      one:
          '$serverName sunucusuna $count boost verildi -- artık seviye $level ($activeCount aktif).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count üye';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Boost Ver';

  @override
  String get parentalDashboardTitle => 'Aile';

  @override
  String get parentalDashboardCreateChildTitle => 'Çocuk Hesabı Oluştur';

  @override
  String get parentalDashboardUsernameHint => 'Kullanıcı adı';

  @override
  String get parentalDashboardEmailHint => 'E-posta';

  @override
  String get parentalDashboardPasswordHint => 'Şifre';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'Bu, tamamen denetimli bir hesap oluşturur: etiketlenmiş kanallar engellenir ve izin verilen saatleri ayarlayabilir, arkadaşlarını ve sunucularını görebilirsiniz (ama okuyamazsınız).';

  @override
  String get parentalDashboardValidationError =>
      'Kullanıcı adı, e-posta ve en az 8 karakterlik bir şifre gereklidir.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'Çocuk hesabı oluşturulamadı -- kullanıcı adı/e-posta zaten kullanımda olabilir.';

  @override
  String get parentalDashboardCreatingLabel => 'Oluşturuluyor...';

  @override
  String get parentalDashboardNoChildren => 'Henüz bağlı hesap yok.';

  @override
  String get parentalDashboardSupervisedLabel => 'Denetimli hesap';

  @override
  String get parentalDashboardUnknownUser => 'Bilinmiyor';

  @override
  String get childDetailFallbackTitle => 'Çocuk hesabı';

  @override
  String get childDetailTabFriends => 'Arkadaşlar';

  @override
  String get childDetailTabServers => 'Sunucular';

  @override
  String get childDetailTabSchedule => 'Program';

  @override
  String get childDetailTabOverride => 'Geçersiz Kılma';

  @override
  String get childDetailNoFriends => 'Arkadaş yok.';

  @override
  String get childDetailUnknownUser => 'Bilinmiyor';

  @override
  String get childDetailRemoveFriendTooltip => 'Arkadaşı kaldır';

  @override
  String get childDetailNoServers => 'Herhangi bir sunucuda değil.';

  @override
  String childDetailMemberCount(int count) {
    return '$count üye';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Sunucudan kaldır';

  @override
  String get childDetailRestrictAccessTitle =>
      'Erişimi belirli saatlerle kısıtla';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Kapalı, her zaman kısıtsız erişim anlamına gelir';

  @override
  String get childDetailTimezoneLabel => 'Saat dilimi';

  @override
  String get childDetailMonday => 'Pazartesi';

  @override
  String get childDetailTuesday => 'Salı';

  @override
  String get childDetailWednesday => 'Çarşamba';

  @override
  String get childDetailThursday => 'Perşembe';

  @override
  String get childDetailFriday => 'Cuma';

  @override
  String get childDetailSaturday => 'Cumartesi';

  @override
  String get childDetailSunday => 'Pazar';

  @override
  String get childDetailNoAccessLabel => 'Erişim yok';

  @override
  String get childDetailToLabel => 'ile';

  @override
  String get childDetailSavingLabel => 'Kaydediliyor...';

  @override
  String get childDetailSaveScheduleButton => 'Programı Kaydet';

  @override
  String get childDetailScheduleSaved => 'Program kaydedildi.';

  @override
  String get childDetailOverrideExplanation =>
      'Normal programın dışında geçici erişim ver -- haftalık programı değiştirmeden tek seferlik bir istisna için kullanışlıdır.';

  @override
  String get childDetailReasonHint => 'Neden (isteğe bağlı)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes dk';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours sa';
  }

  @override
  String get childDetailRevokeOverrideButton =>
      'Aktif Geçersiz Kılmayı İptal Et';

  @override
  String get childDetailAccessGranted => 'Geçici erişim verildi.';

  @override
  String get childDetailOverrideRevoked => 'Geçersiz kılma iptal edildi.';

  @override
  String get digitalGoodsTitle => 'Dijital Ürünler';

  @override
  String get digitalGoodsMyProductsTitle => 'Ürünlerim';

  @override
  String get digitalGoodsManageProductsTooltip =>
      'Bu sunucunun ürünlerini yönet';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Göz Atma\'ya geç';

  @override
  String get digitalGoodsCreateProductTooltip => 'Ürün oluştur';

  @override
  String get digitalGoodsBrowseTab => 'Göz At';

  @override
  String get digitalGoodsMyListingsTab => 'Listelerim';

  @override
  String get digitalGoodsMyPurchasesTab => 'Satın Aldıklarım';

  @override
  String get digitalGoodsNoProductsYet => 'Henüz ürün yok';

  @override
  String get digitalGoodsNoProductsAvailable => 'Kullanılabilir ürün yok';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Satışa başlamak için ilk ürününüzü oluşturun';

  @override
  String get digitalGoodsCheckBackLater =>
      'Dijital ürünler için daha sonra tekrar bakın';

  @override
  String get digitalGoodsCreateProductButton => 'Ürün Oluştur';

  @override
  String get digitalGoodsLicenseKeyBadge => 'Lisans Anahtarı';

  @override
  String get digitalGoodsFileBadge => 'Dosya';

  @override
  String get digitalGoodsAllServersBadge => 'Tüm Sunucular';

  @override
  String get digitalGoodsFreeForYou => 'Sizin için ücretsiz';

  @override
  String get digitalGoodsFreeLabel => 'Ücretsiz';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count satıldı';
  }

  @override
  String get digitalGoodsKeysButton => 'Anahtarlar';

  @override
  String get digitalGoodsGetForFree => 'Ücretsiz Al';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return '$price karşılığında satın al';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'Henüz satın alım yok';

  @override
  String get digitalGoodsUnknownProduct => 'Bilinmeyen Ürün';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return '$date tarihinde satın alındı';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Anahtarı kopyala';

  @override
  String get digitalGoodsLicenseKeyCopied => 'Lisans anahtarı kopyalandı!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return '$date tarihinde sona eriyor';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'Lisans Anahtarınız';

  @override
  String get digitalGoodsCopyKeyButton => 'Anahtarı Kopyala';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'Ödeme başlatılamadı -- bu içerik üreticisi henüz Stripe\'ı bağlamamış olabilir.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'Satın alma tamamlandı! Satın Aldıklarım bölümünde bulabilirsiniz.';

  @override
  String get digitalGoodsPurchasePending =>
      'Hâlâ o ödeme bekleniyor -- tamamlandığında Satın Aldıklarım\'da görünecek.';

  @override
  String get digitalGoodsCreateProductTitle => 'Ürün Oluştur';

  @override
  String get digitalGoodsEditProductTitle => 'Ürünü Düzenle';

  @override
  String get digitalGoodsProductTitleHint => 'Ürün başlığı';

  @override
  String get digitalGoodsDescriptionHint => 'Açıklama (isteğe bağlı)';

  @override
  String get digitalGoodsPriceHint =>
      'USD cinsinden fiyat (ücretsiz için boş bırakın)';

  @override
  String get digitalGoodsProductTypeLabel => 'Ürün türü';

  @override
  String get digitalGoodsFileDownloadOption => 'Dosya indirme';

  @override
  String get digitalGoodsLicenseKeyOption => 'Lisans anahtarı';

  @override
  String get digitalGoodsAvailabilityLabel => 'Kullanılabilirlik';

  @override
  String get digitalGoodsThisServerOnlyOption => 'Yalnızca bu sunucu';

  @override
  String get digitalGoodsAllKodaServersOption => 'Tüm Koda sunucuları';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'Oluşturduktan sonra, lisans anahtarlarınızı yüklemek için \"Anahtarlar\" düğmesini kullanın.';

  @override
  String get digitalGoodsProductFileLabel => 'Ürün dosyası';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName (${sizeMb}MB)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Dosyayı kaldır';

  @override
  String get digitalGoodsUploadingLabel => 'Yükleniyor...';

  @override
  String get digitalGoodsChooseFileButton => 'Dosya Seç';

  @override
  String get digitalGoodsReplaceFileButton => 'Dosyayı Değiştir';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Kaydetmeden önce bu ürün için bir dosya seçin.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'Lisans Anahtarlarını Yükle';

  @override
  String get digitalGoodsPasteKeysHint => 'Her satıra bir anahtar yapıştırın:';

  @override
  String get digitalGoodsKeyExampleHint =>
      'KEY-XXXX-XXXX\\nKEY-YYYY-YYYY\\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Anahtarları Yükle';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'Lisans anahtarları yüklendi!';

  @override
  String get serverSubscriptionManageTitle => 'Abonelikleri Yönet';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return '$serverName Abonelikleri';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Katman ekle';

  @override
  String get serverSubscriptionNoTiersYet => 'Henüz abonelik katmanı yok';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Topluluğunuz için 3 katmana kadar oluşturun';

  @override
  String get serverSubscriptionCreateFirstTierButton => 'İlk Katmanı Oluştur';

  @override
  String get serverSubscriptionShowSubscriberCounts =>
      'Abone sayılarını göster';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/ay';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktif abone',
      one: '$count aktif abone',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned => 'Rol otomatik atanır';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return '%$discount pazar yeri indirimi';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'Bu sunucunun abonelik katmanı yok';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Aktif Abone';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return '$date tarihinde sona eriyor';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk => 'Özel abone rolü';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return 'Pazar yeri alışverişlerinde %$discount indirim';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Yalnızca abonelere özel kanallar';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Şu Anda Abone';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return '$price/ay karşılığında abone ol';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Katman Oluştur';

  @override
  String get serverSubscriptionEditTierTitle => 'Katmanı Düzenle';

  @override
  String get serverSubscriptionTierNameHint =>
      'Katman adı (örn. Hayran, Destekçi, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Açıklama (isteğe bağlı)';

  @override
  String get serverSubscriptionPriceHint => 'Aylık fiyat (USD)';

  @override
  String get serverSubscriptionDiscountLabel => 'Pazar yeri indirimi %';

  @override
  String get serverSubscriptionPositionLabel => 'Konum';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Katman $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Abone olunca rol verir — isteğe bağlı';

  @override
  String get serverSubscriptionRoleFallback => 'rol';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Abone olur olmaz üyeye otomatik olarak verilir ve aboneliği sona erer ermez geri alınır.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Katman oluşturuldu -- üyelerin abone olabilmesi için önce Pazar Yeri → İçerik Üreticisi altından Stripe\'ı bağlayın.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Katmanı Sil';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return '\"$tierName\" silinsin mi? Mevcut aboneler süre bitimine kadar erişimlerini korur.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return '$tierName Katmanına Abone Ol';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel => 'Aylık abonelik';

  @override
  String get serverSubscriptionServerBankEarnsLabel =>
      'Sunucu bankasının kazancı';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points puan';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Ödeme Stripe tarafından güvenli şekilde işlenir';

  @override
  String get serverSubscriptionSubscribeButton => 'Abone Ol';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'Ödeme başlatılamadı -- bu sunucunun sahibi henüz Stripe\'ı bağlamamış olabilir.';

  @override
  String get serverSubscriptionSubscribed => 'Abone oldunuz!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'Hâlâ o ödeme bekleniyor -- tamamlandığında etkinleşecek.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return '$username kullanıcısına bahşiş ver';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Tutarı seçin';

  @override
  String get tipDialogMessageHint => 'Bir mesaj ekle (isteğe bağlı)';

  @override
  String get tipDialogYouPayLabel => 'Ödeyeceğiniz';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username alacak';
  }

  @override
  String get tipDialogSendTipButton => 'Bahşiş Gönder';

  @override
  String get tipDialogFailedToSendTip =>
      'Bahşiş gönderilemedi. İçerik üreticisi Stripe\'a bağlı olmayabilir.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'Ödeme başlatılamadı. Birazdan tekrar deneyin.';

  @override
  String get tipDialogTipSent => 'Bahşiş gönderildi!';

  @override
  String get tipDialogTipPending =>
      'Hâlâ o ödeme bekleniyor -- tamamlandığında işlenecek.';

  @override
  String get tipDialogUnknownUser => 'Bilinmiyor';

  @override
  String get marketplaceTitle => 'Pazar Yeri';

  @override
  String get marketplaceCreatorPayoutsTitle => 'İçerik Üretici Ödemeleri';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Stripe üzerinden doğrudan bahşiş alın';

  @override
  String get marketplaceTabServerBank => 'Sunucu Bankası';

  @override
  String get marketplaceTabDigitalGoods => 'Dijital Ürünler';

  @override
  String get marketplaceTabMerch => 'Ürünler';

  @override
  String get marketplaceTabSubscription => 'Abonelik';

  @override
  String get marketplaceTabRevenue => 'Gelir';

  @override
  String get marketplaceSelectServerSubscription =>
      'Aboneliğini görüntülemek için bir sunucu seçin';

  @override
  String get marketplaceSelectServerBank =>
      'Bankasını görüntülemek için bir sunucu seçin';

  @override
  String get marketplaceSelectServerRevenue =>
      'Gelirini görüntülemek için bir sunucu seçin';

  @override
  String get marketplaceStripeAccountStatus => 'Stripe hesabı';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Kayıt tamamlandı';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'Ödeme kabul ediyor';

  @override
  String get marketplaceConnectStripeButton => 'Stripe Hesabını Bağla';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Stripe Kaydını Tamamla';

  @override
  String get marketplaceRefreshStatusButton => 'Durumu Yenile';

  @override
  String get marketplaceReadyToReceiveTips => 'Bahşiş almaya hazırsınız!';

  @override
  String get marketplaceHowItWorksTitle => 'Nasıl çalışır';

  @override
  String get marketplaceHowItWorksStep1 => 'Stripe hesabınızı bağlayın';

  @override
  String get marketplaceHowItWorksStep2 => 'Kimlik doğrulamasını tamamlayın';

  @override
  String get marketplaceHowItWorksStep3 => 'Bahşişleri doğrudan bankanıza alın';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda %5 işlem ücreti alır. Bu ücret puan olarak sunucunuzun bankasına gider.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Sunucu Bankası\'nı yalnızca sunucu sahibi veya Pazar Yerini Yönet iznine sahip biri görüntüleyebilir.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName güçlendirildi!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit özel emoji yuvası';
  }

  @override
  String get marketplaceServerFallback => 'Sunucu';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance puan';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount etkinlik';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'Puanlar bu sunucudaki bahşiş ve aboneliklerden alınan %5 işlem ücretinden kazanılır. Sunucu yükseltmelerinin kilidini açmak için puan kullanın.';

  @override
  String get marketplaceServerBoostsTitle => 'Sunucu Boostları';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Seviye $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktif boost',
      one: '$count aktif boost',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: 'Seviye $level\'e ulaşmak için $more boost daha gerekiyor',
      one: 'Seviye $level\'e ulaşmak için $more boost daha gerekiyor',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' ve özel bir sunucu arka planının kilidini açar';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' ve özel bir sunucu simge çerçevesinin kilidini açar';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count boost jetonunuz var.',
      one: '$count boost jetonunuz var.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'Boost jetonları Pulse aboneliğinden gelir (ayda 1). Bir tane kazanmak için Abonelikler sekmesinden abone olun.';

  @override
  String get marketplaceBoostingLabel => 'Güçlendiriliyor...';

  @override
  String get marketplaceBoostThisServerButton => 'Bu Sunucuyu Güçlendir';

  @override
  String get marketplaceComingSoonUpgradesTitle =>
      'Yakında — Sunucu yükseltmeleri';

  @override
  String get marketplaceSpendPointsList =>
      'Sunucu bankası puanlarını şunlara harcayın:\n• Özel sunucu alan adı\n• Artırılmış üye limiti\n• Öncelikli destek\n• Özel sunucu rozeti';

  @override
  String get marketplaceSourceTip => 'Bahşişler';

  @override
  String get marketplaceSourceSubscription => 'Koda Abonelikleri';

  @override
  String get marketplaceSourceServerSubscription => 'Sunucu Abonelikleri';

  @override
  String get marketplaceSourceDigitalProduct => 'Dijital Ürünler';

  @override
  String get marketplaceSourceStageTicket => 'Sahne Biletleri';

  @override
  String get marketplaceSourcePrintfulOrder => 'Ürün Siparişleri';

  @override
  String get marketplaceJustNow => 'az önce';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return '$minutes dk önce';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return '$hours sa önce';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return '$days g önce';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Bu sunucunun gelirini yalnızca Pazar Yerini yönetebilen üyeler görüntüleyebilir.';

  @override
  String get marketplaceBalanceLabel => 'Bakiye';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Toplam Kazanç';

  @override
  String get marketplaceLast30DaysTitle => 'Son 30 Gün';

  @override
  String get marketplaceRevenueBySourceTitle => 'Kaynağa Göre Gelir';

  @override
  String get marketplaceNoRevenueYet => 'Henüz gelir yok.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count işlem',
      one: '$count işlem',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'Son İşlemler';

  @override
  String get marketplaceNoTransactionsYet => 'Henüz işlem yok.';

  @override
  String get marketplaceNoActivityYet => 'Henüz etkinlik yok';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Printful\'dan $count ürün senkronize edildi',
      one: 'Printful\'dan $count ürün senkronize edildi',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Printful ile senkronize edilemedi -- Ürünler ayarlarındaki bağlantıyı kontrol edin.';

  @override
  String get printfulMerchSelectServer =>
      'Ürünlerini görüntülemek için bir sunucu seçin';

  @override
  String get printfulMerchManageCatalogTitle => 'Ürün Kataloğunu Yönet';

  @override
  String get printfulMerchTitle => 'Ürünler';

  @override
  String get printfulMerchSyncingLabel => 'Senkronize ediliyor...';

  @override
  String get printfulMerchSyncCatalogButton => 'Kataloğu Senkronize Et';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'Göz Atmaya Geç';

  @override
  String get printfulMerchManageTooltip => 'Bu sunucunun ürünlerini yönet';

  @override
  String get printfulMerchNothingSyncedYet =>
      'Henüz hiçbir şey senkronize edilmedi';

  @override
  String get printfulMerchNoMerchAvailable => 'Henüz ürün yok';

  @override
  String get printfulMerchSyncHint =>
      'Ürün kataloğunuzu almak için Printful mağazanızı senkronize edin';

  @override
  String get printfulMerchCheckBackLater =>
      'Bu sunucunun ürünleri için daha sonra tekrar bakın';

  @override
  String get printfulMerchOutOfStock => 'Stokta yok';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$price\'dan başlayan • $count seçenek',
      one: '$price\'dan başlayan • $count seçenek',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'Görüntüle';

  @override
  String printfulMerchPayoutTo(String username) {
    return 'Ödeme alıcısı: $username';
  }

  @override
  String get printfulMerchPayoutToYou => 'Ödeme alıcısı: siz';

  @override
  String get printfulMerchPayoutChangeButton => 'Değiştir';

  @override
  String get printfulMerchPayoutDialogTitle => 'Ödeme Alıcısı';

  @override
  String get printfulMerchPayoutDialogBody =>
      'Bu ürünün sipariş gelirindeki payını siz yerine başka bir kullanıcıya yönlendirin -- biri satın alabilmeden önce o kişinin kendi Stripe hesabını bağlaması ve katılım sürecini tamamlaması gerekir.';

  @override
  String get printfulMerchPayoutUsernameHint => 'Kullanıcı adı';

  @override
  String get printfulMerchPayoutLookupButton => 'Ara';

  @override
  String get printfulMerchPayoutUserNotFound =>
      'Bu adla bir kullanıcı bulunamadı.';

  @override
  String printfulMerchPayoutResolvedAs(String username) {
    return 'Bulundu: $username';
  }

  @override
  String get printfulMerchPayoutResetButton => 'Bana sıfırla';

  @override
  String get printfulMerchCartTooltip => 'Sepet';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productName sepete eklendi';
  }

  @override
  String get printfulMerchQuantityLabel => 'Adet';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Adedi azalt';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Adedi artır';

  @override
  String get printfulMerchAddToCartButton => 'Sepete Ekle';

  @override
  String get printfulMerchOptionLabel => 'Seçenek';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Stil';

  @override
  String get printfulMerchSizeLabel => 'Beden';

  @override
  String get printfulMerchYourCartTitle => 'Sepetiniz';

  @override
  String get printfulMerchCartEmpty => 'Sepetiniz boş.';

  @override
  String get printfulMerchSubtotalLabel => 'Ara Toplam';

  @override
  String get printfulMerchCheckoutLabel => 'Ödeme';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'Sepetten çıkar';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Önce kargo adresinizi doldurun.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'Bu adres için kargo ücretleri alınamadı.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'Ödeme başlatılamadı. Birazdan tekrar deneyin.';

  @override
  String get printfulMerchOrderPlaced => 'Sipariş verildi!';

  @override
  String get printfulMerchOrderPending =>
      'Ödeme hâlâ bekleniyor -- tamamlanınca sipariş verilecek.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Kargo hızı';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max iş günü';
  }

  @override
  String get printfulMerchGetShippingQuoteButton => 'Kargo Teklifi Al';

  @override
  String get printfulMerchPayButton => 'Öde';

  @override
  String get kodaMarketplaceTitle => 'Koda Pazar Yeri';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Abonelikler';

  @override
  String get kodaMarketplaceTabBoosts => 'Boostlar';

  @override
  String get kodaMarketplaceTabDiscover => 'Keşfet';

  @override
  String get kodaMarketplaceTierFreeName => 'Ücretsiz';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return '$date tarihinde sona eriyor';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks => 'Özel avantajlar için yükseltin';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count boost jetonu mevcut',
      one: '$count boost jetonu mevcut',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Bulunduğunuz herhangi bir sunucuya, o sunucunun Sunucu Bankası sekmesinden jeton hediye edin';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => 'Özel avatar çerçevesi';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Profilde Spark rozeti';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Artırılmış dosya yükleme limiti (50MB)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality => 'Öncelikli ses kalitesi';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark => 'Spark\'taki her şey';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame =>
      'Animasyonlu avatar çerçevesi';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Profilde Pulse rozeti';

  @override
  String get kodaMarketplacePulsePerkFileLimit => '100MB dosya yükleme limiti';

  @override
  String get kodaMarketplacePulsePerkBoostToken => 'Ayda 1 sunucu boost jetonu';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/ay';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Mevcut Plan';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return '$name Al';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return '$name Hediye Et';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return '$tier Hediye Et';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return '$tier Aboneliğine Katıl';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel =>
      'Hediye alıcısının kullanıcı adı:';

  @override
  String get kodaMarketplaceUsernameHint => 'Kullanıcı adı';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Abonelik';

  @override
  String get kodaMarketplaceTotalLabel => 'Toplam';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Ödeme Stripe tarafından güvenli şekilde işlenir';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'Ödemeye Geç';

  @override
  String get kodaMarketplaceUserNotFound => 'Kullanıcı bulunamadı';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'Ödeme başlatılamadı. Birazdan tekrar deneyin.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'Abonelik aktif!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'Ödeme hâlâ bekleniyor -- tamamlanınca etkinleşecek.';

  @override
  String get kodaMarketplaceBoostPurchased => 'Boost satın alındı!';

  @override
  String get kodaMarketplaceBoostPending =>
      'Ödeme hâlâ bekleniyor -- tamamlanınca hazır olacak.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count mevcut';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Boost Satın Al';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'Tek seferlik bir satın alma -- Pulse aboneleri de her yenilemede bir ücretsiz jeton kazanır, bu da düzenli boost yapıyorsanız daha avantajlı kalır.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Boost Satın Al -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Henüz hiçbir sunucu Koda Pazar Yeri\'ne katılmadı. Sunucu sahipleri bunu sunucularının Özelleştirme ayarlarından açabilir.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => 'BU HAFTA ÖNE ÇIKANLAR';

  @override
  String get kodaMarketplaceAllListedServersHeader =>
      'TÜM LİSTELENEN SUNUCULAR';

  @override
  String get kodaMarketplaceFeaturedItemsHeader => 'ÖNE ÇIKAN ÜRÜNLER';

  @override
  String get kodaMarketplaceAllItemsHeader => 'TÜM ÜRÜNLER';

  @override
  String get kodaMarketplaceServerFallback => 'Sunucu';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count üye',
      one: '$count üye',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceVisitStore => 'Mağazayı Ziyaret Et';

  @override
  String get calendarFallbackTitle => 'Takvim';

  @override
  String get calendarAskVispTooltip => 'Visp\'e Sor';

  @override
  String get calendarCreateEventTooltip => 'Etkinlik Oluştur';

  @override
  String get calendarPreviousMonthTooltip => 'Önceki ay';

  @override
  String get calendarNextMonthTooltip => 'Sonraki ay';

  @override
  String get calendarTodayButton => 'Bugün';

  @override
  String get calendarWeekdaySun => 'Paz';

  @override
  String get calendarWeekdayMon => 'Pzt';

  @override
  String get calendarWeekdayTue => 'Sal';

  @override
  String get calendarWeekdayWed => 'Çar';

  @override
  String get calendarWeekdayThu => 'Per';

  @override
  String get calendarWeekdayFri => 'Cum';

  @override
  String get calendarWeekdaySat => 'Cmt';

  @override
  String get calendarTodaySuffix => ', bugün';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count etkinlik',
      one: ', $count etkinlik',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'Bir gün seçin';

  @override
  String get calendarNoEvents => 'Etkinlik yok';

  @override
  String get calendarSubscribeTooltip => 'Abone Ol';

  @override
  String get calendarUnsubscribeTooltip => 'Aboneliği Bırak';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return '$recurrence tekrarlanır';
  }

  @override
  String get calendarTicketOwned => 'Bilet zaten sizde';

  @override
  String calendarTicketPrice(String price) {
    return '$price bilet';
  }

  @override
  String get calendarDeleteEventTitle => 'Etkinliği Sil';

  @override
  String calendarDeleteEventConfirm(String title) {
    return '\"$title\" silinsin mi? Bu işlem geri alınamaz.';
  }

  @override
  String get calendarEditEventTitle => 'Etkinliği Düzenle';

  @override
  String get calendarCreateEventTitle => 'Etkinlik Oluştur';

  @override
  String get calendarEventTitleHint => 'Etkinlik başlığı';

  @override
  String get calendarDescriptionHint => 'Açıklama (isteğe bağlı)';

  @override
  String get calendarLocationHint => 'Konum (isteğe bağlı)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Başlangıç ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Başlangıç tarihi ve saati, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'Bitiş — isteğe bağlı ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'Bitiş tarihi ve saati, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'ayarlanmadı';

  @override
  String get calendarTapToSetEndTime => 'Bitiş saatini ayarlamak için dokunun';

  @override
  String get calendarRecurrenceLabel => 'Tekrarlama';

  @override
  String get calendarRecurrenceNone => 'Tekrarlanmaz';

  @override
  String get calendarRecurrenceDaily => 'Günlük';

  @override
  String get calendarRecurrenceWeekly => 'Haftalık';

  @override
  String get calendarRecurrenceMonthly => 'Aylık';

  @override
  String get calendarColorLabel => 'Renk';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Renk $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Bilet fiyatı — isteğe bağlı';

  @override
  String get calendarLinkStageChannelLabel =>
      'Sahne kanalına bağla — isteğe bağlı';

  @override
  String get calendarStageChannelFallback => 'sahne';

  @override
  String get discordImportFetchError => 'Şablon alınamadı.';

  @override
  String get discordImportApplyError =>
      'Şablon uygulanamadı. Lütfen tekrar deneyin.';

  @override
  String get discordImportTitle => 'Discord Şablonu İçe Aktar';

  @override
  String get discordImportDescription =>
      'Bu sunucuya rol, kategori ve kanal içe aktarmak için bir discord.new bağlantısı veya şablon kodu yapıştırın.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 veya şablon kodu';

  @override
  String get discordImportPreviewButton => 'Önizleme';

  @override
  String get discordImportTemplateFallback => 'Şablon';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rol',
      one: '$count rol',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kategori',
      one: '$count kategori',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kanal',
      one: '$count kanal',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel => 'MEVCUT YAPIYI DEĞİŞTİR';

  @override
  String get discordImportReplaceWarning =>
      'Mevcut tüm kanallar, kategoriler ve roller kalıcı olarak silinecek.';

  @override
  String get discordImportAddDescription =>
      'Şablon mevcut sunucu yapınıza eklenecek.';

  @override
  String get discordImportReplaceConfirmTitle =>
      'Sunucu yapısı değiştirilsin mi?';

  @override
  String get discordImportReplaceConfirmBody =>
      'Bu, içe aktarmadan önce mevcut tüm kanalları, kategorileri ve rolleri kalıcı olarak silecek. Bu işlem geri alınamaz.';

  @override
  String get discordImportYesReplace => 'Evet, Değiştir';

  @override
  String get discordImportReplaceAndImportButton =>
      'Değiştir ve Şablonu İçe Aktar';

  @override
  String get discordImportAddToServerButton => 'Şablonu Sunucuya Ekle';

  @override
  String get thresholdModConfigureTitle => 'Eşik Moderasyonunu Yapılandır';

  @override
  String get thresholdModConfigureExplanation =>
      'Güvendiğiniz moderatörleri ve bir kanalın geçmişinin bir dönemini herhangi birinin çözebilmesi için kaçının onaylaması gerektiğini seçin. Sizin bile tek başınıza bir anahtarınız olmaz -- yalnızca siz de bu listedeyseniz muaf tutulursunuz.';

  @override
  String get thresholdModThresholdLabel => 'Eşik:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Eşiği azalt';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Eşiği artır';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count moderatörden',
      one: '$count moderatörden',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle => 'Eşik Çözme Talebi';

  @override
  String get thresholdModChannelLabel => 'Kanal';

  @override
  String get thresholdModReasonHint =>
      'Sebep -- her belirlenen moderatöre gösterilir';

  @override
  String get thresholdModRequestButton => 'Talep Et';

  @override
  String get thresholdModShareRelayed => 'Pay talep edene iletildi.';

  @override
  String get thresholdModNotEnoughShares =>
      'Yeterli pay henüz iletilmedi -- daha fazla moderatör kendi payını ilettiğinde tekrar deneyin.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesaj',
      one: '$count mesaj',
    );
    return 'Dönem $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'Bu dönemde çözülebilir mesaj yok.';

  @override
  String get thresholdModExplanation =>
      'Bir kanalın geçmişinin gerçek şifre çözümü, birden fazla belirlenen moderatörün aktif onayına bağlıdır -- asla tek bir kişi tarafından değil, sunucu sahibi bile olsa. Yalnızca bir dönemin tamamının kilidini açar (son üyelik değişikliğinden bu yana gönderilen her şey), asla tek bir mesajın değil.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Etkin -- $count moderatör, eşik $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'Yapılandırılmadı';

  @override
  String get thresholdModReconfigureButton => 'Yeniden Yapılandır';

  @override
  String get thresholdModEnableButton => 'Etkinleştir';

  @override
  String get thresholdModNotEnabledForServer =>
      'Eşik moderasyonu bu sunucu için etkin değil.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Bu sunucu için etkin. Belirlenen moderatörlerden biri değilsiniz.';

  @override
  String get thresholdModRequestsLabel => 'Talepler';

  @override
  String get thresholdModRequestDecryptButton => 'Çözme Talep Et';

  @override
  String get thresholdModNoActiveRequests => 'Aktif talep yok.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- dönem $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'beklemede';

  @override
  String get thresholdModStatusApproved => 'onaylandı';

  @override
  String get thresholdModApproveButton => 'Onayla';

  @override
  String get thresholdModRelayShareButton => 'Payımı İlet';

  @override
  String get thresholdModTryReconstructButton => 'Yeniden Oluşturmayı Dene';

  @override
  String get roleSelectNoRolesAvailable =>
      'Kendinize atayabileceğiniz bir rol yok.';

  @override
  String get roleSelectInstructions =>
      'İstediğiniz rolleri seçin. Eklemek veya kaldırmak için bir role dokunun.';

  @override
  String get rulesScreenAcceptError =>
      'Kurallar kabul edilemedi. Tekrar deneyin.';

  @override
  String get rulesScreenSubtitle => 'Sunucu Kuralları';

  @override
  String get rulesScreenScrollToRead =>
      'Tüm kuralları okumak için aşağı kaydırın';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'Kabul Et\'e tıklayarak bu kurallara uymayı kabul edersiniz.\nİhlaller sunucudan çıkarılmayla sonuçlanabilir.';

  @override
  String get rulesScreenAcceptButton => 'Kuralları Kabul Ediyorum';

  @override
  String get rulesScreenReadAllToContinue =>
      'Devam etmek için tüm kuralları okuyun';

  @override
  String get galleryNewPostTitle => 'Yeni Gönderi';

  @override
  String get galleryChooseFileButton => 'Dosya Seç';

  @override
  String get galleryOrDivider => 'veya';

  @override
  String get galleryPasteUrlHint => 'Resim/video URL\'si yapıştırın';

  @override
  String get galleryTypeLabel => 'Tür';

  @override
  String get galleryImageOption => 'Resim';

  @override
  String get galleryVideoOption => 'Video';

  @override
  String get galleryCaptionHint => 'Başlık (isteğe bağlı)';

  @override
  String get galleryPostButton => 'Paylaş';

  @override
  String get galleryNewCollectionTitle => 'Yeni Koleksiyon';

  @override
  String get galleryCollectionNameHint => 'Koleksiyon adı';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return '\"$collectionName\" silinsin mi? İçindeki gönderiler koleksiyonsuz kalacak.';
  }

  @override
  String get galleryFeedTab => 'Akış';

  @override
  String get galleryCollectionsTab => 'Koleksiyonlar';

  @override
  String get galleryNoPostsYet => 'Henüz gönderi yok';

  @override
  String get galleryNoCollectionsYet => 'Henüz koleksiyon yok';

  @override
  String get gallerySelectACollection => 'Bir koleksiyon seçin';

  @override
  String get galleryNoPostsInCollection => 'Bu koleksiyonda gönderi yok';

  @override
  String get galleryAddPostButton => 'Gönderi Ekle';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Ekran paylaşımı başarısız oldu: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return '$username Ses Seviyesi';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'Yalnızca sizin duyduklarınızı etkiler -- bu cihaz, bu görüşme.';

  @override
  String get voiceScreenResetVolumeButton => 'Sıfırla';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'Bağlanılamadı: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Ekranınız, tam ekran görüntülemek için dokunun';

  @override
  String get voiceScreenYourScreenLabel => 'Ekranınız';

  @override
  String get voiceScreenTapToClose => 'Kapatmak için dokunun';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (siz)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', konuşuyor';

  @override
  String get voiceScreenCameraOnSuffix => ', kamera açık';

  @override
  String get voiceScreenActivateToPopOut =>
      ', ayrı pencerede açmak için etkinleştirin';

  @override
  String get voiceScreenShowVarmTooltip => 'VARM\'ı Göster';

  @override
  String get voiceScreenHideVarmTooltip => 'VARM\'ı Gizle';

  @override
  String get voiceScreenShowChatTooltip => 'Sohbeti göster';

  @override
  String get voiceScreenHideChatTooltip => 'Sohbeti gizle';

  @override
  String get voiceScreenStartCameraTooltip => 'Kamerayı başlat';

  @override
  String get voiceScreenStopCameraTooltip => 'Kamerayı durdur';

  @override
  String get voiceScreenShareScreenTooltip => 'Ekranı paylaş';

  @override
  String get voiceScreenStopSharingTooltip => 'Paylaşımı durdur';

  @override
  String get voiceScreenPopOutTooltip => 'Sesi ayrı bir pencerede aç';

  @override
  String get voiceScreenCouldNotPopOut => 'Ses ayrı pencerede açılamadı.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Sesli Aramadan Ayrıl';

  @override
  String get voiceScreenPinTooltip => 'Sabitle (açık tut)';

  @override
  String get voiceScreenUnpinTooltip => 'Sabitlemeyi kaldır';

  @override
  String get voiceScreenSizeSmall => 'Küçük (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Orta (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Büyük (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, $count bağlı';
  }

  @override
  String get voiceBarSpeakingSuffix => ', konuşuyorsunuz';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count bağlı · genişletmek için dokunun';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Kamerayı başlat';

  @override
  String get voiceBarStopCameraTooltip => 'Kamerayı durdur';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Sesli Aramadan Ayrıl';

  @override
  String get popOutVideoFallbackTitle => 'Ses';

  @override
  String get popOutVideoMissingTokenError => 'Jeton veya URL eksik';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Bağlantı 15 saniye sonra zaman aşımına uğradı';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Hata: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'Katılımcı yok';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Sahne';

  @override
  String get stageCouldNotJoin => 'Sahneye katılınamadı.';

  @override
  String get stageThisStageFallback => 'Bu sahne';

  @override
  String get stageRequiresTicketToJoin => 'katılmak için bilet gerektiriyor';

  @override
  String get stagePleaseWaitLabel => 'Lütfen bekleyin...';

  @override
  String get stageGetFreeTicketButton => 'Ücretsiz Bilet Al';

  @override
  String stageBuyTicketButton(String price) {
    return 'Bilet Satın Al -- $price';
  }

  @override
  String get stageNotNowButton => 'Şimdi değil';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'Bilet satın alma başlatılamadı.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'Ödeme hâlâ bekleniyor -- onaylandığında tekrar katılmayı deneyin.';

  @override
  String get stageSpeakerBadge => 'Konuşmacı';

  @override
  String get stageListenerBadge => 'Dinleyici';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'Katılınamadı: $error';
  }

  @override
  String get stageSpeakersHeader => 'KONUŞMACILAR';

  @override
  String get stageRaisedHandsHeader => 'KALDIRILAN ELLER';

  @override
  String get stageAllowButton => 'İzin Ver';

  @override
  String get stageIgnoreButton => 'Yok Say';

  @override
  String get stageListenersHeader => 'DİNLEYİCİLER';

  @override
  String get stageRaiseHandTooltip => 'El kaldır';

  @override
  String get stageLowerHandTooltip => 'Eli indir';

  @override
  String get stageLeaveStageTooltip => 'Sahneden Ayrıl';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (siz)';
  }

  @override
  String get stageMoveToListenersButton => 'Dinleyicilere taşı';

  @override
  String get stageYouFallbackName => 'Siz';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return '$username için avatar';
  }

  @override
  String get channelEditDialogNewTitle => 'Yeni Kanal';

  @override
  String get channelEditDialogEditTitle => 'Kanalı Düzenle';

  @override
  String get channelEditDialogNameHint => 'Kanal adı';

  @override
  String get channelEditDialogDescriptionHint => 'Konu (isteğe bağlı)';

  @override
  String get channelEditDialogTypeLabel => 'Tür';

  @override
  String get channelEditDialogTypeText => 'Metin';

  @override
  String get channelEditDialogTypeVoice => 'Ses';

  @override
  String get channelEditDialogTypeGallery => 'Galeri';

  @override
  String get channelEditDialogTypeStage => 'Sahne';

  @override
  String get channelEditDialogTypeRules => 'Kurallar';

  @override
  String get channelEditDialogTypeRoleSelection => 'Rol Seçimi';

  @override
  String get channelEditDialogTypeCalendar => 'Takvim';

  @override
  String get channelEditDialogAnnouncementTitle => 'Duyuru kanalı';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Yalnızca mesajları yönetebilen üyeler paylaşım yapabilir';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Canlı yayın ve yükleme duyurularını buraya paylaş';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      '\"Canlı yayında duyur\" iznine sahip bir üye Twitch\'te canlı yayına geçtiğinde veya yeni bir YouTube videosu paylaştığında otomatik olarak paylaşılır';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Paylaşıldığında bu rolleri bilgilendir (isteğe bağlı)';

  @override
  String get channelEditDialogSlowmodeLabel => 'Yavaş Mod';

  @override
  String get channelEditDialogSlowmodeOff => 'Kapalı';

  @override
  String get channelEditDialogUserLimitLabel => 'Kullanıcı Sınırı';

  @override
  String get channelEditDialogUserLimitOff => 'Sınır yok';

  @override
  String get channelEditDialogCategoryLabel => 'Kategori';

  @override
  String get channelEditDialogNoCategory => 'Kategori yok';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Rol Erişimi (herkes için boş bırakın)';

  @override
  String get channelEditDialogContentLabelsLabel => 'İçerik Etiketleri';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Bu kanalı üyelerin içerik filtreleri için işaretler; gözetim altındaki hesaplar için tamamen engellenir';

  @override
  String get categoryEditDialogNewTitle => 'Yeni Kategori';

  @override
  String get categoryEditDialogEditTitle => 'Kategoriyi Düzenle';

  @override
  String get categoryEditDialogNameHint => 'Kategori adı';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Rol Erişimi (herkes için boş bırakın)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Üyeler — $count çevrimiçi';
  }

  @override
  String get memberPanelRefreshTooltip => 'Üye listesini yenile';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count üye',
      one: '$count üye',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Çevrimdışı';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', $tier katmanı';
  }

  @override
  String get memberPanelUnknownUser => 'Bilinmiyor';

  @override
  String get memberPanelModerationActionsTooltip => 'Moderasyon işlemleri';

  @override
  String get reportDialogReasonSpam => 'Spam';

  @override
  String get reportDialogReasonHarassment => 'Taciz veya istismar';

  @override
  String get reportDialogReasonIllegal => 'Yasa dışı içerik';

  @override
  String get reportDialogReasonOther => 'Diğer';

  @override
  String get reportDialogReasonLabel => 'Sebep';

  @override
  String get reportDialogNoteHint =>
      'Moderatörlerin bilmesi gereken başka bir şey var mı? (isteğe bağlı)';

  @override
  String get reportDialogDisclosureNote =>
      'Size gösterilen mesaj içeriği ve gönderen kişi bu sunucunun moderatörleriyle paylaşılacaktır.';

  @override
  String get reportDialogSubmitButton => 'Bildirimi Gönder';

  @override
  String get reportDialogSubmitError => 'Bildirim gönderilemedi.';

  @override
  String get notificationBellTitle => 'Bildirimler';

  @override
  String get notificationBellMarkAllRead => 'Tümünü okundu işaretle';

  @override
  String get notificationBellEmptyState => 'Henüz bildirim yok';

  @override
  String get notificationBellUnreadLabel => 'Okunmadı';

  @override
  String get invitePreviewTitle => 'Sunucu Daveti';

  @override
  String get invitePreviewInvalidOrExpired =>
      'Geçersiz veya süresi dolmuş davet.';

  @override
  String get invitePreviewCouldNotJoin => 'Sunucuya katılınamadı.';

  @override
  String get invitePreviewUnknownServer => 'Bilinmeyen sunucu';

  @override
  String get shippingAddressFullNameHint => 'Ad Soyad';

  @override
  String get shippingAddressLine1Hint => 'Adres satırı 1';

  @override
  String get shippingAddressLine2Hint => 'Adres satırı 2 (isteğe bağlı)';

  @override
  String get shippingAddressCityHint => 'Şehir';

  @override
  String get shippingAddressStateHint => 'İl/Eyalet';

  @override
  String get shippingAddressZipHint => 'Posta kodu';

  @override
  String get shippingAddressCountryCodeHint => 'Ülke kodu (örn. US)';

  @override
  String get shippingAddressPhoneHint => 'Telefon (isteğe bağlı)';

  @override
  String get shippingAddressPrivacyNote =>
      'Yalnızca bu siparişi göndermek için kullanılır -- sipariş verildikten sonra bu bilgilerin nasıl işlendiğini öğrenmek için Printful\'ın kendi gizlilik politikasına bakın.';

  @override
  String get updateNudgeAvailableTitle => 'Güncelleme Mevcut';

  @override
  String get updateNudgeRequiredTitle => 'Güncelleme Gerekli';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $version kullanılabilir -- daha eski bir sürümdesiniz.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'Bu sürüm artık desteklenmiyor. Koda\'yı kullanmaya devam etmek için Koda $version sürümüne güncelleyin.';
  }

  @override
  String get updateNudgeLaterButton => 'Sonra';

  @override
  String get tierBadgeSparkSubscriber => 'Spark abonesi';

  @override
  String get tierBadgePulseSubscriber => 'Pulse abonesi';

  @override
  String get tierBadgeAlphaSpark => 'Alpha Spark';

  @override
  String get tierBadgeFounder => 'Founder';

  @override
  String get foundersHallTitle => 'Founders Hall';

  @override
  String get foundersHallSubtitle =>
      'Koda’yı mümkün kılan en eski destekçiler.';

  @override
  String get foundersHallEmptyState => 'Henüz kurucu yok.';

  @override
  String get settingsFoundersHallTitle => 'Founders Hall';

  @override
  String get settingsFoundersHallSubtitle =>
      'Koda’yı kimin inşa etmeye yardım ettiğini gör';

  @override
  String get vispAvatarInDevelopment => 'GELİŞTİRİLİYOR';

  @override
  String get vispBoostAdvisorCouldNotAnswer => 'Visp bir yanıt hazırlayamadı.';

  @override
  String get vispBoostAdvisorTitle => 'Visp\'e Sor: Boost Getiri Danışmanı';

  @override
  String get vispBoostAdvisorFollowUpHint => 'Ek bir soru sorun...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Gönder';

  @override
  String get vispBoostAdvisorBasedOn => 'Şuna dayanarak:';

  @override
  String get vispEventDialogCouldNotGenerate =>
      'Visp bir etkinlik oluşturamadı.';

  @override
  String get vispEventDialogCouldNotCreate => 'O etkinlik oluşturulamadı.';

  @override
  String get vispEventDialogRecurrenceNone => 'Tek seferlik';

  @override
  String get vispEventDialogRecurrenceDaily => 'Her gün tekrarlanır';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Her hafta tekrarlanır';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Her ay tekrarlanır';

  @override
  String get vispEventDialogTitle =>
      'Visp\'ten bir etkinlik oluşturmasını iste';

  @override
  String get vispEventDialogDescription =>
      'Etkinliği anlatın -- Visp bir başlık, tarih/saat ve diğer ayrıntıları önerecek.';

  @override
  String get vispEventDialogPromptHint =>
      'örn. \"Her Cuma akşamı 7\'de yaklaşık 3 saat süren haftalık D&D oturumu\"';

  @override
  String get vispEventDialogPrivacyNote =>
      'Açıklamanız bu planı oluşturmak için Visp\'e (kendi kendine barındırılan bir asistan -- hiçbir şey Koda\'nın sunucularından çıkmaz) gönderilir.';

  @override
  String get vispEventDialogStartOver => 'Baştan Başla';

  @override
  String get vispEventDialogCreateEvent => 'Etkinlik Oluştur';

  @override
  String get vispEventDialogThinking => 'Düşünüyor...';

  @override
  String get vispEventDialogGeneratePlan => 'Plan Oluştur';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'Bir tarih anlaşılamadı -- farklı ifade etmeyi deneyin';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Bitiş: $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return 'Bilet başına $price';
  }

  @override
  String get vispEventDialogBasedOn => 'Şuna dayanarak:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Soru $questionNumber/$maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'Ya da kendi cevabınızı yazın...';

  @override
  String get vispQuestionStepSendTooltip => 'Gönder';

  @override
  String get vispQuestionStepSkip => 'Atla ve şimdi oluştur';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp bir plan oluşturamadı.';

  @override
  String get vispSetupDialogCouldNotApplyPlan => 'O plan uygulanamadı.';

  @override
  String get vispSetupDialogTitleNew => 'Sunucunuzu Visp\'e anlatın';

  @override
  String get vispSetupDialogTitleExisting =>
      'Visp\'ten bu sunucuya eklemesini iste';

  @override
  String get vispSetupDialogDescriptionNew =>
      'İstediğiniz sunucuyu anlatın -- Visp bir isim ve roller, kategoriler ile kanallardan oluşan bir set önerecek.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Eklemek istediğinizi anlatın -- Visp oluşturmak için roller, kategoriler ve kanallar önerecek.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'örn. \"İki masa için sesli kanalları olan D&D grubum için rahat bir sunucu\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'örn. \"Raid takımlarımız için birkaç kanal daha ekle\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      'Açıklamanız bu planı oluşturmak için Visp\'e (kendi kendine barındırılan bir asistan -- hiçbir şey Koda\'nın sunucularından çıkmaz) gönderilir.';

  @override
  String get vispSetupDialogStartOver => 'Baştan Başla';

  @override
  String get vispSetupDialogCreateServer => 'Sunucu Oluştur';

  @override
  String get vispSetupDialogAddToServer => 'Sunucuya Ekle';

  @override
  String get vispSetupDialogThinking => 'Düşünüyor...';

  @override
  String get vispSetupDialogGeneratePlan => 'Plan Oluştur';

  @override
  String get vispSetupDialogNewServerLabel => 'Yeni sunucu';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rol',
      one: '$count rol',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kategori',
      one: '$count kategori',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kanal',
      one: '$count kanal',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'Şuna dayanarak:';

  @override
  String get childLockoutTitle => 'Şu anda izin verilen saatlerin dışındasınız';

  @override
  String get childLockoutBody =>
      'Bir ebeveyn veya vasi, bu hesabın Koda\'yı kullanabileceği saatleri belirledi. Onlardan daha fazla süre isteyin veya bir sonraki izin verilen zaman diliminde tekrar kontrol edin.';

  @override
  String get childLockoutLogOutButton => 'Çıkış Yap';

  @override
  String get forcePasswordChangeError =>
      'Şifre güncellenemedi. Tekrar deneyin.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Hoş geldiniz, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Devam edebilmeniz için hesabınızın yeni bir şifreye ihtiyacı var.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'Yeni şifre';

  @override
  String get forcePasswordChangeConfirmPasswordHint => 'Yeni şifreyi onayla';

  @override
  String get forcePasswordChangeReqLength => 'En az 12 karakter';

  @override
  String get forcePasswordChangeReqUpper => 'Bir büyük harf';

  @override
  String get forcePasswordChangeReqLower => 'Bir küçük harf';

  @override
  String get forcePasswordChangeReqDigit => 'Bir rakam';

  @override
  String get forcePasswordChangeReqMatch => 'Şifreler eşleşiyor';

  @override
  String get forcePasswordChangeSubmitButton => 'Yeni Şifre Belirle';

  @override
  String get forgotPasswordEnterEmailError => 'E-posta adresinizi girin.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'Böyle bir hesap varsa, bir sıfırlama kodu gönderildi.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Kodu ve en az 8 karakterlik bir şifre girin.';

  @override
  String get forgotPasswordInvalidCode => 'Geçersiz veya süresi dolmuş kod.';

  @override
  String get forgotPasswordTitle => 'Şifreyi sıfırla';

  @override
  String get forgotPasswordEmailHint => 'E-posta adresi';

  @override
  String get forgotPasswordSendCodeButton => 'Sıfırlama kodu gönder';

  @override
  String get forgotPasswordCodeHint => '6 haneli kod';

  @override
  String get forgotPasswordNewPasswordHint => 'Yeni şifre';

  @override
  String get forgotPasswordSetNewPasswordButton => 'Yeni şifre belirle';

  @override
  String get verifyEmailEnterCodeError => 'E-postanızdaki 6 haneli kodu girin.';

  @override
  String get verifyEmailInvalidCode => 'Geçersiz veya süresi dolmuş kod.';

  @override
  String verifyEmailResentInfo(String email) {
    return '$email adresine yeni bir kod gönderildi.';
  }

  @override
  String get verifyEmailResendFailed => 'Şu anda tekrar gönderilemedi.';

  @override
  String get verifyEmailTitle => 'E-postanızı kontrol edin';

  @override
  String verifyEmailSentCode(String email) {
    return '$email adresine 6 haneli bir kod gönderdik';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'E-postayı Doğrula';

  @override
  String get verifyEmailResendButton => 'Kodu tekrar gönder';

  @override
  String get safetyNumberKeysNotSetUp =>
      'Kendi anahtarlarınız henüz ayarlanmadı.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName için henüz bir anahtar paketi yok.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'Güvenlik numarası hesaplanamadı: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName artık o cihaza sahip değil.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return '$peerName ile Güvenlik Numarası';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Bu numarayı $peerName ile başka bir kanal üzerinden karşılaştırın -- yüz yüze, telefonla, bu sohbet dışında herhangi bir yerde. İki tarafta da eşleşiyorsa, konuştuğunuzu düşündüğünüz kişiyle konuşuyorsunuz demektir.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName kullanıcısının, her birinin kendi güvenlik numarası olan $count cihazı var -- birini doğrulamak diğerlerini kapsamaz.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Cihaz $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Doğrulandı Olarak İşaretle';

  @override
  String get contentFiltersDescription =>
      'Sunucular kanalları içerik etiketleriyle işaretleyebilir. Etiketli kanalların nasıl davranmasını istediğinizi seçin -- bu tamamen sizin tercihinizdir ve başkalarının ne gördüğünü asla etkilemez.';

  @override
  String get contentFiltersLabelAdult => 'Yetişkin içeriği';

  @override
  String get contentFiltersLabelSuggestive => 'Müstehcen';

  @override
  String get contentFiltersLabelGraphic => 'Rahatsız edici medya';

  @override
  String get contentFiltersLabelNudity => 'Cinsel olmayan çıplaklık';

  @override
  String get contentFiltersDescAdult => 'Cinsel açıdan açık içerik';

  @override
  String get contentFiltersDescSuggestive =>
      'Cinsel çağrışımlı ama açık olmayan içerik';

  @override
  String get contentFiltersDescGraphic => 'Şiddet veya kanlı görüntüler';

  @override
  String get contentFiltersDescNudity => 'Cinsel olmayan bağlamda çıplaklık';

  @override
  String get contentFiltersHide => 'Gizle';

  @override
  String get contentFiltersWarn => 'Uyar';

  @override
  String get contentFiltersShow => 'Göster';

  @override
  String get deviceTestCouldNotGetToken => 'Test jetonu alınamadı.';

  @override
  String get deviceTestLabelTest => 'Test';

  @override
  String get deviceTestLabelRecording => 'Kaydediliyor...';

  @override
  String get deviceTestLabelPlayingBack => 'Oynatılıyor...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'Kamera başlatılamadı: $error';
  }

  @override
  String get deviceTestTitle => 'Cihazları Test Et';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'Bağlanılamadı: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Mikrofon';

  @override
  String get deviceTestHearYourselfLabel => 'Kendini Duy (Gecikmeli)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Hoparlör / Çıkış';

  @override
  String get deviceTestCameraLabel => 'Kamera';

  @override
  String get deviceTestSystemDefault => 'Sistem varsayılanı';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Konuşun, ardından $seconds saniyelik bir klibin oynatıldığını duyun';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '$seconds sn';
  }

  @override
  String get deviceTestCameraPreviewOff => 'Kamera önizlemesi kapalı';

  @override
  String get deviceTestStopCameraButton => 'Kamera Testini Durdur';

  @override
  String get deviceTestTestCameraButton => 'Kamerayı Test Et';

  @override
  String get deviceTestInputLevelLabel => 'Giriş seviyesi';

  @override
  String get devicesScreenRemoveConfirmTitle => 'Bu cihaz kaldırılsın mı?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'Tekrar oturum açması gerekecek ve kaldırıldığı sırada ona gönderilen mesajlar daha sonra ulaşmayacak -- Double Ratchet oturumları boşlukları geriye dönük olarak doldurmaz.';

  @override
  String get devicesScreenRemoveFailed => 'O cihaz kaldırılamadı.';

  @override
  String get devicesScreenNeverActive => 'Hiç etkin olmadı';

  @override
  String devicesScreenActiveDate(String date) {
    return '$date tarihinde etkindi';
  }

  @override
  String get devicesScreenDescription =>
      'Oturum açtığınız her cihazın kendi şifreleme kimliği vardır -- size gönderilen bir mesaj aşağıdaki her cihaza ulaşır. Kullanmadığınız veya tanımadığınız bir cihazı kaldırın.';

  @override
  String get devicesScreenNoDevicesFound => 'Cihaz bulunamadı.';

  @override
  String get devicesScreenUnknownDevice => 'Bilinmeyen cihaz';

  @override
  String get devicesScreenThisDeviceBadge => 'Bu cihaz';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Cihazı kaldır';

  @override
  String get totpSetupInvalidCode => 'Geçersiz kod. Tekrar deneyin.';

  @override
  String get totpSetupEnabledMessage =>
      'İki faktörlü kimlik doğrulama etkinleştirildi.';

  @override
  String get totpSetupScanInstructions =>
      'Bu gizli anahtarı kimlik doğrulayıcı uygulamanıza (Google Authenticator, 1Password, Authy) tarayın:';

  @override
  String get totpSetupCodeHint => 'Onaylamak için 6 haneli kodu girin';

  @override
  String get totpSetupVerifyButton => 'Doğrula ve Etkinleştir';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'Bas Konuş';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'Bağlamak için herhangi bir tuşa basın...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Cihazları Test Et';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Ses İşleme';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'Gürültü Bastırma';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Mikrofonunuzdaki arka plan gürültüsünü azaltır';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Gelişmiş Gürültü Bastırma (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'Gerçek zamanlı yapay zeka gürültü giderme, standart bastırmadan daha güçlü -- açıkken onun yerini alır';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'Yankı Giderme';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Kendi sesinizin yankılanarak geri gelmesini önler';

  @override
  String get voiceVideoSettingsAutoGainTitle => 'Otomatik Kazanç Kontrolü';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Mikrofon ses düzeyini otomatik olarak dengeler (ses yüksekliği normalizasyonu)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'Otomatik Kısma';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Siz konuşurken diğer katılımcıların ses düzeyini düşürür';

  @override
  String get voiceVideoSettingsHighPassTitle => 'Yüksek Geçiren Filtre';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Düşük frekanslı uğultuyu keser (fanlar, klima, masa vuruşları)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle => 'Yazma Sesi Algılama';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Mikrofonunuzun algıladığı klavye tıkırtısını bastırır';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Ses İzolasyonu';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Diğer insanları ve yakındaki sesleri filtreleyerek sesinize odaklanır';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Mikrofon Boost';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Boost\'u Etkinleştir';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Sessiz veya uzak bir mikrofon için ön amplifikatör kazancı -- EQ\'dan önce uygulanır';

  @override
  String get voiceVideoSettingsBandBoost => 'Boost';

  @override
  String get voiceVideoSettingsSectionMicEq => 'Mikrofon EQ';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'EQ\'yu Etkinleştir';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Mikrofonunuzu başkalarına ulaşmadan önce şekillendirir';

  @override
  String get voiceVideoSettingsBandBass => 'Bas';

  @override
  String get voiceVideoSettingsBandMid => 'Orta';

  @override
  String get voiceVideoSettingsBandTreble => 'Tiz';

  @override
  String get voiceVideoSettingsSectionVad => 'Ses Etkinliği Algılama (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'VOX\'u Etkinleştir';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Yalnızca gerçekten konuşurken iletim yapar';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Hassasiyet';

  @override
  String get voiceVideoSettingsVadHint =>
      'Düşük = daha sessiz sesleri algılar. Yüksek = iletimi yalnızca daha yüksek sesli konuşma tetikler.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Bağlı tuş';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'Ayarlanmadı — susturulmadığında mikrofon her zaman açık kalır';

  @override
  String get voiceVideoSettingsClearButton => 'Temizle';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Tuş Ayarla';

  @override
  String get voiceVideoSettingsChangeButton => 'Değiştir';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'Bir tuş bağlandığında, mikrofonunuz yalnızca o tuşu basılı tuttuğunuz sürece iletim yapar. Bir sesli kanaldayken bu, VOX\'a göre önceliklidir.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Sanal Avatar Reaktif Modeli';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Konuştuğunuzda yer değiştiren iki resim yükleyin. Yalnızca size görünür.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'Sessiz';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'Konuşuyor';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'Konuşma eşiği';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Düşük = konuşma resmine daha kolay geçiş yapar.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'VARM\'ı Kaldır';

  @override
  String get gifPickerNoGifsFound => 'GIF bulunamadı';

  @override
  String get gifPickerSearchHint => 'GIF ara...';

  @override
  String get messageSearchHint => 'Bu kanalda ara...';

  @override
  String get messageSearchTooltip => 'Ara';

  @override
  String get messageSearchInitialHint =>
      'Bu cihazda zaten yüklenmiş mesajlarda arar -- daha eskiye taradıkça daha eski geçmiş getirilir (ve yerel olarak çözülür).';

  @override
  String get messageSearchNoMatches => 'Eşleşme yok';

  @override
  String get messageSearchStartOfHistory => 'Kanal geçmişinin başlangıcı';

  @override
  String get messageSearchFurtherBackButton => 'Daha eskiyi ara';

  @override
  String get messageSearchUnknownAuthor => 'Bilinmiyor';
}
