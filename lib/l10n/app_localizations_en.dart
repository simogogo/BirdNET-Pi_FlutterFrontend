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
  String get recordings => 'Recordings';

  @override
  String get liveStream => 'Live Stream';

  @override
  String get liveSpectrogram => 'Live Spectrogram';

  @override
  String get speciesManagement => 'SPECIES MANAGEMENT';

  @override
  String get inclusionList => 'Inclusion List';

  @override
  String get exclusionList => 'Exclusion List';

  @override
  String get analysisLog => 'Analysis Log';

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
  String get filterDetections => 'Filter Detections';

  @override
  String get minimumConfidenceThreshold => 'Minimum Confidence Threshold';

  @override
  String get reset => 'Reset';

  @override
  String get apply => 'Apply';

  @override
  String get charts => 'Charts';

  @override
  String get daily => 'Daily';

  @override
  String get weekly => 'Weekly';

  @override
  String get monthly => 'Monthly';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'No chart available';

  @override
  String get weeklyReport => 'Weekly Report';

  @override
  String get monthlyReport => 'Monthly Report';

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
  String get unprotect => 'Unprotect';

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
  String get downloadAudioZip => 'Generate audio ZIP files for eBird';

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
  String get statistics => 'Statistics';

  @override
  String get systemLogs => 'System Logs';

  @override
  String get systemTools => 'System Tools';

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
  String get spectrogram => 'Spectrogram';

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
  String errorMsgSimple(String error) {
    return 'Error: $error';
  }

  @override
  String get settings => 'Settings';

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
  String get latitude => 'Latitude';

  @override
  String get longitude => 'Longitude';

  @override
  String get locality => 'Locality';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Country Code';

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
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get colorScheme => 'Color Scheme:';

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
  String get shareLiveAudioStream => 'RTSP Stream URL (Leave empty to disable)';

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
  String get generateLdfcsStandard => 'LDFCS (Standard Thermal)';

  @override
  String get generateLdfcsIndices => 'LDFCS (Acoustic Indices)';

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
  String get whitelist => 'Whitelist';

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
  String get retry => 'Retry';

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
  String get save => 'Save';

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

  @override
  String weekStr(int weekNumber, int year) {
    return 'Week $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Group by Species';

  @override
  String get groupByTime => 'Group by Time';

  @override
  String get readOnWikipedia => 'Read on Wikipedia';

  @override
  String get loadingWikipedia => 'Loading information from Wikipedia...';

  @override
  String get noWikipediaInfo =>
      'No information found on Wikipedia for this species.';

  @override
  String get searchSpecies => 'Search species...';

  @override
  String get noResultsFound => 'No results found';

  @override
  String get noSpeciesDetected => 'No species detected';

  @override
  String get species => 'Species';

  @override
  String get detections => 'Detections';

  @override
  String get maxConfidence => 'Max Confidence';

  @override
  String get topSpecies => 'Top species';

  @override
  String get fromDate => 'From Date';

  @override
  String get toDate => 'To Date';

  @override
  String get fromTime => 'From Time';

  @override
  String get toTime => 'To Time';

  @override
  String get byPeriod => 'By Period';

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
  String get firstSeen => 'First Seen (All Time)';

  @override
  String get lastSeen => 'Last Seen (All Time)';

  @override
  String get firstSeenPeriod => 'First Seen (Period)';

  @override
  String get lastSeenPeriod => 'Last Seen (Period)';

  @override
  String get thirtyDaysTrend => '30 Days Trend';

  @override
  String get avgConfidence => 'Avg Conf';

  @override
  String get mySpecies => 'My Species';

  @override
  String get bestDetection => 'Best Detection';

  @override
  String get externalInfoLink => 'External Info';

  @override
  String get includedListInfo =>
      'Warning! If this list contains ANY species, the system will ONLY recognize those species. Keep this list EMPTY unless you are ONLY interested in detecting specific species.';

  @override
  String get excludedListInfo =>
      'Once the desired species has been highlighted, click it and then click ADD to have it excluded.';

  @override
  String get whitelistInfo =>
      'Once the desired species has been highlighted, click it and then click ADD to have it whitelisted. This species will be detected even if below the Species Occurrence Frequency Threshold defined in the settings. This is not a recommended way of working : it is preferable to first try first both Species Occurrence models (v1 and v2.4).';

  @override
  String get overnightRange => 'Night range (crosses midnight)';

  @override
  String get resetFilters => 'Reset filters';

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
      'Apprise Notifications can be setup and enabled for 90+ notification services. Each service should be on its own line.\n\n**Examples:**\n- `mailto://<user>:<password>@gmail.com`\n- `tgram://<bot_token>/<chat_id>`\n- `discord://<WebhookID>/<WebhookToken>`\n\n[Full Apprise Wiki](https://github.com/caronc/apprise/wiki)';

  @override
  String get notificationVarsHelp =>
      'You can use the following variables in your title and body:\n\n- `\$sciname`: Scientific Name\n- `\$comname`: Common Name\n- `\$confidencepct`: Confidence score as percentage\n- `\$listenurl`: Link to the detection\n- `\$date`, `\$time`, `\$week`: Date/Time info\n- `\$image`: Species image\n- `\$reason`: Reason for notification';

  @override
  String get excludeSpeciesHelp =>
      'Exclude these species from notifications (comma separated common names). Example: `Mourning Dove,American Crow`.';

  @override
  String get includeSpeciesHelp =>
      'ONLY notify for these species (comma separated common names).';

  @override
  String get serverUrl => 'Server URL';

  @override
  String get pleaseEnterUrl => 'Please enter a server URL';

  @override
  String get serverUnreachable =>
      'Server unreachable. Please check the address and try again.';

  @override
  String get welcomeToBirdNetPi => 'Welcome to BirdNET-Pi';

  @override
  String get enterServerUrlDescription =>
      'To get started, please enter the URL of your BirdNET-Pi server.';

  @override
  String get connect => 'Connect';

  @override
  String get serverUpdatedSuccessfully => 'Server updated successfully!';

  @override
  String get serverInformation => 'Server Information';

  @override
  String get noData => 'No data';

  @override
  String get trends => 'Trends';

  @override
  String get selectSpeciesToViewTrends => 'Select a species to view trends';

  @override
  String speciesDetailsError(String error) {
    return 'Species details error: $error';
  }

  @override
  String get fromLabel => 'From';

  @override
  String get toLabel => 'To';

  @override
  String get exportMenuLabel => 'Export';

  @override
  String get exportDataTitle => 'Export Data';

  @override
  String get ebirdExportDesc => 'Guided flow to submit checklists.';

  @override
  String get csvExport => 'Export to CSV';

  @override
  String get csvExportDesc => 'Raw data filtered by date and species.';

  @override
  String get audioZipExport => 'Daily Audio Export';

  @override
  String get audioZipExportDesc => 'Request a zip of all recordings.';

  @override
  String get zipManager => 'Zip Management';

  @override
  String get zipManagerDesc => 'Download or delete zip files on the server.';

  @override
  String get startDate => 'Start Date';

  @override
  String get endDate => 'End Date';

  @override
  String get filterBySpeciesOptional => 'Filter by Species (Optional)';

  @override
  String get selectedSpecies => 'Selected Species';

  @override
  String get emptyIncludeAllSpecies => '* If empty: includes all species';

  @override
  String get executeExport => 'EXECUTE EXPORT';

  @override
  String get chooseFullDayText =>
      'Choose the day for which you want to export recordings:';

  @override
  String get requestZipGeneration => 'REQUEST ZIP GENERATION';

  @override
  String get zipGenerationWarning =>
      '* The operation may take minutes. You can download the zip from the \"Zip Management\" section.';

  @override
  String get zipGenerationStarted =>
      'ZIP generation started. It will be available in the Zip Manager section.';

  @override
  String get refreshList => 'Refresh List';

  @override
  String get downloadZip => 'Download';

  @override
  String get filterSpecies => 'Filter Species';

  @override
  String get allSpeciesWillBeExported => 'All species will be exported.';

  @override
  String get export => 'Export';

  @override
  String get hourlyDistributionDetections => 'Hourly Distribution (Detections)';

  @override
  String get dayNightWeatherProfile => 'Day vs Night Profile (Weather)';

  @override
  String get dailyDetections => 'Daily Detections';

  @override
  String get temperatureUnitLabel => 'Temperature (°C)';

  @override
  String get windSpeedUnitLabel => 'Wind Speed (km/h)';

  @override
  String get densityMapSunInfo =>
      'Density Map (Hourly / Daily) with Sunrise and Sunset';

  @override
  String get externalSheet => 'External Sheet';

  @override
  String get totalAllTime => 'Total (All time)';

  @override
  String get detectionsLabel => 'Detections';

  @override
  String get maxConfidenceLabel => 'Max Confidence';

  @override
  String get averageConfidenceLabel => 'Avg Confidence';

  @override
  String get dayLegend => 'Day ☀️';

  @override
  String get nightLegend => 'Night 🌙';

  @override
  String get weatherClear => 'Clear';

  @override
  String get weatherCloudy => 'Cloudy';

  @override
  String get weatherFog => 'Fog';

  @override
  String get weatherRain => 'Rain';

  @override
  String get weatherSnow => 'Snow';

  @override
  String get weatherThunderstorm => 'Thunderstorm';

  @override
  String get loadingAudioLabel => 'Loading audio...';

  @override
  String get errorLoadingAudioLabel => 'Error loading audio';

  @override
  String get detectionsTotal => 'Detections';

  @override
  String get ebirdExportError =>
      'An error occurred while requesting ZIP generation.';

  @override
  String get temperature => 'Temperature';

  @override
  String get wind => 'Wind';

  @override
  String get dateLabel => 'Date';

  @override
  String get notAvailable => 'N/A';

  @override
  String get ldfcsStandardTitle => 'Long-duration Spectrogram (Standard)';

  @override
  String get ldfcsIndicesTitle =>
      'Long-duration Spectrogram (Acoustic Indices)';

  @override
  String get ldfcsDescription => '24-hour recording visualization';

  @override
  String get weeklyLdfcsStandard => 'Weekly LDFCS (Standard)';

  @override
  String get weeklyLdfcsIndices => 'Weekly LDFCS (Acoustic Indices)';

  @override
  String get monthlyLdfcsStandard => 'Monthly LDFCS (Standard)';

  @override
  String get monthlyLdfcsIndices => 'Monthly LDFCS (Acoustic Indices)';

  @override
  String get dailyInsightsTitle => 'Daily Insights';

  @override
  String get weeklyInsightsTitle => 'Weekly Insights';

  @override
  String get monthlyInsightsTitle => 'Monthly Insights';

  @override
  String get hourlyActivityTitle => 'Hourly Activity';

  @override
  String get speciesDiversityTitle => 'Species Diversity';

  @override
  String get others => 'Others';

  @override
  String get detShort => 'DET';

  @override
  String get backupRestore => 'Backup & Restore';

  @override
  String get backupRestoreSubtitle => 'Manage database and recordings backups.';

  @override
  String get backup => 'Backup';

  @override
  String get restore => 'Restore';

  @override
  String get createBackup => 'Create New Backup';

  @override
  String get generatingBackup => 'Generating backup...';

  @override
  String get availableBackups => 'Available Backups';

  @override
  String get noBackupsAvailable => 'No backups available';

  @override
  String get backupCompleted => 'Completed';

  @override
  String get downloadBackup => 'Download';

  @override
  String get restoreBackup => 'Restore Backup';

  @override
  String backupSize(String size) {
    return 'Size: $size';
  }

  @override
  String get backupWarning =>
      'Warning: Generating the backup may take several minutes.';

  @override
  String get restoreWarning =>
      'Warning: Restoring will overwrite current data and restart services.';

  @override
  String get selectBackupFile => 'Select backup file (.tar)';

  @override
  String get restoreStarted =>
      'Restore started. The system will restart shortly.';

  @override
  String get errorRestoring => 'Error during restoration.';
}
