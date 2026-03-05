// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Monitoraggio Uccelli';

  @override
  String get home => 'Home';

  @override
  String get today => 'Oggi';

  @override
  String get recordings => 'Registrazioni';

  @override
  String get liveStream => 'Live stream';

  @override
  String get liveSpectrogram => 'Spettrogramma Live';

  @override
  String get speciesManagement => 'GESTIONE SPECIE';

  @override
  String get inclusionList => 'Lista Inclusione';

  @override
  String get exclusionList => 'Lista Esclusione';

  @override
  String get openWebInterface => 'Apri Interfaccia Web';

  @override
  String get loadingLiveSpectrogram => 'Caricamento Spettrogramma Live...';

  @override
  String get spectrogramInstruction =>
      'Se l\'audio non parte automaticamente, interagisci con la pagina\noppure verifica le autorizzazioni del browser.';

  @override
  String get configureServerFirst =>
      'Configura prima l\'indirizzo del server nelle impostazioni';

  @override
  String get recentDetections => 'Rilevamenti Recenti';

  @override
  String get latestDetection => 'Ultimo Rilevamento';

  @override
  String get audioFile => 'File Audio';

  @override
  String get playing => 'Riproduzione';

  @override
  String get noDetectionsToday => 'Nessun rilevamento oggi';

  @override
  String get systemListening => 'Il sistema sta ascoltando...';

  @override
  String get errorOccurred => 'Si è verificato un errore';

  @override
  String get overview => 'Panoramica';

  @override
  String get detectionsAllTime => 'Rilevamenti\nda sempre';

  @override
  String get detectionsToday => 'Rilevamenti\noggi';

  @override
  String get detectionsLastHour => 'Rilevamenti\nultima ora';

  @override
  String get speciesToday => 'Specie\nindividuate oggi';

  @override
  String get speciesAllTime => 'Specie\nda sempre';

  @override
  String get statsLoadingError => 'Errore caricamento statistiche';

  @override
  String get todaysDetections => 'Rilevamenti di Oggi';

  @override
  String get noDetectionsForSpecies => 'Nessun rilevamento per questa specie';

  @override
  String get removeFilter => 'Rimuovi filtro';

  @override
  String detectionsCount(int count) {
    return '$count rilevamenti';
  }

  @override
  String get filterDetections => 'Filtra Rilevamenti';

  @override
  String get minimumConfidenceThreshold => 'Soglia Confidenza Minima';

  @override
  String get reset => 'Resetta';

  @override
  String get apply => 'Applica';

  @override
  String get charts => 'Grafici';

  @override
  String get daily => 'Giornaliero';

  @override
  String get weekly => 'Settimanale';

  @override
  String get detectionsBySpecies => 'Rilevamenti per Specie';

  @override
  String get hourlyDistribution => 'Distribuzione Oraria';

  @override
  String get noChartAvailable => 'Nessun grafico disponibile';

  @override
  String get weeklyReport => 'Report Settimanale';

  @override
  String get newSpecies => 'Nuove Specie';

  @override
  String get newFemale => 'Nuova!';

  @override
  String get identifiedSpecies => 'Specie Identificate';

  @override
  String get byDate => 'Per Data';

  @override
  String get bySpecies => 'Per Specie';

  @override
  String exportToEbird(String date) {
    return 'Esporta su eBird ($date)';
  }

  @override
  String get noRecordings => 'Nessuna registrazione';

  @override
  String get deleteRecording => 'Elimina Registrazione';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Vuoi eliminare \"$name\" del $date $time?';
  }

  @override
  String get cancel => 'Annulla';

  @override
  String get delete => 'Elimina';

  @override
  String get noSpeciesFound => 'Nessuna specie trovata.';

  @override
  String get unknown => 'Sconosciuto';

  @override
  String get noRecordingsAvailable => 'Nessuna registrazione disponibile.';

  @override
  String get play => 'Riproduci';

  @override
  String get changeId => 'Cambia ID';

  @override
  String get protect => 'Proteggi';

  @override
  String get unprotect => 'Rimuovi protezione';

  @override
  String get download => 'Scarica';

  @override
  String get cannotDownloadFile => 'Impossibile scaricare il file';

  @override
  String get errorLoading => 'Errore caricamento';

  @override
  String get autoDetectionsViaBirdNet =>
      'Detection automatiche tramite BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully => 'Download avviato con successo!';

  @override
  String get cannotDownloadCsv => 'Impossibile scaricare il CSV.';

  @override
  String get zipDownloadInProgress => 'Download ZIP in corso...';

  @override
  String get cannotOpenZipUrl =>
      'Impossibile aprire l\'URL per il download dello ZIP';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Il server non ha restituito l\'URL di download.';

  @override
  String get unknownError => 'Errore sconosciuto';

  @override
  String get serverError => 'Errore Server';

  @override
  String get ebirdExport => 'eBird Export';

  @override
  String get generateCsvForEbird => 'Genera CSV per eBird';

  @override
  String get downloadAudioZip => 'Scarica Audio (ZIP)';

  @override
  String get close => 'Chiudi';

  @override
  String get continueStep => 'Continua';

  @override
  String get back => 'Indietro';

  @override
  String get review => 'Revisione';

  @override
  String get configuration => 'Configurazione';

  @override
  String get summary => 'Riepilogo';

  @override
  String get autoRemoveLessThan80 => 'Rimuovi automaticamente < 80%';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Specie lette: $totalSpecies | Occorrenze: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count rilevamenti';
  }

  @override
  String get protocol => 'Protocollo';

  @override
  String get stationaryPoint => 'Stationary - Punto fisso';

  @override
  String get nocturnalFlightCall => 'Nocturnal Flight Call (NFC)';

  @override
  String get incidental => 'Incidental - Casuale';

  @override
  String get localityName => 'Nome Località *';

  @override
  String get requiredField => 'Campo obbligatorio';

  @override
  String get numberOfObservers => 'Numero Osservatori';

  @override
  String get additionalComments => 'Commenti Aggiuntivi';

  @override
  String get includeAudioFileNamesInComments =>
      'Includi nomi file audio nei commenti';

  @override
  String get readyForExport => 'Pronto per l\'esportazione';

  @override
  String get totalUniqueSpecies => 'Specie Totali (Univoche)';

  @override
  String get hourlyModeledChecklists => 'Checklist orarie modellate';

  @override
  String get averageConfidence => 'Confidenza Media';

  @override
  String get wizardInfoText =>
      'Premendo \"Genera CSV\", il file verrà compilato dividendo le stazioni per ora, pronto per essere caricato nel formato eBird.';

  @override
  String get statistics => 'Statistiche';

  @override
  String get systemLogs => 'Log di Sistema';

  @override
  String get systemTools => 'Strumenti di Sistema';

  @override
  String get systemControls => 'Controlli di Sistema';

  @override
  String get restart => 'Riavvia';

  @override
  String get restartRaspberryPi => 'Riavvia il Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Sei sicuro di voler riavviare il sistema?';

  @override
  String get update => 'Aggiorna';

  @override
  String get updateBirdNetPi => 'Aggiorna BirdNET-Pi all\'ultima versione';

  @override
  String get doYouWantToUpdateBirdNet => 'Vuoi aggiornare BirdNET-Pi?';

  @override
  String get shutdown => 'Spegni';

  @override
  String get shutdownRaspberryPi => 'Spegni il Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Sei sicuro di voler spegnere il sistema?';

  @override
  String get clearAllData => 'Cancella Tutti i Dati';

  @override
  String get removeAllRecordingsAndDetections =>
      'Rimuovi tutte le registrazioni e detection';

  @override
  String get warningAllDataWillBeDeleted =>
      'ATTENZIONE: Tutti i dati verranno cancellati permanentemente. Continuare?';

  @override
  String get services => 'Servizi';

  @override
  String get liveAudioStream => 'Live Audio Stream';

  @override
  String get birdNetAnalysis => 'BirdNET Analisi';

  @override
  String get birdNetRecording => 'BirdNET Registrazione';

  @override
  String get birdNetLog => 'BirdNET Log';

  @override
  String get chartViewer => 'Chart Viewer';

  @override
  String get spectrogram => 'Spettrogramma';

  @override
  String get quickActions => 'Azioni Rapide';

  @override
  String get stopServices => 'Stop Servizi';

  @override
  String get restartServices => 'Riavvia Servizi';

  @override
  String get confirm => 'Conferma';

  @override
  String get execution => 'Esecuzione:';

  @override
  String get commandExecuted => '✅ Comando eseguito';

  @override
  String errorMsg(String error) {
    return '❌ Errore: $error';
  }

  @override
  String get species => 'Specie';

  @override
  String get noSpeciesDetected => 'Nessuna specie rilevata';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Rilevamenti';

  @override
  String get maxConfidence => 'Max Confidenza';

  @override
  String get searchSpecies => 'Cerca specie...';

  @override
  String get errorMsgSimple => 'Errore';

  @override
  String get settings => 'Impostazioni';

  @override
  String get basicSettings => 'Impostazioni Base';

  @override
  String get basicSettingsSubtitle =>
      'Configura orario, posizione, lingua e notifiche.';

  @override
  String get advancedSettings => 'Impostazioni Avanzate';

  @override
  String get advancedSettingsSubtitle =>
      'Configura audio, privacy, gestione disco e altro.';

  @override
  String get connection => 'Connessione';

  @override
  String get birdNetPiServerAddress => 'Indirizzo Server BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Inserisci l\'indirizzo IP o hostname del tuo Raspberry Pi';

  @override
  String get testInProgress => 'Test in corso...';

  @override
  String get saveAndTestConnection => 'Salva e Testa Connessione';

  @override
  String get deviceInformation => 'Informazioni Dispositivo';

  @override
  String get loading => 'Caricamento...';

  @override
  String get notConnected => 'Non connesso';

  @override
  String get configureServerAddress => 'Configura l\'indirizzo del server';

  @override
  String get latitude => 'Latitudine';

  @override
  String get longitude => 'Longitudine';

  @override
  String get locality => 'Località';

  @override
  String get stateProvince => 'Stato/Provincia';

  @override
  String get countryCode => 'Codice Paese';

  @override
  String get information => 'Informazioni';

  @override
  String get appVersion => 'Versione 1.0.0';

  @override
  String get appDescription =>
      'App companion per BirdNET-Pi. Monitora i rilevamenti di uccelli dal tuo Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Connesso a $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Impossibile connettersi a $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Errore nel caricamento delle impostazioni: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Impostazioni base salvate con successo';

  @override
  String get errorWhileSaving => 'Errore durante il salvataggio';

  @override
  String exceptionDuringSave(String error) {
    return 'Eccezione durante il salvataggio: $error';
  }

  @override
  String get model => 'Modello';

  @override
  String get selectAModel => 'Select a Model:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Posizione';

  @override
  String get siteName => 'Site Name:';

  @override
  String get latitudeInput => 'Latitude:';

  @override
  String get longitudeInput => 'Longitude:';

  @override
  String get birdWeatherToken => 'BirdWeather Token:';

  @override
  String get notificationsApprise => 'Notifiche (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Notification Title:';

  @override
  String get notificationBody => 'Notification Body:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Notify each new detection';

  @override
  String get sendWeeklyReport => 'Send weekly report';

  @override
  String get minTimeBetweenNotifications =>
      'Minimum time between notifications of the same species (sec):';

  @override
  String get excludeTheseSpecies => 'Exclude these species (comma separated):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'ONLY notify for these species (comma separated):';

  @override
  String get imageSource => 'Sorgente Immagini';

  @override
  String get imageProvider => 'Image Provider:';

  @override
  String get flickrApiKey => 'Flickr API Key:';

  @override
  String get flickrFilterEmail => 'Only search photos from this Flickr user:';

  @override
  String get localization => 'Localizzazione';

  @override
  String get databaseLanguage => 'Database Language:';

  @override
  String get otherInfo => 'Altre Info';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Tema Grafico (Web)';

  @override
  String get colorScheme => 'Color Scheme:';

  @override
  String get none => 'Nessuno';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Impostazioni avanzate salvate con successo';

  @override
  String get privacyRecordings => 'Privacy Registrazioni';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Gestione Spazio su Disco';

  @override
  String get whenDiskIsFull => 'When Disk is Full:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Impostazioni Audio';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Overlap (sec) [0, 2.9]:';

  @override
  String get audioFormat => 'Audio Format:';

  @override
  String get recordingLength => 'Recording Length (sec):';

  @override
  String get extractionLength => 'Extraction Length (sec):';

  @override
  String get rtspAudioSharing => 'Condivisione Audio RTSP';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Password Caddy';

  @override
  String get appPassword => 'App Password:';

  @override
  String get customLogoImage => 'Immagine Logo Costumizzata';

  @override
  String get customImageUrl => 'Custom Image URL:';

  @override
  String get customImageTitle => 'Custom Image Title:';

  @override
  String get birdNetLiteModelSettings => 'Impostazioni Modello BirdNET-Lite';

  @override
  String get confidenceThreshold => 'Confidence threshold [0, 0.99]:';

  @override
  String get sensitivity => 'Sensitivity [0.5, 1.5]:';

  @override
  String get otherSettings => 'Altre Impostazioni';

  @override
  String get silenceUpdateIndicator => 'Silence \"Update Available\" Indicator';

  @override
  String get automaticUpdate => 'Automatic Update';

  @override
  String get saveRawSpectrograms => 'Save Raw Spectrograms';

  @override
  String get loggingLevels => 'Livelli di Logging';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Gestione Liste Specie';

  @override
  String get inclusion => 'Inclusione';

  @override
  String get exclusion => 'Esclusione';

  @override
  String get whitelist => 'Whitelist';

  @override
  String get speciesAlreadyInList => 'Specie già presente nella lista';

  @override
  String get listSavedSuccessfully => 'Lista salvata con successo';

  @override
  String get errorSavingList => 'Errore durante il salvataggio della lista';

  @override
  String errorLoadingList(String error) {
    return 'Errore durante il caricamento della lista:\\n$error';
  }

  @override
  String get retry => 'Riprova';

  @override
  String get searchSpeciesHint =>
      'Cerca specie (es. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Caricamento specie in corso...';

  @override
  String get errorLoadingSpecies => 'Errore nel caricamento delle specie';

  @override
  String get noSpeciesInThisList => 'Nessuna specie in questa lista.';

  @override
  String get removeFromList => 'Rimuovi dalla lista';

  @override
  String get saving => 'Salvataggio...';

  @override
  String get save => 'Salva';

  @override
  String get loginRequired => 'Login richiesto per questa azione';

  @override
  String get loginTitle => 'Autenticazione';

  @override
  String get loginSubtitle =>
      'Inserisci le credenziali per accedere alle funzioni protette.';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get loginEmptyError => 'Inserisci username e password';

  @override
  String get loginInvalidError => 'Credenziali non valide';

  @override
  String get authenticated => 'Autenticato';

  @override
  String get signIn => 'Accedi';

  @override
  String get loggedInMessage => 'Sei attualmente autenticato.';

  @override
  String get logout => 'Logout';

  @override
  String get login => 'Login';

  @override
  String get audioStream => 'Audio Stream';

  @override
  String get pressPlayToListen => 'Premi play per ascoltare';

  @override
  String get loginToStart => 'Effettua il login con il 🔒 per iniziare';

  @override
  String get streamRequiresAuth =>
      'Lo stream richiede autenticazione. Tocca l\'icona 🔒 in alto a destra per effettuare il login.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Attiva audio';

  @override
  String get mute => 'Silenzia';

  @override
  String get resume => 'Riprendi';

  @override
  String get pause => 'Pausa';

  @override
  String get autoRefresh => 'Auto-refresh';

  @override
  String get pressPlaySpectrogram =>
      'Premi ▶ per visualizzare lo spettrogramma';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Premi ▶ per avviare lo spettrogramma in tempo reale';

  @override
  String get loginThenPlay => 'Effettua il login con il 🔒 poi premi ▶';

  @override
  String get currentAnalyzing => 'Analisi Corrente';

  @override
  String get accessRestricted => 'Accesso riservato';

  @override
  String get loginToAccessSection =>
      'Effettua il login per accedere a questa sezione.';

  @override
  String get iframeNotSupported =>
      'Gli iframe sono supportati solo sulla versione web.';

  @override
  String get error => 'Errore';

  @override
  String get searchSpeciesStr => 'Cerca specie...';

  @override
  String get otherUtilities => 'Altre utility';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spettrogramma non disponibile';

  @override
  String get ebirdCountIdentifier => 'N°';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationary';

  @override
  String get ebirdProtocolIncidental => 'Incidental';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Aggiorna';

  @override
  String get tooltipStop => 'Ferma';

  @override
  String get tooltipStart => 'Avvia';

  @override
  String get tooltipRestart => 'Riavvia';

  @override
  String get systemInfo => 'Info Sistema';

  @override
  String get fileManager => 'File Manager';

  @override
  String get databaseMaintenance => 'Manutenzione Database';

  @override
  String get webTerminal => 'Terminale Web';

  @override
  String get tooltipOpenMenu => 'Apri menu';

  @override
  String get tooltipRefreshData => 'Aggiorna dati';

  @override
  String get tooltipPreviousDay => 'Giorno precedente';

  @override
  String get tooltipNextDay => 'Giorno successivo';

  @override
  String get tooltipPreviousWeek => 'Settimana precedente';

  @override
  String get tooltipNextWeek => 'Settimana successiva';

  @override
  String get tooltipDeleteRecording => 'Elimina registrazione';

  @override
  String get tooltipClearSearch => 'Cancella ricerca';

  @override
  String get tooltipCloseSearch => 'Chiudi ricerca';

  @override
  String get tooltipSearch => 'Cerca';

  @override
  String get tooltipPlay => 'Riproduci audio';

  @override
  String get tooltipPickDate => 'Scegli una data';

  @override
  String get passwordOptionalHint => 'Lascia vuoto se non impostata';

  @override
  String get systemStatus => 'Stato del Sistema';

  @override
  String get sysInfoUptime => 'Uptime';

  @override
  String get sysInfoDisk => 'Disco';

  @override
  String get sysInfoMemory => 'Memoria';

  @override
  String get sysInfoCpuTemp => 'Temp. CPU';

  @override
  String get sysInfoBranch => 'Branch';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commit in ritardo';
  }

  @override
  String get sysInfoLoadingError => 'Errore caricamento info di sistema.';

  @override
  String get enable => 'Abilita';

  @override
  String get disable => 'Disabilita';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Settimana $weekNumber - $year';
  }
}
