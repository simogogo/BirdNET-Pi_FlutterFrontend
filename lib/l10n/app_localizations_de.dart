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
  String get noDetectionsForSpecies => 'Keine Nachweise für diese Art';

  @override
  String get removeFilter => 'Filter entfernen';

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
  String get monthly => 'Monatlich';

  @override
  String get detectionsBySpecies => 'Nachweise nach Arten';

  @override
  String get hourlyDistribution => 'Stündliche Verteilung';

  @override
  String get noChartAvailable => 'Kein Diagramm verfügbar';

  @override
  String get weeklyReport => 'Wochenbericht';

  @override
  String get monthlyReport => 'Monatsbericht';

  @override
  String get newSpecies => 'Neue Art';

  @override
  String get newFemale => 'Neu!';

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
    return 'Möchten Sie „$name“ ab $date $time löschen?';
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
  String get noRecordingsAvailable => 'Keine Aufnahmen verfügbar.';

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
      'Automatische Erkennungen über BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully => 'Download erfolgreich gestartet!';

  @override
  String get cannotDownloadCsv => 'CSV kann nicht heruntergeladen werden.';

  @override
  String get zipDownloadInProgress => 'ZIP-Download läuft...';

  @override
  String get cannotOpenZipUrl =>
      'URL für ZIP-Download kann nicht geöffnet werden';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Der Server hat die Download-URL nicht zurückgegeben.';

  @override
  String get unknownError => 'Unbekannter Fehler';

  @override
  String get serverError => 'Serverfehler';

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
  String get autoRemoveLessThan80 => '< 80% automatisch entfernen';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Arten gelesen: $totalSpecies | Vorkommen: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count Erkennungen';
  }

  @override
  String get protocol => 'Protokoll';

  @override
  String get stationaryPoint => 'Stationär - Festpunkt';

  @override
  String get nocturnalFlightCall => 'Nächtlicher Flugruf (NFC)';

  @override
  String get incidental => 'Zufällig';

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
  String get totalUniqueSpecies => 'Gesamtzahl der Arten (einzigartig)';

  @override
  String get hourlyModeledChecklists => 'Stündlich modellierte Checklisten';

  @override
  String get averageConfidence => 'Durchschnittliches Vertrauen';

  @override
  String get wizardInfoText =>
      'Durch Klicken auf „CSV generieren“ wird die Datei zusammengestellt, die Stationen nach Stunden unterteilt, und kann auf eBird hochgeladen werden.';

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
  String get restartRaspberryPi => 'Starten Sie den Raspberry Pi neu';

  @override
  String get areYouSureYouWantToRestart =>
      'Sind Sie sicher, dass Sie das System neu starten möchten?';

  @override
  String get update => 'Aktualisieren';

  @override
  String get updateBirdNetPi =>
      'Aktualisieren Sie BirdNET-Pi auf die neueste Version';

  @override
  String get doYouWantToUpdateBirdNet =>
      'Möchten Sie BirdNET-Pi aktualisieren?';

  @override
  String get shutdown => 'Herunterfahren';

  @override
  String get shutdownRaspberryPi => 'Fahren Sie den Raspberry Pi herunter';

  @override
  String get areYouSureYouWantToShutdown =>
      'Sind Sie sicher, dass Sie das System herunterfahren möchten?';

  @override
  String get clearAllData => 'Alle Daten löschen';

  @override
  String get removeAllRecordingsAndDetections =>
      'Entfernen Sie alle Aufzeichnungen und Erkennungen';

  @override
  String get warningAllDataWillBeDeleted =>
      'ACHTUNG: Alle Daten werden dauerhaft gelöscht. Weitermachen?';

  @override
  String get services => 'Dienste';

  @override
  String get liveAudioStream => 'Live-Audiostream';

  @override
  String get birdNetAnalysis => 'BirdNET-Analyse';

  @override
  String get birdNetRecording => 'BirdNET-Aufzeichnung';

  @override
  String get birdNetLog => 'BirdNET-Protokoll';

  @override
  String get chartViewer => 'Diagrammbetrachter';

  @override
  String get spectrogram => 'Spektrogramm';

  @override
  String get quickActions => 'Schnellaktionen';

  @override
  String get stopServices => 'Dienste stoppen';

  @override
  String get restartServices => 'Starten Sie die Dienste neu';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get execution => 'Ausführung:';

  @override
  String get commandExecuted => '✅ Befehl ausgeführt';

  @override
  String errorMsg(String error) {
    return '❌ Fehler: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Fehler';
  }

  @override
  String get settings => 'Einstellungen';

  @override
  String get basicSettings => 'Grundeinstellungen';

  @override
  String get basicSettingsSubtitle =>
      'Konfigurieren Sie Zeit, Ort, Sprache und Benachrichtigungen.';

  @override
  String get advancedSettings => 'Erweiterte Einstellungen';

  @override
  String get advancedSettingsSubtitle =>
      'Konfigurieren Sie Audio, Datenschutz, Datenträgerverwaltung und mehr.';

  @override
  String get connection => 'Verbindung';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi Serveradresse';

  @override
  String get enterIpOrHostname =>
      'Geben Sie die IP-Adresse oder den Hostnamen Ihres Raspberry Pi ein';

  @override
  String get testInProgress => 'Test läuft...';

  @override
  String get saveAndTestConnection => 'Verbindung speichern und testen';

  @override
  String get deviceInformation => 'Geräteinformationen';

  @override
  String get loading => 'Laden...';

  @override
  String get notConnected => 'Nicht verbunden';

  @override
  String get configureServerAddress => 'Konfigurieren Sie die Serveradresse';

  @override
  String get latitude => 'Breitengrad';

  @override
  String get longitude => 'Längengrad';

  @override
  String get locality => 'Ort';

  @override
  String get stateProvince => 'Staat/Provinz';

  @override
  String get countryCode => 'Ländercode';

  @override
  String get information => 'Information';

  @override
  String get appVersion => 'Version 1.0.0';

  @override
  String get appDescription =>
      'Begleit-App für BirdNET-Pi. Überwachen Sie Vogelerkennungen von Ihrem Raspberry Pi aus.';

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
  String get errorWhileSaving => 'Fehler beim Speichern';

  @override
  String exceptionDuringSave(String error) {
    return 'Ausnahme beim Speichern: $error';
  }

  @override
  String get model => 'Modell';

  @override
  String get selectAModel => 'Modell auswählen:';

  @override
  String get speciesRangeModel => 'Artenbereichsmodell V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Schwellenwert für die Häufigkeit des Vorkommens einer Art [0,0005, 0,99]:';

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
  String get appriseConfig => 'Konfiguration der Apprise-Benachrichtigungen:';

  @override
  String get notificationTitle => 'Benachrichtigungstitel:';

  @override
  String get notificationBody => 'Benachrichtigungstext:';

  @override
  String get notifyNewInfrequent =>
      'Benachrichtigen Sie jede neu entdeckte seltene Art';

  @override
  String get notifyFirstDetectionOfDay =>
      'Benachrichtigen Sie jede Art über den ersten Fund des Tages';

  @override
  String get notifyEachNewDetection => 'Jede neue Erkennung melden';

  @override
  String get sendWeeklyReport => 'Wöchentlichen Bericht senden';

  @override
  String get minTimeBetweenNotifications =>
      'Mindestzeit zwischen Meldungen derselben Art (Sek.):';

  @override
  String get excludeTheseSpecies =>
      'Diese Arten ausschließen (durch Kommas getrennt):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Melden Sie NUR für diese Arten (durch Kommas getrennt):';

  @override
  String get imageSource => 'Bildquelle';

  @override
  String get imageProvider => 'Bildanbieter:';

  @override
  String get flickrApiKey => 'Flickr-API-Schlüssel:';

  @override
  String get flickrFilterEmail =>
      'Suchen Sie nur nach Fotos dieses Flickr-Benutzers:';

  @override
  String get localization => 'Lokalisierung';

  @override
  String get databaseLanguage => 'Datenbanksprache:';

  @override
  String get otherInfo => 'Weitere Infos';

  @override
  String get infoSite => 'Infoseite:';

  @override
  String get themeWeb => 'Grafik-Theme (Web)';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get colorScheme => 'Farbschema:';

  @override
  String get sfThreshHelp =>
      'This value is used by the model to constrain the list of possible species that it will try to detect, given the minimum occurrence frequency. A 0.03 threshold means that for a species to be included in this list, it needs to, on average, be seen on at least 3% of historically submitted eBird checklists for your given lat/lon/current week of year. So, the lower the threshold, the rarer the species it will include.';

  @override
  String get birdWeatherHelp =>
      'BirdWeather is a weather map for bird sounds. Stations around the world supply audio and video streams to BirdWeather where they are then analyzed by BirdNET and compared to eBird Grid data. NOTE: By using your BirdWeather Token, you are consenting to sharing your soundscapes and detections with BirdWeather.';

  @override
  String get flickrHelp =>
      'Set your Flickr API key to enable the display of bird images next to detections. \'Only search photos from this Flickr user\' allows filtering by a specific account email.';

  @override
  String get databaseLangHelp => 'Only modify this at initial setup!';

  @override
  String get infoSiteHelp =>
      'Select where to pull additional species info from. allaboutbirds.org is the default; ebird.org has more European species.';

  @override
  String get none => 'Keines';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Erweiterte Einstellungen erfolgreich gespeichert';

  @override
  String get privacyRecordings => 'Datenschutz bei Aufnahmen';

  @override
  String get privacyThreshold => 'Datenschutzschwelle [0, 99]:';

  @override
  String get diskSpaceManagement => 'Speicherplatzverwaltung';

  @override
  String get whenDiskIsFull => 'Wenn Speicher voll ist:';

  @override
  String get purgeCapacity => 'Spülkapazität [% Schwellenwert]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Maximal zu behaltende Dateien pro Art (0 = deaktivieren):';

  @override
  String get audioSettings => 'Audio-Einstellungen';

  @override
  String get alsaInputCaptureDevice =>
      'ALSA-Eingabeerfassungsgerät (Soundkarte):';

  @override
  String get numberOfAudioChannels =>
      'Anzahl der zu extrahierenden Audiokanäle:';

  @override
  String get overlap => 'Überlappung (Sek.) [0, 2.9]:';

  @override
  String get audioFormat => 'Audioformat:';

  @override
  String get recordingLength => 'Aufnahmelänge (Sek.):';

  @override
  String get extractionLength => 'Extraktionslänge (Sek.):';

  @override
  String get rtspAudioSharing => 'RTSP-Audio-Sharing';

  @override
  String get shareLiveAudioStream => 'Live-Audiostream teilen?';

  @override
  String get playAudioStreamThroughWebUi =>
      'Audiostream über die Web-Benutzeroberfläche abspielen?';

  @override
  String get caddyPassword => 'Caddy-Passwort';

  @override
  String get appPassword => 'App-Passwort:';

  @override
  String get customLogoImage => 'Benutzerdefiniertes Logo';

  @override
  String get customImageUrl => 'Benutzerdefinierte Bild-URL:';

  @override
  String get customImageTitle => 'Benutzerdefinierter Bildtitel:';

  @override
  String get birdNetLiteModelSettings => 'BirdNET-Lite-Modelleinstellungen';

  @override
  String get confidenceThreshold => 'Konfidenzschwelle [0, 0,99]:';

  @override
  String get sensitivity => 'Empfindlichkeit [0,5, 1,5]:';

  @override
  String get otherSettings => 'Andere Einstellungen';

  @override
  String get silenceUpdateIndicator =>
      'Die Anzeige „Update verfügbar“ wird stummgeschaltet';

  @override
  String get automaticUpdate => 'Automatisches Update';

  @override
  String get saveRawSpectrograms => 'Roh-Spektrogramme speichern';

  @override
  String get loggingLevels => 'Protokollierungsstufen';

  @override
  String get birdnetRecordingService => 'BirdNET-Aufzeichnungsdienst:';

  @override
  String get spectrogramViewerService => 'Spektrogramm-Viewer-Service:';

  @override
  String get liveAudioStreamService => 'Live-Audio-Stream-Dienst:';

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
  String get errorSavingList => 'Fehler beim Speichern der Liste';

  @override
  String errorLoadingList(String error) {
    return 'Fehler beim Laden der Liste:\\n$error';
  }

  @override
  String get retry => 'Wiederholen';

  @override
  String get searchSpeciesHint =>
      'Suchen Sie nach Arten (z. B. Turdus merula_Amsel)';

  @override
  String get loadingSpecies => 'Arten werden geladen...';

  @override
  String get errorLoadingSpecies => 'Fehler beim Laden der Art';

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
      'Geben Sie Ihre Anmeldeinformationen ein, um auf geschützte Funktionen zuzugreifen.';

  @override
  String get username => 'Benutzername';

  @override
  String get password => 'Passwort';

  @override
  String get loginEmptyError =>
      'Bitte geben Sie Benutzernamen und Passwort ein';

  @override
  String get loginInvalidError => 'Ungültige Anmeldeinformationen';

  @override
  String get authenticated => 'Authentifiziert';

  @override
  String get signIn => 'Anmelden';

  @override
  String get loggedInMessage => 'Sie sind derzeit authentifiziert.';

  @override
  String get logout => 'Abmelden';

  @override
  String get login => 'Anmelden';

  @override
  String get audioStream => 'Audiostream';

  @override
  String get pressPlayToListen => 'Wiedergabe drücken zum Anhören';

  @override
  String get loginToStart => 'Melden Sie sich mit 🔒 an, um zu beginnen';

  @override
  String get streamRequiresAuth =>
      'Der Stream erfordert eine Authentifizierung. Tippen Sie oben rechts auf das 🔒-Symbol, um sich anzumelden.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live-Audio';

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
  String get pressPlaySpectrogram =>
      'Drücken Sie ▶, um das Spektrogramm anzuzeigen';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Drücken Sie ▶, um das Echtzeit-Spektrogramm zu starten';

  @override
  String get loginThenPlay =>
      'Melden Sie sich mit 🔒 an und drücken Sie dann ▶';

  @override
  String get currentAnalyzing => 'Aktuelle Analyse';

  @override
  String get accessRestricted => 'Zugriff eingeschränkt';

  @override
  String get loginToAccessSection =>
      'Loggen Sie sich ein, um auf diesen Bereich zuzugreifen.';

  @override
  String get iframeNotSupported =>
      'Iframes werden in der Webversion strikt unterstützt.';

  @override
  String get error => 'Fehler';

  @override
  String get otherUtilities => 'Weitere Dienstprogramme';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spektrogramm nicht verfügbar';

  @override
  String get ebirdCountIdentifier => 'Nr.';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationär';

  @override
  String get ebirdProtocolIncidental => 'Zufällig';

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
  String get tooltipRefreshData => 'Daten aktualisieren';

  @override
  String get tooltipPreviousDay => 'Vorheriger Tag';

  @override
  String get tooltipNextDay => 'Am nächsten Tag';

  @override
  String get tooltipPreviousWeek => 'Vorherige Woche';

  @override
  String get tooltipNextWeek => 'Nächste Woche';

  @override
  String get tooltipDeleteRecording => 'Aufnahme löschen';

  @override
  String get tooltipClearSearch => 'Suche löschen';

  @override
  String get tooltipCloseSearch => 'Suche schließen';

  @override
  String get tooltipSearch => 'Suchen';

  @override
  String get tooltipPlay => 'Audio abspielen';

  @override
  String get tooltipPickDate => 'Datum wählen';

  @override
  String get passwordOptionalHint => 'Wenn nicht festgelegt, leer lassen';

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
    return '$count Commits im Rückstand';
  }

  @override
  String get sysInfoLoadingError =>
      'Systeminformationen konnten nicht geladen werden.';

  @override
  String get enable => 'Aktivieren';

  @override
  String get disable => 'Deaktivieren';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Woche $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Nach Arten gruppieren';

  @override
  String get groupByTime => 'Nach Zeit gruppieren';

  @override
  String get readOnWikipedia => 'Lesen Sie auf Wikipedia';

  @override
  String get loadingWikipedia =>
      'Informationen aus Wikipedia werden geladen...';

  @override
  String get noWikipediaInfo =>
      'Auf Wikipedia wurden für diese Art keine Informationen gefunden.';

  @override
  String get searchSpecies => 'Arten suchen...';

  @override
  String get noResultsFound => 'Keine Ergebnisse gefunden';

  @override
  String get noSpeciesDetected => 'Keine Arten erkannt';

  @override
  String get species => 'Spezies';

  @override
  String get detections => 'Meldungen';

  @override
  String get maxConfidence => 'Max. Konfidenz';

  @override
  String get topSpecies => 'Häufigste Arten';

  @override
  String get fromDate => 'Ab Datum';

  @override
  String get toDate => 'Bis Datum';

  @override
  String get fromTime => 'Ab Uhrzeit';

  @override
  String get toTime => 'Bis Uhrzeit';

  @override
  String get byPeriod => 'Nach Zeitraum';

  @override
  String get selectSpecies => 'Spezies auswählen';

  @override
  String get allSpecies => 'Alle Spezies';

  @override
  String get search => 'Suchen';

  @override
  String occurrenceCount(int count) {
    return 'n. $count';
  }

  @override
  String get firstSeen => 'Zuerst gesehen';

  @override
  String get lastSeen => 'Zuletzt gesehen';

  @override
  String get thirtyDaysTrend => '30-Tage-Trend';

  @override
  String get avgConfidence => 'Durchschn. Vertrauen';

  @override
  String get mySpecies => 'Meine Arten';

  @override
  String get bestDetection => 'Beste Erkennung';

  @override
  String get externalInfoLink => 'Externe Info';

  @override
  String get includedListInfo =>
      'Achtung! Wenn diese Liste IRGENDWELCHE Arten enthält, erkennt das System NUR diese Arten. Lassen Sie diese Liste LEER, es sei denn, Sie sind NUR an der Erkennung bestimmter Arten interessiert.';

  @override
  String get excludedListInfo =>
      'Sobald die gewünschte Art markiert ist, klicken Sie darauf und dann auf HINZUFÜGEN, um sie auszuschließen.';

  @override
  String get whitelistInfo =>
      'Sobald die gewünschte Art markiert ist, klicken Sie darauf und dann auf HINZUFÜGEN, um sie auf die Whitelist zu setzen. Diese Art wird erkannt, auch wenn sie unter dem in den Einstellungen definierten Schwellenwert (Species Occurrence Frequency Threshold) liegt. Dies ist keine empfohlene Arbeitsweise: Es ist ratsam, zuerst beide Artvorkommensmodelle (v1 und v2.4) zu versuchen.';

  @override
  String get overnightRange => 'Nachtbereich (überschreitet Mitternacht)';

  @override
  String get resetFilters => 'Filter zurücksetzen';

  @override
  String invalidValueRange(num min, num max) {
    return 'Wert muss zwischen $min und $max liegen';
  }

  @override
  String get speciesListTester => 'Artenlisten-Tester';

  @override
  String get previewSpeciesList => 'Artenliste anzeigen';

  @override
  String get threshold => 'Schwellenwert:';

  @override
  String get sfThreshHelpExtended =>
      'Dieser Wert wird vom Modell verwendet, um die Liste der möglichen Arten einzuschränken...';

  @override
  String get sfThreshTesterHint =>
      'Wenn Sie mit diesem Schwellenwert experimentieren und sehen möchten, welche Arten auf die Liste kommen...';

  @override
  String get sfThreshTesterLegacyHint =>
      'Klicken Sie auf \"Einstellungen aktualisieren\", um die Label-Datei zu installieren.';

  @override
  String get appriseConfigHelp =>
      'Apprise Notifications can be setup and enabled for 90+ notification services. Each service should be on its own line.';

  @override
  String get notificationVarsHelp =>
      'Sie können folgende Variablen verwenden...';

  @override
  String get excludeSpeciesHelp =>
      'Diese Arten von Benachrichtigungen ausschließen.';

  @override
  String get includeSpeciesHelp =>
      'NUR für diese Arten benachrichtigen (kommagetrennte Trivialnamen).';

  @override
  String get serverUrl => 'Server-URL';

  @override
  String get pleaseEnterUrl => 'Bitte Server-URL eingeben';

  @override
  String get serverUnreachable => 'Server nicht erreichbar.';

  @override
  String get welcomeToBirdNetPi => 'Willkommen bei BirdNET-Pi';

  @override
  String get enterServerUrlDescription =>
      'Geben Sie zum Starten die URL Ihres BirdNET-Pi-Servers ein.';

  @override
  String get connect => 'Verbinden';

  @override
  String get serverUpdatedSuccessfully => 'Server erfolgreich aktualisiert!';

  @override
  String get serverInformation => 'Serverinformationen';
}
