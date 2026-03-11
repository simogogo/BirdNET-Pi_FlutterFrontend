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
  String get noDetectionsForSpecies => 'Для этого вида обнаружений нет.';

  @override
  String get removeFilter => 'Удалить фильтр';

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
  String get monthly => 'Ежемесячно';

  @override
  String get detectionsBySpecies => 'Обнаружения по видам';

  @override
  String get hourlyDistribution => 'Почасовое распределение';

  @override
  String get noChartAvailable => 'График недоступен';

  @override
  String get weeklyReport => 'Еженедельный отчет';

  @override
  String get monthlyReport => 'Ежемесячный отчет';

  @override
  String get newSpecies => 'Новый вид';

  @override
  String get newFemale => 'Новый!';

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
    return 'Вы хотите удалить «$name» от $date $time?';
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
  String get noRecordingsAvailable => 'Нет доступных записей.';

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
      'Автоматическое обнаружение через BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully => 'Загрузка началась успешно!';

  @override
  String get cannotDownloadCsv => 'Невозможно загрузить CSV.';

  @override
  String get zipDownloadInProgress => 'Идет загрузка ZIP...';

  @override
  String get cannotOpenZipUrl =>
      'Невозможно открыть URL-адрес для загрузки ZIP.';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Сервер не вернул URL-адрес загрузки.';

  @override
  String get unknownError => 'Неизвестная ошибка';

  @override
  String get serverError => 'Ошибка сервера';

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
  String get autoRemoveLessThan80 => 'Автоматически удалять < 80%';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Виды читаются: $totalSpecies | Случаи: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return 'Обнаружений: $count';
  }

  @override
  String get protocol => 'Протокол';

  @override
  String get stationaryPoint => 'Стационарный - Точка';

  @override
  String get nocturnalFlightCall => 'Ночной позывной (NFC)';

  @override
  String get incidental => 'Случайный';

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
  String get totalUniqueSpecies => 'Всего видов (уникальных)';

  @override
  String get hourlyModeledChecklists =>
      'Почасовые моделируемые контрольные списки';

  @override
  String get averageConfidence => 'Средняя уверенность';

  @override
  String get wizardInfoText =>
      'Нажав «Создать CSV», файл будет скомпилирован с разделением станций по часам и готов к загрузке на eBird.';

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
  String get restartRaspberryPi => 'Перезагрузите Raspberry Pi.';

  @override
  String get areYouSureYouWantToRestart =>
      'Вы уверены, что хотите перезагрузить систему?';

  @override
  String get update => 'Обновить';

  @override
  String get updateBirdNetPi => 'Обновите BirdNET-Pi до последней версии.';

  @override
  String get doYouWantToUpdateBirdNet => 'Хотите обновить BirdNET-Pi?';

  @override
  String get shutdown => 'Выключение';

  @override
  String get shutdownRaspberryPi => 'Выключите Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Вы уверены, что хотите завершить работу системы?';

  @override
  String get clearAllData => 'Очистить все данные';

  @override
  String get removeAllRecordingsAndDetections =>
      'Удалить все записи и обнаружения';

  @override
  String get warningAllDataWillBeDeleted =>
      'ВНИМАНИЕ: Все данные будут безвозвратно удалены. Продолжать?';

  @override
  String get services => 'Службы';

  @override
  String get liveAudioStream => 'Живой аудиопоток';

  @override
  String get birdNetAnalysis => 'Анализ BirdNET';

  @override
  String get birdNetRecording => 'Запись BirdNET';

  @override
  String get birdNetLog => 'Журнал BirdNET';

  @override
  String get chartViewer => 'Просмотр диаграмм';

  @override
  String get spectrogram => 'Спектрограмма';

  @override
  String get quickActions => 'Быстрые действия';

  @override
  String get stopServices => 'Остановить службы';

  @override
  String get restartServices => 'Перезапустить службы';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get execution => 'Исполнение:';

  @override
  String get commandExecuted => '✅ Команда выполнена';

  @override
  String errorMsg(String error) {
    return '❌ Ошибка: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Ошибка';
  }

  @override
  String get settings => 'Настройки';

  @override
  String get basicSettings => 'Основные настройки';

  @override
  String get basicSettingsSubtitle =>
      'Настройте время, местоположение, язык и уведомления.';

  @override
  String get advancedSettings => 'Расширенные настройки';

  @override
  String get advancedSettingsSubtitle =>
      'Настройте звук, конфиденциальность, управление дисками и многое другое.';

  @override
  String get connection => 'Подключение';

  @override
  String get birdNetPiServerAddress => 'Адрес сервера BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Введите IP-адрес или имя хоста вашего Raspberry Pi.';

  @override
  String get testInProgress => 'Идет тестирование...';

  @override
  String get saveAndTestConnection => 'Сохранить и проверить соединение';

  @override
  String get deviceInformation => 'Информация об устройстве';

  @override
  String get loading => 'Загрузка...';

  @override
  String get notConnected => 'Не подключено';

  @override
  String get configureServerAddress => 'Настройте адрес сервера';

  @override
  String get latitude => 'Широта';

  @override
  String get longitude => 'Долгота';

  @override
  String get locality => 'Населенный пункт';

  @override
  String get stateProvince => 'Штат/Провинция';

  @override
  String get countryCode => 'Код страны';

  @override
  String get information => 'Информация';

  @override
  String get appVersion => 'Версия 1.0.0';

  @override
  String get appDescription =>
      'Приложение-компаньон для BirdNET-Pi. Контролируйте обнаружение птиц с помощью Raspberry Pi.';

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
  String get errorWhileSaving => 'Ошибка при сохранении';

  @override
  String exceptionDuringSave(String error) {
    return 'Исключение во время сохранения: $error';
  }

  @override
  String get model => 'Модель';

  @override
  String get selectAModel => 'Выберите модель:';

  @override
  String get speciesRangeModel => 'Видовой диапазон модели V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Порог частоты встречаемости видов [0,0005, 0,99]:';

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
  String get appriseConfig => 'Настройка уведомлений Appprise:';

  @override
  String get notificationTitle => 'Заголовок уведомления:';

  @override
  String get notificationBody => 'Текст уведомления:';

  @override
  String get notifyNewInfrequent =>
      'Уведомлять о каждом обнаружении нового редкого вида.';

  @override
  String get notifyFirstDetectionOfDay =>
      'Уведомить каждый вид о первом обнаружении в день';

  @override
  String get notifyEachNewDetection => 'Уведомлять о каждом обнаружении';

  @override
  String get sendWeeklyReport => 'Отправлять еженедельный отчет';

  @override
  String get minTimeBetweenNotifications =>
      'Минимальное время между уведомлениями одного и того же вида (сек):';

  @override
  String get excludeTheseSpecies => 'Исключить эти виды (через запятую):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Уведомлять ТОЛЬКО об этих видах (через запятую):';

  @override
  String get imageSource => 'Источник изображения';

  @override
  String get imageProvider => 'Поставщик изображений:';

  @override
  String get flickrApiKey => 'API-ключ Flickr:';

  @override
  String get flickrFilterEmail =>
      'Искать фотографии только этого пользователя Flickr:';

  @override
  String get localization => 'Локализация';

  @override
  String get databaseLanguage => 'Язык базы данных:';

  @override
  String get otherInfo => 'Другая инфо';

  @override
  String get infoSite => 'Информационный сайт:';

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
  String get privacyRecordings => 'Конфиденциальность записей';

  @override
  String get privacyThreshold => 'Порог конфиденциальности [0, 99]:';

  @override
  String get diskSpaceManagement => 'Управление диском';

  @override
  String get whenDiskIsFull => 'Если диск заполнен:';

  @override
  String get purgeCapacity => 'Производительность продувки [порог %]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Максимальное количество файлов для каждого вида (0 = отключить):';

  @override
  String get audioSettings => 'Настройки аудио';

  @override
  String get alsaInputCaptureDevice =>
      'Устройство захвата входного сигнала ALSA (звуковая карта):';

  @override
  String get numberOfAudioChannels => 'Количество аудиоканалов для извлечения:';

  @override
  String get overlap => 'Перекрытие (сек) [0, 2.9]:';

  @override
  String get audioFormat => 'Формат аудио:';

  @override
  String get recordingLength => 'Длина записи (сек):';

  @override
  String get extractionLength => 'Длина фрагмента (сек):';

  @override
  String get rtspAudioSharing => 'Обмен аудио по RTSP';

  @override
  String get shareLiveAudioStream => 'Поделиться живым аудиопотоком?';

  @override
  String get playAudioStreamThroughWebUi =>
      'Воспроизвести аудиопоток через веб-интерфейс?';

  @override
  String get caddyPassword => 'Пароль Caddy';

  @override
  String get appPassword => 'Пароль приложения:';

  @override
  String get customLogoImage => 'Свой логотип';

  @override
  String get customImageUrl => 'URL-адрес пользовательского изображения:';

  @override
  String get customImageTitle => 'Пользовательское название изображения:';

  @override
  String get birdNetLiteModelSettings => 'Настройки модели BirdNET-Lite';

  @override
  String get confidenceThreshold => 'Порог уверенности [0, 0,99]:';

  @override
  String get sensitivity => 'Чувствительность [0,5, 1,5]:';

  @override
  String get otherSettings => 'Другие настройки';

  @override
  String get silenceUpdateIndicator =>
      'Отключить индикатор «Доступно обновление»';

  @override
  String get automaticUpdate => 'Автообновление';

  @override
  String get saveRawSpectrograms => 'Сохранять сырые спектрограммы';

  @override
  String get loggingLevels => 'Уровни логирования';

  @override
  String get birdnetRecordingService => 'Служба записи BirdNET:';

  @override
  String get spectrogramViewerService => 'Служба просмотра спектрограмм:';

  @override
  String get liveAudioStreamService =>
      'Служба потокового аудио в реальном времени:';

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
  String get errorSavingList => 'Ошибка при сохранении списка';

  @override
  String errorLoadingList(String error) {
    return 'Ошибка загрузки списка:\\n$error';
  }

  @override
  String get retry => 'Повтор';

  @override
  String get searchSpeciesHint =>
      'Поиск видов (например, Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Загрузка видов...';

  @override
  String get errorLoadingSpecies => 'Ошибка загрузки видов.';

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
      'Введите свои учетные данные для доступа к защищенным функциям.';

  @override
  String get username => 'Имя пользователя';

  @override
  String get password => 'Пароль';

  @override
  String get loginEmptyError => 'Пожалуйста, введите имя пользователя и пароль';

  @override
  String get loginInvalidError => 'Неверные учетные данные';

  @override
  String get authenticated => 'Успешно';

  @override
  String get signIn => 'Войти';

  @override
  String get loggedInMessage => 'Вы в настоящее время аутентифицированы.';

  @override
  String get logout => 'Выйти';

  @override
  String get login => 'Вход';

  @override
  String get audioStream => 'Аудиопоток';

  @override
  String get pressPlayToListen => 'Нажмите играть, чтобы слушать';

  @override
  String get loginToStart => 'Войдите с помощью 🔒, чтобы начать';

  @override
  String get streamRequiresAuth =>
      'Поток требует аутентификации. Нажмите значок 🔒 в правом верхнем углу, чтобы войти в систему.';

  @override
  String get liveAudioFootnote => 'Живое аудио BirdNET-Pi';

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
  String get pressPlaySpectrogram =>
      'Нажмите ▶, чтобы просмотреть спектрограмму';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Нажмите ▶, чтобы запустить спектрограмму в реальном времени.';

  @override
  String get loginThenPlay => 'Войдите с помощью 🔒, затем нажмите ▶';

  @override
  String get currentAnalyzing => 'Сейчас анализируется';

  @override
  String get accessRestricted => 'Доступ ограничен';

  @override
  String get loginToAccessSection => 'Войдите для доступа к разделу.';

  @override
  String get iframeNotSupported =>
      'Iframes строго поддерживаются в веб-версии.';

  @override
  String get error => 'Ошибка';

  @override
  String get otherUtilities => 'Другие утилиты';

  @override
  String liveSeconds(int seconds) {
    return 'LIVE · $secondsс';
  }

  @override
  String get spectrogramNotAvailable => 'Спектрограмма недоступна';

  @override
  String get ebirdCountIdentifier => '№';

  @override
  String get ebirdCountDefault => 'Х';

  @override
  String get ebirdProtocolStationary => 'Стационарный';

  @override
  String get ebirdProtocolIncidental => 'Случайный';

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
  String get tooltipRefreshData => 'Обновить данные';

  @override
  String get tooltipPreviousDay => 'Предыдущий день';

  @override
  String get tooltipNextDay => 'На следующий день';

  @override
  String get tooltipPreviousWeek => 'Предыдущая неделя';

  @override
  String get tooltipNextWeek => 'На следующей неделе';

  @override
  String get tooltipDeleteRecording => 'Удалить запись';

  @override
  String get tooltipClearSearch => 'Очистить поиск';

  @override
  String get tooltipCloseSearch => 'Закрыть поиск';

  @override
  String get tooltipSearch => 'Поиск';

  @override
  String get tooltipPlay => 'Слушать аудио';

  @override
  String get tooltipPickDate => 'Выбрать дату';

  @override
  String get passwordOptionalHint => 'Оставьте пустым, если не установлено';

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
    return '$count фиксируется позади';
  }

  @override
  String get sysInfoLoadingError =>
      'Не удалось загрузить информацию о системе.';

  @override
  String get enable => 'Включить';

  @override
  String get disable => 'Выключить';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Неделя $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Группировать по видам';

  @override
  String get groupByTime => 'Группировать по времени';

  @override
  String get readOnWikipedia => 'Прочтите в Википедии';

  @override
  String get loadingWikipedia => 'Загрузка информации из Википедии...';

  @override
  String get noWikipediaInfo =>
      'Информации об этом виде в Википедии не найдено.';

  @override
  String get searchSpecies => 'Поиск видов...';

  @override
  String get noResultsFound => 'Результаты не найдены';

  @override
  String get noSpeciesDetected => 'Виды не обнаружены';

  @override
  String get species => 'Виды';

  @override
  String get detections => 'Обнаружения';

  @override
  String get maxConfidence => 'Макс. достоверность';

  @override
  String get topSpecies => 'Топ видов';

  @override
  String get fromDate => 'С даты';

  @override
  String get toDate => 'По дату';

  @override
  String get fromTime => 'С времени';

  @override
  String get toTime => 'По время';

  @override
  String get byPeriod => 'По периоду';

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
  String get firstSeen => 'Впервые замечен';

  @override
  String get lastSeen => 'В последний раз';

  @override
  String get thirtyDaysTrend => 'Тренд 30 дней';

  @override
  String get avgConfidence => 'Ср. уверенность';

  @override
  String get mySpecies => 'Мои Виды';

  @override
  String get bestDetection => 'Лучшее Распознавание';

  @override
  String get externalInfoLink => 'Внешняя Информация';

  @override
  String get includedListInfo =>
      'Внимание! Если в этом списке есть КАКИЕ-ЛИБО виды, система будет распознавать ТОЛЬКО их. Оставьте этот список ПУСТЫМ, если вы не заинтересованы ТОЛЬКО в обнаружении определенных видов.';

  @override
  String get excludedListInfo =>
      'Когда нужный вид будет выделен, нажмите на него, а затем нажмите кнопку ДОБАВИТЬ, чтобы исключить его.';

  @override
  String get whitelistInfo =>
      'Когда нужный вид будет выделен, нажмите на него, а затем нажмите кнопку ДОБАВИТЬ, чтобы добавить его в белый список. Этот вид будет обнаружен даже ниже порогового значения частоты встречаемости (Species Occurrence Frequency Threshold), заданного в настройках. Это не рекомендуемый способ: желательно сначала попробовать обе модели (v1 и v2.4).';

  @override
  String get overnightRange => 'Ночной диапазон (пересекает полночь)';

  @override
  String get resetFilters => 'Сбросить фильтры';
}
