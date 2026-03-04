// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Bird Monitoring';

  @override
  String get home => 'Home';

  @override
  String get today => 'Today';

  @override
  String get charts => 'Charts';

  @override
  String get recordings => 'Recordings';

  @override
  String get liveStream => 'Live Stream';

  @override
  String get liveSpectrogram => 'Live Spectrogram';

  @override
  String get statistics => 'Statistics';

  @override
  String get systemLogs => 'System Logs';

  @override
  String get settings => 'Settings';

  @override
  String get systemTools => 'System Tools';

  @override
  String get speciesManagement => 'SPECIES MANAGEMENT';

  @override
  String get inclusionList => 'Inclusion List';

  @override
  String get exclusionList => 'Exclusion List';

  @override
  String get whitelist => 'Whitelist';

  @override
  String get openWebInterface => 'Open Web Interface';

  @override
  String get loadingLiveSpectrogram => 'Loading Live Spectrogram...';

  @override
  String get spectrogramInstruction =>
      'If audio does not start automatically, please interact with the page or check your browser permissions.';

  @override
  String get configureServerFirst =>
      'Configure the server address in Settings first';

  @override
  String get recentDetections => 'Recent Detections';

  @override
  String get latestDetection => 'Latest Detection';

  @override
  String get spectrogram => 'Spectrogram';

  @override
  String get audioFile => 'Audio File';

  @override
  String get playing => 'Playing';

  @override
  String get noDetectionsToday => 'No detections today';

  @override
  String get systemListening => 'The system is listening...';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get overview => 'Overview';

  @override
  String get detectionsAllTime => 'Detections\nall time';

  @override
  String get detectionsToday => 'Detections\ntoday';

  @override
  String get detectionsLastHour => 'Detections\nlast hour';

  @override
  String get speciesToday => 'Species\ntoday';

  @override
  String get speciesAllTime => 'Species\nall time';

  @override
  String get statsLoadingError => 'Error loading statistics';

  @override
  String get todaysDetections => 'Today\'s Detections';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count detections';
  }

  @override
  String get retry => 'Retry';

  @override
  String get filterDetections => 'Filter Detections';

  @override
  String get minimumConfidenceThreshold => 'Minimum Confidence Threshold';

  @override
  String get reset => 'Reset';

  @override
  String get apply => 'Apply';

  @override
  String get daily => 'Daily';

  @override
  String get weekly => 'Weekly';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'No chart available';

  @override
  String get weeklyReport => 'Weekly Report';

  @override
  String get newSpecies => 'New Species';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Identified Species';

  @override
  String get byDate => 'By Date';

  @override
  String get bySpecies => 'By Species';

  @override
  String exportToEbird(String date) {
    return 'Export to eBird ($date)';
  }

  @override
  String get noRecordings => 'No recordings';

  @override
  String get deleteRecording => 'Delete Recording';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get searchSpecies => 'Search species...';

  @override
  String get noSpeciesFound => 'No species found.';

  @override
  String get unknown => 'Unknown';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Play';

  @override
  String get changeId => 'Change ID';

  @override
  String get protect => 'Protect';

  @override
  String get download => 'Download';

  @override
  String get cannotDownloadFile => 'Cannot download file';

  @override
  String get errorLoading => 'Error loading';

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
  String get ebirdExport => 'eBird Export';

  @override
  String get generateCsvForEbird => 'Generate CSV for eBird';

  @override
  String get downloadAudioZip => 'Download Audio (ZIP)';

  @override
  String get close => 'Close';

  @override
  String get continueStep => 'Continue';

  @override
  String get back => 'Back';

  @override
  String get review => 'Review';

  @override
  String get configuration => 'Configuration';

  @override
  String get summary => 'Summary';

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
  String get protocol => 'Protocol';

  @override
  String get stationaryPoint => 'Stationary - Fixed point';

  @override
  String get nocturnalFlightCall => 'Nocturnal Flight Call (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Locality Name *';

  @override
  String get requiredField => 'Required field';

  @override
  String get latitude => 'Latitude';

  @override
  String get longitude => 'Longitude';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Country Code';

  @override
  String get numberOfObservers => 'Number of Observers';

  @override
  String get additionalComments => 'Additional Comments';

  @override
  String get includeAudioFileNamesInComments =>
      'Include audio file names in comments';

  @override
  String get readyForExport => 'Ready for export';

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
  String get systemControls => 'System Controls';

  @override
  String get restart => 'Restart';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Update';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Shutdown';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Clear All Data';

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
  String get quickActions => 'Quick Actions';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Confirm';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Command executed';

  @override
  String errorMsg(String error) {
    return '❌ Error: $error';
  }

  @override
  String get species => 'Species';

  @override
  String get noSpeciesDetected => 'No species detected';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Detections';

  @override
  String get maxConfidence => 'Max Confidence';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get basicSettings => 'Basic Settings';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Advanced Settings';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Connection';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi Server Address';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Device Information';

  @override
  String get loading => 'Loading...';

  @override
  String get notConnected => 'Not connected';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get locality => 'Locality';

  @override
  String get information => 'Information';

  @override
  String get appVersion => 'Version 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Connected to $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Cannot connect to $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Error loading settings: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Basic settings saved successfully';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get save => 'Save';

  @override
  String get model => 'Model';

  @override
  String get selectAModel => 'Select a Model:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Location';

  @override
  String get siteName => 'Site Name:';

  @override
  String get latitudeInput => 'Latitude:';

  @override
  String get longitudeInput => 'Longitude:';

  @override
  String get birdWeatherToken => 'BirdWeather Token:';

  @override
  String get notificationsApprise => 'Notifications (Apprise)';

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
  String get imageSource => 'Image Source';

  @override
  String get imageProvider => 'Image Provider:';

  @override
  String get flickrApiKey => 'Flickr API Key:';

  @override
  String get flickrFilterEmail => 'Only search photos from this Flickr user:';

  @override
  String get localization => 'Localization';

  @override
  String get databaseLanguage => 'Database Language:';

  @override
  String get otherInfo => 'Other Info';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Graphic Theme (Web)';

  @override
  String get colorScheme => 'Color Scheme:';

  @override
  String get none => 'None';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Advanced settings saved successfully';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Disk Space Management';

  @override
  String get whenDiskIsFull => 'When Disk is Full:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Audio Settings';

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
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Caddy Password';

  @override
  String get appPassword => 'App Password:';

  @override
  String get customLogoImage => 'Custom Logo Image';

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
  String get automaticUpdate => 'Automatic Update';

  @override
  String get saveRawSpectrograms => 'Save Raw Spectrograms';

  @override
  String get loggingLevels => 'Logging Levels';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Species Lists Management';

  @override
  String get inclusion => 'Inclusion';

  @override
  String get exclusion => 'Exclusion';

  @override
  String get speciesAlreadyInList => 'Species already present in the list';

  @override
  String get listSavedSuccessfully => 'List saved successfully';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Loading species...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'No species in this list.';

  @override
  String get removeFromList => 'Remove from list';

  @override
  String get saving => 'Saving...';

  @override
  String get loginRequired => 'Login required for this action';

  @override
  String get loginTitle => 'Authentication';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Authenticated';

  @override
  String get signIn => 'Sign In';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Logout';

  @override
  String get login => 'Login';

  @override
  String get audioStream => 'Audio Stream';

  @override
  String get pressPlayToListen => 'Press play to listen';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Unmute';

  @override
  String get mute => 'Mute';

  @override
  String get resume => 'Resume';

  @override
  String get pause => 'Pause';

  @override
  String get autoRefresh => 'Auto-refresh';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Current Analyzing';

  @override
  String get accessRestricted => 'Access restricted';

  @override
  String get loginToAccessSection => 'Log in to access this section.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Error';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Other Utilities';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · ${seconds}s';
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
  String get tooltipRefresh => 'Refresh';

  @override
  String get tooltipStop => 'Stop';

  @override
  String get tooltipStart => 'Start';

  @override
  String get tooltipRestart => 'Restart';

  @override
  String get systemInfo => 'System Info';

  @override
  String get fileManager => 'File Manager';

  @override
  String get databaseMaintenance => 'Database Maintenance';

  @override
  String get webTerminal => 'Web Terminal';

  @override
  String get tooltipOpenMenu => 'Open menu';

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
  String get tooltipSearch => 'Search';

  @override
  String get tooltipPlay => 'Play audio';

  @override
  String get tooltipPickDate => 'Pick a date';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'System Status';

  @override
  String get sysInfoUptime => 'Uptime';

  @override
  String get sysInfoDisk => 'Disk';

  @override
  String get sysInfoMemory => 'Memory';

  @override
  String get sysInfoCpuTemp => 'CPU Temp';

  @override
  String get sysInfoBranch => 'Branch';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Enable';

  @override
  String get disable => 'Disable';
}
