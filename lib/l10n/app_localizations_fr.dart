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
  String get noDetectionsForSpecies => 'Aucune détection pour cette espèce';

  @override
  String get removeFilter => 'Supprimer le filtre';

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
  String get monthly => 'Mensuel';

  @override
  String get detectionsBySpecies => 'Détections par espèces';

  @override
  String get hourlyDistribution => 'Répartition horaire';

  @override
  String get noChartAvailable => 'Aucun graphique disponible';

  @override
  String get weeklyReport => 'Rapport hebdomadaire';

  @override
  String get monthlyReport => 'Rapport Mensuel';

  @override
  String get newSpecies => 'Nouvelle espèce';

  @override
  String get newFemale => 'Nouveau!';

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
    return 'Voulez-vous supprimer \"$name\" de $date $time ?';
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
  String get noRecordingsAvailable => 'Aucun enregistrement disponible.';

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
      'Détections automatiques via BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully =>
      'Le téléchargement a démarré avec succès !';

  @override
  String get cannotDownloadCsv => 'Impossible de télécharger CSV.';

  @override
  String get zipDownloadInProgress => 'Téléchargement ZIP en cours...';

  @override
  String get cannotOpenZipUrl =>
      'Impossible d\'ouvrir l\'URL pour le téléchargement ZIP';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Le serveur n\'a pas renvoyé l\'URL de téléchargement.';

  @override
  String get unknownError => 'Erreur inconnue';

  @override
  String get serverError => 'Erreur de serveur';

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
  String get autoRemoveLessThan80 => 'Supprimer automatiquement < 80 %';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Espèce lue : $totalSpecies | Occurrences : $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count détections';
  }

  @override
  String get protocol => 'Protocole';

  @override
  String get stationaryPoint => 'Stationnaire - Point fixe';

  @override
  String get nocturnalFlightCall => 'Cri de vol nocturne (NFC)';

  @override
  String get incidental => 'Accessoire';

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
  String get totalUniqueSpecies => 'Total des espèces (uniques)';

  @override
  String get hourlyModeledChecklists =>
      'Listes de contrôle modélisées horaires';

  @override
  String get averageConfidence => 'Confiance moyenne';

  @override
  String get wizardInfoText =>
      'En appuyant sur \"Générer CSV\", le fichier sera compilé en divisant les stations par heure, prêt à être téléchargé sur eBird.';

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
  String get restartRaspberryPi => 'Redémarrez le Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Êtes-vous sûr de vouloir redémarrer le système?';

  @override
  String get update => 'Mettre à jour';

  @override
  String get updateBirdNetPi =>
      'Mettre à jour BirdNET-Pi vers la dernière version';

  @override
  String get doYouWantToUpdateBirdNet =>
      'Voulez-vous mettre à jour BirdNET-Pi?';

  @override
  String get shutdown => 'Éteindre';

  @override
  String get shutdownRaspberryPi => 'Arrêtez le Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Êtes-vous sûr de vouloir arrêter le système?';

  @override
  String get clearAllData => 'Effacer toutes les données';

  @override
  String get removeAllRecordingsAndDetections =>
      'Supprimer tous les enregistrements et détections';

  @override
  String get warningAllDataWillBeDeleted =>
      'AVERTISSEMENT: toutes les données seront définitivement supprimées. Continuer?';

  @override
  String get services => 'Services';

  @override
  String get liveAudioStream => 'Flux audio en direct';

  @override
  String get birdNetAnalysis => 'Analyse BirdNET';

  @override
  String get birdNetRecording => 'Enregistrement BirdNET';

  @override
  String get birdNetLog => 'Journal BirdNET';

  @override
  String get chartViewer => 'Visionneuse de graphiques';

  @override
  String get spectrogram => 'Spectrogramme';

  @override
  String get quickActions => 'Actions rapides';

  @override
  String get stopServices => 'Arrêter les services';

  @override
  String get restartServices => 'Redémarrer les services';

  @override
  String get confirm => 'Confirmer';

  @override
  String get execution => 'Exécution:';

  @override
  String get commandExecuted => '✅ Commande exécutée';

  @override
  String errorMsg(String error) {
    return '❌ Erreur : $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Erreur';
  }

  @override
  String get settings => 'Paramètres';

  @override
  String get basicSettings => 'Paramètres de base';

  @override
  String get basicSettingsSubtitle =>
      'Configurez l\'heure, le lieu, la langue et les notifications.';

  @override
  String get advancedSettings => 'Paramètres avancés';

  @override
  String get advancedSettingsSubtitle =>
      'Configurez l\'audio, la confidentialité, la gestion des disques et bien plus encore.';

  @override
  String get connection => 'Connexion';

  @override
  String get birdNetPiServerAddress => 'Adresse du serveur BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Entrez l\'adresse IP ou le nom d\'hôte de votre Raspberry Pi';

  @override
  String get testInProgress => 'Test en cours...';

  @override
  String get saveAndTestConnection => 'Enregistrer et tester la connexion';

  @override
  String get deviceInformation => 'Informations sur l\'appareil';

  @override
  String get loading => 'Chargement...';

  @override
  String get notConnected => 'Non connecté';

  @override
  String get configureServerAddress => 'Configurer l\'adresse du serveur';

  @override
  String get latitude => 'Latitude';

  @override
  String get longitude => 'Longitude';

  @override
  String get locality => 'Localité';

  @override
  String get stateProvince => 'État/Province';

  @override
  String get countryCode => 'Code pays';

  @override
  String get information => 'Information';

  @override
  String get appVersion => 'Version 1.0.0';

  @override
  String get appDescription =>
      'Application compagnon pour BirdNET-Pi. Surveillez les détections d\'oiseaux depuis votre Raspberry Pi.';

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
  String get errorWhileSaving => 'Erreur lors de l\'enregistrement';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception lors de l\'enregistrement: $error';
  }

  @override
  String get model => 'Modèle';

  @override
  String get selectAModel => 'Sélectionnez un modèle :';

  @override
  String get speciesRangeModel => 'Modèle de gamme d\'espèces V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Seuil de fréquence d\'occurrence de l\'espèce [0,0005, 0,99]:';

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
  String get appriseConfig => 'Configuration des notifications Apprise:';

  @override
  String get notificationTitle => 'Titre de la notification :';

  @override
  String get notificationBody => 'Corps de la notification :';

  @override
  String get notifyNewInfrequent =>
      'Notifier chaque nouvelle détection d\'espèce peu fréquente';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notifier chaque espèce dès la première détection de la journée';

  @override
  String get notifyEachNewDetection => 'Notifier chaque nouvelle détection';

  @override
  String get sendWeeklyReport => 'Envoyer un rapport hebdomadaire';

  @override
  String get minTimeBetweenNotifications =>
      'Délai minimum entre les notifications d\'une même espèce (sec):';

  @override
  String get excludeTheseSpecies =>
      'Exclure ces espèces (séparées par des virgules):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Notifier UNIQUEMENT pour ces espèces (séparées par des virgules):';

  @override
  String get imageSource => 'Source de l\'image';

  @override
  String get imageProvider => 'Fournisseur d\'images:';

  @override
  String get flickrApiKey => 'Clé API Flickr:';

  @override
  String get flickrFilterEmail =>
      'Recherchez uniquement les photos de cet utilisateur Flickr:';

  @override
  String get localization => 'Localisation';

  @override
  String get databaseLanguage => 'Langue de la base de données :';

  @override
  String get otherInfo => 'Autres infos';

  @override
  String get infoSite => 'Site d\'informations:';

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
  String get privacyRecordings => 'Confidentialité des enregistrements';

  @override
  String get privacyThreshold => 'Seuil de confidentialité [0, 99]:';

  @override
  String get diskSpaceManagement => 'Gestion de l\'espace disque';

  @override
  String get whenDiskIsFull => 'Quand le disque est plein :';

  @override
  String get purgeCapacity => 'Capacité de purge [% seuil]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Nombre maximum de fichiers à conserver par espèce (0 = désactiver):';

  @override
  String get audioSettings => 'Paramètres audio';

  @override
  String get alsaInputCaptureDevice =>
      'Dispositif de capture d\'entrée ALSA (carte son):';

  @override
  String get numberOfAudioChannels => 'Nombre de canaux audio à extraire:';

  @override
  String get overlap => 'Recouvrement (sec) [0, 2.9] :';

  @override
  String get audioFormat => 'Format audio :';

  @override
  String get recordingLength => 'Longueur d\'enregistrement (sec) :';

  @override
  String get extractionLength => 'Longueur d\'extraction (sec) :';

  @override
  String get rtspAudioSharing => 'Partage audio RTSP';

  @override
  String get shareLiveAudioStream => 'Partager un flux audio en direct?';

  @override
  String get playAudioStreamThroughWebUi =>
      'Lire un flux audio via l\'interface utilisateur Web?';

  @override
  String get caddyPassword => 'Mot de passe Caddy';

  @override
  String get appPassword => 'Mot de passe de l\'application :';

  @override
  String get customLogoImage => 'Image de logo personnalisée';

  @override
  String get customImageUrl => 'URL de l\'image personnalisée:';

  @override
  String get customImageTitle => 'Titre de l\'image personnalisé:';

  @override
  String get birdNetLiteModelSettings => 'Paramètres du modèle BirdNET-Lite';

  @override
  String get confidenceThreshold => 'Seuil de confiance [0, 0,99]:';

  @override
  String get sensitivity => 'Sensibilité [0,5, 1,5]:';

  @override
  String get otherSettings => 'Autres paramètres';

  @override
  String get silenceUpdateIndicator =>
      'Faire taire l\'indicateur \"Mise à jour disponible\"';

  @override
  String get automaticUpdate => 'Mise à jour automatique';

  @override
  String get saveRawSpectrograms => 'Enregistrer les spectrogrammes bruts';

  @override
  String get loggingLevels => 'Niveaux de journalisation';

  @override
  String get birdnetRecordingService => 'Service d\'enregistrement BirdNET:';

  @override
  String get spectrogramViewerService =>
      'Service de visualisation de spectrogramme:';

  @override
  String get liveAudioStreamService => 'Service de flux audio en direct:';

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
  String get errorSavingList => 'Erreur lors de l\'enregistrement de la liste';

  @override
  String errorLoadingList(String error) {
    return 'Erreur lors du chargement de la liste:\\n$error';
  }

  @override
  String get retry => 'Réessayer';

  @override
  String get searchSpeciesHint =>
      'Rechercher des espèces (par exemple Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Chargement des espèces...';

  @override
  String get errorLoadingSpecies => 'Erreur lors du chargement des espèces';

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
      'Entrez vos informations d\'identification pour accéder aux fonctionnalités protégées.';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get password => 'Mot de passe';

  @override
  String get loginEmptyError =>
      'Veuillez entrer votre nom d\'utilisateur et votre mot de passe';

  @override
  String get loginInvalidError => 'Identifiants invalides';

  @override
  String get authenticated => 'Authentifié';

  @override
  String get signIn => 'Se connecter';

  @override
  String get loggedInMessage => 'Vous êtes actuellement authentifié.';

  @override
  String get logout => 'Déconnexion';

  @override
  String get login => 'Connexion';

  @override
  String get audioStream => 'Flux audio';

  @override
  String get pressPlayToListen => 'Appuyez sur lecture pour écouter';

  @override
  String get loginToStart => 'Connectez-vous avec 🔒 pour commencer';

  @override
  String get streamRequiresAuth =>
      'Le flux nécessite une authentification. Appuyez sur l\'icône 🔒 en haut à droite pour vous connecter.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Audio en direct';

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
  String get pressPlaySpectrogram =>
      'Appuyez sur ▶ pour afficher le spectrogramme';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Appuyez sur ▶ pour démarrer le spectrogramme en temps réel';

  @override
  String get loginThenPlay => 'Connectez-vous avec 🔒 puis appuyez sur ▶';

  @override
  String get currentAnalyzing => 'Analyse en cours';

  @override
  String get accessRestricted => 'Accès restreint';

  @override
  String get loginToAccessSection =>
      'Connectez-vous pour accéder à cette section.';

  @override
  String get iframeNotSupported =>
      'Les iframes sont strictement pris en charge sur la version Web.';

  @override
  String get error => 'Erreur';

  @override
  String get otherUtilities => 'Autres utilitaires';

  @override
  String liveSeconds(int seconds) {
    return 'DIRECT · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogramme non disponible';

  @override
  String get ebirdCountIdentifier => 'N°';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationnaire';

  @override
  String get ebirdProtocolIncidental => 'Accessoire';

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
  String get tooltipRefreshData => 'Actualiser les données';

  @override
  String get tooltipPreviousDay => 'Jour précédent';

  @override
  String get tooltipNextDay => 'Lendemain';

  @override
  String get tooltipPreviousWeek => 'La semaine précédente';

  @override
  String get tooltipNextWeek => 'La semaine prochaine';

  @override
  String get tooltipDeleteRecording => 'Supprimer l\'enregistrement';

  @override
  String get tooltipClearSearch => 'Effacer la recherche';

  @override
  String get tooltipCloseSearch => 'Fermer la recherche';

  @override
  String get tooltipSearch => 'Rechercher';

  @override
  String get tooltipPlay => 'Lire l\'audio';

  @override
  String get tooltipPickDate => 'Choisir une date';

  @override
  String get passwordOptionalHint => 'Laisser vide s\'il n\'est pas défini';

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
    return '$count s\'engage derrière';
  }

  @override
  String get sysInfoLoadingError =>
      'Échec du chargement des informations système.';

  @override
  String get enable => 'Activer';

  @override
  String get disable => 'Désactiver';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Semaine $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Regrouper par espèce';

  @override
  String get groupByTime => 'Regrouper par heure';

  @override
  String get readOnWikipedia => 'Lire sur Wikipédia';

  @override
  String get loadingWikipedia =>
      'Chargement des informations depuis Wikipédia...';

  @override
  String get noWikipediaInfo =>
      'Aucune information trouvée sur Wikipédia pour cette espèce.';

  @override
  String get searchSpecies => 'Rechercher des espèces...';

  @override
  String get noResultsFound => 'Aucun résultat trouvé';

  @override
  String get noSpeciesDetected => 'Aucune espèce détectée';

  @override
  String get species => 'Espèces';

  @override
  String get detections => 'Détections';

  @override
  String get maxConfidence => 'Confiance Max';

  @override
  String get topSpecies => 'Top species';

  @override
  String get fromDate => 'À partir de la date';

  @override
  String get toDate => 'Jusqu\'à la date';

  @override
  String get fromTime => 'À partir de l\'heure';

  @override
  String get toTime => 'Jusqu\'à l\'heure';

  @override
  String get byPeriod => 'Par période';

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
  String get firstSeen => 'Première observation';

  @override
  String get lastSeen => 'Dernière observation';

  @override
  String get thirtyDaysTrend => 'Tendance 30 jours';

  @override
  String get avgConfidence => 'Conf. Moyenne';

  @override
  String get mySpecies => 'Mes Espèces';

  @override
  String get bestDetection => 'Meilleure Détection';

  @override
  String get externalInfoLink => 'Infos Externes';

  @override
  String get includedListInfo =>
      'Attention ! Si cette liste contient N\'IMPORTE QUELLE espèce, le système ne reconnaîtra QUE ces espèces. Gardez cette liste VIDE à moins que vous ne soyez UNIQUEMENT intéressé par la détection d\'espèces spécifiques.';

  @override
  String get excludedListInfo =>
      'Une fois l\'espèce désirée mise en évidence, cliquez dessus puis sur AJOUTER pour l\'exclure.';

  @override
  String get whitelistInfo =>
      'Une fois l\'espèce désirée mise en évidence, cliquez dessus puis sur AJOUTER pour la mettre sur la liste blanche. Cette espèce sera détectée même si elle est inférieure au Seuil de Fréquence d\'Occurrence des Espèces défini dans les paramètres. Ce n\'est pas une méthode de travail recommandée : il est préférable d\'essayer d\'abord les deux modèles d\'Occurrence d\'Espèces (v1 et v2.4).';
}
