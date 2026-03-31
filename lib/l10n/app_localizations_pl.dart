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
  String get noDetectionsForSpecies => 'Brak wykrycia dla tego gatunku';

  @override
  String get removeFilter => 'Usuń filtr';

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
  String get monthly => 'Miesięczny';

  @override
  String get detectionsBySpecies => 'Wykrycia według gatunków';

  @override
  String get hourlyDistribution => 'Dystrybucja godzinowa';

  @override
  String get noChartAvailable => 'Wykres niedostępny';

  @override
  String get weeklyReport => 'Raport tygodniowy';

  @override
  String get monthlyReport => 'Raport Miesięczny';

  @override
  String get newSpecies => 'Nowy gatunek';

  @override
  String get newFemale => 'Nowy!';

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
    return 'Czy chcesz usunąć \'$name\' z $date $time?';
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
  String get noRecordingsAvailable => 'Brak dostępnych nagrań.';

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
      'Automatyczne wykrywanie poprzez BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully =>
      'Pobieranie rozpoczęło się pomyślnie!';

  @override
  String get cannotDownloadCsv => 'Nie można pobrać pliku CSV.';

  @override
  String get zipDownloadInProgress => 'Trwa pobieranie ZIP...';

  @override
  String get cannotOpenZipUrl =>
      'Nie można otworzyć adresu URL do pobrania w formacie ZIP';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Serwer nie zwrócił adresu URL pobierania.';

  @override
  String get unknownError => 'Nieznany błąd';

  @override
  String get serverError => 'Błąd serwera';

  @override
  String get ebirdExport => 'Eksport eBird';

  @override
  String get generateCsvForEbird => 'Generuj CSV dla eBird';

  @override
  String get downloadAudioZip => 'Generuj pliki ZIP audio dla eBird';

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
  String get autoRemoveLessThan80 => 'Automatycznie usuń < 80%';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Gatunek czytany: $totalSpecies | Wystąpienia: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return 'Wykrycia: $count';
  }

  @override
  String get protocol => 'Protokół';

  @override
  String get stationaryPoint => 'Stacjonarny - Punkt';

  @override
  String get nocturnalFlightCall => 'Nocne głosy przelotne (NFC)';

  @override
  String get incidental => 'Przypadkowy';

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
  String get totalUniqueSpecies => 'Łączna liczba gatunków (unikalna)';

  @override
  String get hourlyModeledChecklists => 'Godzinowe modelowane listy kontrolne';

  @override
  String get averageConfidence => 'Średnia pewność';

  @override
  String get wizardInfoText =>
      'Po naciśnięciu \'Generuj CSV\' plik zostanie skompilowany z podziałem stacji według godzin i będzie gotowy do przesłania do eBird.';

  @override
  String get statistics => 'Statystyki';

  @override
  String get systemLogs => 'Logi systemowe';

  @override
  String get systemTools => 'Narzędzia systemowe';

  @override
  String get systemControls => 'Sterowanie systemem';

  @override
  String get restart => 'Uruchom ponownie';

  @override
  String get restartRaspberryPi => 'Uruchom ponownie Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Czy na pewno chcesz zrestartować system?';

  @override
  String get update => 'Aktualizacja';

  @override
  String get updateBirdNetPi => 'Zaktualizuj BirdNET-Pi do najnowszej wersji';

  @override
  String get doYouWantToUpdateBirdNet => 'Czy chcesz zaktualizować BirdNET-Pi?';

  @override
  String get shutdown => 'Wyłączenie';

  @override
  String get shutdownRaspberryPi => 'Wyłącz Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Czy na pewno chcesz zamknąć system?';

  @override
  String get clearAllData => 'Wyczyść dane';

  @override
  String get removeAllRecordingsAndDetections =>
      'Usuń wszystkie nagrania i wykrycia';

  @override
  String get warningAllDataWillBeDeleted =>
      'OSTRZEŻENIE: Wszystkie dane zostaną trwale usunięte. Kontynuować?';

  @override
  String get services => 'Służby';

  @override
  String get liveAudioStream => 'Strumień audio na żywo';

  @override
  String get birdNetAnalysis => 'Analiza BirdNET';

  @override
  String get birdNetRecording => 'Nagrywanie w BirdNET';

  @override
  String get birdNetLog => 'Dziennik BirdNET';

  @override
  String get chartViewer => 'Przeglądarka wykresów';

  @override
  String get spectrogram => 'Spektrogram';

  @override
  String get quickActions => 'Szybkie akcje';

  @override
  String get stopServices => 'Zatrzymaj usługi';

  @override
  String get restartServices => 'Uruchom ponownie usługi';

  @override
  String get confirm => 'Potwierdź';

  @override
  String get execution => 'Wykonanie:';

  @override
  String get commandExecuted => '✅ Polecenie wykonane';

  @override
  String errorMsg(String error) {
    return '❌ Błąd: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Błąd $error';
  }

  @override
  String get settings => 'Ustawienia';

  @override
  String get basicSettings => 'Ustawienia podstawowe';

  @override
  String get basicSettingsSubtitle =>
      'Skonfiguruj czas, lokalizację, język i powiadomienia.';

  @override
  String get advancedSettings => 'Ustawienia zaawansowane';

  @override
  String get advancedSettingsSubtitle =>
      'Skonfiguruj dźwięk, prywatność, zarządzanie dyskami i nie tylko.';

  @override
  String get connection => 'Połączenie';

  @override
  String get birdNetPiServerAddress => 'Adres serwera BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Wprowadź adres IP lub nazwę hosta swojego Raspberry Pi';

  @override
  String get testInProgress => 'Test w toku...';

  @override
  String get saveAndTestConnection => 'Zapisz i przetestuj połączenie';

  @override
  String get deviceInformation => 'Informacje o urządzeniu';

  @override
  String get loading => 'Ładowanie...';

  @override
  String get notConnected => 'Brak połączenia';

  @override
  String get configureServerAddress => 'Skonfiguruj adres serwera';

  @override
  String get latitude => 'Szerokość';

  @override
  String get longitude => 'Długość';

  @override
  String get locality => 'Lokalizacja';

  @override
  String get stateProvince => 'Stan/Prowincja';

  @override
  String get countryCode => 'Kod kraju';

  @override
  String get information => 'Informacja';

  @override
  String get appVersion => 'Wersja 1.0.0';

  @override
  String get appDescription =>
      'Aplikacja towarzysząca dla BirdNET-Pi. Monitoruj wykrywanie ptaków za pomocą Raspberry Pi.';

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
  String get errorWhileSaving => 'Błąd podczas zapisywania';

  @override
  String exceptionDuringSave(String error) {
    return 'Wyjątek podczas zapisywania: $error';
  }

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Wybierz model:';

  @override
  String get speciesRangeModel => 'Model zakresu gatunków V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Gatunek Występowanie Próg częstotliwości [0,0005, 0,99]:';

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
  String get appriseConfig => 'Konfiguracja powiadomień Appprise:';

  @override
  String get notificationTitle => 'Tytuł powiadomienia:';

  @override
  String get notificationBody => 'Treść powiadomienia:';

  @override
  String get notifyNewInfrequent =>
      'Powiadamiaj o każdym nowym, rzadkim wykryciu gatunku';

  @override
  String get notifyFirstDetectionOfDay =>
      'Powiadom każdy gatunek o pierwszym wykryciu w danym dniu';

  @override
  String get notifyEachNewDetection => 'Powiadamiaj o każdym wykryciu';

  @override
  String get sendWeeklyReport => 'Wyślij raport tygodniowy';

  @override
  String get minTimeBetweenNotifications =>
      'Minimalny czas pomiędzy powiadomieniami dotyczącymi tego samego gatunku (s):';

  @override
  String get excludeTheseSpecies =>
      'Wyklucz te gatunki (oddzielone przecinkami):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Powiadom TYLKO w przypadku tych gatunków (oddzielone przecinkami):';

  @override
  String get imageSource => 'Źródło obrazu';

  @override
  String get imageProvider => 'Dostawca obrazu:';

  @override
  String get flickrApiKey => 'Klucz API Flickr:';

  @override
  String get flickrFilterEmail => 'Szukaj tylko zdjęć tego użytkownika Flickr:';

  @override
  String get localization => 'Lokalizacja';

  @override
  String get databaseLanguage => 'Język bazy danych:';

  @override
  String get otherInfo => 'Inne informacje';

  @override
  String get infoSite => 'Strona informacyjna:';

  @override
  String get themeWeb => 'Motyw graficzny (WWW)';

  @override
  String get themeLight => 'Światło';

  @override
  String get themeDark => 'Ciemny';

  @override
  String get colorScheme => 'Schemat kolorów:';

  @override
  String get sfThreshHelp =>
      'Wartość ta jest wykorzystywana przez model do ograniczenia listy możliwych gatunków, które będzie próbował wykryć, biorąc pod uwagę minimalną częstotliwość występowania. Próg 0,03 oznacza, że ​​aby gatunek został umieszczony na tej liście, musi on być średnio widoczny na co najmniej 3% historycznie przesłanych list kontrolnych eBird dla danego tygodnia szerokości/długu/bieżącego roku. Zatem im niższy próg, tym rzadszy gatunek będzie obejmował.';

  @override
  String get birdWeatherHelp =>
      'BirdWeather to mapa pogody zawierająca odgłosy ptaków. Stacje na całym świecie dostarczają strumienie audio i wideo do BirdWeather, gdzie są one następnie analizowane przez BirdNET i porównywane z danymi eBird Grid. UWAGA: korzystając z tokena BirdWeather, wyrażasz zgodę na udostępnianie BirdWeather swoich krajobrazów dźwiękowych i wykrytych obiektów.';

  @override
  String get flickrHelp =>
      'Ustaw klucz API Flickr, aby włączyć wyświetlanie obrazów ptaków obok wykrytych obiektów. Opcja \'Wyszukuj tylko zdjęcia tego użytkownika Flickr\' umożliwia filtrowanie według adresu e-mail konkretnego konta.';

  @override
  String get databaseLangHelp =>
      'Zmodyfikuj to tylko podczas wstępnej konfiguracji!';

  @override
  String get infoSiteHelp =>
      'Wybierz, skąd chcesz pobrać dodatkowe informacje o gatunkach. allaboutbirds.org jest domyślną stroną; ebird.org zawiera więcej gatunków europejskich.';

  @override
  String get none => 'Brak';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Ustawienia zaawansowane zapisane';

  @override
  String get privacyRecordings => 'Prywatność nagrań';

  @override
  String get privacyThreshold => 'Próg prywatności [0, 99]:';

  @override
  String get diskSpaceManagement => 'Zarządzanie dyskiem';

  @override
  String get whenDiskIsFull => 'Gdy dysk pełny:';

  @override
  String get purgeCapacity => 'Wydajność oczyszczania [próg%]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Maksymalna liczba plików do przechowywania dla każdego gatunku (0 = wyłączone):';

  @override
  String get audioSettings => 'Ustawienia dźwięku';

  @override
  String get alsaInputCaptureDevice =>
      'Urządzenie do przechwytywania sygnału wejściowego ALSA (karta dźwiękowa):';

  @override
  String get numberOfAudioChannels =>
      'Liczba kanałów audio, z których można wyodrębnić:';

  @override
  String get overlap => 'Nakładanie (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Format audio:';

  @override
  String get recordingLength => 'Długość nagrania (sek):';

  @override
  String get extractionLength => 'Długość wycinka (sek):';

  @override
  String get rtspAudioSharing => 'Udostępnianie dźwięku RTSP';

  @override
  String get shareLiveAudioStream => 'Udostępnić transmisję audio na żywo?';

  @override
  String get playAudioStreamThroughWebUi =>
      'Odtworzyć strumień audio za pośrednictwem interfejsu internetowego?';

  @override
  String get caddyPassword => 'Hasło Caddy';

  @override
  String get appPassword => 'Hasło aplikacji:';

  @override
  String get customLogoImage => 'Własne logo';

  @override
  String get customImageUrl => 'Niestandardowy adres URL obrazu:';

  @override
  String get customImageTitle => 'Niestandardowy tytuł obrazu:';

  @override
  String get birdNetLiteModelSettings => 'Ustawienia modelu BirdNET-Lite';

  @override
  String get confidenceThreshold => 'Próg ufności [0, 0,99]:';

  @override
  String get sensitivity => 'Czułość [0,5, 1,5]:';

  @override
  String get otherSettings => 'Inne ustawienia';

  @override
  String get silenceUpdateIndicator =>
      'Wycisz wskaźnik \'dostępna aktualizacja\'.';

  @override
  String get automaticUpdate => 'Automatyczna aktualizacja';

  @override
  String get saveRawSpectrograms => 'Zapisuj surowe spektrogramy';

  @override
  String get generateLdfcsStandard => 'LDFCS (Standard Termiczny)';

  @override
  String get generateLdfcsIndices => 'LDFCS (Indeksy Akustyczne)';

  @override
  String get loggingLevels => 'Poziomy logowania';

  @override
  String get birdnetRecordingService => 'Usługa nagrywania BirdNET:';

  @override
  String get spectrogramViewerService => 'Usługa przeglądarki spektrogramu:';

  @override
  String get liveAudioStreamService =>
      'Usługa strumieniowego przesyłania dźwięku na żywo:';

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
  String get errorSavingList => 'Błąd podczas zapisywania listy';

  @override
  String errorLoadingList(String error) {
    return 'Błąd podczas ładowania listy:\\n$error';
  }

  @override
  String get retry => 'Ponów';

  @override
  String get searchSpeciesHint =>
      'Wyszukaj gatunki (np. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Ładowanie gatunków...';

  @override
  String get errorLoadingSpecies => 'Błąd podczas ładowania gatunków';

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
      'Wprowadź swoje dane uwierzytelniające, aby uzyskać dostęp do chronionych funkcji.';

  @override
  String get username => 'Użytkownik';

  @override
  String get password => 'Hasło';

  @override
  String get loginEmptyError => 'Proszę wprowadzić nazwę użytkownika i hasło';

  @override
  String get loginInvalidError => 'Nieprawidłowe dane uwierzytelniające';

  @override
  String get authenticated => 'Zalogowano';

  @override
  String get signIn => 'Zaloguj się';

  @override
  String get loggedInMessage => 'Aktualnie jesteś uwierzytelniony.';

  @override
  String get logout => 'Wyloguj';

  @override
  String get login => 'Zaloguj';

  @override
  String get audioStream => 'Strumień audio';

  @override
  String get pressPlayToListen => 'Naciśnij graj, aby słuchać';

  @override
  String get loginToStart => 'Aby rozpocząć, zaloguj się za pomocą 🔒';

  @override
  String get streamRequiresAuth =>
      'Strumień wymaga uwierzytelnienia. Kliknij ikonę 🔒 w prawym górnym rogu, aby się zalogować.';

  @override
  String get liveAudioFootnote => 'Dźwięk na żywo BirdNET-Pi';

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
  String get pressPlaySpectrogram => 'Naciśnij ▶, aby wyświetlić spektrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Naciśnij ▶, aby rozpocząć spektrogram w czasie rzeczywistym';

  @override
  String get loginThenPlay =>
      'Zaloguj się za pomocą 🔒, a następnie naciśnij ▶';

  @override
  String get currentAnalyzing => 'Obecnie analizowane';

  @override
  String get accessRestricted => 'Dostęp ograniczony';

  @override
  String get loginToAccessSection => 'Zaloguj się, aby uzyskać dostęp.';

  @override
  String get iframeNotSupported =>
      'Ramki iframe są ściśle obsługiwane w wersji internetowej.';

  @override
  String get error => 'Błąd';

  @override
  String get otherUtilities => 'Inne narzędzia';

  @override
  String liveSeconds(int seconds) {
    return 'NA ŻYWO · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spektrogram niedostępny';

  @override
  String get ebirdCountIdentifier => 'Nr';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stacjonarny';

  @override
  String get ebirdProtocolIncidental => 'Przypadkowy';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Odśwież';

  @override
  String get tooltipStop => 'Zatrzymywać się';

  @override
  String get tooltipStart => 'Start';

  @override
  String get tooltipRestart => 'Uruchom ponownie';

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
  String get tooltipRefreshData => 'Odśwież dane';

  @override
  String get tooltipPreviousDay => 'Poprzedni dzień';

  @override
  String get tooltipNextDay => 'Następnego dnia';

  @override
  String get tooltipPreviousWeek => 'Poprzedni tydzień';

  @override
  String get tooltipNextWeek => 'Przyszły tydzień';

  @override
  String get tooltipDeleteRecording => 'Usuń nagranie';

  @override
  String get tooltipClearSearch => 'Wyczyść wyszukiwanie';

  @override
  String get tooltipCloseSearch => 'Zamknij wyszukiwanie';

  @override
  String get tooltipSearch => 'Szukaj';

  @override
  String get tooltipPlay => 'Graj audio';

  @override
  String get tooltipPickDate => 'Wybierz datę';

  @override
  String get passwordOptionalHint => 'Pozostaw puste, jeśli nie jest ustawione';

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
    return '$count popełnia błędy';
  }

  @override
  String get sysInfoLoadingError =>
      'Nie udało się załadować informacji o systemie.';

  @override
  String get enable => 'Włącz';

  @override
  String get disable => 'Wyłącz';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Tydzień $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Grupuj według gatunków';

  @override
  String get groupByTime => 'Grupuj według czasu';

  @override
  String get readOnWikipedia => 'Przeczytaj w Wikipedii';

  @override
  String get loadingWikipedia => 'Ładowanie informacji z Wikipedii...';

  @override
  String get noWikipediaInfo =>
      'W Wikipedii nie znaleziono żadnych informacji na temat tego gatunku.';

  @override
  String get searchSpecies => 'Szukaj gatunków...';

  @override
  String get noResultsFound => 'Nie znaleziono żadnych wyników';

  @override
  String get noSpeciesDetected => 'Brak wykryty';

  @override
  String get species => 'Gatunki';

  @override
  String get detections => 'Detekcje';

  @override
  String get maxConfidence => 'Maks. Pewność';

  @override
  String get topSpecies => 'Najlepsze gatunki';

  @override
  String get fromDate => 'Od daty';

  @override
  String get toDate => 'Do daty';

  @override
  String get fromTime => 'Od godziny';

  @override
  String get toTime => 'Do godziny';

  @override
  String get byPeriod => 'Według okresu';

  @override
  String get selectSpecies => 'Wybierz Gatunek';

  @override
  String get allSpecies => 'Wszystkie gatunki';

  @override
  String get search => 'Szukaj';

  @override
  String occurrenceCount(int count) {
    return 'N. $count';
  }

  @override
  String get firstSeen => 'Widziany po raz pierwszy';

  @override
  String get lastSeen => 'Widziany po raz ostatni';

  @override
  String get firstSeenPeriod => 'Po raz pierwszy widziany (kropka)';

  @override
  String get lastSeenPeriod => 'Ostatnio widziany (kropka)';

  @override
  String get thirtyDaysTrend => 'Trend 30 dni';

  @override
  String get avgConfidence => 'Średnia pewność';

  @override
  String get mySpecies => 'Moje Gatunki';

  @override
  String get bestDetection => 'Najlepsza Detekcja';

  @override
  String get externalInfoLink => 'Informacje Zewnętrzne';

  @override
  String get includedListInfo =>
      'Uwaga! Jeśli ta lista zawiera JAKIEKOLWIEK gatunki, system rozpozna TYLKO te gatunki. Pozostaw tę listę PUSTĄ, chyba że interesuje Cię TYLKO wykrywanie określonych gatunków.';

  @override
  String get excludedListInfo =>
      'Po podświetleniu żądanego gatunku kliknij na niego, a następnie kliknij DODAJ, aby go wykluczyć.';

  @override
  String get whitelistInfo =>
      'Po podświetleniu żądanego gatunku kliknij na niego, a następnie kliknij DODAJ, aby dodać go do białej listy. Gatunek ten zostanie wykryty, nawet jeśli znajduje się poniżej progu częstotliwości występowania (Species Occurrence Frequency Threshold) w ustawieniach. Nie jest to zalecany sposób pracy: preferowane jest wcześniejsze wypróbowanie obu modeli występowania gatunków (v1 i v2.4).';

  @override
  String get overnightRange => 'Przedział nocny (obejmuje północ)';

  @override
  String get resetFilters => 'Resetuj filtry';

  @override
  String invalidValueRange(num min, num max) {
    return 'Wartość musi mieścić się w przedziale od $min do $max';
  }

  @override
  String get speciesListTester => 'Tester listy gatunków';

  @override
  String get previewSpeciesList => 'Podgląd listy gatunków';

  @override
  String get threshold => 'Próg:';

  @override
  String get sfThreshHelpExtended =>
      'Wartość ta jest wykorzystywana przez model do ograniczenia listy możliwych gatunków, które będzie próbował wykryć, biorąc pod uwagę minimalną częstotliwość występowania. Próg 0,03 oznacza, że ​​aby gatunek został umieszczony na tej liście, musi on być średnio widoczny na co najmniej 3% historycznie przesłanych list kontrolnych eBird dla danego tygodnia szerokości/długu/bieżącego roku. Zatem im niższy próg, tym rzadszy gatunek będzie obejmował.\n\n[Szczegółowy opis techniczny tutaj](https://github.com/kahst/BirdNET-Analyzer/discussions/234)';

  @override
  String get sfThreshTesterHint =>
      'Jeśli chcesz majstrować przy tej wartości progowej i zobaczyć, które gatunki znajdą się na liście, możesz skorzystać z poniższego narzędzia Tester listy gatunków.';

  @override
  String get sfThreshTesterLegacyHint =>
      'Kliknij \'Aktualizuj ustawienia\' na samym dole tej strony, aby zainstalować odpowiedni plik etykiety, a następnie wróć tutaj i będziesz mógł korzystać z Testera listy gatunków.';

  @override
  String get appriseConfigHelp =>
      'Powiadomienia Apprise można skonfigurować i włączyć dla ponad 90 usług powiadomień. Każda usługa powinna znajdować się na osobnej linii.\n\n**Przykłady:**\n- `mailto://<użytkownik>:<hasło>@gmail.com`\n- `tgram://<bot_token>/<chat_id>`\n- `discord://<IDhookID>/<TokenWebhook>`\n\n[Full Appprise Wiki](https://github.com/caronc/apprise/wiki)';

  @override
  String get notificationVarsHelp =>
      'W tytule i treści możesz użyć następujących zmiennych:\n\n- `\$sciname`: Nazwa naukowa\n- `\$comname`: Nazwa zwyczajowa\n- `\$confidencepct`: Wynik zaufania jako procent\n- `\$listenurl`: Link do wykrycia\n- `\$data`, `\$godzina`, `\$tydzień`: Informacje o dacie/godzinie\n- `\$image`: Obraz gatunku\n- `\$powód`: Powód powiadomienia';

  @override
  String get excludeSpeciesHelp =>
      'Wyklucz te gatunki z powiadomień (nazwy zwyczajowe oddzielane przecinkami). Przykład: \'Gołąb żałobny, wrona amerykańska\'.';

  @override
  String get includeSpeciesHelp =>
      'Powiadamiaj TYLKO o tych gatunkach (nazwy zwyczajowe oddzielane przecinkami).';

  @override
  String get serverUrl => 'Adres URL serwera';

  @override
  String get pleaseEnterUrl => 'Proszę wprowadzić adres URL serwera';

  @override
  String get serverUnreachable =>
      'Serwer nieosiągalny. Sprawdź adres i spróbuj ponownie.';

  @override
  String get welcomeToBirdNetPi => 'Witamy w BirdNET-Pi';

  @override
  String get enterServerUrlDescription =>
      'Aby rozpocząć, wprowadź adres URL swojego serwera BirdNET-Pi.';

  @override
  String get connect => 'Łączyć';

  @override
  String get serverUpdatedSuccessfully =>
      'Serwer został zaktualizowany pomyślnie!';

  @override
  String get serverInformation => 'Informacje o serwerze';

  @override
  String get noData => 'Brak danych';

  @override
  String get trends => 'Trendy';

  @override
  String get selectSpeciesToViewTrends =>
      'Wybierz gatunek, aby zobaczyć trendy';

  @override
  String speciesDetailsError(String error) {
    return 'Błąd w szczegółach gatunku: $error';
  }

  @override
  String get fromLabel => 'Z';

  @override
  String get toLabel => 'Do';

  @override
  String get exportMenuLabel => 'Eksport';

  @override
  String get exportDataTitle => 'Eksportuj dane';

  @override
  String get ebirdExportDesc => 'Przewodnik po przesyłaniu list kontrolnych.';

  @override
  String get csvExport => 'Eksportuj do CSV';

  @override
  String get csvExportDesc => 'Surowe dane filtrowane według daty i gatunku.';

  @override
  String get audioZipExport => 'Codzienny eksport audio';

  @override
  String get audioZipExportDesc => 'Poproś o zip wszystkich nagrań.';

  @override
  String get zipManager => 'Zarządzanie zipem';

  @override
  String get zipManagerDesc => 'Pobierz lub usuń pliki zip na serwerze.';

  @override
  String get startDate => 'Data rozpoczęcia';

  @override
  String get endDate => 'Data zakończenia';

  @override
  String get filterBySpeciesOptional => 'Filtruj według gatunku (opcjonalnie)';

  @override
  String get selectedSpecies => 'Wybrane gatunki';

  @override
  String get emptyIncludeAllSpecies =>
      '* Jeśli puste: obejmuje wszystkie gatunki';

  @override
  String get executeExport => 'WYKONAJ EKSPORT';

  @override
  String get chooseFullDayText =>
      'Wybierz dzień, dla którego chcesz wyeksportować nagrania:';

  @override
  String get requestZipGeneration => 'ZAMÓW GENERację ZIP-u';

  @override
  String get zipGenerationWarning =>
      '* Operacja może potrwać kilka minut. Możesz pobrać plik zip z sekcji „Zarządzanie Zipem”.';

  @override
  String get zipGenerationStarted =>
      'Rozpoczęto generowanie pliku ZIP. Będzie on dostępny w sekcji Zip Manager.';

  @override
  String get refreshList => 'Odśwież listę';

  @override
  String get downloadZip => 'Pobierać';

  @override
  String get filterSpecies => 'Filtruj gatunki';

  @override
  String get allSpeciesWillBeExported => 'Wszystkie gatunki będą eksportowane.';

  @override
  String get export => 'Eksport';

  @override
  String get hourlyDistributionDetections => 'Rozkład godzinowy (detekcje)';

  @override
  String get dayNightWeatherProfile => 'Profil dnia i nocy (pogoda)';

  @override
  String get dailyDetections => 'Dzienne detekcje';

  @override
  String get temperatureUnitLabel => 'Temperatura (°C)';

  @override
  String get windSpeedUnitLabel => 'Prędkość wiatru (km/h)';

  @override
  String get densityMapSunInfo => 'Mapa gęstości ze wschodem i zachodem słońca';

  @override
  String get externalSheet => 'Arkusz zewnętrzny';

  @override
  String get totalAllTime => 'Suma (zawsze)';

  @override
  String get detectionsLabel => 'Detekcje';

  @override
  String get maxConfidenceLabel => 'Maks. ufność';

  @override
  String get averageConfidenceLabel => 'Średnia ufność';

  @override
  String get dayLegend => 'Dzień ☀️';

  @override
  String get nightLegend => 'Noc 🌙';

  @override
  String get weatherClear => 'Czysto';

  @override
  String get weatherCloudy => 'Pochmurno';

  @override
  String get weatherFog => 'Mgła';

  @override
  String get weatherRain => 'Deszcz';

  @override
  String get weatherSnow => 'Śnieg';

  @override
  String get weatherThunderstorm => 'Burza';

  @override
  String get loadingAudioLabel => 'Ładowanie dźwięku...';

  @override
  String get errorLoadingAudioLabel => 'Błąd ładowania dźwięku';

  @override
  String get detectionsTotal => 'Detekcje';

  @override
  String get ebirdExportError => 'Błąd żądania pliku ZIP.';

  @override
  String get temperature => 'Temperatura';

  @override
  String get wind => 'Wiatr';

  @override
  String get dateLabel => 'Data';

  @override
  String get notAvailable => 'N/D';

  @override
  String get ldfcsStandardTitle => 'Spektrogram długotrwały (standardowy)';

  @override
  String get ldfcsIndicesTitle =>
      'Spektrogram długotrwały (indeksy akustyczne)';

  @override
  String get ldfcsDescription => 'Wizualizacja 24-godzinnego nagrania';
}
