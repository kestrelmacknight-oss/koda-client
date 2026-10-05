// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Koda';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonSave => 'Simpan';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonDelete => 'Hapus';

  @override
  String get commonCreate => 'Buat';

  @override
  String get commonClose => 'Tutup';

  @override
  String get commonDone => 'Selesai';

  @override
  String get commonDownload => 'Unduh';

  @override
  String get commonDisconnect => 'Putuskan';

  @override
  String get commonNone => 'Tidak ada';

  @override
  String get commonJoin => 'Gabung';

  @override
  String get commonDismiss => 'Abaikan';

  @override
  String get commonSubmit => 'Kirim';

  @override
  String get commonConfirm => 'Konfirmasi';

  @override
  String get commonRemove => 'Buang';

  @override
  String get commonRetry => 'Coba Lagi';

  @override
  String get commonOk => 'Oke';

  @override
  String get commonYes => 'Ya';

  @override
  String get commonNo => 'Tidak';

  @override
  String get commonSearch => 'Cari';

  @override
  String get commonSettings => 'Pengaturan';

  @override
  String get commonLoading => 'Memuat...';

  @override
  String get settingsLanguageSection => 'Bahasa';

  @override
  String get settingsLanguageTitle => 'Bahasa Aplikasi';

  @override
  String get settingsLanguageSystemDefault => 'Default sistem';

  @override
  String get settingsLanguageDescription =>
      'Pilih bahasa yang digunakan antarmuka Koda sendiri. Ini terpisah dari bahasa utama server mana pun, atau bahasa yang Anda gunakan untuk mengetik pesan.';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get settingsSignOut => 'Keluar';

  @override
  String get settingsSectionMyAccount => 'Akun Saya';

  @override
  String get settingsSectionSecurity => 'Keamanan';

  @override
  String get settingsSectionAccessibility => 'Aksesibilitas';

  @override
  String get settingsSectionBilling => 'Penagihan';

  @override
  String get settingsSectionFamily => 'Keluarga';

  @override
  String get settingsSectionVoiceVideo => 'Suara & Video';

  @override
  String get settingsSectionDesktop => 'Desktop';

  @override
  String get settingsSectionAbout => 'Tentang';

  @override
  String get settingsTwoFactorTitle => 'Autentikasi Dua Faktor';

  @override
  String get settingsTwoFactorSubtitle =>
      'Tambahkan aplikasi autentikator untuk keamanan ekstra';

  @override
  String get settingsLinkedDevicesTitle => 'Perangkat Tertaut';

  @override
  String get settingsLinkedDevicesSubtitle =>
      'Lihat dan hapus perangkat yang masuk ke akun ini';

  @override
  String get settingsContentFiltersTitle => 'Filter Konten';

  @override
  String get settingsContentFiltersSubtitle =>
      'Pilih bagaimana konten berlabel akan ditampilkan';

  @override
  String get settingsDmFriendsOnlyTitle => 'Hanya izinkan DM dari teman';

  @override
  String get settingsDmFriendsOnlySubtitle =>
      'Bukan-teman tidak dapat memulai percakapan baru dengan Anda';

  @override
  String get settingsDmPrivacyError => 'Tidak dapat memperbarui privasi DM.';

  @override
  String get settingsShowVispAvatarTitle => 'Tampilkan avatar Visp';

  @override
  String get settingsShowVispAvatarSubtitle =>
      'Menampilkan wajah dan suasana hati Visp di dialog pengaturan/acara/penasihatnya';

  @override
  String get settingsHighContrastTitle => 'Kontras Tinggi';

  @override
  String get settingsHighContrastSubtitle =>
      'Warna hitam/putih murni berkontras tinggi di seluruh aplikasi -- beralih akan memuat ulang layar saat ini sebentar.';

  @override
  String get settingsDyslexiaFontTitle => 'Font ramah disleksia';

  @override
  String get settingsDyslexiaFontSubtitle =>
      'Mengganti teks isi ke OpenDyslexic di seluruh aplikasi';

  @override
  String get settingsFontSizeTitle => 'Ukuran font';

  @override
  String get settingsFontSizeSample =>
      'Rubah cerdik melompati anjing yang malas';

  @override
  String get settingsDensityTitle => 'Kepadatan';

  @override
  String get settingsDensityDescription =>
      'Memengaruhi jarak pada kontrol standar -- tombol, sakelar, dialog -- bukan setiap tata letak khusus.';

  @override
  String get settingsDensityCompact => 'Ringkas';

  @override
  String get settingsDensityStandard => 'Standar';

  @override
  String get settingsDensityComfortable => 'Nyaman';

  @override
  String get settingsStreamingTitle => 'Akun Streaming';

  @override
  String get settingsStreamingDescription =>
      'Hubungkan Twitch/YouTube agar server tempat Anda memiliki izin \"Umumkan Saat Live\" dapat otomatis memposting saat Anda live atau mengunggah video baru.';

  @override
  String settingsStreamingConnected(
      String platform, String username, String liveSuffix) {
    return '$platform terhubung sebagai $username$liveSuffix';
  }

  @override
  String settingsStreamingNotConnected(String platform) {
    return '$platform tidak terhubung';
  }

  @override
  String get settingsStreamingLiveSuffixTwitch => ' -- sedang live';

  @override
  String get settingsStreamingLiveSuffixYoutube => ' -- unggahan baru';

  @override
  String get settingsStreamingConnecting => 'Menghubungkan...';

  @override
  String get settingsStreamingConnect => 'Hubungkan';

  @override
  String get settingsAnnounceLiveTwitch => 'Umumkan saat saya live';

  @override
  String get settingsAnnounceLiveYoutube =>
      'Umumkan siaran live dan unggahan baru';

  @override
  String get settingsRefreshStatus =>
      'Sudah terhubung di browser Anda? Segarkan status';

  @override
  String settingsStreamingConnectError(String platform) {
    return 'Tidak dapat memulai koneksi $platform.';
  }

  @override
  String get settingsStreamingFinishInBrowser =>
      'Selesaikan koneksi di browser Anda, lalu kembali dan segarkan.';

  @override
  String get settingsThroneTitle => 'Webhook Throne';

  @override
  String get settingsThroneDescription =>
      'Tempel URL ini ke pengaturan webhook Throne.com Anda untuk mendapat notifikasi di Koda setiap kali seseorang mengirimi Anda hadiah.';

  @override
  String get settingsThroneGetUrl => 'Dapatkan URL webhook saya';

  @override
  String get settingsThroneCopyTooltip => 'Salin';

  @override
  String get settingsThroneCopiedToast => 'Disalin ke clipboard';

  @override
  String get settingsThroneRegenerateTooltip =>
      'Buat ulang (membatalkan URL lama)';

  @override
  String get settingsThroneRegenerateConfirmTitle => 'Buat ulang URL webhook?';

  @override
  String get settingsThroneRegenerateConfirmBody =>
      'URL lama Anda akan berhenti berfungsi, jadi perbarui di Throne.com setelahnya.';

  @override
  String get settingsThroneRegenerate => 'Buat Ulang';

  @override
  String get settingsUploadPhoto => 'Unggah Foto';

  @override
  String get settingsOrPasteUrl => 'atau tempel URL di bawah';

  @override
  String get settingsAvatarUrlHint => 'https://contoh.com/avatar.jpg';

  @override
  String get settingsAvatarUploadNote =>
      'Mengunggah gambar memerlukan Cloudflare R2 — menempel URL selalu berfungsi.';

  @override
  String get settingsDisplayNameLabel => 'NAMA TAMPILAN';

  @override
  String get settingsDisplayNameHint => 'Nama tampilan';

  @override
  String get settingsBioLabel => 'BIO';

  @override
  String get settingsBioHint => 'Ceritakan sedikit tentang diri Anda';

  @override
  String get settingsPronounsLabel => 'KATA GANTI';

  @override
  String get settingsPronounsHint => 'mis. dia/dia';

  @override
  String get settingsShowPronounsTitle =>
      'Tampilkan kata ganti saya ke orang lain';

  @override
  String get settingsShowPronounsSubtitle =>
      'Ditampilkan di samping nama Anda di obrolan, daftar anggota, dan suara';

  @override
  String get settingsStatusLabel => 'STATUS';

  @override
  String get settingsCustomStatusLabel => 'STATUS KUSTOM';

  @override
  String get settingsCustomStatusHint => 'Apa yang sedang kamu pikirkan?';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusAway => 'Sedang Pergi';

  @override
  String get statusDnd => 'Jangan Ganggu';

  @override
  String get statusInvisible => 'Tidak Terlihat';

  @override
  String get settingsFamilyNotAvailable =>
      'Kontrol orang tua tidak tersedia untuk akun yang diawasi.';

  @override
  String get settingsAboutTitle => 'Tentang Koda';

  @override
  String settingsAboutBuildLabel(String buildLabel, String version) {
    return '$buildLabel v$version';
  }

  @override
  String get settingsTermsTitle => 'Syarat & Ketentuan';

  @override
  String get settingsPrivacyTitle => 'Kebijakan Privasi';

  @override
  String get settingsSupportTitle => 'Dukungan';

  @override
  String get settingsReportSecurityTitle => 'Laporkan Masalah Keamanan';

  @override
  String get settingsDesktopNotAvailable =>
      'Ini adalah pengaturan khusus desktop -- tidak ada jendela atau baki sistem di platform ini.';

  @override
  String get settingsCloseToTrayTitle => 'Tutup ke baki sistem';

  @override
  String get settingsCloseToTraySubtitle =>
      'Menutup jendela membuat Koda tetap berjalan di latar belakang sehingga Anda tetap mendapat notifikasi -- matikan ini agar menutup jendela benar-benar keluar dari aplikasi.';

  @override
  String get authErrorEmailPasswordRequired =>
      'Email dan kata sandi wajib diisi.';

  @override
  String get authErrorIncorrectCredentials => 'Email atau kata sandi salah.';

  @override
  String get authErrorMustAcceptTerms => 'Harap setujui Syarat & Ketentuan.';

  @override
  String get authErrorAllFieldsRequired => 'Semua kolom wajib diisi.';

  @override
  String get authErrorPasswordsDontMatch => 'Kata sandi tidak cocok.';

  @override
  String get authErrorPasswordTooShort =>
      'Kata sandi harus minimal 8 karakter.';

  @override
  String get authErrorRegistrationFailed =>
      'Pendaftaran gagal. Email tersebut mungkin sudah digunakan.';

  @override
  String get authTabSignIn => 'Masuk';

  @override
  String get authTabCreateAccount => 'Buat Akun';

  @override
  String get authAgreementPrefix => 'Dengan menggunakan Koda, Anda menyetujui ';

  @override
  String get authTermsLink => 'Syarat & Ketentuan';

  @override
  String get authAgreementMiddle => ' dan ';

  @override
  String get authPrivacyLink => 'Kebijakan Privasi';

  @override
  String get authAgreementSuffix => ' kami.';

  @override
  String get authEmailHint => 'Alamat email';

  @override
  String get authPasswordHint => 'Kata sandi';

  @override
  String get authForgotPassword => 'Lupa kata sandi?';

  @override
  String get authSignInButton => 'Masuk';

  @override
  String get authUsernameHint => 'Nama pengguna';

  @override
  String get authConfirmPasswordHint => 'Konfirmasi kata sandi';

  @override
  String get authAccessCodeHint => 'Kode akses (jika Anda punya)';

  @override
  String get authAgreeToTerms =>
      'Saya menyetujui Syarat & Ketentuan dan Kebijakan Privasi';

  @override
  String get authCreateAccountButton => 'Buat Akun';

  @override
  String get dmSafetyNumberChangedWarning =>
      'Nomor keamanan percakapan ini berubah -- verifikasi sebelum mengirim.';

  @override
  String get dmMessageNotSent => 'Pesan tidak terkirim.';

  @override
  String dmEncryptMessageError(String error) {
    return 'Tidak dapat mengenkripsi pesan: $error';
  }

  @override
  String get dmAttachmentUploadFailed => 'Unggah lampiran gagal.';

  @override
  String dmEncryptAttachmentError(String error) {
    return 'Tidak dapat mengenkripsi lampiran: $error';
  }

  @override
  String get dmReportMessage => 'Laporkan Pesan';

  @override
  String get dmReportSubmitted => 'Laporan terkirim.';

  @override
  String get dmTitle => 'Pesan';

  @override
  String get dmNewMessage => 'Pesan Baru';

  @override
  String get dmNoConversationsYet => 'Belum ada percakapan';

  @override
  String get dmSelectConversation => 'Pilih percakapan';

  @override
  String get dmVerifySafetyNumberTooltip => 'Verifikasi Nomor Keamanan';

  @override
  String get dmSeenLabel => 'Dilihat';

  @override
  String get dmMessageActionsTooltip => 'Tindakan pesan';

  @override
  String get dmRemoveAttachmentTooltip => 'Hapus lampiran';

  @override
  String get dmAttachFileTooltip => 'Lampirkan file';

  @override
  String get dmMessageHint => 'Pesan...';

  @override
  String get dmSendMessageTooltip => 'Kirim pesan';

  @override
  String get dmNoFriendsYet =>
      'Belum ada teman.\nKirim permintaan pertemanan untuk memulai.';

  @override
  String get dmUnfriendTooltip => 'Hapus pertemanan';

  @override
  String get dmNoPendingRequests => 'Tidak ada permintaan pertemanan tertunda.';

  @override
  String get dmIncomingRequestsLabel => 'MASUK';

  @override
  String get dmSentRequestsLabel => 'TERKIRIM';

  @override
  String get dmAcceptTooltip => 'Terima';

  @override
  String get dmDeclineTooltip => 'Tolak';

  @override
  String get dmPendingLabel => 'Tertunda';

  @override
  String get dmNewMessageDialogTitle => 'Pesan Baru';

  @override
  String get dmEnterUsernameHint => 'Masukkan nama pengguna';

  @override
  String get dmOpenButton => 'Buka';

  @override
  String dmSavedAttachment(String fileName) {
    return '$fileName disimpan';
  }

  @override
  String get dmUnknownUser => 'Tidak dikenal';

  @override
  String get dmEndToEndEncryptedTooltip => 'Terenkripsi ujung ke ujung';

  @override
  String get homeContentWarningTitle => 'Peringatan Konten';

  @override
  String homeContentWarningBody(String labels) {
    return 'Kanal ini ditandai untuk: $labels.\n\nUbah ini di Pengaturan > Keamanan > Filter Konten.';
  }

  @override
  String get homeViewAnyway => 'Tetap Lihat';

  @override
  String get homeCouldNotConnectVoice => 'Tidak dapat terhubung ke suara.';

  @override
  String get homeVoiceChannelFull => 'Saluran suara ini penuh.';

  @override
  String get homeCreateServer => 'Buat Server';

  @override
  String get homeJoinServer => 'Gabung Server';

  @override
  String get homeRedeemCode => 'Tukar Kode';

  @override
  String get homeJoinServerDialogTitle => 'Gabung Server';

  @override
  String get homeEnterInviteCode => 'Masukkan kode undangan atau URL:';

  @override
  String get homeInviteCodeHint => 'mis. XK9MP2';

  @override
  String get homeJoined => 'Bergabung!';

  @override
  String get homeInvalidInvite => 'Kode undangan tidak valid atau kedaluwarsa.';

  @override
  String get homeJoinButton => 'Gabung';

  @override
  String get homeRedeemCodeDialogTitle => 'Tukar Kode';

  @override
  String get homeEnterBackerCode => 'Masukkan kode pendukung atau hadiah Anda:';

  @override
  String get homeRewardCodeHint => 'Kode hadiah';

  @override
  String get homeCodeRedeemed => 'Kode ditukar! Hadiah Anda telah diterapkan.';

  @override
  String get homeInvalidRedeemCode =>
      'Kode tidak valid, kedaluwarsa, atau sudah ditukar.';

  @override
  String get homeRedeemButton => 'Tukar';

  @override
  String get homeAreFriends => 'Anda berteman';

  @override
  String get homeAddFriend => 'Tambah Teman';

  @override
  String homeFriendRequestSent(String username) {
    return 'Permintaan pertemanan terkirim ke $username!';
  }

  @override
  String get homeMessageButton => 'Pesan';

  @override
  String get homeSendTip => 'Kirim Tip';

  @override
  String get homeSwitchToServer => 'Beralih ke Server';

  @override
  String get homeInvitePeople => 'Undang Orang';

  @override
  String get homeServerSettingsMenuItem => 'Pengaturan Server';

  @override
  String get homeLeaveServerMenuItem => 'Keluar dari Server';

  @override
  String homeLeaveServerConfirm(String serverName) {
    return 'Keluar dari $serverName? Anda dapat bergabung kembali dengan undangan.';
  }

  @override
  String get homeLeaveButton => 'Keluar';

  @override
  String get homeCreateAServer => 'Buat sebuah server';

  @override
  String get homeServerNameHint => 'Nama server';

  @override
  String get homeDescribeToVisp => 'Jelaskan ke Visp saja';

  @override
  String get homeMarkAsRead => 'Tandai Sudah Dibaca';

  @override
  String get homeEditChannel => 'Edit Kanal';

  @override
  String get homeDeleteChannel => 'Hapus Kanal';

  @override
  String homeDeleteChannelConfirm(String channelName) {
    return 'Hapus #$channelName? Ini tidak dapat dibatalkan.';
  }

  @override
  String get homeDeleteButton => 'Hapus';

  @override
  String get homeCreateChannelHere => 'Buat Kanal di Sini';

  @override
  String get homeEditCategory => 'Edit Kategori';

  @override
  String get homeDeleteCategory => 'Hapus Kategori';

  @override
  String homeDeleteCategoryConfirm(String categoryName) {
    return 'Hapus \"$categoryName\"? Kanal di dalamnya akan menjadi tanpa kategori.';
  }

  @override
  String get homeReplyAction => 'Balas';

  @override
  String get homeCreateThreadAction => 'Buat Utas';

  @override
  String get homeEditMessageAction => 'Edit Pesan';

  @override
  String get homeDeleteMessageAction => 'Hapus Pesan';

  @override
  String get homePinMessageAction => 'Sematkan Pesan';

  @override
  String get homeUnpinMessageAction => 'Lepas Sematan Pesan';

  @override
  String get homeReportMessageAction => 'Laporkan Pesan';

  @override
  String get homeReportSubmitted => 'Laporan terkirim.';

  @override
  String get messageActionForward => 'Teruskan';

  @override
  String messageForwardedFromLabel(String name) {
    return 'Diteruskan dari $name';
  }

  @override
  String get forwardDestinationPickerTitle => 'Teruskan pesan';

  @override
  String get forwardDestinationPickerChannelsTab => 'Saluran';

  @override
  String get forwardDestinationPickerDmsTab => 'Pesan Langsung';

  @override
  String get forwardDestinationPickerNoServers =>
      'Anda belum bergabung dengan server mana pun.';

  @override
  String get forwardDestinationPickerNoChannels =>
      'Tidak ada saluran teks di server ini.';

  @override
  String get forwardDestinationPickerNoConversations => 'Belum ada percakapan.';

  @override
  String get forwardSuccessToast => 'Pesan diteruskan.';

  @override
  String get forwardFailedToast => 'Tidak dapat meneruskan pesan -- coba lagi.';

  @override
  String get homeAddReactionTitle => 'Tambah Reaksi';

  @override
  String homeThreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count utas',
    );
    return '$_temp0';
  }

  @override
  String get homeCategoryOptionsTooltip => 'Opsi kategori';

  @override
  String get homeChannelOptionsTooltip => 'Opsi kanal';

  @override
  String get homeOpenVoiceChatTooltip => 'Buka obrolan';

  @override
  String get homeMarketplaceLabel => 'Marketplace';

  @override
  String get homeSelectChannelPrompt => 'Pilih kanal';

  @override
  String get homeSearchTooltip => 'Cari';

  @override
  String get homePinnedMessagesTooltip => 'Pesan Disematkan';

  @override
  String get homeWaitingForKey => 'Menunggu kunci enkripsi tiba...';

  @override
  String get homeUnableToDecrypt => 'Tidak dapat mendekripsi pesan ini.';

  @override
  String get homeMessageActionsTooltip => 'Tindakan pesan';

  @override
  String get homeCancelReplyTooltip => 'Batalkan balasan';

  @override
  String get homeRemoveAttachmentTooltip => 'Hapus lampiran';

  @override
  String get homeAttachFileTooltip => 'Lampirkan file';

  @override
  String get homeGifTooltip => 'GIF';

  @override
  String homeMessageHint(String channelName) {
    return 'Pesan #$channelName';
  }

  @override
  String get homeSendMessageTooltip => 'Kirim pesan';

  @override
  String get homeEditMessageTitle => 'Edit Pesan';

  @override
  String get homeMessageLabel => 'Pesan';

  @override
  String get homePinnedMessagesTitle => 'Pesan Disematkan';

  @override
  String get homeNoPinnedMessages => 'Tidak ada pesan disematkan';

  @override
  String get homeUnpinTooltip => 'Lepas sematan';

  @override
  String get homeCreateThreadTitle => 'Buat Utas';

  @override
  String get homeThreadNameHint => 'Nama utas';

  @override
  String homeThreadCreated(String name) {
    return 'Utas \"$name\" dibuat!';
  }

  @override
  String get homeCreateOrJoinTooltip => 'Buat atau Gabung';

  @override
  String get homeKodaMarketplaceTooltip => 'Koda Marketplace';

  @override
  String get homeAdminPanelTooltip => 'Panel Admin';

  @override
  String get homeServerSettingsTooltip => 'Pengaturan Server';

  @override
  String get homeSettingsTooltip => 'Pengaturan';

  @override
  String get homeContentWarningBadge => 'Peringatan konten';

  @override
  String get homeDirectMessagesTooltip => 'Pesan Langsung';

  @override
  String homeReplyingTo(String username) {
    return 'Membalas $username';
  }

  @override
  String get homeAttachmentFallback => 'Lampiran';

  @override
  String get homeAttachmentUploadFailed => 'Unggah lampiran gagal.';

  @override
  String homeSavedAttachment(String fileName) {
    return '$fileName disimpan';
  }

  @override
  String serverConnectError(String service) {
    return 'Tidak dapat memulai koneksi $service.';
  }

  @override
  String get serverDisconnectPrintfulTitle => 'Putuskan Printful?';

  @override
  String get serverDisconnectPrintfulBody =>
      'Server ini tidak akan dapat lagi memenuhi pesanan merchandise sampai terhubung kembali.';

  @override
  String get serverDisconnectTiltifyTitle => 'Putuskan Tiltify?';

  @override
  String get serverDisconnectTiltifyBody =>
      'Server ini akan berhenti menampilkan progres kampanye amalnya sampai terhubung kembali.';

  @override
  String get serverNewRoleTitle => 'Peran Baru';

  @override
  String get serverEditRoleTitle => 'Edit Peran';

  @override
  String serverColorSwatchLabel(String hex) {
    return 'Warna $hex';
  }

  @override
  String get permViewChannels => 'Lihat Kanal';

  @override
  String get permSendMessages => 'Kirim Pesan';

  @override
  String get permConnectVoice => 'Terhubung ke Suara';

  @override
  String get permManageServer => 'Kelola Server';

  @override
  String get permManageChannels => 'Kelola Kanal';

  @override
  String get permManageRoles => 'Kelola Peran';

  @override
  String get permManageMessages => 'Kelola Pesan';

  @override
  String get permKickMembers => 'Keluarkan Anggota';

  @override
  String get permBanMembers => 'Blokir Anggota';

  @override
  String get permMuteMembers => 'Bisukan Anggota';

  @override
  String get permMentionEveryone => 'Sebut @everyone';

  @override
  String get permManageMarketplace => 'Kelola Marketplace';

  @override
  String get permAnnounceLive => 'Umumkan Saat Live';

  @override
  String get permMoveMembers => 'Pindahkan Anggota (Suara)';

  @override
  String get serverRoleNameHint => 'Nama peran';

  @override
  String get serverColorLabel => 'Warna';

  @override
  String get serverPermissionsLabel => 'Izin';

  @override
  String get serverSelfAssignableTitle => 'Dapat diberikan sendiri';

  @override
  String get serverSelfAssignableSubtitle =>
      'Anggota dapat memberikan peran ini kepada diri sendiri';

  @override
  String get serverDefaultRoleUndeletable =>
      'Peran default tidak dapat dihapus.';

  @override
  String serverDeleteRoleConfirm(String roleName) {
    return 'Hapus peran \"$roleName\"?';
  }

  @override
  String get serverCouldNotDeleteRole =>
      'Tidak dapat menghapus peran tersebut.';

  @override
  String get serverMemberFallback => 'Anggota';

  @override
  String get serverNoRolesYet => 'Belum ada peran.';

  @override
  String get serverRefreshStatus =>
      'Sudah terhubung di browser Anda? Segarkan status';

  @override
  String get serverPrintfulConnected => 'Printful Terhubung';

  @override
  String get serverPrintfulNotConnected => 'Printful Tidak Terhubung';

  @override
  String get serverPrintfulDescription =>
      'Hubungkan akun Printful server ini untuk memenuhi pesanan merchandise yang dibuat melalui Koda. Setiap server menghubungkan tokonya sendiri.';

  @override
  String get serverConnecting => 'Menghubungkan...';

  @override
  String get serverConnectPrintful => 'Hubungkan Printful';

  @override
  String get serverTiltifyConnected => 'Tiltify Terhubung';

  @override
  String get serverTiltifyNotConnected => 'Tiltify Tidak Terhubung';

  @override
  String get serverTiltifyDescription =>
      'Hubungkan akun Tiltify server ini untuk menampilkan progres langsung kampanye amal kepada setiap anggota. Hanya-baca -- Koda tidak pernah memposting atau mengubah apa pun di sisi Tiltify.';

  @override
  String get serverConnectTiltify => 'Hubungkan Tiltify';

  @override
  String get serverNoTiltifyCampaigns =>
      'Tidak ditemukan kampanye di akun Tiltify ini.';

  @override
  String get serverPickCampaign => 'Pilih kampanye yang akan ditampilkan';

  @override
  String get serverUntitledCampaign => 'Kampanye tanpa judul';

  @override
  String serverCampaignProgress(String currency, String raised, String goal) {
    return '$currency $raised terkumpul dari target $goal';
  }

  @override
  String get serverViewCampaign => 'Lihat kampanye';

  @override
  String get serverRefreshButton => 'Segarkan';

  @override
  String get serverUploadButton => 'Unggah';

  @override
  String serverEmojiSlotsUsed(int used, int limit, int level) {
    return '$used / $limit slot terpakai -- level boost $level';
  }

  @override
  String get serverNoCustomEmoji => 'Belum ada emoji khusus.';

  @override
  String get serverDeleteEmojiTooltip => 'Hapus emoji';

  @override
  String get serverUploadEmojiTitle => 'Unggah Emoji';

  @override
  String get serverEmojiNameHint => 'nama (huruf, angka, _)';

  @override
  String get serverChooseImage => 'Pilih Gambar';

  @override
  String serverCurrentBoostLevel(int level) {
    return 'Level boost saat ini: $level';
  }

  @override
  String get serverBackgroundTitle => 'Latar Belakang Server';

  @override
  String get serverBackgroundDescription =>
      'Latar belakang khusus yang ditampilkan di belakang tampilan kanal untuk semua orang di server ini.';

  @override
  String get serverBackgroundLockedHint =>
      'Capai level boost 4 untuk membuka latar belakang khusus.';

  @override
  String get serverIconBorderTitle => 'Bingkai Ikon Server';

  @override
  String get serverIconBorderDescription =>
      'Bingkai aksen di sekitar ikon server ini di daftar server setiap anggota.';

  @override
  String get serverIconBorderLockedHint =>
      'Capai level boost 5 untuk membuka bingkai ikon khusus.';

  @override
  String get serverBoostFromBank =>
      'Boost server ini dari Bank Server di Marketplace untuk menaikkan levelnya.';

  @override
  String get serverMarketplaceListingLabel => 'DAFTAR MARKETPLACE';

  @override
  String get serverListInMarketplace => 'Daftarkan di Koda Marketplace';

  @override
  String get serverListInMarketplaceDescription =>
      'Mencantumkan toko server ini di Koda Marketplace, dengan kesempatan masuk rotasi unggulan mingguan. Ini soal belanja, bukan menemukan server untuk bergabung -- tidak memengaruhi pencarian server secara umum.';

  @override
  String get serverSocialLinkLabel => 'Tautan Sosial / Undangan (opsional)';

  @override
  String get serverSocialLinkHint => 'https://...';

  @override
  String get serverSaveLinkButton => 'Simpan Tautan';

  @override
  String get serverPricingLabel => 'HARGA';

  @override
  String get serverPrimaryCurrencyLabel => 'Mata Uang Utama';

  @override
  String get serverPrimaryCurrencyDescription =>
      'Berlaku untuk tingkat Langganan Server dan harga Barang Digital yang Anda tetapkan untuk server ini.';

  @override
  String get serverPrimaryLanguageLabel => 'Bahasa Utama';

  @override
  String get serverPrimaryLanguageDescription =>
      'Pesan yang diposting anggota dalam bahasa lain akan mendapat lencana bahasa kecil, dibandingkan dengan pengaturan ini.';

  @override
  String get serverMarketplaceLinkSaved => 'Tautan marketplace disimpan.';

  @override
  String get serverIconUpdated => 'Ikon server diperbarui!';

  @override
  String get serverTemplateImported => 'Template diimpor!';

  @override
  String get serverImportFromDiscord => 'Impor dari Discord';

  @override
  String get serverVispPlanLive => 'Rencana Visp sudah aktif!';

  @override
  String get serverAskVisp => 'Tanya Visp';

  @override
  String get serverAddCategoryButton => 'Tambah Kategori';

  @override
  String get serverAddChannelHereTooltip => 'Tambah kanal di sini';

  @override
  String get serverRename => 'Ganti nama';

  @override
  String get serverUncategorized => 'TANPA KATEGORI';

  @override
  String get serverAddChannel => 'Tambah Kanal';

  @override
  String get serverEditRulesContent => 'Edit Konten Aturan';

  @override
  String get serverRulesContentHint => 'Masukkan aturan server Anda di sini...';

  @override
  String get serverRulesUpdated => 'Aturan diperbarui!';

  @override
  String get serverAddRole => 'Tambah Peran';

  @override
  String get serverDefaultRoleLabel => 'Peran default';

  @override
  String get serverManageRolesTooltip => 'Kelola Peran';

  @override
  String get serverMutedLabel => 'Dibisukan';

  @override
  String get serverExpandedLabel => 'diperluas';

  @override
  String get serverCollapsedLabel => 'dilipat';

  @override
  String get serverUnmute => 'Batal Bisukan';

  @override
  String get serverMute => 'Bisukan';

  @override
  String get serverKick => 'Keluarkan';

  @override
  String get serverBan => 'Blokir';

  @override
  String serverBannedUsersLabel(int count) {
    return 'PENGGUNA DIBLOKIR — $count';
  }

  @override
  String get serverNoBannedUsers => 'Tidak ada pengguna yang diblokir.';

  @override
  String get serverUnban => 'Batal Blokir';

  @override
  String get serverMemberFallbackGeneric => 'anggota ini';

  @override
  String serverBanConfirm(String username, String serverName) {
    return 'Blokir $username dari $serverName? Mereka tidak akan bisa bergabung kembali tanpa diizinkan.';
  }

  @override
  String serverKickConfirm(String username, String serverName) {
    return 'Keluarkan $username dari $serverName? Mereka dapat bergabung kembali dengan undangan.';
  }

  @override
  String get serverMuteDuration60Sec => '60 detik';

  @override
  String get serverMuteDuration5Min => '5 menit';

  @override
  String get serverMuteDuration10Min => '10 menit';

  @override
  String get serverMuteDuration1Hour => '1 jam';

  @override
  String get serverMuteDuration1Day => '1 hari';

  @override
  String get serverMuteDuration1Week => '1 minggu';

  @override
  String serverCouldNotModerateMember(String action, String username) {
    return 'Tidak dapat $action $username.';
  }

  @override
  String serverMuteUserTitle(String username) {
    return 'Bisukan $username';
  }

  @override
  String serverCouldNotMuteMember(String username) {
    return 'Tidak dapat membisukan $username.';
  }

  @override
  String get serverUnlockInvites => 'Buka Kunci Undangan';

  @override
  String get serverInvitesUnlocked => 'Undangan dibuka kuncinya.';

  @override
  String get serverAuditLogDescription =>
      'Aktivitas moderasi Tingkat 1 -- keluarkan, blokir, bisukan, dan perlindungan otomatis terhadap flood/raid. Hanya metadata; tidak pernah konten pesan.';

  @override
  String get serverSystemActor => 'Sistem';

  @override
  String get serverActionKicked => 'dikeluarkan';

  @override
  String get serverActionBanned => 'diblokir';

  @override
  String get serverActionUnbanned => 'dibatalkan blokirnya';

  @override
  String get serverActionMuted => 'dibisukan';

  @override
  String get serverActionUnmuted => 'dibatalkan bisunya';

  @override
  String get serverActionFloodDetected => 'dibisukan otomatis karena flooding';

  @override
  String get serverActionRaidLockdownEnabled =>
      'mengunci undangan (perlindungan raid)';

  @override
  String get serverActionRaidLockdownDisabled => 'membuka kunci undangan';

  @override
  String get serverActionMoved => 'dipindahkan';

  @override
  String get serverUnknownAction => 'tindakan tidak diketahui';

  @override
  String get serverNoModerationActivity => 'Belum ada aktivitas moderasi.';

  @override
  String get serverReportsDescription =>
      'Pesan yang dilaporkan oleh anggota server ini -- salinan yang sudah didekripsi milik pelapor sendiri, diungkapkan melalui pelaporan.';

  @override
  String get serverNoPendingReports => 'Tidak ada laporan tertunda.';

  @override
  String get serverReportReasonOther => 'lainnya';

  @override
  String get serverReportStatusActioned => 'Ditindaklanjuti';

  @override
  String get serverReportStatusDismissed => 'Ditolak';

  @override
  String get serverResolvedLabel => 'SELESAI';

  @override
  String serverReportedBy(String reporter, String target) {
    return 'Dilaporkan oleh $reporter -- dikirim oleh $target';
  }

  @override
  String serverReportNote(String note) {
    return 'Catatan: $note';
  }

  @override
  String get serverDismissButton => 'Tolak';

  @override
  String get serverMarkActioned => 'Tandai Ditindaklanjuti';

  @override
  String get serverCreateInvite => 'Buat Undangan';

  @override
  String get serverInviteCreatedTitle => 'Undangan Dibuat';

  @override
  String get serverNoActiveInvites => 'Tidak ada undangan aktif';

  @override
  String serverUsesLabel(String uses) {
    return 'Penggunaan: $uses';
  }

  @override
  String get serverDeleteInviteTooltip => 'Hapus undangan';

  @override
  String get serverChangeIconLabel => 'Ganti ikon server';

  @override
  String get serverFallbackName => 'Server';

  @override
  String serverSettingsTitle(String serverName) {
    return 'Pengaturan $serverName';
  }

  @override
  String get serverTabChannels => 'Kanal';

  @override
  String get serverTabRoles => 'Peran';

  @override
  String get serverTabMembers => 'Anggota';

  @override
  String get serverTabInvites => 'Undangan';

  @override
  String get serverTabMerch => 'Merchandise';

  @override
  String get serverTabEmoji => 'Emoji';

  @override
  String get serverTabCustomize => 'Sesuaikan';

  @override
  String get serverTabAuditLog => 'Log Audit';

  @override
  String get serverTabReports => 'Laporan';

  @override
  String get serverTabThresholdMod => 'Moderasi Ambang';

  @override
  String get serverTabCharity => 'Amal';

  @override
  String get homeCustomEmojiFallback => 'emoji khusus';

  @override
  String homeReactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reaksi',
    );
    return '$_temp0';
  }

  @override
  String get homeReactionYouReacted =>
      ', Anda bereaksi, aktifkan untuk menghapus';

  @override
  String get homeReactionActivateToAdd => ', aktifkan untuk menambahkan';

  @override
  String get homeAddReactionLabel => 'Tambah reaksi';

  @override
  String homeViewProfile(String username) {
    return 'Lihat profil $username';
  }

  @override
  String get homeMoveToVoiceChannel => 'Pindahkan ke kanal suara…';

  @override
  String get homeMoveVoiceChannelDialogTitle => 'Pilih kanal suara';

  @override
  String get homeNoOtherVoiceChannels => 'Tidak ada kanal suara lain';

  @override
  String homeMoveVoiceMemberSuccess(String username, String channel) {
    return '$username sekarang di $channel';
  }

  @override
  String homeMoveVoiceMemberError(String username) {
    return 'Tidak dapat memindahkan $username';
  }

  @override
  String homeMovedToVoiceChannel(String channel) {
    return 'Anda sekarang di $channel';
  }

  @override
  String homeJoinVoiceToTalkBanner(String channel) {
    return 'Gabung ke $channel untuk bicara';
  }

  @override
  String get adminPanelTitle => 'Panel Admin';

  @override
  String get adminTabBackerCodes => 'Kode Pendukung';

  @override
  String get adminTabUsers => 'Pengguna';

  @override
  String get adminTabDmReports => 'Laporan DM';

  @override
  String get adminTabSpamFlags => 'Tanda Spam';

  @override
  String get adminTabWiki => 'Wiki';

  @override
  String get adminTabBoosts => 'Boost';

  @override
  String get adminCreateBackerCodeTitle => 'Buat Kode Pendukung';

  @override
  String get adminCodeHint => 'Kode (kosongkan untuk buat otomatis)';

  @override
  String get adminNoteHint => 'Catatan (mis. \"Kickstarter Tier 2\")';

  @override
  String get adminFlagsJsonHint =>
      'Flag sebagai JSON, mis. \"backer_tier\":\"founding\"';

  @override
  String get adminMaxUsesHint =>
      'Penggunaan maksimum (kosongkan = tanpa batas)';

  @override
  String get adminCodeCreatedTitle => 'Kode Dibuat';

  @override
  String get adminCodeLabel => 'Kode:';

  @override
  String get adminCopyCodeTooltip => 'Salin kode';

  @override
  String adminFlagsValue(String flags) {
    return 'Flag: $flags';
  }

  @override
  String get adminBackerCodesHeader => 'Kode Pendukung & Hadiah';

  @override
  String get adminNewCodeButton => 'Kode Baru';

  @override
  String get adminNoCodesYet => 'Belum ada kode';

  @override
  String get adminRewardsHeader => 'Hadiah';

  @override
  String get adminRewardAlphaBetaAccess =>
      'Akses Alpha/Beta + Lencana Alpha Spark';

  @override
  String get adminRewardLifetimePulse =>
      'Status Pulse seumur hidup + Lencana Founder + Bitrate yang ditingkatkan';

  @override
  String get adminRewardMonthlyBoostTokenOne =>
      'Token boost server bulanan (Audio/Video yang ditingkatkan)';

  @override
  String get adminRewardAnimatedFrameBundle =>
      'Bingkai profil animasi + Founders Hall + 2 token server bulanan';

  @override
  String get adminRewardTitanGlow =>
      'Efek cahaya nama pengguna \"Titan\" permanen';

  @override
  String get adminRewardAnimatedFrame => 'Bingkai animasi';

  @override
  String get adminRewardFoundersHall => 'Founders Hall';

  @override
  String adminRewardMonthlyBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count token boost/bulan',
      one: '1 token boost/bulan',
    );
    return '$_temp0';
  }

  @override
  String get adminRewardsNone => 'Tidak ada hadiah';

  @override
  String get adminRegistrationOpenLabel =>
      'Pendaftaran terbuka untuk semua orang';

  @override
  String get adminRegistrationInviteOnlyLabel =>
      'Pendaftaran hanya dengan undangan (kode backer diperlukan)';

  @override
  String adminUsesOfMax(int uses, int maxUses) {
    return '$uses / $maxUses';
  }

  @override
  String adminUsesCount(int uses) {
    return '$uses penggunaan';
  }

  @override
  String get adminSearchUsersHint =>
      'Cari pengguna berdasarkan nama pengguna...';

  @override
  String get adminSearchUsersPrompt => 'Cari pengguna di atas';

  @override
  String get adminNoDmReports => 'Tidak ada laporan DM.';

  @override
  String get adminResolvedLabel => 'SELESAI';

  @override
  String get adminReasonOther => 'lainnya';

  @override
  String adminDmReportDetails(String reporterId, String targetUserId) {
    return 'Pelapor: $reporterId\nPengirim terungkap: $targetUserId';
  }

  @override
  String adminNoteValue(String note) {
    return 'Catatan: $note';
  }

  @override
  String get adminDismissButton => 'Abaikan';

  @override
  String get adminMarkActionedButton => 'Tandai Ditindaklanjuti';

  @override
  String get adminStatusActioned => 'Ditindaklanjuti';

  @override
  String get adminStatusDismissed => 'Diabaikan';

  @override
  String get adminNoSpamFlags => 'Tidak ada tanda spam.';

  @override
  String get adminFlagMassDmSpam => 'Spam DM massal';

  @override
  String get adminFlagRaidLockdown => 'Penguncian raid';

  @override
  String get adminFlagBotBehavior => 'Perilaku seperti bot';

  @override
  String get adminFlagChannelFlooding => 'Banjir pesan di kanal';

  @override
  String get adminAutoEscalatedBadge => 'ESKALASI OTOMATIS';

  @override
  String adminConfidenceLabel(String score, String label) {
    return 'Keyakinan: $score% ($label)';
  }

  @override
  String adminFlagUserLine(String userId) {
    return 'Pengguna: $userId';
  }

  @override
  String adminFlagServerLine(String serverId) {
    return 'Server: $serverId';
  }

  @override
  String adminMutedJoiners(int mutedCount, int totalJoiners) {
    return '$mutedCount dari $totalJoiners anggota baru masih dibisukan';
  }

  @override
  String get adminNoJoinersMuted =>
      'Tidak ada anggota baru yang dibisukan saat ini';

  @override
  String adminRestrictedUntil(String until) {
    return 'Saat ini dibatasi hingga $until';
  }

  @override
  String get adminNotCurrentlyRestricted => 'Saat ini tidak dibatasi';

  @override
  String get adminDismissUndoButton => 'Abaikan & Batalkan';

  @override
  String get adminConfirmRestrictButton => 'Konfirmasi & Batasi';

  @override
  String get adminDeleteArticleTitle => 'Hapus artikel?';

  @override
  String adminDeleteArticleBody(String title) {
    return '\"$title\" akan dihapus dari basis pengetahuan Visp.';
  }

  @override
  String get adminNewArticleTitle => 'Artikel Baru';

  @override
  String get adminEditArticleTitle => 'Edit Artikel';

  @override
  String get adminArticleTitleHint => 'Judul';

  @override
  String get adminArticleContentHint => 'Konten artikel (markdown)';

  @override
  String get adminWikiArticlesHeader => 'Artikel Wiki';

  @override
  String get adminNoArticlesYet => 'Belum ada artikel';

  @override
  String get adminEditArticleTooltip => 'Edit artikel';

  @override
  String get adminDeleteArticleTooltip => 'Hapus artikel';

  @override
  String get adminSearchServersHint => 'Cari server berdasarkan nama...';

  @override
  String get adminSearchServersPrompt => 'Cari server di atas';

  @override
  String adminGrantBoostsTitle(String serverName) {
    return 'Berikan boost ke $serverName';
  }

  @override
  String get adminNumBoostsHint => 'Jumlah boost';

  @override
  String get adminGrantButton => 'Berikan';

  @override
  String get adminPositiveNumberError => 'Masukkan angka bulat positif.';

  @override
  String get adminGrantBoostsFailed => 'Gagal memberikan boost.';

  @override
  String adminBoostsGranted(
      int count, String serverName, int level, int activeCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Memberikan $count boost ke $serverName -- sekarang level $level ($activeCount aktif).',
    );
    return '$_temp0';
  }

  @override
  String adminMemberCountLabel(int count) {
    return '$count anggota';
  }

  @override
  String get adminGrantBoostsButtonLabel => 'Berikan Boost';

  @override
  String get parentalDashboardTitle => 'Keluarga';

  @override
  String get parentalDashboardCreateChildTitle => 'Buat Akun Anak';

  @override
  String get parentalDashboardUsernameHint => 'Nama pengguna';

  @override
  String get parentalDashboardEmailHint => 'Email';

  @override
  String get parentalDashboardPasswordHint => 'Kata sandi';

  @override
  String get parentalDashboardCreateChildExplanation =>
      'Ini membuat akun yang sepenuhnya diawasi: kanal berlabel akan diblokir, dan Anda bisa mengatur jam yang diizinkan serta melihat (tapi tidak membaca) teman dan server mereka.';

  @override
  String get parentalDashboardValidationError =>
      'Nama pengguna, email, dan kata sandi minimal 8 karakter diperlukan.';

  @override
  String get parentalDashboardCreateChildFailed =>
      'Tidak dapat membuat akun anak -- nama pengguna/email mungkin sudah digunakan.';

  @override
  String get parentalDashboardCreatingLabel => 'Membuat...';

  @override
  String get parentalDashboardNoChildren => 'Belum ada akun tertaut.';

  @override
  String get parentalDashboardSupervisedLabel => 'Akun diawasi';

  @override
  String get parentalDashboardUnknownUser => 'Tidak diketahui';

  @override
  String get childDetailFallbackTitle => 'Akun anak';

  @override
  String get childDetailTabFriends => 'Teman';

  @override
  String get childDetailTabServers => 'Server';

  @override
  String get childDetailTabSchedule => 'Jadwal';

  @override
  String get childDetailTabOverride => 'Pengecualian';

  @override
  String get childDetailNoFriends => 'Tidak ada teman.';

  @override
  String get childDetailUnknownUser => 'Tidak diketahui';

  @override
  String get childDetailRemoveFriendTooltip => 'Hapus teman';

  @override
  String get childDetailNoServers => 'Tidak berada di server mana pun.';

  @override
  String childDetailMemberCount(int count) {
    return '$count anggota';
  }

  @override
  String get childDetailRemoveServerTooltip => 'Hapus dari server';

  @override
  String get childDetailRestrictAccessTitle => 'Batasi akses ke jam tertentu';

  @override
  String get childDetailRestrictAccessSubtitle =>
      'Mati berarti akses tanpa batas kapan saja';

  @override
  String get childDetailTimezoneLabel => 'Zona waktu';

  @override
  String get childDetailMonday => 'Senin';

  @override
  String get childDetailTuesday => 'Selasa';

  @override
  String get childDetailWednesday => 'Rabu';

  @override
  String get childDetailThursday => 'Kamis';

  @override
  String get childDetailFriday => 'Jumat';

  @override
  String get childDetailSaturday => 'Sabtu';

  @override
  String get childDetailSunday => 'Minggu';

  @override
  String get childDetailNoAccessLabel => 'Tidak ada akses';

  @override
  String get childDetailToLabel => 'hingga';

  @override
  String get childDetailSavingLabel => 'Menyimpan...';

  @override
  String get childDetailSaveScheduleButton => 'Simpan Jadwal';

  @override
  String get childDetailScheduleSaved => 'Jadwal disimpan.';

  @override
  String get childDetailOverrideExplanation =>
      'Berikan akses sementara di luar jadwal normal -- berguna untuk pengecualian sekali tanpa mengubah jadwal mingguan.';

  @override
  String get childDetailReasonHint => 'Alasan (opsional)';

  @override
  String childDetailPlusMinutes(int minutes) {
    return '+$minutes mnt';
  }

  @override
  String childDetailPlusHours(int hours) {
    return '+$hours jam';
  }

  @override
  String get childDetailRevokeOverrideButton => 'Cabut Pengecualian Aktif';

  @override
  String get childDetailAccessGranted => 'Akses sementara diberikan.';

  @override
  String get childDetailOverrideRevoked => 'Pengecualian dicabut.';

  @override
  String get digitalGoodsTitle => 'Barang Digital';

  @override
  String get digitalGoodsMyProductsTitle => 'Produk Saya';

  @override
  String get digitalGoodsManageProductsTooltip => 'Kelola produk server ini';

  @override
  String get digitalGoodsSwitchToBrowseTooltip => 'Beralih ke Jelajahi';

  @override
  String get digitalGoodsCreateProductTooltip => 'Buat produk';

  @override
  String get digitalGoodsBrowseTab => 'Jelajahi';

  @override
  String get digitalGoodsMyListingsTab => 'Daftar Saya';

  @override
  String get digitalGoodsMyPurchasesTab => 'Pembelian Saya';

  @override
  String get digitalGoodsNoProductsYet => 'Belum ada produk';

  @override
  String get digitalGoodsNoProductsAvailable => 'Tidak ada produk tersedia';

  @override
  String get digitalGoodsCreateFirstProductHint =>
      'Buat produk pertama Anda untuk mulai berjualan';

  @override
  String get digitalGoodsCheckBackLater =>
      'Kembali lagi nanti untuk barang digital';

  @override
  String get digitalGoodsCreateProductButton => 'Buat Produk';

  @override
  String get digitalGoodsLicenseKeyBadge => 'Kunci Lisensi';

  @override
  String get digitalGoodsFileBadge => 'File';

  @override
  String get digitalGoodsAllServersBadge => 'Semua Server';

  @override
  String get digitalGoodsFreeForYou => 'Gratis untuk Anda';

  @override
  String get digitalGoodsFreeLabel => 'Gratis';

  @override
  String digitalGoodsSoldCount(int count) {
    return '$count terjual';
  }

  @override
  String get digitalGoodsKeysButton => 'Kunci';

  @override
  String get digitalGoodsGetForFree => 'Dapatkan Gratis';

  @override
  String digitalGoodsBuyForPrice(String price) {
    return 'Beli seharga $price';
  }

  @override
  String get digitalGoodsNoPurchasesYet => 'Belum ada pembelian';

  @override
  String get digitalGoodsUnknownProduct => 'Produk Tidak Diketahui';

  @override
  String digitalGoodsPurchasedOn(String date) {
    return 'Dibeli pada $date';
  }

  @override
  String get digitalGoodsCopyKeyTooltip => 'Salin kunci';

  @override
  String get digitalGoodsLicenseKeyCopied => 'Kunci lisensi disalin!';

  @override
  String digitalGoodsExpiresOn(String date) {
    return 'Berakhir $date';
  }

  @override
  String get digitalGoodsYourLicenseKeyTitle => 'Kunci Lisensi Anda';

  @override
  String get digitalGoodsCopyKeyButton => 'Salin Kunci';

  @override
  String get digitalGoodsCheckoutStripeNotConnected =>
      'Tidak dapat memulai checkout -- kreator ini mungkin belum menghubungkan Stripe.';

  @override
  String get digitalGoodsPurchaseComplete =>
      'Pembelian selesai! Temukan di Pembelian Saya.';

  @override
  String get digitalGoodsPurchasePending =>
      'Masih menunggu pembayaran itu -- akan muncul di Pembelian Saya setelah selesai.';

  @override
  String get digitalGoodsCreateProductTitle => 'Buat Produk';

  @override
  String get digitalGoodsEditProductTitle => 'Edit Produk';

  @override
  String get digitalGoodsProductTitleHint => 'Judul produk';

  @override
  String get digitalGoodsDescriptionHint => 'Deskripsi (opsional)';

  @override
  String get digitalGoodsPriceHint =>
      'Harga dalam USD (kosongkan untuk gratis)';

  @override
  String get digitalGoodsProductTypeLabel => 'Jenis produk';

  @override
  String get digitalGoodsFileDownloadOption => 'Unduhan file';

  @override
  String get digitalGoodsLicenseKeyOption => 'Kunci lisensi';

  @override
  String get digitalGoodsAvailabilityLabel => 'Ketersediaan';

  @override
  String get digitalGoodsThisServerOnlyOption => 'Hanya server ini';

  @override
  String get digitalGoodsAllKodaServersOption => 'Semua server Koda';

  @override
  String get digitalGoodsAfterCreatingKeysHint =>
      'Setelah membuat, gunakan tombol \"Kunci\" untuk mengunggah kunci lisensi Anda.';

  @override
  String get digitalGoodsProductFileLabel => 'File produk';

  @override
  String digitalGoodsFileWithSize(String fileName, String sizeMb) {
    return '$fileName (${sizeMb}MB)';
  }

  @override
  String get digitalGoodsRemoveFileTooltip => 'Hapus file';

  @override
  String get digitalGoodsUploadingLabel => 'Mengunggah...';

  @override
  String get digitalGoodsChooseFileButton => 'Pilih File';

  @override
  String get digitalGoodsReplaceFileButton => 'Ganti File';

  @override
  String get digitalGoodsChooseFileBeforeSaving =>
      'Pilih file untuk produk ini sebelum menyimpan.';

  @override
  String get digitalGoodsUploadLicenseKeysTitle => 'Unggah Kunci Lisensi';

  @override
  String get digitalGoodsPasteKeysHint => 'Tempel satu kunci per baris:';

  @override
  String get digitalGoodsKeyExampleHint => 'KEY-XXXX-XXXX\nKEY-YYYY-YYYY\n...';

  @override
  String get digitalGoodsUploadKeysButton => 'Unggah Kunci';

  @override
  String get digitalGoodsLicenseKeysUploaded => 'Kunci lisensi diunggah!';

  @override
  String get serverSubscriptionManageTitle => 'Kelola Langganan';

  @override
  String serverSubscriptionMemberTitle(String serverName) {
    return 'Langganan $serverName';
  }

  @override
  String get serverSubscriptionAddTierTooltip => 'Tambah tingkat';

  @override
  String get serverSubscriptionNoTiersYet => 'Belum ada tingkat langganan';

  @override
  String get serverSubscriptionCreateUpTo3Tiers =>
      'Buat hingga 3 tingkat untuk komunitas Anda';

  @override
  String get serverSubscriptionCreateFirstTierButton => 'Buat Tingkat Pertama';

  @override
  String get serverSubscriptionShowSubscriberCounts =>
      'Tampilkan jumlah pelanggan';

  @override
  String serverSubscriptionPricePerMonth(String price) {
    return '$price/bln';
  }

  @override
  String serverSubscriptionActiveSubscriberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pelanggan aktif',
    );
    return '$_temp0';
  }

  @override
  String get serverSubscriptionRoleAutoAssigned => 'Peran diberikan otomatis';

  @override
  String serverSubscriptionDiscountPercent(int discount) {
    return 'Diskon marketplace $discount%';
  }

  @override
  String get serverSubscriptionNoTiersMember =>
      'Server ini tidak memiliki tingkat langganan';

  @override
  String get serverSubscriptionActiveSubscriberBadge => 'Pelanggan Aktif';

  @override
  String serverSubscriptionExpiresOn(String date) {
    return 'Berakhir $date';
  }

  @override
  String get serverSubscriptionExclusiveRolePerk => 'Peran pelanggan eksklusif';

  @override
  String serverSubscriptionDiscountPerk(int discount) {
    return 'Diskon $discount% untuk pembelian marketplace';
  }

  @override
  String get serverSubscriptionSubscriberOnlyChannelsPerk =>
      'Kanal khusus pelanggan';

  @override
  String get serverSubscriptionCurrentlySubscribed => 'Sedang Berlangganan';

  @override
  String serverSubscriptionSubscribeForPrice(String price) {
    return 'Berlangganan seharga $price/bln';
  }

  @override
  String get serverSubscriptionCreateTierTitle => 'Buat Tingkat';

  @override
  String get serverSubscriptionEditTierTitle => 'Edit Tingkat';

  @override
  String get serverSubscriptionTierNameHint =>
      'Nama tingkat (mis. Fan, Supporter, VIP)';

  @override
  String get serverSubscriptionDescriptionHint => 'Deskripsi (opsional)';

  @override
  String get serverSubscriptionPriceHint => 'Harga per bulan (USD)';

  @override
  String get serverSubscriptionDiscountLabel => '% Diskon marketplace';

  @override
  String get serverSubscriptionPositionLabel => 'Posisi';

  @override
  String serverSubscriptionTierOption(int position) {
    return 'Tingkat $position';
  }

  @override
  String get serverSubscriptionGrantsRoleLabel =>
      'Memberikan peran saat berlangganan — opsional';

  @override
  String get serverSubscriptionRoleFallback => 'peran';

  @override
  String get serverSubscriptionRoleAutoAssignExplanation =>
      'Otomatis diberikan kepada anggota begitu mereka berlangganan, dan dicabut begitu langganan mereka berakhir.';

  @override
  String get serverSubscriptionTierCreatedConnectStripe =>
      'Tingkat dibuat -- hubungkan Stripe di Marketplace → Kreator sebelum anggota dapat berlangganan.';

  @override
  String get serverSubscriptionDeleteTierTitle => 'Hapus Tingkat';

  @override
  String serverSubscriptionDeleteTierConfirm(String tierName) {
    return 'Hapus \"$tierName\"? Pelanggan yang ada akan tetap memiliki akses hingga masa berlaku berakhir.';
  }

  @override
  String serverSubscriptionSubscribeToTierTitle(String tierName) {
    return 'Berlangganan $tierName';
  }

  @override
  String get serverSubscriptionMonthlySubscriptionLabel => 'Langganan bulanan';

  @override
  String get serverSubscriptionServerBankEarnsLabel => 'Bank server memperoleh';

  @override
  String serverSubscriptionPointsLabel(int points) {
    return '$points poin';
  }

  @override
  String get serverSubscriptionPaymentSecureNote =>
      'Pembayaran diproses dengan aman oleh Stripe';

  @override
  String get serverSubscriptionSubscribeButton => 'Berlangganan';

  @override
  String get serverSubscriptionCheckoutStripeNotConnected =>
      'Tidak dapat memulai checkout -- pemilik server ini mungkin belum menghubungkan Stripe.';

  @override
  String get serverSubscriptionSubscribed => 'Berlangganan!';

  @override
  String get serverSubscriptionSubscriptionPending =>
      'Masih menunggu pembayaran itu -- akan aktif setelah selesai.';

  @override
  String tipDialogTipUsernameTitle(String username) {
    return 'Beri Tip ke $username';
  }

  @override
  String get tipDialogSelectAmountLabel => 'Pilih jumlah';

  @override
  String get tipDialogMessageHint => 'Tambah pesan (opsional)';

  @override
  String get tipDialogYouPayLabel => 'Anda membayar';

  @override
  String tipDialogUserReceivesLabel(String username) {
    return '$username menerima';
  }

  @override
  String get tipDialogSendTipButton => 'Kirim Tip';

  @override
  String get tipDialogFailedToSendTip =>
      'Gagal mengirim tip. Kreator mungkin belum terhubung ke Stripe.';

  @override
  String get tipDialogCouldNotStartCheckout =>
      'Tidak dapat memulai checkout. Coba lagi sesaat lagi.';

  @override
  String get tipDialogTipSent => 'Tip terkirim!';

  @override
  String get tipDialogTipPending =>
      'Masih menunggu pembayaran itu -- akan terkirim setelah selesai.';

  @override
  String get tipDialogUnknownUser => 'Tidak diketahui';

  @override
  String get marketplaceTitle => 'Marketplace';

  @override
  String get marketplaceCreatorPayoutsTitle => 'Pembayaran Kreator';

  @override
  String get marketplaceReceiveTipsSubtitle =>
      'Terima tip langsung melalui Stripe';

  @override
  String get marketplaceTabServerBank => 'Bank Server';

  @override
  String get marketplaceTabDigitalGoods => 'Barang Digital';

  @override
  String get marketplaceTabMerch => 'Merch';

  @override
  String get marketplaceTabSubscription => 'Langganan';

  @override
  String get marketplaceTabRevenue => 'Pendapatan';

  @override
  String get marketplaceSelectServerSubscription =>
      'Pilih server untuk melihat langganannya';

  @override
  String get marketplaceSelectServerBank =>
      'Pilih server untuk melihat banknya';

  @override
  String get marketplaceSelectServerRevenue =>
      'Pilih server untuk melihat pendapatannya';

  @override
  String get marketplaceStripeAccountStatus => 'Akun Stripe';

  @override
  String get marketplaceOnboardingCompleteStatus => 'Onboarding selesai';

  @override
  String get marketplaceAcceptingPaymentsStatus => 'Menerima pembayaran';

  @override
  String get marketplaceConnectStripeButton => 'Hubungkan Akun Stripe';

  @override
  String get marketplaceCompleteStripeOnboardingButton =>
      'Selesaikan Onboarding Stripe';

  @override
  String get marketplaceRefreshStatusButton => 'Segarkan Status';

  @override
  String get marketplaceReadyToReceiveTips => 'Anda siap menerima tip!';

  @override
  String get marketplaceHowItWorksTitle => 'Cara kerjanya';

  @override
  String get marketplaceHowItWorksStep1 => 'Hubungkan akun Stripe Anda';

  @override
  String get marketplaceHowItWorksStep2 => 'Selesaikan verifikasi identitas';

  @override
  String get marketplaceHowItWorksStep3 => 'Terima tip langsung ke bank Anda';

  @override
  String get marketplaceProcessingFeeNote =>
      'Koda mengenakan biaya pemrosesan 5%. Biaya ini masuk ke bank server Anda sebagai poin.';

  @override
  String get marketplaceOnlyManagersCanViewBank =>
      'Hanya pemilik server atau seseorang dengan izin Kelola Marketplace yang dapat melihat Bank Server.';

  @override
  String marketplaceServerBoosted(String serverName) {
    return '$serverName di-boost!';
  }

  @override
  String marketplaceEmojiSlotsText(int limit) {
    return '$limit slot emoji khusus';
  }

  @override
  String get marketplaceServerFallback => 'Server';

  @override
  String marketplacePointsBalance(int balance) {
    return '$balance poin';
  }

  @override
  String marketplaceInActivity(String amount) {
    return '$amount dalam aktivitas';
  }

  @override
  String get marketplacePointsEarnedExplanation =>
      'Poin diperoleh dari biaya pemrosesan 5% pada tip dan langganan di server ini. Gunakan poin untuk membuka peningkatan server.';

  @override
  String get marketplaceServerBoostsTitle => 'Boost Server';

  @override
  String marketplaceLevelLabel(int level) {
    return 'Level $level';
  }

  @override
  String marketplaceActiveBoostsSummary(int count, String emojiSlots) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count boost aktif',
    );
    return '$_temp0 -- $emojiSlots';
  }

  @override
  String marketplaceMoreBoostsToReachLevel(int more, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      more,
      locale: localeName,
      other: '$more boost lagi untuk mencapai level $level',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceUnlockBackgroundSuffix =>
      ' dan buka latar belakang server khusus';

  @override
  String get marketplaceUnlockIconBorderSuffix =>
      ' dan buka bingkai ikon server khusus';

  @override
  String marketplaceYouHaveBoostTokens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Anda memiliki $count token boost tersedia.',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceBoostTokensFromPulse =>
      'Token boost berasal dari langganan Pulse (1/bulan). Berlangganan di tab Langganan untuk mendapatkannya.';

  @override
  String get marketplaceBoostingLabel => 'Mem-boost...';

  @override
  String get marketplaceBoostThisServerButton => 'Boost Server Ini';

  @override
  String get marketplaceComingSoonUpgradesTitle =>
      'Segera hadir — Peningkatan server';

  @override
  String get marketplaceSpendPointsList =>
      'Gunakan poin bank server untuk:\n• Domain server khusus\n• Batas anggota yang ditingkatkan\n• Dukungan prioritas\n• Lencana server eksklusif';

  @override
  String get marketplaceSourceTip => 'Tip';

  @override
  String get marketplaceSourceSubscription => 'Langganan Koda';

  @override
  String get marketplaceSourceServerSubscription => 'Langganan Server';

  @override
  String get marketplaceSourceDigitalProduct => 'Barang Digital';

  @override
  String get marketplaceSourceStageTicket => 'Tiket Stage';

  @override
  String get marketplaceSourcePrintfulOrder => 'Pesanan Merch';

  @override
  String get marketplaceJustNow => 'baru saja';

  @override
  String marketplaceMinutesAgo(int minutes) {
    return '${minutes}m lalu';
  }

  @override
  String marketplaceHoursAgo(int hours) {
    return '${hours}j lalu';
  }

  @override
  String marketplaceDaysAgo(int days) {
    return '${days}h lalu';
  }

  @override
  String get marketplaceOnlyManagersCanViewRevenue =>
      'Hanya anggota yang dapat mengelola marketplace yang dapat melihat pendapatan server ini.';

  @override
  String get marketplaceBalanceLabel => 'Saldo';

  @override
  String get marketplaceLifetimeEarnedLabel => 'Total Diperoleh';

  @override
  String get marketplaceLast30DaysTitle => '30 Hari Terakhir';

  @override
  String get marketplaceRevenueBySourceTitle => 'Pendapatan berdasarkan Sumber';

  @override
  String get marketplaceNoRevenueYet => 'Belum ada pendapatan.';

  @override
  String marketplaceTransactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count transaksi',
    );
    return '$_temp0';
  }

  @override
  String get marketplaceRecentTransactionsTitle => 'Transaksi Terbaru';

  @override
  String get marketplaceNoTransactionsYet => 'Belum ada transaksi.';

  @override
  String get marketplaceNoActivityYet => 'Belum ada aktivitas';

  @override
  String marketplaceBarTooltipWithAmount(String date, String amount) {
    return '$date: $amount';
  }

  @override
  String printfulMerchSyncedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Menyinkronkan $count produk dari Printful',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchSyncFailed =>
      'Tidak dapat menyinkronkan dengan Printful -- periksa koneksi di pengaturan Merch.';

  @override
  String get printfulMerchSelectServer =>
      'Pilih server untuk melihat merch-nya';

  @override
  String get printfulMerchManageCatalogTitle => 'Kelola Katalog Merch';

  @override
  String get printfulMerchTitle => 'Merch';

  @override
  String get printfulMerchSyncingLabel => 'Menyinkronkan...';

  @override
  String get printfulMerchSyncCatalogButton => 'Sinkronkan Katalog';

  @override
  String get printfulMerchSwitchToBrowseTooltip => 'Beralih ke Jelajahi';

  @override
  String get printfulMerchManageTooltip => 'Kelola merch server ini';

  @override
  String get printfulMerchNothingSyncedYet => 'Belum ada yang disinkronkan';

  @override
  String get printfulMerchNoMerchAvailable => 'Belum ada merch tersedia';

  @override
  String get printfulMerchSyncHint =>
      'Sinkronkan toko Printful Anda untuk menarik katalog produk Anda';

  @override
  String get printfulMerchCheckBackLater =>
      'Kembali lagi nanti untuk merch dari server ini';

  @override
  String get printfulMerchOutOfStock => 'Stok habis';

  @override
  String printfulMerchFromPriceOptions(String price, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mulai $price • $count opsi',
    );
    return '$_temp0';
  }

  @override
  String get printfulMerchViewButton => 'Lihat';

  @override
  String printfulMerchPayoutTo(String username) {
    return 'Pembayaran ke: $username';
  }

  @override
  String get printfulMerchPayoutToYou => 'Pembayaran ke: Anda';

  @override
  String get printfulMerchPayoutChangeButton => 'Ubah';

  @override
  String get printfulMerchPayoutDialogTitle => 'Penerima Pembayaran';

  @override
  String get printfulMerchPayoutDialogBody =>
      'Arahkan bagian hasil pesanan item ini ke pengguna lain, bukan ke Anda -- mereka perlu menghubungkan akun Stripe mereka sendiri dan menyelesaikan onboarding sebelum ada yang bisa membelinya.';

  @override
  String get printfulMerchPayoutUsernameHint => 'Nama pengguna';

  @override
  String get printfulMerchPayoutLookupButton => 'Cari';

  @override
  String get printfulMerchPayoutUserNotFound =>
      'Tidak ditemukan pengguna dengan nama itu.';

  @override
  String printfulMerchPayoutResolvedAs(String username) {
    return 'Ditemukan: $username';
  }

  @override
  String get printfulMerchPayoutResetButton => 'Atur ulang ke saya';

  @override
  String get printfulMerchCartTooltip => 'Keranjang';

  @override
  String printfulMerchAddedToCart(String productName) {
    return '$productName ditambahkan ke keranjang';
  }

  @override
  String get printfulMerchQuantityLabel => 'Jumlah';

  @override
  String get printfulMerchDecreaseQuantityTooltip => 'Kurangi jumlah';

  @override
  String get printfulMerchIncreaseQuantityTooltip => 'Tambah jumlah';

  @override
  String get printfulMerchAddToCartButton => 'Tambah ke Keranjang';

  @override
  String get printfulMerchOptionLabel => 'Opsi';

  @override
  String printfulMerchVariantPriceOption(String name, String price) {
    return '$name -- $price';
  }

  @override
  String get printfulMerchStyleLabel => 'Gaya';

  @override
  String get printfulMerchSizeLabel => 'Ukuran';

  @override
  String get printfulMerchYourCartTitle => 'Keranjang Anda';

  @override
  String get printfulMerchCartEmpty => 'Keranjang Anda kosong.';

  @override
  String get printfulMerchSubtotalLabel => 'Subtotal';

  @override
  String get printfulMerchCheckoutLabel => 'Checkout';

  @override
  String get printfulMerchRemoveFromCartTooltip => 'Hapus dari keranjang';

  @override
  String get printfulMerchFillShippingAddressFirst =>
      'Isi alamat pengiriman Anda terlebih dahulu.';

  @override
  String get printfulMerchCouldNotGetShippingRates =>
      'Tidak dapat memperoleh tarif pengiriman untuk alamat itu.';

  @override
  String get printfulMerchCouldNotStartCheckout =>
      'Tidak dapat memulai checkout. Coba lagi sesaat lagi.';

  @override
  String get printfulMerchOrderPlaced => 'Pesanan dibuat!';

  @override
  String get printfulMerchOrderPending =>
      'Masih menunggu pembayaran itu -- akan dibuat setelah selesai.';

  @override
  String get printfulMerchShippingSpeedLabel => 'Kecepatan pengiriman';

  @override
  String printfulMerchBusinessDaysRange(int min, int max) {
    return '$min-$max hari kerja';
  }

  @override
  String get printfulMerchGetShippingQuoteButton =>
      'Dapatkan Kuotasi Pengiriman';

  @override
  String get printfulMerchPayButton => 'Bayar';

  @override
  String get kodaMarketplaceTitle => 'Koda Marketplace';

  @override
  String get kodaMarketplaceTabSubscriptions => 'Langganan';

  @override
  String get kodaMarketplaceTabBoosts => 'Boost';

  @override
  String get kodaMarketplaceTabDiscover => 'Temukan';

  @override
  String get kodaMarketplaceTierFreeName => 'Gratis';

  @override
  String get kodaMarketplaceTierSparkName => 'Spark';

  @override
  String get kodaMarketplaceTierPulseName => 'Pulse';

  @override
  String kodaMarketplaceExpiresOn(String date) {
    return 'Berakhir $date';
  }

  @override
  String get kodaMarketplaceUpgradeForPerks =>
      'Tingkatkan untuk keuntungan eksklusif';

  @override
  String kodaMarketplaceBoostTokensAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count token boost tersedia',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceGiftTokenHint =>
      'Hadiahkan token ke server mana pun tempat Anda berada dari tab Bank Server-nya';

  @override
  String get kodaMarketplaceSparkPerkAvatarFrame => 'Bingkai avatar khusus';

  @override
  String get kodaMarketplaceSparkPerkBadge => 'Lencana Spark di profil';

  @override
  String get kodaMarketplaceSparkPerkFileLimit =>
      'Batas unggah file yang ditingkatkan (50MB)';

  @override
  String get kodaMarketplaceSparkPerkVoiceQuality => 'Kualitas suara prioritas';

  @override
  String get kodaMarketplacePulsePerkEverythingInSpark =>
      'Semua yang ada di Spark';

  @override
  String get kodaMarketplacePulsePerkAnimatedFrame => 'Bingkai avatar animasi';

  @override
  String get kodaMarketplacePulsePerkBadge => 'Lencana Pulse di profil';

  @override
  String get kodaMarketplacePulsePerkFileLimit => 'Batas unggah file 100MB';

  @override
  String get kodaMarketplacePulsePerkBoostToken =>
      '1 token boost server per bulan';

  @override
  String kodaMarketplacePricePerMonth(String price) {
    return '$price/bln';
  }

  @override
  String get kodaMarketplaceCurrentPlanLabel => 'Paket Saat Ini';

  @override
  String kodaMarketplaceGetTierButton(String name) {
    return 'Dapatkan $name';
  }

  @override
  String kodaMarketplaceGiftTierButton(String name) {
    return 'Hadiahkan $name';
  }

  @override
  String kodaMarketplaceGiftTierTitle(String tier) {
    return 'Hadiahkan $tier';
  }

  @override
  String kodaMarketplaceSubscribeTierTitle(String tier) {
    return 'Berlangganan $tier';
  }

  @override
  String get kodaMarketplaceGiftUsernameLabel =>
      'Nama pengguna penerima hadiah:';

  @override
  String get kodaMarketplaceUsernameHint => 'Nama pengguna';

  @override
  String get kodaMarketplaceSubscriptionRowLabel => 'Langganan';

  @override
  String get kodaMarketplaceTotalLabel => 'Total';

  @override
  String get kodaMarketplacePaymentSecureNote =>
      'Pembayaran diproses dengan aman oleh Stripe';

  @override
  String get kodaMarketplaceProceedToPaymentButton => 'Lanjutkan ke Pembayaran';

  @override
  String get kodaMarketplaceUserNotFound => 'Pengguna tidak ditemukan';

  @override
  String get kodaMarketplaceCouldNotStartCheckout =>
      'Tidak dapat memulai checkout. Coba lagi sesaat lagi.';

  @override
  String get kodaMarketplaceSubscriptionActive => 'Langganan aktif!';

  @override
  String get kodaMarketplaceSubscriptionPending =>
      'Masih menunggu pembayaran itu -- akan aktif setelah selesai.';

  @override
  String get kodaMarketplaceBoostPurchased => 'Boost dibeli!';

  @override
  String get kodaMarketplaceBoostPending =>
      'Masih menunggu pembayaran itu -- akan siap setelah selesai.';

  @override
  String kodaMarketplaceTokenCountAvailable(int count) {
    return '$count tersedia';
  }

  @override
  String get kodaMarketplaceBuyABoostTitle => 'Beli Boost';

  @override
  String get kodaMarketplaceBoostPurchaseExplanation =>
      'Pembelian satu kali -- pelanggan Pulse juga mendapat satu token gratis setiap perpanjangan, yang tetap menjadi pilihan lebih baik jika Anda sering melakukan boost.';

  @override
  String kodaMarketplaceBuyABoostButton(String price) {
    return 'Beli Boost -- $price';
  }

  @override
  String get kodaMarketplaceDiscoverEmptyState =>
      'Belum ada server yang bergabung dengan Koda Marketplace. Pemilik server dapat mengaktifkan ini di pengaturan Kustomisasi server mereka.';

  @override
  String get kodaMarketplaceFeaturedThisWeekHeader => 'UNGGULAN MINGGU INI';

  @override
  String get kodaMarketplaceAllListedServersHeader => 'SEMUA SERVER TERDAFTAR';

  @override
  String get kodaMarketplaceFeaturedItemsHeader => 'ITEM UNGGULAN';

  @override
  String get kodaMarketplaceAllItemsHeader => 'SEMUA ITEM';

  @override
  String get kodaMarketplaceServerFallback => 'Server';

  @override
  String kodaMarketplaceMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anggota',
    );
    return '$_temp0';
  }

  @override
  String get kodaMarketplaceVisitStore => 'Kunjungi Toko';

  @override
  String get calendarFallbackTitle => 'Kalender';

  @override
  String get calendarAskVispTooltip => 'Tanya Visp';

  @override
  String get calendarCreateEventTooltip => 'Buat Acara';

  @override
  String get calendarPreviousMonthTooltip => 'Bulan sebelumnya';

  @override
  String get calendarNextMonthTooltip => 'Bulan berikutnya';

  @override
  String get calendarTodayButton => 'Hari Ini';

  @override
  String get calendarWeekdaySun => 'Min';

  @override
  String get calendarWeekdayMon => 'Sen';

  @override
  String get calendarWeekdayTue => 'Sel';

  @override
  String get calendarWeekdayWed => 'Rab';

  @override
  String get calendarWeekdayThu => 'Kam';

  @override
  String get calendarWeekdayFri => 'Jum';

  @override
  String get calendarWeekdaySat => 'Sab';

  @override
  String get calendarTodaySuffix => ', hari ini';

  @override
  String calendarEventCountSuffix(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ', $count acara',
    );
    return '$_temp0';
  }

  @override
  String get calendarSelectADay => 'Pilih hari';

  @override
  String get calendarNoEvents => 'Tidak ada acara';

  @override
  String get calendarSubscribeTooltip => 'Berlangganan';

  @override
  String get calendarUnsubscribeTooltip => 'Berhenti berlangganan';

  @override
  String calendarRepeatsLabel(String recurrence) {
    return 'Berulang $recurrence';
  }

  @override
  String get calendarTicketOwned => 'Tiket dimiliki';

  @override
  String calendarTicketPrice(String price) {
    return 'Tiket $price';
  }

  @override
  String get calendarDeleteEventTitle => 'Hapus Acara';

  @override
  String calendarDeleteEventConfirm(String title) {
    return 'Hapus \"$title\"? Ini tidak dapat dibatalkan.';
  }

  @override
  String get calendarEditEventTitle => 'Edit Acara';

  @override
  String get calendarCreateEventTitle => 'Buat Acara';

  @override
  String get calendarEventTitleHint => 'Judul acara';

  @override
  String get calendarDescriptionHint => 'Deskripsi (opsional)';

  @override
  String get calendarLocationHint => 'Lokasi (opsional)';

  @override
  String calendarStartLabel(String timezone) {
    return 'Mulai ($timezone)';
  }

  @override
  String calendarStartDateTimeSemanticLabel(String formatted) {
    return 'Tanggal dan waktu mulai, $formatted';
  }

  @override
  String calendarEndOptionalLabel(String timezone) {
    return 'Selesai — opsional ($timezone)';
  }

  @override
  String calendarEndDateTimeSemanticLabel(String formatted) {
    return 'Tanggal dan waktu selesai, $formatted';
  }

  @override
  String get calendarNotSetLabel => 'belum diatur';

  @override
  String get calendarTapToSetEndTime => 'Ketuk untuk mengatur waktu selesai';

  @override
  String get calendarRecurrenceLabel => 'Pengulangan';

  @override
  String get calendarRecurrenceNone => 'Tidak berulang';

  @override
  String get calendarRecurrenceDaily => 'Harian';

  @override
  String get calendarRecurrenceWeekly => 'Mingguan';

  @override
  String get calendarRecurrenceMonthly => 'Bulanan';

  @override
  String get calendarColorLabel => 'Warna';

  @override
  String calendarColorSwatchLabel(String hex) {
    return 'Warna $hex';
  }

  @override
  String get calendarTicketPriceLabel => 'Harga tiket — opsional';

  @override
  String get calendarLinkStageChannelLabel =>
      'Tautkan ke kanal stage — opsional';

  @override
  String get calendarStageChannelFallback => 'stage';

  @override
  String get discordImportFetchError => 'Tidak dapat mengambil template.';

  @override
  String get discordImportApplyError =>
      'Gagal menerapkan template. Silakan coba lagi.';

  @override
  String get discordImportTitle => 'Impor Template Discord';

  @override
  String get discordImportDescription =>
      'Tempel tautan discord.new atau kode template untuk mengimpor peran, kategori, dan kanal ke server ini.';

  @override
  String get discordImportCodeHint => 'discord.new/ABC123 atau kode template';

  @override
  String get discordImportPreviewButton => 'Pratinjau';

  @override
  String get discordImportTemplateFallback => 'Template';

  @override
  String discordImportRolesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count peran',
    );
    return '$_temp0';
  }

  @override
  String discordImportCategoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kategori',
    );
    return '$_temp0';
  }

  @override
  String discordImportChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kanal',
    );
    return '$_temp0';
  }

  @override
  String get discordImportReplaceStructureLabel => 'GANTI STRUKTUR YANG ADA';

  @override
  String get discordImportReplaceWarning =>
      'Semua kanal, kategori, dan peran yang ada akan dihapus secara permanen.';

  @override
  String get discordImportAddDescription =>
      'Template akan ditambahkan ke struktur server Anda yang sudah ada.';

  @override
  String get discordImportReplaceConfirmTitle => 'Ganti struktur server?';

  @override
  String get discordImportReplaceConfirmBody =>
      'Ini akan menghapus secara permanen SEMUA kanal, kategori, dan peran yang ada sebelum mengimpor. Ini tidak dapat dibatalkan.';

  @override
  String get discordImportYesReplace => 'Ya, Ganti';

  @override
  String get discordImportReplaceAndImportButton => 'Ganti & Impor Template';

  @override
  String get discordImportAddToServerButton => 'Tambahkan Template ke Server';

  @override
  String get thresholdModConfigureTitle => 'Konfigurasi Moderasi Ambang';

  @override
  String get thresholdModConfigureExplanation =>
      'Pilih moderator tepercaya dan berapa banyak dari mereka yang harus setuju sebelum salah satu dari mereka dapat mendekripsi satu epoch riwayat kanal. Bahkan Anda pun tidak mendapat kunci sepihak -- Anda hanya dikecualikan jika Anda juga ada di daftar ini.';

  @override
  String get thresholdModThresholdLabel => 'Ambang:';

  @override
  String get thresholdModDecreaseThresholdTooltip => 'Kurangi ambang';

  @override
  String get thresholdModIncreaseThresholdTooltip => 'Tambah ambang';

  @override
  String thresholdModOfModeratorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dari $count moderator',
    );
    return '$_temp0';
  }

  @override
  String get thresholdModRequestDecryptTitle => 'Minta Dekripsi Ambang';

  @override
  String get thresholdModChannelLabel => 'Kanal';

  @override
  String get thresholdModReasonHint =>
      'Alasan -- ditampilkan ke setiap moderator yang ditunjuk';

  @override
  String get thresholdModRequestButton => 'Minta';

  @override
  String get thresholdModShareRelayed => 'Bagian diteruskan ke pemohon.';

  @override
  String get thresholdModNotEnoughShares =>
      'Belum cukup bagian diteruskan -- coba lagi setelah lebih banyak moderator meneruskan bagian mereka.';

  @override
  String thresholdModEpochMessagesTitle(int epoch, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pesan',
    );
    return 'Epoch $epoch -- $_temp0';
  }

  @override
  String get thresholdModNoDecryptableMessages =>
      'Tidak ada pesan yang dapat didekripsi di epoch ini.';

  @override
  String get thresholdModExplanation =>
      'Dekripsi nyata riwayat kanal, yang dikunci pada persetujuan aktif beberapa moderator yang ditunjuk -- tidak pernah satu orang saja, bahkan bukan pemilik server. Hanya pernah membuka satu epoch penuh (semua yang dikirim sejak perubahan keanggotaan terakhir), tidak pernah satu pesan saja.';

  @override
  String thresholdModEnabledStatus(int count, int threshold) {
    return 'Diaktifkan -- $count moderator, ambang $threshold';
  }

  @override
  String get thresholdModNotConfigured => 'Belum dikonfigurasi';

  @override
  String get thresholdModReconfigureButton => 'Konfigurasi Ulang';

  @override
  String get thresholdModEnableButton => 'Aktifkan';

  @override
  String get thresholdModNotEnabledForServer =>
      'Moderasi ambang tidak diaktifkan untuk server ini.';

  @override
  String get thresholdModEnabledNotDesignated =>
      'Diaktifkan untuk server ini. Anda bukan salah satu moderator yang ditunjuk.';

  @override
  String get thresholdModRequestsLabel => 'Permintaan';

  @override
  String get thresholdModRequestDecryptButton => 'Minta Dekripsi';

  @override
  String get thresholdModNoActiveRequests => 'Tidak ada permintaan aktif.';

  @override
  String thresholdModRequestRowLabel(
      String channelName, int epoch, String status) {
    return '#$channelName -- epoch $epoch -- $status';
  }

  @override
  String get thresholdModStatusPending => 'tertunda';

  @override
  String get thresholdModStatusApproved => 'disetujui';

  @override
  String get thresholdModApproveButton => 'Setujui';

  @override
  String get thresholdModRelayShareButton => 'Teruskan Bagian Saya';

  @override
  String get thresholdModTryReconstructButton => 'Coba Rekonstruksi';

  @override
  String get roleSelectNoRolesAvailable =>
      'Tidak ada peran yang dapat ditetapkan sendiri.';

  @override
  String get roleSelectInstructions =>
      'Pilih peran yang Anda inginkan. Ketuk peran untuk menambah atau menghapusnya.';

  @override
  String get rulesScreenAcceptError =>
      'Tidak dapat menyetujui aturan. Coba lagi.';

  @override
  String get rulesScreenSubtitle => 'Aturan Server';

  @override
  String get rulesScreenScrollToRead =>
      'Gulir ke bawah untuk membaca semua aturan';

  @override
  String get rulesScreenAcceptDisclaimer =>
      'Dengan mengklik Setuju, Anda setuju untuk mengikuti aturan ini.\nPelanggaran dapat mengakibatkan pengeluaran dari server.';

  @override
  String get rulesScreenAcceptButton => 'Saya Menyetujui Aturan';

  @override
  String get rulesScreenReadAllToContinue =>
      'Baca semua aturan untuk melanjutkan';

  @override
  String get galleryNewPostTitle => 'Postingan Baru';

  @override
  String get galleryChooseFileButton => 'Pilih File';

  @override
  String get galleryOrDivider => 'atau';

  @override
  String get galleryPasteUrlHint => 'Tempel URL gambar/video';

  @override
  String get galleryTypeLabel => 'Jenis';

  @override
  String get galleryImageOption => 'Gambar';

  @override
  String get galleryVideoOption => 'Video';

  @override
  String get galleryCaptionHint => 'Keterangan (opsional)';

  @override
  String get galleryPostButton => 'Posting';

  @override
  String get galleryNewCollectionTitle => 'Koleksi Baru';

  @override
  String get galleryCollectionNameHint => 'Nama koleksi';

  @override
  String galleryDeleteCollectionConfirm(String collectionName) {
    return 'Hapus \"$collectionName\"? Postingan di dalamnya akan menjadi tidak terkumpul.';
  }

  @override
  String get galleryFeedTab => 'Feed';

  @override
  String get galleryCollectionsTab => 'Koleksi';

  @override
  String get galleryNoPostsYet => 'Belum ada postingan';

  @override
  String get galleryNoCollectionsYet => 'Belum ada koleksi';

  @override
  String get gallerySelectACollection => 'Pilih koleksi';

  @override
  String get galleryNoPostsInCollection => 'Tidak ada postingan di koleksi ini';

  @override
  String get galleryAddPostButton => 'Tambah Postingan';

  @override
  String voiceScreenScreenShareFailed(String error) {
    return 'Berbagi layar gagal: $error';
  }

  @override
  String voiceScreenUsersVolumeTitle(String username) {
    return 'Volume $username';
  }

  @override
  String get voiceScreenVolumeOnlyAffectsYou =>
      'Hanya memengaruhi apa yang Anda dengar -- perangkat ini, panggilan ini.';

  @override
  String get voiceScreenResetVolumeButton => 'Atur Ulang';

  @override
  String voiceScreenCouldNotConnect(String error) {
    return 'Tidak dapat terhubung: $error';
  }

  @override
  String get voiceScreenYourScreenTapFullscreen =>
      'Layar Anda, ketuk untuk melihat layar penuh';

  @override
  String get voiceScreenYourScreenLabel => 'Layar Anda';

  @override
  String get voiceScreenTapToClose => 'Ketuk untuk menutup';

  @override
  String voiceScreenParticipantYouLabel(String name) {
    return '$name (Anda)';
  }

  @override
  String get voiceScreenSpeakingSuffix => ', berbicara';

  @override
  String get voiceScreenCameraOnSuffix => ', kamera menyala';

  @override
  String get voiceScreenActivateToPopOut =>
      ', aktifkan untuk melepaskan ke jendela terpisah';

  @override
  String get voiceScreenShowVarmTooltip => 'Tampilkan VARM';

  @override
  String get voiceScreenHideVarmTooltip => 'Sembunyikan VARM';

  @override
  String get voiceScreenShowChatTooltip => 'Tampilkan obrolan';

  @override
  String get voiceScreenHideChatTooltip => 'Sembunyikan obrolan';

  @override
  String get voiceScreenStartCameraTooltip => 'Nyalakan kamera';

  @override
  String get voiceScreenStopCameraTooltip => 'Matikan kamera';

  @override
  String get voiceScreenShareScreenTooltip => 'Bagikan layar';

  @override
  String get voiceScreenStopSharingTooltip => 'Berhenti berbagi';

  @override
  String get voiceScreenPopOutTooltip => 'Lepaskan suara ke jendela terpisah';

  @override
  String get voiceScreenCouldNotPopOut => 'Tidak dapat melepaskan suara.';

  @override
  String get voiceScreenLeaveVoiceTooltip => 'Tinggalkan Suara';

  @override
  String get voiceScreenPinTooltip => 'Sematkan (tetap terbuka)';

  @override
  String get voiceScreenUnpinTooltip => 'Lepas sematan';

  @override
  String get voiceScreenSizeSmall => 'Kecil (320x180)';

  @override
  String get voiceScreenSizeMedium => 'Sedang (480x270)';

  @override
  String get voiceScreenSizeLarge => 'Besar (640x360)';

  @override
  String get voiceScreenSizeXl => 'XL (960x540)';

  @override
  String voiceBarConnectedSemanticLabel(String channelName, int count) {
    return '$channelName, $count terhubung';
  }

  @override
  String get voiceBarSpeakingSuffix => ', Anda sedang berbicara';

  @override
  String voiceBarConnectedTapToExpand(int count) {
    return '$count terhubung · ketuk untuk memperluas';
  }

  @override
  String get voiceBarStartCameraTooltip => 'Nyalakan kamera';

  @override
  String get voiceBarStopCameraTooltip => 'Matikan kamera';

  @override
  String get voiceBarLeaveVoiceTooltip => 'Tinggalkan Suara';

  @override
  String get popOutVideoFallbackTitle => 'Suara';

  @override
  String get popOutVideoMissingTokenError => 'Token atau URL tidak ada';

  @override
  String get popOutVideoConnectionTimedOut =>
      'Koneksi habis waktu setelah 15 detik';

  @override
  String popOutVideoErrorLabel(String error) {
    return 'Kesalahan: $error';
  }

  @override
  String get popOutVideoNoParticipants => 'Tidak ada peserta';

  @override
  String get varmWidgetLabel => 'VARM';

  @override
  String get stageFallbackTitle => 'Stage';

  @override
  String get stageCouldNotJoin => 'Tidak dapat bergabung ke stage.';

  @override
  String get stageThisStageFallback => 'Stage ini';

  @override
  String get stageRequiresTicketToJoin => 'memerlukan tiket untuk bergabung';

  @override
  String get stagePleaseWaitLabel => 'Mohon tunggu...';

  @override
  String get stageGetFreeTicketButton => 'Dapatkan Tiket Gratis';

  @override
  String stageBuyTicketButton(String price) {
    return 'Beli Tiket -- $price';
  }

  @override
  String get stageNotNowButton => 'Nanti saja';

  @override
  String get stageCouldNotStartTicketPurchase =>
      'Tidak dapat memulai pembelian tiket.';

  @override
  String get stagePaymentStillPendingTryAgain =>
      'Masih menunggu pembayaran itu -- coba bergabung lagi setelah dikonfirmasi.';

  @override
  String get stageSpeakerBadge => 'Pembicara';

  @override
  String get stageListenerBadge => 'Pendengar';

  @override
  String stageCouldNotJoinWithError(String error) {
    return 'Tidak dapat bergabung: $error';
  }

  @override
  String get stageSpeakersHeader => 'PEMBICARA';

  @override
  String get stageRaisedHandsHeader => 'TANGAN TERANGKAT';

  @override
  String get stageAllowButton => 'Izinkan';

  @override
  String get stageIgnoreButton => 'Abaikan';

  @override
  String get stageListenersHeader => 'PENDENGAR';

  @override
  String get stageRaiseHandTooltip => 'Angkat tangan';

  @override
  String get stageLowerHandTooltip => 'Turunkan tangan';

  @override
  String get stageLeaveStageTooltip => 'Tinggalkan Stage';

  @override
  String stageYouSuffixLabel(String name) {
    return '$name (Anda)';
  }

  @override
  String get stageMoveToListenersButton => 'Pindahkan ke pendengar';

  @override
  String get stageYouFallbackName => 'Anda';

  @override
  String widgetsAvatarSemanticLabel(String username) {
    return 'Avatar untuk $username';
  }

  @override
  String get channelEditDialogNewTitle => 'Kanal Baru';

  @override
  String get channelEditDialogEditTitle => 'Edit Kanal';

  @override
  String get channelEditDialogNameHint => 'Nama kanal';

  @override
  String get channelEditDialogDescriptionHint => 'Topik (opsional)';

  @override
  String get channelEditDialogTypeLabel => 'Jenis';

  @override
  String get channelEditDialogTypeText => 'Teks';

  @override
  String get channelEditDialogTypeVoice => 'Suara';

  @override
  String get channelEditDialogTypeGallery => 'Galeri';

  @override
  String get channelEditDialogTypeStage => 'Stage';

  @override
  String get channelEditDialogTypeRules => 'Aturan';

  @override
  String get channelEditDialogTypeRoleSelection => 'Pemilihan Peran';

  @override
  String get channelEditDialogTypeCalendar => 'Kalender';

  @override
  String get channelEditDialogAnnouncementTitle => 'Kanal pengumuman';

  @override
  String get channelEditDialogAnnouncementSubtitle =>
      'Hanya anggota yang dapat mengelola pesan yang boleh memposting';

  @override
  String get channelEditDialogLiveAnnouncementsTitle =>
      'Posting pengumuman live-stream & unggahan di sini';

  @override
  String get channelEditDialogLiveAnnouncementsSubtitle =>
      'Otomatis memposting saat anggota dengan izin \"Umumkan saat live\" mulai live di Twitch, atau memposting video YouTube baru';

  @override
  String get channelEditDialogNotifyRolesLabel =>
      'Beri tahu peran ini saat diposting (opsional)';

  @override
  String get channelEditDialogSlowmodeLabel => 'Mode Lambat';

  @override
  String get channelEditDialogSlowmodeOff => 'Nonaktif';

  @override
  String get channelEditDialogUserLimitLabel => 'Batas Pengguna';

  @override
  String get channelEditDialogUserLimitOff => 'Tanpa batas';

  @override
  String get channelEditDialogCategoryLabel => 'Kategori';

  @override
  String get channelEditDialogNoCategory => 'Tidak ada kategori';

  @override
  String get channelEditDialogRoleAccessLabel =>
      'Akses Peran (kosongkan untuk semua)';

  @override
  String get channelEditDialogContentLabelsLabel => 'Label Konten';

  @override
  String get channelEditDialogContentLabelsDescription =>
      'Menandai kanal ini untuk filter konten anggota; diblokir sepenuhnya untuk akun yang diawasi';

  @override
  String get categoryEditDialogNewTitle => 'Kategori Baru';

  @override
  String get categoryEditDialogEditTitle => 'Edit Kategori';

  @override
  String get categoryEditDialogNameHint => 'Nama kategori';

  @override
  String get categoryEditDialogRoleAccessLabel =>
      'Akses Peran (kosongkan untuk semua)';

  @override
  String memberPanelHeaderLabel(int count) {
    return 'Anggota — $count daring';
  }

  @override
  String get memberPanelRefreshTooltip => 'Segarkan daftar anggota';

  @override
  String memberPanelMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anggota',
    );
    return '$_temp0';
  }

  @override
  String get memberPanelOfflineLabel => 'Luring';

  @override
  String memberPanelTierSuffix(String tier) {
    return ', tingkat $tier';
  }

  @override
  String get memberPanelUnknownUser => 'Tidak diketahui';

  @override
  String get memberPanelModerationActionsTooltip => 'Tindakan moderasi';

  @override
  String get reportDialogReasonSpam => 'Spam';

  @override
  String get reportDialogReasonHarassment => 'Pelecehan atau penyalahgunaan';

  @override
  String get reportDialogReasonIllegal => 'Konten ilegal';

  @override
  String get reportDialogReasonOther => 'Lainnya';

  @override
  String get reportDialogReasonLabel => 'Alasan';

  @override
  String get reportDialogNoteHint =>
      'Ada hal lain yang perlu diketahui moderator? (opsional)';

  @override
  String get reportDialogDisclosureNote =>
      'Isi pesan yang ditampilkan kepada Anda dan siapa pengirimnya akan dibagikan kepada moderator server ini.';

  @override
  String get reportDialogSubmitButton => 'Kirim Laporan';

  @override
  String get reportDialogSubmitError => 'Tidak dapat mengirim laporan.';

  @override
  String get notificationBellTitle => 'Notifikasi';

  @override
  String get notificationBellMarkAllRead => 'Tandai semua dibaca';

  @override
  String get notificationBellEmptyState => 'Belum ada notifikasi';

  @override
  String get notificationBellUnreadLabel => 'Belum dibaca';

  @override
  String get invitePreviewTitle => 'Undangan Server';

  @override
  String get invitePreviewInvalidOrExpired =>
      'Undangan tidak valid atau kedaluwarsa.';

  @override
  String get invitePreviewCouldNotJoin => 'Tidak dapat bergabung ke server.';

  @override
  String get invitePreviewUnknownServer => 'Server tidak diketahui';

  @override
  String get shippingAddressFullNameHint => 'Nama lengkap';

  @override
  String get shippingAddressLine1Hint => 'Alamat baris 1';

  @override
  String get shippingAddressLine2Hint => 'Alamat baris 2 (opsional)';

  @override
  String get shippingAddressCityHint => 'Kota';

  @override
  String get shippingAddressStateHint => 'Provinsi';

  @override
  String get shippingAddressZipHint => 'Kode pos';

  @override
  String get shippingAddressCountryCodeHint => 'Kode negara (mis. US)';

  @override
  String get shippingAddressPhoneHint => 'Telepon (opsional)';

  @override
  String get shippingAddressPrivacyNote =>
      'Hanya digunakan untuk mengirim pesanan ini -- lihat kebijakan privasi Printful sendiri untuk cara mereka menanganinya setelah pesanan dibuat.';

  @override
  String get updateNudgeAvailableTitle => 'Pembaruan Tersedia';

  @override
  String get updateNudgeRequiredTitle => 'Pembaruan Diperlukan';

  @override
  String updateNudgeAvailableBody(String version) {
    return 'Koda $version tersedia -- Anda menggunakan build yang lebih lama.';
  }

  @override
  String updateNudgeRequiredBody(String version) {
    return 'Build ini tidak lagi didukung. Perbarui ke Koda $version untuk terus menggunakan Koda.';
  }

  @override
  String get updateNudgeLaterButton => 'Nanti';

  @override
  String get tierBadgeSparkSubscriber => 'Pelanggan Spark';

  @override
  String get tierBadgePulseSubscriber => 'Pelanggan Pulse';

  @override
  String get tierBadgeAlphaSpark => 'Alpha Spark';

  @override
  String get tierBadgeFounder => 'Founder';

  @override
  String get foundersHallTitle => 'Founders Hall';

  @override
  String get foundersHallSubtitle =>
      'Para pendukung paling awal yang membuat Koda mungkin terwujud.';

  @override
  String get foundersHallEmptyState => 'Belum ada founder.';

  @override
  String get settingsFoundersHallTitle => 'Founders Hall';

  @override
  String get settingsFoundersHallSubtitle =>
      'Lihat siapa yang membantu membangun Koda';

  @override
  String get vispAvatarInDevelopment => 'DALAM PENGEMBANGAN';

  @override
  String get vispBoostAdvisorCouldNotAnswer =>
      'Visp tidak dapat menyusun jawaban.';

  @override
  String get vispBoostAdvisorTitle => 'Tanya Visp: Penasihat ROI Boost';

  @override
  String get vispBoostAdvisorFollowUpHint => 'Ajukan pertanyaan lanjutan...';

  @override
  String get vispBoostAdvisorSendTooltip => 'Kirim';

  @override
  String get vispBoostAdvisorBasedOn => 'Berdasarkan:';

  @override
  String get vispEventDialogCouldNotGenerate =>
      'Visp tidak dapat membuat acara.';

  @override
  String get vispEventDialogCouldNotCreate => 'Tidak dapat membuat acara itu.';

  @override
  String get vispEventDialogRecurrenceNone => 'Satu kali';

  @override
  String get vispEventDialogRecurrenceDaily => 'Berulang harian';

  @override
  String get vispEventDialogRecurrenceWeekly => 'Berulang mingguan';

  @override
  String get vispEventDialogRecurrenceMonthly => 'Berulang bulanan';

  @override
  String get vispEventDialogTitle => 'Minta Visp membuat acara';

  @override
  String get vispEventDialogDescription =>
      'Jelaskan acaranya -- Visp akan mengusulkan judul, tanggal/waktu, dan detail lainnya.';

  @override
  String get vispEventDialogPromptHint =>
      'mis. \"Sesi D&D mingguan setiap Jumat pukul 19.00 selama sekitar 3 jam\"';

  @override
  String get vispEventDialogPrivacyNote =>
      'Deskripsi Anda dikirim ke Visp (asisten yang dihosting sendiri -- tidak ada yang keluar dari server Koda) untuk membuat rencana ini.';

  @override
  String get vispEventDialogStartOver => 'Mulai Ulang';

  @override
  String get vispEventDialogCreateEvent => 'Buat Acara';

  @override
  String get vispEventDialogThinking => 'Berpikir...';

  @override
  String get vispEventDialogGeneratePlan => 'Buat Rencana';

  @override
  String get vispEventDialogCouldNotParseDate =>
      'Tidak dapat mengurai tanggal -- coba ubah kalimatnya';

  @override
  String vispEventDialogEndsLabel(String ends) {
    return 'Berakhir $ends';
  }

  @override
  String vispEventDialogPricePerTicket(String price) {
    return '$price per tiket';
  }

  @override
  String get vispEventDialogBasedOn => 'Berdasarkan:';

  @override
  String vispQuestionStepProgress(int questionNumber, int maxQuestions) {
    return 'Pertanyaan $questionNumber dari $maxQuestions';
  }

  @override
  String get vispQuestionStepAnswerHint => 'Atau ketik jawaban Anda sendiri...';

  @override
  String get vispQuestionStepSendTooltip => 'Kirim';

  @override
  String get vispQuestionStepSkip => 'Lewati dan buat sekarang';

  @override
  String get vispSetupDialogCouldNotGeneratePlan =>
      'Visp tidak dapat membuat rencana.';

  @override
  String get vispSetupDialogCouldNotApplyPlan =>
      'Tidak dapat menerapkan rencana itu.';

  @override
  String get vispSetupDialogTitleNew => 'Jelaskan server Anda kepada Visp';

  @override
  String get vispSetupDialogTitleExisting =>
      'Minta Visp menambahkan ke server ini';

  @override
  String get vispSetupDialogDescriptionNew =>
      'Jelaskan server yang Anda inginkan -- Visp akan mengusulkan nama dan sekumpulan peran, kategori, dan kanal.';

  @override
  String get vispSetupDialogDescriptionExisting =>
      'Jelaskan apa yang ingin Anda tambahkan -- Visp akan mengusulkan peran, kategori, dan kanal untuk dibuat.';

  @override
  String get vispSetupDialogPromptHintNew =>
      'mis. \"Server nyaman untuk grup D&D saya dengan kanal suara untuk dua meja\"';

  @override
  String get vispSetupDialogPromptHintExisting =>
      'mis. \"Tambahkan beberapa kanal lagi untuk tim raid kami\"';

  @override
  String get vispSetupDialogPrivacyNote =>
      'Deskripsi Anda dikirim ke Visp (asisten yang dihosting sendiri -- tidak ada yang keluar dari server Koda) untuk membuat rencana ini.';

  @override
  String get vispSetupDialogStartOver => 'Mulai Ulang';

  @override
  String get vispSetupDialogCreateServer => 'Buat Server';

  @override
  String get vispSetupDialogAddToServer => 'Tambahkan ke Server';

  @override
  String get vispSetupDialogThinking => 'Berpikir...';

  @override
  String get vispSetupDialogGeneratePlan => 'Buat Rencana';

  @override
  String get vispSetupDialogNewServerLabel => 'Server baru';

  @override
  String vispSetupDialogRoleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count peran',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kategori',
    );
    return '$_temp0';
  }

  @override
  String vispSetupDialogChannelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kanal',
    );
    return '$_temp0';
  }

  @override
  String get vispSetupDialogBasedOn => 'Berdasarkan:';

  @override
  String get childLockoutTitle => 'Ini di luar jam yang diizinkan untuk Anda';

  @override
  String get childLockoutBody =>
      'Orang tua atau wali telah mengatur waktu akun ini dapat menggunakan Koda. Minta mereka untuk waktu tambahan, atau periksa kembali saat jendela waktu yang diizinkan berikutnya.';

  @override
  String get childLockoutLogOutButton => 'Keluar';

  @override
  String get forcePasswordChangeError =>
      'Tidak dapat memperbarui kata sandi. Coba lagi.';

  @override
  String forcePasswordChangeWelcome(String username) {
    return 'Selamat datang, $username';
  }

  @override
  String get forcePasswordChangeSubtitle =>
      'Akun Anda memerlukan kata sandi baru sebelum Anda dapat melanjutkan.';

  @override
  String get forcePasswordChangeNewPasswordHint => 'Kata sandi baru';

  @override
  String get forcePasswordChangeConfirmPasswordHint =>
      'Konfirmasi kata sandi baru';

  @override
  String get forcePasswordChangeReqLength => 'Minimal 12 karakter';

  @override
  String get forcePasswordChangeReqUpper => 'Satu huruf besar';

  @override
  String get forcePasswordChangeReqLower => 'Satu huruf kecil';

  @override
  String get forcePasswordChangeReqDigit => 'Satu angka';

  @override
  String get forcePasswordChangeReqMatch => 'Kata sandi cocok';

  @override
  String get forcePasswordChangeSubmitButton => 'Atur Kata Sandi Baru';

  @override
  String get forgotPasswordEnterEmailError => 'Masukkan alamat email Anda.';

  @override
  String get forgotPasswordCodeSentInfo =>
      'Jika akun itu ada, kode reset telah dikirim.';

  @override
  String get forgotPasswordEnterCodeError =>
      'Masukkan kode dan kata sandi minimal 8 karakter.';

  @override
  String get forgotPasswordInvalidCode => 'Kode tidak valid atau kedaluwarsa.';

  @override
  String get forgotPasswordTitle => 'Atur ulang kata sandi';

  @override
  String get forgotPasswordEmailHint => 'Alamat email';

  @override
  String get forgotPasswordSendCodeButton => 'Kirim kode reset';

  @override
  String get forgotPasswordCodeHint => 'Kode 6 digit';

  @override
  String get forgotPasswordNewPasswordHint => 'Kata sandi baru';

  @override
  String get forgotPasswordSetNewPasswordButton => 'Atur kata sandi baru';

  @override
  String get verifyEmailEnterCodeError =>
      'Masukkan kode 6 digit dari email Anda.';

  @override
  String get verifyEmailInvalidCode => 'Kode tidak valid atau kedaluwarsa.';

  @override
  String verifyEmailResentInfo(String email) {
    return 'Kode baru telah dikirim ke $email.';
  }

  @override
  String get verifyEmailResendFailed => 'Tidak dapat mengirim ulang saat ini.';

  @override
  String get verifyEmailTitle => 'Periksa email Anda';

  @override
  String verifyEmailSentCode(String email) {
    return 'Kami mengirim kode 6 digit ke $email';
  }

  @override
  String get verifyEmailCodeHint => '000000';

  @override
  String get verifyEmailVerifyButton => 'Verifikasi Email';

  @override
  String get verifyEmailResendButton => 'Kirim ulang kode';

  @override
  String get safetyNumberKeysNotSetUp => 'Kunci Anda sendiri belum disiapkan.';

  @override
  String safetyNumberNoKeyBundle(String peerName) {
    return '$peerName belum memiliki paket kunci.';
  }

  @override
  String safetyNumberComputeError(String error) {
    return 'Tidak dapat menghitung nomor keamanan: $error';
  }

  @override
  String safetyNumberDeviceGone(String peerName) {
    return '$peerName tidak lagi memiliki perangkat itu.';
  }

  @override
  String safetyNumberAppBarTitle(String peerName) {
    return 'Nomor Keamanan dengan $peerName';
  }

  @override
  String safetyNumberInstructions(String peerName) {
    return 'Bandingkan nomor ini dengan $peerName melalui saluran lain -- secara langsung, panggilan telepon, di mana pun selain obrolan ini. Jika cocok di kedua sisi, Anda berbicara dengan orang yang Anda kira.';
  }

  @override
  String safetyNumberMultiDeviceNote(String peerName, int count) {
    return '$peerName memiliki $count perangkat, masing-masing dengan nomor keamanannya sendiri -- memverifikasi satu tidak mencakup yang lain.';
  }

  @override
  String safetyNumberDeviceLabel(int number) {
    return 'Perangkat $number';
  }

  @override
  String get safetyNumberMarkVerifiedButton => 'Tandai sebagai Terverifikasi';

  @override
  String get contentFiltersDescription =>
      'Server dapat menandai kanal dengan label konten. Pilih bagaimana Anda ingin kanal berlabel berperilaku -- ini adalah preferensi Anda sendiri dan tidak pernah memengaruhi apa yang dilihat orang lain.';

  @override
  String get contentFiltersLabelAdult => 'Konten dewasa';

  @override
  String get contentFiltersLabelSuggestive => 'Sugestif';

  @override
  String get contentFiltersLabelGraphic => 'Media grafis';

  @override
  String get contentFiltersLabelNudity => 'Ketelanjangan non-seksual';

  @override
  String get contentFiltersDescAdult => 'Konten yang secara seksual eksplisit';

  @override
  String get contentFiltersDescSuggestive =>
      'Konten yang sugestif secara seksual tetapi tidak eksplisit';

  @override
  String get contentFiltersDescGraphic => 'Kekerasan atau kengerian';

  @override
  String get contentFiltersDescNudity =>
      'Ketelanjangan dalam konteks non-seksual';

  @override
  String get contentFiltersHide => 'Sembunyikan';

  @override
  String get contentFiltersWarn => 'Peringatkan';

  @override
  String get contentFiltersShow => 'Tampilkan';

  @override
  String get deviceTestCouldNotGetToken => 'Tidak dapat memperoleh token uji.';

  @override
  String get deviceTestLabelTest => 'Uji';

  @override
  String get deviceTestLabelRecording => 'Merekam...';

  @override
  String get deviceTestLabelPlayingBack => 'Memutar ulang...';

  @override
  String deviceTestCouldNotStartCamera(String error) {
    return 'Tidak dapat menyalakan kamera: $error';
  }

  @override
  String get deviceTestTitle => 'Uji Perangkat';

  @override
  String deviceTestCouldNotConnect(String error) {
    return 'Tidak dapat terhubung: $error';
  }

  @override
  String get deviceTestMicrophoneLabel => 'Mikrofon';

  @override
  String get deviceTestHearYourselfLabel => 'Dengar Diri Sendiri (Tertunda)';

  @override
  String get deviceTestSpeakerOutputLabel => 'Speaker / Output';

  @override
  String get deviceTestCameraLabel => 'Kamera';

  @override
  String get deviceTestSystemDefault => 'Bawaan sistem';

  @override
  String deviceTestHearYourselfHint(String seconds) {
    return 'Bicara, lalu dengarkan putar ulang klip ${seconds}dtk';
  }

  @override
  String deviceTestSecondsLabel(String seconds) {
    return '${seconds}dtk';
  }

  @override
  String get deviceTestCameraPreviewOff => 'Pratinjau kamera mati';

  @override
  String get deviceTestStopCameraButton => 'Hentikan Uji Kamera';

  @override
  String get deviceTestTestCameraButton => 'Uji Kamera';

  @override
  String get deviceTestInputLevelLabel => 'Tingkat input';

  @override
  String get devicesScreenRemoveConfirmTitle => 'Hapus perangkat ini?';

  @override
  String get devicesScreenRemoveConfirmBody =>
      'Perangkat perlu masuk lagi, dan pesan apa pun yang dikirim ke sana selama dihapus tidak akan sampai setelahnya -- sesi Double Ratchet tidak mengisi celah secara retroaktif.';

  @override
  String get devicesScreenRemoveFailed =>
      'Tidak dapat menghapus perangkat itu.';

  @override
  String get devicesScreenNeverActive => 'Tidak pernah aktif';

  @override
  String devicesScreenActiveDate(String date) {
    return 'Aktif $date';
  }

  @override
  String get devicesScreenDescription =>
      'Setiap perangkat yang Anda gunakan untuk masuk memiliki identitas enkripsi sendiri -- pesan yang dikirim kepada Anda sampai ke setiap perangkat di bawah ini. Hapus perangkat yang tidak Anda gunakan atau tidak Anda kenali.';

  @override
  String get devicesScreenNoDevicesFound => 'Tidak ada perangkat ditemukan.';

  @override
  String get devicesScreenUnknownDevice => 'Perangkat tidak diketahui';

  @override
  String get devicesScreenThisDeviceBadge => 'Perangkat ini';

  @override
  String get devicesScreenRemoveDeviceTooltip => 'Hapus perangkat';

  @override
  String get totpSetupInvalidCode => 'Kode tidak valid. Coba lagi.';

  @override
  String get totpSetupEnabledMessage =>
      'Autentikasi dua faktor telah diaktifkan.';

  @override
  String get totpSetupScanInstructions =>
      'Pindai rahasia ini ke aplikasi autentikator Anda (Google Authenticator, 1Password, Authy):';

  @override
  String get totpSetupCodeHint => 'Masukkan kode 6 digit untuk mengonfirmasi';

  @override
  String get totpSetupVerifyButton => 'Verifikasi & Aktifkan';

  @override
  String get voiceVideoSettingsPushToTalkLabel => 'Tekan untuk Bicara';

  @override
  String get voiceVideoSettingsPressAnyKeyHint =>
      'Tekan tombol apa saja untuk mengikatnya...';

  @override
  String get voiceVideoSettingsTestDevicesButton => 'Uji Perangkat';

  @override
  String get voiceVideoSettingsSectionVoiceProcessing => 'Pemrosesan Suara';

  @override
  String get voiceVideoSettingsNoiseSuppressionTitle => 'Penekanan Kebisingan';

  @override
  String get voiceVideoSettingsNoiseSuppressionSubtitle =>
      'Kurangi kebisingan latar belakang pada mikrofon Anda';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionTitle =>
      'Penekanan Kebisingan Mendalam (Windows)';

  @override
  String get voiceVideoSettingsDeepNoiseSuppressionSubtitle =>
      'Penghilangan kebisingan AI real-time, lebih kuat dari penekanan standar -- menggantikannya saat aktif';

  @override
  String get voiceVideoSettingsEchoCancellationTitle => 'Pembatalan Gema';

  @override
  String get voiceVideoSettingsEchoCancellationSubtitle =>
      'Cegah audio Anda sendiri bergema kembali';

  @override
  String get voiceVideoSettingsAutoGainTitle => 'Kontrol Gain Otomatis';

  @override
  String get voiceVideoSettingsAutoGainSubtitle =>
      'Seimbangkan volume mikrofon secara otomatis (normalisasi kenyaringan)';

  @override
  String get voiceVideoSettingsAutoDuckingTitle => 'Auto-Ducking';

  @override
  String get voiceVideoSettingsAutoDuckingSubtitle =>
      'Kecilkan volume peserta lain saat Anda berbicara';

  @override
  String get voiceVideoSettingsHighPassTitle => 'Filter High-Pass';

  @override
  String get voiceVideoSettingsHighPassSubtitle =>
      'Potong dengungan frekuensi rendah (kipas, AC, benturan meja)';

  @override
  String get voiceVideoSettingsTypingNoiseTitle => 'Deteksi Suara Ketikan';

  @override
  String get voiceVideoSettingsTypingNoiseSubtitle =>
      'Tekan suara berisik keyboard yang tertangkap mikrofon Anda';

  @override
  String get voiceVideoSettingsVoiceIsolationTitle => 'Isolasi Suara';

  @override
  String get voiceVideoSettingsVoiceIsolationSubtitle =>
      'Fokus pada suara Anda, menyaring orang dan suara lain di sekitar';

  @override
  String get voiceVideoSettingsSectionMicBoost => 'Boost Mikrofon';

  @override
  String get voiceVideoSettingsEnableBoostTitle => 'Aktifkan Boost';

  @override
  String get voiceVideoSettingsEnableBoostSubtitle =>
      'Gain preamp untuk mikrofon yang pelan atau jauh -- diterapkan sebelum EQ';

  @override
  String get voiceVideoSettingsBandBoost => 'Boost';

  @override
  String get voiceVideoSettingsSectionMicEq => 'EQ Mikrofon';

  @override
  String get voiceVideoSettingsEnableEqTitle => 'Aktifkan EQ';

  @override
  String get voiceVideoSettingsEnableEqSubtitle =>
      'Bentuk mikrofon Anda sebelum sampai ke orang lain';

  @override
  String get voiceVideoSettingsBandBass => 'Bass';

  @override
  String get voiceVideoSettingsBandMid => 'Mid';

  @override
  String get voiceVideoSettingsBandTreble => 'Treble';

  @override
  String get voiceVideoSettingsSectionVad => 'Deteksi Aktivitas Suara (VOX)';

  @override
  String get voiceVideoSettingsEnableVoxTitle => 'Aktifkan VOX';

  @override
  String get voiceVideoSettingsEnableVoxSubtitle =>
      'Hanya mengirim saat Anda benar-benar berbicara';

  @override
  String get voiceVideoSettingsSensitivityLabel => 'Sensitivitas';

  @override
  String get voiceVideoSettingsVadHint =>
      'Lebih rendah = menangkap suara yang lebih pelan. Lebih tinggi = hanya suara yang lebih keras yang memicu pengiriman.';

  @override
  String get voiceVideoSettingsBoundKeyLabel => 'Tombol terikat';

  @override
  String get voiceVideoSettingsKeyNotSet =>
      'Belum diatur — mikrofon tetap aktif setiap kali tidak dibisukan';

  @override
  String get voiceVideoSettingsClearButton => 'Hapus';

  @override
  String get voiceVideoSettingsSetKeyButton => 'Atur Tombol';

  @override
  String get voiceVideoSettingsChangeButton => 'Ubah';

  @override
  String get voiceVideoSettingsPushToTalkExplanation =>
      'Saat tombol diikat, mikrofon Anda hanya mengirim selama Anda menahan tombol itu. Ini diprioritaskan di atas VOX selama Anda berada di kanal suara.';

  @override
  String get voiceVideoSettingsSectionVarm =>
      'VARM - Model Reaktif Avatar Virtual';

  @override
  String get voiceVideoSettingsVarmDescription =>
      'Unggah dua gambar yang bertukar saat Anda berbicara. Hanya terlihat oleh Anda.';

  @override
  String get voiceVideoSettingsVarmSilentLabel => 'Diam';

  @override
  String get voiceVideoSettingsVarmTalkingLabel => 'Berbicara';

  @override
  String get voiceVideoSettingsSpeakingThresholdLabel => 'Ambang bicara';

  @override
  String get voiceVideoSettingsVarmThresholdHint =>
      'Lebih rendah = beralih ke gambar berbicara lebih mudah.';

  @override
  String get voiceVideoSettingsRemoveVarmButton => 'Hapus VARM';

  @override
  String get gifPickerNoGifsFound => 'Tidak ada GIF ditemukan';

  @override
  String get gifPickerSearchHint => 'Cari GIF...';

  @override
  String get messageSearchHint => 'Cari di kanal ini...';

  @override
  String get messageSearchTooltip => 'Cari';

  @override
  String get messageSearchInitialHint =>
      'Mencari pesan yang sudah dimuat di perangkat ini -- riwayat yang lebih lama akan diambil (dan didekripsi secara lokal) saat Anda menelusuri lebih jauh ke belakang.';

  @override
  String get messageSearchNoMatches => 'Tidak ada yang cocok';

  @override
  String get messageSearchStartOfHistory => 'Awal riwayat kanal';

  @override
  String get messageSearchFurtherBackButton => 'Cari lebih jauh ke belakang';

  @override
  String get messageSearchUnknownAuthor => 'Tidak diketahui';
}
