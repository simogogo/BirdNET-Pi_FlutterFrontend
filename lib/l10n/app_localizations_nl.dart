// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Vogelmonitoring';

  @override
  String get home => 'Home';

  @override
  String get today => 'Vandaag';

  @override
  String get recordings => 'Opnames';

  @override
  String get liveStream => 'Live stream';

  @override
  String get liveSpectrogram => 'Live spectrogram';

  @override
  String get speciesManagement => 'SOORTENBEHEER';

  @override
  String get inclusionList => 'Inclusielijst';

  @override
  String get exclusionList => 'Exclusielijst';

  @override
  String get analysisLog => 'Analyseverslag';

  @override
  String get openWebInterface => 'Webinterface openen';

  @override
  String get loadingLiveSpectrogram => 'Live spectrogram laden...';

  @override
  String get spectrogramInstruction =>
      'Als de audio niet automatisch start, communiceer dan met de pagina of controleer je browserinstellingen.';

  @override
  String get configureServerFirst =>
      'Configureer eerst het serveradres in Instellingen';

  @override
  String get recentDetections => 'Recente waarnemingen';

  @override
  String get latestDetection => 'Laatste waarneming';

  @override
  String get audioFile => 'Audiobestand';

  @override
  String get playing => 'Speelt af';

  @override
  String get noDetectionsToday => 'Geen waarnemingen vandaag';

  @override
  String get systemListening => 'Het systeem luistert...';

  @override
  String get errorOccurred => 'Er is een fout opgetreden';

  @override
  String get overview => 'Overzicht';

  @override
  String get detectionsAllTime => 'Waarnemingen\ntotaal';

  @override
  String get detectionsToday => 'Waarnemingen\nvandaag';

  @override
  String get detectionsLastHour => 'Waarnemingen\nlaatste uur';

  @override
  String get speciesToday => 'Soorten\nvandaag';

  @override
  String get speciesAllTime => 'Soorten\ntotaal';

  @override
  String get statsLoadingError => 'Fout bij laden statistieken';

  @override
  String get todaysDetections => 'Waarnemingen van vandaag';

  @override
  String get noDetectionsForSpecies => 'Geen detecties voor deze soort';

  @override
  String get removeFilter => 'Filter verwijderen';

  @override
  String detectionsCount(int count) {
    return '$count waarnemingen';
  }

  @override
  String get filterDetections => 'Waarnemingen filteren';

  @override
  String get minimumConfidenceThreshold => 'Minimale betrouwbaarheidsdrempel';

  @override
  String get reset => 'Reset';

  @override
  String get apply => 'Toepassen';

  @override
  String get charts => 'Grafieken';

  @override
  String get daily => 'Dagelijks';

  @override
  String get weekly => 'Wekelijks';

  @override
  String get detectionsBySpecies => 'Detecties per soort';

  @override
  String get hourlyDistribution => 'Uurverdeling';

  @override
  String get noChartAvailable => 'Geen grafiek beschikbaar';

  @override
  String get weeklyReport => 'Wekelijks rapport';

  @override
  String get newSpecies => 'Nieuwe soort';

  @override
  String get newFemale => 'Nieuw!';

  @override
  String get identifiedSpecies => 'Geïdentificeerde soorten';

  @override
  String get byDate => 'Op datum';

  @override
  String get bySpecies => 'Op soort';

  @override
  String exportToEbird(String date) {
    return 'Exporteren naar eBird ($date)';
  }

  @override
  String get noRecordings => 'Geen opnames';

  @override
  String get deleteRecording => 'Opname verwijderen';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Wilt u \"$name\" verwijderen van $date $time?';
  }

  @override
  String get cancel => 'Annuleren';

  @override
  String get delete => 'Verwijderen';

  @override
  String get noSpeciesFound => 'Geen soorten gevonden.';

  @override
  String get unknown => 'Onbekend';

  @override
  String get noRecordingsAvailable => 'Geen opnames beschikbaar.';

  @override
  String get play => 'Afspelen';

  @override
  String get changeId => 'ID wijzigen';

  @override
  String get protect => 'Beschermen';

  @override
  String get unprotect => 'Bescherming opheffen';

  @override
  String get download => 'Downloaden';

  @override
  String get cannotDownloadFile => 'Kan bestand niet downloaden';

  @override
  String get errorLoading => 'Fout bij laden';

  @override
  String get autoDetectionsViaBirdNet =>
      'Automatische detecties via BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully =>
      'Het downloaden is succesvol gestart!';

  @override
  String get cannotDownloadCsv => 'Kan CSV niet downloaden.';

  @override
  String get zipDownloadInProgress => 'ZIP-download bezig...';

  @override
  String get cannotOpenZipUrl => 'Kan URL voor ZIP-download niet openen';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'De server heeft de download-URL niet geretourneerd.';

  @override
  String get unknownError => 'Onbekende fout';

  @override
  String get serverError => 'Serverfout';

  @override
  String get ebirdExport => 'eBird export';

  @override
  String get generateCsvForEbird => 'CSV voor eBird genereren';

  @override
  String get downloadAudioZip => 'Audio downloaden (ZIP)';

  @override
  String get close => 'Sluiten';

  @override
  String get continueStep => 'Doorgaan';

  @override
  String get back => 'Terug';

  @override
  String get review => 'Beoordelen';

  @override
  String get configuration => 'Configuratie';

  @override
  String get summary => 'Samenvatting';

  @override
  String get autoRemoveLessThan80 => 'Automatisch < 80% verwijderen';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Soorten gelezen: $totalSpecies | Voorvallen: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count detecties';
  }

  @override
  String get protocol => 'Protocol';

  @override
  String get stationaryPoint => 'Stationair - Vast punt';

  @override
  String get nocturnalFlightCall => 'Nachtelijke vluchtroep (NFC)';

  @override
  String get incidental => 'Incidenteel';

  @override
  String get localityName => 'Locatienaam *';

  @override
  String get requiredField => 'Verplicht veld';

  @override
  String get numberOfObservers => 'Aantal waarnemers';

  @override
  String get additionalComments => 'Extra opmerkingen';

  @override
  String get includeAudioFileNamesInComments =>
      'Audiobestandsnamen in opmerkingen opnemen';

  @override
  String get readyForExport => 'Klaar voor export';

  @override
  String get totalUniqueSpecies => 'Totaal aantal soorten (uniek)';

  @override
  String get hourlyModeledChecklists => 'Op uurbasis gemodelleerde checklists';

  @override
  String get averageConfidence => 'Gemiddeld vertrouwen';

  @override
  String get wizardInfoText =>
      'Door op \"CSV genereren\" te klikken, wordt het bestand samengesteld, waarbij de stations per uur worden verdeeld, klaar om te worden geüpload naar eBird.';

  @override
  String get statistics => 'Statistieken';

  @override
  String get systemLogs => 'Systeemlogs';

  @override
  String get systemTools => 'Systeemgereedschap';

  @override
  String get systemControls => 'Systeembediening';

  @override
  String get restart => 'Herstarten';

  @override
  String get restartRaspberryPi => 'Start de Raspberry Pi opnieuw op';

  @override
  String get areYouSureYouWantToRestart =>
      'Weet u zeker dat u het systeem opnieuw wilt opstarten?';

  @override
  String get update => 'Bijwerken';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi naar de nieuwste versie';

  @override
  String get doYouWantToUpdateBirdNet => 'Wilt u BirdNET-Pi updaten?';

  @override
  String get shutdown => 'Uitschakelen';

  @override
  String get shutdownRaspberryPi => 'Sluit de Raspberry Pi af';

  @override
  String get areYouSureYouWantToShutdown =>
      'Weet u zeker dat u het systeem wilt afsluiten?';

  @override
  String get clearAllData => 'Alle gegevens wissen';

  @override
  String get removeAllRecordingsAndDetections =>
      'Verwijder alle opnames en detecties';

  @override
  String get warningAllDataWillBeDeleted =>
      'WAARSCHUWING: Alle gegevens worden permanent verwijderd. Doorgaan?';

  @override
  String get services => 'Diensten';

  @override
  String get liveAudioStream => 'Live audiostream';

  @override
  String get birdNetAnalysis => 'BirdNET-analyse';

  @override
  String get birdNetRecording => 'BirdNET-opname';

  @override
  String get birdNetLog => 'BirdNET-logboek';

  @override
  String get chartViewer => 'Grafiekviewer';

  @override
  String get spectrogram => 'Spectrogram';

  @override
  String get quickActions => 'Snelle acties';

  @override
  String get stopServices => 'Diensten stopzetten';

  @override
  String get restartServices => 'Services opnieuw starten';

  @override
  String get confirm => 'Bevestigen';

  @override
  String get execution => 'Uitvoering:';

  @override
  String get commandExecuted => '✅ Opdracht uitgevoerd';

  @override
  String errorMsg(String error) {
    return '❌ Fout: $error';
  }

  @override
  String get species => 'Soorten';

  @override
  String get noSpeciesDetected => 'Geen soorten gedetecteerd';

  @override
  String get max => 'Maximaal:';

  @override
  String get detections => 'Waarnemingen';

  @override
  String get maxConfidence => 'Maximale betrouwbaarheid';

  @override
  String get searchSpecies => 'Soorten zoeken...';

  @override
  String get errorMsgSimple => 'Fout';

  @override
  String get settings => 'Instellingen';

  @override
  String get basicSettings => 'Basisinstellingen';

  @override
  String get basicSettingsSubtitle =>
      'Configureer tijd, locatie, taal en meldingen.';

  @override
  String get advancedSettings => 'Geavanceerde instellingen';

  @override
  String get advancedSettingsSubtitle =>
      'Configureer audio, privacy, schijfbeheer en meer.';

  @override
  String get connection => 'Verbinding';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi serveradres';

  @override
  String get enterIpOrHostname =>
      'Voer het IP-adres of de hostnaam van uw Raspberry Pi in';

  @override
  String get testInProgress => 'Test bezig...';

  @override
  String get saveAndTestConnection => 'Verbinding opslaan en testen';

  @override
  String get deviceInformation => 'Apparaatinformatie';

  @override
  String get loading => 'Laden...';

  @override
  String get notConnected => 'Niet verbonden';

  @override
  String get configureServerAddress => 'Configureer het serveradres';

  @override
  String get latitude => 'Breedtegraad';

  @override
  String get longitude => 'Lengtegraad';

  @override
  String get locality => 'Plaats';

  @override
  String get stateProvince => 'Staat/Provincie';

  @override
  String get countryCode => 'Landcode';

  @override
  String get information => 'Informatie';

  @override
  String get appVersion => 'Versie 1.0.0';

  @override
  String get appDescription =>
      'Companion-app voor BirdNET-Pi. Bewaak vogeldetecties vanaf uw Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Verbonden met $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Kan geen verbinding maken met $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Fout bij laden instellingen: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Basisinstellingen succesvol opgeslagen';

  @override
  String get errorWhileSaving => 'Fout tijdens het opslaan';

  @override
  String exceptionDuringSave(String error) {
    return 'Uitzondering tijdens opslaan: $error';
  }

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Selecteer een model:';

  @override
  String get speciesRangeModel => 'Soortenreeks model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Frequentiedrempel voor voorkomen van soorten [0,0005, 0,99]:';

  @override
  String get location => 'Locatie';

  @override
  String get siteName => 'Sitenaam:';

  @override
  String get latitudeInput => 'Breedtegraad:';

  @override
  String get longitudeInput => 'Lengtegraad:';

  @override
  String get birdWeatherToken => 'BirdWeather-token:';

  @override
  String get notificationsApprise => 'Meldingen (Apprise)';

  @override
  String get appriseConfig => 'Configuratie van Apprise-meldingen:';

  @override
  String get notificationTitle => 'Titel melding:';

  @override
  String get notificationBody => 'Inhoud melding:';

  @override
  String get notifyNewInfrequent =>
      'Breng elke nieuwe zeldzame soortdetectie op de hoogte';

  @override
  String get notifyFirstDetectionOfDay =>
      'Breng elke soort op de hoogte van de eerste detectie van de dag';

  @override
  String get notifyEachNewDetection => 'Meld elke nieuwe waarneming';

  @override
  String get sendWeeklyReport => 'Wekelijks rapport verzenden';

  @override
  String get minTimeBetweenNotifications =>
      'Minimumtijd tussen meldingen van dezelfde soort (sec):';

  @override
  String get excludeTheseSpecies =>
      'Sluit deze soorten uit (door komma\'s gescheiden):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'ALLEEN melden voor deze soorten (door komma\'s gescheiden):';

  @override
  String get imageSource => 'Afbeeldingsbron';

  @override
  String get imageProvider => 'Beeldaanbieder:';

  @override
  String get flickrApiKey => 'Flickr API-sleutel:';

  @override
  String get flickrFilterEmail =>
      'Zoek alleen naar foto\'s van deze Flickr-gebruiker:';

  @override
  String get localization => 'Localisatie';

  @override
  String get databaseLanguage => 'Databasetaal:';

  @override
  String get otherInfo => 'Overige info';

  @override
  String get infoSite => 'Infosite:';

  @override
  String get themeWeb => 'Grafisch thema (Web)';

  @override
  String get colorScheme => 'Kleurenschema:';

  @override
  String get none => 'Geen';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Geavanceerde instellingen succesvol opgeslagen';

  @override
  String get privacyRecordings => 'Opnameprivacy';

  @override
  String get privacyThreshold => 'Privacydrempel [0, 99]:';

  @override
  String get diskSpaceManagement => 'Schijfruimtebeheer';

  @override
  String get whenDiskIsFull => 'Wanneer schijf vol is:';

  @override
  String get purgeCapacity => 'Spoelcapaciteit [% drempel]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max. aantal te bewaren bestanden per soort (0 = uitschakelen):';

  @override
  String get audioSettings => 'Audio-instellingen';

  @override
  String get alsaInputCaptureDevice =>
      'ALSA-invoeropnameapparaat (geluidskaart):';

  @override
  String get numberOfAudioChannels =>
      'Aantal audiokanalen waaruit moet worden gehaald:';

  @override
  String get overlap => 'Overlap (sec) [0, 2.9]:';

  @override
  String get audioFormat => 'Audioformaat:';

  @override
  String get recordingLength => 'Opnamelengte (sec):';

  @override
  String get extractionLength => 'Extractielengte (sec):';

  @override
  String get rtspAudioSharing => 'RTSP-audio delen';

  @override
  String get shareLiveAudioStream => 'Live audiostream delen?';

  @override
  String get playAudioStreamThroughWebUi =>
      'Audiostream afspelen via de webinterface?';

  @override
  String get caddyPassword => 'Caddy wachtwoord';

  @override
  String get appPassword => 'App wachtwoord:';

  @override
  String get customLogoImage => 'Aangepast logo';

  @override
  String get customImageUrl => 'Aangepaste afbeeldings-URL:';

  @override
  String get customImageTitle => 'Aangepaste afbeeldingstitel:';

  @override
  String get birdNetLiteModelSettings => 'BirdNET-Lite-modelinstellingen';

  @override
  String get confidenceThreshold => 'Betrouwbaarheidsdrempel [0, 0,99]:';

  @override
  String get sensitivity => 'Gevoeligheid [0,5, 1,5]:';

  @override
  String get otherSettings => 'Overige instellingen';

  @override
  String get silenceUpdateIndicator =>
      'Stop de indicator \'Update beschikbaar\'';

  @override
  String get automaticUpdate => 'Automatisch bijwerken';

  @override
  String get saveRawSpectrograms => 'Ruwe spectrogrammen opslaan';

  @override
  String get loggingLevels => 'Logniveaus';

  @override
  String get birdnetRecordingService => 'BirdNET-opnameservice:';

  @override
  String get spectrogramViewerService => 'Spectrogramviewerservice:';

  @override
  String get liveAudioStreamService => 'Live audiostreamservice:';

  @override
  String get speciesListsManagement => 'Soortenlijstbeheer';

  @override
  String get inclusion => 'Inclusie';

  @override
  String get exclusion => 'Exclusie';

  @override
  String get whitelist => 'Whitelist';

  @override
  String get speciesAlreadyInList => 'Soort al aanwezig in de lijst';

  @override
  String get listSavedSuccessfully => 'Lijst succesvol opgeslagen';

  @override
  String get errorSavingList => 'Fout bij het opslaan van de lijst';

  @override
  String errorLoadingList(String error) {
    return 'Fout bij het laden van de lijst:\\n$error';
  }

  @override
  String get retry => 'Opnieuw proberen';

  @override
  String get searchSpeciesHint =>
      'Soorten zoeken (bijv. Turdus merula_Gewone Merel)';

  @override
  String get loadingSpecies => 'Soorten laden...';

  @override
  String get errorLoadingSpecies => 'Fout bij het laden van soorten';

  @override
  String get noSpeciesInThisList => 'Geen soorten in deze lijst.';

  @override
  String get removeFromList => 'Verwijderen uit lijst';

  @override
  String get saving => 'Opslaan...';

  @override
  String get save => 'Opslaan';

  @override
  String get loginRequired => 'Inloggen vereist voor deze actie';

  @override
  String get loginTitle => 'Authenticatie';

  @override
  String get loginSubtitle =>
      'Voer uw inloggegevens in om toegang te krijgen tot beveiligde functies.';

  @override
  String get username => 'Gebruikersnaam';

  @override
  String get password => 'Wachtwoord';

  @override
  String get loginEmptyError => 'Voer gebruikersnaam en wachtwoord in';

  @override
  String get loginInvalidError => 'Ongeldige inloggegevens';

  @override
  String get authenticated => 'Geauthenticeerd';

  @override
  String get signIn => 'Inloggen';

  @override
  String get loggedInMessage => 'U bent momenteel geverifieerd.';

  @override
  String get logout => 'Uitloggen';

  @override
  String get login => 'Inloggen';

  @override
  String get audioStream => 'Audiostream';

  @override
  String get pressPlayToListen => 'Druk op afspelen om te luisteren';

  @override
  String get loginToStart => 'Log in met 🔒 om te beginnen';

  @override
  String get streamRequiresAuth =>
      'Voor de stream is authenticatie vereist. Tik rechtsboven op het 🔒-icoon om in te loggen.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live-audio';

  @override
  String get unmute => 'Geluid aanzetten';

  @override
  String get mute => 'Dempen';

  @override
  String get resume => 'Hervatten';

  @override
  String get pause => 'Pauze';

  @override
  String get autoRefresh => 'Automatisch vernieuwen';

  @override
  String get pressPlaySpectrogram => 'Druk op ▶ om het spectrogram te bekijken';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Druk op ▶ om het realtime spectrogram te starten';

  @override
  String get loginThenPlay => 'Log in met 🔒 en druk vervolgens op ▶';

  @override
  String get currentAnalyzing => 'Nu aan het analyseren';

  @override
  String get accessRestricted => 'Toegang beperkt';

  @override
  String get loginToAccessSection =>
      'Log in om toegang te krijgen tot dit gedeelte.';

  @override
  String get iframeNotSupported =>
      'Iframes worden strikt ondersteund op de webversie.';

  @override
  String get error => 'Fout';

  @override
  String get searchSpeciesStr => 'Soorten zoeken...';

  @override
  String get otherUtilities => 'Overige hulpmiddelen';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram niet beschikbaar';

  @override
  String get ebirdCountIdentifier => 'N°';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationair';

  @override
  String get ebirdProtocolIncidental => 'Incidenteel';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Vernieuwen';

  @override
  String get tooltipStop => 'Stoppen';

  @override
  String get tooltipStart => 'Starten';

  @override
  String get tooltipRestart => 'Herstarten';

  @override
  String get systemInfo => 'Systeeminformatie';

  @override
  String get fileManager => 'Bestandsbeheer';

  @override
  String get databaseMaintenance => 'Database-onderhoud';

  @override
  String get webTerminal => 'Webterminal';

  @override
  String get tooltipOpenMenu => 'Menu openen';

  @override
  String get tooltipRefreshData => 'Gegevens vernieuwen';

  @override
  String get tooltipPreviousDay => 'Vorige dag';

  @override
  String get tooltipNextDay => 'Volgende dag';

  @override
  String get tooltipPreviousWeek => 'Vorige week';

  @override
  String get tooltipNextWeek => 'Volgende week';

  @override
  String get tooltipDeleteRecording => 'Opname verwijderen';

  @override
  String get tooltipClearSearch => 'Duidelijke zoekopdracht';

  @override
  String get tooltipCloseSearch => 'Zoekopdracht sluiten';

  @override
  String get tooltipSearch => 'Zoeken';

  @override
  String get tooltipPlay => 'Audio afspelen';

  @override
  String get tooltipPickDate => 'Datum kiezen';

  @override
  String get passwordOptionalHint => 'Laat leeg als dit niet is ingesteld';

  @override
  String get systemStatus => 'Systeemstatus';

  @override
  String get sysInfoUptime => 'Uptime';

  @override
  String get sysInfoDisk => 'Schijf';

  @override
  String get sysInfoMemory => 'Geheugen';

  @override
  String get sysInfoCpuTemp => 'CPU temp';

  @override
  String get sysInfoBranch => 'Branch';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits achter';
  }

  @override
  String get sysInfoLoadingError => 'Kan systeeminformatie niet laden.';

  @override
  String get enable => 'Inschakelen';

  @override
  String get disable => 'Uitschakelen';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Week $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Groeperen op soort';

  @override
  String get groupByTime => 'Groepeer op tijd';
}
