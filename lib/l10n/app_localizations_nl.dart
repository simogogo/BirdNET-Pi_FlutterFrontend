// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Vogelmonitoring';

  @override
  String get home => 'Home';

  @override
  String get today => 'Vandaag';

  @override
  String get recordings => 'Opnames';

  @override
  String get liveStream => 'Live stream';

  @override
  String get liveSpectrogram => 'Live spectrogram';

  @override
  String get speciesManagement => 'SOORTENBEHEER';

  @override
  String get inclusionList => 'Inclusielijst';

  @override
  String get exclusionList => 'Exclusielijst';

  @override
  String get analysisLog => 'Analyseverslag';

  @override
  String get openWebInterface => 'Webinterface openen';

  @override
  String get loadingLiveSpectrogram => 'Live spectrogram laden...';

  @override
  String get spectrogramInstruction =>
      'Als de audio niet automatisch start, communiceer dan met de pagina of controleer je browserinstellingen.';

  @override
  String get configureServerFirst =>
      'Configureer eerst het serveradres in Instellingen';

  @override
  String get recentDetections => 'Recente waarnemingen';

  @override
  String get latestDetection => 'Laatste waarneming';

  @override
  String get audioFile => 'Audiobestand';

  @override
  String get playing => 'Speelt af';

  @override
  String get noDetectionsToday => 'Geen waarnemingen vandaag';

  @override
  String get systemListening => 'Het systeem luistert...';

  @override
  String get errorOccurred => 'Er is een fout opgetreden';

  @override
  String get overview => 'Overzicht';

  @override
  String get detectionsAllTime => 'Waarnemingen\ntotaal';

  @override
  String get detectionsToday => 'Waarnemingen\nvandaag';

  @override
  String get detectionsLastHour => 'Waarnemingen\nlaatste uur';

  @override
  String get speciesToday => 'Soorten\nvandaag';

  @override
  String get speciesAllTime => 'Soorten\ntotaal';

  @override
  String get statsLoadingError => 'Fout bij laden statistieken';

  @override
  String get todaysDetections => 'Waarnemingen van vandaag';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count waarnemingen';
  }

  @override
  String get filterDetections => 'Waarnemingen filteren';

  @override
  String get minimumConfidenceThreshold => 'Minimale betrouwbaarheidsdrempel';

  @override
  String get reset => 'Reset';

  @override
  String get apply => 'Toepassen';

  @override
  String get charts => 'Grafieken';

  @override
  String get daily => 'Dagelijks';

  @override
  String get weekly => 'Wekelijks';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Geen grafiek beschikbaar';

  @override
  String get weeklyReport => 'Wekelijks rapport';

  @override
  String get newSpecies => 'Nieuwe soort';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Geïdentificeerde soorten';

  @override
  String get byDate => 'Op datum';

  @override
  String get bySpecies => 'Op soort';

  @override
  String exportToEbird(String date) {
    return 'Exporteren naar eBird ($date)';
  }

  @override
  String get noRecordings => 'Geen opnames';

  @override
  String get deleteRecording => 'Opname verwijderen';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Annuleren';

  @override
  String get delete => 'Verwijderen';

  @override
  String get noSpeciesFound => 'Geen soorten gevonden.';

  @override
  String get unknown => 'Onbekend';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Afspelen';

  @override
  String get changeId => 'ID wijzigen';

  @override
  String get protect => 'Beschermen';

  @override
  String get unprotect => 'Bescherming opheffen';

  @override
  String get download => 'Downloaden';

  @override
  String get cannotDownloadFile => 'Kan bestand niet downloaden';

  @override
  String get errorLoading => 'Fout bij laden';

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
  String get ebirdExport => 'eBird export';

  @override
  String get generateCsvForEbird => 'CSV voor eBird genereren';

  @override
  String get downloadAudioZip => 'Audio downloaden (ZIP)';

  @override
  String get close => 'Sluiten';

  @override
  String get continueStep => 'Doorgaan';

  @override
  String get back => 'Terug';

  @override
  String get review => 'Beoordelen';

  @override
  String get configuration => 'Configuratie';

  @override
  String get summary => 'Samenvatting';

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
  String get stationaryPoint => 'Stationair - Vast punt';

  @override
  String get nocturnalFlightCall => 'Nachtelijke vluchtroep (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Locatienaam *';

  @override
  String get requiredField => 'Verplicht veld';

  @override
  String get numberOfObservers => 'Aantal waarnemers';

  @override
  String get additionalComments => 'Extra opmerkingen';

  @override
  String get includeAudioFileNamesInComments =>
      'Audiobestandsnamen in opmerkingen opnemen';

  @override
  String get readyForExport => 'Klaar voor export';

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
  String get statistics => 'Statistieken';

  @override
  String get systemLogs => 'Systeemlogs';

  @override
  String get systemTools => 'Systeemgereedschap';

  @override
  String get systemControls => 'Systeembediening';

  @override
  String get restart => 'Herstarten';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Bijwerken';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Uitschakelen';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Alle gegevens wissen';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Diensten';

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
  String get spectrogram => 'Spectrogram';

  @override
  String get quickActions => 'Snelle acties';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Bevestigen';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Opdracht uitgevoerd';

  @override
  String errorMsg(String error) {
    return '❌ Fout: $error';
  }

  @override
  String get species => 'Soorten';

  @override
  String get noSpeciesDetected => 'Geen soorten gedetecteerd';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Waarnemingen';

  @override
  String get maxConfidence => 'Maximale betrouwbaarheid';

  @override
  String get searchSpecies => 'Soorten zoeken...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Instellingen';

  @override
  String get basicSettings => 'Basisinstellingen';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Geavanceerde instellingen';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Verbinding';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi serveradres';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Apparaatinformatie';

  @override
  String get loading => 'Laden...';

  @override
  String get notConnected => 'Niet verbonden';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Breedtegraad';

  @override
  String get longitude => 'Lengtegraad';

  @override
  String get locality => 'Plaats';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Landcode';

  @override
  String get information => 'Informatie';

  @override
  String get appVersion => 'Versie 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Verbonden met $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Kan geen verbinding maken met $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Fout bij laden instellingen: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Basisinstellingen succesvol opgeslagen';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Selecteer een model:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Locatie';

  @override
  String get siteName => 'Sitenaam:';

  @override
  String get latitudeInput => 'Breedtegraad:';

  @override
  String get longitudeInput => 'Lengtegraad:';

  @override
  String get birdWeatherToken => 'BirdWeather-token:';

  @override
  String get notificationsApprise => 'Meldingen (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Titel melding:';

  @override
  String get notificationBody => 'Inhoud melding:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Meld elke nieuwe waarneming';

  @override
  String get sendWeeklyReport => 'Wekelijks rapport verzenden';

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
  String get localization => 'Localisatie';

  @override
  String get databaseLanguage => 'Databasetaal:';

  @override
  String get otherInfo => 'Overige info';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Grafisch thema (Web)';

  @override
  String get colorScheme => 'Kleurenschema:';

  @override
  String get none => 'Geen';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Geavanceerde instellingen succesvol opgeslagen';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Schijfruimtebeheer';

  @override
  String get whenDiskIsFull => 'Wanneer schijf vol is:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Audio-instellingen';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Overlap (sec) [0, 2.9]:';

  @override
  String get audioFormat => 'Audioformaat:';

  @override
  String get recordingLength => 'Opnamelengte (sec):';

  @override
  String get extractionLength => 'Extractielengte (sec):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Caddy wachtwoord';

  @override
  String get appPassword => 'App wachtwoord:';

  @override
  String get customLogoImage => 'Aangepast logo';

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
  String get automaticUpdate => 'Automatisch bijwerken';

  @override
  String get saveRawSpectrograms => 'Ruwe spectrogrammen opslaan';

  @override
  String get loggingLevels => 'Logniveaus';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Soortenlijstbeheer';

  @override
  String get inclusion => 'Inclusie';

  @override
  String get exclusion => 'Exclusie';

  @override
  String get whitelist => 'Whitelist';

  @override
  String get speciesAlreadyInList => 'Soort al aanwezig in de lijst';

  @override
  String get listSavedSuccessfully => 'Lijst succesvol opgeslagen';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Opnieuw proberen';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Soorten laden...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'Geen soorten in deze lijst.';

  @override
  String get removeFromList => 'Verwijderen uit lijst';

  @override
  String get saving => 'Opslaan...';

  @override
  String get save => 'Opslaan';

  @override
  String get loginRequired => 'Inloggen vereist voor deze actie';

  @override
  String get loginTitle => 'Authenticatie';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Gebruikersnaam';

  @override
  String get password => 'Wachtwoord';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Geauthenticeerd';

  @override
  String get signIn => 'Inloggen';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Uitloggen';

  @override
  String get login => 'Inloggen';

  @override
  String get audioStream => 'Audiostream';

  @override
  String get pressPlayToListen => 'Druk op afspelen om te luisteren';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Geluid aanzetten';

  @override
  String get mute => 'Dempen';

  @override
  String get resume => 'Hervatten';

  @override
  String get pause => 'Pauze';

  @override
  String get autoRefresh => 'Automatisch vernieuwen';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Nu aan het analyseren';

  @override
  String get accessRestricted => 'Toegang beperkt';

  @override
  String get loginToAccessSection =>
      'Log in om toegang te krijgen tot dit gedeelte.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Fout';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Overige hulpmiddelen';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram not available';

  @override
  String get ebirdCountIdentifier => 'N°';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationary';

  @override
  String get ebirdProtocolIncidental => 'Incidental';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Vernieuwen';

  @override
  String get tooltipStop => 'Stoppen';

  @override
  String get tooltipStart => 'Starten';

  @override
  String get tooltipRestart => 'Herstarten';

  @override
  String get systemInfo => 'Systeeminformatie';

  @override
  String get fileManager => 'Bestandsbeheer';

  @override
  String get databaseMaintenance => 'Database-onderhoud';

  @override
  String get webTerminal => 'Webterminal';

  @override
  String get tooltipOpenMenu => 'Menu openen';

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
  String get tooltipSearch => 'Zoeken';

  @override
  String get tooltipPlay => 'Audio afspelen';

  @override
  String get tooltipPickDate => 'Datum kiezen';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Systeemstatus';

  @override
  String get sysInfoUptime => 'Uptime';

  @override
  String get sysInfoDisk => 'Schijf';

  @override
  String get sysInfoMemory => 'Geheugen';

  @override
  String get sysInfoCpuTemp => 'CPU temp';

  @override
  String get sysInfoBranch => 'Branch';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Inschakelen';

  @override
  String get disable => 'Uitschakelen';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Week $weekNumber - $year';
  }
}
