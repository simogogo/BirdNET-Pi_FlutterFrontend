// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Fugleovervåking';

  @override
  String get home => 'Hjem';

  @override
  String get today => 'I dag';

  @override
  String get recordings => 'Opptak';

  @override
  String get liveStream => 'Livestrøm';

  @override
  String get liveSpectrogram => 'Livespektrogram';

  @override
  String get speciesManagement => 'ARTSFORVALTNING';

  @override
  String get inclusionList => 'Inkluderingsliste';

  @override
  String get exclusionList => 'Ekskluderingsliste';

  @override
  String get analysisLog => 'Analyselogg';

  @override
  String get openWebInterface => 'Åpne webgrensesnitt';

  @override
  String get loadingLiveSpectrogram => 'Laster livespektrogram...';

  @override
  String get spectrogramInstruction =>
      'Hvis lyden ikke starter automatisk, vennligst samhandle med siden eller sjekk nettleserinnstillingene.';

  @override
  String get configureServerFirst =>
      'Konfigurer serveradressen i Innstillinger først';

  @override
  String get recentDetections => 'Siste observasjoner';

  @override
  String get latestDetection => 'Siste observasjon';

  @override
  String get audioFile => 'Lydfil';

  @override
  String get playing => 'Spiller';

  @override
  String get noDetectionsToday => 'Ingen observasjoner i dag';

  @override
  String get systemListening => 'Systemet lytter...';

  @override
  String get errorOccurred => 'En feil oppstod';

  @override
  String get overview => 'Oversikt';

  @override
  String get detectionsAllTime => 'Observasjoner\ntotalt';

  @override
  String get detectionsToday => 'Observasjoner\ni dag';

  @override
  String get detectionsLastHour => 'Observasjoner\nsiste time';

  @override
  String get speciesToday => 'Arter\ni dag';

  @override
  String get speciesAllTime => 'Arter\ntotalt';

  @override
  String get statsLoadingError => 'Feil ved lasting av statistikk';

  @override
  String get todaysDetections => 'Dagens observasjoner';

  @override
  String get noDetectionsForSpecies => 'Ingen påvisninger for denne arten';

  @override
  String get removeFilter => 'Fjern filteret';

  @override
  String detectionsCount(int count) {
    return '$count observasjoner';
  }

  @override
  String get filterDetections => 'Filtrer observasjoner';

  @override
  String get minimumConfidenceThreshold => 'Minimum konfidensnivå';

  @override
  String get reset => 'Nullstill';

  @override
  String get apply => 'Bruk';

  @override
  String get charts => 'Diagrammer';

  @override
  String get daily => 'Daglig';

  @override
  String get weekly => 'Ukentlig';

  @override
  String get monthly => 'Månedlig';

  @override
  String get detectionsBySpecies => 'Påvisninger etter art';

  @override
  String get hourlyDistribution => 'Timefordeling';

  @override
  String get noChartAvailable => 'Ingen diagrammer tilgjengelig';

  @override
  String get weeklyReport => 'Ukerapport';

  @override
  String get monthlyReport => 'Månedlig Rapport';

  @override
  String get newSpecies => 'Ny art';

  @override
  String get newFemale => 'Ny!';

  @override
  String get identifiedSpecies => 'Identifiserte arter';

  @override
  String get byDate => 'Etter dato';

  @override
  String get bySpecies => 'Etter art';

  @override
  String exportToEbird(String date) {
    return 'Eksporter til eBird ($date)';
  }

  @override
  String get noRecordings => 'Ingen opptak';

  @override
  String get deleteRecording => 'Slett opptak';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Vil du slette «$name» fra $date $time?';
  }

  @override
  String get cancel => 'Avbryt';

  @override
  String get delete => 'Slett';

  @override
  String get noSpeciesFound => 'Ingen arter funnet.';

  @override
  String get unknown => 'Ukjent';

  @override
  String get noRecordingsAvailable => 'Ingen opptak tilgjengelig.';

  @override
  String get play => 'Spill av';

  @override
  String get changeId => 'Endre ID';

  @override
  String get protect => 'Beskytt';

  @override
  String get unprotect => 'Fjern beskyttelse';

  @override
  String get download => 'Last ned';

  @override
  String get cannotDownloadFile => 'Kan ikke laste ned fil';

  @override
  String get errorLoading => 'Feil ved lasting';

  @override
  String get autoDetectionsViaBirdNet =>
      'Automatisk deteksjon via BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully => 'Nedlastingen startet vellykket!';

  @override
  String get cannotDownloadCsv => 'Kan ikke laste ned CSV.';

  @override
  String get zipDownloadInProgress => 'ZIP-nedlasting pågår...';

  @override
  String get cannotOpenZipUrl => 'Kan ikke åpne URL for ZIP-nedlasting';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Serveren returnerte ikke nedlastings-URLen.';

  @override
  String get unknownError => 'Ukjent feil';

  @override
  String get serverError => 'Serverfeil';

  @override
  String get ebirdExport => 'eBird-eksport';

  @override
  String get generateCsvForEbird => 'Generer CSV for eBird';

  @override
  String get downloadAudioZip => 'Last ned lyd (ZIP)';

  @override
  String get close => 'Lukk';

  @override
  String get continueStep => 'Fortsett';

  @override
  String get back => 'Tilbake';

  @override
  String get review => 'Vurder';

  @override
  String get configuration => 'Konfigurasjon';

  @override
  String get summary => 'Sammendrag';

  @override
  String get autoRemoveLessThan80 => 'Fjern automatisk < 80 %';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Arter lest: $totalSpecies | Forekomster: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count deteksjoner';
  }

  @override
  String get protocol => 'Protokoll';

  @override
  String get stationaryPoint => 'Stasjonær - Fast punkt';

  @override
  String get nocturnalFlightCall => 'Nattlig fluktlyd (NFC)';

  @override
  String get incidental => 'Tilfeldig';

  @override
  String get localityName => 'Stedsnavn *';

  @override
  String get requiredField => 'Obligatorisk felt';

  @override
  String get numberOfObservers => 'Antall observatører';

  @override
  String get additionalComments => 'Ytterligere kommentarer';

  @override
  String get includeAudioFileNamesInComments =>
      'Inkluder lydfilnavn i kommentarer';

  @override
  String get readyForExport => 'Klar for eksport';

  @override
  String get totalUniqueSpecies => 'Totalt antall arter (unikt)';

  @override
  String get hourlyModeledChecklists => 'Timemodellerte sjekklister';

  @override
  String get averageConfidence => 'Gjennomsnittlig selvtillit';

  @override
  String get wizardInfoText =>
      'Ved å trykke på \"Generer CSV\", vil filen bli kompilert ved å dele stasjonene etter time, klar til å lastes opp til eBird.';

  @override
  String get statistics => 'Statistikk';

  @override
  String get systemLogs => 'Systemlogger';

  @override
  String get systemTools => 'Systemverktøy';

  @override
  String get systemControls => 'Systemkontroller';

  @override
  String get restart => 'Start på nytt';

  @override
  String get restartRaspberryPi => 'Start Raspberry Pi på nytt';

  @override
  String get areYouSureYouWantToRestart =>
      'Er du sikker på at du vil starte systemet på nytt?';

  @override
  String get update => 'Oppdater';

  @override
  String get updateBirdNetPi => 'Oppdater BirdNET-Pi til den nyeste versjonen';

  @override
  String get doYouWantToUpdateBirdNet => 'Vil du oppdatere BirdNET-Pi?';

  @override
  String get shutdown => 'Slå av';

  @override
  String get shutdownRaspberryPi => 'Slå av Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Er du sikker på at du vil slå av systemet?';

  @override
  String get clearAllData => 'Slett alle data';

  @override
  String get removeAllRecordingsAndDetections =>
      'Fjern alle opptak og deteksjoner';

  @override
  String get warningAllDataWillBeDeleted =>
      'ADVARSEL: Alle data vil bli permanent slettet. Fortsette?';

  @override
  String get services => 'Tjenester';

  @override
  String get liveAudioStream => 'Live lydstrøm';

  @override
  String get birdNetAnalysis => 'BirdNET-analyse';

  @override
  String get birdNetRecording => 'BirdNET-opptak';

  @override
  String get birdNetLog => 'BirdNET-logg';

  @override
  String get chartViewer => 'Diagramvisning';

  @override
  String get spectrogram => 'Spektrogram';

  @override
  String get quickActions => 'Hurtigvalg';

  @override
  String get stopServices => 'Stopp tjenester';

  @override
  String get restartServices => 'Start tjenester på nytt';

  @override
  String get confirm => 'Bekreft';

  @override
  String get execution => 'Henrettelse:';

  @override
  String get commandExecuted => '✅ Kommando utført';

  @override
  String errorMsg(String error) {
    return '❌ Feil: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Feil';
  }

  @override
  String get settings => 'Innstillinger';

  @override
  String get basicSettings => 'Grunninnstillinger';

  @override
  String get basicSettingsSubtitle =>
      'Konfigurer tid, plassering, språk og varsler.';

  @override
  String get advancedSettings => 'Avanserte innstillinger';

  @override
  String get advancedSettingsSubtitle =>
      'Konfigurer lyd, personvern, diskadministrasjon og mer.';

  @override
  String get connection => 'Tilkobling';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi serveradresse';

  @override
  String get enterIpOrHostname =>
      'Skriv inn IP-adressen eller vertsnavnet til din Raspberry Pi';

  @override
  String get testInProgress => 'Test pågår...';

  @override
  String get saveAndTestConnection => 'Lagre og test tilkoblingen';

  @override
  String get deviceInformation => 'Enhetsinformasjon';

  @override
  String get loading => 'Laster...';

  @override
  String get notConnected => 'Ikke tilkoblet';

  @override
  String get configureServerAddress => 'Konfigurer serveradressen';

  @override
  String get latitude => 'Breddegrad';

  @override
  String get longitude => 'Lengdegrad';

  @override
  String get locality => 'Sted';

  @override
  String get stateProvince => 'Stat/provins';

  @override
  String get countryCode => 'Landskode';

  @override
  String get information => 'Informasjon';

  @override
  String get appVersion => 'Versjon 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Overvåk fugledeteksjoner fra Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Tilkoblet $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Kan ikke koble til $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Feil ved lasting av innstillinger: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully => 'Grunninnstillinger lagret';

  @override
  String get errorWhileSaving => 'Feil under lagring';

  @override
  String exceptionDuringSave(String error) {
    return 'Unntak under lagring: $error';
  }

  @override
  String get model => 'Modell';

  @override
  String get selectAModel => 'Velg en modell:';

  @override
  String get speciesRangeModel => 'Artsserie modell V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Arters forekomst Frekvensterskel [0,0005, 0,99]:';

  @override
  String get location => 'Posisjon';

  @override
  String get siteName => 'Stedsnavn:';

  @override
  String get latitudeInput => 'Breddegrad:';

  @override
  String get longitudeInput => 'Lengdegrad:';

  @override
  String get birdWeatherToken => 'BirdWeather-token:';

  @override
  String get notificationsApprise => 'Varslinger (Apprise)';

  @override
  String get appriseConfig => 'Apprise-varslingskonfigurasjon:';

  @override
  String get notificationTitle => 'Varslingstittel:';

  @override
  String get notificationBody => 'Varslingstekst:';

  @override
  String get notifyNewInfrequent => 'Varsle hver ny sjeldne art deteksjon';

  @override
  String get notifyFirstDetectionOfDay =>
      'Gi beskjed til hver art om dagens første påvisning';

  @override
  String get notifyEachNewDetection => 'Varsle hver nye observasjon';

  @override
  String get sendWeeklyReport => 'Send ukerapport';

  @override
  String get minTimeBetweenNotifications =>
      'Minimumstid mellom meldinger om samme art (sek):';

  @override
  String get excludeTheseSpecies => 'Ekskluder disse artene (kommaseparert):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Varsle KUN for disse artene (kommaseparert):';

  @override
  String get imageSource => 'Bildekilde';

  @override
  String get imageProvider => 'Bildeleverandør:';

  @override
  String get flickrApiKey => 'Flickr API-nøkkel:';

  @override
  String get flickrFilterEmail =>
      'Søk kun etter bilder fra denne Flickr-brukeren:';

  @override
  String get localization => 'Lokalisering';

  @override
  String get databaseLanguage => 'Databasspråk:';

  @override
  String get otherInfo => 'Annen info';

  @override
  String get infoSite => 'Infoside:';

  @override
  String get themeWeb => 'Grafisk tema (Web)';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get colorScheme => 'Fargeskjema:';

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
  String get none => 'Ingen';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Avanserte innstillinger lagret';

  @override
  String get privacyRecordings => 'Personvern for opptak';

  @override
  String get privacyThreshold => 'Personvernterskel [0, 99]:';

  @override
  String get diskSpaceManagement => 'Diskplassbehandling';

  @override
  String get whenDiskIsFull => 'Quando o disco estiver cheio:';

  @override
  String get purgeCapacity => 'Rensekapasitet [%-terskel]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Maks filer å beholde per art (0 = deaktiver):';

  @override
  String get audioSettings => 'Ljudinställningar';

  @override
  String get alsaInputCaptureDevice => 'ALSA-inndatafangstenhet (lydkort):';

  @override
  String get numberOfAudioChannels => 'Antall lydkanaler å trekke ut fra:';

  @override
  String get overlap => 'Overlapp (sek) [0, 2.9]:';

  @override
  String get audioFormat => 'Lydformat:';

  @override
  String get recordingLength => 'Inspelningstid (sek):';

  @override
  String get extractionLength => 'Extraktionstid (sek):';

  @override
  String get rtspAudioSharing => 'RTSP-lyddeling';

  @override
  String get shareLiveAudioStream => 'Vil du dele direkte lydstrøm?';

  @override
  String get playAudioStreamThroughWebUi =>
      'Vil du spille lydstrøm via nettgrensesnittet?';

  @override
  String get caddyPassword => 'Caddy-lösenord';

  @override
  String get appPassword => 'App-lösenord:';

  @override
  String get customLogoImage => 'Anpassad logotyp';

  @override
  String get customImageUrl => 'Egendefinert bildenettadresse:';

  @override
  String get customImageTitle => 'Egendefinert bildetittel:';

  @override
  String get birdNetLiteModelSettings => 'BirdNET-Lite modellinnstillinger';

  @override
  String get confidenceThreshold => 'Konfidensgrense [0, 0,99]:';

  @override
  String get sensitivity => 'Sensitivitet [0,5, 1,5]:';

  @override
  String get otherSettings => 'Andre innstillinger';

  @override
  String get silenceUpdateIndicator =>
      'Still \"Oppdatering tilgjengelig\"-indikator';

  @override
  String get automaticUpdate => 'Automatiska uppdateringar';

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
  String get speciesListsManagement => 'Behandling av artslister';

  @override
  String get inclusion => 'Inkludering';

  @override
  String get exclusion => 'Exkludering';

  @override
  String get whitelist => 'Vitlista';

  @override
  String get speciesAlreadyInList => 'Arten finns redan i listan';

  @override
  String get listSavedSuccessfully => 'Listen ble lagret';

  @override
  String get errorSavingList => 'Feil under lagring av listen';

  @override
  String errorLoadingList(String error) {
    return 'Feil ved innlasting av listen:\\n$error';
  }

  @override
  String get retry => 'Prøv igjen';

  @override
  String get searchSpeciesHint =>
      'Søk etter arter (f.eks. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Laster arter...';

  @override
  String get errorLoadingSpecies => 'Feil ved innlasting av arter';

  @override
  String get noSpeciesInThisList => 'Ingen arter i denne listen.';

  @override
  String get removeFromList => 'Fjern fra liste';

  @override
  String get saving => 'Lagrer...';

  @override
  String get save => 'Lagre';

  @override
  String get loginRequired => 'Innlogging kreves';

  @override
  String get loginTitle => 'Autentisering';

  @override
  String get loginSubtitle =>
      'Skriv inn legitimasjonen din for å få tilgang til beskyttede funksjoner.';

  @override
  String get username => 'Brukernavn';

  @override
  String get password => 'Passord';

  @override
  String get loginEmptyError => 'Vennligst skriv inn brukernavn og passord';

  @override
  String get loginInvalidError => 'Ugyldig legitimasjon';

  @override
  String get authenticated => 'Autentisert';

  @override
  String get signIn => 'Logg inn';

  @override
  String get loggedInMessage => 'Du er for øyeblikket autentisert.';

  @override
  String get logout => 'Log ut';

  @override
  String get login => 'Inlogg';

  @override
  String get audioStream => 'Ljudström';

  @override
  String get pressPlayToListen => 'Tryck på spela för att lyssna';

  @override
  String get loginToStart => 'Logg inn med 🔒 for å starte';

  @override
  String get streamRequiresAuth =>
      'Strømmen krever autentisering. Trykk på 🔒-ikonet øverst til høyre for å logge på.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Fjern demping';

  @override
  String get mute => 'Demp';

  @override
  String get resume => ' gjenoppta';

  @override
  String get pause => 'Pausa';

  @override
  String get autoRefresh => 'Autooppdatering';

  @override
  String get pressPlaySpectrogram => 'Trykk på ▶ for å se spektrogrammet';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Trykk på ▶ for å starte sanntidsspektrogrammet';

  @override
  String get loginThenPlay => 'Logg inn med 🔒 og trykk deretter ▶';

  @override
  String get currentAnalyzing => 'Analyserer nå';

  @override
  String get accessRestricted => 'Begrenset tilgang';

  @override
  String get loginToAccessSection =>
      'Logg inn for å få tilgang til denne delen.';

  @override
  String get iframeNotSupported => 'Iframes støttes strengt på nettversjonen.';

  @override
  String get error => 'Feil';

  @override
  String get otherUtilities => 'Andre verktøy';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spektrogram er ikke tilgjengelig';

  @override
  String get ebirdCountIdentifier => 'Nr';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stasjonær';

  @override
  String get ebirdProtocolIncidental => 'Tilfeldig';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Oppdater';

  @override
  String get tooltipStop => 'Stopp';

  @override
  String get tooltipStart => 'Start';

  @override
  String get tooltipRestart => 'Start på nytt';

  @override
  String get systemInfo => 'Systeminfo';

  @override
  String get fileManager => 'Filbehandler';

  @override
  String get databaseMaintenance => 'Databasevedlikehold';

  @override
  String get webTerminal => 'Webterminal';

  @override
  String get tooltipOpenMenu => 'Öppna meny';

  @override
  String get tooltipRefreshData => 'Oppdater data';

  @override
  String get tooltipPreviousDay => 'Forrige dag';

  @override
  String get tooltipNextDay => 'Neste dag';

  @override
  String get tooltipPreviousWeek => 'Forrige uke';

  @override
  String get tooltipNextWeek => 'Neste uke';

  @override
  String get tooltipDeleteRecording => 'Slett opptaket';

  @override
  String get tooltipClearSearch => 'Tøm søk';

  @override
  String get tooltipCloseSearch => 'Lukk søk';

  @override
  String get tooltipSearch => 'Sök';

  @override
  String get tooltipPlay => 'Spela ljud';

  @override
  String get tooltipPickDate => 'Velg dato';

  @override
  String get passwordOptionalHint => 'La stå tomt hvis ikke satt';

  @override
  String get systemStatus => 'Systemstatus';

  @override
  String get sysInfoUptime => 'Driftstid';

  @override
  String get sysInfoDisk => 'Disk';

  @override
  String get sysInfoMemory => 'Minne';

  @override
  String get sysInfoCpuTemp => 'CPU-temperatur';

  @override
  String get sysInfoBranch => 'Branch';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count forplikter seg bak';
  }

  @override
  String get sysInfoLoadingError => 'Kunne ikke laste inn systeminformasjon.';

  @override
  String get enable => 'Aktiver';

  @override
  String get disable => 'Deaktiver';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Uke $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Gruppe etter art';

  @override
  String get groupByTime => 'Grupper etter tid';

  @override
  String get readOnWikipedia => 'Les på Wikipedia';

  @override
  String get loadingWikipedia => 'Laster informasjon fra Wikipedia...';

  @override
  String get noWikipediaInfo =>
      'Ingen informasjon funnet på Wikipedia for denne arten.';

  @override
  String get searchSpecies => 'Søk etter arter...';

  @override
  String get noResultsFound => 'Ingen resultater funnet';

  @override
  String get noSpeciesDetected => 'Ingen arter detektert';

  @override
  String get species => 'Arter';

  @override
  String get detections => 'Observasjoner';

  @override
  String get maxConfidence => 'Maks. konfidens';

  @override
  String get topSpecies => 'Topp arter';

  @override
  String get fromDate => 'Fra dato';

  @override
  String get toDate => 'Til dato';

  @override
  String get fromTime => 'Fra tid';

  @override
  String get toTime => 'Til tid';

  @override
  String get byPeriod => 'Etter periode';

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
  String get firstSeen => 'Først sett';

  @override
  String get lastSeen => 'Sist sett';

  @override
  String get thirtyDaysTrend => '30 dagers trend';

  @override
  String get avgConfidence => 'Gjennomsnittlig konfidens';

  @override
  String get mySpecies => 'Mine Arter';

  @override
  String get bestDetection => 'Beste Deteksjon';

  @override
  String get externalInfoLink => 'Ekstern Info';

  @override
  String get includedListInfo =>
      'Advarsel! Hvis denne listen inneholder NOEN arter, vil systemet BARE kjenne igjen disse artene. Hold denne listen TOM med mindre du BARE er interessert i å oppdage spesifikke arter.';

  @override
  String get excludedListInfo =>
      'Når ønsket art er fremhevet, klikk på den og klikk deretter på LEGG TIL for å ekskludere den.';

  @override
  String get whitelistInfo =>
      'Når ønsket art er fremhevet, klikk på den og klikk deretter på LEGG TIL for å legge den i hvitelisten. Denne arten vil bli oppdaget selv om den er under Terskel for Forekomstfrekvens (Species Occurrence Frequency Threshold) i innstillingene. Dette er ikke en anbefalt arbeidsmåte: Det foretrekkes å prøve først begge artenes forekomstmodeller (v1 og v2.4).';

  @override
  String get overnightRange => 'Nattintervall (krysser midnatt)';

  @override
  String get resetFilters => 'Tilbakestill filtre';

  @override
  String invalidValueRange(num min, num max) {
    return 'Value must be between $min and $max';
  }

  @override
  String get speciesListTester => 'Species List Tester';

  @override
  String get previewSpeciesList => 'Preview Species List';

  @override
  String get threshold => 'Threshold:';

  @override
  String get sfThreshHelpExtended =>
      'This value is used by the model to constrain the list of possible species that it will try to detect, given the minimum occurrence frequency. A 0.03 threshold means that for a species to be included in this list, it needs to, on average, be seen on at least 3% of historically submitted eBird checklists for your given lat/lon/current week of year. So, the lower the threshold, the rarer the species it will include.\n\n[In-depth technical write-up here](https://github.com/kahst/BirdNET-Analyzer/discussions/234)';

  @override
  String get sfThreshTesterHint =>
      'If you\'d like to tinker with this threshold value and see which species make it onto the list, you can use the Species List Tester tool below.';

  @override
  String get sfThreshTesterLegacyHint =>
      'Please click \"Update Settings\" at the very bottom of this page to install the appropriate label file, then come back here and you\'ll be able to use the Species List Tester.';

  @override
  String get appriseConfigHelp =>
      'Apprise Notifications can be setup and enabled for 90+ notification services. Each service should be on its own line.';

  @override
  String get notificationVarsHelp =>
      'You can use the following variables in your title and body:\n\n- `\$sciname`: Scientific Name\n- `\$comname`: Common Name\n- `\$confidencepct`: Confidence score as percentage\n- `\$listenurl`: Link to the detection\n- `\$date`, `\$time`, `\$week`: Date/Time info\n- `\$image`: Species image\n- `\$reason`: Reason for notification';

  @override
  String get excludeSpeciesHelp =>
      'Exclude these species from notifications (comma separated common names). Example: `Mourning Dove,American Crow`.';

  @override
  String get includeSpeciesHelp =>
      'ONLY notify for these species (comma separated common names).';
}
