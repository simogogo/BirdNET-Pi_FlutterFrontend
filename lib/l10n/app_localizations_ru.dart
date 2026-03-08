// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Мониторинг птиц';

  @override
  String get home => 'Главная';

  @override
  String get today => 'Сегодня';

  @override
  String get recordings => 'Записи';

  @override
  String get liveStream => 'Прямой эфир';

  @override
  String get liveSpectrogram => 'Живая спектрограмма';

  @override
  String get speciesManagement => 'УПРАВЛЕНИЕ ВИДАМИ';

  @override
  String get inclusionList => 'Список включения';

  @override
  String get exclusionList => 'Список исключения';

  @override
  String get analysisLog => 'Журнал анализа';

  @override
  String get openWebInterface => 'Открыть веб-интерфейс';

  @override
  String get loadingLiveSpectrogram => 'Загрузка живой спектрограммы...';

  @override
  String get spectrogramInstruction =>
      'Если аудио не запускается автоматически, пожалуйста, взаимодействуйте со страницей или проверьте разрешения браузера.';

  @override
  String get configureServerFirst =>
      'Сначала настройте адрес сервера в Настройках';

  @override
  String get recentDetections => 'Последние обнаружения';

  @override
  String get latestDetection => 'Последнее обнаружение';

  @override
  String get audioFile => 'Аудиофайл';

  @override
  String get playing => 'Воспроизведение';

  @override
  String get noDetectionsToday => 'Сегодня обнаружений нет';

  @override
  String get systemListening => 'Система слушает...';

  @override
  String get errorOccurred => 'Произошла ошибка';

  @override
  String get overview => 'Обзор';

  @override
  String get detectionsAllTime => 'Обнаружений\nвсего';

  @override
  String get detectionsToday => 'Обнаружений\nсегодня';

  @override
  String get detectionsLastHour => 'Обнаружений\nза час';

  @override
  String get speciesToday => 'Видов\nсегодня';

  @override
  String get speciesAllTime => 'Видов\nвсего';

  @override
  String get statsLoadingError => 'Ошибка загрузки статистики';

  @override
  String get todaysDetections => 'Сегодняшние обнаружения';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count обнаружений';
  }

  @override
  String get filterDetections => 'Фильтр обнаружений';

  @override
  String get minimumConfidenceThreshold => 'Мин. порог достоверности';

  @override
  String get reset => 'Сброс';

  @override
  String get apply => 'Применить';

  @override
  String get charts => 'Графики';

  @override
  String get daily => 'Дневной';

  @override
  String get weekly => 'Еженедельный';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'График недоступен';

  @override
  String get weeklyReport => 'Еженедельный отчет';

  @override
  String get newSpecies => 'Новый вид';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Идентифицированные виды';

  @override
  String get byDate => 'По дате';

  @override
  String get bySpecies => 'По видам';

  @override
  String exportToEbird(String date) {
    return 'Экспорт в eBird ($date)';
  }

  @override
  String get noRecordings => 'Нет записей';

  @override
  String get deleteRecording => 'Удалить запись';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Отмена';

  @override
  String get delete => 'Удалить';

  @override
  String get noSpeciesFound => 'Виды не найдены.';

  @override
  String get unknown => 'Неизвестно';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Играть';

  @override
  String get changeId => 'Изменить ID';

  @override
  String get protect => 'Защитить';

  @override
  String get unprotect => 'Снять защиту';

  @override
  String get download => 'Скачать';

  @override
  String get cannotDownloadFile => 'Не удалось скачать файл';

  @override
  String get errorLoading => 'Ошибка загрузки';

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
  String get ebirdExport => 'Экспорт в eBird';

  @override
  String get generateCsvForEbird => 'Создать CSV для eBird';

  @override
  String get downloadAudioZip => 'Скачать аудио (ZIP)';

  @override
  String get close => 'Закрыть';

  @override
  String get continueStep => 'Продолжить';

  @override
  String get back => 'Назад';

  @override
  String get review => 'Проверка';

  @override
  String get configuration => 'Конфигурация';

  @override
  String get summary => 'Сводка';

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
  String get stationaryPoint => 'Стационарный - Точка';

  @override
  String get nocturnalFlightCall => 'Ночной позывной (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Название места *';

  @override
  String get requiredField => 'Обязательное поле';

  @override
  String get numberOfObservers => 'Число наблюдателей';

  @override
  String get additionalComments => 'Доп. комментарии';

  @override
  String get includeAudioFileNamesInComments =>
      'Включить имена аудиофайлов в комментарии';

  @override
  String get readyForExport => 'Готово к экспорту';

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
  String get systemLogs => 'Системные журналы';

  @override
  String get systemTools => 'Системные инструменты';

  @override
  String get systemControls => 'Управление системой';

  @override
  String get restart => 'Перезагрузка';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Обновить';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Выключение';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Очистить все данные';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Службы';

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
  String get spectrogram => 'Спектрограмма';

  @override
  String get quickActions => 'Быстрые действия';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Команда выполнена';

  @override
  String errorMsg(String error) {
    return '❌ Ошибка: $error';
  }

  @override
  String get species => 'Виды';

  @override
  String get noSpeciesDetected => 'Виды не обнаружены';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Обнаружения';

  @override
  String get maxConfidence => 'Макс. достоверность';

  @override
  String get searchSpecies => 'Поиск видов...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Настройки';

  @override
  String get basicSettings => 'Основные настройки';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Расширенные настройки';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Подключение';

  @override
  String get birdNetPiServerAddress => 'Адрес сервера BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Информация об устройстве';

  @override
  String get loading => 'Загрузка...';

  @override
  String get notConnected => 'Не подключено';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Широта';

  @override
  String get longitude => 'Долгота';

  @override
  String get locality => 'Населенный пункт';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Код страны';

  @override
  String get information => 'Информация';

  @override
  String get appVersion => 'Версия 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Подключено к $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Нет подключения к $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Ошибка загрузки настроек: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully => 'Настройки успешно сохранены';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Модель';

  @override
  String get selectAModel => 'Выберите модель:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Местоположение';

  @override
  String get siteName => 'Название объекта:';

  @override
  String get latitudeInput => 'Широта:';

  @override
  String get longitudeInput => 'Долгота:';

  @override
  String get birdWeatherToken => 'Токен BirdWeather:';

  @override
  String get notificationsApprise => 'Уведомления (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Заголовок уведомления:';

  @override
  String get notificationBody => 'Текст уведомления:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Уведомлять о каждом обнаружении';

  @override
  String get sendWeeklyReport => 'Отправлять еженедельный отчет';

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
  String get databaseLanguage => 'Язык базы данных:';

  @override
  String get otherInfo => 'Другая инфо';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Графическая тема (Web)';

  @override
  String get colorScheme => 'Цветовая схема:';

  @override
  String get none => 'Нет';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Расширенные настройки сохранены';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Управление диском';

  @override
  String get whenDiskIsFull => 'Если диск заполнен:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Настройки аудио';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Перекрытие (сек) [0, 2.9]:';

  @override
  String get audioFormat => 'Формат аудио:';

  @override
  String get recordingLength => 'Длина записи (сек):';

  @override
  String get extractionLength => 'Длина фрагмента (сек):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Пароль Caddy';

  @override
  String get appPassword => 'Пароль приложения:';

  @override
  String get customLogoImage => 'Свой логотип';

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
  String get automaticUpdate => 'Автообновление';

  @override
  String get saveRawSpectrograms => 'Сохранять сырые спектрограммы';

  @override
  String get loggingLevels => 'Уровни логирования';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Управление списками видов';

  @override
  String get inclusion => 'Включение';

  @override
  String get exclusion => 'Исключение';

  @override
  String get whitelist => 'Белый список';

  @override
  String get speciesAlreadyInList => 'Вид уже есть в списке';

  @override
  String get listSavedSuccessfully => 'Список сохранен';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Повтор';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Загрузка видов...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'В этом списке нет видов.';

  @override
  String get removeFromList => 'Удалить из списка';

  @override
  String get saving => 'Сохранение...';

  @override
  String get save => 'Сохранить';

  @override
  String get loginRequired => 'Требуется вход';

  @override
  String get loginTitle => 'Аутентификация';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Имя пользователя';

  @override
  String get password => 'Пароль';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Успешно';

  @override
  String get signIn => 'Войти';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Выйти';

  @override
  String get login => 'Вход';

  @override
  String get audioStream => 'Аудиопоток';

  @override
  String get pressPlayToListen => 'Нажмите играть, чтобы слушать';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Включить звук';

  @override
  String get mute => 'Без звука';

  @override
  String get resume => 'Продолжить';

  @override
  String get pause => 'Пауза';

  @override
  String get autoRefresh => 'Автообновление';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Сейчас анализируется';

  @override
  String get accessRestricted => 'Доступ ограничен';

  @override
  String get loginToAccessSection => 'Войдите для доступа к разделу.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Ошибка';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Другие утилиты';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · $secondsс';
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
  String get tooltipRefresh => 'Обновить';

  @override
  String get tooltipStop => 'Стоп';

  @override
  String get tooltipStart => 'Пуск';

  @override
  String get tooltipRestart => 'Перезапуск';

  @override
  String get systemInfo => 'О системе';

  @override
  String get fileManager => 'Файловый менеджер';

  @override
  String get databaseMaintenance => 'Обслуживание БД';

  @override
  String get webTerminal => 'Веб-терминал';

  @override
  String get tooltipOpenMenu => 'Открыть меню';

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
  String get tooltipSearch => 'Поиск';

  @override
  String get tooltipPlay => 'Слушать аудио';

  @override
  String get tooltipPickDate => 'Выбрать дату';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Статус системы';

  @override
  String get sysInfoUptime => 'Аптайм';

  @override
  String get sysInfoDisk => 'Диск';

  @override
  String get sysInfoMemory => 'Память';

  @override
  String get sysInfoCpuTemp => 'Темп. ЦПУ';

  @override
  String get sysInfoBranch => 'Ветка';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Включить';

  @override
  String get disable => 'Выключить';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Неделя $weekNumber - $year';
  }
}
