// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Fugleovervåking';

  @override
  String get home => 'Hjem';

  @override
  String get today => 'I dag';

  @override
  String get recordings => 'Opptak';

  @override
  String get liveStream => 'Livestrøm';

  @override
  String get liveSpectrogram => 'Livespektrogram';

  @override
  String get speciesManagement => 'ARTSFORVALTNING';

  @override
  String get inclusionList => 'Inkluderingsliste';

  @override
  String get exclusionList => 'Ekskluderingsliste';

  @override
  String get analysisLog => 'Analyselogg';

  @override
  String get openWebInterface => 'Åpne webgrensesnitt';

  @override
  String get loadingLiveSpectrogram => 'Laster livespektrogram...';

  @override
  String get spectrogramInstruction =>
      'Hvis lyden ikke starter automatisk, vennligst samhandle med siden eller sjekk nettleserinnstillingene.';

  @override
  String get configureServerFirst =>
      'Konfigurer serveradressen i Innstillinger først';

  @override
  String get recentDetections => 'Siste observasjoner';

  @override
  String get latestDetection => 'Siste observasjon';

  @override
  String get audioFile => 'Lydfil';

  @override
  String get playing => 'Spiller';

  @override
  String get noDetectionsToday => 'Ingen observasjoner i dag';

  @override
  String get systemListening => 'Systemet lytter...';

  @override
  String get errorOccurred => 'En feil oppstod';

  @override
  String get overview => 'Oversikt';

  @override
  String get detectionsAllTime => 'Observasjoner\ntotalt';

  @override
  String get detectionsToday => 'Observasjoner\ni dag';

  @override
  String get detectionsLastHour => 'Observasjoner\nsiste time';

  @override
  String get speciesToday => 'Arter\ni dag';

  @override
  String get speciesAllTime => 'Arter\ntotalt';

  @override
  String get statsLoadingError => 'Feil ved lasting av statistikk';

  @override
  String get todaysDetections => 'Dagens observasjoner';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count observasjoner';
  }

  @override
  String get filterDetections => 'Filtrer observasjoner';

  @override
  String get minimumConfidenceThreshold => 'Minimum konfidensnivå';

  @override
  String get reset => 'Nullstill';

  @override
  String get apply => 'Bruk';

  @override
  String get charts => 'Diagrammer';

  @override
  String get daily => 'Daglig';

  @override
  String get weekly => 'Ukentlig';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Ingen diagrammer tilgjengelig';

  @override
  String get weeklyReport => 'Ukerapport';

  @override
  String get newSpecies => 'Ny art';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Identifiserte arter';

  @override
  String get byDate => 'Etter dato';

  @override
  String get bySpecies => 'Etter art';

  @override
  String exportToEbird(String date) {
    return 'Eksporter til eBird ($date)';
  }

  @override
  String get noRecordings => 'Ingen opptak';

  @override
  String get deleteRecording => 'Slett opptak';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Avbryt';

  @override
  String get delete => 'Slett';

  @override
  String get noSpeciesFound => 'Ingen arter funnet.';

  @override
  String get unknown => 'Ukjent';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Spill av';

  @override
  String get changeId => 'Endre ID';

  @override
  String get protect => 'Beskytt';

  @override
  String get unprotect => 'Fjern beskyttelse';

  @override
  String get download => 'Last ned';

  @override
  String get cannotDownloadFile => 'Kan ikke laste ned fil';

  @override
  String get errorLoading => 'Feil ved lasting';

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
  String get ebirdExport => 'eBird-eksport';

  @override
  String get generateCsvForEbird => 'Generer CSV for eBird';

  @override
  String get downloadAudioZip => 'Last ned lyd (ZIP)';

  @override
  String get close => 'Lukk';

  @override
  String get continueStep => 'Fortsett';

  @override
  String get back => 'Tilbake';

  @override
  String get review => 'Vurder';

  @override
  String get configuration => 'Konfigurasjon';

  @override
  String get summary => 'Sammendrag';

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
  String get stationaryPoint => 'Stasjonær - Fast punkt';

  @override
  String get nocturnalFlightCall => 'Nattlig fluktlyd (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Stedsnavn *';

  @override
  String get requiredField => 'Obligatorisk felt';

  @override
  String get numberOfObservers => 'Antall observatører';

  @override
  String get additionalComments => 'Ytterligere kommentarer';

  @override
  String get includeAudioFileNamesInComments =>
      'Inkluder lydfilnavn i kommentarer';

  @override
  String get readyForExport => 'Klar for eksport';

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
  String get statistics => 'Statistikk';

  @override
  String get systemLogs => 'Systemlogger';

  @override
  String get systemTools => 'Systemverktøy';

  @override
  String get systemControls => 'Systemkontroller';

  @override
  String get restart => 'Start på nytt';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Oppdater';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Slå av';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Slett alle data';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Tjenester';

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
  String get quickActions => 'Hurtigvalg';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Bekreft';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Kommando utført';

  @override
  String errorMsg(String error) {
    return '❌ Feil: $error';
  }

  @override
  String get species => 'Arter';

  @override
  String get noSpeciesDetected => 'Ingen arter detektert';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Observasjoner';

  @override
  String get maxConfidence => 'Maks konfidens';

  @override
  String get searchSpecies => 'Søk etter arter...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Innstillinger';

  @override
  String get basicSettings => 'Grunninnstillinger';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Avanserte innstillinger';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Tilkobling';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi serveradresse';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Enhetsinformasjon';

  @override
  String get loading => 'Laster...';

  @override
  String get notConnected => 'Ikke tilkoblet';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Breddegrad';

  @override
  String get longitude => 'Lengdegrad';

  @override
  String get locality => 'Sted';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Landskode';

  @override
  String get information => 'Informasjon';

  @override
  String get appVersion => 'Versjon 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Tilkoblet $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Kan ikke koble til $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Feil ved lasting av innstillinger: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully => 'Grunninnstillinger lagret';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Modell';

  @override
  String get selectAModel => 'Velg en modell:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Posisjon';

  @override
  String get siteName => 'Stedsnavn:';

  @override
  String get latitudeInput => 'Breddegrad:';

  @override
  String get longitudeInput => 'Lengdegrad:';

  @override
  String get birdWeatherToken => 'BirdWeather-token:';

  @override
  String get notificationsApprise => 'Varslinger (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Varslingstittel:';

  @override
  String get notificationBody => 'Varslingstekst:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Varsle hver nye observasjon';

  @override
  String get sendWeeklyReport => 'Send ukerapport';

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
  String get otherInfo => 'Annen info';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Grafisk tema (Web)';

  @override
  String get colorScheme => 'Fargeskjema:';

  @override
  String get none => 'Ingen';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Avanserte innstillinger lagret';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Diskplassbehandling';

  @override
  String get whenDiskIsFull => 'Quando o disco estiver cheio:';

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
  String get overlap => 'Overlapp (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Lydformat:';

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
  String get automaticUpdate => 'Automatiska uppdateringar';

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
  String get speciesListsManagement => 'Behandling av artslister';

  @override
  String get inclusion => 'Inkludering';

  @override
  String get exclusion => 'Exkludering';

  @override
  String get whitelist => 'Vitlista';

  @override
  String get speciesAlreadyInList => 'Arten finns redan i listan';

  @override
  String get listSavedSuccessfully => 'Listen ble lagret';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Prøv igjen';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Laster arter...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'Ingen arter i denne listen.';

  @override
  String get removeFromList => 'Fjern fra liste';

  @override
  String get saving => 'Lagrer...';

  @override
  String get save => 'Lagre';

  @override
  String get loginRequired => 'Innlogging kreves';

  @override
  String get loginTitle => 'Autentisering';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Brukernavn';

  @override
  String get password => 'Passord';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Autentisert';

  @override
  String get signIn => 'Logg inn';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Log ut';

  @override
  String get login => 'Inlogg';

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
  String get unmute => 'Fjern demping';

  @override
  String get mute => 'Demp';

  @override
  String get resume => ' gjenoppta';

  @override
  String get pause => 'Pausa';

  @override
  String get autoRefresh => 'Autooppdatering';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Analyserer nå';

  @override
  String get accessRestricted => 'Begrenset tilgang';

  @override
  String get loginToAccessSection =>
      'Logg inn for å få tilgang til denne delen.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Feil';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Andre verktøy';

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
  String get tooltipRefresh => 'Oppdater';

  @override
  String get tooltipStop => 'Stopp';

  @override
  String get tooltipStart => 'Start';

  @override
  String get tooltipRestart => 'Start på nytt';

  @override
  String get systemInfo => 'Systeminfo';

  @override
  String get fileManager => 'Filbehandler';

  @override
  String get databaseMaintenance => 'Databasevedlikehold';

  @override
  String get webTerminal => 'Webterminal';

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
  String get tooltipPickDate => 'Velg dato';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Systemstatus';

  @override
  String get sysInfoUptime => 'Driftstid';

  @override
  String get sysInfoDisk => 'Disk';

  @override
  String get sysInfoMemory => 'Minne';

  @override
  String get sysInfoCpuTemp => 'CPU-temperatur';

  @override
  String get sysInfoBranch => 'Branch';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Aktiver';

  @override
  String get disable => 'Deaktiver';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Uke $weekNumber - $year';
  }
}
