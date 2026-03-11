// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Fågelövervakning';

  @override
  String get home => 'Hem';

  @override
  String get today => 'Idag';

  @override
  String get recordings => 'Inspelningar';

  @override
  String get liveStream => 'Liveström';

  @override
  String get liveSpectrogram => 'Livespektrogram';

  @override
  String get speciesManagement => 'ARTFÖRVALTNING';

  @override
  String get inclusionList => 'Inkluderingslista';

  @override
  String get exclusionList => 'Exkluderingslista';

  @override
  String get analysisLog => 'Analyslogg';

  @override
  String get openWebInterface => 'Öppna webbgränssnitt';

  @override
  String get loadingLiveSpectrogram => 'Laddar livespektrogram...';

  @override
  String get spectrogramInstruction =>
      'Om ljudet inte startar automatiskt, vänligen interagera med sidan eller kontrollera dina webbläsarbehörigheter.';

  @override
  String get configureServerFirst =>
      'Konfigurera först serveradressen i Inställningar';

  @override
  String get recentDetections => 'Senaste detekteringar';

  @override
  String get latestDetection => 'Senaste detektering';

  @override
  String get audioFile => 'Ljudfil';

  @override
  String get playing => 'Spelar';

  @override
  String get noDetectionsToday => 'Inga detekteringar idag';

  @override
  String get systemListening => 'Systemet lyssnar...';

  @override
  String get errorOccurred => 'Ett fel uppstod';

  @override
  String get overview => 'Översikt';

  @override
  String get detectionsAllTime => 'Detekteringar\ntotalt';

  @override
  String get detectionsToday => 'Detekteringar\nidag';

  @override
  String get detectionsLastHour => 'Detekteringar\nsenaste timmen';

  @override
  String get speciesToday => 'Arter\nidag';

  @override
  String get speciesAllTime => 'Arter\ntotalt';

  @override
  String get statsLoadingError => 'Fel vid laddning av statistik';

  @override
  String get todaysDetections => 'Dagens detekteringar';

  @override
  String get noDetectionsForSpecies => 'Inga upptäckter för denna art';

  @override
  String get removeFilter => 'Ta bort filtret';

  @override
  String detectionsCount(int count) {
    return '$count detekteringar';
  }

  @override
  String get filterDetections => 'Filtrera detekteringar';

  @override
  String get minimumConfidenceThreshold => 'Minsta konfidensgräns';

  @override
  String get reset => 'Återställ';

  @override
  String get apply => 'Verkställ';

  @override
  String get charts => 'Diagram';

  @override
  String get daily => 'Dagligen';

  @override
  String get weekly => 'Veckovis';

  @override
  String get monthly => 'Monthly';

  @override
  String get detectionsBySpecies => 'Detektioner efter art';

  @override
  String get hourlyDistribution => 'Timfördelning';

  @override
  String get noChartAvailable => 'Inget diagram tillgängligt';

  @override
  String get weeklyReport => 'Veckorapport';

  @override
  String get monthlyReport => 'Monthly Report';

  @override
  String get newSpecies => 'Ny art';

  @override
  String get newFemale => 'Ny!';

  @override
  String get identifiedSpecies => 'Identifierade arter';

  @override
  String get byDate => 'Efter datum';

  @override
  String get bySpecies => 'Efter art';

  @override
  String exportToEbird(String date) {
    return 'Exportera till eBird ($date)';
  }

  @override
  String get noRecordings => 'Inga inspelningar';

  @override
  String get deleteRecording => 'Ta bort inspelning';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Vill du ta bort \"$name\" från $date $time?';
  }

  @override
  String get cancel => 'Avbryt';

  @override
  String get delete => 'Ta bort';

  @override
  String get noSpeciesFound => 'Inga arter hittades.';

  @override
  String get unknown => 'Okänd';

  @override
  String get noRecordingsAvailable => 'Inga inspelningar tillgängliga.';

  @override
  String get play => 'Spela';

  @override
  String get changeId => 'Ändra ID';

  @override
  String get protect => 'Skydda';

  @override
  String get unprotect => 'Ta bort skydd';

  @override
  String get download => 'Ladda ner';

  @override
  String get cannotDownloadFile => 'Kan inte ladda ner fil';

  @override
  String get errorLoading => 'Fel vid laddning';

  @override
  String get autoDetectionsViaBirdNet =>
      'Automatisk upptäckt via BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully =>
      'Nedladdningen startade framgångsrikt!';

  @override
  String get cannotDownloadCsv => 'Det går inte att ladda ner CSV.';

  @override
  String get zipDownloadInProgress => 'ZIP-nedladdning pågår...';

  @override
  String get cannotOpenZipUrl =>
      'Det går inte att öppna URL för ZIP-nedladdning';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Servern returnerade inte nedladdningsadressen.';

  @override
  String get unknownError => 'Okänt fel';

  @override
  String get serverError => 'Serverfel';

  @override
  String get ebirdExport => 'eBird-export';

  @override
  String get generateCsvForEbird => 'Generera CSV för eBird';

  @override
  String get downloadAudioZip => 'Ladda ner ljud (ZIP)';

  @override
  String get close => 'Stäng';

  @override
  String get continueStep => 'Fortsätt';

  @override
  String get back => 'Bakåt';

  @override
  String get review => 'Granska';

  @override
  String get configuration => 'Konfiguration';

  @override
  String get summary => 'Sammanfattning';

  @override
  String get autoRemoveLessThan80 => 'Ta bort automatiskt < 80 %';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Art läst: $totalSpecies | Förekomster: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count detektioner';
  }

  @override
  String get protocol => 'Protokoll';

  @override
  String get stationaryPoint => 'Stationär - Fast punkt';

  @override
  String get nocturnalFlightCall => 'Nattligt flyktläte (NFC)';

  @override
  String get incidental => 'Tillfällig';

  @override
  String get localityName => 'Platsnamn *';

  @override
  String get requiredField => 'Obligatoriskt fält';

  @override
  String get numberOfObservers => 'Antal observatörer';

  @override
  String get additionalComments => 'Ytterligare kommentarer';

  @override
  String get includeAudioFileNamesInComments =>
      'Inkludera ljudfilnamn i kommentarer';

  @override
  String get readyForExport => 'Klar för export';

  @override
  String get totalUniqueSpecies => 'Totalt antal arter (unik)';

  @override
  String get hourlyModeledChecklists => 'Tidsmodellerade checklistor';

  @override
  String get averageConfidence => 'Genomsnittligt förtroende';

  @override
  String get wizardInfoText =>
      'Genom att trycka på \"Generera CSV\" kommer filen att sammanställas och dela stationerna efter timmar, redo att laddas upp till eBird.';

  @override
  String get statistics => 'Statistik';

  @override
  String get systemLogs => 'Systemloggar';

  @override
  String get systemTools => 'Systemverktyg';

  @override
  String get systemControls => 'Systemkontroller';

  @override
  String get restart => 'Starta om';

  @override
  String get restartRaspberryPi => 'Starta om Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Är du säker på att du vill starta om systemet?';

  @override
  String get update => 'Uppdatera';

  @override
  String get updateBirdNetPi =>
      'Uppdatera BirdNET-Pi till den senaste versionen';

  @override
  String get doYouWantToUpdateBirdNet => 'Vill du uppdatera BirdNET-Pi?';

  @override
  String get shutdown => 'Stäng av';

  @override
  String get shutdownRaspberryPi => 'Stäng av Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Är du säker på att du vill stänga av systemet?';

  @override
  String get clearAllData => 'Rensa alla data';

  @override
  String get removeAllRecordingsAndDetections =>
      'Ta bort alla inspelningar och upptäckter';

  @override
  String get warningAllDataWillBeDeleted =>
      'VARNING: All data kommer att raderas permanent. Fortsätta?';

  @override
  String get services => 'Tjänster';

  @override
  String get liveAudioStream => 'Live ljudström';

  @override
  String get birdNetAnalysis => 'BirdNET-analys';

  @override
  String get birdNetRecording => 'BirdNET-inspelning';

  @override
  String get birdNetLog => 'BirdNET-logg';

  @override
  String get chartViewer => 'Chart Viewer';

  @override
  String get spectrogram => 'Spektrogram';

  @override
  String get quickActions => 'Snabbåtgärder';

  @override
  String get stopServices => 'Stoppa tjänster';

  @override
  String get restartServices => 'Starta om tjänster';

  @override
  String get confirm => 'Bekräfta';

  @override
  String get execution => 'Utförande:';

  @override
  String get commandExecuted => '✅ Kommando utfört';

  @override
  String errorMsg(String error) {
    return '❌ Fel: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Fel';
  }

  @override
  String get settings => 'Inställningar';

  @override
  String get basicSettings => 'Grundinställningar';

  @override
  String get basicSettingsSubtitle =>
      'Konfigurera tid, plats, språk och aviseringar.';

  @override
  String get advancedSettings => 'Avancerade inställningar';

  @override
  String get advancedSettingsSubtitle =>
      'Konfigurera ljud, sekretess, diskhantering och mer.';

  @override
  String get connection => 'Anslutning';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi serveradress';

  @override
  String get enterIpOrHostname =>
      'Ange IP-adressen eller värdnamnet för din Raspberry Pi';

  @override
  String get testInProgress => 'Test pågår...';

  @override
  String get saveAndTestConnection => 'Spara och testa anslutningen';

  @override
  String get deviceInformation => 'Enhetsinformation';

  @override
  String get loading => 'Laddar...';

  @override
  String get notConnected => 'Ej ansluten';

  @override
  String get configureServerAddress => 'Konfigurera serveradressen';

  @override
  String get latitude => 'Latitud';

  @override
  String get longitude => 'Longitud';

  @override
  String get locality => 'Ort';

  @override
  String get stateProvince => 'stat/provins';

  @override
  String get countryCode => 'Landskod';

  @override
  String get information => 'Information';

  @override
  String get appVersion => 'Version 1.0.0';

  @override
  String get appDescription =>
      'Companion app för BirdNET-Pi. Övervaka fågeldetekteringar från din Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Ansluten till $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Kan inte ansluta till $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Fel vid laddning av inställningar: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully => 'Grundinställningar sparade';

  @override
  String get errorWhileSaving => 'Fel när du sparade';

  @override
  String exceptionDuringSave(String error) {
    return 'Undantag vid lagring: $error';
  }

  @override
  String get model => 'Modell';

  @override
  String get selectAModel => 'Välj en modell:';

  @override
  String get speciesRangeModel => 'Artserie modell V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Arters förekomstfrekvens Tröskelvärde [0,0005, 0,99]:';

  @override
  String get location => 'Plats';

  @override
  String get siteName => 'Platsnamn:';

  @override
  String get latitudeInput => 'Latitud:';

  @override
  String get longitudeInput => 'Longitud:';

  @override
  String get birdWeatherToken => 'BirdWeather-token:';

  @override
  String get notificationsApprise => 'Aviseringar (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Konfiguration:';

  @override
  String get notificationTitle => 'Aviseringstext:';

  @override
  String get notificationBody => 'Aviseringsrutan:';

  @override
  String get notifyNewInfrequent => 'Meddela varje ny sällsynt art upptäckt';

  @override
  String get notifyFirstDetectionOfDay =>
      'Meddela varje art första upptäckt för dagen';

  @override
  String get notifyEachNewDetection => 'Avisera varje ny detektering';

  @override
  String get sendWeeklyReport => 'Skicka veckorapport';

  @override
  String get minTimeBetweenNotifications =>
      'Minsta tid mellan anmälningar av samma art (sek):';

  @override
  String get excludeTheseSpecies => 'Uteslut dessa arter (kommaseparerade):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Meddela ENDAST för dessa arter (kommaseparerad):';

  @override
  String get imageSource => 'Bildkälla';

  @override
  String get imageProvider => 'Bildleverantör:';

  @override
  String get flickrApiKey => 'Flickr API-nyckel:';

  @override
  String get flickrFilterEmail =>
      'Sök bara efter foton från denna Flickr-användare:';

  @override
  String get localization => 'Lokalisering';

  @override
  String get databaseLanguage => 'Databasspråk:';

  @override
  String get otherInfo => 'Övrig info';

  @override
  String get infoSite => 'Infosajt:';

  @override
  String get themeWeb => 'Grafiskt tema (Webb)';

  @override
  String get colorScheme => 'Färgschema:';

  @override
  String get none => 'Ingen';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Avancerade inställningar sparade';

  @override
  String get privacyRecordings => 'Sekretess för inspelningar';

  @override
  String get privacyThreshold => 'Sekretessgräns [0, 99]:';

  @override
  String get diskSpaceManagement => 'Hantering av diskutrymme';

  @override
  String get whenDiskIsFull => 'När disken är full:';

  @override
  String get purgeCapacity => 'Rensningskapacitet [% tröskel]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max filer att behålla per art (0 = inaktivera):';

  @override
  String get audioSettings => 'Ljudinställningar';

  @override
  String get alsaInputCaptureDevice => 'ALSA-inmatningsenhet (ljudkort):';

  @override
  String get numberOfAudioChannels => 'Antal ljudkanaler att extrahera från:';

  @override
  String get overlap => 'Överlappning (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Ljudformat:';

  @override
  String get recordingLength => 'Inspelningstid (sek):';

  @override
  String get extractionLength => 'Extraktionstid (sek):';

  @override
  String get rtspAudioSharing => 'RTSP-ljuddelning';

  @override
  String get shareLiveAudioStream => 'Vill du dela liveljudström?';

  @override
  String get playAudioStreamThroughWebUi =>
      'Spela ljudström via webbgränssnittet?';

  @override
  String get caddyPassword => 'Caddy-lösenord';

  @override
  String get appPassword => 'App-lösenord:';

  @override
  String get customLogoImage => 'Anpassad logotyp';

  @override
  String get customImageUrl => 'Anpassad bildadress:';

  @override
  String get customImageTitle => 'Anpassad bildtitel:';

  @override
  String get birdNetLiteModelSettings => 'BirdNET-Lite modellinställningar';

  @override
  String get confidenceThreshold => 'Konfidensgräns [0, 0,99]:';

  @override
  String get sensitivity => 'Känslighet [0,5, 1,5]:';

  @override
  String get otherSettings => 'Andra inställningar';

  @override
  String get silenceUpdateIndicator =>
      'Tysta \"Uppdatering tillgänglig\"-indikator';

  @override
  String get automaticUpdate => 'Automatisk uppdatering';

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
  String get speciesListsManagement => 'Hantering av artlistor';

  @override
  String get inclusion => 'Inkludering';

  @override
  String get exclusion => 'Exkludering';

  @override
  String get whitelist => 'Vitlista';

  @override
  String get speciesAlreadyInList => 'Arten finns redan i listan';

  @override
  String get listSavedSuccessfully => 'Listan sparad';

  @override
  String get errorSavingList => 'Fel när listan skulle sparas';

  @override
  String errorLoadingList(String error) {
    return 'Det gick inte att läsa in listan:\\n$error';
  }

  @override
  String get retry => 'Försök igen';

  @override
  String get searchSpeciesHint =>
      'Sök efter arter (t.ex. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Laddar arter...';

  @override
  String get errorLoadingSpecies => 'Det gick inte att läsa in arter';

  @override
  String get noSpeciesInThisList => 'Inga arter i listan.';

  @override
  String get removeFromList => 'Ta bort från listan';

  @override
  String get saving => 'Sparar...';

  @override
  String get save => 'Spara';

  @override
  String get loginRequired => 'Inloggning krävs';

  @override
  String get loginTitle => 'Autentisering';

  @override
  String get loginSubtitle =>
      'Ange dina referenser för att komma åt skyddade funktioner.';

  @override
  String get username => 'Användarnamn';

  @override
  String get password => 'Lösenord';

  @override
  String get loginEmptyError => 'Ange användarnamn och lösenord';

  @override
  String get loginInvalidError => 'Ogiltiga användaruppgifter';

  @override
  String get authenticated => 'Autentiserad';

  @override
  String get signIn => 'Logga in';

  @override
  String get loggedInMessage => 'Du är för närvarande autentiserad.';

  @override
  String get logout => 'Logga ut';

  @override
  String get login => 'Logga in';

  @override
  String get audioStream => 'Ljudström';

  @override
  String get pressPlayToListen => 'Tryck på spela för att lyssna';

  @override
  String get loginToStart => 'Logga in med 🔒 för att börja';

  @override
  String get streamRequiresAuth =>
      'Streamen kräver autentisering. Tryck på ikonen 🔒 uppe till höger för att logga in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Slå på ljudet';

  @override
  String get mute => 'Ljud av';

  @override
  String get resume => 'Återuppta';

  @override
  String get pause => 'Pausa';

  @override
  String get autoRefresh => 'Automatisk uppdatering';

  @override
  String get pressPlaySpectrogram => 'Tryck på ▶ för att visa spektrogrammet';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Tryck på ▶ för att starta realtidsspektrogrammet';

  @override
  String get loginThenPlay => 'Logga in med 🔒 tryck sedan på ▶';

  @override
  String get currentAnalyzing => 'Analyserar nu';

  @override
  String get accessRestricted => 'Åtkomst begränsad';

  @override
  String get loginToAccessSection => 'Logga in för att komma åt denna sektion.';

  @override
  String get iframeNotSupported => 'Iframes stöds strikt på webbversionen.';

  @override
  String get error => 'Fel';

  @override
  String get otherUtilities => 'Övriga verktyg';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spektrogram ej tillgängligt';

  @override
  String get ebirdCountIdentifier => 'Nr';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationär';

  @override
  String get ebirdProtocolIncidental => 'Tillfällig';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Uppdatera';

  @override
  String get tooltipStop => 'Stoppa';

  @override
  String get tooltipStart => 'Starta';

  @override
  String get tooltipRestart => 'Starta om';

  @override
  String get systemInfo => 'Systeminfo';

  @override
  String get fileManager => 'Filhanterare';

  @override
  String get databaseMaintenance => 'Databasunderhåll';

  @override
  String get webTerminal => 'Webbterminal';

  @override
  String get tooltipOpenMenu => 'Öppna meny';

  @override
  String get tooltipRefreshData => 'Uppdatera data';

  @override
  String get tooltipPreviousDay => 'Föregående dag';

  @override
  String get tooltipNextDay => 'Nästa dag';

  @override
  String get tooltipPreviousWeek => 'Föregående vecka';

  @override
  String get tooltipNextWeek => 'Nästa vecka';

  @override
  String get tooltipDeleteRecording => 'Radera inspelning';

  @override
  String get tooltipClearSearch => 'Rensa sökning';

  @override
  String get tooltipCloseSearch => 'Stäng sökning';

  @override
  String get tooltipSearch => 'Sök';

  @override
  String get tooltipPlay => 'Spela ljud';

  @override
  String get tooltipPickDate => 'Välj datum';

  @override
  String get passwordOptionalHint => 'Lämna tomt om inte inställt';

  @override
  String get systemStatus => 'Systemstatus';

  @override
  String get sysInfoUptime => 'Drifttid';

  @override
  String get sysInfoDisk => 'Disk';

  @override
  String get sysInfoMemory => 'Minne';

  @override
  String get sysInfoCpuTemp => 'CPU-temp';

  @override
  String get sysInfoBranch => 'Gren';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count begår bakom';
  }

  @override
  String get sysInfoLoadingError =>
      'Det gick inte att läsa in systeminformation.';

  @override
  String get enable => 'Aktivera';

  @override
  String get disable => 'Inaktivera';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Vecka $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Grupp efter art';

  @override
  String get groupByTime => 'Gruppera efter tid';

  @override
  String get readOnWikipedia => 'Läs på Wikipedia';

  @override
  String get loadingWikipedia => 'Laddar information från Wikipedia...';

  @override
  String get noWikipediaInfo =>
      'Ingen information hittades på Wikipedia för denna art.';

  @override
  String get searchSpecies => 'Sök arter...';

  @override
  String get noResultsFound => 'Inga resultat hittades';

  @override
  String get noSpeciesDetected => 'Inga arter detekterade';

  @override
  String get species => 'Arter';

  @override
  String get detections => 'Detekteringar';

  @override
  String get maxConfidence => 'Högsta konfidens';

  @override
  String get topSpecies => 'Topp arter';

  @override
  String get fromDate => 'Från datum';

  @override
  String get toDate => 'Till datum';

  @override
  String get fromTime => 'Från tid';

  @override
  String get toTime => 'Till tid';

  @override
  String get byPeriod => 'Efter period';

  @override
  String get selectSpecies => 'Select Species';

  @override
  String get allSpecies => 'All Species';

  @override
  String get search => 'Search';

  @override
  String occurrenceCount(int count) {
    return 'n. $count';
  }

  @override
  String get firstSeen => 'Först sedd';

  @override
  String get lastSeen => 'Senast sedd';

  @override
  String get thirtyDaysTrend => '30 dagars trend';

  @override
  String get avgConfidence => 'Genomsn. konfidens';

  @override
  String get mySpecies => 'Mina Arter';

  @override
  String get bestDetection => 'Bästa Detektion';

  @override
  String get externalInfoLink => 'Extern Info';

  @override
  String get includedListInfo =>
      'Warning! If this list contains ANY species, the system will ONLY recognize those species. Keep this list EMPTY unless you are ONLY interested in detecting specific species.';

  @override
  String get excludedListInfo =>
      'Once the desired species has been highlighted, click it and then click ADD to have it excluded.';

  @override
  String get whitelistInfo =>
      'Once the desired species has been highlighted, click it and then click ADD to have it whitelisted. This species will be detected even if below the Species Occurrence Frequency Threshold defined in the settings. This is not a recommended way of working : it is preferable to first try first both Species Occurrence models (v1 and v2.4).';
}
