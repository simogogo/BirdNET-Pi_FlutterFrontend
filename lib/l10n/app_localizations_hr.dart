// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Praćenje ptica';

  @override
  String get home => 'Početna';

  @override
  String get today => 'Danas';

  @override
  String get recordings => 'Snimke';

  @override
  String get liveStream => 'Prijenos uživo';

  @override
  String get liveSpectrogram => 'Spektrogram uživo';

  @override
  String get speciesManagement => 'UPRAVLJANJE VRSTAMA';

  @override
  String get inclusionList => 'Popis uključenih';

  @override
  String get exclusionList => 'Popis isključenih';

  @override
  String get analysisLog => 'Zapisnik analize';

  @override
  String get openWebInterface => 'Otvori web sučelje';

  @override
  String get loadingLiveSpectrogram => 'Učitavanje spektrograma uživo...';

  @override
  String get spectrogramInstruction =>
      'Ako zvuk ne počne automatski, stupite u interakciju sa stranicom ili provjerite dopuštenja preglednika.';

  @override
  String get configureServerFirst =>
      'Prvo konfigurirajte adresu poslužitelja u Postavkama';

  @override
  String get recentDetections => 'Nedavne detekcije';

  @override
  String get latestDetection => 'Zadnja detekcija';

  @override
  String get audioFile => 'Zvučna datoteka';

  @override
  String get playing => 'Reprodukcija';

  @override
  String get noDetectionsToday => 'Danas nema detekcija';

  @override
  String get systemListening => 'Sustav sluša...';

  @override
  String get errorOccurred => 'Došlo je do pogreške';

  @override
  String get overview => 'Pregled';

  @override
  String get detectionsAllTime => 'Detekcije\nukupno';

  @override
  String get detectionsToday => 'Detekcije\ndanas';

  @override
  String get detectionsLastHour => 'Detekcije\nzadnji sat';

  @override
  String get speciesToday => 'Vrste\ndanas';

  @override
  String get speciesAllTime => 'Vrste\nukupno';

  @override
  String get statsLoadingError => 'Pogreška pri učitavanju statistike';

  @override
  String get todaysDetections => 'Današnje detekcije';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count detekcija';
  }

  @override
  String get filterDetections => 'Filtriraj detekcije';

  @override
  String get minimumConfidenceThreshold => 'Najniži prag pouzdanosti';

  @override
  String get reset => 'Resetiraj';

  @override
  String get apply => 'Primijeni';

  @override
  String get charts => 'Grafikoni';

  @override
  String get daily => 'Dnevno';

  @override
  String get weekly => 'Tjedno';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Grafikon nije dostupan';

  @override
  String get weeklyReport => 'Tjedno izvješće';

  @override
  String get newSpecies => 'Nova vrsta';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Identificirane vrste';

  @override
  String get byDate => 'Po datumu';

  @override
  String get bySpecies => 'Po vrstama';

  @override
  String exportToEbird(String date) {
    return 'Izvezi u eBird ($date)';
  }

  @override
  String get noRecordings => 'Nema snimki';

  @override
  String get deleteRecording => 'Obriši snimku';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Odustani';

  @override
  String get delete => 'Obriši';

  @override
  String get noSpeciesFound => 'Nisu pronađene vrste.';

  @override
  String get unknown => 'Nepoznato';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Reproduciraj';

  @override
  String get changeId => 'Promijeni ID';

  @override
  String get protect => 'Zaštiti';

  @override
  String get unprotect => 'Ukloni zaštitu';

  @override
  String get download => 'Preuzmi';

  @override
  String get cannotDownloadFile => 'Nije moguće preuzeti datoteku';

  @override
  String get errorLoading => 'Pogreška pri učitavanju';

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
  String get generateCsvForEbird => 'Stvori CSV za eBird';

  @override
  String get downloadAudioZip => 'Preuzmi zvuk (ZIP)';

  @override
  String get close => 'Zatvori';

  @override
  String get continueStep => 'Nastavi';

  @override
  String get back => 'Natrag';

  @override
  String get review => 'Pregled';

  @override
  String get configuration => 'Konfiguracija';

  @override
  String get summary => 'Sažetak';

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
  String get nocturnalFlightCall => 'Noćni poziv u letu (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Naziv lokacije *';

  @override
  String get requiredField => 'Obvezno polje';

  @override
  String get numberOfObservers => 'Broj promatrača';

  @override
  String get additionalComments => 'Dodatni komentari';

  @override
  String get includeAudioFileNamesInComments =>
      'Uključi nazive zvučnih datoteka u komentare';

  @override
  String get readyForExport => 'Spremno za izvoz';

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
  String get systemLogs => 'Sustavni zapisnici';

  @override
  String get systemTools => 'Sustavni alati';

  @override
  String get systemControls => 'Kontrola sustava';

  @override
  String get restart => 'Ponovno pokretanje';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Ažuriraj';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Isključivanje';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Očisti sve podatke';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Usluge';

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
  String get quickActions => 'Brze radnje';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Potvrdi';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Naredba izvršena';

  @override
  String errorMsg(String error) {
    return '❌ Pogreška: $error';
  }

  @override
  String get species => 'Vrste';

  @override
  String get noSpeciesDetected => 'Nema otkrivenih vrsta';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Detekcije';

  @override
  String get maxConfidence => 'Najviša pouzdanost';

  @override
  String get searchSpecies => 'Traži vrste...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Postavke';

  @override
  String get basicSettings => 'Osnovne postavke';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Napredne postavke';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Veza';

  @override
  String get birdNetPiServerAddress => 'Adresa BirdNET-Pi poslužitelja';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Informacije o uređaju';

  @override
  String get loading => 'Učitavanje...';

  @override
  String get notConnected => 'Nema veze';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Zemljopisna širina';

  @override
  String get longitude => 'Zemljopisna dužina';

  @override
  String get locality => 'Mjesto';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Kôd države';

  @override
  String get information => 'Informacije';

  @override
  String get appVersion => 'Inačica 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Povezano s $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Nije moguće povezati s $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Pogreška pri učitavanju postavki: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Osnovne postavke uspješno spremljene';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Odaberite model:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Lokacija';

  @override
  String get siteName => 'Naziv mjesta:';

  @override
  String get latitudeInput => 'Širina:';

  @override
  String get longitudeInput => 'Dužina:';

  @override
  String get birdWeatherToken => 'BirdWeather žeton:';

  @override
  String get notificationsApprise => 'Obavijesti (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Naslov obavijesti:';

  @override
  String get notificationBody => 'Sadržaj obavijesti:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Obavijesti o svakoj novoj detekciji';

  @override
  String get sendWeeklyReport => 'Pošalji tjedno izvješće';

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
  String get databaseLanguage => 'Jezik baze podataka:';

  @override
  String get otherInfo => 'Ostale informacije';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Grafička tema (Web)';

  @override
  String get colorScheme => 'Shema boja:';

  @override
  String get none => 'Nema';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Napredne postavke spremljene';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Upravljanje prostorom na disku';

  @override
  String get whenDiskIsFull => 'Kada je disk pun:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Postavke zvuka';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Preklapanje (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Zvučni format:';

  @override
  String get recordingLength => 'Duljina snimanja (sek):';

  @override
  String get extractionLength => 'Duljina izdvajanja (sek):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Caddy lozinka';

  @override
  String get appPassword => 'Lozinka aplikacije:';

  @override
  String get customLogoImage => 'Prilagođeni logotip';

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
  String get automaticUpdate => 'Automatsko ažuriranje';

  @override
  String get saveRawSpectrograms => 'Spremi sirove spektrograme';

  @override
  String get loggingLevels => 'Razine zapisivanja';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Upravljanje popisima vrsta';

  @override
  String get inclusion => 'Uključivanje';

  @override
  String get exclusion => 'Isključivanje';

  @override
  String get whitelist => 'Bijeli popis';

  @override
  String get speciesAlreadyInList => 'Vrsta je već na popisu';

  @override
  String get listSavedSuccessfully => 'Popis uspješno spremljen';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Pokušaj ponovo';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Učitavanje vrsta...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'Nema vrsta na ovom popisu.';

  @override
  String get removeFromList => 'Ukloni s popisa';

  @override
  String get saving => 'Spremanje...';

  @override
  String get save => 'Spremi';

  @override
  String get loginRequired => 'Potrebna je prijava za ovu radnju';

  @override
  String get loginTitle => 'Autentifikacija';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Korisničko ime';

  @override
  String get password => 'Lozinka';

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
  String get audioStream => 'Zvučni tok';

  @override
  String get pressPlayToListen => 'Pritisnite reproduciraj za slušanje';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Uključi zvuk';

  @override
  String get mute => 'Utišaj';

  @override
  String get resume => 'Nastavi';

  @override
  String get pause => 'Premor';

  @override
  String get autoRefresh => 'Automatsko osvježavanje';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Trenutna analiza';

  @override
  String get accessRestricted => 'Ograničen pristup';

  @override
  String get loginToAccessSection => 'Prijavite se za pristup ovom odjeljku.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Pogreška';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Ostali uslužni programi';

  @override
  String liveSeconds(int seconds) {
    return 'UŽIVO · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram not available';

  @override
  String get ebirdCountIdentifier => 'Br';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationary';

  @override
  String get ebirdProtocolIncidental => 'Incidental';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Osvježi';

  @override
  String get tooltipStop => 'Zaustavi';

  @override
  String get tooltipStart => 'Pokreni';

  @override
  String get tooltipRestart => 'Ponovno pokretanje';

  @override
  String get systemInfo => 'Informacije o sustavu';

  @override
  String get fileManager => 'Upravitelj datoteka';

  @override
  String get databaseMaintenance => 'Održavanje baze podataka';

  @override
  String get webTerminal => 'Web terminal';

  @override
  String get tooltipOpenMenu => 'Otvori izbornik';

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
  String get tooltipSearch => 'Traži';

  @override
  String get tooltipPlay => 'Reproduciraj zvuk';

  @override
  String get tooltipPickDate => 'Odaberi datum';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Status sustava';

  @override
  String get sysInfoUptime => 'Vrijeme rada';

  @override
  String get sysInfoDisk => 'Disk';

  @override
  String get sysInfoMemory => 'Memorija';

  @override
  String get sysInfoCpuTemp => 'Temp. procesora';

  @override
  String get sysInfoBranch => 'Branch';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Omogući';

  @override
  String get disable => 'Onemogući';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Tjedan $weekNumber - $year';
  }
}
