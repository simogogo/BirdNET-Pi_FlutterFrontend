import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('it'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'BirdNET-Pi'**
  String get appTitle;

  /// No description provided for @birdMonitoring.
  ///
  /// In en, this message translates to:
  /// **'Bird Monitoring'**
  String get birdMonitoring;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @recordings.
  ///
  /// In en, this message translates to:
  /// **'Recordings'**
  String get recordings;

  /// No description provided for @liveStream.
  ///
  /// In en, this message translates to:
  /// **'Live Stream'**
  String get liveStream;

  /// No description provided for @liveSpectrogram.
  ///
  /// In en, this message translates to:
  /// **'Live Spectrogram'**
  String get liveSpectrogram;

  /// No description provided for @speciesManagement.
  ///
  /// In en, this message translates to:
  /// **'SPECIES MANAGEMENT'**
  String get speciesManagement;

  /// No description provided for @inclusionList.
  ///
  /// In en, this message translates to:
  /// **'Inclusion List'**
  String get inclusionList;

  /// No description provided for @exclusionList.
  ///
  /// In en, this message translates to:
  /// **'Exclusion List'**
  String get exclusionList;

  /// No description provided for @analysisLog.
  ///
  /// In en, this message translates to:
  /// **'Analysis Log'**
  String get analysisLog;

  /// No description provided for @openWebInterface.
  ///
  /// In en, this message translates to:
  /// **'Open Web Interface'**
  String get openWebInterface;

  /// No description provided for @loadingLiveSpectrogram.
  ///
  /// In en, this message translates to:
  /// **'Loading Live Spectrogram...'**
  String get loadingLiveSpectrogram;

  /// No description provided for @spectrogramInstruction.
  ///
  /// In en, this message translates to:
  /// **'If audio does not start automatically, please interact with the page or check your browser permissions.'**
  String get spectrogramInstruction;

  /// No description provided for @configureServerFirst.
  ///
  /// In en, this message translates to:
  /// **'Configure the server address in Settings first'**
  String get configureServerFirst;

  /// No description provided for @recentDetections.
  ///
  /// In en, this message translates to:
  /// **'Recent Detections'**
  String get recentDetections;

  /// No description provided for @latestDetection.
  ///
  /// In en, this message translates to:
  /// **'Latest Detection'**
  String get latestDetection;

  /// No description provided for @audioFile.
  ///
  /// In en, this message translates to:
  /// **'Audio File'**
  String get audioFile;

  /// No description provided for @playing.
  ///
  /// In en, this message translates to:
  /// **'Playing'**
  String get playing;

  /// No description provided for @noDetectionsToday.
  ///
  /// In en, this message translates to:
  /// **'No detections today'**
  String get noDetectionsToday;

  /// No description provided for @systemListening.
  ///
  /// In en, this message translates to:
  /// **'The system is listening...'**
  String get systemListening;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get errorOccurred;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @detectionsAllTime.
  ///
  /// In en, this message translates to:
  /// **'Detections\nall time'**
  String get detectionsAllTime;

  /// No description provided for @detectionsToday.
  ///
  /// In en, this message translates to:
  /// **'Detections\ntoday'**
  String get detectionsToday;

  /// No description provided for @detectionsLastHour.
  ///
  /// In en, this message translates to:
  /// **'Detections\nlast hour'**
  String get detectionsLastHour;

  /// No description provided for @speciesToday.
  ///
  /// In en, this message translates to:
  /// **'Species\ntoday'**
  String get speciesToday;

  /// No description provided for @speciesAllTime.
  ///
  /// In en, this message translates to:
  /// **'Species\nall time'**
  String get speciesAllTime;

  /// No description provided for @statsLoadingError.
  ///
  /// In en, this message translates to:
  /// **'Error loading statistics'**
  String get statsLoadingError;

  /// No description provided for @todaysDetections.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Detections'**
  String get todaysDetections;

  /// No description provided for @noDetectionsForSpecies.
  ///
  /// In en, this message translates to:
  /// **'No detections for this species'**
  String get noDetectionsForSpecies;

  /// No description provided for @removeFilter.
  ///
  /// In en, this message translates to:
  /// **'Remove filter'**
  String get removeFilter;

  /// No description provided for @detectionsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} detections'**
  String detectionsCount(int count);

  /// No description provided for @filterDetections.
  ///
  /// In en, this message translates to:
  /// **'Filter Detections'**
  String get filterDetections;

  /// No description provided for @minimumConfidenceThreshold.
  ///
  /// In en, this message translates to:
  /// **'Minimum Confidence Threshold'**
  String get minimumConfidenceThreshold;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @charts.
  ///
  /// In en, this message translates to:
  /// **'Charts'**
  String get charts;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get daily;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @detectionsBySpecies.
  ///
  /// In en, this message translates to:
  /// **'Detections by Species'**
  String get detectionsBySpecies;

  /// No description provided for @hourlyDistribution.
  ///
  /// In en, this message translates to:
  /// **'Hourly Distribution'**
  String get hourlyDistribution;

  /// No description provided for @noChartAvailable.
  ///
  /// In en, this message translates to:
  /// **'No chart available'**
  String get noChartAvailable;

  /// No description provided for @weeklyReport.
  ///
  /// In en, this message translates to:
  /// **'Weekly Report'**
  String get weeklyReport;

  /// No description provided for @newSpecies.
  ///
  /// In en, this message translates to:
  /// **'New Species'**
  String get newSpecies;

  /// No description provided for @newFemale.
  ///
  /// In en, this message translates to:
  /// **'New!'**
  String get newFemale;

  /// No description provided for @identifiedSpecies.
  ///
  /// In en, this message translates to:
  /// **'Identified Species'**
  String get identifiedSpecies;

  /// No description provided for @byDate.
  ///
  /// In en, this message translates to:
  /// **'By Date'**
  String get byDate;

  /// No description provided for @bySpecies.
  ///
  /// In en, this message translates to:
  /// **'By Species'**
  String get bySpecies;

  /// No description provided for @exportToEbird.
  ///
  /// In en, this message translates to:
  /// **'Export to eBird ({date})'**
  String exportToEbird(String date);

  /// No description provided for @noRecordings.
  ///
  /// In en, this message translates to:
  /// **'No recordings'**
  String get noRecordings;

  /// No description provided for @deleteRecording.
  ///
  /// In en, this message translates to:
  /// **'Delete Recording'**
  String get deleteRecording;

  /// No description provided for @deleteRecordingConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete \"{name}\" from {date} {time}?'**
  String deleteRecordingConfirmation(String name, String date, String time);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @noSpeciesFound.
  ///
  /// In en, this message translates to:
  /// **'No species found.'**
  String get noSpeciesFound;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @noRecordingsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No recordings available.'**
  String get noRecordingsAvailable;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// No description provided for @changeId.
  ///
  /// In en, this message translates to:
  /// **'Change ID'**
  String get changeId;

  /// No description provided for @protect.
  ///
  /// In en, this message translates to:
  /// **'Protect'**
  String get protect;

  /// No description provided for @unprotect.
  ///
  /// In en, this message translates to:
  /// **'Unprotect'**
  String get unprotect;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @cannotDownloadFile.
  ///
  /// In en, this message translates to:
  /// **'Cannot download file'**
  String get cannotDownloadFile;

  /// No description provided for @errorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading'**
  String get errorLoading;

  /// No description provided for @autoDetectionsViaBirdNet.
  ///
  /// In en, this message translates to:
  /// **'Automatic detections via BirdNET-Pi...'**
  String get autoDetectionsViaBirdNet;

  /// No description provided for @downloadStartedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Download started successfully!'**
  String get downloadStartedSuccessfully;

  /// No description provided for @cannotDownloadCsv.
  ///
  /// In en, this message translates to:
  /// **'Cannot download CSV.'**
  String get cannotDownloadCsv;

  /// No description provided for @zipDownloadInProgress.
  ///
  /// In en, this message translates to:
  /// **'ZIP download in progress...'**
  String get zipDownloadInProgress;

  /// No description provided for @cannotOpenZipUrl.
  ///
  /// In en, this message translates to:
  /// **'Cannot open URL for ZIP download'**
  String get cannotOpenZipUrl;

  /// No description provided for @serverDidNotReturnDownloadUrl.
  ///
  /// In en, this message translates to:
  /// **'The server did not return the download URL.'**
  String get serverDidNotReturnDownloadUrl;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get serverError;

  /// No description provided for @ebirdExport.
  ///
  /// In en, this message translates to:
  /// **'eBird Export'**
  String get ebirdExport;

  /// No description provided for @generateCsvForEbird.
  ///
  /// In en, this message translates to:
  /// **'Generate CSV for eBird'**
  String get generateCsvForEbird;

  /// No description provided for @downloadAudioZip.
  ///
  /// In en, this message translates to:
  /// **'Download Audio (ZIP)'**
  String get downloadAudioZip;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @continueStep.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueStep;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @configuration.
  ///
  /// In en, this message translates to:
  /// **'Configuration'**
  String get configuration;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @autoRemoveLessThan80.
  ///
  /// In en, this message translates to:
  /// **'Automatically remove < 80%'**
  String get autoRemoveLessThan80;

  /// No description provided for @speciesRead.
  ///
  /// In en, this message translates to:
  /// **'Species read: {totalSpecies} | Occurrences: {totalDetects}'**
  String speciesRead(int totalSpecies, int totalDetects);

  /// No description provided for @detectionsCountStr.
  ///
  /// In en, this message translates to:
  /// **'{count} detections'**
  String detectionsCountStr(int count);

  /// No description provided for @protocol.
  ///
  /// In en, this message translates to:
  /// **'Protocol'**
  String get protocol;

  /// No description provided for @stationaryPoint.
  ///
  /// In en, this message translates to:
  /// **'Stationary - Fixed point'**
  String get stationaryPoint;

  /// No description provided for @nocturnalFlightCall.
  ///
  /// In en, this message translates to:
  /// **'Nocturnal Flight Call (NFC)'**
  String get nocturnalFlightCall;

  /// No description provided for @incidental.
  ///
  /// In en, this message translates to:
  /// **'Incidental'**
  String get incidental;

  /// No description provided for @localityName.
  ///
  /// In en, this message translates to:
  /// **'Locality Name *'**
  String get localityName;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get requiredField;

  /// No description provided for @numberOfObservers.
  ///
  /// In en, this message translates to:
  /// **'Number of Observers'**
  String get numberOfObservers;

  /// No description provided for @additionalComments.
  ///
  /// In en, this message translates to:
  /// **'Additional Comments'**
  String get additionalComments;

  /// No description provided for @includeAudioFileNamesInComments.
  ///
  /// In en, this message translates to:
  /// **'Include audio file names in comments'**
  String get includeAudioFileNamesInComments;

  /// No description provided for @readyForExport.
  ///
  /// In en, this message translates to:
  /// **'Ready for export'**
  String get readyForExport;

  /// No description provided for @totalUniqueSpecies.
  ///
  /// In en, this message translates to:
  /// **'Total Species (Unique)'**
  String get totalUniqueSpecies;

  /// No description provided for @hourlyModeledChecklists.
  ///
  /// In en, this message translates to:
  /// **'Hourly modeled checklists'**
  String get hourlyModeledChecklists;

  /// No description provided for @averageConfidence.
  ///
  /// In en, this message translates to:
  /// **'Average Confidence'**
  String get averageConfidence;

  /// No description provided for @wizardInfoText.
  ///
  /// In en, this message translates to:
  /// **'By pressing \"Generate CSV\", the file will be compiled dividing the stations by hour, ready to be uploaded to eBird.'**
  String get wizardInfoText;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @systemLogs.
  ///
  /// In en, this message translates to:
  /// **'System Logs'**
  String get systemLogs;

  /// No description provided for @systemTools.
  ///
  /// In en, this message translates to:
  /// **'System Tools'**
  String get systemTools;

  /// No description provided for @systemControls.
  ///
  /// In en, this message translates to:
  /// **'System Controls'**
  String get systemControls;

  /// No description provided for @restart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get restart;

  /// No description provided for @restartRaspberryPi.
  ///
  /// In en, this message translates to:
  /// **'Restart the Raspberry Pi'**
  String get restartRaspberryPi;

  /// No description provided for @areYouSureYouWantToRestart.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to restart the system?'**
  String get areYouSureYouWantToRestart;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @updateBirdNetPi.
  ///
  /// In en, this message translates to:
  /// **'Update BirdNET-Pi to the latest version'**
  String get updateBirdNetPi;

  /// No description provided for @doYouWantToUpdateBirdNet.
  ///
  /// In en, this message translates to:
  /// **'Do you want to update BirdNET-Pi?'**
  String get doYouWantToUpdateBirdNet;

  /// No description provided for @shutdown.
  ///
  /// In en, this message translates to:
  /// **'Shutdown'**
  String get shutdown;

  /// No description provided for @shutdownRaspberryPi.
  ///
  /// In en, this message translates to:
  /// **'Shutdown the Raspberry Pi'**
  String get shutdownRaspberryPi;

  /// No description provided for @areYouSureYouWantToShutdown.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to shutdown the system?'**
  String get areYouSureYouWantToShutdown;

  /// No description provided for @clearAllData.
  ///
  /// In en, this message translates to:
  /// **'Clear All Data'**
  String get clearAllData;

  /// No description provided for @removeAllRecordingsAndDetections.
  ///
  /// In en, this message translates to:
  /// **'Remove all recordings and detections'**
  String get removeAllRecordingsAndDetections;

  /// No description provided for @warningAllDataWillBeDeleted.
  ///
  /// In en, this message translates to:
  /// **'WARNING: All data will be permanently deleted. Continue?'**
  String get warningAllDataWillBeDeleted;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @liveAudioStream.
  ///
  /// In en, this message translates to:
  /// **'Live Audio Stream'**
  String get liveAudioStream;

  /// No description provided for @birdNetAnalysis.
  ///
  /// In en, this message translates to:
  /// **'BirdNET Analysis'**
  String get birdNetAnalysis;

  /// No description provided for @birdNetRecording.
  ///
  /// In en, this message translates to:
  /// **'BirdNET Recording'**
  String get birdNetRecording;

  /// No description provided for @birdNetLog.
  ///
  /// In en, this message translates to:
  /// **'BirdNET Log'**
  String get birdNetLog;

  /// No description provided for @chartViewer.
  ///
  /// In en, this message translates to:
  /// **'Chart Viewer'**
  String get chartViewer;

  /// No description provided for @spectrogram.
  ///
  /// In en, this message translates to:
  /// **'Spectrogram'**
  String get spectrogram;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @stopServices.
  ///
  /// In en, this message translates to:
  /// **'Stop Services'**
  String get stopServices;

  /// No description provided for @restartServices.
  ///
  /// In en, this message translates to:
  /// **'Restart Services'**
  String get restartServices;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @execution.
  ///
  /// In en, this message translates to:
  /// **'Execution:'**
  String get execution;

  /// No description provided for @commandExecuted.
  ///
  /// In en, this message translates to:
  /// **'✅ Command executed'**
  String get commandExecuted;

  /// No description provided for @errorMsg.
  ///
  /// In en, this message translates to:
  /// **'❌ Error: {error}'**
  String errorMsg(String error);

  /// No description provided for @species.
  ///
  /// In en, this message translates to:
  /// **'Species'**
  String get species;

  /// No description provided for @noSpeciesDetected.
  ///
  /// In en, this message translates to:
  /// **'No species detected'**
  String get noSpeciesDetected;

  /// No description provided for @max.
  ///
  /// In en, this message translates to:
  /// **'Max:'**
  String get max;

  /// No description provided for @detections.
  ///
  /// In en, this message translates to:
  /// **'Detections'**
  String get detections;

  /// No description provided for @maxConfidence.
  ///
  /// In en, this message translates to:
  /// **'Max Confidence'**
  String get maxConfidence;

  /// No description provided for @searchSpecies.
  ///
  /// In en, this message translates to:
  /// **'Search species...'**
  String get searchSpecies;

  /// No description provided for @errorMsgSimple.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorMsgSimple;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @basicSettings.
  ///
  /// In en, this message translates to:
  /// **'Basic Settings'**
  String get basicSettings;

  /// No description provided for @basicSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Configure time, location, language, and notifications.'**
  String get basicSettingsSubtitle;

  /// No description provided for @advancedSettings.
  ///
  /// In en, this message translates to:
  /// **'Advanced Settings'**
  String get advancedSettings;

  /// No description provided for @advancedSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Configure audio, privacy, disk management, and more.'**
  String get advancedSettingsSubtitle;

  /// No description provided for @connection.
  ///
  /// In en, this message translates to:
  /// **'Connection'**
  String get connection;

  /// No description provided for @birdNetPiServerAddress.
  ///
  /// In en, this message translates to:
  /// **'BirdNET-Pi Server Address'**
  String get birdNetPiServerAddress;

  /// No description provided for @enterIpOrHostname.
  ///
  /// In en, this message translates to:
  /// **'Enter the IP address or hostname of your Raspberry Pi'**
  String get enterIpOrHostname;

  /// No description provided for @testInProgress.
  ///
  /// In en, this message translates to:
  /// **'Test in progress...'**
  String get testInProgress;

  /// No description provided for @saveAndTestConnection.
  ///
  /// In en, this message translates to:
  /// **'Save and Test Connection'**
  String get saveAndTestConnection;

  /// No description provided for @deviceInformation.
  ///
  /// In en, this message translates to:
  /// **'Device Information'**
  String get deviceInformation;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @notConnected.
  ///
  /// In en, this message translates to:
  /// **'Not connected'**
  String get notConnected;

  /// No description provided for @configureServerAddress.
  ///
  /// In en, this message translates to:
  /// **'Configure the server address'**
  String get configureServerAddress;

  /// No description provided for @latitude.
  ///
  /// In en, this message translates to:
  /// **'Latitude'**
  String get latitude;

  /// No description provided for @longitude.
  ///
  /// In en, this message translates to:
  /// **'Longitude'**
  String get longitude;

  /// No description provided for @locality.
  ///
  /// In en, this message translates to:
  /// **'Locality'**
  String get locality;

  /// No description provided for @stateProvince.
  ///
  /// In en, this message translates to:
  /// **'State/Province'**
  String get stateProvince;

  /// No description provided for @countryCode.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get countryCode;

  /// No description provided for @information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get appVersion;

  /// No description provided for @appDescription.
  ///
  /// In en, this message translates to:
  /// **'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.'**
  String get appDescription;

  /// No description provided for @connectedTo.
  ///
  /// In en, this message translates to:
  /// **'✅ Connected to {url}'**
  String connectedTo(String url);

  /// No description provided for @cannotConnectTo.
  ///
  /// In en, this message translates to:
  /// **'❌ Cannot connect to {url}'**
  String cannotConnectTo(String url);

  /// No description provided for @errorLoadingSettings.
  ///
  /// In en, this message translates to:
  /// **'Error loading settings: {error}'**
  String errorLoadingSettings(String error);

  /// No description provided for @basicSettingsSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Basic settings saved successfully'**
  String get basicSettingsSavedSuccessfully;

  /// No description provided for @errorWhileSaving.
  ///
  /// In en, this message translates to:
  /// **'Error while saving'**
  String get errorWhileSaving;

  /// No description provided for @exceptionDuringSave.
  ///
  /// In en, this message translates to:
  /// **'Exception during save: {error}'**
  String exceptionDuringSave(String error);

  /// No description provided for @model.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get model;

  /// No description provided for @selectAModel.
  ///
  /// In en, this message translates to:
  /// **'Select a Model:'**
  String get selectAModel;

  /// No description provided for @speciesRangeModel.
  ///
  /// In en, this message translates to:
  /// **'Species range model V2.4 - V2'**
  String get speciesRangeModel;

  /// No description provided for @speciesOccurrenceFrequencyThreshold.
  ///
  /// In en, this message translates to:
  /// **'Species Occurrence Frequency Threshold [0.0005, 0.99]:'**
  String get speciesOccurrenceFrequencyThreshold;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @siteName.
  ///
  /// In en, this message translates to:
  /// **'Site Name:'**
  String get siteName;

  /// No description provided for @latitudeInput.
  ///
  /// In en, this message translates to:
  /// **'Latitude:'**
  String get latitudeInput;

  /// No description provided for @longitudeInput.
  ///
  /// In en, this message translates to:
  /// **'Longitude:'**
  String get longitudeInput;

  /// No description provided for @birdWeatherToken.
  ///
  /// In en, this message translates to:
  /// **'BirdWeather Token:'**
  String get birdWeatherToken;

  /// No description provided for @notificationsApprise.
  ///
  /// In en, this message translates to:
  /// **'Notifications (Apprise)'**
  String get notificationsApprise;

  /// No description provided for @appriseConfig.
  ///
  /// In en, this message translates to:
  /// **'Apprise Notifications Configuration:'**
  String get appriseConfig;

  /// No description provided for @notificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Title:'**
  String get notificationTitle;

  /// No description provided for @notificationBody.
  ///
  /// In en, this message translates to:
  /// **'Notification Body:'**
  String get notificationBody;

  /// No description provided for @notifyNewInfrequent.
  ///
  /// In en, this message translates to:
  /// **'Notify each new infrequent species detection'**
  String get notifyNewInfrequent;

  /// No description provided for @notifyFirstDetectionOfDay.
  ///
  /// In en, this message translates to:
  /// **'Notify each species first detection of the day'**
  String get notifyFirstDetectionOfDay;

  /// No description provided for @notifyEachNewDetection.
  ///
  /// In en, this message translates to:
  /// **'Notify each new detection'**
  String get notifyEachNewDetection;

  /// No description provided for @sendWeeklyReport.
  ///
  /// In en, this message translates to:
  /// **'Send weekly report'**
  String get sendWeeklyReport;

  /// No description provided for @minTimeBetweenNotifications.
  ///
  /// In en, this message translates to:
  /// **'Minimum time between notifications of the same species (sec):'**
  String get minTimeBetweenNotifications;

  /// No description provided for @excludeTheseSpecies.
  ///
  /// In en, this message translates to:
  /// **'Exclude these species (comma separated):'**
  String get excludeTheseSpecies;

  /// No description provided for @onlyNotifyForTheseSpecies.
  ///
  /// In en, this message translates to:
  /// **'ONLY notify for these species (comma separated):'**
  String get onlyNotifyForTheseSpecies;

  /// No description provided for @imageSource.
  ///
  /// In en, this message translates to:
  /// **'Image Source'**
  String get imageSource;

  /// No description provided for @imageProvider.
  ///
  /// In en, this message translates to:
  /// **'Image Provider:'**
  String get imageProvider;

  /// No description provided for @flickrApiKey.
  ///
  /// In en, this message translates to:
  /// **'Flickr API Key:'**
  String get flickrApiKey;

  /// No description provided for @flickrFilterEmail.
  ///
  /// In en, this message translates to:
  /// **'Only search photos from this Flickr user:'**
  String get flickrFilterEmail;

  /// No description provided for @localization.
  ///
  /// In en, this message translates to:
  /// **'Localization'**
  String get localization;

  /// No description provided for @databaseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Database Language:'**
  String get databaseLanguage;

  /// No description provided for @otherInfo.
  ///
  /// In en, this message translates to:
  /// **'Other Info'**
  String get otherInfo;

  /// No description provided for @infoSite.
  ///
  /// In en, this message translates to:
  /// **'Info Site:'**
  String get infoSite;

  /// No description provided for @themeWeb.
  ///
  /// In en, this message translates to:
  /// **'Graphic Theme (Web)'**
  String get themeWeb;

  /// No description provided for @colorScheme.
  ///
  /// In en, this message translates to:
  /// **'Color Scheme:'**
  String get colorScheme;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @advancedSettingsSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Advanced settings saved successfully'**
  String get advancedSettingsSavedSuccessfully;

  /// No description provided for @privacyRecordings.
  ///
  /// In en, this message translates to:
  /// **'Recordings Privacy'**
  String get privacyRecordings;

  /// No description provided for @privacyThreshold.
  ///
  /// In en, this message translates to:
  /// **'Privacy Threshold [0, 99]:'**
  String get privacyThreshold;

  /// No description provided for @diskSpaceManagement.
  ///
  /// In en, this message translates to:
  /// **'Disk Space Management'**
  String get diskSpaceManagement;

  /// No description provided for @whenDiskIsFull.
  ///
  /// In en, this message translates to:
  /// **'When Disk is Full:'**
  String get whenDiskIsFull;

  /// No description provided for @purgeCapacity.
  ///
  /// In en, this message translates to:
  /// **'Purge capacity [% threshold]:'**
  String get purgeCapacity;

  /// No description provided for @maxFilesToKeepPerSpecies.
  ///
  /// In en, this message translates to:
  /// **'Max files to keep per species (0 = disable):'**
  String get maxFilesToKeepPerSpecies;

  /// No description provided for @audioSettings.
  ///
  /// In en, this message translates to:
  /// **'Audio Settings'**
  String get audioSettings;

  /// No description provided for @alsaInputCaptureDevice.
  ///
  /// In en, this message translates to:
  /// **'ALSA input capture device (Soundcard):'**
  String get alsaInputCaptureDevice;

  /// No description provided for @numberOfAudioChannels.
  ///
  /// In en, this message translates to:
  /// **'Number of audio channels to extract from:'**
  String get numberOfAudioChannels;

  /// No description provided for @overlap.
  ///
  /// In en, this message translates to:
  /// **'Overlap (sec) [0, 2.9]:'**
  String get overlap;

  /// No description provided for @audioFormat.
  ///
  /// In en, this message translates to:
  /// **'Audio Format:'**
  String get audioFormat;

  /// No description provided for @recordingLength.
  ///
  /// In en, this message translates to:
  /// **'Recording Length (sec):'**
  String get recordingLength;

  /// No description provided for @extractionLength.
  ///
  /// In en, this message translates to:
  /// **'Extraction Length (sec):'**
  String get extractionLength;

  /// No description provided for @rtspAudioSharing.
  ///
  /// In en, this message translates to:
  /// **'RTSP Audio Sharing'**
  String get rtspAudioSharing;

  /// No description provided for @shareLiveAudioStream.
  ///
  /// In en, this message translates to:
  /// **'Share live audio stream?'**
  String get shareLiveAudioStream;

  /// No description provided for @playAudioStreamThroughWebUi.
  ///
  /// In en, this message translates to:
  /// **'Play audio stream through Web UI?'**
  String get playAudioStreamThroughWebUi;

  /// No description provided for @caddyPassword.
  ///
  /// In en, this message translates to:
  /// **'Caddy Password'**
  String get caddyPassword;

  /// No description provided for @appPassword.
  ///
  /// In en, this message translates to:
  /// **'App Password:'**
  String get appPassword;

  /// No description provided for @customLogoImage.
  ///
  /// In en, this message translates to:
  /// **'Custom Logo Image'**
  String get customLogoImage;

  /// No description provided for @customImageUrl.
  ///
  /// In en, this message translates to:
  /// **'Custom Image URL:'**
  String get customImageUrl;

  /// No description provided for @customImageTitle.
  ///
  /// In en, this message translates to:
  /// **'Custom Image Title:'**
  String get customImageTitle;

  /// No description provided for @birdNetLiteModelSettings.
  ///
  /// In en, this message translates to:
  /// **'BirdNET-Lite Model Settings'**
  String get birdNetLiteModelSettings;

  /// No description provided for @confidenceThreshold.
  ///
  /// In en, this message translates to:
  /// **'Confidence threshold [0, 0.99]:'**
  String get confidenceThreshold;

  /// No description provided for @sensitivity.
  ///
  /// In en, this message translates to:
  /// **'Sensitivity [0.5, 1.5]:'**
  String get sensitivity;

  /// No description provided for @otherSettings.
  ///
  /// In en, this message translates to:
  /// **'Other Settings'**
  String get otherSettings;

  /// No description provided for @silenceUpdateIndicator.
  ///
  /// In en, this message translates to:
  /// **'Silence \"Update Available\" Indicator'**
  String get silenceUpdateIndicator;

  /// No description provided for @automaticUpdate.
  ///
  /// In en, this message translates to:
  /// **'Automatic Update'**
  String get automaticUpdate;

  /// No description provided for @saveRawSpectrograms.
  ///
  /// In en, this message translates to:
  /// **'Save Raw Spectrograms'**
  String get saveRawSpectrograms;

  /// No description provided for @loggingLevels.
  ///
  /// In en, this message translates to:
  /// **'Logging Levels'**
  String get loggingLevels;

  /// No description provided for @birdnetRecordingService.
  ///
  /// In en, this message translates to:
  /// **'BirdNET Recording Service:'**
  String get birdnetRecordingService;

  /// No description provided for @spectrogramViewerService.
  ///
  /// In en, this message translates to:
  /// **'Spectrogram Viewer Service:'**
  String get spectrogramViewerService;

  /// No description provided for @liveAudioStreamService.
  ///
  /// In en, this message translates to:
  /// **'Live Audio Stream Service:'**
  String get liveAudioStreamService;

  /// No description provided for @speciesListsManagement.
  ///
  /// In en, this message translates to:
  /// **'Species Lists Management'**
  String get speciesListsManagement;

  /// No description provided for @inclusion.
  ///
  /// In en, this message translates to:
  /// **'Inclusion'**
  String get inclusion;

  /// No description provided for @exclusion.
  ///
  /// In en, this message translates to:
  /// **'Exclusion'**
  String get exclusion;

  /// No description provided for @whitelist.
  ///
  /// In en, this message translates to:
  /// **'Whitelist'**
  String get whitelist;

  /// No description provided for @speciesAlreadyInList.
  ///
  /// In en, this message translates to:
  /// **'Species already present in the list'**
  String get speciesAlreadyInList;

  /// No description provided for @listSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'List saved successfully'**
  String get listSavedSuccessfully;

  /// No description provided for @errorSavingList.
  ///
  /// In en, this message translates to:
  /// **'Error while saving the list'**
  String get errorSavingList;

  /// No description provided for @errorLoadingList.
  ///
  /// In en, this message translates to:
  /// **'Error loading the list:\\n{error}'**
  String errorLoadingList(String error);

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @searchSpeciesHint.
  ///
  /// In en, this message translates to:
  /// **'Search species (e.g. Turdus merula_Common Blackbird)'**
  String get searchSpeciesHint;

  /// No description provided for @loadingSpecies.
  ///
  /// In en, this message translates to:
  /// **'Loading species...'**
  String get loadingSpecies;

  /// No description provided for @errorLoadingSpecies.
  ///
  /// In en, this message translates to:
  /// **'Error loading species'**
  String get errorLoadingSpecies;

  /// No description provided for @noSpeciesInThisList.
  ///
  /// In en, this message translates to:
  /// **'No species in this list.'**
  String get noSpeciesInThisList;

  /// No description provided for @removeFromList.
  ///
  /// In en, this message translates to:
  /// **'Remove from list'**
  String get removeFromList;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @loginRequired.
  ///
  /// In en, this message translates to:
  /// **'Login required for this action'**
  String get loginRequired;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Authentication'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your credentials to access protected features.'**
  String get loginSubtitle;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @loginEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Please enter username and password'**
  String get loginEmptyError;

  /// No description provided for @loginInvalidError.
  ///
  /// In en, this message translates to:
  /// **'Invalid credentials'**
  String get loginInvalidError;

  /// No description provided for @authenticated.
  ///
  /// In en, this message translates to:
  /// **'Authenticated'**
  String get authenticated;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @loggedInMessage.
  ///
  /// In en, this message translates to:
  /// **'You are currently authenticated.'**
  String get loggedInMessage;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @audioStream.
  ///
  /// In en, this message translates to:
  /// **'Audio Stream'**
  String get audioStream;

  /// No description provided for @pressPlayToListen.
  ///
  /// In en, this message translates to:
  /// **'Press play to listen'**
  String get pressPlayToListen;

  /// No description provided for @loginToStart.
  ///
  /// In en, this message translates to:
  /// **'Log in with 🔒 to start'**
  String get loginToStart;

  /// No description provided for @streamRequiresAuth.
  ///
  /// In en, this message translates to:
  /// **'The stream requires authentication. Tap the 🔒 icon in the top right to log in.'**
  String get streamRequiresAuth;

  /// No description provided for @liveAudioFootnote.
  ///
  /// In en, this message translates to:
  /// **'BirdNET-Pi Live Audio'**
  String get liveAudioFootnote;

  /// No description provided for @unmute.
  ///
  /// In en, this message translates to:
  /// **'Unmute'**
  String get unmute;

  /// No description provided for @mute.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get mute;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @autoRefresh.
  ///
  /// In en, this message translates to:
  /// **'Auto-refresh'**
  String get autoRefresh;

  /// No description provided for @pressPlaySpectrogram.
  ///
  /// In en, this message translates to:
  /// **'Press ▶ to view the spectrogram'**
  String get pressPlaySpectrogram;

  /// No description provided for @pressPlayRealtimeSpectrogram.
  ///
  /// In en, this message translates to:
  /// **'Press ▶ to start the real-time spectrogram'**
  String get pressPlayRealtimeSpectrogram;

  /// No description provided for @loginThenPlay.
  ///
  /// In en, this message translates to:
  /// **'Log in with 🔒 then press ▶'**
  String get loginThenPlay;

  /// No description provided for @currentAnalyzing.
  ///
  /// In en, this message translates to:
  /// **'Current Analyzing'**
  String get currentAnalyzing;

  /// No description provided for @accessRestricted.
  ///
  /// In en, this message translates to:
  /// **'Access restricted'**
  String get accessRestricted;

  /// No description provided for @loginToAccessSection.
  ///
  /// In en, this message translates to:
  /// **'Log in to access this section.'**
  String get loginToAccessSection;

  /// No description provided for @iframeNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Iframes are strictly supported on the web version.'**
  String get iframeNotSupported;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @searchSpeciesStr.
  ///
  /// In en, this message translates to:
  /// **'Search species...'**
  String get searchSpeciesStr;

  /// No description provided for @otherUtilities.
  ///
  /// In en, this message translates to:
  /// **'Other Utilities'**
  String get otherUtilities;

  /// No description provided for @liveSeconds.
  ///
  /// In en, this message translates to:
  /// **'LIVE · {seconds}s'**
  String liveSeconds(int seconds);

  /// No description provided for @spectrogramNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Spectrogram not available'**
  String get spectrogramNotAvailable;

  /// No description provided for @ebirdCountIdentifier.
  ///
  /// In en, this message translates to:
  /// **'N°'**
  String get ebirdCountIdentifier;

  /// No description provided for @ebirdCountDefault.
  ///
  /// In en, this message translates to:
  /// **'X'**
  String get ebirdCountDefault;

  /// No description provided for @ebirdProtocolStationary.
  ///
  /// In en, this message translates to:
  /// **'Stationary'**
  String get ebirdProtocolStationary;

  /// No description provided for @ebirdProtocolIncidental.
  ///
  /// In en, this message translates to:
  /// **'Incidental'**
  String get ebirdProtocolIncidental;

  /// No description provided for @ebirdProtocolNFC.
  ///
  /// In en, this message translates to:
  /// **'P54'**
  String get ebirdProtocolNFC;

  /// No description provided for @tooltipRefresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get tooltipRefresh;

  /// No description provided for @tooltipStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get tooltipStop;

  /// No description provided for @tooltipStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get tooltipStart;

  /// No description provided for @tooltipRestart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get tooltipRestart;

  /// No description provided for @systemInfo.
  ///
  /// In en, this message translates to:
  /// **'System Info'**
  String get systemInfo;

  /// No description provided for @fileManager.
  ///
  /// In en, this message translates to:
  /// **'File Manager'**
  String get fileManager;

  /// No description provided for @databaseMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Database Maintenance'**
  String get databaseMaintenance;

  /// No description provided for @webTerminal.
  ///
  /// In en, this message translates to:
  /// **'Web Terminal'**
  String get webTerminal;

  /// No description provided for @tooltipOpenMenu.
  ///
  /// In en, this message translates to:
  /// **'Open menu'**
  String get tooltipOpenMenu;

  /// No description provided for @tooltipRefreshData.
  ///
  /// In en, this message translates to:
  /// **'Refresh data'**
  String get tooltipRefreshData;

  /// No description provided for @tooltipPreviousDay.
  ///
  /// In en, this message translates to:
  /// **'Previous day'**
  String get tooltipPreviousDay;

  /// No description provided for @tooltipNextDay.
  ///
  /// In en, this message translates to:
  /// **'Next day'**
  String get tooltipNextDay;

  /// No description provided for @tooltipPreviousWeek.
  ///
  /// In en, this message translates to:
  /// **'Previous week'**
  String get tooltipPreviousWeek;

  /// No description provided for @tooltipNextWeek.
  ///
  /// In en, this message translates to:
  /// **'Next week'**
  String get tooltipNextWeek;

  /// No description provided for @tooltipDeleteRecording.
  ///
  /// In en, this message translates to:
  /// **'Delete recording'**
  String get tooltipDeleteRecording;

  /// No description provided for @tooltipClearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get tooltipClearSearch;

  /// No description provided for @tooltipCloseSearch.
  ///
  /// In en, this message translates to:
  /// **'Close search'**
  String get tooltipCloseSearch;

  /// No description provided for @tooltipSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get tooltipSearch;

  /// No description provided for @tooltipPlay.
  ///
  /// In en, this message translates to:
  /// **'Play audio'**
  String get tooltipPlay;

  /// No description provided for @tooltipPickDate.
  ///
  /// In en, this message translates to:
  /// **'Pick a date'**
  String get tooltipPickDate;

  /// No description provided for @passwordOptionalHint.
  ///
  /// In en, this message translates to:
  /// **'Leave empty if not set'**
  String get passwordOptionalHint;

  /// No description provided for @systemStatus.
  ///
  /// In en, this message translates to:
  /// **'System Status'**
  String get systemStatus;

  /// No description provided for @sysInfoUptime.
  ///
  /// In en, this message translates to:
  /// **'Uptime'**
  String get sysInfoUptime;

  /// No description provided for @sysInfoDisk.
  ///
  /// In en, this message translates to:
  /// **'Disk'**
  String get sysInfoDisk;

  /// No description provided for @sysInfoMemory.
  ///
  /// In en, this message translates to:
  /// **'Memory'**
  String get sysInfoMemory;

  /// No description provided for @sysInfoCpuTemp.
  ///
  /// In en, this message translates to:
  /// **'CPU Temp'**
  String get sysInfoCpuTemp;

  /// No description provided for @sysInfoBranch.
  ///
  /// In en, this message translates to:
  /// **'Branch'**
  String get sysInfoBranch;

  /// No description provided for @sysInfoCommitsBehind.
  ///
  /// In en, this message translates to:
  /// **'{count} commits behind'**
  String sysInfoCommitsBehind(int count);

  /// No description provided for @sysInfoLoadingError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load system info.'**
  String get sysInfoLoadingError;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// No description provided for @disable.
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get disable;

  /// No description provided for @weekStr.
  ///
  /// In en, this message translates to:
  /// **'Week {weekNumber} - {year}'**
  String weekStr(int weekNumber, int year);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
