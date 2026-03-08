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
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count deteksi';
  }

  @override
  String get filterDetections => 'Filter Deteksi';

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
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Grafik tidak tersedia';

  @override
  String get weeklyReport => 'Laporan Mingguan';

  @override
  String get newSpecies => 'Spesies Baru';

  @override
  String get newFemale => 'New!';

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
    return 'Do you want to delete \"$name\" from $date $time?';
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
  String get noRecordingsAvailable => 'No recordings available.';

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
      'Automatic detections via BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully => 'Download started successfully!';

  @override
  String get cannotDownloadCsv => 'Cannot download CSV.';

  @override
  String get zipDownloadInProgress => 'ZIP download in progress...';

  @override
  String get cannotOpenZipUrl => 'Cannot open URL for ZIP download';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'The server did not return the download URL.';

  @override
  String get unknownError => 'Unknown error';

  @override
  String get serverError => 'Server Error';

  @override
  String get ebirdExport => 'Ekspor eBird';

  @override
  String get generateCsvForEbird => 'Buat CSV untuk eBird';

  @override
  String get downloadAudioZip => 'Unduh Audio (ZIP)';

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
  String get autoRemoveLessThan80 => 'Automatically remove < 80%';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Species read: $totalSpecies | Occurrences: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count detections';
  }

  @override
  String get protocol => 'Protokol';

  @override
  String get stationaryPoint => 'Stasioner - Titik Tetap';

  @override
  String get nocturnalFlightCall => 'Panggilan Terbang Nokturnal (NFC)';

  @override
  String get incidental => 'Incidental';

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
  String get totalUniqueSpecies => 'Total Species (Unique)';

  @override
  String get hourlyModeledChecklists => 'Hourly modeled checklists';

  @override
  String get averageConfidence => 'Average Confidence';

  @override
  String get wizardInfoText =>
      'By pressing \"Generate CSV\", the file will be compiled dividing the stations by hour, ready to be uploaded to eBird.';

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
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Perbarui';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Matikan';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Hapus Semua Data';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Layanan';

  @override
  String get liveAudioStream => 'Live Audio Stream';

  @override
  String get birdNetAnalysis => 'BirdNET Analysis';

  @override
  String get birdNetRecording => 'BirdNET Recording';

  @override
  String get birdNetLog => 'BirdNET Log';

  @override
  String get chartViewer => 'Chart Viewer';

  @override
  String get spectrogram => 'Spektrogram';

  @override
  String get quickActions => 'Tindakan Cepat';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Konfirmasi';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Perintah dijalankan';

  @override
  String errorMsg(String error) {
    return '❌ Kesalahan: $error';
  }

  @override
  String get species => 'Spesies';

  @override
  String get noSpeciesDetected => 'Tidak ada spesies terdeteksi';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Deteksi';

  @override
  String get maxConfidence => 'Kepercayaan Maksimal';

  @override
  String get searchSpecies => 'Cari spesies...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Pengaturan';

  @override
  String get basicSettings => 'Pengaturan Dasar';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Pengaturan Lanjutan';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Koneksi';

  @override
  String get birdNetPiServerAddress => 'Alamat Server BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Informasi Perangkat';

  @override
  String get loading => 'Memuat...';

  @override
  String get notConnected => 'Tidak terhubung';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Lintang';

  @override
  String get longitude => 'Bujur';

  @override
  String get locality => 'Lokalitas';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Kode Negara';

  @override
  String get information => 'Informasi';

  @override
  String get appVersion => 'Versi 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

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
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Pilih Model:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

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
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Judul Notifikasi:';

  @override
  String get notificationBody => 'Isi Notifikasi:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Beritahu setiap deteksi baru';

  @override
  String get sendWeeklyReport => 'Kirim laporan mingguan';

  @override
  String get minTimeBetweenNotifications =>
      'Minimum time between notifications of the same species (sec):';

  @override
  String get excludeTheseSpecies => 'Exclude these species (comma separated):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'ONLY notify for these species (comma separated):';

  @override
  String get imageSource => 'Image Source';

  @override
  String get imageProvider => 'Image Provider:';

  @override
  String get flickrApiKey => 'Flickr API Key:';

  @override
  String get flickrFilterEmail => 'Only search photos from this Flickr user:';

  @override
  String get localization => 'Lokalisasi';

  @override
  String get databaseLanguage => 'Bahasa basis data:';

  @override
  String get otherInfo => 'Info lainnya';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Tema Grafis (Web)';

  @override
  String get colorScheme => 'Skema Warna:';

  @override
  String get none => 'Tidak ada';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Pengaturan lanjutan berhasil disimpan';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Manajemen Ruang Disk';

  @override
  String get whenDiskIsFull => 'Saat disk penuh:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Pengaturan Audio';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Tumpang tindih (detik) [0, 2.9]:';

  @override
  String get audioFormat => 'Format Audio:';

  @override
  String get recordingLength => 'Panjang Rekaman (detik):';

  @override
  String get extractionLength => 'Panjang Ekstraksi (detik):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Kata sandi Caddy';

  @override
  String get appPassword => 'Kata sandi aplikasi:';

  @override
  String get customLogoImage => 'Logo Kustom';

  @override
  String get customImageUrl => 'Custom Image URL:';

  @override
  String get customImageTitle => 'Custom Image Title:';

  @override
  String get birdNetLiteModelSettings => 'BirdNET-Lite Model Settings';

  @override
  String get confidenceThreshold => 'Confidence threshold [0, 0.99]:';

  @override
  String get sensitivity => 'Sensitivity [0.5, 1.5]:';

  @override
  String get otherSettings => 'Other Settings';

  @override
  String get silenceUpdateIndicator => 'Silence \"Update Available\" Indicator';

  @override
  String get automaticUpdate => 'Pembaruan Otomatis';

  @override
  String get saveRawSpectrograms => 'Simpan spektrogram mentah';

  @override
  String get loggingLevels => 'Tingkat Pencatatan';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

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
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Coba lagi';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Memuat spesies...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

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
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Nama Pengguna';

  @override
  String get password => 'Kata Sandi';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Terautentikasi';

  @override
  String get signIn => 'Masuk';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Keluar';

  @override
  String get login => 'Masuk';

  @override
  String get audioStream => 'Aliran Audio';

  @override
  String get pressPlayToListen => 'Tekan putar untuk mendengarkan';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

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
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Sedang menganalisis';

  @override
  String get accessRestricted => 'Akses dibatasi';

  @override
  String get loginToAccessSection =>
      'Silakan login untuk mengakses bagian ini.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Kesalahan';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Utilitas lainnya';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · ${seconds}detik';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram not available';

  @override
  String get ebirdCountIdentifier => 'No';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationary';

  @override
  String get ebirdProtocolIncidental => 'Incidental';

  @override
  String get ebirdProtocolNFC => 'P54';

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
  String get tooltipRefreshData => 'Refresh data';

  @override
  String get tooltipPreviousDay => 'Previous day';

  @override
  String get tooltipNextDay => 'Next day';

  @override
  String get tooltipPreviousWeek => 'Previous week';

  @override
  String get tooltipNextWeek => 'Next week';

  @override
  String get tooltipDeleteRecording => 'Delete recording';

  @override
  String get tooltipClearSearch => 'Clear search';

  @override
  String get tooltipCloseSearch => 'Close search';

  @override
  String get tooltipSearch => 'Cari';

  @override
  String get tooltipPlay => 'Putar audio';

  @override
  String get tooltipPickDate => 'Pilih tanggal';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

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
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Aktifkan';

  @override
  String get disable => 'Nonaktifkan';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Minggu $weekNumber - $year';
  }
}
