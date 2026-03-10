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
  String get noDetectionsForSpecies =>
      'Δεν υπάρχουν ανιχνεύσεις για αυτό το είδος';

  @override
  String get removeFilter => 'Αφαιρέστε το φίλτρο';

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
  String get detectionsBySpecies => 'Ανιχνεύσεις ανά Είδη';

  @override
  String get hourlyDistribution => 'Ωριαία Διανομή';

  @override
  String get noChartAvailable => 'Δεν υπάρχει διαθέσιμο διάγραμμα';

  @override
  String get weeklyReport => 'Εβδομαδιαία Αναφορά';

  @override
  String get newSpecies => 'Νέο είδος';

  @override
  String get newFemale => 'Νέος!';

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
    return 'Θέλετε να διαγράψετε το \"$name\" από το $date $time;';
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
  String get noRecordingsAvailable => 'Δεν υπάρχουν διαθέσιμες εγγραφές.';

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
      'Αυτόματοι εντοπισμοί μέσω BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully => 'Η λήψη ξεκίνησε με επιτυχία!';

  @override
  String get cannotDownloadCsv => 'Δεν είναι δυνατή η λήψη του CSV.';

  @override
  String get zipDownloadInProgress => 'Λήψη ZIP σε εξέλιξη...';

  @override
  String get cannotOpenZipUrl =>
      'Δεν είναι δυνατό το άνοιγμα της διεύθυνσης URL για λήψη ZIP';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Ο διακομιστής δεν επέστρεψε τη διεύθυνση URL λήψης.';

  @override
  String get unknownError => 'Άγνωστο σφάλμα';

  @override
  String get serverError => 'Σφάλμα διακομιστή';

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
  String get autoRemoveLessThan80 => 'Αυτόματη αφαίρεση < 80%';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Είδος που διαβάζεται: $totalSpecies | Εμφανίσεις: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count ανιχνεύσεις';
  }

  @override
  String get protocol => 'Πρωτόκολλο';

  @override
  String get stationaryPoint => 'Στατικό - Συγκεκριμένο σημείο';

  @override
  String get nocturnalFlightCall => 'Νυχτερινή κλήση πτήσης (NFC)';

  @override
  String get incidental => 'Τυχαίος';

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
  String get totalUniqueSpecies => 'Συνολικά είδη (Μοναδικό)';

  @override
  String get hourlyModeledChecklists => 'Ώρια μοντελοποιημένες λίστες ελέγχου';

  @override
  String get averageConfidence => 'Μέση Εμπιστοσύνη';

  @override
  String get wizardInfoText =>
      'Πατώντας «Δημιουργία CSV», το αρχείο θα μεταγλωττιστεί χωρίζοντας τους σταθμούς ανά ώρα, έτοιμο για μεταφόρτωση στο eBird.';

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
  String get restartRaspberryPi => 'Επανεκκινήστε το Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Είστε βέβαιοι ότι θέλετε να επανεκκινήσετε το σύστημα;';

  @override
  String get update => 'Ενημέρωση';

  @override
  String get updateBirdNetPi =>
      'Ενημερώστε το BirdNET-Pi στην πιο πρόσφατη έκδοση';

  @override
  String get doYouWantToUpdateBirdNet => 'Θέλετε να ενημερώσετε το BirdNET-Pi;';

  @override
  String get shutdown => 'Τερματισμός';

  @override
  String get shutdownRaspberryPi => 'Τερματισμός του Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Είστε βέβαιοι ότι θέλετε να τερματίσετε τη λειτουργία του συστήματος;';

  @override
  String get clearAllData => 'Εκκαθάριση όλων των δεδομένων';

  @override
  String get removeAllRecordingsAndDetections =>
      'Καταργήστε όλες τις εγγραφές και ανιχνεύσεις';

  @override
  String get warningAllDataWillBeDeleted =>
      'ΠΡΟΕΙΔΟΠΟΙΗΣΗ: Όλα τα δεδομένα θα διαγραφούν οριστικά. Συνεχίζω;';

  @override
  String get services => 'Υπηρεσίες';

  @override
  String get liveAudioStream => 'Ζωντανή ροή ήχου';

  @override
  String get birdNetAnalysis => 'Ανάλυση BirdNET';

  @override
  String get birdNetRecording => 'Ηχογράφηση BirdNET';

  @override
  String get birdNetLog => 'Καταγραφή BirdNET';

  @override
  String get chartViewer => 'Πρόγραμμα προβολής γραφημάτων';

  @override
  String get spectrogram => 'Φασματογράφημα';

  @override
  String get quickActions => 'Γρήγορες ενέργειες';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Επανεκκινήστε τις Υπηρεσίες';

  @override
  String get confirm => 'Επιβεβαίωση';

  @override
  String get execution => 'Εκτέλεση:';

  @override
  String get commandExecuted => '✅ Η εντολή εκτελέστηκε';

  @override
  String errorMsg(String error) {
    return '❌ Σφάλμα: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Σφάλμα';
  }

  @override
  String get settings => 'Ρυθμίσεις';

  @override
  String get basicSettings => 'Βασικές Ρυθμίσεις';

  @override
  String get basicSettingsSubtitle =>
      'Διαμορφώστε την ώρα, την τοποθεσία, τη γλώσσα και τις ειδοποιήσεις.';

  @override
  String get advancedSettings => 'Προχωρημένες Ρυθμίσεις';

  @override
  String get advancedSettingsSubtitle =>
      'Διαμορφώστε τον ήχο, το απόρρητο, τη διαχείριση δίσκου και πολλά άλλα.';

  @override
  String get connection => 'Σύνδεση';

  @override
  String get birdNetPiServerAddress => 'Διεύθυνση Διακομιστή BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Εισαγάγετε τη διεύθυνση IP ή το όνομα κεντρικού υπολογιστή του Raspberry Pi σας';

  @override
  String get testInProgress => 'Δοκιμή σε εξέλιξη...';

  @override
  String get saveAndTestConnection => 'Αποθήκευση και δοκιμή σύνδεσης';

  @override
  String get deviceInformation => 'Πληροφορίες Συσκευής';

  @override
  String get loading => 'Φόρτωση...';

  @override
  String get notConnected => 'Δεν υπάρχει σύνδεση';

  @override
  String get configureServerAddress => 'Διαμορφώστε τη διεύθυνση διακομιστή';

  @override
  String get latitude => 'Γεωγραφικό πλάτος';

  @override
  String get longitude => 'Γεωγραφικό μήκος';

  @override
  String get locality => 'Τοποθεσία';

  @override
  String get stateProvince => 'Πολιτεία/Επαρχία';

  @override
  String get countryCode => 'Κωδικός χώρας';

  @override
  String get information => 'Πληροφορίες';

  @override
  String get appVersion => 'Έκδοση 1.0.0';

  @override
  String get appDescription =>
      'Συνοδευτική εφαρμογή για το BirdNET-Pi. Παρακολουθήστε τις ανιχνεύσεις πουλιών από το Raspberry Pi σας.';

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
  String get errorWhileSaving => 'Σφάλμα κατά την αποθήκευση';

  @override
  String exceptionDuringSave(String error) {
    return 'Εξαίρεση κατά την αποθήκευση: $error';
  }

  @override
  String get model => 'Μοντέλο';

  @override
  String get selectAModel => 'Επιλέξτε μοντέλο:';

  @override
  String get speciesRangeModel => 'Μοντέλο σειράς ειδών V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Όριο συχνότητας εμφάνισης ειδών [0,0005, 0,99]:';

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
  String get appriseConfig => 'Διαμόρφωση Apprise Notifications:';

  @override
  String get notificationTitle => 'Τίτλος ειδοποίησης:';

  @override
  String get notificationBody => 'Κείμενο ειδοποίησης:';

  @override
  String get notifyNewInfrequent =>
      'Ειδοποιήστε κάθε νέα σπάνια ανίχνευση ειδών';

  @override
  String get notifyFirstDetectionOfDay =>
      'Ειδοποιήστε κάθε είδος για την πρώτη ανίχνευση της ημέρας';

  @override
  String get notifyEachNewDetection => 'Ειδοποίηση για κάθε νέα ανίχνευση';

  @override
  String get sendWeeklyReport => 'Αποστολή εβδομαδιαίας αναφοράς';

  @override
  String get minTimeBetweenNotifications =>
      'Ελάχιστος χρόνος μεταξύ των ειδοποιήσεων του ίδιου είδους (δευτ.):';

  @override
  String get excludeTheseSpecies =>
      'Εξαιρέστε αυτά τα είδη (χωρισμένα με κόμματα):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Ειδοποίηση ΜΟΝΟ για αυτά τα είδη (χωρισμένα με κόμματα):';

  @override
  String get imageSource => 'Πηγή εικόνας';

  @override
  String get imageProvider => 'Πάροχος εικόνας:';

  @override
  String get flickrApiKey => 'Κλειδί API Flickr:';

  @override
  String get flickrFilterEmail =>
      'Αναζήτηση φωτογραφιών μόνο από αυτόν τον χρήστη του Flickr:';

  @override
  String get localization => 'Τοπικοποίηση';

  @override
  String get databaseLanguage => 'Γλώσσα βάσης δεδομένων:';

  @override
  String get otherInfo => 'Άλλες πληροφορίες';

  @override
  String get infoSite => 'Ιστότοπος πληροφοριών:';

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
  String get privacyRecordings => 'Απόρρητο ηχογραφήσεων';

  @override
  String get privacyThreshold => 'Όριο απορρήτου [0, 99]:';

  @override
  String get diskSpaceManagement => 'Διαχείριση χώρου δίσκου';

  @override
  String get whenDiskIsFull => 'Όταν ο δίσκος είναι γεμάτος:';

  @override
  String get purgeCapacity => 'Χωρητικότητα καθαρισμού [% κατώφλι]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Μέγιστος αριθμός αρχείων προς διατήρηση ανά είδος (0 = απενεργοποίηση):';

  @override
  String get audioSettings => 'Ρυθμίσεις ήχου';

  @override
  String get alsaInputCaptureDevice =>
      'Συσκευή λήψης εισόδου ALSA (κάρτα ήχου):';

  @override
  String get numberOfAudioChannels => 'Αριθμός καναλιών ήχου για εξαγωγή από:';

  @override
  String get overlap => 'Επικάλυψη (δευτ.) [0, 2.9]:';

  @override
  String get audioFormat => 'Μορφή ήχου:';

  @override
  String get recordingLength => 'Διάρκεια ηχογράφησης (δευτ.):';

  @override
  String get extractionLength => 'Διάρκεια εξαγωγής (δευτ.):';

  @override
  String get rtspAudioSharing => 'Κοινή χρήση ήχου RTSP';

  @override
  String get shareLiveAudioStream => 'Κοινή χρήση ζωντανής ροής ήχου;';

  @override
  String get playAudioStreamThroughWebUi =>
      'Αναπαραγωγή ροής ήχου μέσω της διεπαφής Web Web;';

  @override
  String get caddyPassword => 'Κωδικός Caddy';

  @override
  String get appPassword => 'Κωδικός εφαρμογής:';

  @override
  String get customLogoImage => 'Προσαρμοσμένο λογότυπο';

  @override
  String get customImageUrl => 'URL προσαρμοσμένης εικόνας:';

  @override
  String get customImageTitle => 'Προσαρμοσμένος τίτλος εικόνας:';

  @override
  String get birdNetLiteModelSettings => 'Ρυθμίσεις μοντέλου BirdNET-Lite';

  @override
  String get confidenceThreshold => 'Όριο εμπιστοσύνης [0, 0,99]:';

  @override
  String get sensitivity => 'Ευαισθησία [0,5, 1,5]:';

  @override
  String get otherSettings => 'Άλλες ρυθμίσεις';

  @override
  String get silenceUpdateIndicator => 'Σιγή ένδειξη \"Διαθέσιμη ενημέρωση\".';

  @override
  String get automaticUpdate => 'Αυτόματη ενημέρωση';

  @override
  String get saveRawSpectrograms => 'Αποθήκευση ακατέργαστων φασματογραφημάτων';

  @override
  String get loggingLevels => 'Επίπεδα καταγραφής';

  @override
  String get birdnetRecordingService => 'Υπηρεσία εγγραφής BirdNET:';

  @override
  String get spectrogramViewerService => 'Υπηρεσία Spectrogram Viewer:';

  @override
  String get liveAudioStreamService => 'Υπηρεσία ζωντανής ροής ήχου:';

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
  String get errorSavingList => 'Σφάλμα κατά την αποθήκευση της λίστας';

  @override
  String errorLoadingList(String error) {
    return 'Σφάλμα κατά τη φόρτωση της λίστας:\\n$error';
  }

  @override
  String get retry => 'Προσπάθεια ξανά';

  @override
  String get searchSpeciesHint =>
      'Είδη αναζήτησης (π.χ. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Φόρτωση ειδών...';

  @override
  String get errorLoadingSpecies => 'Σφάλμα φόρτωσης ειδών';

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
      'Εισαγάγετε τα διαπιστευτήριά σας για πρόσβαση σε προστατευμένες λειτουργίες.';

  @override
  String get username => 'Όνομα χρήστη';

  @override
  String get password => 'Κωδικός πρόσβασης';

  @override
  String get loginEmptyError => 'Εισαγάγετε όνομα χρήστη και κωδικό πρόσβασης';

  @override
  String get loginInvalidError => 'Μη έγκυρα διαπιστευτήρια';

  @override
  String get authenticated => 'Ταυτοποιήθηκε';

  @override
  String get signIn => 'Είσοδος';

  @override
  String get loggedInMessage => 'Αυτήν τη στιγμή έχετε πιστοποιηθεί.';

  @override
  String get logout => 'Αποσύνδεση';

  @override
  String get login => 'Είσοδος';

  @override
  String get audioStream => 'Ροή ήχου';

  @override
  String get pressPlayToListen => 'Πατήστε αναπαραγωγή για να ακούσετε';

  @override
  String get loginToStart => 'Συνδεθείτε με 🔒 για να ξεκινήσετε';

  @override
  String get streamRequiresAuth =>
      'Η ροή απαιτεί έλεγχο ταυτότητας. Πατήστε το εικονίδιο 🔒 επάνω δεξιά για να συνδεθείτε.';

  @override
  String get liveAudioFootnote => 'Ζωντανός ήχος BirdNET-Pi';

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
  String get pressPlaySpectrogram => 'Πατήστε ▶ για να δείτε το φασματογράφημα';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Πατήστε ▶ για να ξεκινήσει το φασματογράφημα σε πραγματικό χρόνο';

  @override
  String get loginThenPlay => 'Συνδεθείτε με 🔒 και μετά πατήστε ▶';

  @override
  String get currentAnalyzing => 'Αναλύεται τώρα';

  @override
  String get accessRestricted => 'Περιορισμένη πρόσβαση';

  @override
  String get loginToAccessSection =>
      'Συνδεθείτε για να αποκτήσετε πρόσβαση σε αυτή την ενότητα.';

  @override
  String get iframeNotSupported =>
      'Τα Iframes υποστηρίζονται αυστηρά στην έκδοση web.';

  @override
  String get error => 'Σφάλμα';

  @override
  String get otherUtilities => 'Άλλα εργαλεία';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · $secondsδ';
  }

  @override
  String get spectrogramNotAvailable => 'Φασματογράφημα δεν είναι διαθέσιμο';

  @override
  String get ebirdCountIdentifier => 'Αρ';

  @override
  String get ebirdCountDefault => 'Χ';

  @override
  String get ebirdProtocolStationary => 'Ακίνητος';

  @override
  String get ebirdProtocolIncidental => 'Τυχαίος';

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
  String get tooltipRefreshData => 'Ανανέωση δεδομένων';

  @override
  String get tooltipPreviousDay => 'Προηγούμενη μέρα';

  @override
  String get tooltipNextDay => 'Επόμενη μέρα';

  @override
  String get tooltipPreviousWeek => 'Προηγούμενη εβδομάδα';

  @override
  String get tooltipNextWeek => 'Από βδομάδα';

  @override
  String get tooltipDeleteRecording => 'Διαγραφή εγγραφής';

  @override
  String get tooltipClearSearch => 'Εκκαθάριση αναζήτησης';

  @override
  String get tooltipCloseSearch => 'Κλείσιμο αναζήτησης';

  @override
  String get tooltipSearch => 'Αναζήτηση';

  @override
  String get tooltipPlay => 'Αναπαραγωγή ήχου';

  @override
  String get tooltipPickDate => 'Επιλογή ημερομηνίας';

  @override
  String get passwordOptionalHint => 'Αφήστε κενό εάν δεν έχει οριστεί';

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
    return 'Το $count δεσμεύεται πίσω';
  }

  @override
  String get sysInfoLoadingError =>
      'Η φόρτωση των πληροφοριών συστήματος απέτυχε.';

  @override
  String get enable => 'Ενεργοποίηση';

  @override
  String get disable => 'Απενεργοποίηση';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Εβδομάδα $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Ομάδα ανά είδος';

  @override
  String get groupByTime => 'Ομάδα ανά ώρα';

  @override
  String get readOnWikipedia => 'Διαβάστε στη Wikipedia';

  @override
  String get loadingWikipedia => 'Φόρτωση πληροφοριών από τη Wikipedia...';

  @override
  String get noWikipediaInfo =>
      'Δεν βρέθηκαν πληροφορίες στη Wikipedia για αυτό το είδος.';

  @override
  String get searchSpecies => 'Αναζήτηση ειδών...';

  @override
  String get noResultsFound => 'Δεν βρέθηκαν αποτελέσματα';

  @override
  String get noSpeciesDetected => 'Δεν ανιχνεύθηκαν είδη';

  @override
  String get species => 'Είδη';

  @override
  String get detections => 'Εντοπισμοί';

  @override
  String get maxConfidence => 'Μέγιστη Εμπιστοσύνη';

  @override
  String get topSpecies => 'Top species';

  @override
  String get fromDate => 'Από Ημερομηνία';

  @override
  String get toDate => 'Έως Ημερομηνία';

  @override
  String get fromTime => 'Από Ώρα';

  @override
  String get toTime => 'Έως Ώρα';

  @override
  String get byPeriod => 'Ανά περίοδο';

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
}
