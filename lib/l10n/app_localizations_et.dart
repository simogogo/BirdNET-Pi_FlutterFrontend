// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Lindude seire';

  @override
  String get home => 'Avaleht';

  @override
  String get today => 'Täna';

  @override
  String get recordings => 'Salvestised';

  @override
  String get liveStream => 'Otseülekanne';

  @override
  String get liveSpectrogram => 'Otse-spektrogramm';

  @override
  String get speciesManagement => 'LIIGIDHALDUS';

  @override
  String get inclusionList => 'Lubatud liigid';

  @override
  String get exclusionList => 'Välistatud liigid';

  @override
  String get analysisLog => 'Analüüsi logi';

  @override
  String get openWebInterface => 'Ava veebiliides';

  @override
  String get loadingLiveSpectrogram => 'Otse-spektrogrammi laadimine...';

  @override
  String get spectrogramInstruction =>
      'Kui heli ei alga automaatselt, siis tegutsege lehel või kontrollige brauseri õigusi.';

  @override
  String get configureServerFirst =>
      'Konfigureerige esmalt serveri aadress seadetes';

  @override
  String get recentDetections => 'Viimati tuvastatud';

  @override
  String get latestDetection => 'Viimane tuvastus';

  @override
  String get audioFile => 'Helifail';

  @override
  String get playing => 'Mängib';

  @override
  String get noDetectionsToday => 'Täna pole tuvastusi';

  @override
  String get systemListening => 'Süsteem kuulatab...';

  @override
  String get errorOccurred => 'Tekkis viga';

  @override
  String get overview => 'Ülevaade';

  @override
  String get detectionsAllTime => 'Tuvastusi\nkokku';

  @override
  String get detectionsToday => 'Tuvastusi\ntäna';

  @override
  String get detectionsLastHour => 'Tuvastusi\nviimane tund';

  @override
  String get speciesToday => 'Liike\ntäna';

  @override
  String get speciesAllTime => 'Liike\nkokku';

  @override
  String get statsLoadingError => 'Viga statistika laadimisel';

  @override
  String get todaysDetections => 'Tänased tuvastused';

  @override
  String get noDetectionsForSpecies => 'Selle liigi puhul ei tuvastatud';

  @override
  String get removeFilter => 'Eemaldage filter';

  @override
  String detectionsCount(int count) {
    return '$count tuvastust';
  }

  @override
  String get filterDetections => 'Filtreeri tuvastusi';

  @override
  String get minimumConfidenceThreshold => 'Minimaalne usaldusväärsus';

  @override
  String get reset => 'Lähtesta';

  @override
  String get apply => 'Rakenda';

  @override
  String get charts => 'Graafikud';

  @override
  String get daily => 'Päevas';

  @override
  String get weekly => 'Nädalas';

  @override
  String get monthly => 'Iga kuu';

  @override
  String get detectionsBySpecies => 'Avastamised liikide järgi';

  @override
  String get hourlyDistribution => 'Tunnipõhine jaotus';

  @override
  String get noChartAvailable => 'Graafikut pole saadaval';

  @override
  String get weeklyReport => 'Nädalaaruanne';

  @override
  String get monthlyReport => 'Kuu Aruanne';

  @override
  String get newSpecies => 'Uus liik';

  @override
  String get newFemale => 'Uus!';

  @override
  String get identifiedSpecies => 'Tuvastatud liigid';

  @override
  String get byDate => 'Kuupäeva järgi';

  @override
  String get bySpecies => 'Liigi järgi';

  @override
  String exportToEbird(String date) {
    return 'Ekspordi eBirdi ($date)';
  }

  @override
  String get noRecordings => 'Salvestisi pole';

  @override
  String get deleteRecording => 'Kustuta salvestis';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Kas soovite kustutada \"$name\" kuupäevast $date $time?';
  }

  @override
  String get cancel => 'Tühista';

  @override
  String get delete => 'Kustuta';

  @override
  String get noSpeciesFound => 'Liike ei leitud.';

  @override
  String get unknown => 'Tundmatu';

  @override
  String get noRecordingsAvailable => 'Salvestisi pole saadaval.';

  @override
  String get play => 'Mängi';

  @override
  String get changeId => 'Muuda ID-d';

  @override
  String get protect => 'Kaitse';

  @override
  String get unprotect => 'Eemalda kaitse';

  @override
  String get download => 'Laadi alla';

  @override
  String get cannotDownloadFile => 'Faili ei saa alla laadida';

  @override
  String get errorLoading => 'Viga laadimisel';

  @override
  String get autoDetectionsViaBirdNet =>
      'Automaatsed tuvastamised BirdNET-Pi kaudu...';

  @override
  String get downloadStartedSuccessfully => 'Allalaadimine algas edukalt!';

  @override
  String get cannotDownloadCsv => 'CSV-d ei saa alla laadida.';

  @override
  String get zipDownloadInProgress => 'ZIP-faili allalaadimine on pooleli...';

  @override
  String get cannotOpenZipUrl => 'URL-i ei saa ZIP-faili allalaadimiseks avada';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Server ei tagastanud allalaadimise URL-i.';

  @override
  String get unknownError => 'Tundmatu viga';

  @override
  String get serverError => 'Serveri viga';

  @override
  String get ebirdExport => 'eBirdi eksport';

  @override
  String get generateCsvForEbird => 'Loo eBirdi jaoks CSV';

  @override
  String get downloadAudioZip => 'Loo eBirdi heli ZIP-failid';

  @override
  String get close => 'Sulge';

  @override
  String get continueStep => 'Jätka';

  @override
  String get back => 'Tagasi';

  @override
  String get review => 'Ülevaatus';

  @override
  String get configuration => 'Konfiguratsioon';

  @override
  String get summary => 'Kokkuvõte';

  @override
  String get autoRemoveLessThan80 => 'Eemalda automaatselt < 80%';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Loetud liigid: $totalSpecies | Esinemised: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count tuvastamist';
  }

  @override
  String get protocol => 'Protokoll';

  @override
  String get stationaryPoint => 'Statsionaarne - Punkt';

  @override
  String get nocturnalFlightCall => 'Öine rändehäälitsus (NFC)';

  @override
  String get incidental => 'Juhuslik';

  @override
  String get localityName => 'Asukoha nimi *';

  @override
  String get requiredField => 'Kohustuslik väli';

  @override
  String get numberOfObservers => 'Vaatlejate arv';

  @override
  String get additionalComments => 'Lisakommentaarid';

  @override
  String get includeAudioFileNamesInComments =>
      'Lisa helifailide nimed kommentaaridesse';

  @override
  String get readyForExport => 'Valmis ekspordiks';

  @override
  String get totalUniqueSpecies => 'Liigid kokku (unikaalsed)';

  @override
  String get hourlyModeledChecklists =>
      'Tunnis modelleeritud kontrollnimekirjad';

  @override
  String get averageConfidence => 'Keskmine enesekindlus';

  @override
  String get wizardInfoText =>
      'Vajutades \"Generate CSV\", koostatakse fail, jagades jaamad tundide kaupa ja on valmis eBirdi üleslaadimiseks.';

  @override
  String get statistics => 'Statistika';

  @override
  String get systemLogs => 'Süsteemi logid';

  @override
  String get systemTools => 'Süsteemi tööriistad';

  @override
  String get systemControls => 'Süsteemi juhtimine';

  @override
  String get restart => 'Taaskäivita';

  @override
  String get restartRaspberryPi => 'Taaskäivitage Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Kas olete kindel, et soovite süsteemi taaskäivitada?';

  @override
  String get update => 'Uuenda';

  @override
  String get updateBirdNetPi => 'Värskendage BirdNET-Pi uusimale versioonile';

  @override
  String get doYouWantToUpdateBirdNet => 'Kas soovite BirdNET-Pi värskendada?';

  @override
  String get shutdown => 'Lülita välja';

  @override
  String get shutdownRaspberryPi => 'Lülitage Raspberry Pi välja';

  @override
  String get areYouSureYouWantToShutdown =>
      'Kas olete kindel, et soovite süsteemi välja lülitada?';

  @override
  String get clearAllData => 'Kustuta kõik andmed';

  @override
  String get removeAllRecordingsAndDetections =>
      'Eemaldage kõik salvestused ja tuvastamised';

  @override
  String get warningAllDataWillBeDeleted =>
      'HOIATUS: kõik andmed kustutatakse jäädavalt. Kas jätkata?';

  @override
  String get services => 'Teenused';

  @override
  String get liveAudioStream => 'Reaalajas helivoog';

  @override
  String get birdNetAnalysis => 'BirdNETi analüüs';

  @override
  String get birdNetRecording => 'BirdNETi salvestus';

  @override
  String get birdNetLog => 'BirdNETi logi';

  @override
  String get chartViewer => 'Diagrammivaatur';

  @override
  String get spectrogram => 'Spektrogramm';

  @override
  String get quickActions => 'Kiirtoimingud';

  @override
  String get stopServices => 'Peatage teenused';

  @override
  String get restartServices => 'Taaskäivitage teenused';

  @override
  String get confirm => 'Kinnita';

  @override
  String get execution => 'Täitmine:';

  @override
  String get commandExecuted => '✅ Käsk täidetud';

  @override
  String errorMsg(String error) {
    return '❌ Viga: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Viga $error';
  }

  @override
  String get settings => 'Seaded';

  @override
  String get basicSettings => 'Põhiseaded';

  @override
  String get basicSettingsSubtitle =>
      'Seadistage kellaaeg, asukoht, keel ja teatised.';

  @override
  String get advancedSettings => 'Lisaseaded';

  @override
  String get advancedSettingsSubtitle =>
      'Seadistage heli, privaatsus, kettahaldus ja palju muud.';

  @override
  String get connection => 'Ühendus';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi serveri aadress';

  @override
  String get enterIpOrHostname =>
      'Sisestage oma Raspberry Pi IP-aadress või hostinimi';

  @override
  String get testInProgress => 'Test on pooleli...';

  @override
  String get saveAndTestConnection => 'Salvesta ja testi ühendus';

  @override
  String get deviceInformation => 'Seadme info';

  @override
  String get loading => 'Laadimine...';

  @override
  String get notConnected => 'Pole ühendatud';

  @override
  String get configureServerAddress => 'Seadistage serveri aadress';

  @override
  String get latitude => 'Laiuskraad';

  @override
  String get longitude => 'Pikkuskraad';

  @override
  String get locality => 'Asula';

  @override
  String get stateProvince => 'Osariik/provints';

  @override
  String get countryCode => 'Riigikood';

  @override
  String get information => 'Info';

  @override
  String get appVersion => 'Versioon 1.0.0';

  @override
  String get appDescription =>
      'BirdNET-Pi kaasrakendus. Jälgige oma Raspberry Pi linnutuvastusi.';

  @override
  String connectedTo(String url) {
    return '✅ Ühendatud aadressiga $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Aadressiga $url ei saa ühendust';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Viga seadete laadimisel: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully => 'Põhiseaded edukalt salvestatud';

  @override
  String get errorWhileSaving => 'Viga salvestamisel';

  @override
  String exceptionDuringSave(String error) {
    return 'Erand salvestamisel: $error';
  }

  @override
  String get model => 'Mudel';

  @override
  String get selectAModel => 'Vali mudel:';

  @override
  String get speciesRangeModel => 'Liigivahemiku mudel V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Liikide esinemissageduse lävi [0,0005, 0,99]:';

  @override
  String get location => 'Asukoht';

  @override
  String get siteName => 'Koha nimi:';

  @override
  String get latitudeInput => 'Laiuskraad:';

  @override
  String get longitudeInput => 'Pikkuskraad:';

  @override
  String get birdWeatherToken => 'BirdWeatheri märk:';

  @override
  String get notificationsApprise => 'Teavitused (Apprise)';

  @override
  String get appriseConfig => 'Apprise\'i teavituste konfiguratsioon:';

  @override
  String get notificationTitle => 'Teavituse pealkiri:';

  @override
  String get notificationBody => 'Teavituse sisu:';

  @override
  String get notifyNewInfrequent =>
      'Teatage igast uuest harvaesinevast liigituvastusest';

  @override
  String get notifyFirstDetectionOfDay =>
      'Teatage igale liigile päeva esimesest tuvastamisest';

  @override
  String get notifyEachNewDetection => 'Teavita igast uuest tuvastusest';

  @override
  String get sendWeeklyReport => 'Saada nädalaaruanne';

  @override
  String get minTimeBetweenNotifications =>
      'Minimaalne aeg sama liigi teadete vahel (s):';

  @override
  String get excludeTheseSpecies => 'Välista need liigid (komadega eraldatud):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Teavita AINULT nende liikide kohta (komadega eraldatud):';

  @override
  String get imageSource => 'Pildi allikas';

  @override
  String get imageProvider => 'Pildi pakkuja:';

  @override
  String get flickrApiKey => 'Flickr API võti:';

  @override
  String get flickrFilterEmail =>
      'Otsige ainult selle Flickri kasutaja fotosid:';

  @override
  String get localization => 'Lokalisatsioon';

  @override
  String get databaseLanguage => 'Andmebaasi keel:';

  @override
  String get otherInfo => 'Muu info';

  @override
  String get infoSite => 'Teabe sait:';

  @override
  String get themeWeb => 'Graafiline teema (Web)';

  @override
  String get themeLight => 'Valgus';

  @override
  String get themeDark => 'Tume';

  @override
  String get colorScheme => 'Värviskeem:';

  @override
  String get sfThreshHelp =>
      'Seda väärtust kasutab mudel, et piirata võimalike liikide loendit, mida ta proovib tuvastada, võttes arvesse minimaalset esinemissagedust. Läviväärtus 0,03 tähendab, et sellesse loendisse lisamiseks peab liik olema keskmiselt nähtav vähemalt 3% ajalooliselt esitatud eBirdi kontroll-loenditest teie antud lati/pika aasta/käesoleva aastanädala kohta. Seega, mida madalam on lävi, seda haruldasemad liigid see hõlmab.';

  @override
  String get birdWeatherHelp =>
      'BirdWeather on linnuhäälte ilmakaart. Jaamad üle maailma edastavad heli- ja videovooge BirdWeatherile, kus BirdNET analüüsib neid ja võrdleb neid eBird Gridi andmetega. MÄRKUS. Kasutades oma BirdWeatheri märgistust, nõustute jagama oma helimaastikke ja tuvastamisi BirdWeatheriga.';

  @override
  String get flickrHelp =>
      'Seadistage oma Flickri API võti, et võimaldada linnupiltide kuvamist tuvastamise kõrval. \'Otsi fotosid ainult sellelt Flickri kasutajalt\' võimaldab filtreerida konkreetse konto meili järgi.';

  @override
  String get databaseLangHelp => 'Muutke seda ainult algseadistuse ajal!';

  @override
  String get infoSiteHelp =>
      'Valige, kust liikide kohta lisateavet hankida. allaboutbirds.org on vaikeväärtus; ebird.org sisaldab rohkem Euroopa liike.';

  @override
  String get none => 'Puudub';

  @override
  String get advancedSettingsSavedSuccessfully => 'Lisaseaded salvestatud';

  @override
  String get privacyRecordings => 'Salvestiste privaatsus';

  @override
  String get privacyThreshold => 'Privaatsuslävi [0, 99]:';

  @override
  String get diskSpaceManagement => 'Kettaruumi haldus';

  @override
  String get whenDiskIsFull => 'Kui ketas on täis:';

  @override
  String get purgeCapacity => 'Puhastusvõimsus [% lävi]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Maksimaalne säilitatavate failide arv liikide kaupa (0 = keela):';

  @override
  String get audioSettings => 'Heliseaded';

  @override
  String get alsaInputCaptureDevice => 'ALSA sisendhõiveseade (helikaart):';

  @override
  String get numberOfAudioChannels => 'Helikanalite arv, millest eraldada:';

  @override
  String get overlap => 'Kattuvus (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Helivorming:';

  @override
  String get recordingLength => 'Salvestuse pikkus (sek):';

  @override
  String get extractionLength => 'Väljavõtte pikkus (sek):';

  @override
  String get rtspAudioSharing => 'RTSP heli jagamine';

  @override
  String get shareLiveAudioStream => 'Kas jagada otseülekannet?';

  @override
  String get playAudioStreamThroughWebUi =>
      'Kas esitada veebiliidese kaudu helivoogu?';

  @override
  String get caddyPassword => 'Caddy parool';

  @override
  String get appPassword => 'Rakenduse parool:';

  @override
  String get customLogoImage => 'Kohandatud logo';

  @override
  String get customImageUrl => 'Kohandatud pildi URL:';

  @override
  String get customImageTitle => 'Kohandatud pildi pealkiri:';

  @override
  String get birdNetLiteModelSettings => 'BirdNET-Lite mudeli sätted';

  @override
  String get confidenceThreshold => 'Usalduslävi [0, 0,99]:';

  @override
  String get sensitivity => 'Tundlikkus [0,5, 1,5]:';

  @override
  String get otherSettings => 'Muud sätted';

  @override
  String get silenceUpdateIndicator =>
      'Vaigista indikaator \"Värskendus on saadaval\".';

  @override
  String get automaticUpdate => 'Automaatne uuendamine';

  @override
  String get saveRawSpectrograms => 'Salvesta toorspektrogrammid';

  @override
  String get loggingLevels => 'Logimistasemed';

  @override
  String get birdnetRecordingService => 'BirdNETi salvestusteenus:';

  @override
  String get spectrogramViewerService => 'Spektrogrammivaaturi teenus:';

  @override
  String get liveAudioStreamService => 'Heli otseülekande teenus:';

  @override
  String get speciesListsManagement => 'Liigiloendite haldus';

  @override
  String get inclusion => 'Lisamine';

  @override
  String get exclusion => 'Välistamine';

  @override
  String get whitelist => 'Valge nimekiri';

  @override
  String get speciesAlreadyInList => 'Liik on juba nimekirjas';

  @override
  String get listSavedSuccessfully => 'Nimekiri salvestatud';

  @override
  String get errorSavingList => 'Viga loendi salvestamisel';

  @override
  String errorLoadingList(String error) {
    return 'Viga loendi laadimisel:\\n$error';
  }

  @override
  String get retry => 'Proovi uuesti';

  @override
  String get searchSpeciesHint =>
      'Otsi liike (nt Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Liikide laadimine...';

  @override
  String get errorLoadingSpecies => 'Viga liikide laadimisel';

  @override
  String get noSpeciesInThisList => 'Selles nimekirjas pole liike.';

  @override
  String get removeFromList => 'Eemalda nimekirjast';

  @override
  String get saving => 'Salvestamine...';

  @override
  String get save => 'Salvesta';

  @override
  String get loginRequired => 'Selleks tegevuseks on vajalik sisselogimine';

  @override
  String get loginTitle => 'Autentimine';

  @override
  String get loginSubtitle =>
      'Kaitstud funktsioonidele juurdepääsuks sisestage oma mandaadid.';

  @override
  String get username => 'Kasutajanimi';

  @override
  String get password => 'Parool';

  @override
  String get loginEmptyError => 'Palun sisesta kasutajanimi ja parool';

  @override
  String get loginInvalidError => 'Kehtetud mandaadid';

  @override
  String get authenticated => 'Autenditud';

  @override
  String get signIn => 'Logi sisse';

  @override
  String get loggedInMessage => 'Te olete praegu autentitud.';

  @override
  String get logout => 'Logi välja';

  @override
  String get login => 'Logi sisse';

  @override
  String get audioStream => 'Helivoog';

  @override
  String get pressPlayToListen => 'Kuulamiseks vajuta mängi';

  @override
  String get loginToStart => 'Alustamiseks logige sisse 🔒-ga';

  @override
  String get streamRequiresAuth =>
      'Voog nõuab autentimist. Sisselogimiseks puudutage paremas ülanurgas ikooni 🔒.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Heli sisse';

  @override
  String get mute => 'Heli välja';

  @override
  String get resume => 'Jätka';

  @override
  String get pause => 'Paus';

  @override
  String get autoRefresh => 'Automaatne värskendamine';

  @override
  String get pressPlaySpectrogram => 'Spektrogrammi vaatamiseks vajutage ▶';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Reaalajas spektrogrammi käivitamiseks vajutage nuppu ▶';

  @override
  String get loginThenPlay => 'Logige sisse 🔒 ja vajutage ▶';

  @override
  String get currentAnalyzing => 'Hetkel analüüsimisel';

  @override
  String get accessRestricted => 'Juurdepääs piiratud';

  @override
  String get loginToAccessSection => 'Sektsioonile juurdepääsuks logige sisse.';

  @override
  String get iframeNotSupported =>
      'Iframe on veebiversioonis rangelt toetatud.';

  @override
  String get error => 'Viga';

  @override
  String get otherUtilities => 'Muud tööriistad';

  @override
  String liveSeconds(int seconds) {
    return 'OTSE · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spektrogramm pole saadaval';

  @override
  String get ebirdCountIdentifier => 'Nr';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Statsionaarne';

  @override
  String get ebirdProtocolIncidental => 'Juhuslik';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Värskenda';

  @override
  String get tooltipStop => 'Peata';

  @override
  String get tooltipStart => 'Käivita';

  @override
  String get tooltipRestart => 'Taaskäivita';

  @override
  String get systemInfo => 'Süsteemi info';

  @override
  String get fileManager => 'Failihaldur';

  @override
  String get databaseMaintenance => 'Andmebaasi hooldus';

  @override
  String get webTerminal => 'Veebiterminal';

  @override
  String get tooltipOpenMenu => 'Ava menüü';

  @override
  String get tooltipRefreshData => 'Värskenda andmeid';

  @override
  String get tooltipPreviousDay => 'Eelmine päev';

  @override
  String get tooltipNextDay => 'Järgmisel päeval';

  @override
  String get tooltipPreviousWeek => 'Eelmine nädal';

  @override
  String get tooltipNextWeek => 'Järgmisel nädalal';

  @override
  String get tooltipDeleteRecording => 'Salvestise kustutamine';

  @override
  String get tooltipClearSearch => 'Tühjenda otsing';

  @override
  String get tooltipCloseSearch => 'Sule otsing';

  @override
  String get tooltipSearch => 'Otsi';

  @override
  String get tooltipPlay => 'Mängi heli';

  @override
  String get tooltipPickDate => 'Vali kuupäev';

  @override
  String get passwordOptionalHint => 'Kui pole määratud, jätke tühjaks';

  @override
  String get systemStatus => 'Süsteemi olek';

  @override
  String get sysInfoUptime => 'Tööaeg';

  @override
  String get sysInfoDisk => 'Ketas';

  @override
  String get sysInfoMemory => 'Mälu';

  @override
  String get sysInfoCpuTemp => 'CPU temp';

  @override
  String get sysInfoBranch => 'Haru (Branch)';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count toimetab tagapool';
  }

  @override
  String get sysInfoLoadingError => 'Süsteemi teabe laadimine ebaõnnestus.';

  @override
  String get enable => 'Luba';

  @override
  String get disable => 'Keela';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Nädal $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Rühmitamine liikide järgi';

  @override
  String get groupByTime => 'Grupeerimine aja järgi';

  @override
  String get readOnWikipedia => 'Loe Wikipediast';

  @override
  String get loadingWikipedia => 'Teabe laadimine Wikipediast...';

  @override
  String get noWikipediaInfo =>
      'Vikipeediast selle liigi kohta teavet ei leitud.';

  @override
  String get searchSpecies => 'Otsi liike...';

  @override
  String get noResultsFound => 'Tulemusi ei leitud';

  @override
  String get noSpeciesDetected => 'Liike pole tuvastatud';

  @override
  String get species => 'Liigid';

  @override
  String get detections => 'Tuvastamised';

  @override
  String get maxConfidence => 'Maks. usaldusväärsus';

  @override
  String get topSpecies => 'Tippliik';

  @override
  String get fromDate => 'Alates kuupäevast';

  @override
  String get toDate => 'Kuni kuupäevani';

  @override
  String get fromTime => 'Alates kellaajast';

  @override
  String get toTime => 'Kuni kellaajani';

  @override
  String get byPeriod => 'Perioodi järgi';

  @override
  String get selectSpecies => 'Valige Liigid';

  @override
  String get allSpecies => 'Kõik liigid';

  @override
  String get search => 'Otsi';

  @override
  String occurrenceCount(int count) {
    return 'n. $count';
  }

  @override
  String get firstSeen => 'Esmakordselt nähtud';

  @override
  String get lastSeen => 'Viimati nähtud';

  @override
  String get thirtyDaysTrend => '30 päeva trend';

  @override
  String get avgConfidence => 'Keskm. kindlus';

  @override
  String get mySpecies => 'Minu Liigid';

  @override
  String get bestDetection => 'Parim Tuvastus';

  @override
  String get externalInfoLink => 'Väline Info';

  @override
  String get includedListInfo =>
      'Hoiatus! Kui see loend sisaldab MÕNDA liiki, tunneb süsteem AINULT neid liike. Hoidke see loend TÜHI, välja arvatud juhul, kui olete huvitatud AINULT teatud liikide tuvastamisest.';

  @override
  String get excludedListInfo =>
      'Kui soovitud liik on esile tõstetud, klõpsake sellel ja seejärel valikul LISAA, et see välistada.';

  @override
  String get whitelistInfo =>
      'Kui soovitud liik on esile tõstetud, klõpsake sellel ja seejärel valikul LISAA, et see lubatud nimekirja lisada. Seda liiki tuvastatakse isegi siis, kui see on alla seadete määratletud Lävendi (Species Occurrence Frequency Threshold). See pole soovitatav töömeetod: eelistatav on kõigepealt proovida mõlemat esinemismudelit (v1 ja v2.4).';

  @override
  String get overnightRange => 'Öövahemik (ületab keskööd)';

  @override
  String get resetFilters => 'Lähtesta filtrid';

  @override
  String invalidValueRange(num min, num max) {
    return 'Väärtus peab olema vahemikus $min kuni $max';
  }

  @override
  String get speciesListTester => 'Liikide nimekirja testija';

  @override
  String get previewSpeciesList => 'Liikide loendi eelvaade';

  @override
  String get threshold => 'Lävi:';

  @override
  String get sfThreshHelpExtended =>
      'Seda väärtust kasutab mudel, et piirata võimalike liikide loendit, mida ta proovib tuvastada, võttes arvesse minimaalset esinemissagedust. Läviväärtus 0,03 tähendab, et sellesse loendisse lisamiseks peab liik olema keskmiselt nähtav vähemalt 3% ajalooliselt esitatud eBirdi kontroll-loenditest teie antud lati/pika aasta/käesoleva aastanädala kohta. Seega, mida madalam on lävi, seda haruldasemad liigid see hõlmab.\n\n[Põhjalik tehniline kirjeldus siin](https://github.com/kahst/BirdNET-Analyzer/discussions/234)';

  @override
  String get sfThreshTesterHint =>
      'Kui soovite selle läviväärtusega nuputada ja näha, millised liigid nimekirja pääsevad, võite kasutada allolevat tööriista Liikide loendi testija.';

  @override
  String get sfThreshTesterLegacyHint =>
      'Sobiva sildifaili installimiseks klõpsake selle lehe allosas nuppu \"Uuenda sätteid\", seejärel tulge siia tagasi ja saate kasutada liikide loendi testijat.';

  @override
  String get appriseConfigHelp =>
      'Apprise\'i teatisi saab seadistada ja lubada 90+ teavitusteenuse jaoks. Iga teenus peaks olema oma liinil.\n\n**Näited:**\n- `mailto://<kasutaja>:<parool>@gmail.com`\n- `tgram://<bot_token>/<vestluse_id>\n- `discord://<WebhookID>/<WebhookToken>`\n\n[Full Apprise Wiki](https://github.com/caronc/apprise/wiki)';

  @override
  String get notificationVarsHelp =>
      'Pealkirjas ja kehas saate kasutada järgmisi muutujaid.\n\n- `\$sciname`: teaduslik nimi\n- `\$comname`: üldnimi\n- `\$ usalduspct`: usalduse skoor protsentides\n- `\$listenurl`: link tuvastamisele\n- \'\$kuupäev\', \'\$aeg\', \'\$nädal\': kuupäeva/kellaaja teave\n- `\$image`: liigi kujutis\n- `\$reason`: teatamise põhjus';

  @override
  String get excludeSpeciesHelp =>
      'Välistage need liigid teavitustest (komadega eraldatud üldnimetused). Näide: \"Leinatuvi, Ameerika vares\".';

  @override
  String get includeSpeciesHelp =>
      'Teavitage AINULT nende liikide kohta (komadega eraldatud üldnimetused).';

  @override
  String get serverUrl => 'Serveri URL';

  @override
  String get pleaseEnterUrl => 'Sisestage serveri URL';

  @override
  String get serverUnreachable =>
      'Serveriga ei saa ühendust. Kontrollige aadressi ja proovige uuesti.';

  @override
  String get welcomeToBirdNetPi => 'Tere tulemast BirdNET-Pi';

  @override
  String get enterServerUrlDescription =>
      'Alustamiseks sisestage oma BirdNET-Pi serveri URL.';

  @override
  String get connect => 'Ühendage';

  @override
  String get serverUpdatedSuccessfully => 'Serveri värskendamine õnnestus!';

  @override
  String get serverInformation => 'Serveriteave';

  @override
  String get noData => 'Andmed puuduvad';

  @override
  String get trends => 'Trendid';

  @override
  String get selectSpeciesToViewTrends => 'Trendide vaatamiseks valige liik';

  @override
  String speciesDetailsError(String error) {
    return 'Liigi üksikasjade viga: $error';
  }

  @override
  String get fromLabel => 'Alates';

  @override
  String get toLabel => 'Kuni';

  @override
  String get exportMenuLabel => 'Ekspordi';

  @override
  String get exportDataTitle => 'Ekspordi andmed';

  @override
  String get ebirdExportDesc =>
      'Juhendatud voog kontrollnimekirjade esitamiseks.';

  @override
  String get csvExport => 'Ekspordi CSV-sse';

  @override
  String get csvExportDesc => 'Kuupäeva ja liigi järgi filtreeritud algandmed.';

  @override
  String get audioZipExport => 'Igapäevane heli eksport';

  @override
  String get audioZipExportDesc => 'Taotlege kõigi salvestiste zip.';

  @override
  String get zipManager => 'Zip-haldus';

  @override
  String get zipManagerDesc =>
      'Laadige serverist alla või kustutage ZIP-failid.';

  @override
  String get startDate => 'Alguskuupäev';

  @override
  String get endDate => 'Lõppkuupäev';

  @override
  String get filterBySpeciesOptional => 'Filtreeri liikide järgi (valikuline)';

  @override
  String get selectedSpecies => 'Valitud liigid';

  @override
  String get emptyIncludeAllSpecies => '* Kui tühi: hõlmab kõiki liike';

  @override
  String get executeExport => 'EKSPORDI TEOSTAMINE';

  @override
  String get chooseFullDayText =>
      'Valige päev, mille kohta soovite salvestisi eksportida:';

  @override
  String get requestZipGeneration => 'TAOTLE ZIP GENERATSIOON';

  @override
  String get zipGenerationWarning =>
      '* Toiming võib võtta minuteid. ZIP-faili saate alla laadida jaotisest \"Zip-haldus\".';

  @override
  String get zipGenerationStarted =>
      'ZIP-faili genereerimine algas. See on saadaval Zip Manageri jaotises.';

  @override
  String get refreshList => 'Värskenda loendit';

  @override
  String get downloadZip => 'Laadi alla';

  @override
  String get filterSpecies => 'Filtri liigid';

  @override
  String get allSpeciesWillBeExported => 'Kõik liigid eksporditakse.';

  @override
  String get export => 'Ekspordi';

  @override
  String get hourlyDistributionDetections => 'Tunnipõhine jaotus (tuvastused)';

  @override
  String get dayNightWeatherProfile => 'Päeva/öö sääprofiil';

  @override
  String get dailyDetections => 'Igapäevased tuvastused';

  @override
  String get temperatureUnitLabel => 'Temperatuur (°C)';

  @override
  String get windSpeedUnitLabel => 'Tuule kiirus (km/h)';

  @override
  String get densityMapSunInfo => 'Tiheduskaart päikesetõusu ja -loojanguga';

  @override
  String get externalSheet => 'Väline leht';

  @override
  String get totalAllTime => 'Kokku (läbi aegade)';

  @override
  String get detectionsLabel => 'Tuvastused';

  @override
  String get maxConfidenceLabel => 'Maksimaalne usaldus';

  @override
  String get averageConfidenceLabel => 'Keskmine usaldus';

  @override
  String get dayLegend => 'Päev ☀️';

  @override
  String get nightLegend => 'Öö 🌙';

  @override
  String get weatherClear => 'Selge';

  @override
  String get weatherCloudy => 'Pilves';

  @override
  String get weatherFog => 'Udu';

  @override
  String get weatherRain => 'Vihm';

  @override
  String get weatherSnow => 'Lumi';

  @override
  String get weatherThunderstorm => 'Äike';

  @override
  String get loadingAudioLabel => 'Heli laadimine...';

  @override
  String get errorLoadingAudioLabel => 'Heli laadimise viga';

  @override
  String get detectionsTotal => 'Tuvastused';

  @override
  String get ebirdExportError => 'ZIP taotlemise viga.';

  @override
  String get temperature => 'Temperatuur';

  @override
  String get wind => 'Tuul';

  @override
  String get dateLabel => 'Kuupäev';

  @override
  String get notAvailable => 'P/A';
}
