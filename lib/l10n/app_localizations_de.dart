// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Vogel-Monitoring';

  @override
  String get home => 'Startseite';

  @override
  String get today => 'Heute';

  @override
  String get recordings => 'Aufnahmen';

  @override
  String get liveStream => 'Live-Stream';

  @override
  String get liveSpectrogram => 'Live-Spektrogramm';

  @override
  String get speciesManagement => 'ARTENMANAGEMENT';

  @override
  String get inclusionList => 'Inklusionsliste';

  @override
  String get exclusionList => 'Exklusionsliste';

  @override
  String get analysisLog => 'Analyseprotokoll';

  @override
  String get openWebInterface => 'Web-Interface öffnen';

  @override
  String get loadingLiveSpectrogram => 'Live-Spektrogramm wird geladen...';

  @override
  String get spectrogramInstruction =>
      'Falls der Ton nicht automatisch startet, interagieren Sie bitte mit der Seite oder prüfen Sie Ihre Browser-Berechtigungen.';

  @override
  String get configureServerFirst =>
      'Konfigurieren Sie zuerst die Serveradresse in den Einstellungen';

  @override
  String get recentDetections => 'Kürzliche Erkennungen';

  @override
  String get latestDetection => 'Letzte Erkennung';

  @override
  String get audioFile => 'Audiodatei';

  @override
  String get playing => 'Wiedergabe';

  @override
  String get noDetectionsToday => 'Heute keine Erkennungen';

  @override
  String get systemListening => 'System hört zu...';

  @override
  String get errorOccurred => 'Ein Fehler ist aufgetreten';

  @override
  String get overview => 'Übersicht';

  @override
  String get detectionsAllTime => 'Erkennungen\ngesamt';

  @override
  String get detectionsToday => 'Erkennungen\nheute';

  @override
  String get detectionsLastHour => 'Erkennungen\nletzte Stunde';

  @override
  String get speciesToday => 'Arten\nheute';

  @override
  String get speciesAllTime => 'Arten\ngesamt';

  @override
  String get statsLoadingError => 'Fehler beim Laden der Statistiken';

  @override
  String get todaysDetections => 'Heutige Erkennungen';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count Erkennungen';
  }

  @override
  String get filterDetections => 'Erkennungen filtern';

  @override
  String get minimumConfidenceThreshold => 'Minimaler Konfidenz-Schwellenwert';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get apply => 'Anwenden';

  @override
  String get charts => 'Diagramme';

  @override
  String get daily => 'Täglich';

  @override
  String get weekly => 'Wöchentlich';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Kein Diagramm verfügbar';

  @override
  String get weeklyReport => 'Wochenbericht';

  @override
  String get newSpecies => 'Neue Art';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Identifizierte Arten';

  @override
  String get byDate => 'Nach Datum';

  @override
  String get bySpecies => 'Nach Art';

  @override
  String exportToEbird(String date) {
    return 'Nach eBird exportieren ($date)';
  }

  @override
  String get noRecordings => 'Keine Aufnahmen';

  @override
  String get deleteRecording => 'Aufnahme löschen';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Abbrechen';

  @override
  String get delete => 'Löschen';

  @override
  String get noSpeciesFound => 'Keine Arten gefunden.';

  @override
  String get unknown => 'Unbekannt';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Abspielen';

  @override
  String get changeId => 'ID ändern';

  @override
  String get protect => 'Schützen';

  @override
  String get unprotect => 'Schutz aufheben';

  @override
  String get download => 'Herunterladen';

  @override
  String get cannotDownloadFile => 'Datei kann nicht heruntergeladen werden';

  @override
  String get errorLoading => 'Fehler beim Laden';

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
  String get ebirdExport => 'eBird-Export';

  @override
  String get generateCsvForEbird => 'CSV für eBird generieren';

  @override
  String get downloadAudioZip => 'Audio herunterladen (ZIP)';

  @override
  String get close => 'Schließen';

  @override
  String get continueStep => 'Weiter';

  @override
  String get back => 'Zurück';

  @override
  String get review => 'Überprüfung';

  @override
  String get configuration => 'Konfiguration';

  @override
  String get summary => 'Zusammenfassung';

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
  String get stationaryPoint => 'Stationär - Festpunkt';

  @override
  String get nocturnalFlightCall => 'Nächtlicher Flugruf (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Ortsname *';

  @override
  String get requiredField => 'Pflichtfeld';

  @override
  String get numberOfObservers => 'Anzahl der Beobachter';

  @override
  String get additionalComments => 'Zusätzliche Kommentare';

  @override
  String get includeAudioFileNamesInComments =>
      'Audiodateinamen in Kommentaren einschließen';

  @override
  String get readyForExport => 'Bereit für den Export';

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
  String get systemLogs => 'Systemprotokolle';

  @override
  String get systemTools => 'Systemwerkzeuge';

  @override
  String get systemControls => 'Systemsteuerung';

  @override
  String get restart => 'Neustart';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Aktualisieren';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Herunterfahren';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Alle Daten löschen';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Dienste';

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
  String get quickActions => 'Schnellaktionen';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Befehl ausgeführt';

  @override
  String errorMsg(String error) {
    return '❌ Fehler: $error';
  }

  @override
  String get species => 'Arten';

  @override
  String get noSpeciesDetected => 'Keine Arten erkannt';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Erkennungen';

  @override
  String get maxConfidence => 'Maximale Konfidenz';

  @override
  String get searchSpecies => 'Arten suchen...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Einstellungen';

  @override
  String get basicSettings => 'Grundeinstellungen';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Erweiterte Einstellungen';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Verbindung';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi Serveradresse';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Geräteinformationen';

  @override
  String get loading => 'Laden...';

  @override
  String get notConnected => 'Nicht verbunden';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Breitengrad';

  @override
  String get longitude => 'Längengrad';

  @override
  String get locality => 'Ort';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Ländercode';

  @override
  String get information => 'Information';

  @override
  String get appVersion => 'Version 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Verbunden mit $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Verbindung zu $url nicht möglich';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Fehler beim Laden der Einstellungen: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Grundeinstellungen erfolgreich gespeichert';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Modell';

  @override
  String get selectAModel => 'Modell auswählen:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Standort';

  @override
  String get siteName => 'Standortname:';

  @override
  String get latitudeInput => 'Breitengrad:';

  @override
  String get longitudeInput => 'Längengrad:';

  @override
  String get birdWeatherToken => 'BirdWeather-Token:';

  @override
  String get notificationsApprise => 'Benachrichtigungen (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Benachrichtigungstitel:';

  @override
  String get notificationBody => 'Benachrichtigungstext:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Jede neue Erkennung melden';

  @override
  String get sendWeeklyReport => 'Wöchentlichen Bericht senden';

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
  String get localization => 'Lokalisierung';

  @override
  String get databaseLanguage => 'Datenbanksprache:';

  @override
  String get otherInfo => 'Weitere Infos';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Grafik-Theme (Web)';

  @override
  String get colorScheme => 'Farbschema:';

  @override
  String get none => 'Keines';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Erweiterte Einstellungen erfolgreich gespeichert';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Speicherplatzverwaltung';

  @override
  String get whenDiskIsFull => 'Wenn Speicher voll ist:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Audio-Einstellungen';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Überlappung (Sek.) [0, 2.9]:';

  @override
  String get audioFormat => 'Audioformat:';

  @override
  String get recordingLength => 'Aufnahmelänge (Sek.):';

  @override
  String get extractionLength => 'Extraktionslänge (Sek.):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Caddy-Passwort';

  @override
  String get appPassword => 'App-Passwort:';

  @override
  String get customLogoImage => 'Benutzerdefiniertes Logo';

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
  String get automaticUpdate => 'Automatisches Update';

  @override
  String get saveRawSpectrograms => 'Roh-Spektrogramme speichern';

  @override
  String get loggingLevels => 'Protokollierungsstufen';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Artenlisten-Verwaltung';

  @override
  String get inclusion => 'Inklusion';

  @override
  String get exclusion => 'Exklusion';

  @override
  String get whitelist => 'Whitelist';

  @override
  String get speciesAlreadyInList => 'Art bereits in der Liste vorhanden';

  @override
  String get listSavedSuccessfully => 'Liste erfolgreich gespeichert';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Wiederholen';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Arten werden geladen...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'Keine Arten in dieser Liste.';

  @override
  String get removeFromList => 'Aus Liste entfernen';

  @override
  String get saving => 'Speichern...';

  @override
  String get save => 'Speichern';

  @override
  String get loginRequired => 'Anmeldung für diese Aktion erforderlich';

  @override
  String get loginTitle => 'Authentifizierung';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Benutzername';

  @override
  String get password => 'Passwort';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Authentifiziert';

  @override
  String get signIn => 'Anmelden';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Abmelden';

  @override
  String get login => 'Anmelden';

  @override
  String get audioStream => 'Audiostream';

  @override
  String get pressPlayToListen => 'Wiedergabe drücken zum Anhören';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Ton einschalten';

  @override
  String get mute => 'Stummschalten';

  @override
  String get resume => 'Fortsetzen';

  @override
  String get pause => 'Pause';

  @override
  String get autoRefresh => 'Automatische Aktualisierung';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Aktuelle Analyse';

  @override
  String get accessRestricted => 'Zugriff eingeschränkt';

  @override
  String get loginToAccessSection =>
      'Loggen Sie sich ein, um auf diesen Bereich zuzugreifen.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Fehler';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Weitere Dienstprogramme';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram not available';

  @override
  String get ebirdCountIdentifier => 'Nr.';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationary';

  @override
  String get ebirdProtocolIncidental => 'Incidental';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Aktualisieren';

  @override
  String get tooltipStop => 'Stoppen';

  @override
  String get tooltipStart => 'Starten';

  @override
  String get tooltipRestart => 'Neustart';

  @override
  String get systemInfo => 'System-Info';

  @override
  String get fileManager => 'Datei-Manager';

  @override
  String get databaseMaintenance => 'Datenbank-Wartung';

  @override
  String get webTerminal => 'Web-Terminal';

  @override
  String get tooltipOpenMenu => 'Menü öffnen';

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
  String get tooltipSearch => 'Suchen';

  @override
  String get tooltipPlay => 'Audio abspielen';

  @override
  String get tooltipPickDate => 'Datum wählen';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Systemstatus';

  @override
  String get sysInfoUptime => 'Betriebszeit';

  @override
  String get sysInfoDisk => 'Festplatte';

  @override
  String get sysInfoMemory => 'Speicher';

  @override
  String get sysInfoCpuTemp => 'CPU-Temp.';

  @override
  String get sysInfoBranch => 'Branch';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Aktivieren';

  @override
  String get disable => 'Deaktivieren';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Woche $weekNumber - $year';
  }
}
