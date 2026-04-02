// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Monitorizarea păsărilor';

  @override
  String get home => 'Acasă';

  @override
  String get today => 'Astăzi';

  @override
  String get recordings => 'Înregistrări';

  @override
  String get liveStream => 'Flux live';

  @override
  String get liveSpectrogram => 'Spectrogramă live';

  @override
  String get speciesManagement => 'GESTIONAREA SPECIILOR';

  @override
  String get inclusionList => 'Lista de incluziune';

  @override
  String get exclusionList => 'Lista de excludere';

  @override
  String get analysisLog => 'Jurnal de analiză';

  @override
  String get openWebInterface => 'Deschide interfața web';

  @override
  String get loadingLiveSpectrogram => 'Se încarcă spectrograma live...';

  @override
  String get spectrogramInstruction =>
      'Dacă sunetul nu pornește automat, interacționați cu pagina sau verificați permisiunile browserului.';

  @override
  String get configureServerFirst =>
      'Configurați mai întâi adresa serverului în Setări';

  @override
  String get recentDetections => 'Detecții recente';

  @override
  String get latestDetection => 'Ultima detecție';

  @override
  String get audioFile => 'Fișier audio';

  @override
  String get playing => 'Se redă';

  @override
  String get noDetectionsToday => 'Nicio detecție astăzi';

  @override
  String get systemListening => 'Sistemul ascultă...';

  @override
  String get errorOccurred => 'A apărut o eroare';

  @override
  String get overview => 'Prezentare generală';

  @override
  String get detectionsAllTime => 'Detecții\ntotal';

  @override
  String get detectionsToday => 'Detecții\nastăzi';

  @override
  String get detectionsLastHour => 'Detecții\nultima oră';

  @override
  String get speciesToday => 'Specii\nastăzi';

  @override
  String get speciesAllTime => 'Specii\ntotal';

  @override
  String get statsLoadingError => 'Eroare la încărcarea statisticilor';

  @override
  String get todaysDetections => 'Detecțiile de astăzi';

  @override
  String get noDetectionsForSpecies =>
      'Nu există detecții pentru această specie';

  @override
  String get removeFilter => 'Scoateți filtrul';

  @override
  String detectionsCount(int count) {
    return '$count detectii';
  }

  @override
  String get filterDetections => 'Filtrează detecțiile';

  @override
  String get minimumConfidenceThreshold => 'Prag minim de încredere';

  @override
  String get reset => 'Resetare';

  @override
  String get apply => 'Aplică';

  @override
  String get charts => 'Grafice';

  @override
  String get daily => 'Zilnic';

  @override
  String get weekly => 'Săptămânal';

  @override
  String get monthly => 'Lunar';

  @override
  String get detectionsBySpecies => 'Detectări pe specii';

  @override
  String get hourlyDistribution => 'Distribuție orară';

  @override
  String get noChartAvailable => 'Niciun grafic disponibil';

  @override
  String get weeklyReport => 'Raport săptămânal';

  @override
  String get monthlyReport => 'Raport Lunar';

  @override
  String get newSpecies => 'Specie nouă';

  @override
  String get newFemale => 'Nou!';

  @override
  String get identifiedSpecies => 'Specii identificate';

  @override
  String get byDate => 'După dată';

  @override
  String get bySpecies => 'După specie';

  @override
  String exportToEbird(String date) {
    return 'Exportă către eBird ($date)';
  }

  @override
  String get noRecordings => 'Nicio înregistrare';

  @override
  String get deleteRecording => 'Șterge înregistrarea';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Doriți să ștergeți \'$name\' din $date $time?';
  }

  @override
  String get cancel => 'Anulează';

  @override
  String get delete => 'Șterge';

  @override
  String get noSpeciesFound => 'Nicio specie găsită.';

  @override
  String get unknown => 'Necunoscut';

  @override
  String get noRecordingsAvailable => 'Nu există înregistrări disponibile.';

  @override
  String get play => 'Redă';

  @override
  String get changeId => 'Schimbă ID';

  @override
  String get protect => 'Protejează';

  @override
  String get unprotect => 'Anulează protecția';

  @override
  String get download => 'Descarcă';

  @override
  String get cannotDownloadFile => 'Nu se poate descărca fișierul';

  @override
  String get errorLoading => 'Eroare la încărcare';

  @override
  String get autoDetectionsViaBirdNet =>
      'Detectări automate prin BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully => 'Descărcarea a început cu succes!';

  @override
  String get cannotDownloadCsv => 'Nu se poate descărca CSV.';

  @override
  String get zipDownloadInProgress => 'Descărcare ZIP în curs...';

  @override
  String get cannotOpenZipUrl =>
      'Nu se poate deschide adresa URL pentru descărcarea ZIP';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Serverul nu a returnat adresa URL de descărcare.';

  @override
  String get unknownError => 'Eroare necunoscută';

  @override
  String get serverError => 'Eroare de server';

  @override
  String get ebirdExport => 'Export eBird';

  @override
  String get generateCsvForEbird => 'Generează CSV pentru eBird';

  @override
  String get downloadAudioZip => 'Generați fișiere ZIP audio pentru eBird';

  @override
  String get close => 'Închide';

  @override
  String get continueStep => 'Continuă';

  @override
  String get back => 'Înapoi';

  @override
  String get review => 'Revizuire';

  @override
  String get configuration => 'Configurație';

  @override
  String get summary => 'Rezumat';

  @override
  String get autoRemoveLessThan80 => 'Eliminați automat <80%';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Specii citite: $totalSpecies | Apariții: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count detectii';
  }

  @override
  String get protocol => 'Protocol';

  @override
  String get stationaryPoint => 'Staționar - Punct fix';

  @override
  String get nocturnalFlightCall => 'Sunet de zbor nocturn (NFC)';

  @override
  String get incidental => 'Întîmplător';

  @override
  String get localityName => 'Nume localitate *';

  @override
  String get requiredField => 'Câmp obligatoriu';

  @override
  String get numberOfObservers => 'Număr de observatori';

  @override
  String get additionalComments => 'Comentarii suplimentare';

  @override
  String get includeAudioFileNamesInComments =>
      'Include numele fișierelor audio în comentarii';

  @override
  String get readyForExport => 'Gata pentru export';

  @override
  String get totalUniqueSpecies => 'Total de specii (unic)';

  @override
  String get hourlyModeledChecklists => 'Liste de verificare modelate pe oră';

  @override
  String get averageConfidence => 'Încredere medie';

  @override
  String get wizardInfoText =>
      'Prin apăsarea \'Generare CSV\', fișierul va fi compilat împărțind posturile pe oră, gata pentru a fi încărcat pe eBird.';

  @override
  String get statistics => 'Statistici';

  @override
  String get systemLogs => 'Jurnale de sistem';

  @override
  String get systemTools => 'Instrumente de sistem';

  @override
  String get systemControls => 'Controale de sistem';

  @override
  String get restart => 'Repornire';

  @override
  String get restartRaspberryPi => 'Reporniți Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Sigur doriți să reporniți sistemul?';

  @override
  String get update => 'Actualizare';

  @override
  String get updateBirdNetPi =>
      'Actualizați BirdNET-Pi la cea mai recentă versiune';

  @override
  String get doYouWantToUpdateBirdNet => 'Doriți să actualizați BirdNET-Pi?';

  @override
  String get shutdown => 'Oprire';

  @override
  String get shutdownRaspberryPi => 'Închideți Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Sunteți sigur că doriți să opriți sistemul?';

  @override
  String get clearAllData => 'Șterge toate datele';

  @override
  String get removeAllRecordingsAndDetections =>
      'Eliminați toate înregistrările și detecțiile';

  @override
  String get warningAllDataWillBeDeleted =>
      'AVERTISMENT: Toate datele vor fi șterse definitiv. Continua?';

  @override
  String get services => 'Servicii';

  @override
  String get liveAudioStream => 'Flux audio live';

  @override
  String get birdNetAnalysis => 'Analiza BirdNET';

  @override
  String get birdNetRecording => 'Înregistrare BirdNET';

  @override
  String get birdNetLog => 'BirdNET Jurnal';

  @override
  String get chartViewer => 'Vizualizator de diagrame';

  @override
  String get spectrogram => 'Spectrograma';

  @override
  String get quickActions => 'Acțiuni rapide';

  @override
  String get stopServices => 'Opriți serviciile';

  @override
  String get restartServices => 'Reporniți Serviciile';

  @override
  String get confirm => 'Confirmă';

  @override
  String get execution => 'Execuţie:';

  @override
  String get commandExecuted => '✅ Comandă executată';

  @override
  String errorMsg(String error) {
    return '❌ Eroare: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Eroare $error';
  }

  @override
  String get settings => 'Setări';

  @override
  String get basicSettings => 'Setări de bază';

  @override
  String get basicSettingsSubtitle =>
      'Configurați ora, locația, limba și notificările.';

  @override
  String get advancedSettings => 'Setări avansate';

  @override
  String get advancedSettingsSubtitle =>
      'Configurați sunetul, confidențialitatea, gestionarea discurilor și multe altele.';

  @override
  String get connection => 'Conexiune';

  @override
  String get birdNetPiServerAddress => 'Adresă server BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Introdu adresa IP sau numele de gazdă al Raspberry Pi';

  @override
  String get testInProgress => 'Test în curs...';

  @override
  String get saveAndTestConnection => 'Salvați și testați conexiunea';

  @override
  String get deviceInformation => 'Informații dispozitiv';

  @override
  String get loading => 'Se încarcă...';

  @override
  String get notConnected => 'Neconectat';

  @override
  String get configureServerAddress => 'Configurați adresa serverului';

  @override
  String get latitude => 'Latitudine';

  @override
  String get longitude => 'Longitudine';

  @override
  String get locality => 'Localitate';

  @override
  String get stateProvince => 'Stat/Provincie';

  @override
  String get countryCode => 'Cod țară';

  @override
  String get information => 'Informații';

  @override
  String get appVersion => 'Versiunea 1.0.0';

  @override
  String get appDescription =>
      'Aplicație însoțitoare pentru BirdNET-Pi. Monitorizați detectarea păsărilor de la Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Conectat la $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Nu se poate conecta la $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Eroare la încărcarea setărilor: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Setările de bază au fost salvate';

  @override
  String get errorWhileSaving => 'Eroare la salvare';

  @override
  String exceptionDuringSave(String error) {
    return 'Excepție în timpul salvării: $error';
  }

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Selectați un model:';

  @override
  String get speciesRangeModel => 'Gama speciilor model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Pragul de frecvență de apariție a speciilor [0,0005, 0,99]:';

  @override
  String get location => 'Locație';

  @override
  String get siteName => 'Nume site:';

  @override
  String get latitudeInput => 'Latitudine:';

  @override
  String get longitudeInput => 'Longitudine:';

  @override
  String get birdWeatherToken => 'Token BirdWeather:';

  @override
  String get notificationsApprise => 'Notificări (Apprise)';

  @override
  String get appriseConfig => 'Configurarea notificărilor Appprise:';

  @override
  String get notificationTitle => 'Titlu notificare:';

  @override
  String get notificationBody => 'Mesaj notificare:';

  @override
  String get notifyNewInfrequent =>
      'Notificați fiecare nouă depistare a speciilor rare';

  @override
  String get notifyFirstDetectionOfDay =>
      'Anunțați fiecare specie prima depistare a zilei';

  @override
  String get notifyEachNewDetection => 'Notifică fiecare detecție nouă';

  @override
  String get sendWeeklyReport => 'Trimite raport săptămânal';

  @override
  String get minTimeBetweenNotifications =>
      'Timp minim între notificări ale aceleiași specii (sec):';

  @override
  String get excludeTheseSpecies =>
      'Excludeți aceste specii (separate prin virgulă):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Notificați NUMAI pentru aceste specii (separate prin virgulă):';

  @override
  String get imageSource => 'Sursa imaginii';

  @override
  String get imageProvider => 'Furnizor de imagini:';

  @override
  String get flickrApiKey => 'Cheia API Flickr:';

  @override
  String get flickrFilterEmail =>
      'Căutați numai fotografii de la acest utilizator Flickr:';

  @override
  String get localization => 'Localizare';

  @override
  String get databaseLanguage => 'Limba bazei de date:';

  @override
  String get otherInfo => 'Alte info';

  @override
  String get infoSite => 'Site de informații:';

  @override
  String get themeWeb => 'Temă grafică (Web)';

  @override
  String get themeLight => 'Aprinde';

  @override
  String get themeDark => 'Întuneric';

  @override
  String get colorScheme => 'Schemă de culori:';

  @override
  String get sfThreshHelp =>
      'Această valoare este utilizată de model pentru a constrânge lista de specii posibile pe care va încerca să le detecteze, având în vedere frecvența minimă de apariție. Un prag de 0,03 înseamnă că, pentru ca o specie să fie inclusă în această listă, trebuie să fie văzută, în medie, pe cel puțin 3% din listele de verificare eBird trimise istoric pentru lat/lon/săptămâna curentă a anului. Deci, cu cât pragul este mai mic, cu atât specia pe care o va include mai rară.';

  @override
  String get birdWeatherHelp =>
      'BirdWeather este o hartă a vremii pentru sunetele păsărilor. Stațiile din întreaga lume furnizează fluxuri audio și video către BirdWeather, unde acestea sunt apoi analizate de BirdNET și comparate cu datele eBird Grid. NOTĂ: Folosind simbolul BirdWeather, sunteți de acord să vă împărtășiți peisajele sonore și detectările cu BirdWeather.';

  @override
  String get flickrHelp =>
      'Setați-vă cheia API Flickr pentru a activa afișarea imaginilor cu păsări lângă detectări. \'Căutați doar fotografiile de la acest utilizator Flickr\' permite filtrarea după un anumit cont de e-mail.';

  @override
  String get databaseLangHelp =>
      'Modificați acest lucru doar la configurarea inițială!';

  @override
  String get infoSiteHelp =>
      'Selectați de unde să extrageți informații suplimentare despre specii. allaboutbirds.org este implicit; ebird.org are mai multe specii europene.';

  @override
  String get none => 'Niciuna';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Setările avansate au fost salvate';

  @override
  String get privacyRecordings => 'Confidențialitate a înregistrărilor';

  @override
  String get privacyThreshold => 'Pragul de confidențialitate [0, 99]:';

  @override
  String get diskSpaceManagement => 'Gestionare spațiu disc';

  @override
  String get whenDiskIsFull => 'Când discul este plin:';

  @override
  String get purgeCapacity => 'Capacitate de purjare [prag %]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max fișiere de păstrat pe specie (0 = dezactivare):';

  @override
  String get audioSettings => 'Setări audio';

  @override
  String get alsaInputCaptureDevice =>
      'Dispozitiv de captură de intrare ALSA (placă de sunet):';

  @override
  String get numberOfAudioChannels => 'Numărul de canale audio de extras din:';

  @override
  String get overlap => 'Suprapunere (sec) [0, 2.9]:';

  @override
  String get audioFormat => 'Format audio:';

  @override
  String get recordingLength => 'Lungime înregistrare (sec):';

  @override
  String get extractionLength => 'Lungime extracție (sec):';

  @override
  String get rtspAudioSharing => 'Partajare audio RTSP';

  @override
  String get shareLiveAudioStream =>
      'URL flux RTSP (lăsați gol pentru dezactivare)';

  @override
  String get playAudioStreamThroughWebUi =>
      'Redați fluxul audio prin interfața de utilizare web?';

  @override
  String get caddyPassword => 'Parolă Caddy';

  @override
  String get appPassword => 'Parolă aplicație:';

  @override
  String get customLogoImage => 'Logo personalizat';

  @override
  String get customImageUrl => 'Adresa URL a imaginii personalizate:';

  @override
  String get customImageTitle => 'Titlu imagine personalizat:';

  @override
  String get birdNetLiteModelSettings => 'Setări model BirdNET-Lite';

  @override
  String get confidenceThreshold => 'Pragul de încredere [0, 0,99]:';

  @override
  String get sensitivity => 'Sensibilitate [0,5, 1,5]:';

  @override
  String get otherSettings => 'Alte setări';

  @override
  String get silenceUpdateIndicator =>
      'Silențiază indicatorul \'Actualizare disponibilă\'.';

  @override
  String get automaticUpdate => 'Actualizare automată';

  @override
  String get saveRawSpectrograms => 'Salvează spectrograme brute';

  @override
  String get generateLdfcsStandard => 'LDFCS (Termic standard)';

  @override
  String get generateLdfcsIndices => 'LDFCS (Indici acustici)';

  @override
  String get loggingLevels => 'Niveluri jurnalizare';

  @override
  String get birdnetRecordingService => 'Serviciul de înregistrare BirdNET:';

  @override
  String get spectrogramViewerService => 'Serviciul Spectrogram Viewer:';

  @override
  String get liveAudioStreamService => 'Serviciu de flux audio live:';

  @override
  String get speciesListsManagement => 'Gestionare liste specii';

  @override
  String get inclusion => 'Incluziune';

  @override
  String get exclusion => 'Excludere';

  @override
  String get whitelist => 'Lista albă';

  @override
  String get speciesAlreadyInList => 'Specia este deja în listă';

  @override
  String get listSavedSuccessfully => 'Lista a fost salvată';

  @override
  String get errorSavingList => 'Eroare la salvarea listei';

  @override
  String errorLoadingList(String error) {
    return 'Eroare la încărcarea listei:\\n$error';
  }

  @override
  String get retry => 'Reîncearcă';

  @override
  String get searchSpeciesHint =>
      'Căutați specii (de exemplu, Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Se încarcă speciile...';

  @override
  String get errorLoadingSpecies => 'Eroare la încărcarea speciilor';

  @override
  String get noSpeciesInThisList => 'Nicio specie în această listă.';

  @override
  String get removeFromList => 'Elimină din listă';

  @override
  String get saving => 'Se salvează...';

  @override
  String get save => 'Salvează';

  @override
  String get loginRequired => 'Autentificare necesară';

  @override
  String get loginTitle => 'Autentificare';

  @override
  String get loginSubtitle =>
      'Introduceți acreditările pentru a accesa funcțiile protejate.';

  @override
  String get username => 'Utilizator';

  @override
  String get password => 'Parolă';

  @override
  String get loginEmptyError =>
      'Vă rugăm să introduceți numele de utilizator și parola';

  @override
  String get loginInvalidError => 'Acreditări nevalide';

  @override
  String get authenticated => 'Autentificat';

  @override
  String get signIn => 'Autentificare';

  @override
  String get loggedInMessage => 'Momentan sunteți autentificat.';

  @override
  String get logout => 'Deconectare';

  @override
  String get login => 'Autentificare';

  @override
  String get audioStream => 'Flux audio';

  @override
  String get pressPlayToListen => 'Apasă redare pentru a asculta';

  @override
  String get loginToStart => 'Conectați-vă cu 🔒 pentru a începe';

  @override
  String get streamRequiresAuth =>
      'Fluxul necesită autentificare. Atingeți pictograma 🔒 din dreapta sus pentru a vă conecta.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Activează sunetul';

  @override
  String get mute => 'Fără sunet';

  @override
  String get resume => 'Reluare';

  @override
  String get pause => 'Pauză';

  @override
  String get autoRefresh => 'Actualizare automată';

  @override
  String get pressPlaySpectrogram =>
      'Apăsați ▶ pentru a vizualiza spectrograma';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Apăsați ▶ pentru a porni spectrograma în timp real';

  @override
  String get loginThenPlay => 'Conectați-vă cu 🔒 apoi apăsați ▶';

  @override
  String get currentAnalyzing => 'Se analizează acum';

  @override
  String get accessRestricted => 'Acces restricționat';

  @override
  String get loginToAccessSection =>
      'Autentifică-te pentru a accesa această secțiune.';

  @override
  String get iframeNotSupported =>
      'Iframe-urile sunt strict acceptate pe versiunea web.';

  @override
  String get error => 'Eroare';

  @override
  String get otherUtilities => 'Alte utilități';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrograma nu este disponibilă';

  @override
  String get ebirdCountIdentifier => 'Nr';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Staţionar';

  @override
  String get ebirdProtocolIncidental => 'Întîmplător';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Reîmprospătare';

  @override
  String get tooltipStop => 'Oprește';

  @override
  String get tooltipStart => 'Pornește';

  @override
  String get tooltipRestart => 'Repornește';

  @override
  String get systemInfo => 'Informații sistem';

  @override
  String get fileManager => 'Manager fișiere';

  @override
  String get databaseMaintenance => 'Întreținere bază de date';

  @override
  String get webTerminal => 'Terminal web';

  @override
  String get tooltipOpenMenu => 'Deschide meniul';

  @override
  String get tooltipRefreshData => 'Actualizează datele';

  @override
  String get tooltipPreviousDay => 'Ziua anterioară';

  @override
  String get tooltipNextDay => 'A doua zi';

  @override
  String get tooltipPreviousWeek => 'Săptămâna anterioară';

  @override
  String get tooltipNextWeek => 'Săptămâna viitoare';

  @override
  String get tooltipDeleteRecording => 'Ștergeți înregistrarea';

  @override
  String get tooltipClearSearch => 'Ștergeți căutarea';

  @override
  String get tooltipCloseSearch => 'Închide căutarea';

  @override
  String get tooltipSearch => 'Caută';

  @override
  String get tooltipPlay => 'Redă audio';

  @override
  String get tooltipPickDate => 'Alege data';

  @override
  String get passwordOptionalHint => 'Lăsați gol dacă nu este setat';

  @override
  String get systemStatus => 'Stare sistem';

  @override
  String get sysInfoUptime => 'Timp funcționare';

  @override
  String get sysInfoDisk => 'Disc';

  @override
  String get sysInfoMemory => 'Memorie';

  @override
  String get sysInfoCpuTemp => 'Temp. CPU';

  @override
  String get sysInfoBranch => 'Ramura';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count se comite în urmă';
  }

  @override
  String get sysInfoLoadingError =>
      'Nu s-au încărcat informațiile despre sistem.';

  @override
  String get enable => 'Activează';

  @override
  String get disable => 'Dezactivează';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Săptămâna $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Grupare după Specii';

  @override
  String get groupByTime => 'Grupați după timp';

  @override
  String get readOnWikipedia => 'Citiți pe Wikipedia';

  @override
  String get loadingWikipedia => 'Se încarcă informații de pe Wikipedia...';

  @override
  String get noWikipediaInfo =>
      'Nu s-au găsit informații pe Wikipedia pentru această specie.';

  @override
  String get searchSpecies => 'Caută specii...';

  @override
  String get noResultsFound => 'Nu s-au găsit rezultate';

  @override
  String get noSpeciesDetected => 'Nicio specie detectată';

  @override
  String get species => 'Specii';

  @override
  String get detections => 'Detecții';

  @override
  String get maxConfidence => 'Confidență Max.';

  @override
  String get topSpecies => 'Specie de top';

  @override
  String get fromDate => 'De la data';

  @override
  String get toDate => 'Până la data';

  @override
  String get fromTime => 'De la ora';

  @override
  String get toTime => 'Până la ora';

  @override
  String get byPeriod => 'După perioadă';

  @override
  String get selectSpecies => 'Selectați Specii';

  @override
  String get allSpecies => 'Toate Speciile';

  @override
  String get search => 'Căutare';

  @override
  String occurrenceCount(int count) {
    return 'n. $count';
  }

  @override
  String get firstSeen => 'Văzut prima dată';

  @override
  String get lastSeen => 'Văzut ultima dată';

  @override
  String get firstSeenPeriod => 'Prima vedere (perioada)';

  @override
  String get lastSeenPeriod => 'Ultima vedere (perioada)';

  @override
  String get thirtyDaysTrend => 'Tendință 30 zile';

  @override
  String get avgConfidence => 'Încredere medie';

  @override
  String get mySpecies => 'Speciile Mele';

  @override
  String get bestDetection => 'Cea Mai Bună Detecție';

  @override
  String get externalInfoLink => 'Informații Externe';

  @override
  String get includedListInfo =>
      'Atenție! Dacă această listă conține ORICE specie, sistemul va recunoaște DOAR acele specii. Păstrați această listă GOLĂ dacă nu sunteți interesat DOAR în detectarea unor specii specifice.';

  @override
  String get excludedListInfo =>
      'Odată ce specia dorită a fost evidențiată, faceți clic pe ea și apoi faceți clic pe ADAUGĂ pentru a o exclude.';

  @override
  String get whitelistInfo =>
      'Odată ce specia dorită a fost evidențiată, faceți clic pe ea și apoi faceți clic pe ADAUGĂ pentru a o include în lista albă. Va fi detectat chiar dacă este sub pragul definit (Species Occurrence Frequency Threshold) în setări. Acesta nu este un mod de lucru recomandat: este preferabil să testați mai întâi ambele modele (v1 și v2.4).';

  @override
  String get overnightRange => 'Interval nocturn (traversează miezul nopții)';

  @override
  String get resetFilters => 'Resetați filtrele';

  @override
  String invalidValueRange(num min, num max) {
    return 'Valoarea trebuie să fie între $min și $max';
  }

  @override
  String get speciesListTester => 'Tester pentru liste de specii';

  @override
  String get previewSpeciesList => 'Previzualizează Lista speciilor';

  @override
  String get threshold => 'Prag:';

  @override
  String get sfThreshHelpExtended =>
      'Această valoare este utilizată de model pentru a constrânge lista de specii posibile pe care va încerca să le detecteze, având în vedere frecvența minimă de apariție. Un prag de 0,03 înseamnă că, pentru ca o specie să fie inclusă în această listă, trebuie să fie văzută, în medie, pe cel puțin 3% din listele de verificare eBird trimise istoric pentru lat/lon/săptămâna curentă a anului. Deci, cu cât pragul este mai mic, cu atât specia pe care o va include mai rară.\n\n[Rescriere tehnică aprofundată aici](https://github.com/kahst/BirdNET-Analyzer/discussions/234)';

  @override
  String get sfThreshTesterHint =>
      'Dacă doriți să modificați această valoare de prag și să vedeți ce specii ajung pe listă, puteți utiliza instrumentul de testare a listei speciilor de mai jos.';

  @override
  String get sfThreshTesterLegacyHint =>
      'Vă rugăm să faceți clic pe \'Actualizare setări\' în partea de jos a acestei pagini pentru a instala fișierul de etichetă corespunzător, apoi reveniți aici și veți putea folosi Testerul pentru liste de specii.';

  @override
  String get appriseConfigHelp =>
      'Notificările Appprise pot fi configurate și activate pentru peste 90 de servicii de notificare. Fiecare serviciu ar trebui să fie pe propria linie.\n\n**Exemple:**\n- `mailto://<utilizator>:<parolă>@gmail.com`\n- `tgram://<bot_token>/<chat_id>`\n- `discord://<WebhookID>/<WebhookToken>`\n\n[Full Appris Wiki](https://github.com/caronc/apprise/wiki)';

  @override
  String get notificationVarsHelp =>
      'Puteți utiliza următoarele variabile în titlu și corpul dvs.:\n\n- `\$sciname`: Nume științific\n- `\$comname`: Nume comun\n- `\$confidencecepct`: Scorul de încredere ca procent\n- `\$listenurl`: Link către detectarea\n- `\$date`, `\$time`, `\$week`: informații despre dată/ora\n- `\$image`: imaginea speciei\n- `\$reason`: Motivul notificării';

  @override
  String get excludeSpeciesHelp =>
      'Excludeți aceste specii din notificări (nume comune separate prin virgulă). Exemplu: \'Mourning Dove, American Crow\'.';

  @override
  String get includeSpeciesHelp =>
      'Notificați NUMAI pentru aceste specii (nume comune separate prin virgulă).';

  @override
  String get serverUrl => 'Adresa URL a serverului';

  @override
  String get pleaseEnterUrl =>
      'Vă rugăm să introduceți adresa URL a unui server';

  @override
  String get serverUnreachable =>
      'Server inaccesibil. Vă rugăm să verificați adresa și să încercați din nou.';

  @override
  String get welcomeToBirdNetPi => 'Bun venit la BirdNET-Pi';

  @override
  String get enterServerUrlDescription =>
      'Pentru a începe, introduceți adresa URL a serverului dumneavoastră BirdNET-Pi.';

  @override
  String get connect => 'Conectați-vă';

  @override
  String get serverUpdatedSuccessfully =>
      'Serverul a fost actualizat cu succes!';

  @override
  String get serverInformation => 'Informații server';

  @override
  String get noData => 'Fără date';

  @override
  String get trends => 'Tendințe';

  @override
  String get selectSpeciesToViewTrends =>
      'Selectați o specie pentru a vedea tendințele';

  @override
  String speciesDetailsError(String error) {
    return 'Eroare detalii despre specie: $error';
  }

  @override
  String get fromLabel => 'Din';

  @override
  String get toLabel => 'Către';

  @override
  String get exportMenuLabel => 'Export';

  @override
  String get exportDataTitle => 'Exportați date';

  @override
  String get ebirdExportDesc =>
      'Flux ghidat pentru trimiterea listelor de verificare.';

  @override
  String get csvExport => 'Exportați în CSV';

  @override
  String get csvExportDesc => 'Date brute filtrate după dată și specie.';

  @override
  String get audioZipExport => 'Export audio zilnic';

  @override
  String get audioZipExportDesc =>
      'Solicitați un zip al tuturor înregistrărilor.';

  @override
  String get zipManager => 'Administrare zip';

  @override
  String get zipManagerDesc =>
      'Descărcați sau ștergeți fișierele zip de pe server.';

  @override
  String get startDate => 'Data de începere';

  @override
  String get endDate => 'Data de încheiere';

  @override
  String get filterBySpeciesOptional => 'Filtrați după specie (opțional)';

  @override
  String get selectedSpecies => 'Specii alese';

  @override
  String get emptyIncludeAllSpecies =>
      '* Dacă este gol: include toate speciile';

  @override
  String get executeExport => 'EXECUTĂ EXPORT';

  @override
  String get chooseFullDayText =>
      'Alegeți ziua pentru care doriți să exportați înregistrările:';

  @override
  String get requestZipGeneration => 'CERERE GENERARE ZIP';

  @override
  String get zipGenerationWarning =>
      '* Operația poate dura câteva minute. Puteți descărca fișierul zip din secțiunea „Gestionare zip”.';

  @override
  String get zipGenerationStarted =>
      'Generarea ZIP a început. Aceasta va fi disponibilă în secțiunea Zip Manager.';

  @override
  String get refreshList => 'Actualizează lista';

  @override
  String get downloadZip => 'Descărcați';

  @override
  String get filterSpecies => 'Filtru Specii';

  @override
  String get allSpeciesWillBeExported => 'Toate speciile vor fi exportate.';

  @override
  String get export => 'Export';

  @override
  String get hourlyDistributionDetections => 'Distribuție orară (detecții)';

  @override
  String get dayNightWeatherProfile => 'Profil zi/noapte (vreme)';

  @override
  String get dailyDetections => 'Detecții zilnice';

  @override
  String get temperatureUnitLabel => 'Temperatura (°C)';

  @override
  String get windSpeedUnitLabel => 'Viteza vântului (km/h)';

  @override
  String get densityMapSunInfo => 'Harta densității cu răsărit și apus';

  @override
  String get externalSheet => 'Fișă externă';

  @override
  String get totalAllTime => 'Total (toate datele)';

  @override
  String get detectionsLabel => 'Detecții';

  @override
  String get maxConfidenceLabel => 'Încredere maximă';

  @override
  String get averageConfidenceLabel => 'Încredere medie';

  @override
  String get dayLegend => 'Zi ☀️';

  @override
  String get nightLegend => 'Noapte 🌙';

  @override
  String get weatherClear => 'Senin';

  @override
  String get weatherCloudy => 'Noros';

  @override
  String get weatherFog => 'Ceață';

  @override
  String get weatherRain => 'Ploaie';

  @override
  String get weatherSnow => 'Zăpadă';

  @override
  String get weatherThunderstorm => 'Furtună';

  @override
  String get loadingAudioLabel => 'Se încarcă audio...';

  @override
  String get errorLoadingAudioLabel => 'Eroare la încărcare';

  @override
  String get detectionsTotal => 'Detecții';

  @override
  String get ebirdExportError => 'Eroare generare ZIP.';

  @override
  String get temperature => 'Temperatură';

  @override
  String get wind => 'Vânt';

  @override
  String get dateLabel => 'Dată';

  @override
  String get notAvailable => 'N/A';

  @override
  String get ldfcsStandardTitle => 'Spectrogramă de lungă durată (Standard)';

  @override
  String get ldfcsIndicesTitle =>
      'Spectrogramă de lungă durată (Indici acustici)';

  @override
  String get ldfcsDescription => 'Vizualizarea înregistrării pe 24 de ore';

  @override
  String get weeklyLdfcsStandard => 'LDFCS săptămânal (Standard)';

  @override
  String get weeklyLdfcsIndices => 'LDFCS săptămânal (Indici acustici)';

  @override
  String get monthlyLdfcsStandard => 'LDFCS lunar (Standard)';

  @override
  String get monthlyLdfcsIndices => 'LDFCS lunar (Indici acustici)';

  @override
  String get dailyInsightsTitle => 'Statistici zilnice';

  @override
  String get weeklyInsightsTitle => 'Statistici săptămânale';

  @override
  String get monthlyInsightsTitle => 'Statistici lunare';

  @override
  String get hourlyActivityTitle => 'Activitate orară';

  @override
  String get speciesDiversityTitle => 'Diversitatea speciilor';

  @override
  String get others => 'Altele';

  @override
  String get detShort => 'DET';
}
