// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Spremljanje ptic';

  @override
  String get home => 'Domov';

  @override
  String get today => 'Danes';

  @override
  String get recordings => 'Posnetki';

  @override
  String get liveStream => 'Prenos v živo';

  @override
  String get liveSpectrogram => 'Spektrogram v živo';

  @override
  String get speciesManagement => 'UPRAVLJANJE VRST';

  @override
  String get inclusionList => 'Seznam vključenih';

  @override
  String get exclusionList => 'Seznam izključenih';

  @override
  String get analysisLog => 'Dnevnik analize';

  @override
  String get openWebInterface => 'Odpri spletni vmesnik';

  @override
  String get loadingLiveSpectrogram => 'Nalaganje spektrograma v živo...';

  @override
  String get spectrogramInstruction =>
      'Če se zvok ne zažene samodejno, stopite v interakcijo s stranjo ali preverite dovoljenja brskalnika.';

  @override
  String get configureServerFirst =>
      'Najprej konfigurirajte naslov strežnika v nastavitvah';

  @override
  String get recentDetections => 'Nedavne zaznave';

  @override
  String get latestDetection => 'Zadnja zaznava';

  @override
  String get audioFile => 'Zvočna datoteka';

  @override
  String get playing => 'Predvajanje';

  @override
  String get noDetectionsToday => 'Danes ni zaznav';

  @override
  String get systemListening => 'Sistem posluša...';

  @override
  String get errorOccurred => 'Prišlo je do napake';

  @override
  String get overview => 'Pregled';

  @override
  String get detectionsAllTime => 'Zaznave\nskupaj';

  @override
  String get detectionsToday => 'Zaznave\ndanes';

  @override
  String get detectionsLastHour => 'Zaznave\nzadnja ura';

  @override
  String get speciesToday => 'Vrste\ndanes';

  @override
  String get speciesAllTime => 'Vrste\nskupaj';

  @override
  String get statsLoadingError => 'Napaka pri nalaganju statistike';

  @override
  String get todaysDetections => 'Današnje zaznave';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count zaznav';
  }

  @override
  String get filterDetections => 'Filtriraj zaznave';

  @override
  String get minimumConfidenceThreshold => 'Najnižji prag zaupanja';

  @override
  String get reset => 'Ponastavi';

  @override
  String get apply => 'Uporabi';

  @override
  String get charts => 'Grafi';

  @override
  String get daily => 'Dnevno';

  @override
  String get weekly => 'Tedensko';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Graf ni na voljo';

  @override
  String get weeklyReport => 'Tedensko poročilo';

  @override
  String get newSpecies => 'Nova vrsta';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Identificirane vrste';

  @override
  String get byDate => 'Po datumu';

  @override
  String get bySpecies => 'Po vrstah';

  @override
  String exportToEbird(String date) {
    return 'Izvozi v eBird ($date)';
  }

  @override
  String get noRecordings => 'Ni posnetkov';

  @override
  String get deleteRecording => 'Izbriši posnetek';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Prekliči';

  @override
  String get delete => 'Izbriši';

  @override
  String get noSpeciesFound => 'Ni najdenih vrst.';

  @override
  String get unknown => 'Neznano';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Predvajaj';

  @override
  String get changeId => 'Spremeni ID';

  @override
  String get protect => 'Zaščiti';

  @override
  String get unprotect => 'Odstrani zaščito';

  @override
  String get download => 'Prenesi';

  @override
  String get cannotDownloadFile => 'Datoteke ni mogoče prenesti';

  @override
  String get errorLoading => 'Napaka pri nalaganju';

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
  String get ebirdExport => 'eBird izvoz';

  @override
  String get generateCsvForEbird => 'Ustvari CSV za eBird';

  @override
  String get downloadAudioZip => 'Prenesi zvok (ZIP)';

  @override
  String get close => 'Zapri';

  @override
  String get continueStep => 'Nadaljuj';

  @override
  String get back => 'Nazaj';

  @override
  String get review => 'Pregled';

  @override
  String get configuration => 'Konfiguracija';

  @override
  String get summary => 'Povzetek';

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
  String get stationaryPoint => 'Stacionarno - Fiksna točka';

  @override
  String get nocturnalFlightCall => 'Nočni klic med letom (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Ime lokacije *';

  @override
  String get requiredField => 'Obvezno polje';

  @override
  String get numberOfObservers => 'Število opazovalcev';

  @override
  String get additionalComments => 'Dodatni komentarji';

  @override
  String get includeAudioFileNamesInComments =>
      'Vključite imena zvočnih datotek v komentarje';

  @override
  String get readyForExport => 'Pripravljeno za izvoz';

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
  String get systemLogs => 'Sistemski dnevniki';

  @override
  String get systemTools => 'Sistemska orodja';

  @override
  String get systemControls => 'Nadzor sistema';

  @override
  String get restart => 'Ponovni zagon';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Posodobi';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Izklop';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Počisti vse podatke';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Storitve';

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
  String get quickActions => 'Hitre akcije';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Potrdi';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Ukaz izveden';

  @override
  String errorMsg(String error) {
    return '❌ Napaka: $error';
  }

  @override
  String get species => 'Vrste';

  @override
  String get noSpeciesDetected => 'Ni zaznanih vrst';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Zaznave';

  @override
  String get maxConfidence => 'Najvišje zaupanje';

  @override
  String get searchSpecies => 'Išči vrste...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Nastavitve';

  @override
  String get basicSettings => 'Osnovne nastavitve';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Napredne nastavitve';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Povezava';

  @override
  String get birdNetPiServerAddress => 'Naslov strežnika BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Informacije o napravi';

  @override
  String get loading => 'Nalaganje...';

  @override
  String get notConnected => 'Ni povezave';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Zemljepisna širina';

  @override
  String get longitude => 'Zemljepisna dolžina';

  @override
  String get locality => 'Kraj';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Koda države';

  @override
  String get information => 'Informacije';

  @override
  String get appVersion => 'Različica 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Povezano z $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Ni mogoče povezati z $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Napaka pri nalaganju nastavitev: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Osnovne nastavitve uspešno shranjene';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Izberite model:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Lokacija';

  @override
  String get siteName => 'Ime lokacije:';

  @override
  String get latitudeInput => 'Širina:';

  @override
  String get longitudeInput => 'Dolžina:';

  @override
  String get birdWeatherToken => 'BirdWeather žeton:';

  @override
  String get notificationsApprise => 'Obvestila (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Naslov obvestila:';

  @override
  String get notificationBody => 'Vsebina obvestila:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Obvesti o vsaki novi zaznavi';

  @override
  String get sendWeeklyReport => 'Pošlji tedensko poročilo';

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
  String get localization => 'Lokalizacija';

  @override
  String get databaseLanguage => 'Jezik baze podatkov:';

  @override
  String get otherInfo => 'Druge informacije';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Grafična tema (Web)';

  @override
  String get colorScheme => 'Barvna shema:';

  @override
  String get none => 'Brez';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Napredne nastavitve shranjene';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Upravljanje prostora na disku';

  @override
  String get whenDiskIsFull => 'Podpora polnjenju diska:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Nastavitve zvoka';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Prekrivanje (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Zvočni format:';

  @override
  String get recordingLength => 'Dolžina snemanja (sek):';

  @override
  String get extractionLength => 'Dolžina izseka (sek):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Caddy geslo';

  @override
  String get appPassword => 'Geslo aplikacije:';

  @override
  String get customLogoImage => 'Logotip po meri';

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
  String get automaticUpdate => 'Samodejna posodobitev';

  @override
  String get saveRawSpectrograms => 'Shrani surove spektrograme';

  @override
  String get loggingLevels => 'Ravni beleženja';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Upravljanje seznamov vrst';

  @override
  String get inclusion => 'Vključitev';

  @override
  String get exclusion => 'Izključitev';

  @override
  String get whitelist => 'Beli seznam';

  @override
  String get speciesAlreadyInList => 'Vrsta je že na seznamu';

  @override
  String get listSavedSuccessfully => 'Seznam uspešno shranjen';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Poskusi znova';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Nalaganje vrst...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'Na tem seznamu ni vrst.';

  @override
  String get removeFromList => 'Odstrani s seznama';

  @override
  String get saving => 'Shranjevanje...';

  @override
  String get save => 'Shrani';

  @override
  String get loginRequired => 'Za to dejanje je potrebna prijava';

  @override
  String get loginTitle => 'Avtentikacija';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Uporabniško ime';

  @override
  String get password => 'Geslo';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Prijavljen';

  @override
  String get signIn => 'Prijava';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Odjava';

  @override
  String get login => 'Prijava';

  @override
  String get audioStream => 'Zvočni tok';

  @override
  String get pressPlayToListen => 'Pritisnite predvajaj za poslušanje';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Vklopi zvok';

  @override
  String get mute => 'Nemo';

  @override
  String get resume => 'Nadaljuj';

  @override
  String get pause => 'Premor';

  @override
  String get autoRefresh => 'Samodejno osveževanje';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Trenutno analiziranje';

  @override
  String get accessRestricted => 'Omejen dostop';

  @override
  String get loginToAccessSection => 'Prijavite se za dostop do tega razdelka.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Napaka';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Drugi pripomočki';

  @override
  String liveSeconds(int seconds) {
    return 'V ŽIVO · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram not available';

  @override
  String get ebirdCountIdentifier => 'Št';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationary';

  @override
  String get ebirdProtocolIncidental => 'Incidental';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Osveži';

  @override
  String get tooltipStop => 'Ustavi';

  @override
  String get tooltipStart => 'Zaženi';

  @override
  String get tooltipRestart => 'Ponovni zagon';

  @override
  String get systemInfo => 'Podatki o sistemu';

  @override
  String get fileManager => 'Upravitelj datotek';

  @override
  String get databaseMaintenance => 'Vzdrževanje baze podatkov';

  @override
  String get webTerminal => 'Spletni terminal';

  @override
  String get tooltipOpenMenu => 'Odpri meni';

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
  String get tooltipSearch => 'Išči';

  @override
  String get tooltipPlay => 'Predvajaj zvok';

  @override
  String get tooltipPickDate => 'Izberi datum';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Stanje sistema';

  @override
  String get sysInfoUptime => 'Čas delovanja';

  @override
  String get sysInfoDisk => 'Disk';

  @override
  String get sysInfoMemory => 'Pomnilnik';

  @override
  String get sysInfoCpuTemp => 'Temperatura CPU';

  @override
  String get sysInfoBranch => 'Veja (Branch)';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Omogoči';

  @override
  String get disable => 'Onemogoči';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Teden $weekNumber - $year';
  }
}
