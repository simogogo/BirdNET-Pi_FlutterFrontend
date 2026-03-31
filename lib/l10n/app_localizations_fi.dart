// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Lintujen seuranta';

  @override
  String get home => 'Koti';

  @override
  String get today => 'Tänään';

  @override
  String get recordings => 'Tallenteet';

  @override
  String get liveStream => 'Suoratoisto';

  @override
  String get liveSpectrogram => 'Reaaliaikainen spektrogrammi';

  @override
  String get speciesManagement => 'LAJIEN HALLINTA';

  @override
  String get inclusionList => 'Sallitut lajit';

  @override
  String get exclusionList => 'Estolistat';

  @override
  String get analysisLog => 'Analyysiloki';

  @override
  String get openWebInterface => 'Avaa verkkoliittymä';

  @override
  String get loadingLiveSpectrogram => 'Ladataan spektrogrammia...';

  @override
  String get spectrogramInstruction =>
      'Jos ääni ei ala automaattisesti, klikkaa sivua tai tarkista selaimen luvat.';

  @override
  String get configureServerFirst =>
      'Määritä palvelimen osoite ensin asetuksissa';

  @override
  String get recentDetections => 'Viimeisimmät havainnot';

  @override
  String get latestDetection => 'Viimeisin havainto';

  @override
  String get audioFile => 'Äänitiedosto';

  @override
  String get playing => 'Toistetaan';

  @override
  String get noDetectionsToday => 'Ei havaintoja tänään';

  @override
  String get systemListening => 'Järjestelmä kuuntelee...';

  @override
  String get errorOccurred => 'Tapahtui virhe';

  @override
  String get overview => 'Yleiskatsaus';

  @override
  String get detectionsAllTime => 'Havainnot\nyhteensä';

  @override
  String get detectionsToday => 'Havainnot\ntänään';

  @override
  String get detectionsLastHour => 'Havainnot\nviime tunti';

  @override
  String get speciesToday => 'Lajit\ntänään';

  @override
  String get speciesAllTime => 'Lajit\nyhteensä';

  @override
  String get statsLoadingError => 'Virhe tilastojen latauksessa';

  @override
  String get todaysDetections => 'Tämän päivän havainnot';

  @override
  String get noDetectionsForSpecies => 'Ei havaintoja tälle lajille';

  @override
  String get removeFilter => 'Poista suodatin';

  @override
  String detectionsCount(int count) {
    return '$count havaintoa';
  }

  @override
  String get filterDetections => 'Suodata havaintoja';

  @override
  String get minimumConfidenceThreshold => 'Luottamusvälin alaraja';

  @override
  String get reset => 'Nollaa';

  @override
  String get apply => 'Käytä';

  @override
  String get charts => 'Kaaviot';

  @override
  String get daily => 'Päivittäin';

  @override
  String get weekly => 'Viikoittain';

  @override
  String get monthly => 'Kuukausittain';

  @override
  String get detectionsBySpecies => 'Havainnot lajeittain';

  @override
  String get hourlyDistribution => 'Tuntikohtainen jakelu';

  @override
  String get noChartAvailable => 'Kaaviota ei saatavilla';

  @override
  String get weeklyReport => 'Viikkoraportti';

  @override
  String get monthlyReport => 'Kuukausiraportti';

  @override
  String get newSpecies => 'Uusi laji';

  @override
  String get newFemale => 'Uusi!';

  @override
  String get identifiedSpecies => 'Tunnistetut lajit';

  @override
  String get byDate => 'Päivämäärän mukaan';

  @override
  String get bySpecies => 'Lajin mukaan';

  @override
  String exportToEbird(String date) {
    return 'Vie eBirdiin ($date)';
  }

  @override
  String get noRecordings => 'Ei tallenteita';

  @override
  String get deleteRecording => 'Poista tallenne';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Haluatko poistaa \"$name\" päivämäärästä $date $time?';
  }

  @override
  String get cancel => 'Peruuta';

  @override
  String get delete => 'Poista';

  @override
  String get noSpeciesFound => 'Lajeja ei löytynyt.';

  @override
  String get unknown => 'Tuntematon';

  @override
  String get noRecordingsAvailable => 'Tallenteita ei ole saatavilla.';

  @override
  String get play => 'Toista';

  @override
  String get changeId => 'Muuta tunniste';

  @override
  String get protect => 'Suojaa';

  @override
  String get unprotect => 'Poista suojaus';

  @override
  String get download => 'Lataa';

  @override
  String get cannotDownloadFile => 'Tiedostoa ei voi ladata';

  @override
  String get errorLoading => 'Virhe latauksessa';

  @override
  String get autoDetectionsViaBirdNet =>
      'Automaattiset tunnistukset BirdNET-Pi:n kautta...';

  @override
  String get downloadStartedSuccessfully => 'Lataus aloitettu onnistuneesti!';

  @override
  String get cannotDownloadCsv => 'CSV-tiedoston lataaminen ei onnistu.';

  @override
  String get zipDownloadInProgress => 'ZIP-lataus käynnissä...';

  @override
  String get cannotOpenZipUrl =>
      'URL-osoitetta ei voi avata ZIP-latausta varten';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Palvelin ei palauttanut lataus-URL-osoitetta.';

  @override
  String get unknownError => 'Tuntematon virhe';

  @override
  String get serverError => 'Palvelinvirhe';

  @override
  String get ebirdExport => 'eBird-vienti';

  @override
  String get generateCsvForEbird => 'Luo CSV eBirdiin';

  @override
  String get downloadAudioZip => 'Luo audio ZIP-tiedostot eBirdille';

  @override
  String get close => 'Sulje';

  @override
  String get continueStep => 'Jatka';

  @override
  String get back => 'Takaisin';

  @override
  String get review => 'Tarkista';

  @override
  String get configuration => 'Asetukset';

  @override
  String get summary => 'Yhteenveto';

  @override
  String get autoRemoveLessThan80 => 'Poista automaattisesti < 80 %';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Luettu laji: $totalSpecies | Esiintymät: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count havaitsemista';
  }

  @override
  String get protocol => 'Protokolla';

  @override
  String get stationaryPoint => 'Paikallaan - Kiinteä piste';

  @override
  String get nocturnalFlightCall => 'Yömuuttoääni (NFC)';

  @override
  String get incidental => 'Satunnainen';

  @override
  String get localityName => 'Paikan nimi *';

  @override
  String get requiredField => 'Pakollinen kenttä';

  @override
  String get numberOfObservers => 'Havaitsijoiden määrä';

  @override
  String get additionalComments => 'Lisäkommentit';

  @override
  String get includeAudioFileNamesInComments =>
      'Lisää äänitiedostojen nimet kommentteihin';

  @override
  String get readyForExport => 'Valmis vientiin';

  @override
  String get totalUniqueSpecies => 'Laji yhteensä (ainutlaatuinen)';

  @override
  String get hourlyModeledChecklists =>
      'Tunneittain mallinnetut tarkistuslistat';

  @override
  String get averageConfidence => 'Keskimääräinen luottamus';

  @override
  String get wizardInfoText =>
      'Kun painat \"Luo CSV\", tiedosto kootaan jakamalla asemat tunneilla, ja se on valmis ladattavaksi eBirdiin.';

  @override
  String get statistics => 'Tilastot';

  @override
  String get systemLogs => 'Järjestelmälokit';

  @override
  String get systemTools => 'Järjestelmätyökalut';

  @override
  String get systemControls => 'Järjestelmän ohjaus';

  @override
  String get restart => 'Käynnistä uudelleen';

  @override
  String get restartRaspberryPi => 'Käynnistä Raspberry Pi uudelleen';

  @override
  String get areYouSureYouWantToRestart =>
      'Oletko varma, että haluat käynnistää järjestelmän uudelleen?';

  @override
  String get update => 'Päivitä';

  @override
  String get updateBirdNetPi => 'Päivitä BirdNET-Pi uusimpaan versioon';

  @override
  String get doYouWantToUpdateBirdNet => 'Haluatko päivittää BirdNET-Pi:n?';

  @override
  String get shutdown => 'Sammuta';

  @override
  String get shutdownRaspberryPi => 'Sammuta Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Oletko varma, että haluat sammuttaa järjestelmän?';

  @override
  String get clearAllData => 'Tyhjennä kaikki tiedot';

  @override
  String get removeAllRecordingsAndDetections =>
      'Poista kaikki tallenteet ja havainnot';

  @override
  String get warningAllDataWillBeDeleted =>
      'VAROITUS: Kaikki tiedot poistetaan pysyvästi. Jatkaa?';

  @override
  String get services => 'Palvelut';

  @override
  String get liveAudioStream => 'Suora äänilähetys';

  @override
  String get birdNetAnalysis => 'BirdNET-analyysi';

  @override
  String get birdNetRecording => 'BirdNET-tallennus';

  @override
  String get birdNetLog => 'BirdNET-loki';

  @override
  String get chartViewer => 'Kaavion katseluohjelma';

  @override
  String get spectrogram => 'Spektrogrammi';

  @override
  String get quickActions => 'Pikatoiminnot';

  @override
  String get stopServices => 'Pysäytä palvelut';

  @override
  String get restartServices => 'Käynnistä Palvelut uudelleen';

  @override
  String get confirm => 'Vahvista';

  @override
  String get execution => 'Toteutus:';

  @override
  String get commandExecuted => '✅ Komento suoritettu';

  @override
  String errorMsg(String error) {
    return '❌ Virhe: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Virhe $error';
  }

  @override
  String get settings => 'Asetukset';

  @override
  String get basicSettings => 'Perusasetukset';

  @override
  String get basicSettingsSubtitle =>
      'Määritä aika, sijainti, kieli ja ilmoitukset.';

  @override
  String get advancedSettings => 'Lisäasetukset';

  @override
  String get advancedSettingsSubtitle =>
      'Määritä ääni, yksityisyys, levynhallinta ja paljon muuta.';

  @override
  String get connection => 'Yhteys';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi-palvelimen osoite';

  @override
  String get enterIpOrHostname =>
      'Anna Raspberry Pi:n IP-osoite tai isäntänimi';

  @override
  String get testInProgress => 'Testi käynnissä...';

  @override
  String get saveAndTestConnection => 'Tallenna ja testaa yhteys';

  @override
  String get deviceInformation => 'Laitteen tiedot';

  @override
  String get loading => 'Ladataan...';

  @override
  String get notConnected => 'Ei yhteyttä';

  @override
  String get configureServerAddress => 'Määritä palvelimen osoite';

  @override
  String get latitude => 'Leveysaste';

  @override
  String get longitude => 'Pituusaste';

  @override
  String get locality => 'Paikkakunta';

  @override
  String get stateProvince => 'Osavaltio/maakunta';

  @override
  String get countryCode => 'Maakoodi';

  @override
  String get information => 'Tiedot';

  @override
  String get appVersion => 'Versio 1.0.0';

  @override
  String get appDescription =>
      'BirdNET-Pi:n kumppanisovellus. Tarkkaile Raspberry Pi -laitteesi lintuhavaintoja.';

  @override
  String connectedTo(String url) {
    return '✅ Yhdistetty osoitteeseen $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Ei voitu yhdistää osoitteeseen $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Virhe asetusten latauksessa: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully => 'Perusasetukset tallennettu';

  @override
  String get errorWhileSaving => 'Virhe tallennettaessa';

  @override
  String exceptionDuringSave(String error) {
    return 'Poikkeus tallennuksen aikana: $error';
  }

  @override
  String get model => 'Malli';

  @override
  String get selectAModel => 'Valitse malli:';

  @override
  String get speciesRangeModel => 'Lajivalikoiman mallit V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Lajien esiintymistiheyden kynnys [0,0005, 0,99]:';

  @override
  String get location => 'Sijainti';

  @override
  String get siteName => 'Paikan nimi:';

  @override
  String get latitudeInput => 'Leveysaste:';

  @override
  String get longitudeInput => 'Pituusaste:';

  @override
  String get birdWeatherToken => 'BirdWeather Token:';

  @override
  String get notificationsApprise => 'Ilmoitukset (Apprise)';

  @override
  String get appriseConfig => 'Apprise-ilmoitusten määritykset:';

  @override
  String get notificationTitle => 'Ilmoituksen otsikko:';

  @override
  String get notificationBody => 'Ilmoituksen sisältö:';

  @override
  String get notifyNewInfrequent =>
      'Ilmoita jokaisesta uudesta harvoin havaitusta lajista';

  @override
  String get notifyFirstDetectionOfDay =>
      'Ilmoita jokaiselle lajille päivän ensimmäisestä havaitsemisesta';

  @override
  String get notifyEachNewDetection => 'Ilmoita jokaisesta uudesta havainnosta';

  @override
  String get sendWeeklyReport => 'Lähetä viikkoraportti';

  @override
  String get minTimeBetweenNotifications =>
      'Vähimmäisaika samaa lajia koskevien ilmoitusten välillä (s):';

  @override
  String get excludeTheseSpecies =>
      'Sulje pois nämä lajit (pilkuilla erotettuna):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Ilmoita VAIN näistä lajeista (pilkuilla erotettuna):';

  @override
  String get imageSource => 'Kuvan lähde';

  @override
  String get imageProvider => 'Kuvantarjoaja:';

  @override
  String get flickrApiKey => 'Flickr API avain:';

  @override
  String get flickrFilterEmail => 'Hae vain tämän Flickr-käyttäjän kuvia:';

  @override
  String get localization => 'Lokalisointi';

  @override
  String get databaseLanguage => 'Tietokannan kieli:';

  @override
  String get otherInfo => 'Muut tiedot';

  @override
  String get infoSite => 'Tietosivusto:';

  @override
  String get themeWeb => 'Graafinen teema (Web)';

  @override
  String get themeLight => 'Kevyt';

  @override
  String get themeDark => 'Tumma';

  @override
  String get colorScheme => 'Värimaailma:';

  @override
  String get sfThreshHelp =>
      'Malli käyttää tätä arvoa rajoittamaan luetteloa mahdollisista lajeista, jotka se yrittää havaita, kun otetaan huomioon pienin esiintymistiheys. Kynnysarvo 0,03 tarkoittaa, että lajin sisällyttämiseksi tähän luetteloon sen on oltava keskimäärin vähintään 3 %:ssa historiallisesti toimitetuista eBird-tarkistuslistoista tietylle leveille/pituudelle/ kuluvalla viikolla. Joten mitä matalampi kynnys on, sitä harvinaisempia lajeja se sisältää.';

  @override
  String get birdWeatherHelp =>
      'BirdWeather on sääkartta lintujen äänille. Asemat ympäri maailmaa toimittavat ääni- ja videovirtoja BirdWeatherille, jossa BirdNET analysoi ne ja vertaa niitä eBird Grid -tietoihin. HUOMAA: Käyttämällä BirdWeather-tunnustasi hyväksyt äänimaisemiesi ja havaintojen jakamisen BirdWeatherin kanssa.';

  @override
  String get flickrHelp =>
      'Aseta Flickr API-avaimesi sallimaan lintukuvien näyttäminen havaintojen vieressä. \"Hae kuvia vain tältä Flickr-käyttäjältä\" mahdollistaa suodatuksen tietyn tilin sähköpostin mukaan.';

  @override
  String get databaseLangHelp => 'Muuta tätä vain alkuasennuksen yhteydessä!';

  @override
  String get infoSiteHelp =>
      'Valitse, mistä haet lisätietoa lajista. allaboutbirds.org on oletusarvo; ebird.orgilla on enemmän eurooppalaisia ​​lajeja.';

  @override
  String get none => 'Ei mitään';

  @override
  String get advancedSettingsSavedSuccessfully => 'Lisäasetukset tallennettu';

  @override
  String get privacyRecordings => 'Tallenteiden tietosuoja';

  @override
  String get privacyThreshold => 'Tietosuojakynnys [0, 99]:';

  @override
  String get diskSpaceManagement => 'Levytilan hallinta';

  @override
  String get whenDiskIsFull => 'Kun levy on täynnä:';

  @override
  String get purgeCapacity => 'Tyhjennyskapasiteetti [% kynnys]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Säilytettävät tiedostot lajikohtaisesti (0 = pois käytöstä):';

  @override
  String get audioSettings => 'Ääniasetukset';

  @override
  String get alsaInputCaptureDevice => 'ALSA-tulokaappauslaite (äänikortti):';

  @override
  String get numberOfAudioChannels => 'Poimittavien äänikanavien määrä:';

  @override
  String get overlap => 'Päällekkäisyys (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Ääniformaatti:';

  @override
  String get recordingLength => 'Tallennuksen pituus (sek):';

  @override
  String get extractionLength => 'Analyysin pituus (sek):';

  @override
  String get rtspAudioSharing => 'RTSP-äänen jakaminen';

  @override
  String get shareLiveAudioStream =>
      'RTSP-striimin URL (jätä tyhjäksi poistaaksesi käytöstä)';

  @override
  String get playAudioStreamThroughWebUi =>
      'Toistaako äänivirta verkkokäyttöliittymän kautta?';

  @override
  String get caddyPassword => 'Caddy-salasana';

  @override
  String get appPassword => 'Sovelluksen salasana:';

  @override
  String get customLogoImage => 'Oma logo';

  @override
  String get customImageUrl => 'Muokatun kuvan URL-osoite:';

  @override
  String get customImageTitle => 'Muokatun kuvan otsikko:';

  @override
  String get birdNetLiteModelSettings => 'BirdNET-Lite-malliasetukset';

  @override
  String get confidenceThreshold => 'Luottamuksellinen kynnys [0, 0,99]:';

  @override
  String get sensitivity => 'Herkkyys [0,5, 1,5]:';

  @override
  String get otherSettings => 'Muut asetukset';

  @override
  String get silenceUpdateIndicator =>
      'Hiljennä \"Päivitys saatavilla\" -ilmaisin';

  @override
  String get automaticUpdate => 'Automaattinen päivitys';

  @override
  String get saveRawSpectrograms => 'Tallenna raakaspektrogrammit';

  @override
  String get generateLdfcsStandard => 'LDFCS (Standardi terminen)';

  @override
  String get generateLdfcsIndices => 'LDFCS (Akustiset indeksit)';

  @override
  String get loggingLevels => 'Lokitasot';

  @override
  String get birdnetRecordingService => 'BirdNET-tallennuspalvelu:';

  @override
  String get spectrogramViewerService => 'Spektrogrammien katselupalvelu:';

  @override
  String get liveAudioStreamService => 'Suoratoistopalvelu:';

  @override
  String get speciesListsManagement => 'Lajilistojen hallinta';

  @override
  String get inclusion => 'Sallitut';

  @override
  String get exclusion => 'Estetyt';

  @override
  String get whitelist => 'Valkoinen lista';

  @override
  String get speciesAlreadyInList => 'Laji on jo listalla';

  @override
  String get listSavedSuccessfully => 'Lista tallennettu';

  @override
  String get errorSavingList => 'Virhe tallennettaessa luetteloa';

  @override
  String errorLoadingList(String error) {
    return 'Virhe ladattaessa luetteloa:\\n$error';
  }

  @override
  String get retry => 'Yritä uudelleen';

  @override
  String get searchSpeciesHint =>
      'Hae lajia (esim. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Ladataan lajeja...';

  @override
  String get errorLoadingSpecies => 'Virhe ladattaessa lajeja';

  @override
  String get noSpeciesInThisList => 'Ei lajeja tällä listalla.';

  @override
  String get removeFromList => 'Poista listalta';

  @override
  String get saving => 'Tallennetaan...';

  @override
  String get save => 'Tallenna';

  @override
  String get loginRequired => 'Kirjautuminen vaaditaan';

  @override
  String get loginTitle => 'Tunnistautuminen';

  @override
  String get loginSubtitle =>
      'Anna kirjautumistietosi käyttääksesi suojattuja ominaisuuksia.';

  @override
  String get username => 'Käyttäjätunnus';

  @override
  String get password => 'Salasana';

  @override
  String get loginEmptyError => 'Anna käyttäjätunnus ja salasana';

  @override
  String get loginInvalidError => 'Virheelliset kirjautumistiedot';

  @override
  String get authenticated => 'Tunnistautunut';

  @override
  String get signIn => 'Kirjaudu sisään';

  @override
  String get loggedInMessage => 'Olet tällä hetkellä todennettu.';

  @override
  String get logout => 'Kirjaudu ulos';

  @override
  String get login => 'Kirjaudu';

  @override
  String get audioStream => 'Äänivirta';

  @override
  String get pressPlayToListen => 'Paina toista kuunnellaksesi';

  @override
  String get loginToStart => 'Aloita kirjautumalla sisään tunnuksella 🔒';

  @override
  String get streamRequiresAuth =>
      'Stream vaatii todennuksen. Napauta 🔒-kuvaketta oikeassa yläkulmassa kirjautuaksesi sisään.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Poista mykistys';

  @override
  String get mute => 'Mykistä';

  @override
  String get resume => 'Jatka';

  @override
  String get pause => 'Tauko';

  @override
  String get autoRefresh => 'Automaattinen päivitys';

  @override
  String get pressPlaySpectrogram => 'Paina ▶ nähdäksesi spektrogrammi';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Paina ▶ aloittaaksesi reaaliaikainen spektrogrammi';

  @override
  String get loginThenPlay =>
      'Kirjaudu sisään tunnuksella 🔒 ja paina sitten ▶';

  @override
  String get currentAnalyzing => 'Analysoidaan parhaillaan';

  @override
  String get accessRestricted => 'Pääsy rajoitettu';

  @override
  String get loginToAccessSection =>
      'Kirjaudu sisään päästäksesi tähän osioon.';

  @override
  String get iframeNotSupported =>
      'Iframe-kehykset tuetaan ehdottomasti verkkoversiossa.';

  @override
  String get error => 'Virhe';

  @override
  String get otherUtilities => 'Muut työkalut';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spektrogrammi ei saatavilla';

  @override
  String get ebirdCountIdentifier => 'Nro';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Paikallaan';

  @override
  String get ebirdProtocolIncidental => 'Satunnainen';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Päivitä';

  @override
  String get tooltipStop => 'Pysäytä';

  @override
  String get tooltipStart => 'Käynnistä';

  @override
  String get tooltipRestart => 'Käynnistä uudelleen';

  @override
  String get systemInfo => 'Järjestelmätiedot';

  @override
  String get fileManager => 'Tiedostonhallinta';

  @override
  String get databaseMaintenance => 'Tietokannan ylläpito';

  @override
  String get webTerminal => 'Pääte';

  @override
  String get tooltipOpenMenu => 'Avaa valikko';

  @override
  String get tooltipRefreshData => 'Päivitä tiedot';

  @override
  String get tooltipPreviousDay => 'Edellinen päivä';

  @override
  String get tooltipNextDay => 'Seuraavana päivänä';

  @override
  String get tooltipPreviousWeek => 'Edellinen viikko';

  @override
  String get tooltipNextWeek => 'Ensi viikolla';

  @override
  String get tooltipDeleteRecording => 'Poista tallenne';

  @override
  String get tooltipClearSearch => 'Tyhjennä haku';

  @override
  String get tooltipCloseSearch => 'Sulje haku';

  @override
  String get tooltipSearch => 'Etsi';

  @override
  String get tooltipPlay => 'Toista ääni';

  @override
  String get tooltipPickDate => 'Valitse päivämäärä';

  @override
  String get passwordOptionalHint => 'Jätä tyhjäksi, jos sitä ei ole asetettu';

  @override
  String get systemStatus => 'Järjestelmän tila';

  @override
  String get sysInfoUptime => 'Käyntiaika';

  @override
  String get sysInfoDisk => 'Levy';

  @override
  String get sysInfoMemory => 'Muisti';

  @override
  String get sysInfoCpuTemp => 'CPU lämpö';

  @override
  String get sysInfoBranch => 'Haara';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count sitoutuu takana';
  }

  @override
  String get sysInfoLoadingError =>
      'Järjestelmätietojen lataaminen epäonnistui.';

  @override
  String get enable => 'Ota käyttöön';

  @override
  String get disable => 'Poista käytöstä';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Viikko $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Ryhmittele lajin mukaan';

  @override
  String get groupByTime => 'Ryhmittele ajan mukaan';

  @override
  String get readOnWikipedia => 'Lue Wikipediasta';

  @override
  String get loadingWikipedia => 'Ladataan tietoja Wikipediasta...';

  @override
  String get noWikipediaInfo => 'Wikipediasta ei löydy tietoa tästä lajista.';

  @override
  String get searchSpecies => 'Etsi lajeja...';

  @override
  String get noResultsFound => 'Tuloksia ei löytynyt';

  @override
  String get noSpeciesDetected => 'Ei tunnistettuja lajeja';

  @override
  String get species => 'Lajit';

  @override
  String get detections => 'Havainnot';

  @override
  String get maxConfidence => 'Suurin luottamus';

  @override
  String get topSpecies => 'Yleisimmät lajit';

  @override
  String get fromDate => 'Päivämäärästä';

  @override
  String get toDate => 'Päivämäärään';

  @override
  String get fromTime => 'Kellonajasta';

  @override
  String get toTime => 'Kellonaikaan';

  @override
  String get byPeriod => 'Jakson mukaan';

  @override
  String get selectSpecies => 'Valitse Laji';

  @override
  String get allSpecies => 'Kaikki lajit';

  @override
  String get search => 'Haku';

  @override
  String occurrenceCount(int count) {
    return 'n. $count';
  }

  @override
  String get firstSeen => 'Ensihavainto';

  @override
  String get lastSeen => 'Viimeisin havainto';

  @override
  String get firstSeenPeriod => 'Ensimmäinen nähty (jakso)';

  @override
  String get lastSeenPeriod => 'Viimeksi nähty (jakso)';

  @override
  String get thirtyDaysTrend => '30 päivän trendi';

  @override
  String get avgConfidence => 'Keskim. luottamus';

  @override
  String get mySpecies => 'Omat Lajit';

  @override
  String get bestDetection => 'Paras Havainto';

  @override
  String get externalInfoLink => 'Ulkoinen Tietolähde';

  @override
  String get includedListInfo =>
      'Varoitus! Jos tämä luettelo sisältää MITÄ TAHANSA lajeja, järjestelmä tunnistaa VAIN ne lajit. Pidä tämä luettelo TYHJÄNÄ, ellet ole VAIN kiinnostunut tiettyjen lajien tunnistamisesta.';

  @override
  String get excludedListInfo =>
      'Kun haluttu laji on korostettu, napsauta sitä ja valitse sitten LISÄÄ poistaaksesi sen.';

  @override
  String get whitelistInfo =>
      'Kun haluttu laji on korostettu, napsauta sitä ja valitse sitten LISÄÄ lisätäksesi sen sallittujen luetteloon. Tämä laji havaitaan silloinkin, kun se on asetuksissa määritellyn kynnyksen alle (Species Occurrence Frequency Threshold). Tämä ei ole suositeltava tapa toimia: on parempi kokeilla ensin molempia esiintymismalleja (v1 ja v2.4).';

  @override
  String get overnightRange => 'Yöalue (ylittää keskiyön)';

  @override
  String get resetFilters => 'Nollaa suodattimet';

  @override
  String invalidValueRange(num min, num max) {
    return 'Arvon on oltava välillä $min ja $max';
  }

  @override
  String get speciesListTester => 'Lajilistan testaaja';

  @override
  String get previewSpeciesList => 'Esikatsele lajilistaa';

  @override
  String get threshold => 'Kynnys:';

  @override
  String get sfThreshHelpExtended =>
      'Malli käyttää tätä arvoa rajoittamaan luetteloa mahdollisista lajeista, jotka se yrittää havaita, kun otetaan huomioon pienin esiintymistiheys. Kynnys 0,03 tarkoittaa, että lajin sisällyttämiseksi tähän luetteloon sen on oltava keskimäärin vähintään 3 %:ssa historiallisesti toimitetuista eBird-tarkistuslistoista tietylle leveille/pituudelle/ kuluvalla viikolla. Joten mitä matalampi kynnys on, sitä harvinaisempia lajeja se sisältää.\n\n[Tässä on perusteellinen tekninen kuvaus](https://github.com/kahst/BirdNET-Analyzer/discussions/234)';

  @override
  String get sfThreshTesterHint => 'Jos haluat kokeilla tätä kynnysarvoa...';

  @override
  String get sfThreshTesterLegacyHint =>
      'Napsauta \"Päivitä asetukset\" tämän sivun alalaidasta asentaaksesi sopiva tarratiedosto. Palaa sitten tänne ja voit käyttää lajiluettelon testaajaa.';

  @override
  String get appriseConfigHelp =>
      'Apprise-ilmoitukset voidaan määrittää ja ottaa käyttöön yli 90 ilmoituspalvelulle. Jokaisen palvelun tulee olla omalla linjallaan.\n\n**Esimerkkejä:**\n- `mailto://<käyttäjä>:<salasana>@gmail.com`\n- `tgram://<bot_token>/<chat_id>`\n- `discord://<WebhookID>/<WebhookToken>`\n\n[Full Apprise Wiki](https://github.com/caronc/apprise/wiki)';

  @override
  String get notificationVarsHelp =>
      'Voit käyttää seuraavia muuttujia otsikossasi ja tekstissäsi:\n\n- `\$sciname`: Tieteellinen nimi\n- `\$comname`: yleinen nimi\n- `\$ luottamuspct`: Luottamuspisteet prosentteina\n- `\$listenurl`: Linkki havaintoon\n- `\$date`, `\$time`, `\$week`: Päivämäärä/aikatiedot\n- `\$image`: Lajikuva\n- `\$reason`: Ilmoituksen syy';

  @override
  String get excludeSpeciesHelp => 'Sulje nämä lajit pois ilmoituksista.';

  @override
  String get includeSpeciesHelp =>
      'Ilmoita VAIN näistä lajeista (pilkuilla erotetut nimet).';

  @override
  String get serverUrl => 'Palvelimen URL';

  @override
  String get pleaseEnterUrl => 'Anna palvelimen URL-osoite';

  @override
  String get serverUnreachable => 'Palvelimeen ei saada yhteyttä.';

  @override
  String get welcomeToBirdNetPi => 'Tervetuloa BirdNET-Pi:hin';

  @override
  String get enterServerUrlDescription =>
      'Aloittaaksesi, anna BirdNET-Pi-palvelimen URL-osoite.';

  @override
  String get connect => 'Yhdistä';

  @override
  String get serverUpdatedSuccessfully => 'Palvelin päivitetty onnistuneesti!';

  @override
  String get serverInformation => 'Palvelimen tiedot';

  @override
  String get noData => 'Ei dataa';

  @override
  String get trends => 'Trendit';

  @override
  String get selectSpeciesToViewTrends => 'Valitse laji nähdäksesi trendit';

  @override
  String speciesDetailsError(String error) {
    return 'Lajitietojen virhe: $error';
  }

  @override
  String get fromLabel => 'Alkaen';

  @override
  String get toLabel => 'Saakka';

  @override
  String get exportMenuLabel => 'Viedä';

  @override
  String get exportDataTitle => 'Vie tiedot';

  @override
  String get ebirdExportDesc =>
      'Ohjattu kulku tarkistuslistojen lähettämiseen.';

  @override
  String get csvExport => 'Vie CSV-muotoon';

  @override
  String get csvExportDesc =>
      'Raakadata suodatettu päivämäärän ja lajin mukaan.';

  @override
  String get audioZipExport => 'Päivittäinen äänen vienti';

  @override
  String get audioZipExportDesc => 'Pyydä zip kaikista tallenteista.';

  @override
  String get zipManager => 'Zip-hallinta';

  @override
  String get zipManagerDesc => 'Lataa tai poista zip-tiedostoja palvelimelta.';

  @override
  String get startDate => 'Aloituspäivämäärä';

  @override
  String get endDate => 'Päättymispäivämäärä';

  @override
  String get filterBySpeciesOptional => 'Suodata lajin mukaan (valinnainen)';

  @override
  String get selectedSpecies => 'Valitut lajit';

  @override
  String get emptyIncludeAllSpecies => '* Jos tyhjä: sisältää kaikki lajit';

  @override
  String get executeExport => 'SUORITA VIENTI';

  @override
  String get chooseFullDayText =>
      'Valitse päivä, jolta haluat viedä tallenteet:';

  @override
  String get requestZipGeneration => 'PYYDÄ ZIP GENERATION';

  @override
  String get zipGenerationWarning =>
      '* Toiminto voi kestää minuutteja. Voit ladata zip-tiedoston \"Zip-hallinta\"-osiosta.';

  @override
  String get zipGenerationStarted =>
      'ZIP-generointi aloitettu. Se on saatavilla Zip-hallintaosiossa.';

  @override
  String get refreshList => 'Päivitä lista';

  @override
  String get downloadZip => 'Lataa';

  @override
  String get filterSpecies => 'Suodatinlajit';

  @override
  String get allSpeciesWillBeExported => 'Kaikki lajit viedään vientiin.';

  @override
  String get export => 'Viedä';

  @override
  String get hourlyDistributionDetections =>
      'Tuntikohtainen jakautuma (havainnot)';

  @override
  String get dayNightWeatherProfile => 'Päivä/yö-sääprofiili';

  @override
  String get dailyDetections => 'Päivittäiset havainnot';

  @override
  String get temperatureUnitLabel => 'Lämpötila (°C)';

  @override
  String get windSpeedUnitLabel => 'Tuulen nopeus (km/h)';

  @override
  String get densityMapSunInfo => 'Tiheyskartta auringonnousulla ja -laskulla';

  @override
  String get externalSheet => 'Ulkoinen lehti';

  @override
  String get totalAllTime => 'Yhteensä (kaikki ajat)';

  @override
  String get detectionsLabel => 'Havainnot';

  @override
  String get maxConfidenceLabel => 'Max luottamus';

  @override
  String get averageConfidenceLabel => 'Avg luottamus';

  @override
  String get dayLegend => 'Päivä ☀️';

  @override
  String get nightLegend => 'Yö 🌙';

  @override
  String get weatherClear => 'Selkeä';

  @override
  String get weatherCloudy => 'Pilvinen';

  @override
  String get weatherFog => 'Sumu';

  @override
  String get weatherRain => 'Sade';

  @override
  String get weatherSnow => 'Lumi';

  @override
  String get weatherThunderstorm => 'Ukkonen';

  @override
  String get loadingAudioLabel => 'Ladataan ääntä...';

  @override
  String get errorLoadingAudioLabel => 'Latausvirhe';

  @override
  String get detectionsTotal => 'Havainnot';

  @override
  String get ebirdExportError => 'ZIP-pyyntövirhe.';

  @override
  String get temperature => 'Lämpötila';

  @override
  String get wind => 'Tuuli';

  @override
  String get dateLabel => 'Päivämäärä';

  @override
  String get notAvailable => '-';

  @override
  String get ldfcsStandardTitle => 'Pitkäaikainen spektrogrammi (standardi)';

  @override
  String get ldfcsIndicesTitle =>
      'Pitkäaikainen spektrogrammi (akustiset indeksit)';

  @override
  String get ldfcsDescription => '24 tunnin tallennuksen visualisointi';

  @override
  String get weeklyLdfcsStandard => 'Viikoittainen LDFCS (Standardi)';

  @override
  String get weeklyLdfcsIndices => 'Viikoittainen LDFCS (Akustiset indeksit)';

  @override
  String get monthlyLdfcsStandard => 'Kuukausittainen LDFCS (Standardi)';

  @override
  String get monthlyLdfcsIndices =>
      'Kuukausittainen LDFCS (Akustiset indeksit)';
}
