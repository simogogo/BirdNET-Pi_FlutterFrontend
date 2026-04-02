// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Pemantauan Burung';

  @override
  String get home => 'Beranda';

  @override
  String get today => 'Hari Ini';

  @override
  String get recordings => 'Rekaman';

  @override
  String get liveStream => 'Streaming Langsung';

  @override
  String get liveSpectrogram => 'Spektrogram Langsung';

  @override
  String get speciesManagement => 'PENGELOLAAN SPESIES';

  @override
  String get inclusionList => 'Daftar Inklusi';

  @override
  String get exclusionList => 'Daftar Eksklusi';

  @override
  String get analysisLog => 'Log Analisis';

  @override
  String get openWebInterface => 'Buka Antarmuka Web';

  @override
  String get loadingLiveSpectrogram => 'Memuat spektrogram langsung...';

  @override
  String get spectrogramInstruction =>
      'Jika audio tidak dimulai secara otomatis, silakan berinteraksi dengan halaman atau periksa izin browser Anda.';

  @override
  String get configureServerFirst =>
      'Konfigurasi alamat server di Pengaturan terlebih dahulu';

  @override
  String get recentDetections => 'Deteksi Terbaru';

  @override
  String get latestDetection => 'Deteksi Terakhir';

  @override
  String get audioFile => 'File Audio';

  @override
  String get playing => 'Memutar';

  @override
  String get noDetectionsToday => 'Tidak ada deteksi hari ini';

  @override
  String get systemListening => 'Sistem sedang mendengarkan...';

  @override
  String get errorOccurred => 'Terjadi kesalahan';

  @override
  String get overview => 'Ikhtisar';

  @override
  String get detectionsAllTime => 'Deteksi\ntotal';

  @override
  String get detectionsToday => 'Deteksi\nhari ini';

  @override
  String get detectionsLastHour => 'Deteksi\njam terakhir';

  @override
  String get speciesToday => 'Spesies\nhari ini';

  @override
  String get speciesAllTime => 'Spesies\ntotal';

  @override
  String get statsLoadingError => 'Kesalahan memuat statistik';

  @override
  String get todaysDetections => 'Deteksi Hari Ini';

  @override
  String get noDetectionsForSpecies => 'Tidak ada deteksi untuk spesies ini';

  @override
  String get removeFilter => 'Hapus penyaring';

  @override
  String detectionsCount(int count) {
    return '$count deteksi';
  }

  @override
  String get filterDetections => 'Deteksi Filter';

  @override
  String get minimumConfidenceThreshold => 'Ambang Batas Kepercayaan Minimum';

  @override
  String get reset => 'Atur Ulang';

  @override
  String get apply => 'Terapkan';

  @override
  String get charts => 'Grafik';

  @override
  String get daily => 'Harian';

  @override
  String get weekly => 'Mingguan';

  @override
  String get monthly => 'Bulanan';

  @override
  String get detectionsBySpecies => 'Deteksi Berdasarkan Spesies';

  @override
  String get hourlyDistribution => 'Distribusi Setiap Jam';

  @override
  String get noChartAvailable => 'Grafik tidak tersedia';

  @override
  String get weeklyReport => 'Laporan Mingguan';

  @override
  String get monthlyReport => 'Laporan Bulanan';

  @override
  String get newSpecies => 'Spesies Baru';

  @override
  String get newFemale => 'Baru!';

  @override
  String get identifiedSpecies => 'Spesies Teridentifikasi';

  @override
  String get byDate => 'Berdasarkan Tanggal';

  @override
  String get bySpecies => 'Berdasarkan Spesies';

  @override
  String exportToEbird(String date) {
    return 'Ekspor ke eBird ($date)';
  }

  @override
  String get noRecordings => 'Tidak ada rekaman';

  @override
  String get deleteRecording => 'Hapus Rekaman';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Apakah Anda ingin menghapus \"$name\" dari $date $time?';
  }

  @override
  String get cancel => 'Batal';

  @override
  String get delete => 'Hapus';

  @override
  String get noSpeciesFound => 'Spesies tidak ditemukan.';

  @override
  String get unknown => 'Tidak diketahui';

  @override
  String get noRecordingsAvailable => 'Tidak ada rekaman yang tersedia.';

  @override
  String get play => 'Putar';

  @override
  String get changeId => 'Ubah ID';

  @override
  String get protect => 'Lindungi';

  @override
  String get unprotect => 'Buka Perlindungan';

  @override
  String get download => 'Unduh';

  @override
  String get cannotDownloadFile => 'Tidak dapat mengunduh file';

  @override
  String get errorLoading => 'Kesalahan memuat';

  @override
  String get autoDetectionsViaBirdNet =>
      'Deteksi otomatis melalui BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully => 'Pengunduhan berhasil dimulai!';

  @override
  String get cannotDownloadCsv => 'Tidak dapat mengunduh CSV.';

  @override
  String get zipDownloadInProgress => 'Pengunduhan ZIP sedang berlangsung...';

  @override
  String get cannotOpenZipUrl => 'Tidak dapat membuka URL untuk unduhan ZIP';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Server tidak mengembalikan URL unduhan.';

  @override
  String get unknownError => 'Kesalahan tidak diketahui';

  @override
  String get serverError => 'Kesalahan Server';

  @override
  String get ebirdExport => 'Ekspor eBird';

  @override
  String get generateCsvForEbird => 'Buat CSV untuk eBird';

  @override
  String get downloadAudioZip => 'Hasilkan file ZIP audio per eBird';

  @override
  String get close => 'Tutup';

  @override
  String get continueStep => 'Lanjutkan';

  @override
  String get back => 'Kembali';

  @override
  String get review => 'Tinjauan';

  @override
  String get configuration => 'Konfigurasi';

  @override
  String get summary => 'Ringkasan';

  @override
  String get autoRemoveLessThan80 => 'Hapus < 80% secara otomatis';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Spesies dibaca: $totalSpecies | Kemunculan: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count deteksi';
  }

  @override
  String get protocol => 'Protokol';

  @override
  String get stationaryPoint => 'Stasioner - Titik Tetap';

  @override
  String get nocturnalFlightCall => 'Panggilan Terbang Nokturnal (NFC)';

  @override
  String get incidental => 'Insidentil';

  @override
  String get localityName => 'Nama Lokasi *';

  @override
  String get requiredField => 'Kolom wajib diisi';

  @override
  String get numberOfObservers => 'Jumlah Pengamat';

  @override
  String get additionalComments => 'Komentar Tambahan';

  @override
  String get includeAudioFileNamesInComments =>
      'Sertakan nama file audio dalam komentar';

  @override
  String get readyForExport => 'Siap diekspor';

  @override
  String get totalUniqueSpecies => 'Jumlah Spesies (Unik)';

  @override
  String get hourlyModeledChecklists =>
      'Daftar periksa yang dimodelkan setiap jam';

  @override
  String get averageConfidence => 'Keyakinan Rata-Rata';

  @override
  String get wizardInfoText =>
      'Dengan menekan \"Hasilkan CSV\", file akan dikompilasi dengan membagi stasiun berdasarkan jam, siap untuk diunggah ke eBird.';

  @override
  String get statistics => 'Statistik';

  @override
  String get systemLogs => 'Log Sistem';

  @override
  String get systemTools => 'Alat Sistem';

  @override
  String get systemControls => 'Kontrol Sistem';

  @override
  String get restart => 'Mulai Ulang';

  @override
  String get restartRaspberryPi => 'Mulai ulang Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Apakah Anda yakin ingin memulai ulang sistem?';

  @override
  String get update => 'Perbarui';

  @override
  String get updateBirdNetPi => 'Perbarui BirdNET-Pi ke versi terbaru';

  @override
  String get doYouWantToUpdateBirdNet =>
      'Apakah Anda ingin memperbarui BirdNET-Pi?';

  @override
  String get shutdown => 'Matikan';

  @override
  String get shutdownRaspberryPi => 'Matikan Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Apakah Anda yakin ingin mematikan sistem?';

  @override
  String get clearAllData => 'Hapus Semua Data';

  @override
  String get removeAllRecordingsAndDetections =>
      'Hapus semua rekaman dan deteksi';

  @override
  String get warningAllDataWillBeDeleted =>
      'PERINGATAN: Semua data akan dihapus secara permanen. Melanjutkan?';

  @override
  String get services => 'Layanan';

  @override
  String get liveAudioStream => 'Streaming Audio Langsung';

  @override
  String get birdNetAnalysis => 'Analisis BirdNET';

  @override
  String get birdNetRecording => 'Rekaman BirdNET';

  @override
  String get birdNetLog => 'Log BirdNET';

  @override
  String get chartViewer => 'Penampil Grafik';

  @override
  String get spectrogram => 'Spektrogram';

  @override
  String get quickActions => 'Tindakan Cepat';

  @override
  String get stopServices => 'Hentikan Layanan';

  @override
  String get restartServices => 'Mulai Ulang Layanan';

  @override
  String get confirm => 'Konfirmasi';

  @override
  String get execution => 'Eksekusi:';

  @override
  String get commandExecuted => '✅ Perintah dijalankan';

  @override
  String errorMsg(String error) {
    return '❌ Kesalahan: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Kesalahan $error';
  }

  @override
  String get settings => 'Pengaturan';

  @override
  String get basicSettings => 'Pengaturan Dasar';

  @override
  String get basicSettingsSubtitle =>
      'Konfigurasikan waktu, lokasi, bahasa, dan notifikasi.';

  @override
  String get advancedSettings => 'Pengaturan Lanjutan';

  @override
  String get advancedSettingsSubtitle =>
      'Konfigurasikan audio, privasi, manajemen disk, dan banyak lagi.';

  @override
  String get connection => 'Koneksi';

  @override
  String get birdNetPiServerAddress => 'Alamat Server BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Masukkan alamat IP atau nama host Raspberry Pi Anda';

  @override
  String get testInProgress => 'Tes sedang berlangsung...';

  @override
  String get saveAndTestConnection => 'Simpan dan Uji Koneksi';

  @override
  String get deviceInformation => 'Informasi Perangkat';

  @override
  String get loading => 'Memuat...';

  @override
  String get notConnected => 'Tidak terhubung';

  @override
  String get configureServerAddress => 'Konfigurasikan alamat server';

  @override
  String get latitude => 'Lintang';

  @override
  String get longitude => 'Bujur';

  @override
  String get locality => 'Lokalitas';

  @override
  String get stateProvince => 'Negara Bagian/Provinsi';

  @override
  String get countryCode => 'Kode Negara';

  @override
  String get information => 'Informasi';

  @override
  String get appVersion => 'Versi 1.0.0';

  @override
  String get appDescription =>
      'Aplikasi pendamping untuk BirdNET-Pi. Pantau deteksi burung dari Raspberry Pi Anda.';

  @override
  String connectedTo(String url) {
    return '✅ Terhubung ke $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Tidak dapat terhubung ke $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Kesalahan memuat pengaturan: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Pengaturan dasar berhasil disimpan';

  @override
  String get errorWhileSaving => 'Terjadi kesalahan saat menyimpan';

  @override
  String exceptionDuringSave(String error) {
    return 'Pengecualian selama penyimpanan: $error';
  }

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Pilih Model:';

  @override
  String get speciesRangeModel => 'Rentang spesies model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Ambang Batas Frekuensi Kemunculan Spesies [0,0005, 0,99]:';

  @override
  String get location => 'Lokasi';

  @override
  String get siteName => 'Nama Situs:';

  @override
  String get latitudeInput => 'Lintang:';

  @override
  String get longitudeInput => 'Bujur:';

  @override
  String get birdWeatherToken => 'Token BirdWeather:';

  @override
  String get notificationsApprise => 'Notifikasi (Apprise)';

  @override
  String get appriseConfig => 'Konfigurasi Pemberitahuan Apprise:';

  @override
  String get notificationTitle => 'Judul Notifikasi:';

  @override
  String get notificationBody => 'Isi Notifikasi:';

  @override
  String get notifyNewInfrequent =>
      'Beritahukan setiap deteksi spesies baru yang jarang terjadi';

  @override
  String get notifyFirstDetectionOfDay =>
      'Beritahu deteksi pertama setiap spesies pada hari itu';

  @override
  String get notifyEachNewDetection => 'Beritahu setiap deteksi baru';

  @override
  String get sendWeeklyReport => 'Kirim laporan mingguan';

  @override
  String get minTimeBetweenNotifications =>
      'Waktu minimum antara notifikasi spesies yang sama (detik):';

  @override
  String get excludeTheseSpecies =>
      'Kecualikan spesies berikut (dipisahkan koma):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'HANYA beri tahu untuk spesies ini (dipisahkan koma):';

  @override
  String get imageSource => 'Sumber Gambar';

  @override
  String get imageProvider => 'Penyedia Gambar:';

  @override
  String get flickrApiKey => 'Kunci API Flickr:';

  @override
  String get flickrFilterEmail => 'Hanya cari foto dari pengguna Flickr ini:';

  @override
  String get localization => 'Lokalisasi';

  @override
  String get databaseLanguage => 'Bahasa basis data:';

  @override
  String get otherInfo => 'Info lainnya';

  @override
  String get infoSite => 'Situs Informasi:';

  @override
  String get themeWeb => 'Tema Grafis (Web)';

  @override
  String get themeLight => 'Lampu';

  @override
  String get themeDark => 'Gelap';

  @override
  String get colorScheme => 'Skema Warna:';

  @override
  String get sfThreshHelp =>
      'Nilai ini digunakan oleh model untuk membatasi daftar kemungkinan spesies yang akan coba dideteksi, dengan mempertimbangkan frekuensi kemunculan minimum. Ambang batas 0,03 berarti agar suatu spesies dapat dimasukkan ke dalam daftar ini, spesies tersebut rata-rata harus terlihat pada setidaknya 3% dari daftar periksa eBird yang dikirimkan secara historis untuk minggu lintang/bujur/saat ini dalam tahun tertentu. Jadi, semakin rendah ambang batasnya, semakin langka spesies yang termasuk di dalamnya.';

  @override
  String get birdWeatherHelp =>
      'BirdWeather adalah peta cuaca untuk suara burung. Stasiun di seluruh dunia memasok aliran audio dan video ke BirdWeather yang kemudian dianalisis oleh BirdNET dan dibandingkan dengan data eBird Grid. CATATAN: Dengan menggunakan Token BirdWeather, Anda menyetujui untuk membagikan lanskap suara dan deteksi Anda dengan BirdWeather.';

  @override
  String get flickrHelp =>
      'Atur kunci API Flickr Anda untuk mengaktifkan tampilan gambar burung di samping deteksi. \'Hanya cari foto dari pengguna Flickr ini\' memungkinkan pemfilteran berdasarkan email akun tertentu.';

  @override
  String get databaseLangHelp => 'Hanya ubah ini pada pengaturan awal!';

  @override
  String get infoSiteHelp =>
      'Pilih tempat untuk mengambil informasi spesies tambahan. allaboutbirds.org adalah defaultnya; ebird.org memiliki lebih banyak spesies Eropa.';

  @override
  String get none => 'Tidak ada';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Pengaturan lanjutan berhasil disimpan';

  @override
  String get privacyRecordings => 'Privasi Rekaman';

  @override
  String get privacyThreshold => 'Ambang Privasi [0, 99]:';

  @override
  String get diskSpaceManagement => 'Manajemen Ruang Disk';

  @override
  String get whenDiskIsFull => 'Saat disk penuh:';

  @override
  String get purgeCapacity => 'Kapasitas pembersihan [% ambang batas]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Maksimum file yang disimpan per spesies (0 = nonaktifkan):';

  @override
  String get audioSettings => 'Pengaturan Audio';

  @override
  String get alsaInputCaptureDevice =>
      'Perangkat penangkap masukan ALSA (Kartu Suara):';

  @override
  String get numberOfAudioChannels =>
      'Jumlah saluran audio yang akan diekstrak:';

  @override
  String get overlap => 'Tumpang tindih (detik) [0, 2.9]:';

  @override
  String get audioFormat => 'Format Audio:';

  @override
  String get recordingLength => 'Panjang Rekaman (detik):';

  @override
  String get extractionLength => 'Panjang Ekstraksi (detik):';

  @override
  String get rtspAudioSharing => 'Berbagi Audio RTSP';

  @override
  String get shareLiveAudioStream =>
      'URL Aliran RTSP (Kosongkan untuk menonaktifkan)';

  @override
  String get playAudioStreamThroughWebUi =>
      'Putar streaming audio melalui UI Web?';

  @override
  String get caddyPassword => 'Kata sandi Caddy';

  @override
  String get appPassword => 'Kata sandi aplikasi:';

  @override
  String get customLogoImage => 'Logo Kustom';

  @override
  String get customImageUrl => 'URL Gambar Khusus:';

  @override
  String get customImageTitle => 'Judul Gambar Kustom:';

  @override
  String get birdNetLiteModelSettings => 'Pengaturan Model BirdNET-Lite';

  @override
  String get confidenceThreshold => 'Ambang batas keyakinan [0, 0,99]:';

  @override
  String get sensitivity => 'Sensitivitas [0,5, 1,5]:';

  @override
  String get otherSettings => 'Pengaturan Lainnya';

  @override
  String get silenceUpdateIndicator =>
      'Diamkan Indikator \"Pembaruan Tersedia\".';

  @override
  String get automaticUpdate => 'Pembaruan Otomatis';

  @override
  String get saveRawSpectrograms => 'Simpan spektrogram mentah';

  @override
  String get generateLdfcsStandard => 'LDFCS (Termal Standar)';

  @override
  String get generateLdfcsIndices => 'LDFCS (Indeks Akustik)';

  @override
  String get loggingLevels => 'Tingkat Pencatatan';

  @override
  String get birdnetRecordingService => 'Layanan Perekaman BirdNET:';

  @override
  String get spectrogramViewerService => 'Layanan Penampil Spektogram:';

  @override
  String get liveAudioStreamService => 'Layanan Streaming Audio Langsung:';

  @override
  String get speciesListsManagement => 'Manajemen Daftar Spesies';

  @override
  String get inclusion => 'Inklusi';

  @override
  String get exclusion => 'Eksklusi';

  @override
  String get whitelist => 'Daftar Putih';

  @override
  String get speciesAlreadyInList => 'Spesies sudah ada dalam daftar';

  @override
  String get listSavedSuccessfully => 'Daftar berhasil disimpan';

  @override
  String get errorSavingList => 'Terjadi kesalahan saat menyimpan daftar';

  @override
  String errorLoadingList(String error) {
    return 'Terjadi kesalahan saat memuat daftar:\\n$error';
  }

  @override
  String get retry => 'Coba lagi';

  @override
  String get searchSpeciesHint =>
      'Cari spesies (misalnya Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Memuat spesies...';

  @override
  String get errorLoadingSpecies => 'Terjadi kesalahan saat memuat spesies';

  @override
  String get noSpeciesInThisList => 'Tidak ada spesies dalam daftar ini.';

  @override
  String get removeFromList => 'Hapus dari daftar';

  @override
  String get saving => 'Menyimpan...';

  @override
  String get save => 'Simpan';

  @override
  String get loginRequired => 'Diperlukan login';

  @override
  String get loginTitle => 'Otentikasi';

  @override
  String get loginSubtitle =>
      'Masukkan kredensial Anda untuk mengakses fitur yang dilindungi.';

  @override
  String get username => 'Nama Pengguna';

  @override
  String get password => 'Kata Sandi';

  @override
  String get loginEmptyError => 'Silakan masukkan nama pengguna dan kata sandi';

  @override
  String get loginInvalidError => 'Kredensial tidak valid';

  @override
  String get authenticated => 'Terautentikasi';

  @override
  String get signIn => 'Masuk';

  @override
  String get loggedInMessage => 'Anda saat ini diautentikasi.';

  @override
  String get logout => 'Keluar';

  @override
  String get login => 'Masuk';

  @override
  String get audioStream => 'Aliran Audio';

  @override
  String get pressPlayToListen => 'Tekan putar untuk mendengarkan';

  @override
  String get loginToStart => 'Masuk dengan 🔒 untuk memulai';

  @override
  String get streamRequiresAuth =>
      'Aliran ini memerlukan autentikasi. Ketuk ikon 🔒 di kanan atas untuk masuk.';

  @override
  String get liveAudioFootnote => 'Audio Langsung BirdNET-Pi';

  @override
  String get unmute => 'Aktifkan suara';

  @override
  String get mute => 'Bisukan';

  @override
  String get resume => 'Lanjutkan';

  @override
  String get pause => 'Jeda';

  @override
  String get autoRefresh => 'Penyegaran otomatis';

  @override
  String get pressPlaySpectrogram => 'Tekan ▶ untuk melihat spektogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Tekan ▶ untuk memulai spektogram waktu nyata';

  @override
  String get loginThenPlay => 'Masuk dengan 🔒 lalu tekan ▶';

  @override
  String get currentAnalyzing => 'Sedang menganalisis';

  @override
  String get accessRestricted => 'Akses dibatasi';

  @override
  String get loginToAccessSection =>
      'Silakan login untuk mengakses bagian ini.';

  @override
  String get iframeNotSupported =>
      'Iframe didukung secara ketat pada versi web.';

  @override
  String get error => 'Kesalahan';

  @override
  String get otherUtilities => 'Utilitas lainnya';

  @override
  String liveSeconds(int seconds) {
    return 'LANGSUNG · $seconds dtk';
  }

  @override
  String get spectrogramNotAvailable => 'Spektogram tidak tersedia';

  @override
  String get ebirdCountIdentifier => 'No';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Tidak bergerak';

  @override
  String get ebirdProtocolIncidental => 'Insidentil';

  @override
  String get ebirdProtocolNFC => 'Hlm54';

  @override
  String get tooltipRefresh => 'Segarkan';

  @override
  String get tooltipStop => 'Berhenti';

  @override
  String get tooltipStart => 'Mulai';

  @override
  String get tooltipRestart => 'Mulai ulang';

  @override
  String get systemInfo => 'Info Sistem';

  @override
  String get fileManager => 'Manajer File';

  @override
  String get databaseMaintenance => 'Pemeliharaan Database';

  @override
  String get webTerminal => 'Terminal Web';

  @override
  String get tooltipOpenMenu => 'Buka menu';

  @override
  String get tooltipRefreshData => 'Segarkan data';

  @override
  String get tooltipPreviousDay => 'Hari sebelumnya';

  @override
  String get tooltipNextDay => 'Keesokan harinya';

  @override
  String get tooltipPreviousWeek => 'Minggu sebelumnya';

  @override
  String get tooltipNextWeek => 'Minggu depan';

  @override
  String get tooltipDeleteRecording => 'Hapus rekaman';

  @override
  String get tooltipClearSearch => 'Hapus pencarian';

  @override
  String get tooltipCloseSearch => 'Tutup pencarian';

  @override
  String get tooltipSearch => 'Cari';

  @override
  String get tooltipPlay => 'Putar audio';

  @override
  String get tooltipPickDate => 'Pilih tanggal';

  @override
  String get passwordOptionalHint => 'Biarkan kosong jika tidak disetel';

  @override
  String get systemStatus => 'Status Sistem';

  @override
  String get sysInfoUptime => 'Waktu Aktif';

  @override
  String get sysInfoDisk => 'Disk';

  @override
  String get sysInfoMemory => 'Memori';

  @override
  String get sysInfoCpuTemp => 'Suhu CPU';

  @override
  String get sysInfoBranch => 'Cabang';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count melakukan komitmen di belakang';
  }

  @override
  String get sysInfoLoadingError => 'Gagal memuat info sistem.';

  @override
  String get enable => 'Aktifkan';

  @override
  String get disable => 'Nonaktifkan';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Minggu $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Kelompokkan berdasarkan Spesies';

  @override
  String get groupByTime => 'Kelompokkan berdasarkan Waktu';

  @override
  String get readOnWikipedia => 'Baca di Wikipedia';

  @override
  String get loadingWikipedia => 'Memuat informasi dari Wikipedia...';

  @override
  String get noWikipediaInfo =>
      'Tidak ada informasi yang ditemukan di Wikipedia untuk spesies ini.';

  @override
  String get searchSpecies => 'Cari spesies...';

  @override
  String get noResultsFound => 'Tidak ada hasil yang ditemukan';

  @override
  String get noSpeciesDetected => 'Tidak ada spesies terdeteksi';

  @override
  String get species => 'Spesies';

  @override
  String get detections => 'Deteksi';

  @override
  String get maxConfidence => 'Keyakinan Maks';

  @override
  String get topSpecies => 'Spesies teratas';

  @override
  String get fromDate => 'Dari Tanggal';

  @override
  String get toDate => 'Sampai Tanggal';

  @override
  String get fromTime => 'Dari Jam';

  @override
  String get toTime => 'Sampai Jam';

  @override
  String get byPeriod => 'Berdasarkan periode';

  @override
  String get selectSpecies => 'Pilih Spesies';

  @override
  String get allSpecies => 'Semua Spesies';

  @override
  String get search => 'Mencari';

  @override
  String occurrenceCount(int count) {
    return 'N. $count';
  }

  @override
  String get firstSeen => 'Pertama Dilihat';

  @override
  String get lastSeen => 'Terakhir Dilihat';

  @override
  String get firstSeenPeriod => 'Pertama Kali Dilihat (Titik)';

  @override
  String get lastSeenPeriod => 'Terakhir Dilihat (Periode)';

  @override
  String get thirtyDaysTrend => 'Tren 30 Hari';

  @override
  String get avgConfidence => 'Rata-rata Konf.';

  @override
  String get mySpecies => 'Spesies Saya';

  @override
  String get bestDetection => 'Deteksi Terbaik';

  @override
  String get externalInfoLink => 'Info Eksternal';

  @override
  String get includedListInfo =>
      'Peringatan! Jika daftar ini berisi spesies APA PUN, sistem HANYA akan mengenali spesies tersebut. Biarkan daftar ini KOSONG kecuali Anda HANYA tertarik untuk mendeteksi spesies tertentu.';

  @override
  String get excludedListInfo =>
      'Setelah spesies yang diinginkan disorot, klik lalu klik TAMBAHKAN untuk mengecualikannya.';

  @override
  String get whitelistInfo =>
      'Setelah spesies yang diinginkan disorot, klik lalu klik TAMBAHKAN untuk memasukkannya ke daftar putih. Spesies ini akan terdeteksi bahkan jika di bawah Ambang Batas Frekuensi Kejadian Spesies (Species Occurrence Frequency Threshold) dalam pengaturan. Ini bukan cara kerja yang direkomendasikan: lebih baik mencoba terlebih dahulu kedua model Kejadian Spesies (v1 dan v2.4).';

  @override
  String get overnightRange => 'Rentang malam (melewati tengah malam)';

  @override
  String get resetFilters => 'Setel ulang filter';

  @override
  String invalidValueRange(num min, num max) {
    return 'Nilai harus antara $min dan $max';
  }

  @override
  String get speciesListTester => 'Penguji Daftar Spesies';

  @override
  String get previewSpeciesList => 'Pratinjau Daftar Spesies';

  @override
  String get threshold => 'Ambang:';

  @override
  String get sfThreshHelpExtended =>
      'Nilai ini digunakan oleh model untuk membatasi daftar kemungkinan spesies yang akan coba dideteksi, dengan mempertimbangkan frekuensi kemunculan minimum. Ambang batas 0,03 berarti agar suatu spesies dapat dimasukkan ke dalam daftar ini, spesies tersebut rata-rata harus terlihat pada setidaknya 3% dari daftar periksa eBird yang dikirimkan secara historis untuk minggu lintang/bujur/saat ini dalam tahun tertentu. Jadi, semakin rendah ambang batasnya, semakin langka spesies yang termasuk di dalamnya.\n\n[Tulisan teknis mendalam di sini](https://github.com/kahst/BirdNET-Analyzer/discussions/234)';

  @override
  String get sfThreshTesterHint =>
      'Jika Anda ingin mengutak-atik nilai ambang batas ini dan melihat spesies mana yang masuk dalam daftar, Anda dapat menggunakan alat Penguji Daftar Spesies di bawah.';

  @override
  String get sfThreshTesterLegacyHint =>
      'Silakan klik \"Perbarui Pengaturan\" di bagian paling bawah halaman ini untuk menginstal file label yang sesuai, lalu kembali ke sini dan Anda akan dapat menggunakan Penguji Daftar Spesies.';

  @override
  String get appriseConfigHelp =>
      'Notifikasi Apprise dapat diatur dan diaktifkan untuk 90+ layanan notifikasi. Setiap layanan harus berada pada jalurnya sendiri.\n\n**Contoh:**\n- `mailto://<pengguna>:<kata sandi>@gmail.com`\n- `tgram://<bot_token>/<chat_id>`\n- `perselisihan://<WebhookID>/<WebhookToken>`\n\n[Wiki Apprise Lengkap](https://github.com/caronc/apprise/wiki)';

  @override
  String get notificationVarsHelp =>
      'Anda dapat menggunakan variabel berikut di judul dan isi Anda:\n\n- `\$sciname`: Nama Ilmiah\n- `\$comname`: Nama Umum\n- `\$confidentpct`: Skor keyakinan sebagai persentase\n- `\$listenurl`: Tautan ke deteksi\n- `\$tanggal`, `\$waktu`, `\$minggu`: Info Tanggal/Waktu\n- `\$image`: Gambar spesies\n- `\$reason`: Alasan pemberitahuan';

  @override
  String get excludeSpeciesHelp =>
      'Kecualikan spesies ini dari pemberitahuan (nama umum dipisahkan koma). Contoh: `Merpati Berkabung, Gagak Amerika`.';

  @override
  String get includeSpeciesHelp =>
      'HANYA beri tahu untuk spesies ini (nama umum yang dipisahkan koma).';

  @override
  String get serverUrl => 'URL server';

  @override
  String get pleaseEnterUrl => 'Silakan masukkan URL server';

  @override
  String get serverUnreachable =>
      'Server tidak dapat dijangkau. Silakan periksa alamatnya dan coba lagi.';

  @override
  String get welcomeToBirdNetPi => 'Selamat datang di BirdNET-Pi';

  @override
  String get enterServerUrlDescription =>
      'Untuk memulai, silakan masukkan URL server BirdNET-Pi Anda.';

  @override
  String get connect => 'Menghubungkan';

  @override
  String get serverUpdatedSuccessfully => 'Server berhasil diperbarui!';

  @override
  String get serverInformation => 'Informasi Server';

  @override
  String get noData => 'Tidak ada data';

  @override
  String get trends => 'Tren';

  @override
  String get selectSpeciesToViewTrends => 'Pilih spesies untuk melihat tren';

  @override
  String speciesDetailsError(String error) {
    return 'Kesalahan detail spesies: $error';
  }

  @override
  String get fromLabel => 'Dari';

  @override
  String get toLabel => 'Ke';

  @override
  String get exportMenuLabel => 'Ekspor';

  @override
  String get exportDataTitle => 'Ekspor Data';

  @override
  String get ebirdExportDesc =>
      'Alur terpandu untuk mengirimkan daftar periksa.';

  @override
  String get csvExport => 'Ekspor ke CSV';

  @override
  String get csvExportDesc =>
      'Data mentah disaring berdasarkan tanggal dan spesies.';

  @override
  String get audioZipExport => 'Ekspor Audio Harian';

  @override
  String get audioZipExportDesc => 'Minta zip semua rekaman.';

  @override
  String get zipManager => 'Manajemen Zip';

  @override
  String get zipManagerDesc => 'Unduh atau hapus file zip di server.';

  @override
  String get startDate => 'Tanggal Mulai';

  @override
  String get endDate => 'Tanggal Berakhir';

  @override
  String get filterBySpeciesOptional => 'Filter berdasarkan Spesies (Opsional)';

  @override
  String get selectedSpecies => 'Spesies Terpilih';

  @override
  String get emptyIncludeAllSpecies => '* Jika kosong: mencakup semua spesies';

  @override
  String get executeExport => 'MELAKSANAKAN EKSPOR';

  @override
  String get chooseFullDayText =>
      'Pilih hari di mana Anda ingin mengekspor rekaman:';

  @override
  String get requestZipGeneration => 'PERMINTAAN GENERASI ZIP';

  @override
  String get zipGenerationWarning =>
      '* Operasi mungkin memakan waktu beberapa menit. Anda dapat mengunduh zip dari bagian \"Manajemen Zip\".';

  @override
  String get zipGenerationStarted =>
      'Pembuatan ZIP dimulai. File akan tersedia di bagian Manajemen ZIP.';

  @override
  String get refreshList => 'Segarkan daftar';

  @override
  String get downloadZip => 'Unduh';

  @override
  String get filterSpecies => 'Filter Spesies';

  @override
  String get allSpeciesWillBeExported => 'Semua spesies akan diekspor.';

  @override
  String get export => 'Ekspor';

  @override
  String get hourlyDistributionDetections => 'Distribusi per jam (deteksi)';

  @override
  String get dayNightWeatherProfile => 'Profil cuaca siang/malam';

  @override
  String get dailyDetections => 'Deteksi harian';

  @override
  String get temperatureUnitLabel => 'Suhu (°C)';

  @override
  String get windSpeedUnitLabel => 'Kecepatan angin (km/jam)';

  @override
  String get densityMapSunInfo =>
      'Peta kepadatan dengan matahari terbit/terbenam';

  @override
  String get externalSheet => 'Lembar eksternal';

  @override
  String get totalAllTime => 'Total keseluruhan';

  @override
  String get detectionsLabel => 'Deteksi';

  @override
  String get maxConfidenceLabel => 'Tingkat keyakinan maks';

  @override
  String get averageConfidenceLabel => 'Tingkat keyakinan rata-rata';

  @override
  String get dayLegend => 'Siang ☀️';

  @override
  String get nightLegend => 'Malam 🌙';

  @override
  String get weatherClear => 'Cerah';

  @override
  String get weatherCloudy => 'Berawan';

  @override
  String get weatherFog => 'Kabut';

  @override
  String get weatherRain => 'Hujan';

  @override
  String get weatherSnow => 'Salju';

  @override
  String get weatherThunderstorm => 'Badai petir';

  @override
  String get loadingAudioLabel => 'Memuat audio...';

  @override
  String get errorLoadingAudioLabel => 'Kesalahan memuat audio';

  @override
  String get detectionsTotal => 'Deteksi';

  @override
  String get ebirdExportError => 'Kesalahan permintaan ZIP.';

  @override
  String get temperature => 'Suhu';

  @override
  String get wind => 'Angin';

  @override
  String get dateLabel => 'Tanggal';

  @override
  String get notAvailable => 'T/A';

  @override
  String get ldfcsStandardTitle => 'Spektrogram Durasi Panjang (Standar)';

  @override
  String get ldfcsIndicesTitle => 'Spektrogram Durasi Panjang (Indeks Akustik)';

  @override
  String get ldfcsDescription => 'Visualisasi rekaman 24 jam';

  @override
  String get weeklyLdfcsStandard => 'LDFCS Mingguan (Standar)';

  @override
  String get weeklyLdfcsIndices => 'LDFCS Mingguan (Indeks Akustik)';

  @override
  String get monthlyLdfcsStandard => 'LDFCS Bulanan (Standar)';

  @override
  String get monthlyLdfcsIndices => 'LDFCS Bulanan (Indeks Akustik)';

  @override
  String get dailyInsightsTitle => 'Wawasan Harian';

  @override
  String get weeklyInsightsTitle => 'Wawasan Mingguan';

  @override
  String get monthlyInsightsTitle => 'Wawasan Bulanan';

  @override
  String get hourlyActivityTitle => 'Aktivitas Per Jam';

  @override
  String get speciesDiversityTitle => 'Keanekaragaman Spesies';

  @override
  String get others => 'Lainnya';

  @override
  String get detShort => 'DET';
}
