// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Мониторинг на птици';

  @override
  String get home => 'Начало';

  @override
  String get today => 'Днес';

  @override
  String get recordings => 'Записи';

  @override
  String get liveStream => 'Поток на живо';

  @override
  String get liveSpectrogram => 'Спектограма на живо';

  @override
  String get speciesManagement => 'УПРАВЛЕНИЕ НА ВИДОВЕ';

  @override
  String get inclusionList => 'Списък за включване';

  @override
  String get exclusionList => 'Списък за изключване';

  @override
  String get analysisLog => 'Дневник на анализа';

  @override
  String get openWebInterface => 'Отвори уеб интерфейс';

  @override
  String get loadingLiveSpectrogram => 'Зареждане на спектрограма...';

  @override
  String get spectrogramInstruction =>
      'Ако аудиото не започне автоматично, моля взаимодействайте със страницата или проверете разрешенията на браузъра.';

  @override
  String get configureServerFirst =>
      'Първо конфигурирайте адреса на сървъра в Настройки';

  @override
  String get recentDetections => 'Последни откривания';

  @override
  String get latestDetection => 'Последна детекция';

  @override
  String get audioFile => 'Аудио файл';

  @override
  String get playing => 'Възпроизвеждане';

  @override
  String get noDetectionsToday => 'Няма откривания днес';

  @override
  String get systemListening => 'Системата слуша...';

  @override
  String get errorOccurred => 'Възникна грешка';

  @override
  String get overview => 'Преглед';

  @override
  String get detectionsAllTime => 'Откривания\nобщо';

  @override
  String get detectionsToday => 'Откривания\nднес';

  @override
  String get detectionsLastHour => 'Откривания\nпоследен час';

  @override
  String get speciesToday => 'Видове\nднес';

  @override
  String get speciesAllTime => 'Видове\nобщо';

  @override
  String get statsLoadingError => 'Грешка при зареждане на статистиката';

  @override
  String get todaysDetections => 'Днешни откривания';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count откривания';
  }

  @override
  String get filterDetections => 'Филтриране на откривания';

  @override
  String get minimumConfidenceThreshold => 'Минимален праг на увереност';

  @override
  String get reset => 'Нулиране';

  @override
  String get apply => 'Приложи';

  @override
  String get charts => 'Графики';

  @override
  String get daily => 'Дневно';

  @override
  String get weekly => 'Седмично';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Няма налична графика';

  @override
  String get weeklyReport => 'Седмичен отчет';

  @override
  String get newSpecies => 'Нов вид';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Идентифицирани видове';

  @override
  String get byDate => 'По дата';

  @override
  String get bySpecies => 'По вид';

  @override
  String exportToEbird(String date) {
    return 'Експортиране към eBird ($date)';
  }

  @override
  String get noRecordings => 'Няма записи';

  @override
  String get deleteRecording => 'Изтриване на запис';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Отказ';

  @override
  String get delete => 'Изтрий';

  @override
  String get noSpeciesFound => 'Не са намерени видове.';

  @override
  String get unknown => 'Неизвестен';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Плей';

  @override
  String get changeId => 'Промяна на ID';

  @override
  String get protect => 'Защити';

  @override
  String get unprotect => 'Премахни защитата';

  @override
  String get download => 'Изтегляне';

  @override
  String get cannotDownloadFile => 'Файлът не може да бъде изтеглен';

  @override
  String get errorLoading => 'Грешка при зареждане';

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
  String get ebirdExport => 'eBird Експорт';

  @override
  String get generateCsvForEbird => 'Генериране на CSV за eBird';

  @override
  String get downloadAudioZip => 'Изтегляне на аудио (ZIP)';

  @override
  String get close => 'Затвори';

  @override
  String get continueStep => 'Продължи';

  @override
  String get back => 'Назад';

  @override
  String get review => 'Преглед';

  @override
  String get configuration => 'Конфигурация';

  @override
  String get summary => 'Резюме';

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
  String get protocol => 'Протокол';

  @override
  String get stationaryPoint => 'Стационарен - Фиксирана точка';

  @override
  String get nocturnalFlightCall => 'Нощен полетен зов (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Име на мястото *';

  @override
  String get requiredField => 'Задължително поле';

  @override
  String get numberOfObservers => 'Брой наблюдатели';

  @override
  String get additionalComments => 'Допълнителни коментари';

  @override
  String get includeAudioFileNamesInComments =>
      'Включване на имената на аудио файловете в коментарите';

  @override
  String get readyForExport => 'Готово за експорт';

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
  String get statistics => 'Статистика';

  @override
  String get systemLogs => 'Системни дневници';

  @override
  String get systemTools => 'Системни инструменти';

  @override
  String get systemControls => 'Системни контроли';

  @override
  String get restart => 'Рестартиране';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Обновяване';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Изключване';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Изтриване на всички данни';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Услуги';

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
  String get spectrogram => 'Спектрограма';

  @override
  String get quickActions => 'Бързи действия';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Потвърди';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Командата е изпълнена';

  @override
  String errorMsg(String error) {
    return '❌ Грешка: $error';
  }

  @override
  String get species => 'Видове';

  @override
  String get noSpeciesDetected => 'Няма открити видове';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Откривания';

  @override
  String get maxConfidence => 'Максимална увереност';

  @override
  String get searchSpecies => 'Търсене на видове...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Настройки';

  @override
  String get basicSettings => 'Основни настройки';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Разширени настройки';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Връзка';

  @override
  String get birdNetPiServerAddress => 'Адрес на BirdNET-Pi сървъра';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Информация за устройството';

  @override
  String get loading => 'Зареждане...';

  @override
  String get notConnected => 'Няма връзка';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Географска ширина';

  @override
  String get longitude => 'Географска дължина';

  @override
  String get locality => 'Населено място';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Код на държавата';

  @override
  String get information => 'Информация';

  @override
  String get appVersion => 'Версия 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Свързан с $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Не може да се свърже с $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Грешка при зареждане на настройките: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Основните настройки са запазени успешно';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Модел';

  @override
  String get selectAModel => 'Изберете модел:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Местоположение';

  @override
  String get siteName => 'Име на обекта:';

  @override
  String get latitudeInput => 'Ширина:';

  @override
  String get longitudeInput => 'Дължина:';

  @override
  String get birdWeatherToken => 'BirdWeather Токен:';

  @override
  String get notificationsApprise => 'Известия (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Заглавие на известието:';

  @override
  String get notificationBody => 'Текст на известието:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Известие за всяко ново откриване';

  @override
  String get sendWeeklyReport => 'Изпращане на седмичен отчет';

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
  String get localization => 'Локализация';

  @override
  String get databaseLanguage => 'Език на базата данни:';

  @override
  String get otherInfo => 'Друга информация';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Графична тема (Web)';

  @override
  String get colorScheme => 'Цветова схема:';

  @override
  String get none => 'Няма';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Разширените настройки са запазени';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Управление на дисковото пространство';

  @override
  String get whenDiskIsFull => 'Когато дискът е пълен:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Аудио настройки';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Припокриване (сек) [0, 2.9]:';

  @override
  String get audioFormat => 'Аудио формат:';

  @override
  String get recordingLength => 'Продължителност на записа (сек):';

  @override
  String get extractionLength => 'Продължителност на екстракцията (сек):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Caddy парола';

  @override
  String get appPassword => 'Парола за приложението:';

  @override
  String get customLogoImage => 'Собствено лого';

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
  String get automaticUpdate => 'Автоматично обновяване';

  @override
  String get saveRawSpectrograms => 'Запазване на сурови спектрограми';

  @override
  String get loggingLevels => 'Нива на логване';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Управление на списъците с видове';

  @override
  String get inclusion => 'Включване';

  @override
  String get exclusion => 'Изключване';

  @override
  String get whitelist => 'Бял списък';

  @override
  String get speciesAlreadyInList => 'Видът вече е в списъка';

  @override
  String get listSavedSuccessfully => 'Списъкът е запазен успешно';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Повторен опит';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Зареждане на видове...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'Няма видове в този списък.';

  @override
  String get removeFromList => 'Премахни от списъка';

  @override
  String get saving => 'Запазване...';

  @override
  String get save => 'Запази';

  @override
  String get loginRequired => 'Изисква се вход';

  @override
  String get loginTitle => 'Автентикация';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Потребителско име';

  @override
  String get password => 'Парола';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Успешен вход';

  @override
  String get signIn => 'Вход';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Изход';

  @override
  String get login => 'Вход';

  @override
  String get audioStream => 'Аудио поток';

  @override
  String get pressPlayToListen => 'Натиснете плей за слушане';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Включи звука';

  @override
  String get mute => 'Заглуши';

  @override
  String get resume => 'Продължи';

  @override
  String get pause => 'Пауза';

  @override
  String get autoRefresh => 'Автоматично опресняване';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Анализира се в момента';

  @override
  String get accessRestricted => 'Ограничен достъп';

  @override
  String get loginToAccessSection => 'Влезте, за да достъпите този раздел.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Грешка';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Други инструменти';

  @override
  String liveSeconds(int seconds) {
    return 'НА ЖИВО · $secondsс';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram not available';

  @override
  String get ebirdCountIdentifier => '№';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationary';

  @override
  String get ebirdProtocolIncidental => 'Incidental';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Опресни';

  @override
  String get tooltipStop => 'Спри';

  @override
  String get tooltipStart => 'Стартирай';

  @override
  String get tooltipRestart => 'Рестартирай';

  @override
  String get systemInfo => 'Системна информация';

  @override
  String get fileManager => 'Файлов мениджър';

  @override
  String get databaseMaintenance => 'Поддръжка на базата данни';

  @override
  String get webTerminal => 'Уеб терминал';

  @override
  String get tooltipOpenMenu => 'Отвори менюто';

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
  String get tooltipSearch => 'Търсене';

  @override
  String get tooltipPlay => 'Възпроизвеждане на аудио';

  @override
  String get tooltipPickDate => 'Избор на дата';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Статус на системата';

  @override
  String get sysInfoUptime => 'Време на работа';

  @override
  String get sysInfoDisk => 'Диск';

  @override
  String get sysInfoMemory => 'Памет';

  @override
  String get sysInfoCpuTemp => 'Темп. на процесора';

  @override
  String get sysInfoBranch => 'Клон (Branch)';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Разреши';

  @override
  String get disable => 'Забрани';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Седмица $weekNumber - $year';
  }
}
