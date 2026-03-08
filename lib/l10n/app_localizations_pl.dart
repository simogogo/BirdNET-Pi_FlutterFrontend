// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Monitorowanie ptaków';

  @override
  String get home => 'Start';

  @override
  String get today => 'Dzisiaj';

  @override
  String get recordings => 'Nagrania';

  @override
  String get liveStream => 'Strumień na żywo';

  @override
  String get liveSpectrogram => 'Spektrogram na żywo';

  @override
  String get speciesManagement => 'ZARZĄDZANIE GATUNKAMI';

  @override
  String get inclusionList => 'Lista dozwolonych';

  @override
  String get exclusionList => 'Lista wykluczonych';

  @override
  String get analysisLog => 'Logi analizy';

  @override
  String get openWebInterface => 'Otwórz interfejs WWW';

  @override
  String get loadingLiveSpectrogram => 'Ładowanie spektrogramu...';

  @override
  String get spectrogramInstruction =>
      'Jeśli dźwięk nie uruchomi się automatycznie, wejdź w interakcję ze stroną lub sprawdź uprawnienia przeglądarki.';

  @override
  String get configureServerFirst =>
      'Najpierw skonfiguruj adres serwera w Ustawieniach';

  @override
  String get recentDetections => 'Ostatnie wykrycia';

  @override
  String get latestDetection => 'Ostatnie wykrycie';

  @override
  String get audioFile => 'Plik audio';

  @override
  String get playing => 'Odtwarzanie';

  @override
  String get noDetectionsToday => 'Brak wykryć dzisiaj';

  @override
  String get systemListening => 'System nasłuchuje...';

  @override
  String get errorOccurred => 'Wystąpił błąd';

  @override
  String get overview => 'Przegląd';

  @override
  String get detectionsAllTime => 'Wykrycia\nogółem';

  @override
  String get detectionsToday => 'Wykrycia\ndzisiaj';

  @override
  String get detectionsLastHour => 'Wykrycia\nostatnia godzina';

  @override
  String get speciesToday => 'Gatunki\ndzisiaj';

  @override
  String get speciesAllTime => 'Gatunki\nogółem';

  @override
  String get statsLoadingError => 'Błąd ładowania statystyk';

  @override
  String get todaysDetections => 'Dzisiejsze wykrycia';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count wykryć';
  }

  @override
  String get filterDetections => 'Filtruj wykrycia';

  @override
  String get minimumConfidenceThreshold => 'Minimalny próg pewności';

  @override
  String get reset => 'Resetuj';

  @override
  String get apply => 'Zastosuj';

  @override
  String get charts => 'Wykresy';

  @override
  String get daily => 'Dzienny';

  @override
  String get weekly => 'Tygodniowy';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Wykres niedostępny';

  @override
  String get weeklyReport => 'Raport tygodniowy';

  @override
  String get newSpecies => 'Nowy gatunek';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Zidentyfikowane gatunki';

  @override
  String get byDate => 'Według daty';

  @override
  String get bySpecies => 'Według gatunku';

  @override
  String exportToEbird(String date) {
    return 'Eksportuj do eBird ($date)';
  }

  @override
  String get noRecordings => 'Brak nagrań';

  @override
  String get deleteRecording => 'Usuń nagranie';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Anuluj';

  @override
  String get delete => 'Usuń';

  @override
  String get noSpeciesFound => 'Nie znaleziono gatunków.';

  @override
  String get unknown => 'Nieznany';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Graj';

  @override
  String get changeId => 'Zmień ID';

  @override
  String get protect => 'Chroń';

  @override
  String get unprotect => 'Usuń ochronę';

  @override
  String get download => 'Pobierz';

  @override
  String get cannotDownloadFile => 'Nie można pobrać pliku';

  @override
  String get errorLoading => 'Błąd ładowania';

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
  String get ebirdExport => 'Eksport eBird';

  @override
  String get generateCsvForEbird => 'Generuj CSV dla eBird';

  @override
  String get downloadAudioZip => 'Pobierz audio (ZIP)';

  @override
  String get close => 'Zamknij';

  @override
  String get continueStep => 'Kontynuuj';

  @override
  String get back => 'Wstecz';

  @override
  String get review => 'Przegląd';

  @override
  String get configuration => 'Konfiguracja';

  @override
  String get summary => 'Podsumowanie';

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
  String get protocol => 'Protokół';

  @override
  String get stationaryPoint => 'Stacjonarny - Punkt';

  @override
  String get nocturnalFlightCall => 'Nocne głosy przelotne (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Nazwa lokalizacji *';

  @override
  String get requiredField => 'Pole wymagane';

  @override
  String get numberOfObservers => 'Liczba obserwatorów';

  @override
  String get additionalComments => 'Dodatkowe uwagi';

  @override
  String get includeAudioFileNamesInComments =>
      'Dołącz nazwy plików audio w uwagach';

  @override
  String get readyForExport => 'Gotowe do eksportu';

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
  String get statistics => 'Statystyki';

  @override
  String get systemLogs => 'Logi systemowe';

  @override
  String get systemTools => 'Narzędzia systemowe';

  @override
  String get systemControls => 'Sterowanie systemem';

  @override
  String get restart => 'Restart';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Aktualizacja';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Wyłączenie';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Wyczyść dane';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Służby';

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
  String get quickActions => 'Szybkie akcje';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Potwierdź';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Polecenie wykonane';

  @override
  String errorMsg(String error) {
    return '❌ Błąd: $error';
  }

  @override
  String get species => 'Gatunki';

  @override
  String get noSpeciesDetected => 'Brak wykrytych gatunków';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Wykrycia';

  @override
  String get maxConfidence => 'Maks. pewność';

  @override
  String get searchSpecies => 'Szukaj gatunków...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Ustawienia';

  @override
  String get basicSettings => 'Ustawienia podstawowe';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Ustawienia zaawansowane';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Połączenie';

  @override
  String get birdNetPiServerAddress => 'Adres serwera BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Informacje o urządzeniu';

  @override
  String get loading => 'Ładowanie...';

  @override
  String get notConnected => 'Brak połączenia';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Szerokość';

  @override
  String get longitude => 'Długość';

  @override
  String get locality => 'Lokalizacja';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Kod kraju';

  @override
  String get information => 'Informacja';

  @override
  String get appVersion => 'Wersja 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Połączono z $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Nie można połączyć z $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Błąd ładowania ustawień: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully => 'Ustawienia podstawowe zapisane';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Wybierz model:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Lokalizacja';

  @override
  String get siteName => 'Nazwa miejsca:';

  @override
  String get latitudeInput => 'Szerokość:';

  @override
  String get longitudeInput => 'Długość:';

  @override
  String get birdWeatherToken => 'Token BirdWeather:';

  @override
  String get notificationsApprise => 'Powiadomienia (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Tytuł powiadomienia:';

  @override
  String get notificationBody => 'Treść powiadomienia:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Powiadamiaj o każdym wykryciu';

  @override
  String get sendWeeklyReport => 'Wyślij raport tygodniowy';

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
  String get localization => 'Lokalizacja';

  @override
  String get databaseLanguage => 'Język bazy danych:';

  @override
  String get otherInfo => 'Inne informacje';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Motyw graficzny (WWW)';

  @override
  String get colorScheme => 'Schemat kolorów:';

  @override
  String get none => 'Brak';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Ustawienia zaawansowane zapisane';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Zarządzanie dyskiem';

  @override
  String get whenDiskIsFull => 'Gdy dysk pełny:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Ustawienia dźwięku';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Nakładanie (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Format audio:';

  @override
  String get recordingLength => 'Długość nagrania (sek):';

  @override
  String get extractionLength => 'Długość wycinka (sek):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Hasło Caddy';

  @override
  String get appPassword => 'Hasło aplikacji:';

  @override
  String get customLogoImage => 'Własne logo';

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
  String get automaticUpdate => 'Automatyczna aktualizacja';

  @override
  String get saveRawSpectrograms => 'Zapisuj surowe spektrogramy';

  @override
  String get loggingLevels => 'Poziomy logowania';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Zarządzanie listami gatunków';

  @override
  String get inclusion => 'Dozwolone';

  @override
  String get exclusion => 'Wykluczone';

  @override
  String get whitelist => 'Biała lista';

  @override
  String get speciesAlreadyInList => 'Gatunek już na liście';

  @override
  String get listSavedSuccessfully => 'Lista zapisana';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Ponów';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Ładowanie gatunków...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'Brak gatunków na liście.';

  @override
  String get removeFromList => 'Usuń z listy';

  @override
  String get saving => 'Zapisywanie...';

  @override
  String get save => 'Zapisz';

  @override
  String get loginRequired => 'Wymagane logowanie';

  @override
  String get loginTitle => 'Autentykacja';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Użytkownik';

  @override
  String get password => 'Hasło';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Zalogowano';

  @override
  String get signIn => 'Zaloguj się';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Wyloguj';

  @override
  String get login => 'Zaloguj';

  @override
  String get audioStream => 'Strumień audio';

  @override
  String get pressPlayToListen => 'Naciśnij graj, aby słuchać';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Włącz dźwięk';

  @override
  String get mute => 'Wycisz';

  @override
  String get resume => 'Wznów';

  @override
  String get pause => 'Pauza';

  @override
  String get autoRefresh => 'Autoodświeżanie';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Obecnie analizowane';

  @override
  String get accessRestricted => 'Dostęp ograniczony';

  @override
  String get loginToAccessSection => 'Zaloguj się, aby uzyskać dostęp.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Błąd';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Inne narzędzia';

  @override
  String liveSeconds(int seconds) {
    return 'NA ŻYWO · ${seconds}s';
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
  String get tooltipRefresh => 'Odśwież';

  @override
  String get tooltipStop => 'Stop';

  @override
  String get tooltipStart => 'Start';

  @override
  String get tooltipRestart => 'Restart';

  @override
  String get systemInfo => 'Info o systemie';

  @override
  String get fileManager => 'Menedżer plików';

  @override
  String get databaseMaintenance => 'Konserwacja bazy danych';

  @override
  String get webTerminal => 'Terminal WWW';

  @override
  String get tooltipOpenMenu => 'Otwórz menu';

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
  String get tooltipSearch => 'Szukaj';

  @override
  String get tooltipPlay => 'Graj audio';

  @override
  String get tooltipPickDate => 'Wybierz datę';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Status systemu';

  @override
  String get sysInfoUptime => 'Czas pracy';

  @override
  String get sysInfoDisk => 'Dysk';

  @override
  String get sysInfoMemory => 'Pamięć';

  @override
  String get sysInfoCpuTemp => 'Temp. CPU';

  @override
  String get sysInfoBranch => 'Gałąź';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Włącz';

  @override
  String get disable => 'Wyłącz';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Tydzień $weekNumber - $year';
  }
}
