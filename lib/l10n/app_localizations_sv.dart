// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Fågelövervakning';

  @override
  String get home => 'Hem';

  @override
  String get today => 'Idag';

  @override
  String get recordings => 'Inspelningar';

  @override
  String get liveStream => 'Liveström';

  @override
  String get liveSpectrogram => 'Livespektrogram';

  @override
  String get speciesManagement => 'ARTFÖRVALTNING';

  @override
  String get inclusionList => 'Inkluderingslista';

  @override
  String get exclusionList => 'Exkluderingslista';

  @override
  String get analysisLog => 'Analyslogg';

  @override
  String get openWebInterface => 'Öppna webbgränssnitt';

  @override
  String get loadingLiveSpectrogram => 'Laddar livespektrogram...';

  @override
  String get spectrogramInstruction =>
      'Om ljudet inte startar automatiskt, vänligen interagera med sidan eller kontrollera dina webbläsarbehörigheter.';

  @override
  String get configureServerFirst =>
      'Konfigurera först serveradressen i Inställningar';

  @override
  String get recentDetections => 'Senaste detekteringar';

  @override
  String get latestDetection => 'Senaste detektering';

  @override
  String get audioFile => 'Ljudfil';

  @override
  String get playing => 'Spelar';

  @override
  String get noDetectionsToday => 'Inga detekteringar idag';

  @override
  String get systemListening => 'Systemet lyssnar...';

  @override
  String get errorOccurred => 'Ett fel uppstod';

  @override
  String get overview => 'Översikt';

  @override
  String get detectionsAllTime => 'Detekteringar\ntotalt';

  @override
  String get detectionsToday => 'Detekteringar\nidag';

  @override
  String get detectionsLastHour => 'Detekteringar\nsenaste timmen';

  @override
  String get speciesToday => 'Arter\nidag';

  @override
  String get speciesAllTime => 'Arter\ntotalt';

  @override
  String get statsLoadingError => 'Fel vid laddning av statistik';

  @override
  String get todaysDetections => 'Dagens detekteringar';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count detekteringar';
  }

  @override
  String get filterDetections => 'Filtrera detekteringar';

  @override
  String get minimumConfidenceThreshold => 'Minsta konfidensgräns';

  @override
  String get reset => 'Återställ';

  @override
  String get apply => 'Verkställ';

  @override
  String get charts => 'Diagram';

  @override
  String get daily => 'Dagligen';

  @override
  String get weekly => 'Veckovis';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Inget diagram tillgängligt';

  @override
  String get weeklyReport => 'Veckorapport';

  @override
  String get newSpecies => 'Ny art';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Identifierade arter';

  @override
  String get byDate => 'Efter datum';

  @override
  String get bySpecies => 'Efter art';

  @override
  String exportToEbird(String date) {
    return 'Exportera till eBird ($date)';
  }

  @override
  String get noRecordings => 'Inga inspelningar';

  @override
  String get deleteRecording => 'Ta bort inspelning';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Avbryt';

  @override
  String get delete => 'Ta bort';

  @override
  String get noSpeciesFound => 'Inga arter hittades.';

  @override
  String get unknown => 'Okänd';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Spela';

  @override
  String get changeId => 'Ändra ID';

  @override
  String get protect => 'Skydda';

  @override
  String get unprotect => 'Ta bort skydd';

  @override
  String get download => 'Ladda ner';

  @override
  String get cannotDownloadFile => 'Kan inte ladda ner fil';

  @override
  String get errorLoading => 'Fel vid laddning';

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
  String get ebirdExport => 'eBird-export';

  @override
  String get generateCsvForEbird => 'Generera CSV för eBird';

  @override
  String get downloadAudioZip => 'Ladda ner ljud (ZIP)';

  @override
  String get close => 'Stäng';

  @override
  String get continueStep => 'Fortsätt';

  @override
  String get back => 'Bakåt';

  @override
  String get review => 'Granska';

  @override
  String get configuration => 'Konfiguration';

  @override
  String get summary => 'Sammanfattning';

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
  String get stationaryPoint => 'Stationär - Fast punkt';

  @override
  String get nocturnalFlightCall => 'Nattligt flyktläte (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Platsnamn *';

  @override
  String get requiredField => 'Obligatoriskt fält';

  @override
  String get numberOfObservers => 'Antal observatörer';

  @override
  String get additionalComments => 'Ytterligare kommentarer';

  @override
  String get includeAudioFileNamesInComments =>
      'Inkludera ljudfilnamn i kommentarer';

  @override
  String get readyForExport => 'Klar för export';

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
  String get systemLogs => 'Systemloggar';

  @override
  String get systemTools => 'Systemverktyg';

  @override
  String get systemControls => 'Systemkontroller';

  @override
  String get restart => 'Starta om';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Uppdatera';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Stäng av';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Rensa alla data';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Tjänster';

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
  String get quickActions => 'Snabbåtgärder';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Bekräfta';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Kommando utfört';

  @override
  String errorMsg(String error) {
    return '❌ Fel: $error';
  }

  @override
  String get species => 'Arter';

  @override
  String get noSpeciesDetected => 'Inga arter detekterade';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Detekteringar';

  @override
  String get maxConfidence => 'Max konfidens';

  @override
  String get searchSpecies => 'Sök arter...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Inställningar';

  @override
  String get basicSettings => 'Grundinställningar';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Avancerade inställningar';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Anslutning';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi serveradress';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Enhetsinformation';

  @override
  String get loading => 'Laddar...';

  @override
  String get notConnected => 'Ej ansluten';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Latitud';

  @override
  String get longitude => 'Longitud';

  @override
  String get locality => 'Ort';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Landskod';

  @override
  String get information => 'Information';

  @override
  String get appVersion => 'Version 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Ansluten till $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Kan inte ansluta till $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Fel vid laddning av inställningar: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully => 'Grundinställningar sparade';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Modell';

  @override
  String get selectAModel => 'Välj en modell:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Plats';

  @override
  String get siteName => 'Platsnamn:';

  @override
  String get latitudeInput => 'Latitud:';

  @override
  String get longitudeInput => 'Longitud:';

  @override
  String get birdWeatherToken => 'BirdWeather-token:';

  @override
  String get notificationsApprise => 'Aviseringar (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Aviseringstext:';

  @override
  String get notificationBody => 'Aviseringsrutan:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Avisera varje ny detektering';

  @override
  String get sendWeeklyReport => 'Skicka veckorapport';

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
  String get localization => 'Lokalisering';

  @override
  String get databaseLanguage => 'Databasspråk:';

  @override
  String get otherInfo => 'Övrig info';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Grafiskt tema (Webb)';

  @override
  String get colorScheme => 'Färgschema:';

  @override
  String get none => 'Ingen';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Avancerade inställningar sparade';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Hantering av diskutrymme';

  @override
  String get whenDiskIsFull => 'När disken är full:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Ljudinställningar';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Överlappning (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Ljudformat:';

  @override
  String get recordingLength => 'Inspelningstid (sek):';

  @override
  String get extractionLength => 'Extraktionstid (sek):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Caddy-lösenord';

  @override
  String get appPassword => 'App-lösenord:';

  @override
  String get customLogoImage => 'Anpassad logotyp';

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
  String get automaticUpdate => 'Automatisk uppdatering';

  @override
  String get saveRawSpectrograms => 'Spara råspektrogram';

  @override
  String get loggingLevels => 'Loggnivåer';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Hantering av artlistor';

  @override
  String get inclusion => 'Inkludering';

  @override
  String get exclusion => 'Exkludering';

  @override
  String get whitelist => 'Vitlista';

  @override
  String get speciesAlreadyInList => 'Arten finns redan i listan';

  @override
  String get listSavedSuccessfully => 'Listan sparad';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Försök igen';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Laddar arter...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'Inga arter i listan.';

  @override
  String get removeFromList => 'Ta bort från listan';

  @override
  String get saving => 'Sparar...';

  @override
  String get save => 'Spara';

  @override
  String get loginRequired => 'Inloggning krävs';

  @override
  String get loginTitle => 'Autentisering';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Användarnamn';

  @override
  String get password => 'Lösenord';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Autentiserad';

  @override
  String get signIn => 'Logga in';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Logga ut';

  @override
  String get login => 'Logga in';

  @override
  String get audioStream => 'Ljudström';

  @override
  String get pressPlayToListen => 'Tryck på spela för att lyssna';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Slå på ljudet';

  @override
  String get mute => 'Ljud av';

  @override
  String get resume => 'Återuppta';

  @override
  String get pause => 'Pausa';

  @override
  String get autoRefresh => 'Automatisk uppdatering';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Analyserar nu';

  @override
  String get accessRestricted => 'Åtkomst begränsad';

  @override
  String get loginToAccessSection => 'Logga in för att komma åt denna sektion.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Fel';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Övriga verktyg';

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
  String get tooltipRefresh => 'Uppdatera';

  @override
  String get tooltipStop => 'Stoppa';

  @override
  String get tooltipStart => 'Starta';

  @override
  String get tooltipRestart => 'Starta om';

  @override
  String get systemInfo => 'Systeminfo';

  @override
  String get fileManager => 'Filhanterare';

  @override
  String get databaseMaintenance => 'Databasunderhåll';

  @override
  String get webTerminal => 'Webbterminal';

  @override
  String get tooltipOpenMenu => 'Öppna meny';

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
  String get tooltipSearch => 'Sök';

  @override
  String get tooltipPlay => 'Spela ljud';

  @override
  String get tooltipPickDate => 'Välj datum';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Systemstatus';

  @override
  String get sysInfoUptime => 'Drifttid';

  @override
  String get sysInfoDisk => 'Disk';

  @override
  String get sysInfoMemory => 'Minne';

  @override
  String get sysInfoCpuTemp => 'CPU-temp';

  @override
  String get sysInfoBranch => 'Gren';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Aktivera';

  @override
  String get disable => 'Inaktivera';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Vecka $weekNumber - $year';
  }
}
