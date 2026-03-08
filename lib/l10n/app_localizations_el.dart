// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Παρακολούθηση Πουλιών';

  @override
  String get home => 'Αρχική';

  @override
  String get today => 'Σήμερα';

  @override
  String get recordings => 'Ηχογραφήσεις';

  @override
  String get liveStream => 'Ζωντανή Ροή';

  @override
  String get liveSpectrogram => 'Ζωντανό Φασματογράφημα';

  @override
  String get speciesManagement => 'ΔΙΑΧΕΙΡΙΣΗ ΕΙΔΩΝ';

  @override
  String get inclusionList => 'Λίστα Συμπερίληψης';

  @override
  String get exclusionList => 'Λίστα Εξαίρεσης';

  @override
  String get analysisLog => 'Αρχείο Καταγραφής Ανάλυσης';

  @override
  String get openWebInterface => 'Άνοιγμα Διασύνδεσης Ιστού';

  @override
  String get loadingLiveSpectrogram => 'Φόρτωση ζωντανού φασματογραφήματος...';

  @override
  String get spectrogramInstruction =>
      'Εάν ο ήχος δεν ξεκινήσει αυτόματα, αλληλεπιδράστε με τη σελίδα ή ελέγξτε τις άδειες του προγράμματος περιήγησης.';

  @override
  String get configureServerFirst =>
      'Ρυθμίστε πρώτα τη διεύθυνση του διακομιστή στις Ρυθμίσεις';

  @override
  String get recentDetections => 'Πρόσφατες Ανιχνεύσεις';

  @override
  String get latestDetection => 'Τελευταία ανίχνευση';

  @override
  String get audioFile => 'Αρχείο Ήχου';

  @override
  String get playing => 'Αναπαραγωγή';

  @override
  String get noDetectionsToday => 'Καμία ανίχνευση σήμερα';

  @override
  String get systemListening => 'Το σύστημα ακούει...';

  @override
  String get errorOccurred => 'Παρουσιάστηκε σφάλμα';

  @override
  String get overview => 'Επισκόπηση';

  @override
  String get detectionsAllTime => 'Ανιχνεύσεις\nσυνολικά';

  @override
  String get detectionsToday => 'Ανιχνεύσεις\nσήμερα';

  @override
  String get detectionsLastHour => 'Ανιχνεύσεις\nτελευταία ώρα';

  @override
  String get speciesToday => 'Είδη\nσήμερα';

  @override
  String get speciesAllTime => 'Είδη\nσυνολικά';

  @override
  String get statsLoadingError => 'Σφάλμα φόρτωσης στατιστικών';

  @override
  String get todaysDetections => 'Σημερινές Ανιχνεύσεις';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count ανιχνεύσεις';
  }

  @override
  String get filterDetections => 'Φιλτράρισμα ανιχνεύσεων';

  @override
  String get minimumConfidenceThreshold => 'Ελάχιστο όριο εμπιστοσύνης';

  @override
  String get reset => 'Επαναφορά';

  @override
  String get apply => 'Εφαρμογή';

  @override
  String get charts => 'Διαγράμματα';

  @override
  String get daily => 'Ημερήσια';

  @override
  String get weekly => 'Εβδομαδιαία';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Δεν υπάρχει διαθέσιμο διάγραμμα';

  @override
  String get weeklyReport => 'Εβδομαδιαία Αναφορά';

  @override
  String get newSpecies => 'Νέο είδος';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Ταυτοποιημένα είδη';

  @override
  String get byDate => 'Ανά ημερομηνία';

  @override
  String get bySpecies => 'Ανά είδος';

  @override
  String exportToEbird(String date) {
    return 'Εξαγωγή στο eBird ($date)';
  }

  @override
  String get noRecordings => 'Δεν υπάρχουν ηχογραφήσεις';

  @override
  String get deleteRecording => 'Διαγραφή ηχογράφησης';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Ακύρωση';

  @override
  String get delete => 'Διαγραφή';

  @override
  String get noSpeciesFound => 'Δεν βρέθηκαν είδη.';

  @override
  String get unknown => 'Άγνωστο';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Αναπαραγωγή';

  @override
  String get changeId => 'Αλλαγή ID';

  @override
  String get protect => 'Προστασία';

  @override
  String get unprotect => 'Κατάργηση προστασίας';

  @override
  String get download => 'Λήψη';

  @override
  String get cannotDownloadFile => 'Αδυναμία λήψης αρχείου';

  @override
  String get errorLoading => 'Σφάλμα φόρτωσης';

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
  String get ebirdExport => 'Εξαγωγή eBird';

  @override
  String get generateCsvForEbird => 'Δημιουργία CSV για eBird';

  @override
  String get downloadAudioZip => 'Λήψη ήχου (ZIP)';

  @override
  String get close => 'Κλείσιμο';

  @override
  String get continueStep => 'Συνέχεια';

  @override
  String get back => 'Πίσω';

  @override
  String get review => 'Επανεξέταση';

  @override
  String get configuration => 'Διαμόρφωση';

  @override
  String get summary => 'Σύνοψη';

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
  String get protocol => 'Πρωτόκολλο';

  @override
  String get stationaryPoint => 'Στατικό - Συγκεκριμένο σημείο';

  @override
  String get nocturnalFlightCall => 'Νυχτερινή κλήση πτήσης (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Όνομα τοποθεσίας *';

  @override
  String get requiredField => 'Υποχρεωτικό πεδίο';

  @override
  String get numberOfObservers => 'Αριθμός παρατηρητών';

  @override
  String get additionalComments => 'Πρόσθετα σχόλια';

  @override
  String get includeAudioFileNamesInComments =>
      'Συμπερίληψη ονομάτων αρχείων ήχου στα σχόλια';

  @override
  String get readyForExport => 'Έτοιμο για εξαγωγή';

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
  String get statistics => 'Στατιστικά';

  @override
  String get systemLogs => 'Καταγραφές Συστήματος';

  @override
  String get systemTools => 'Εργαλεία Συστήματος';

  @override
  String get systemControls => 'Στοιχεία Ελέγχου Συστήματος';

  @override
  String get restart => 'Επανεκκίνηση';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Ενημέρωση';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Τερματισμός';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Εκκαθάριση όλων των δεδομένων';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Υπηρεσίες';

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
  String get spectrogram => 'Φασματογράφημα';

  @override
  String get quickActions => 'Γρήγορες ενέργειες';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Επιβεβαίωση';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Η εντολή εκτελέστηκε';

  @override
  String errorMsg(String error) {
    return '❌ Σφάλμα: $error';
  }

  @override
  String get species => 'Είδη';

  @override
  String get noSpeciesDetected => 'Δεν ανιχνεύθηκαν είδη';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Ανιχνεύσεις';

  @override
  String get maxConfidence => 'Μέγιστη εμπιστοσύνη';

  @override
  String get searchSpecies => 'Αναζήτηση ειδών...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Ρυθμίσεις';

  @override
  String get basicSettings => 'Βασικές Ρυθμίσεις';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Προχωρημένες Ρυθμίσεις';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Σύνδεση';

  @override
  String get birdNetPiServerAddress => 'Διεύθυνση Διακομιστή BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Πληροφορίες Συσκευής';

  @override
  String get loading => 'Φόρτωση...';

  @override
  String get notConnected => 'Δεν υπάρχει σύνδεση';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Γεωγραφικό πλάτος';

  @override
  String get longitude => 'Γεωγραφικό μήκος';

  @override
  String get locality => 'Τοποθεσία';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Κωδικός χώρας';

  @override
  String get information => 'Πληροφορίες';

  @override
  String get appVersion => 'Έκδοση 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Συνδέθηκε στο $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Αδυναμία σύνδεσης στο $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Σφάλμα φόρτωσης ρυθμίσεων: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Οι βασικές ρυθμίσεις αποθηκεύτηκαν επιτυχώς';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Μοντέλο';

  @override
  String get selectAModel => 'Επιλέξτε μοντέλο:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Τοποθεσία';

  @override
  String get siteName => 'Όνομα τοποθεσίας:';

  @override
  String get latitudeInput => 'Γεωγραφικό πλάτος:';

  @override
  String get longitudeInput => 'Γεωγραφικό μήκος:';

  @override
  String get birdWeatherToken => 'Token BirdWeather:';

  @override
  String get notificationsApprise => 'Ειδοποιήσεις (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Τίτλος ειδοποίησης:';

  @override
  String get notificationBody => 'Κείμενο ειδοποίησης:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Ειδοποίηση για κάθε νέα ανίχνευση';

  @override
  String get sendWeeklyReport => 'Αποστολή εβδομαδιαίας αναφοράς';

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
  String get localization => 'Τοπικοποίηση';

  @override
  String get databaseLanguage => 'Γλώσσα βάσης δεδομένων:';

  @override
  String get otherInfo => 'Άλλες πληροφορίες';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Γραφικό Θέμα (Web)';

  @override
  String get colorScheme => 'Συνδυασμός χρωμάτων:';

  @override
  String get none => 'Κανένα';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Οι προχωρημένες ρυθμίσεις αποθηκεύτηκαν';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Διαχείριση χώρου δίσκου';

  @override
  String get whenDiskIsFull => 'Όταν ο δίσκος είναι γεμάτος:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Ρυθμίσεις ήχου';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Επικάλυψη (δευτ.) [0, 2.9]:';

  @override
  String get audioFormat => 'Μορφή ήχου:';

  @override
  String get recordingLength => 'Διάρκεια ηχογράφησης (δευτ.):';

  @override
  String get extractionLength => 'Διάρκεια εξαγωγής (δευτ.):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Κωδικός Caddy';

  @override
  String get appPassword => 'Κωδικός εφαρμογής:';

  @override
  String get customLogoImage => 'Προσαρμοσμένο λογότυπο';

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
  String get automaticUpdate => 'Αυτόματη ενημέρωση';

  @override
  String get saveRawSpectrograms => 'Αποθήκευση ακατέργαστων φασματογραφημάτων';

  @override
  String get loggingLevels => 'Επίπεδα καταγραφής';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Διαχείριση λιστών ειδών';

  @override
  String get inclusion => 'Συμπερίληψη';

  @override
  String get exclusion => 'Εξαίρεση';

  @override
  String get whitelist => 'Λίστα επιτρεπόμενων';

  @override
  String get speciesAlreadyInList => 'Το είδος υπάρχει ήδη στη λίστα';

  @override
  String get listSavedSuccessfully => 'Η λίστα αποθηκεύτηκε επιτυχώς';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Προσπάθεια ξανά';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Φόρτωση ειδών...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'Δεν υπάρχουν είδη σε αυτή τη λίστα.';

  @override
  String get removeFromList => 'Αφαίρεση από τη λίστα';

  @override
  String get saving => 'Αποθήκευση...';

  @override
  String get save => 'Αποθήκευση';

  @override
  String get loginRequired => 'Απαιτείται σύνδεση για αυτή την ενέργεια';

  @override
  String get loginTitle => 'Ταυτοποίηση';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Όνομα χρήστη';

  @override
  String get password => 'Κωδικός πρόσβασης';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Ταυτοποιήθηκε';

  @override
  String get signIn => 'Είσοδος';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Αποσύνδεση';

  @override
  String get login => 'Είσοδος';

  @override
  String get audioStream => 'Ροή ήχου';

  @override
  String get pressPlayToListen => 'Πατήστε αναπαραγωγή για να ακούσετε';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Κατάργηση σίγασης';

  @override
  String get mute => 'Σίγαση';

  @override
  String get resume => 'Συνέχιση';

  @override
  String get pause => 'Παύση';

  @override
  String get autoRefresh => 'Αυτόματη ανανέωση';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Αναλύεται τώρα';

  @override
  String get accessRestricted => 'Περιορισμένη πρόσβαση';

  @override
  String get loginToAccessSection =>
      'Συνδεθείτε για να αποκτήσετε πρόσβαση σε αυτή την ενότητα.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Σφάλμα';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Άλλα εργαλεία';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · $secondsδ';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram not available';

  @override
  String get ebirdCountIdentifier => 'Αρ';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationary';

  @override
  String get ebirdProtocolIncidental => 'Incidental';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Ανανέωση';

  @override
  String get tooltipStop => 'Διακοπή';

  @override
  String get tooltipStart => 'Έναρξη';

  @override
  String get tooltipRestart => 'Επανεκκίνηση';

  @override
  String get systemInfo => 'Πληροφορίες συστήματος';

  @override
  String get fileManager => 'Διαχειριστής αρχείων';

  @override
  String get databaseMaintenance => 'Συντήρηση βάσης δεδομένων';

  @override
  String get webTerminal => 'Τερματικό Ιστού';

  @override
  String get tooltipOpenMenu => 'Άνοιγμα μενού';

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
  String get tooltipSearch => 'Αναζήτηση';

  @override
  String get tooltipPlay => 'Αναπαραγωγή ήχου';

  @override
  String get tooltipPickDate => 'Επιλογή ημερομηνίας';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Κατάσταση συστήματος';

  @override
  String get sysInfoUptime => 'Χρόνος λειτουργίας';

  @override
  String get sysInfoDisk => 'Δίσκος';

  @override
  String get sysInfoMemory => 'Μνήμη';

  @override
  String get sysInfoCpuTemp => 'Θερμ. CPU';

  @override
  String get sysInfoBranch => 'Branch';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Ενεργοποίηση';

  @override
  String get disable => 'Απενεργοποίηση';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Εβδομάδα $weekNumber - $year';
  }
}
