// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Monitorizarea păsărilor';

  @override
  String get home => 'Acasă';

  @override
  String get today => 'Astăzi';

  @override
  String get recordings => 'Înregistrări';

  @override
  String get liveStream => 'Flux live';

  @override
  String get liveSpectrogram => 'Spectrogramă live';

  @override
  String get speciesManagement => 'GESTIONAREA SPECIILOR';

  @override
  String get inclusionList => 'Lista de incluziune';

  @override
  String get exclusionList => 'Lista de excludere';

  @override
  String get analysisLog => 'Jurnal de analiză';

  @override
  String get openWebInterface => 'Deschide interfața web';

  @override
  String get loadingLiveSpectrogram => 'Se încarcă spectrograma live...';

  @override
  String get spectrogramInstruction =>
      'Dacă sunetul nu pornește automat, interacționați cu pagina sau verificați permisiunile browserului.';

  @override
  String get configureServerFirst =>
      'Configurați mai întâi adresa serverului în Setări';

  @override
  String get recentDetections => 'Detecții recente';

  @override
  String get latestDetection => 'Ultima detecție';

  @override
  String get audioFile => 'Fișier audio';

  @override
  String get playing => 'Se redă';

  @override
  String get noDetectionsToday => 'Nicio detecție astăzi';

  @override
  String get systemListening => 'Sistemul ascultă...';

  @override
  String get errorOccurred => 'A apărut o eroare';

  @override
  String get overview => 'Prezentare generală';

  @override
  String get detectionsAllTime => 'Detecții\ntotal';

  @override
  String get detectionsToday => 'Detecții\nastăzi';

  @override
  String get detectionsLastHour => 'Detecții\nultima oră';

  @override
  String get speciesToday => 'Specii\nastăzi';

  @override
  String get speciesAllTime => 'Specii\ntotal';

  @override
  String get statsLoadingError => 'Eroare la încărcarea statisticilor';

  @override
  String get todaysDetections => 'Detecțiile de astăzi';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count detecții';
  }

  @override
  String get filterDetections => 'Filtrează detecțiile';

  @override
  String get minimumConfidenceThreshold => 'Prag minim de încredere';

  @override
  String get reset => 'Resetare';

  @override
  String get apply => 'Aplică';

  @override
  String get charts => 'Grafice';

  @override
  String get daily => 'Zilnic';

  @override
  String get weekly => 'Săptămânal';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Niciun grafic disponibil';

  @override
  String get weeklyReport => 'Raport săptămânal';

  @override
  String get newSpecies => 'Specie nouă';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Specii identificate';

  @override
  String get byDate => 'După dată';

  @override
  String get bySpecies => 'După specie';

  @override
  String exportToEbird(String date) {
    return 'Exportă către eBird ($date)';
  }

  @override
  String get noRecordings => 'Nicio înregistrare';

  @override
  String get deleteRecording => 'Șterge înregistrarea';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Anulează';

  @override
  String get delete => 'Șterge';

  @override
  String get noSpeciesFound => 'Nicio specie găsită.';

  @override
  String get unknown => 'Necunoscut';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Redă';

  @override
  String get changeId => 'Schimbă ID';

  @override
  String get protect => 'Protejează';

  @override
  String get unprotect => 'Anulează protecția';

  @override
  String get download => 'Descarcă';

  @override
  String get cannotDownloadFile => 'Nu se poate descărca fișierul';

  @override
  String get errorLoading => 'Eroare la încărcare';

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
  String get ebirdExport => 'Export eBird';

  @override
  String get generateCsvForEbird => 'Generează CSV pentru eBird';

  @override
  String get downloadAudioZip => 'Descarcă audio (ZIP)';

  @override
  String get close => 'Închide';

  @override
  String get continueStep => 'Continuă';

  @override
  String get back => 'Înapoi';

  @override
  String get review => 'Revizuire';

  @override
  String get configuration => 'Configurație';

  @override
  String get summary => 'Rezumat';

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
  String get protocol => 'Protocol';

  @override
  String get stationaryPoint => 'Staționar - Punct fix';

  @override
  String get nocturnalFlightCall => 'Sunet de zbor nocturn (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Nume localitate *';

  @override
  String get requiredField => 'Câmp obligatoriu';

  @override
  String get numberOfObservers => 'Număr de observatori';

  @override
  String get additionalComments => 'Comentarii suplimentare';

  @override
  String get includeAudioFileNamesInComments =>
      'Include numele fișierelor audio în comentarii';

  @override
  String get readyForExport => 'Gata pentru export';

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
  String get statistics => 'Statistici';

  @override
  String get systemLogs => 'Jurnale de sistem';

  @override
  String get systemTools => 'Instrumente de sistem';

  @override
  String get systemControls => 'Controale de sistem';

  @override
  String get restart => 'Repornire';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Actualizare';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Oprire';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Șterge toate datele';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Servicii';

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
  String get spectrogram => 'Spectrogramă';

  @override
  String get quickActions => 'Acțiuni rapide';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Confirmă';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Comandă executată';

  @override
  String errorMsg(String error) {
    return '❌ Eroare: $error';
  }

  @override
  String get species => 'Specii';

  @override
  String get noSpeciesDetected => 'Nicio specie detectată';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Detecții';

  @override
  String get maxConfidence => 'Încredere maximă';

  @override
  String get searchSpecies => 'Caută specii...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Setări';

  @override
  String get basicSettings => 'Setări de bază';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Setări avansate';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Conexiune';

  @override
  String get birdNetPiServerAddress => 'Adresă server BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Informații dispozitiv';

  @override
  String get loading => 'Se încarcă...';

  @override
  String get notConnected => 'Neconectat';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Latitudine';

  @override
  String get longitude => 'Longitudine';

  @override
  String get locality => 'Localitate';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Cod țară';

  @override
  String get information => 'Informații';

  @override
  String get appVersion => 'Versiunea 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Conectat la $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Nu se poate conecta la $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Eroare la încărcarea setărilor: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Setările de bază au fost salvate';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Selectați un model:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Locație';

  @override
  String get siteName => 'Nume site:';

  @override
  String get latitudeInput => 'Latitudine:';

  @override
  String get longitudeInput => 'Longitudine:';

  @override
  String get birdWeatherToken => 'Token BirdWeather:';

  @override
  String get notificationsApprise => 'Notificări (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Titlu notificare:';

  @override
  String get notificationBody => 'Mesaj notificare:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Notifică fiecare detecție nouă';

  @override
  String get sendWeeklyReport => 'Trimite raport săptămânal';

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
  String get localization => 'Localizare';

  @override
  String get databaseLanguage => 'Limba bazei de date:';

  @override
  String get otherInfo => 'Alte info';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Temă grafică (Web)';

  @override
  String get colorScheme => 'Schemă de culori:';

  @override
  String get none => 'Niciuna';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Setările avansate au fost salvate';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Gestionare spațiu disc';

  @override
  String get whenDiskIsFull => 'Când discul este plin:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Setări audio';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Suprapunere (sec) [0, 2.9]:';

  @override
  String get audioFormat => 'Format audio:';

  @override
  String get recordingLength => 'Lungime înregistrare (sec):';

  @override
  String get extractionLength => 'Lungime extracție (sec):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Parolă Caddy';

  @override
  String get appPassword => 'Parolă aplicație:';

  @override
  String get customLogoImage => 'Logo personalizat';

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
  String get automaticUpdate => 'Actualizare automată';

  @override
  String get saveRawSpectrograms => 'Salvează spectrograme brute';

  @override
  String get loggingLevels => 'Niveluri jurnalizare';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Gestionare liste specii';

  @override
  String get inclusion => 'Incluziune';

  @override
  String get exclusion => 'Excludere';

  @override
  String get whitelist => 'Lista albă';

  @override
  String get speciesAlreadyInList => 'Specia este deja în listă';

  @override
  String get listSavedSuccessfully => 'Lista a fost salvată';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Reîncearcă';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Se încarcă speciile...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'Nicio specie în această listă.';

  @override
  String get removeFromList => 'Elimină din listă';

  @override
  String get saving => 'Se salvează...';

  @override
  String get save => 'Salvează';

  @override
  String get loginRequired => 'Autentificare necesară';

  @override
  String get loginTitle => 'Autentificare';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Utilizator';

  @override
  String get password => 'Parolă';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Autentificat';

  @override
  String get signIn => 'Autentificare';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Deconectare';

  @override
  String get login => 'Autentificare';

  @override
  String get audioStream => 'Flux audio';

  @override
  String get pressPlayToListen => 'Apasă redare pentru a asculta';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Activează sunetul';

  @override
  String get mute => 'Fără sunet';

  @override
  String get resume => 'Reluare';

  @override
  String get pause => 'Pauză';

  @override
  String get autoRefresh => 'Actualizare automată';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Se analizează acum';

  @override
  String get accessRestricted => 'Acces restricționat';

  @override
  String get loginToAccessSection =>
      'Autentifică-te pentru a accesa această secțiune.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Eroare';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Alte utilități';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram not available';

  @override
  String get ebirdCountIdentifier => 'Nr';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationary';

  @override
  String get ebirdProtocolIncidental => 'Incidental';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Reîmprospătare';

  @override
  String get tooltipStop => 'Oprește';

  @override
  String get tooltipStart => 'Pornește';

  @override
  String get tooltipRestart => 'Repornește';

  @override
  String get systemInfo => 'Informații sistem';

  @override
  String get fileManager => 'Manager fișiere';

  @override
  String get databaseMaintenance => 'Întreținere bază de date';

  @override
  String get webTerminal => 'Terminal web';

  @override
  String get tooltipOpenMenu => 'Deschide meniul';

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
  String get tooltipSearch => 'Caută';

  @override
  String get tooltipPlay => 'Redă audio';

  @override
  String get tooltipPickDate => 'Alege data';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Stare sistem';

  @override
  String get sysInfoUptime => 'Timp funcționare';

  @override
  String get sysInfoDisk => 'Disc';

  @override
  String get sysInfoMemory => 'Memorie';

  @override
  String get sysInfoCpuTemp => 'Temp. CPU';

  @override
  String get sysInfoBranch => 'Branch';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Activează';

  @override
  String get disable => 'Dezactivează';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Săptămâna $weekNumber - $year';
  }
}
