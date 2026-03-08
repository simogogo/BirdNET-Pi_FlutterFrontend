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
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

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
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Kaaviota ei saatavilla';

  @override
  String get weeklyReport => 'Viikkoraportti';

  @override
  String get newSpecies => 'Uusi laji';

  @override
  String get newFemale => 'New!';

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
    return 'Do you want to delete \"$name\" from $date $time?';
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
  String get noRecordingsAvailable => 'No recordings available.';

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
  String get ebirdExport => 'eBird-vienti';

  @override
  String get generateCsvForEbird => 'Luo CSV eBirdiin';

  @override
  String get downloadAudioZip => 'Lataa ääni (ZIP)';

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
  String get protocol => 'Protokolla';

  @override
  String get stationaryPoint => 'Paikallaan - Kiinteä piste';

  @override
  String get nocturnalFlightCall => 'Yömuuttoääni (NFC)';

  @override
  String get incidental => 'Incidental';

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
  String get totalUniqueSpecies => 'Total Species (Unique)';

  @override
  String get hourlyModeledChecklists => 'Hourly modeled checklists';

  @override
  String get averageConfidence => 'Average Confidence';

  @override
  String get wizardInfoText =>
      'By pressing \"Generate CSV\", the file will be compiled dividing the stations by hour, ready to be uploaded to eBird.';

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
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Päivitä';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Sammuta';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Tyhjennä kaikki tiedot';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Palvelut';

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
  String get spectrogram => 'Spektrogrammi';

  @override
  String get quickActions => 'Pikatoiminnot';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Vahvista';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Komento suoritettu';

  @override
  String errorMsg(String error) {
    return '❌ Virhe: $error';
  }

  @override
  String get species => 'Lajit';

  @override
  String get noSpeciesDetected => 'Ei tunnistettuja lajeja';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Havainnot';

  @override
  String get maxConfidence => 'Suurin luottamus';

  @override
  String get searchSpecies => 'Etsi lajeja...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Asetukset';

  @override
  String get basicSettings => 'Perusasetukset';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Lisäasetukset';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Yhteys';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi palvelimen osoite';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Laitteen tiedot';

  @override
  String get loading => 'Ladataan...';

  @override
  String get notConnected => 'Ei yhteyttä';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Leveysaste';

  @override
  String get longitude => 'Pituusaste';

  @override
  String get locality => 'Paikkakunta';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Maakoodi';

  @override
  String get information => 'Tiedot';

  @override
  String get appVersion => 'Versio 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

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
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Valitse malli:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Sijainti';

  @override
  String get siteName => 'Paikan nimi:';

  @override
  String get latitudeInput => 'Leveysaste:';

  @override
  String get longitudeInput => 'Pituusaste:';

  @override
  String get birdWeatherToken => 'BirdWeather-tunniste:';

  @override
  String get notificationsApprise => 'Ilmoitukset (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Ilmoituksen otsikko:';

  @override
  String get notificationBody => 'Ilmoituksen sisältö:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Ilmoita jokaisesta uudesta havainnosta';

  @override
  String get sendWeeklyReport => 'Lähetä viikkoraportti';

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
  String get localization => 'Lokalisointi';

  @override
  String get databaseLanguage => 'Tietokannan kieli:';

  @override
  String get otherInfo => 'Muut tiedot';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Graafinen teema (Web)';

  @override
  String get colorScheme => 'Värimaailma:';

  @override
  String get none => 'Ei mitään';

  @override
  String get advancedSettingsSavedSuccessfully => 'Lisäasetukset tallennettu';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Levytilan hallinta';

  @override
  String get whenDiskIsFull => 'Kun levy on täynnä:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Ääniasetukset';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Päällekkäisyys (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Ääniformaatti:';

  @override
  String get recordingLength => 'Tallennuksen pituus (sek):';

  @override
  String get extractionLength => 'Analyysin pituus (sek):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Caddy-salasana';

  @override
  String get appPassword => 'Sovelluksen salasana:';

  @override
  String get customLogoImage => 'Oma logo';

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
  String get automaticUpdate => 'Automaattinen päivitys';

  @override
  String get saveRawSpectrograms => 'Tallenna raakaspektrogrammit';

  @override
  String get loggingLevels => 'Lokitasot';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

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
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Yritä uudelleen';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Ladataan lajeja...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

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
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Käyttäjätunnus';

  @override
  String get password => 'Salasana';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Tunnistautunut';

  @override
  String get signIn => 'Kirjaudu sisään';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Kirjaudu ulos';

  @override
  String get login => 'Kirjaudu';

  @override
  String get audioStream => 'Äänivirta';

  @override
  String get pressPlayToListen => 'Paina toista kuunnellaksesi';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

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
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Analysoidaan parhaillaan';

  @override
  String get accessRestricted => 'Pääsy rajoitettu';

  @override
  String get loginToAccessSection =>
      'Kirjaudu sisään päästäksesi tähän osioon.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Virhe';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Muut työkalut';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram not available';

  @override
  String get ebirdCountIdentifier => 'Nro';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationary';

  @override
  String get ebirdProtocolIncidental => 'Incidental';

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
  String get tooltipSearch => 'Etsi';

  @override
  String get tooltipPlay => 'Toista ääni';

  @override
  String get tooltipPickDate => 'Valitse päivämäärä';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

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
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Ota käyttöön';

  @override
  String get disable => 'Poista käytöstä';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Viikko $weekNumber - $year';
  }
}
