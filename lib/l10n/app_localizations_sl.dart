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
  String get noDetectionsForSpecies => 'Ni zaznav za to vrsto';

  @override
  String get removeFilter => 'Odstranite filter';

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
  String get monthly => 'Mesečno';

  @override
  String get detectionsBySpecies => 'Zaznave po vrstah';

  @override
  String get hourlyDistribution => 'Urna distribucija';

  @override
  String get noChartAvailable => 'Graf ni na voljo';

  @override
  String get weeklyReport => 'Tedensko poročilo';

  @override
  String get monthlyReport => 'Mesečno Poročilo';

  @override
  String get newSpecies => 'Nova vrsta';

  @override
  String get newFemale => 'Novo!';

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
    return 'Ali želite izbrisati »$name« od $date $time?';
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
  String get noRecordingsAvailable => 'Na voljo ni nobenih posnetkov.';

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
      'Samodejna zaznavanja preko BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully => 'Prenos se je uspešno začel!';

  @override
  String get cannotDownloadCsv => 'CSV ni mogoče prenesti.';

  @override
  String get zipDownloadInProgress => 'Prenos ZIP v teku ...';

  @override
  String get cannotOpenZipUrl => 'URL-ja za prenos ZIP ni mogoče odpreti';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Strežnik ni vrnil URL-ja za prenos.';

  @override
  String get unknownError => 'Neznana napaka';

  @override
  String get serverError => 'Napaka strežnika';

  @override
  String get ebirdExport => 'eBird izvoz';

  @override
  String get generateCsvForEbird => 'Ustvari CSV za eBird';

  @override
  String get downloadAudioZip => 'Ustvari zvočne datoteke ZIP za eBird';

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
  String get autoRemoveLessThan80 => 'Samodejno odstrani < 80 %';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Prebrana vrsta: $totalSpecies | Pojavi: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count zaznav';
  }

  @override
  String get protocol => 'Protokol';

  @override
  String get stationaryPoint => 'Stacionarno - Fiksna točka';

  @override
  String get nocturnalFlightCall => 'Nočni klic med letom (NFC)';

  @override
  String get incidental => 'Naključno';

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
  String get totalUniqueSpecies => 'Skupaj vrste (edinstveno)';

  @override
  String get hourlyModeledChecklists => 'Urno modelirani kontrolni seznami';

  @override
  String get averageConfidence => 'Povprečno zaupanje';

  @override
  String get wizardInfoText =>
      'S pritiskom na \"Generate CSV\" bo datoteka sestavljena z razdelitvijo postaj po urah in pripravljena za nalaganje v eBird.';

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
  String get restartRaspberryPi => 'Znova zaženite Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Ali ste prepričani, da želite znova zagnati sistem?';

  @override
  String get update => 'Posodobi';

  @override
  String get updateBirdNetPi => 'Posodobite BirdNET-Pi na najnovejšo različico';

  @override
  String get doYouWantToUpdateBirdNet => 'Ali želite posodobiti BirdNET-Pi?';

  @override
  String get shutdown => 'Izklop';

  @override
  String get shutdownRaspberryPi => 'Izklopi Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Ali ste prepričani, da želite izklopiti sistem?';

  @override
  String get clearAllData => 'Počisti vse podatke';

  @override
  String get removeAllRecordingsAndDetections =>
      'Odstranite vse posnetke in zaznave';

  @override
  String get warningAllDataWillBeDeleted =>
      'OPOZORILO: Vsi podatki bodo trajno izbrisani. Nadaljevati?';

  @override
  String get services => 'Storitve';

  @override
  String get liveAudioStream => 'Zvočni tok v živo';

  @override
  String get birdNetAnalysis => 'Analiza BirdNET';

  @override
  String get birdNetRecording => 'Snemanje BirdNET';

  @override
  String get birdNetLog => 'Dnevnik BirdNET';

  @override
  String get chartViewer => 'Pregledovalnik grafikonov';

  @override
  String get spectrogram => 'Spektrogram';

  @override
  String get quickActions => 'Hitre akcije';

  @override
  String get stopServices => 'Ustavi storitve';

  @override
  String get restartServices => 'Ponovno zaženite storitve';

  @override
  String get confirm => 'Potrdi';

  @override
  String get execution => 'Izvedba:';

  @override
  String get commandExecuted => '✅ Ukaz izveden';

  @override
  String errorMsg(String error) {
    return '❌ Napaka: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Napaka $error';
  }

  @override
  String get settings => 'Nastavitve';

  @override
  String get basicSettings => 'Osnovne nastavitve';

  @override
  String get basicSettingsSubtitle =>
      'Konfigurirajte čas, lokacijo, jezik in obvestila.';

  @override
  String get advancedSettings => 'Napredne nastavitve';

  @override
  String get advancedSettingsSubtitle =>
      'Konfigurirajte zvok, zasebnost, upravljanje diska in drugo.';

  @override
  String get connection => 'Povezava';

  @override
  String get birdNetPiServerAddress => 'Naslov strežnika BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Vnesite naslov IP ali ime gostitelja vašega Raspberry Pi';

  @override
  String get testInProgress => 'Test v teku ...';

  @override
  String get saveAndTestConnection => 'Shrani in preizkusi povezavo';

  @override
  String get deviceInformation => 'Informacije o napravi';

  @override
  String get loading => 'Nalaganje...';

  @override
  String get notConnected => 'Ni povezave';

  @override
  String get configureServerAddress => 'Konfigurirajte naslov strežnika';

  @override
  String get latitude => 'Zemljepisna širina';

  @override
  String get longitude => 'Zemljepisna dolžina';

  @override
  String get locality => 'Kraj';

  @override
  String get stateProvince => 'Država/provinca';

  @override
  String get countryCode => 'Koda države';

  @override
  String get information => 'Informacije';

  @override
  String get appVersion => 'Različica 1.0.0';

  @override
  String get appDescription =>
      'Spremljevalna aplikacija za BirdNET-Pi. Spremljajte zaznavanje ptic iz vašega Raspberry Pi.';

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
  String get errorWhileSaving => 'Napaka med shranjevanjem';

  @override
  String exceptionDuringSave(String error) {
    return 'Izjema med shranjevanjem: $error';
  }

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Izberite model:';

  @override
  String get speciesRangeModel => 'Razpon vrst model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Prag pogostosti pojavljanja vrste [0,0005, 0,99]:';

  @override
  String get location => 'Lokacija';

  @override
  String get siteName => 'Ime lokacije:';

  @override
  String get latitudeInput => 'Širina:';

  @override
  String get longitudeInput => 'Dolžina:';

  @override
  String get birdWeatherToken => 'Žeton BirdWeather:';

  @override
  String get notificationsApprise => 'Obvestila (Apprise)';

  @override
  String get appriseConfig => 'Konfiguracija obvestil Apprise:';

  @override
  String get notificationTitle => 'Naslov obvestila:';

  @override
  String get notificationBody => 'Vsebina obvestila:';

  @override
  String get notifyNewInfrequent => 'Obvestite vsako novo redko odkritje vrste';

  @override
  String get notifyFirstDetectionOfDay =>
      'Obvesti vsako vrsto o prvem odkritju dneva';

  @override
  String get notifyEachNewDetection => 'Obvesti o vsaki novi zaznavi';

  @override
  String get sendWeeklyReport => 'Pošlji tedensko poročilo';

  @override
  String get minTimeBetweenNotifications =>
      'Minimalni čas med obvestili iste vrste (sek):';

  @override
  String get excludeTheseSpecies => 'Izključite te vrste (ločeno z vejico):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Obvesti SAMO za te vrste (ločeno z vejico):';

  @override
  String get imageSource => 'Vir slike';

  @override
  String get imageProvider => 'Ponudnik slik:';

  @override
  String get flickrApiKey => 'Ključ Flickr API:';

  @override
  String get flickrFilterEmail => 'Išči le fotografije tega uporabnika Flickr:';

  @override
  String get localization => 'Lokalizacija';

  @override
  String get databaseLanguage => 'Jezik baze podatkov:';

  @override
  String get otherInfo => 'Druge informacije';

  @override
  String get infoSite => 'Info stran:';

  @override
  String get themeWeb => 'Grafična tema (Web)';

  @override
  String get themeLight => 'Svetloba';

  @override
  String get themeDark => 'Temno';

  @override
  String get colorScheme => 'Barvna shema:';

  @override
  String get sfThreshHelp =>
      'Model uporablja to vrednost za omejitev seznama možnih vrst, ki jih bo poskušal odkriti glede na najmanjšo pogostost pojavljanja. Prag 0,03 pomeni, da mora biti vrsta, da je vključena na ta seznam, v povprečju vidna na vsaj 3 % zgodovinsko predloženih kontrolnih seznamov eBird za vašo zemljepisno širino/dolžino/trenutni teden v letu. Torej, nižji kot je prag, redkejše vrste bo vključeval.';

  @override
  String get birdWeatherHelp =>
      'BirdWeather je vremenski zemljevid za zvoke ptic. Postaje po vsem svetu zagotavljajo avdio in video tokove BirdWeatherju, kjer jih BirdNET nato analizira in primerja s podatki eBird Grid. OPOMBA: Z uporabo žetona BirdWeather se strinjate z deljenjem vaših zvočnih pokrajin in zaznav z BirdWeather.';

  @override
  String get flickrHelp =>
      'Nastavite ključ Flickr API, da omogočite prikaz slik ptic poleg zaznav. »Išči samo fotografije tega uporabnika Flickr« omogoča filtriranje po e-pošti določenega računa.';

  @override
  String get databaseLangHelp => 'To spremenite samo ob začetni nastavitvi!';

  @override
  String get infoSiteHelp =>
      'Izberite, od kod želite pridobiti dodatne informacije o vrsti. allaboutbirds.org je privzeta; ebird.org ima več evropskih vrst.';

  @override
  String get none => 'Brez';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Napredne nastavitve shranjene';

  @override
  String get privacyRecordings => 'Zasebnost posnetkov';

  @override
  String get privacyThreshold => 'Prag zasebnosti [0, 99]:';

  @override
  String get diskSpaceManagement => 'Upravljanje prostora na disku';

  @override
  String get whenDiskIsFull => 'Podpora polnjenju diska:';

  @override
  String get purgeCapacity => 'Kapaciteta čiščenja [% prag]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Največje dovoljeno število datotek za posamezno vrsto (0 = onemogočeno):';

  @override
  String get audioSettings => 'Nastavitve zvoka';

  @override
  String get alsaInputCaptureDevice =>
      'Naprava za zajem vnosa ALSA (zvočna kartica):';

  @override
  String get numberOfAudioChannels =>
      'Število zvočnih kanalov za ekstrahiranje iz:';

  @override
  String get overlap => 'Prekrivanje (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Zvočni format:';

  @override
  String get recordingLength => 'Dolžina snemanja (sek):';

  @override
  String get extractionLength => 'Dolžina izseka (sek):';

  @override
  String get rtspAudioSharing => 'Skupna raba zvoka RTSP';

  @override
  String get shareLiveAudioStream =>
      'URL toka RTSP (pustite prazno za onemogočanje)';

  @override
  String get playAudioStreamThroughWebUi =>
      'Predvajati zvočni tok prek spletnega uporabniškega vmesnika?';

  @override
  String get caddyPassword => 'Caddy geslo';

  @override
  String get appPassword => 'Geslo aplikacije:';

  @override
  String get customLogoImage => 'Logotip po meri';

  @override
  String get customImageUrl => 'URL slike po meri:';

  @override
  String get customImageTitle => 'Naslov slike po meri:';

  @override
  String get birdNetLiteModelSettings => 'Nastavitve modela BirdNET-Lite';

  @override
  String get confidenceThreshold => 'Prag zaupanja [0, 0,99]:';

  @override
  String get sensitivity => 'Občutljivost [0,5, 1,5]:';

  @override
  String get otherSettings => 'Druge nastavitve';

  @override
  String get silenceUpdateIndicator =>
      'Utišaj indikator »Posodobitev je na voljo«.';

  @override
  String get automaticUpdate => 'Samodejna posodobitev';

  @override
  String get saveRawSpectrograms => 'Shrani surove spektrograme';

  @override
  String get generateLdfcsStandard => 'LDFCS (Standardni termični)';

  @override
  String get generateLdfcsIndices => 'LDFCS (Akustični indeksi)';

  @override
  String get loggingLevels => 'Ravni beleženja';

  @override
  String get birdnetRecordingService => 'Storitev snemanja BirdNET:';

  @override
  String get spectrogramViewerService =>
      'Storitev pregledovalnika spektrogramov:';

  @override
  String get liveAudioStreamService => 'Storitev prenosa zvoka v živo:';

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
  String get errorSavingList => 'Napaka pri shranjevanju seznama';

  @override
  String errorLoadingList(String error) {
    return 'Napaka pri nalaganju seznama:\\n$error';
  }

  @override
  String get retry => 'Poskusi znova';

  @override
  String get searchSpeciesHint =>
      'Iskanje vrst (npr. Turdus merula_Navadni kos)';

  @override
  String get loadingSpecies => 'Nalaganje vrst...';

  @override
  String get errorLoadingSpecies => 'Napaka pri nalaganju vrste';

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
      'Vnesite svoje poverilnice za dostop do zaščitenih funkcij.';

  @override
  String get username => 'Uporabniško ime';

  @override
  String get password => 'Geslo';

  @override
  String get loginEmptyError => 'Prosimo vnesite uporabniško ime in geslo';

  @override
  String get loginInvalidError => 'Neveljavne poverilnice';

  @override
  String get authenticated => 'Prijavljen';

  @override
  String get signIn => 'Prijava';

  @override
  String get loggedInMessage => 'Trenutno ste potrjeni.';

  @override
  String get logout => 'Odjava';

  @override
  String get login => 'Prijava';

  @override
  String get audioStream => 'Zvočni tok';

  @override
  String get pressPlayToListen => 'Pritisnite predvajaj za poslušanje';

  @override
  String get loginToStart => 'Za začetek se prijavite z 🔒';

  @override
  String get streamRequiresAuth =>
      'Tok zahteva preverjanje pristnosti. Za prijavo tapnite ikono 🔒 v zgornjem desnem kotu.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi zvok v živo';

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
  String get pressPlaySpectrogram => 'Pritisnite ▶ za ogled spektrograma';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Pritisnite ▶ za začetek spektrograma v realnem času';

  @override
  String get loginThenPlay => 'Prijavite se z 🔒 in pritisnite ▶';

  @override
  String get currentAnalyzing => 'Trenutno analiziranje';

  @override
  String get accessRestricted => 'Omejen dostop';

  @override
  String get loginToAccessSection => 'Prijavite se za dostop do tega razdelka.';

  @override
  String get iframeNotSupported =>
      'Iframe so strogo podprti v spletni različici.';

  @override
  String get error => 'Napaka';

  @override
  String get otherUtilities => 'Drugi pripomočki';

  @override
  String liveSeconds(int seconds) {
    return 'V ŽIVO · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spektrogram ni na voljo';

  @override
  String get ebirdCountIdentifier => 'Št';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stacionarni';

  @override
  String get ebirdProtocolIncidental => 'Naključno';

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
  String get tooltipRefreshData => 'Osveži podatke';

  @override
  String get tooltipPreviousDay => 'Prejšnji dan';

  @override
  String get tooltipNextDay => 'Naslednji dan';

  @override
  String get tooltipPreviousWeek => 'Prejšnji teden';

  @override
  String get tooltipNextWeek => 'Naslednji teden';

  @override
  String get tooltipDeleteRecording => 'Izbriši posnetek';

  @override
  String get tooltipClearSearch => 'Počisti iskanje';

  @override
  String get tooltipCloseSearch => 'Zapri iskanje';

  @override
  String get tooltipSearch => 'Išči';

  @override
  String get tooltipPlay => 'Predvajaj zvok';

  @override
  String get tooltipPickDate => 'Izberi datum';

  @override
  String get passwordOptionalHint => 'Če ni nastavljeno, pustite prazno';

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
    return '$count obveznosti zadaj';
  }

  @override
  String get sysInfoLoadingError =>
      'Sistemskih informacij ni bilo mogoče naložiti.';

  @override
  String get enable => 'Omogoči';

  @override
  String get disable => 'Onemogoči';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Teden $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Skupina po vrsti';

  @override
  String get groupByTime => 'Združi po času';

  @override
  String get readOnWikipedia => 'Preberite na Wikipediji';

  @override
  String get loadingWikipedia => 'Nalaganje informacij iz Wikipedije ...';

  @override
  String get noWikipediaInfo => 'Na Wikipediji ni podatkov za to vrsto.';

  @override
  String get searchSpecies => 'Išči vrste...';

  @override
  String get noResultsFound => 'Ni rezultatov';

  @override
  String get noSpeciesDetected => 'Ni zaznanih vrst';

  @override
  String get species => 'Vrste';

  @override
  String get detections => 'Zaznave';

  @override
  String get maxConfidence => 'Najv. zaupanje';

  @override
  String get topSpecies => 'Vrhunske vrste';

  @override
  String get fromDate => 'Od datuma';

  @override
  String get toDate => 'Do datuma';

  @override
  String get fromTime => 'Od ure';

  @override
  String get toTime => 'Do ure';

  @override
  String get byPeriod => 'Po obdobju';

  @override
  String get selectSpecies => 'Izberite Vrsta';

  @override
  String get allSpecies => 'Vse vrste';

  @override
  String get search => 'Iskanje';

  @override
  String occurrenceCount(int count) {
    return 'n. $count';
  }

  @override
  String get firstSeen => 'Prvič videno';

  @override
  String get lastSeen => 'Zadnjič videno';

  @override
  String get firstSeenPeriod => 'Prvič viden (obdobje)';

  @override
  String get lastSeenPeriod => 'Zadnjič viden (obdobje)';

  @override
  String get thirtyDaysTrend => '30-dnevni trend';

  @override
  String get avgConfidence => 'Povpr. zaupanje';

  @override
  String get mySpecies => 'Moje Vrste';

  @override
  String get bestDetection => 'Najboljša Zaznava';

  @override
  String get externalInfoLink => 'Zunanje Informacije';

  @override
  String get includedListInfo =>
      'Opozorilo! Če ta seznam vsebuje KATEROKOLI vrsto, bo sistem prepoznal SAMO te vrste. Obdržite ta seznam PRAZEN, razen če vas SAMO zanima odkrivanje določenih vrst.';

  @override
  String get excludedListInfo =>
      'Ko je želena vrsta označena, kliknite nanjo in nato kliknite DODAJ, da jo izključite.';

  @override
  String get whitelistInfo =>
      'Ko je želena vrsta označena, kliknite nanjo in nato kliknite DODAJ, da jo dodate na beli seznam. Vrsta se bo zaznala, tudi če bo pod pragom pogostosti vrst (Species Occurrence Frequency Threshold) v nastavitvah. To ni priporočljiv način dela: najprej poskusite oba načina modelov (v1 in v2.4).';

  @override
  String get overnightRange => 'Nočni razpon (sega čez polnoč)';

  @override
  String get resetFilters => 'Ponastavi filtre';

  @override
  String invalidValueRange(num min, num max) {
    return 'Vrednost mora biti med $min in $max';
  }

  @override
  String get speciesListTester => 'Tester seznama vrst';

  @override
  String get previewSpeciesList => 'Predogled seznama vrst';

  @override
  String get threshold => 'Prag:';

  @override
  String get sfThreshHelpExtended =>
      'Model uporablja to vrednost za omejitev seznama možnih vrst, ki jih bo poskušal odkriti glede na najmanjšo pogostost pojavljanja. Prag 0,03 pomeni, da mora biti vrsta, da je vključena na ta seznam, v povprečju vidna na vsaj 3 % zgodovinsko predloženih kontrolnih seznamov eBird za vašo zemljepisno širino/dolžino/trenutni teden v letu. Torej, nižji kot je prag, redkejše vrste bo vključeval.\n\n[Poglobljen tehnični zapis tukaj](https://github.com/kahst/BirdNET-Analyzer/discussions/234)';

  @override
  String get sfThreshTesterHint =>
      'Če se želite poigrati s to vrednostjo praga in videti, katere vrste so prišle na seznam, lahko uporabite spodnje orodje za preizkuševanje seznama vrst.';

  @override
  String get sfThreshTesterLegacyHint =>
      'Prosimo, kliknite »Posodobi nastavitve« na samem dnu te strani, da namestite ustrezno datoteko z oznako, nato pa se vrnite sem in lahko boste uporabili Tester seznama vrst.';

  @override
  String get appriseConfigHelp =>
      'Obvestila Apprise je mogoče nastaviti in omogočiti za več kot 90 storitev obveščanja. Vsaka storitev naj bo na svoji liniji.\n\n**Primeri:**\n- `mailto://<uporabnik>:<geslo>@gmail.com`\n- `tgram://<bot_token>/<chat_id>`\n- `discord://<WebhookID>/<WebhookToken>`\n\n[Celoten Wiki Apprise](https://github.com/caronc/apprise/wiki)';

  @override
  String get notificationVarsHelp =>
      'V naslovu in telesu lahko uporabite naslednje spremenljivke:\n\n- `\$sciname`: Znanstveno ime\n- `\$comname`: splošno ime\n- `\$confidencepct`: ocena zaupanja kot odstotek\n- `\$listenurl`: povezava do zaznave\n- `\$date`, `\$time`, `\$week`: informacije o datumu/času\n- `\$image`: slika vrste\n- `\$reason`: Razlog za obvestilo';

  @override
  String get excludeSpeciesHelp =>
      'Izključite te vrste iz obvestil (splošna imena, ločena z vejicami). Primer: `Žalostni golob, ameriška vrana`.';

  @override
  String get includeSpeciesHelp =>
      'Obvesti SAMO za te vrste (splošna imena, ločena z vejicami).';

  @override
  String get serverUrl => 'URL strežnika';

  @override
  String get pleaseEnterUrl => 'Vnesite URL strežnika';

  @override
  String get serverUnreachable =>
      'Strežnik nedosegljiv. Preverite naslov in poskusite znova.';

  @override
  String get welcomeToBirdNetPi => 'Dobrodošli v BirdNET-Pi';

  @override
  String get enterServerUrlDescription =>
      'Za začetek vnesite URL vašega strežnika BirdNET-Pi.';

  @override
  String get connect => 'Povežite se';

  @override
  String get serverUpdatedSuccessfully =>
      'Strežnik je bil uspešno posodobljen!';

  @override
  String get serverInformation => 'Informacije o strežniku';

  @override
  String get noData => 'Ni podatkov';

  @override
  String get trends => 'Trendi';

  @override
  String get selectSpeciesToViewTrends => 'Za ogled trendov izberite vrsto';

  @override
  String speciesDetailsError(String error) {
    return 'Napaka v podrobnostih vrste: $error';
  }

  @override
  String get fromLabel => 'Od';

  @override
  String get toLabel => 'Do';

  @override
  String get exportMenuLabel => 'Izvozi';

  @override
  String get exportDataTitle => 'Izvoz podatkov';

  @override
  String get ebirdExportDesc => 'Voden potek oddaje kontrolnih seznamov.';

  @override
  String get csvExport => 'Izvozi v CSV';

  @override
  String get csvExportDesc =>
      'Neobdelani podatki, filtrirani glede na datum in vrsto.';

  @override
  String get audioZipExport => 'Dnevni izvoz zvoka';

  @override
  String get audioZipExportDesc => 'Zahtevajte zip vseh posnetkov.';

  @override
  String get zipManager => 'Zip upravljanje';

  @override
  String get zipManagerDesc =>
      'Prenesite ali izbrišite datoteke zip na strežniku.';

  @override
  String get startDate => 'Začetni datum';

  @override
  String get endDate => 'Končni datum';

  @override
  String get filterBySpeciesOptional => 'Filtriraj po vrsti (neobvezno)';

  @override
  String get selectedSpecies => 'Izbrane vrste';

  @override
  String get emptyIncludeAllSpecies => '* Če je prazno: vključuje vse vrste';

  @override
  String get executeExport => 'IZVEDI IZVOZ';

  @override
  String get chooseFullDayText =>
      'Izberite dan, za katerega želite izvoziti posnetke:';

  @override
  String get requestZipGeneration => 'ZAHTEVAJTE GENERACIJO ZIP';

  @override
  String get zipGenerationWarning =>
      '* Operacija lahko traja nekaj minut. Zip lahko prenesete iz razdelka »Upravljanje zip«.';

  @override
  String get zipGenerationStarted =>
      'Ustvarjanje ZIP se je začelo. Na voljo bo v zavihku Upravitelj ZIP.';

  @override
  String get refreshList => 'Osveži seznam';

  @override
  String get downloadZip => 'Prenos';

  @override
  String get filterSpecies => 'Vrste filtrov';

  @override
  String get allSpeciesWillBeExported => 'Vse vrste bodo izvožene.';

  @override
  String get export => 'Izvozi';

  @override
  String get hourlyDistributionDetections => 'Urna razporeditev (zaznave)';

  @override
  String get dayNightWeatherProfile => 'Profil dan/noč (vreme)';

  @override
  String get dailyDetections => 'Dnevne zaznave';

  @override
  String get temperatureUnitLabel => 'Temperatura (°C)';

  @override
  String get windSpeedUnitLabel => 'Hitrost vetra (km/h)';

  @override
  String get densityMapSunInfo =>
      'Zemljevid gostote s sončnim vzhodom in zahodom';

  @override
  String get externalSheet => 'Zunanji list';

  @override
  String get totalAllTime => 'Skupaj (vedno)';

  @override
  String get detectionsLabel => 'Zaznave';

  @override
  String get maxConfidenceLabel => 'Najvišje zaupanje';

  @override
  String get averageConfidenceLabel => 'Povprečno zaupanje';

  @override
  String get dayLegend => 'Dan ☀️';

  @override
  String get nightLegend => 'Noč 🌙';

  @override
  String get weatherClear => 'Jasno';

  @override
  String get weatherCloudy => 'Oblačno';

  @override
  String get weatherFog => 'Megla';

  @override
  String get weatherRain => 'Dež';

  @override
  String get weatherSnow => 'Sneg';

  @override
  String get weatherThunderstorm => 'Nevihta';

  @override
  String get loadingAudioLabel => 'Nalaganje zvoka...';

  @override
  String get errorLoadingAudioLabel => 'Napaka pri nalaganju zvoka';

  @override
  String get detectionsTotal => 'Zaznave';

  @override
  String get ebirdExportError => 'Napaka pri zahtevi za ZIP.';

  @override
  String get temperature => 'Temperatura';

  @override
  String get wind => 'Veter';

  @override
  String get dateLabel => 'Datum';

  @override
  String get notAvailable => 'ni na voljo';

  @override
  String get ldfcsStandardTitle => 'Dolgotrajni spektrogram (standardni)';

  @override
  String get ldfcsIndicesTitle => 'Dolgotrajni spektrogram (akustični indeksi)';

  @override
  String get ldfcsDescription => 'Vizualizacija 24-urnega posnetka';

  @override
  String get weeklyLdfcsStandard => 'Tedenski LDFCS (Standardni)';

  @override
  String get weeklyLdfcsIndices => 'Tedenski LDFCS (Akustični indeksi)';

  @override
  String get monthlyLdfcsStandard => 'Mesečni LDFCS (Standardni)';

  @override
  String get monthlyLdfcsIndices => 'Mesečni LDFCS (Akustični indeksi)';

  @override
  String get dailyInsightsTitle => 'Dnevni vpogledi';

  @override
  String get weeklyInsightsTitle => 'Tedenski vpogledi';

  @override
  String get monthlyInsightsTitle => 'Mesečni vpogledi';

  @override
  String get hourlyActivityTitle => 'Urna aktivnosti';

  @override
  String get speciesDiversityTitle => 'Raznolikost vrst';

  @override
  String get others => 'Ostalo';

  @override
  String get detShort => 'DET';

  @override
  String get backupRestore => 'Varnostno kopiranje in obnovitev';

  @override
  String get backupRestoreSubtitle =>
      'Upravljajte varnostne kopije baze podatkov in posnetkov.';

  @override
  String get backup => 'Varnostna kopija';

  @override
  String get restore => 'Obnovitev';

  @override
  String get createBackup => 'Create New Backup';

  @override
  String get generatingBackup => 'Generating backup...';

  @override
  String get availableBackups => 'Available Backups';

  @override
  String get noBackupsAvailable => 'No backups available';

  @override
  String get backupCompleted => 'Completed';

  @override
  String get downloadBackup => 'Prenesi varnostno kopijo';

  @override
  String get restoreBackup => 'Obnovi varnostno kopijo';

  @override
  String backupSize(String size) {
    return 'Ocenjena velikost varnostne kopije: $size';
  }

  @override
  String get backupWarning =>
      'Opozorilo: Generiranje varnostne kopije lahko traja nekaj minut.';

  @override
  String get restoreWarning =>
      'Opozorilo: Obnovitev bo prepisala trenutne podatke in ponovno zagnala storitve.';

  @override
  String get selectBackupFile => 'Izberite datoteko varnostne kopije (.tar)';

  @override
  String get restoreStarted =>
      'Obnovitev se je začela. Sistem se bo kmalu znova zagnal.';

  @override
  String get errorRestoring => 'Napaka pri obnovitvi.';
}
