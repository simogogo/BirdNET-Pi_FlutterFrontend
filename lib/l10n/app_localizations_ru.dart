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
  String get downloadAudioZip => 'Создать аудио ZIP-файлы для eBird';

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
    return 'Ошибка $error';
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
  String get themeLight => 'Свет';

  @override
  String get themeDark => 'Темный';

  @override
  String get colorScheme => 'Цветовая схема:';

  @override
  String get sfThreshHelp =>
      'Это значение используется моделью для ограничения списка возможных видов, которые она попытается обнаружить, учитывая минимальную частоту появления. Порог 0,03 означает, что для того, чтобы вид был включен в этот список, он должен в среднем присутствовать как минимум в 3% исторически представленных контрольных списков eBird для данной широты/долготы/текущей недели года. Таким образом, чем ниже порог, тем более редкие виды в него войдут.';

  @override
  String get birdWeatherHelp =>
      'BirdWeather — это карта погоды со звуками птиц. Станции по всему миру передают аудио- и видеопотоки в BirdWeather, где они затем анализируются BirdNET и сравниваются с данными eBird Grid. ПРИМЕЧАНИЕ. Используя свой токен BirdWeather, вы соглашаетесь поделиться своими звуковыми ландшафтами и обнаружениями с BirdWeather.';

  @override
  String get flickrHelp =>
      'Установите ключ API Flickr, чтобы включить отображение изображений птиц рядом с обнаруженными объектами. «Искать фотографии только этого пользователя Flickr» позволяет фильтровать фотографии по конкретному адресу электронной почты учетной записи.';

  @override
  String get databaseLangHelp =>
      'Изменяйте это значение только при первоначальной настройке!';

  @override
  String get infoSiteHelp =>
      'Выберите, откуда получить дополнительную информацию о видах. allaboutbirds.org — значение по умолчанию; На ebird.org есть больше европейских видов.';

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
  String get shareLiveAudioStream =>
      'URL-адрес потока RTSP (оставьте пустым для отключения)';

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
  String get generateLdfcsStandard => 'LDFCS (Стандартный термический)';

  @override
  String get generateLdfcsIndices => 'LDFCS (Акустические индексы)';

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
    return 'В прямом эфире · $seconds сек.';
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
  String get selectSpecies => 'Выберите вид';

  @override
  String get allSpecies => 'Все виды';

  @override
  String get search => 'Поиск';

  @override
  String occurrenceCount(int count) {
    return 'н. $count';
  }

  @override
  String get firstSeen => 'Впервые замечен';

  @override
  String get lastSeen => 'В последний раз';

  @override
  String get firstSeenPeriod => 'Первое появление (точка)';

  @override
  String get lastSeenPeriod => 'Последний визит (точка)';

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

  @override
  String invalidValueRange(num min, num max) {
    return 'Значение должно быть между $min и $max.';
  }

  @override
  String get speciesListTester => 'Тестер списка видов';

  @override
  String get previewSpeciesList => 'Предварительный просмотр списка видов';

  @override
  String get threshold => 'Порог:';

  @override
  String get sfThreshHelpExtended =>
      'Это значение используется моделью для ограничения списка возможных видов, которые она попытается обнаружить, учитывая минимальную частоту появления. Порог 0,03 означает, что для того, чтобы вид был включен в этот список, он должен в среднем присутствовать как минимум в 3% исторически представленных контрольных списков eBird для данной широты/долготы/текущей недели года. Таким образом, чем ниже порог, тем более редкие виды в него войдут.\n\n[Подробная техническая статья здесь](https://github.com/kahst/BirdNET-Analyzer/discussions/234)';

  @override
  String get sfThreshTesterHint =>
      'Если вы хотите поработать с этим пороговым значением и посмотреть, какие виды попадают в список, вы можете использовать инструмент «Тестер списка видов» ниже.';

  @override
  String get sfThreshTesterLegacyHint =>
      'Нажмите «Обновить настройки» в самом низу этой страницы, чтобы установить соответствующий файл этикетки, затем вернитесь сюда, и вы сможете использовать Тестер списка видов.';

  @override
  String get appriseConfigHelp =>
      'Уведомления Appprise можно настроить и включить для более чем 90 служб уведомлений. Каждая служба должна быть на отдельной линии.\n\n**Примеры:**\n- `mailto://<пользователь>:<пароль>@gmail.com`\n- `tgram://<bot_token>/<chat_id>`\n- `discord://<WebhookID>/<WebhookToken>`\n\n[Полная версия Wiki](https://github.com/caronc/apprise/wiki)';

  @override
  String get notificationVarsHelp =>
      'Вы можете использовать следующие переменные в заголовке и теле:\n\n- `\$sciname`: Научное название\n- `\$comname`: общее имя.\n- `\$confidencepct`: Оценка уверенности в процентах.\n- `\$listenurl`: Ссылка на обнаружение\n- `\$date`, `\$time`, `\$week`: информация о дате и времени.\n- `\$image`: изображение вида.\n- `\$reason`: Причина уведомления.';

  @override
  String get excludeSpeciesHelp =>
      'Исключить эти виды из уведомлений (общие названия, разделенные запятой). Пример: «Траурный голубь, Американская ворона».';

  @override
  String get includeSpeciesHelp =>
      'Уведомлять ТОЛЬКО об этих видах (общие названия, разделенные запятыми).';

  @override
  String get serverUrl => 'URL-адрес сервера';

  @override
  String get pleaseEnterUrl => 'Пожалуйста, введите URL-адрес сервера';

  @override
  String get serverUnreachable =>
      'Сервер недоступен. Пожалуйста, проверьте адрес и повторите попытку.';

  @override
  String get welcomeToBirdNetPi => 'Добро пожаловать в BirdNET-Pi';

  @override
  String get enterServerUrlDescription =>
      'Чтобы начать, введите URL-адрес вашего сервера BirdNET-Pi.';

  @override
  String get connect => 'Соединять';

  @override
  String get serverUpdatedSuccessfully => 'Сервер успешно обновлен!';

  @override
  String get serverInformation => 'Информация о сервере';

  @override
  String get noData => 'Нет данных';

  @override
  String get trends => 'Тенденции';

  @override
  String get selectSpeciesToViewTrends =>
      'Выберите вид, чтобы просмотреть тенденции';

  @override
  String speciesDetailsError(String error) {
    return 'Ошибка сведений о виде: $error.';
  }

  @override
  String get fromLabel => 'От';

  @override
  String get toLabel => 'До';

  @override
  String get exportMenuLabel => 'Экспорт';

  @override
  String get exportDataTitle => 'Экспортировать данные';

  @override
  String get ebirdExportDesc =>
      'Управляемый процесс отправки контрольных списков.';

  @override
  String get csvExport => 'Экспорт в CSV';

  @override
  String get csvExportDesc =>
      'Необработанные данные отфильтрованы по дате и виду.';

  @override
  String get audioZipExport => 'Ежедневный экспорт аудио';

  @override
  String get audioZipExportDesc => 'Запросите архив всех записей.';

  @override
  String get zipManager => 'Управление почтовыми индексами';

  @override
  String get zipManagerDesc => 'Загрузите или удалите zip-файлы на сервере.';

  @override
  String get startDate => 'Дата начала';

  @override
  String get endDate => 'Дата окончания';

  @override
  String get filterBySpeciesOptional => 'Фильтровать по видам (необязательно)';

  @override
  String get selectedSpecies => 'Выбранные виды';

  @override
  String get emptyIncludeAllSpecies => '* Если пусто: включает все виды.';

  @override
  String get executeExport => 'ВЫПОЛНИТЬ ЭКСПОРТ';

  @override
  String get chooseFullDayText =>
      'Выберите день, за который вы хотите экспортировать записи:';

  @override
  String get requestZipGeneration => 'ЗАПРОСИТЬ СОЗДАНИЕ ZIP';

  @override
  String get zipGenerationWarning =>
      '* Операция может занять несколько минут. Скачать zip можно из раздела «Управление zip».';

  @override
  String get zipGenerationStarted =>
      'Генерация ZIP начата. Файл будет доступен в разделе Zip Manager.';

  @override
  String get refreshList => 'Обновить список';

  @override
  String get downloadZip => 'Скачать';

  @override
  String get filterSpecies => 'Фильтровать виды';

  @override
  String get allSpeciesWillBeExported => 'Все виды будут экспортироваться.';

  @override
  String get export => 'Экспорт';

  @override
  String get hourlyDistributionDetections => 'Почасовое распределение';

  @override
  String get dayNightWeatherProfile => 'Профиль день/ночь (погода)';

  @override
  String get dailyDetections => 'Дневные обнаружения';

  @override
  String get temperatureUnitLabel => 'Температура (°C)';

  @override
  String get windSpeedUnitLabel => 'Скорость ветра (км/ч)';

  @override
  String get densityMapSunInfo => 'Карта плотности с временем восхода и захода';

  @override
  String get externalSheet => 'Внешняя вкладка';

  @override
  String get totalAllTime => 'Всего за всё время';

  @override
  String get detectionsLabel => 'Обнаружения';

  @override
  String get maxConfidenceLabel => 'Макс. уверенность';

  @override
  String get averageConfidenceLabel => 'Средн. уверенность';

  @override
  String get dayLegend => 'День ☀️';

  @override
  String get nightLegend => 'Ночь 🌙';

  @override
  String get weatherClear => 'Ясно';

  @override
  String get weatherCloudy => 'Облачно';

  @override
  String get weatherFog => 'Туман';

  @override
  String get weatherRain => 'Дождь';

  @override
  String get weatherSnow => 'Снег';

  @override
  String get weatherThunderstorm => 'Гроза';

  @override
  String get loadingAudioLabel => 'Загрузка аудио...';

  @override
  String get errorLoadingAudioLabel => 'Ошибка загрузки аудио';

  @override
  String get detectionsTotal => 'Обнаружения';

  @override
  String get ebirdExportError => 'Ошибка при запросе ZIP-файла.';

  @override
  String get temperature => 'Температура';

  @override
  String get wind => 'Ветер';

  @override
  String get dateLabel => 'Дата';

  @override
  String get notAvailable => 'Н/Д';

  @override
  String get ldfcsStandardTitle => 'Долгосрочная спектрограмма (Стандартная)';

  @override
  String get ldfcsIndicesTitle =>
      'Долгосрочная спектрограмма (Акустические индексы)';

  @override
  String get ldfcsDescription => 'Визуализация 24-часовой записи';

  @override
  String get weeklyLdfcsStandard => 'Еженедельный LDFCS (Стандартный)';

  @override
  String get weeklyLdfcsIndices => 'Еженедельный LDFCS (Акустические индексы)';

  @override
  String get monthlyLdfcsStandard => 'Ежемесячный LDFCS (Стандартный)';

  @override
  String get monthlyLdfcsIndices => 'Ежемесячный LDFCS (Акустические индексы)';

  @override
  String get dailyInsightsTitle => 'Дневная статистика';

  @override
  String get weeklyInsightsTitle => 'Еженедельная статистика';

  @override
  String get monthlyInsightsTitle => 'Ежемесячная статистика';

  @override
  String get hourlyActivityTitle => 'Почасовая активность';

  @override
  String get speciesDiversityTitle => 'Разнообразие видов';

  @override
  String get others => 'Другие';

  @override
  String get detShort => 'ДЕТ';

  @override
  String get backupRestore => 'Резервное копирование и восстановление';

  @override
  String get backupRestoreSubtitle =>
      'Управление резервными копиями базы данных и записей.';

  @override
  String get backup => 'Резервное копирование';

  @override
  String get restore => 'Восстановление';

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
  String get downloadBackup => 'Скачать резервную копию';

  @override
  String get restoreBackup => 'Восстановить из резервной копии';

  @override
  String backupSize(String size) {
    return 'Оценочный размер резервной копии: $size';
  }

  @override
  String get backupWarning =>
      'Предупреждение: создание резервной копии может занять несколько минут.';

  @override
  String get restoreWarning =>
      'Предупреждение: восстановление перезапишет текущие данные и перезапустит службы.';

  @override
  String get selectBackupFile => 'Выберите файл резервной копии (.tar)';

  @override
  String get restoreStarted =>
      'Восстановление начато. Система скоро перезагрузится.';

  @override
  String get errorRestoring => 'Ошибка при восстановлении.';

  @override
  String get restoreFtpInstructions =>
      'Note: For large backup files, it is recommended to upload the archive manually via FTP/SFTP to the /home/[user]/BirdSongs/Restore/restore.tar directory before clicking start.';

  @override
  String get uploadCancel => 'Cancel Upload';
}
