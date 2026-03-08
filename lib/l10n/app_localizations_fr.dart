// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Surveillance des oiseaux';

  @override
  String get home => 'Accueil';

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get recordings => 'Enregistrements';

  @override
  String get liveStream => 'Flux en direct';

  @override
  String get liveSpectrogram => 'Spectrogramme en direct';

  @override
  String get speciesManagement => 'GESTION DES ESPÈCES';

  @override
  String get inclusionList => 'Liste d\'inclusion';

  @override
  String get exclusionList => 'Liste d\'exclusion';

  @override
  String get analysisLog => 'Journal d\'analyse';

  @override
  String get openWebInterface => 'Ouvrir l\'interface Web';

  @override
  String get loadingLiveSpectrogram => 'Chargement du spectrogramme...';

  @override
  String get spectrogramInstruction =>
      'Si l\'audio ne démarre pas automatiquement, veuillez interagir avec la page ou vérifier les permissions du navigateur.';

  @override
  String get configureServerFirst =>
      'Configurez d\'abord l\'adresse du serveur dans les Paramètres';

  @override
  String get recentDetections => 'Détections récentes';

  @override
  String get latestDetection => 'Dernière détection';

  @override
  String get audioFile => 'Fichier audio';

  @override
  String get playing => 'Lecture en cours';

  @override
  String get noDetectionsToday => 'Aucune détection aujourd\'hui';

  @override
  String get systemListening => 'Le système écoute...';

  @override
  String get errorOccurred => 'Une erreur est survenue';

  @override
  String get overview => 'Aperçu';

  @override
  String get detectionsAllTime => 'Détections\ntotal';

  @override
  String get detectionsToday => 'Détections\naujourd\'hui';

  @override
  String get detectionsLastHour => 'Détections\ndernière heure';

  @override
  String get speciesToday => 'Espèces\naujourd\'hui';

  @override
  String get speciesAllTime => 'Espèces\ntotal';

  @override
  String get statsLoadingError => 'Erreur lors du chargement des statistiques';

  @override
  String get todaysDetections => 'Détections du jour';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count détections';
  }

  @override
  String get filterDetections => 'Filtrer les détections';

  @override
  String get minimumConfidenceThreshold => 'Seuil de confiance minimal';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get apply => 'Appliquer';

  @override
  String get charts => 'Graphiques';

  @override
  String get daily => 'Quotidien';

  @override
  String get weekly => 'Hebdomadaire';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Aucun graphique disponible';

  @override
  String get weeklyReport => 'Rapport hebdomadaire';

  @override
  String get newSpecies => 'Nouvelle espèce';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Espèces identifiées';

  @override
  String get byDate => 'Par date';

  @override
  String get bySpecies => 'Par espèce';

  @override
  String exportToEbird(String date) {
    return 'Exporter vers eBird ($date)';
  }

  @override
  String get noRecordings => 'Aucun enregistrement';

  @override
  String get deleteRecording => 'Supprimer l\'enregistrement';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get noSpeciesFound => 'Aucune espèce trouvée.';

  @override
  String get unknown => 'Inconnu';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Lire';

  @override
  String get changeId => 'Modifier l\'ID';

  @override
  String get protect => 'Protéger';

  @override
  String get unprotect => 'Déprotéger';

  @override
  String get download => 'Télécharger';

  @override
  String get cannotDownloadFile => 'Impossible de télécharger le fichier';

  @override
  String get errorLoading => 'Erreur de chargement';

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
  String get ebirdExport => 'Export eBird';

  @override
  String get generateCsvForEbird => 'Générer le CSV pour eBird';

  @override
  String get downloadAudioZip => 'Télécharger l\'audio (ZIP)';

  @override
  String get close => 'Fermer';

  @override
  String get continueStep => 'Continuer';

  @override
  String get back => 'Retour';

  @override
  String get review => 'Révision';

  @override
  String get configuration => 'Configuration';

  @override
  String get summary => 'Résumé';

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
  String get protocol => 'Protocole';

  @override
  String get stationaryPoint => 'Stationnaire - Point fixe';

  @override
  String get nocturnalFlightCall => 'Cri de vol nocturne (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Nom du lieu *';

  @override
  String get requiredField => 'Champ obligatoire';

  @override
  String get numberOfObservers => 'Nombre d\'observers';

  @override
  String get additionalComments => 'Commentaires supplémentaires';

  @override
  String get includeAudioFileNamesInComments =>
      'Inclure les noms des fichiers audio dans les commentaires';

  @override
  String get readyForExport => 'Prêt pour l\'exportation';

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
  String get statistics => 'Statistiques';

  @override
  String get systemLogs => 'Journaux système';

  @override
  String get systemTools => 'Outils système';

  @override
  String get systemControls => 'Contrôles système';

  @override
  String get restart => 'Redémarrer';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Mettre à jour';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Éteindre';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Effacer toutes les données';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Services';

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
  String get spectrogram => 'Spectrogramme';

  @override
  String get quickActions => 'Actions rapides';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Confirmer';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Commande exécutée';

  @override
  String errorMsg(String error) {
    return '❌ Erreur : $error';
  }

  @override
  String get species => 'Espèces';

  @override
  String get noSpeciesDetected => 'Aucune espèce détectée';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Détections';

  @override
  String get maxConfidence => 'Confiance maximale';

  @override
  String get searchSpecies => 'Rechercher des espèces...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Paramètres';

  @override
  String get basicSettings => 'Paramètres de base';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Paramètres avancés';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Connexion';

  @override
  String get birdNetPiServerAddress => 'Adresse du serveur BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Informations sur l\'appareil';

  @override
  String get loading => 'Chargement...';

  @override
  String get notConnected => 'Non connecté';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Latitude';

  @override
  String get longitude => 'Longitude';

  @override
  String get locality => 'Localité';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Code pays';

  @override
  String get information => 'Information';

  @override
  String get appVersion => 'Version 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Connecté à $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Impossible de se connecter à $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Erreur lors du chargement des paramètres : $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Paramètres de base enregistrés avec succès';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Modèle';

  @override
  String get selectAModel => 'Sélectionnez un modèle :';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Localisation';

  @override
  String get siteName => 'Nom du site :';

  @override
  String get latitudeInput => 'Latitude :';

  @override
  String get longitudeInput => 'Longitude :';

  @override
  String get birdWeatherToken => 'Jeton BirdWeather :';

  @override
  String get notificationsApprise => 'Notifications (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Titre de la notification :';

  @override
  String get notificationBody => 'Corps de la notification :';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Notifier chaque nouvelle détection';

  @override
  String get sendWeeklyReport => 'Envoyer un rapport hebdomadaire';

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
  String get localization => 'Localisation';

  @override
  String get databaseLanguage => 'Langue de la base de données :';

  @override
  String get otherInfo => 'Autres infos';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Thème graphique (Web)';

  @override
  String get colorScheme => 'Schéma de couleurs :';

  @override
  String get none => 'Aucun';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Paramètres avancés enregistrés avec succès';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Gestion de l\'espace disque';

  @override
  String get whenDiskIsFull => 'Quand le disque est plein :';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Paramètres audio';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Recouvrement (sec) [0, 2.9] :';

  @override
  String get audioFormat => 'Format audio :';

  @override
  String get recordingLength => 'Longueur d\'enregistrement (sec) :';

  @override
  String get extractionLength => 'Longueur d\'extraction (sec) :';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Mot de passe Caddy';

  @override
  String get appPassword => 'Mot de passe de l\'application :';

  @override
  String get customLogoImage => 'Image de logo personnalisée';

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
  String get automaticUpdate => 'Mise à jour automatique';

  @override
  String get saveRawSpectrograms => 'Enregistrer les spectrogrammes bruts';

  @override
  String get loggingLevels => 'Niveaux de journalisation';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Gestion des listes d\'espèces';

  @override
  String get inclusion => 'Inclusion';

  @override
  String get exclusion => 'Exclusion';

  @override
  String get whitelist => 'Liste blanche';

  @override
  String get speciesAlreadyInList => 'Espèce déjà présente dans la liste';

  @override
  String get listSavedSuccessfully => 'Liste enregistrée avec succès';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Réessayer';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Chargement des espèces...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'Aucune espèce dans cette liste.';

  @override
  String get removeFromList => 'Retirer de la liste';

  @override
  String get saving => 'Enregistrement...';

  @override
  String get save => 'Enregistrer';

  @override
  String get loginRequired => 'Connexion requise pour cette action';

  @override
  String get loginTitle => 'Authentification';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get password => 'Mot de passe';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Authentifié';

  @override
  String get signIn => 'Se connecter';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Déconnexion';

  @override
  String get login => 'Connexion';

  @override
  String get audioStream => 'Flux audio';

  @override
  String get pressPlayToListen => 'Appuyez sur lecture pour écouter';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Réactiver le son';

  @override
  String get mute => 'Couper le son';

  @override
  String get resume => 'Reprendre';

  @override
  String get pause => 'Pause';

  @override
  String get autoRefresh => 'Actualisation automatique';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Analyse en cours';

  @override
  String get accessRestricted => 'Accès restreint';

  @override
  String get loginToAccessSection =>
      'Connectez-vous pour accéder à cette section.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Erreur';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Autres utilitaires';

  @override
  String liveSeconds(int seconds) {
    return 'DIRECT · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram not available';

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
  String get tooltipRefresh => 'Actualiser';

  @override
  String get tooltipStop => 'Arrêter';

  @override
  String get tooltipStart => 'Démarrer';

  @override
  String get tooltipRestart => 'Redémarrer';

  @override
  String get systemInfo => 'Infos système';

  @override
  String get fileManager => 'Gestionnaire de fichiers';

  @override
  String get databaseMaintenance => 'Maintenance de la base de données';

  @override
  String get webTerminal => 'Terminal Web';

  @override
  String get tooltipOpenMenu => 'Ouvrir le menu';

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
  String get tooltipSearch => 'Rechercher';

  @override
  String get tooltipPlay => 'Lire l\'audio';

  @override
  String get tooltipPickDate => 'Choisir une date';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'État du système';

  @override
  String get sysInfoUptime => 'Temps de fonctionnement';

  @override
  String get sysInfoDisk => 'Disque';

  @override
  String get sysInfoMemory => 'Mémoire';

  @override
  String get sysInfoCpuTemp => 'Température CPU';

  @override
  String get sysInfoBranch => 'Branche';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Activer';

  @override
  String get disable => 'Désactiver';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Semaine $weekNumber - $year';
  }
}
