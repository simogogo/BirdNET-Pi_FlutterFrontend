// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Lindude seire';

  @override
  String get home => 'Avaleht';

  @override
  String get today => 'Täna';

  @override
  String get recordings => 'Salvestised';

  @override
  String get liveStream => 'Otseülekanne';

  @override
  String get liveSpectrogram => 'Otse-spektrogramm';

  @override
  String get speciesManagement => 'LIIGIDHALDUS';

  @override
  String get inclusionList => 'Lubatud liigid';

  @override
  String get exclusionList => 'Välistatud liigid';

  @override
  String get analysisLog => 'Analüüsi logi';

  @override
  String get openWebInterface => 'Ava veebiliides';

  @override
  String get loadingLiveSpectrogram => 'Otse-spektrogrammi laadimine...';

  @override
  String get spectrogramInstruction =>
      'Kui heli ei alga automaatselt, siis tegutsege lehel või kontrollige brauseri õigusi.';

  @override
  String get configureServerFirst =>
      'Konfigureerige esmalt serveri aadress seadetes';

  @override
  String get recentDetections => 'Viimati tuvastatud';

  @override
  String get latestDetection => 'Viimane tuvastus';

  @override
  String get audioFile => 'Helifail';

  @override
  String get playing => 'Mängib';

  @override
  String get noDetectionsToday => 'Täna pole tuvastusi';

  @override
  String get systemListening => 'Süsteem kuulatab...';

  @override
  String get errorOccurred => 'Tekkis viga';

  @override
  String get overview => 'Ülevaade';

  @override
  String get detectionsAllTime => 'Tuvastusi\nkokku';

  @override
  String get detectionsToday => 'Tuvastusi\ntäna';

  @override
  String get detectionsLastHour => 'Tuvastusi\nviimane tund';

  @override
  String get speciesToday => 'Liike\ntäna';

  @override
  String get speciesAllTime => 'Liike\nkokku';

  @override
  String get statsLoadingError => 'Viga statistika laadimisel';

  @override
  String get todaysDetections => 'Tänased tuvastused';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count tuvastust';
  }

  @override
  String get filterDetections => 'Filtreeri tuvastusi';

  @override
  String get minimumConfidenceThreshold => 'Minimaalne usaldusväärsus';

  @override
  String get reset => 'Lähtesta';

  @override
  String get apply => 'Rakenda';

  @override
  String get charts => 'Graafikud';

  @override
  String get daily => 'Päevas';

  @override
  String get weekly => 'Nädalas';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Graafikut pole saadaval';

  @override
  String get weeklyReport => 'Nädalaaruanne';

  @override
  String get newSpecies => 'Uus liik';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Tuvastatud liigid';

  @override
  String get byDate => 'Kuupäeva järgi';

  @override
  String get bySpecies => 'Liigi järgi';

  @override
  String exportToEbird(String date) {
    return 'Ekspordi eBirdi ($date)';
  }

  @override
  String get noRecordings => 'Salvestisi pole';

  @override
  String get deleteRecording => 'Kustuta salvestis';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Tühista';

  @override
  String get delete => 'Kustuta';

  @override
  String get noSpeciesFound => 'Liike ei leitud.';

  @override
  String get unknown => 'Tundmatu';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Mängi';

  @override
  String get changeId => 'Muuda ID-d';

  @override
  String get protect => 'Kaitse';

  @override
  String get unprotect => 'Eemalda kaitse';

  @override
  String get download => 'Laadi alla';

  @override
  String get cannotDownloadFile => 'Faili ei saa alla laadida';

  @override
  String get errorLoading => 'Viga laadimisel';

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
  String get ebirdExport => 'eBirdi eksport';

  @override
  String get generateCsvForEbird => 'Loo eBirdi jaoks CSV';

  @override
  String get downloadAudioZip => 'Laadi alla heli (ZIP)';

  @override
  String get close => 'Sulge';

  @override
  String get continueStep => 'Jätka';

  @override
  String get back => 'Tagasi';

  @override
  String get review => 'Ülevaatus';

  @override
  String get configuration => 'Konfiguratsioon';

  @override
  String get summary => 'Kokkuvõte';

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
  String get protocol => 'Protokoll';

  @override
  String get stationaryPoint => 'Statsionaarne - Punkt';

  @override
  String get nocturnalFlightCall => 'Öine rändehäälitsus (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Asukoha nimi *';

  @override
  String get requiredField => 'Kohustuslik väli';

  @override
  String get numberOfObservers => 'Vaatlejate arv';

  @override
  String get additionalComments => 'Lisakommentaarid';

  @override
  String get includeAudioFileNamesInComments =>
      'Lisa helifailide nimed kommentaaridesse';

  @override
  String get readyForExport => 'Valmis ekspordiks';

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
  String get statistics => 'Statistika';

  @override
  String get systemLogs => 'Süsteemi logid';

  @override
  String get systemTools => 'Süsteemi tööriistad';

  @override
  String get systemControls => 'Süsteemi juhtimine';

  @override
  String get restart => 'Taaskäivita';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Uuenda';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Lülita välja';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Kustuta kõik andmed';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Teenused';

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
  String get spectrogram => 'Spektrogramm';

  @override
  String get quickActions => 'Kiirtoimingud';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Kinnita';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Käsk täidetud';

  @override
  String errorMsg(String error) {
    return '❌ Viga: $error';
  }

  @override
  String get species => 'Liigid';

  @override
  String get noSpeciesDetected => 'Liike pole tuvastatud';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Tuvastused';

  @override
  String get maxConfidence => 'Maksimaalne usaldusväärsus';

  @override
  String get searchSpecies => 'Otsi liike...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Seaded';

  @override
  String get basicSettings => 'Põhiseaded';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Lisaseaded';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Ühendus';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi serveri aadress';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Seadme info';

  @override
  String get loading => 'Laadimine...';

  @override
  String get notConnected => 'Pole ühendatud';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Laiuskraad';

  @override
  String get longitude => 'Pikkuskraad';

  @override
  String get locality => 'Asula';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Riigikood';

  @override
  String get information => 'Info';

  @override
  String get appVersion => 'Versioon 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Ühendatud aadressiga $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Aadressiga $url ei saa ühendust';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Viga seadete laadimisel: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully => 'Põhiseaded edukalt salvestatud';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Mudel';

  @override
  String get selectAModel => 'Vali mudel:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Asukoht';

  @override
  String get siteName => 'Koha nimi:';

  @override
  String get latitudeInput => 'Laiuskraad:';

  @override
  String get longitudeInput => 'Pikkuskraad:';

  @override
  String get birdWeatherToken => 'BirdWeather token:';

  @override
  String get notificationsApprise => 'Teavitused (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Teavituse pealkiri:';

  @override
  String get notificationBody => 'Teavituse sisu:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Teavita igast uuest tuvastusest';

  @override
  String get sendWeeklyReport => 'Saada nädalaaruanne';

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
  String get localization => 'Lokalisatsioon';

  @override
  String get databaseLanguage => 'Andmebaasi keel:';

  @override
  String get otherInfo => 'Muu info';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Graafiline teema (Web)';

  @override
  String get colorScheme => 'Värviskeem:';

  @override
  String get none => 'Puudub';

  @override
  String get advancedSettingsSavedSuccessfully => 'Lisaseaded salvestatud';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Kettaruumi haldus';

  @override
  String get whenDiskIsFull => 'Kui ketas on täis:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Heliseaded';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Kattuvus (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Helivorming:';

  @override
  String get recordingLength => 'Salvestuse pikkus (sek):';

  @override
  String get extractionLength => 'Väljavõtte pikkus (sek):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Caddy parool';

  @override
  String get appPassword => 'Rakenduse parool:';

  @override
  String get customLogoImage => 'Kohandatud logo';

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
  String get automaticUpdate => 'Automaatne uuendamine';

  @override
  String get saveRawSpectrograms => 'Salvesta toorspektrogrammid';

  @override
  String get loggingLevels => 'Logimistasemed';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Liigiloendite haldus';

  @override
  String get inclusion => 'Lisamine';

  @override
  String get exclusion => 'Välistamine';

  @override
  String get whitelist => 'Valge nimekiri';

  @override
  String get speciesAlreadyInList => 'Liik on juba nimekirjas';

  @override
  String get listSavedSuccessfully => 'Nimekiri salvestatud';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Proovi uuesti';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Liikide laadimine...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'Selles nimekirjas pole liike.';

  @override
  String get removeFromList => 'Eemalda nimekirjast';

  @override
  String get saving => 'Salvestamine...';

  @override
  String get save => 'Salvesta';

  @override
  String get loginRequired => 'Selleks tegevuseks on vajalik sisselogimine';

  @override
  String get loginTitle => 'Autentimine';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Kasutajanimi';

  @override
  String get password => 'Parool';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Autenditud';

  @override
  String get signIn => 'Logi sisse';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Logi välja';

  @override
  String get login => 'Logi sisse';

  @override
  String get audioStream => 'Helivoog';

  @override
  String get pressPlayToListen => 'Kuulamiseks vajuta mängi';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Heli sisse';

  @override
  String get mute => 'Heli välja';

  @override
  String get resume => 'Jätka';

  @override
  String get pause => 'Paus';

  @override
  String get autoRefresh => 'Automaatne värskendamine';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Hetkel analüüsimisel';

  @override
  String get accessRestricted => 'Juurdepääs piiratud';

  @override
  String get loginToAccessSection => 'Sektsioonile juurdepääsuks logige sisse.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Viga';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Muud tööriistad';

  @override
  String liveSeconds(int seconds) {
    return 'OTSE · ${seconds}s';
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
  String get tooltipRefresh => 'Värskenda';

  @override
  String get tooltipStop => 'Peata';

  @override
  String get tooltipStart => 'Käivita';

  @override
  String get tooltipRestart => 'Taaskäivita';

  @override
  String get systemInfo => 'Süsteemi info';

  @override
  String get fileManager => 'Failihaldur';

  @override
  String get databaseMaintenance => 'Andmebaasi hooldus';

  @override
  String get webTerminal => 'Veebiterminal';

  @override
  String get tooltipOpenMenu => 'Ava menüü';

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
  String get tooltipSearch => 'Otsi';

  @override
  String get tooltipPlay => 'Mängi heli';

  @override
  String get tooltipPickDate => 'Vali kuupäev';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Süsteemi olek';

  @override
  String get sysInfoUptime => 'Tööaeg';

  @override
  String get sysInfoDisk => 'Ketas';

  @override
  String get sysInfoMemory => 'Mälu';

  @override
  String get sysInfoCpuTemp => 'CPU temp';

  @override
  String get sysInfoBranch => 'Haru (Branch)';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Luba';

  @override
  String get disable => 'Keela';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Nädal $weekNumber - $year';
  }
}
