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
  String get noDetectionsForSpecies => 'Nema detekcija za ovu vrstu';

  @override
  String get removeFilter => 'Uklonite filter';

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
  String get detectionsBySpecies => 'Otkrivanje po vrstama';

  @override
  String get hourlyDistribution => 'Distribucija po satu';

  @override
  String get noChartAvailable => 'Grafikon nije dostupan';

  @override
  String get weeklyReport => 'Tjedno izvješće';

  @override
  String get newSpecies => 'Nova vrsta';

  @override
  String get newFemale => 'Novi!';

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
    return 'Želite li izbrisati \"$name\" od $date $time?';
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
  String get noRecordingsAvailable => 'Nema dostupnih snimaka.';

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
      'Automatske detekcije putem BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully => 'Preuzimanje je uspješno započelo!';

  @override
  String get cannotDownloadCsv => 'Nije moguće preuzeti CSV.';

  @override
  String get zipDownloadInProgress => 'ZIP preuzimanje u tijeku...';

  @override
  String get cannotOpenZipUrl => 'Nije moguće otvoriti URL za ZIP preuzimanje';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Poslužitelj nije vratio URL za preuzimanje.';

  @override
  String get unknownError => 'Nepoznata greška';

  @override
  String get serverError => 'Greška poslužitelja';

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
  String get autoRemoveLessThan80 => 'Automatski ukloni < 80%';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Pročitana vrsta: $totalSpecies | Pojavljivanja: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count otkrivanja';
  }

  @override
  String get protocol => 'Protokol';

  @override
  String get stationaryPoint => 'Stacionarno - Fiksna točka';

  @override
  String get nocturnalFlightCall => 'Noćni poziv u letu (NFC)';

  @override
  String get incidental => 'Usputno';

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
  String get totalUniqueSpecies => 'Ukupno vrsta (jedinstveno)';

  @override
  String get hourlyModeledChecklists => 'Kontrolne liste modelirane po satu';

  @override
  String get averageConfidence => 'Prosječno povjerenje';

  @override
  String get wizardInfoText =>
      'Pritiskom na \"Generiraj CSV\", datoteka će se kompajlirati dijeleći postaje po satu, spremna za učitavanje na eBird.';

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
  String get restartRaspberryPi => 'Ponovno pokrenite Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Jeste li sigurni da želite ponovno pokrenuti sustav?';

  @override
  String get update => 'Ažuriraj';

  @override
  String get updateBirdNetPi => 'Ažurirajte BirdNET-Pi na najnoviju verziju';

  @override
  String get doYouWantToUpdateBirdNet => 'Želite li ažurirati BirdNET-Pi?';

  @override
  String get shutdown => 'Isključivanje';

  @override
  String get shutdownRaspberryPi => 'Isključite Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Jeste li sigurni da želite isključiti sustav?';

  @override
  String get clearAllData => 'Očisti sve podatke';

  @override
  String get removeAllRecordingsAndDetections =>
      'Uklonite sve snimke i detekcije';

  @override
  String get warningAllDataWillBeDeleted =>
      'UPOZORENJE: Svi podaci bit će trajno izbrisani. Nastaviti?';

  @override
  String get services => 'Usluge';

  @override
  String get liveAudioStream => 'Audio prijenos uživo';

  @override
  String get birdNetAnalysis => 'BirdNET analiza';

  @override
  String get birdNetRecording => 'BirdNET snimanje';

  @override
  String get birdNetLog => 'BirdNET Dnevnik';

  @override
  String get chartViewer => 'Preglednik grafikona';

  @override
  String get spectrogram => 'Spektrogram';

  @override
  String get quickActions => 'Brze radnje';

  @override
  String get stopServices => 'Zaustavi usluge';

  @override
  String get restartServices => 'Ponovno pokrenite usluge';

  @override
  String get confirm => 'Potvrdi';

  @override
  String get execution => 'Izvršenje:';

  @override
  String get commandExecuted => '✅ Naredba izvršena';

  @override
  String errorMsg(String error) {
    return '❌ Pogreška: $error';
  }

  @override
  String get errorMsgSimple => 'Greška';

  @override
  String get settings => 'Postavke';

  @override
  String get basicSettings => 'Osnovne postavke';

  @override
  String get basicSettingsSubtitle =>
      'Konfigurirajte vrijeme, lokaciju, jezik i obavijesti.';

  @override
  String get advancedSettings => 'Napredne postavke';

  @override
  String get advancedSettingsSubtitle =>
      'Konfigurirajte zvuk, privatnost, upravljanje diskom itd.';

  @override
  String get connection => 'Veza';

  @override
  String get birdNetPiServerAddress => 'Adresa BirdNET-Pi poslužitelja';

  @override
  String get enterIpOrHostname =>
      'Unesite IP adresu ili naziv hosta vašeg Raspberry Pi';

  @override
  String get testInProgress => 'Test u tijeku...';

  @override
  String get saveAndTestConnection => 'Spremi i testiraj vezu';

  @override
  String get deviceInformation => 'Informacije o uređaju';

  @override
  String get loading => 'Učitavanje...';

  @override
  String get notConnected => 'Nema veze';

  @override
  String get configureServerAddress => 'Konfigurirajte adresu poslužitelja';

  @override
  String get latitude => 'Zemljopisna širina';

  @override
  String get longitude => 'Zemljopisna dužina';

  @override
  String get locality => 'Mjesto';

  @override
  String get stateProvince => 'Država/pokrajina';

  @override
  String get countryCode => 'Kôd države';

  @override
  String get information => 'Informacije';

  @override
  String get appVersion => 'Inačica 1.0.0';

  @override
  String get appDescription =>
      'Popratna aplikacija za BirdNET-Pi. Pratite otkrivanje ptica sa svog Raspberry Pi.';

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
  String get errorWhileSaving => 'Pogreška prilikom spremanja';

  @override
  String exceptionDuringSave(String error) {
    return 'Iznimka tijekom spremanja: $error';
  }

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Odaberite model:';

  @override
  String get speciesRangeModel => 'Raspon vrsta model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Prag učestalosti pojavljivanja vrste [0,0005, 0,99]:';

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
  String get appriseConfig => 'Konfiguracija Apprise obavijesti:';

  @override
  String get notificationTitle => 'Naslov obavijesti:';

  @override
  String get notificationBody => 'Sadržaj obavijesti:';

  @override
  String get notifyNewInfrequent =>
      'Obavijestite o svakoj novoj rijetkoj detekciji vrste';

  @override
  String get notifyFirstDetectionOfDay =>
      'Obavijestite svaku vrstu o prvom otkrivanju tog dana';

  @override
  String get notifyEachNewDetection => 'Obavijesti o svakoj novoj detekciji';

  @override
  String get sendWeeklyReport => 'Pošalji tjedno izvješće';

  @override
  String get minTimeBetweenNotifications =>
      'Minimalno vrijeme između obavijesti o istoj vrsti (sek):';

  @override
  String get excludeTheseSpecies => 'Isključite ove vrste (odvojene zarezima):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Obavijest SAMO za ove vrste (odvojene zarezom):';

  @override
  String get imageSource => 'Izvor slike';

  @override
  String get imageProvider => 'Davatelj slike:';

  @override
  String get flickrApiKey => 'Flickr API ključ:';

  @override
  String get flickrFilterEmail =>
      'Pretražujte samo fotografije ovog Flickr korisnika:';

  @override
  String get localization => 'Lokalizacija';

  @override
  String get databaseLanguage => 'Jezik baze podataka:';

  @override
  String get otherInfo => 'Ostale informacije';

  @override
  String get infoSite => 'Info stranica:';

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
  String get privacyRecordings => 'Privatnost snimaka';

  @override
  String get privacyThreshold => 'Prag privatnosti [0, 99]:';

  @override
  String get diskSpaceManagement => 'Upravljanje prostorom na disku';

  @override
  String get whenDiskIsFull => 'Kada je disk pun:';

  @override
  String get purgeCapacity => 'Kapacitet pročišćavanja [% praga]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Maksimalni broj datoteka za čuvanje po vrsti (0 = onemogući):';

  @override
  String get audioSettings => 'Postavke zvuka';

  @override
  String get alsaInputCaptureDevice =>
      'ALSA uređaj za snimanje ulaza (zvučna kartica):';

  @override
  String get numberOfAudioChannels => 'Broj audio kanala za izdvajanje iz:';

  @override
  String get overlap => 'Preklapanje (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Zvučni format:';

  @override
  String get recordingLength => 'Duljina snimanja (sek):';

  @override
  String get extractionLength => 'Duljina izdvajanja (sek):';

  @override
  String get rtspAudioSharing => 'RTSP audio dijeljenje';

  @override
  String get shareLiveAudioStream => 'Podijeliti audio stream uživo?';

  @override
  String get playAudioStreamThroughWebUi =>
      'Reproducirati audio stream putem web sučelja?';

  @override
  String get caddyPassword => 'Caddy lozinka';

  @override
  String get appPassword => 'Lozinka aplikacije:';

  @override
  String get customLogoImage => 'Prilagođeni logotip';

  @override
  String get customImageUrl => 'URL prilagođene slike:';

  @override
  String get customImageTitle => 'Naslov prilagođene slike:';

  @override
  String get birdNetLiteModelSettings => 'Postavke modela BirdNET-Lite';

  @override
  String get confidenceThreshold => 'Prag pouzdanosti [0, 0,99]:';

  @override
  String get sensitivity => 'Osjetljivost [0,5, 1,5]:';

  @override
  String get otherSettings => 'Ostale postavke';

  @override
  String get silenceUpdateIndicator =>
      'Utišajte indikator \"Dostupno ažuriranje\".';

  @override
  String get automaticUpdate => 'Automatsko ažuriranje';

  @override
  String get saveRawSpectrograms => 'Spremi sirove spektrograme';

  @override
  String get loggingLevels => 'Razine zapisivanja';

  @override
  String get birdnetRecordingService => 'BirdNET usluga snimanja:';

  @override
  String get spectrogramViewerService => 'Usluga preglednika spektrograma:';

  @override
  String get liveAudioStreamService => 'Usluga audio prijenosa uživo:';

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
  String get errorSavingList => 'Pogreška prilikom spremanja popisa';

  @override
  String errorLoadingList(String error) {
    return 'Pogreška pri učitavanju popisa:\\n$error';
  }

  @override
  String get retry => 'Pokušaj ponovo';

  @override
  String get searchSpeciesHint => 'Pretražite vrste (npr. Turdus merula_Kos)';

  @override
  String get loadingSpecies => 'Učitavanje vrsta...';

  @override
  String get errorLoadingSpecies => 'Pogreška pri učitavanju vrsta';

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
      'Unesite svoje vjerodajnice za pristup zaštićenim značajkama.';

  @override
  String get username => 'Korisničko ime';

  @override
  String get password => 'Lozinka';

  @override
  String get loginEmptyError => 'Molimo unesite korisničko ime i lozinku';

  @override
  String get loginInvalidError => 'Nevažeće vjerodajnice';

  @override
  String get authenticated => 'Prijavljen';

  @override
  String get signIn => 'Prijava';

  @override
  String get loggedInMessage => 'Trenutno ste autentificirani.';

  @override
  String get logout => 'Odjava';

  @override
  String get login => 'Prijava';

  @override
  String get audioStream => 'Zvučni tok';

  @override
  String get pressPlayToListen => 'Pritisnite reproduciraj za slušanje';

  @override
  String get loginToStart => 'Prijavite se s 🔒 za početak';

  @override
  String get streamRequiresAuth =>
      'Stream zahtijeva autentifikaciju. Dodirnite ikonu 🔒 u gornjem desnom kutu za prijavu.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi zvuk uživo';

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
  String get pressPlaySpectrogram => 'Pritisnite ▶ za pregled spektrograma';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Pritisnite ▶ za početak spektrograma u stvarnom vremenu';

  @override
  String get loginThenPlay => 'Prijavite se pomoću 🔒 i pritisnite ▶';

  @override
  String get currentAnalyzing => 'Trenutna analiza';

  @override
  String get accessRestricted => 'Ograničen pristup';

  @override
  String get loginToAccessSection => 'Prijavite se za pristup ovom odjeljku.';

  @override
  String get iframeNotSupported => 'Iframe su strogo podržani na web verziji.';

  @override
  String get error => 'Pogreška';

  @override
  String get otherUtilities => 'Ostali uslužni programi';

  @override
  String liveSeconds(int seconds) {
    return 'UŽIVO · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spektrogram nije dostupan';

  @override
  String get ebirdCountIdentifier => 'Br';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stacionarni';

  @override
  String get ebirdProtocolIncidental => 'Usputno';

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
  String get tooltipRefreshData => 'Osvježi podatke';

  @override
  String get tooltipPreviousDay => 'Prethodni dan';

  @override
  String get tooltipNextDay => 'Sljedeći dan';

  @override
  String get tooltipPreviousWeek => 'Prethodni tjedan';

  @override
  String get tooltipNextWeek => 'Sljedeći tjedan';

  @override
  String get tooltipDeleteRecording => 'Izbriši snimku';

  @override
  String get tooltipClearSearch => 'Očisti pretragu';

  @override
  String get tooltipCloseSearch => 'Zatvori pretragu';

  @override
  String get tooltipSearch => 'Traži';

  @override
  String get tooltipPlay => 'Reproduciraj zvuk';

  @override
  String get tooltipPickDate => 'Odaberi datum';

  @override
  String get passwordOptionalHint => 'Ostavite prazno ako nije postavljeno';

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
    return '$count obveza iza';
  }

  @override
  String get sysInfoLoadingError =>
      'Nije uspjelo učitavanje informacija o sustavu.';

  @override
  String get enable => 'Omogući';

  @override
  String get disable => 'Onemogući';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Tjedan $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Grupiranje po vrstama';

  @override
  String get groupByTime => 'Grupiraj po vremenu';

  @override
  String get readOnWikipedia => 'Čitaj na Wikipediji';

  @override
  String get loadingWikipedia => 'Učitavanje informacija s Wikipedije...';

  @override
  String get noWikipediaInfo => 'Nema informacija o ovoj vrsti na Wikipediji.';

  @override
  String get searchSpecies => 'Traži vrste...';

  @override
  String get noResultsFound => 'Nema pronađenih rezultata';

  @override
  String get noSpeciesDetected => 'Nema otkrivenih vrsta';

  @override
  String get species => 'Vrste';

  @override
  String get detections => 'Detekcije';

  @override
  String get maxConfidence => 'Najviša pouzdanost';
}
