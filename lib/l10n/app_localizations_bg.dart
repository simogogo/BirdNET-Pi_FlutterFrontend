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
  String get noDetectionsForSpecies => 'Няма открития за този вид';

  @override
  String get removeFilter => 'Отстранете филтъра';

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
  String get detectionsBySpecies => 'Откривания по видове';

  @override
  String get hourlyDistribution => 'Почасово разпределение';

  @override
  String get noChartAvailable => 'Няма налична графика';

  @override
  String get weeklyReport => 'Седмичен отчет';

  @override
  String get newSpecies => 'Нов вид';

  @override
  String get newFemale => 'Ново!';

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
    return 'Искате ли да изтриете „$name“ от $date $time?';
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
  String get noRecordingsAvailable => 'Няма налични записи.';

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
      'Автоматично откриване чрез BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully => 'Изтеглянето започна успешно!';

  @override
  String get cannotDownloadCsv => 'Не може да се изтегли CSV.';

  @override
  String get zipDownloadInProgress => 'Изтегля се ZIP файл...';

  @override
  String get cannotOpenZipUrl => 'Не може да се отвори URL за изтегляне на ZIP';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'Сървърът не върна URL адреса за изтегляне.';

  @override
  String get unknownError => 'Неизвестна грешка';

  @override
  String get serverError => 'Грешка в сървъра';

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
  String get autoRemoveLessThan80 => 'Автоматично премахване < 80%';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Прочетени видове: $totalSpecies | Случвания: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count откривания';
  }

  @override
  String get protocol => 'Протокол';

  @override
  String get stationaryPoint => 'Стационарен - Фиксирана точка';

  @override
  String get nocturnalFlightCall => 'Нощен полетен зов (NFC)';

  @override
  String get incidental => 'Случаен';

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
  String get totalUniqueSpecies => 'Общо видове (уникални)';

  @override
  String get hourlyModeledChecklists => 'Почасово моделирани контролни списъци';

  @override
  String get averageConfidence => 'Средна увереност';

  @override
  String get wizardInfoText =>
      'С натискане на \"Генериране на CSV\", файлът ще бъде компилиран, разделящ станциите по часове, готов за качване в eBird.';

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
  String get restartRaspberryPi => 'Рестартирайте Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Сигурни ли сте, че искате да рестартирате системата?';

  @override
  String get update => 'Обновяване';

  @override
  String get updateBirdNetPi =>
      'Актуализирайте BirdNET-Pi до най-новата версия';

  @override
  String get doYouWantToUpdateBirdNet =>
      'Искате ли да актуализирате BirdNET-Pi?';

  @override
  String get shutdown => 'Изключване';

  @override
  String get shutdownRaspberryPi => 'Изключете Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Сигурни ли сте, че искате да изключите системата?';

  @override
  String get clearAllData => 'Изтриване на всички данни';

  @override
  String get removeAllRecordingsAndDetections =>
      'Премахнете всички записи и откривания';

  @override
  String get warningAllDataWillBeDeleted =>
      'ПРЕДУПРЕЖДЕНИЕ: Всички данни ще бъдат изтрити за постоянно. Продължаване?';

  @override
  String get services => 'Услуги';

  @override
  String get liveAudioStream => 'Аудио поток на живо';

  @override
  String get birdNetAnalysis => 'BirdNET анализ';

  @override
  String get birdNetRecording => 'BirdNET запис';

  @override
  String get birdNetLog => 'Дневник на BirdNET';

  @override
  String get chartViewer => 'Преглед на диаграми';

  @override
  String get spectrogram => 'Спектрограма';

  @override
  String get quickActions => 'Бързи действия';

  @override
  String get stopServices => 'Спиране на услугите';

  @override
  String get restartServices => 'Рестартирайте услугите';

  @override
  String get confirm => 'Потвърди';

  @override
  String get execution => 'Изпълнение:';

  @override
  String get commandExecuted => '✅ Командата е изпълнена';

  @override
  String errorMsg(String error) {
    return '❌ Грешка: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Грешка';
  }

  @override
  String get settings => 'Настройки';

  @override
  String get basicSettings => 'Основни настройки';

  @override
  String get basicSettingsSubtitle =>
      'Конфигурирайте час, местоположение, език и известия.';

  @override
  String get advancedSettings => 'Разширени настройки';

  @override
  String get advancedSettingsSubtitle =>
      'Конфигурирайте аудио, поверителност, управление на дискове и др.';

  @override
  String get connection => 'Връзка';

  @override
  String get birdNetPiServerAddress => 'Адрес на BirdNET-Pi сървъра';

  @override
  String get enterIpOrHostname =>
      'Въведете IP адреса или името на хоста на вашия Raspberry Pi';

  @override
  String get testInProgress => 'Извършва се тест...';

  @override
  String get saveAndTestConnection => 'Запазете и тествайте връзката';

  @override
  String get deviceInformation => 'Информация за устройството';

  @override
  String get loading => 'Зареждане...';

  @override
  String get notConnected => 'Няма връзка';

  @override
  String get configureServerAddress => 'Конфигурирайте адреса на сървъра';

  @override
  String get latitude => 'Географска ширина';

  @override
  String get longitude => 'Географска дължина';

  @override
  String get locality => 'Населено място';

  @override
  String get stateProvince => 'Щат/провинция';

  @override
  String get countryCode => 'Код на държавата';

  @override
  String get information => 'Информация';

  @override
  String get appVersion => 'Версия 1.0.0';

  @override
  String get appDescription =>
      'Придружаващо приложение за BirdNET-Pi. Наблюдавайте откриването на птици от вашия Raspberry Pi.';

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
  String get errorWhileSaving => 'Грешка при запазване';

  @override
  String exceptionDuringSave(String error) {
    return 'Изключение по време на запазване: $error';
  }

  @override
  String get model => 'Модел';

  @override
  String get selectAModel => 'Изберете модел:';

  @override
  String get speciesRangeModel => 'Видова гама модел V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Праг на честота на поява на видове [0,0005, 0,99]:';

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
  String get appriseConfig => 'Конфигурация на Apprise Notifications:';

  @override
  String get notificationTitle => 'Заглавие на известието:';

  @override
  String get notificationBody => 'Текст на известието:';

  @override
  String get notifyNewInfrequent =>
      'Уведомявайте за всяко ново рядко откриване на видове';

  @override
  String get notifyFirstDetectionOfDay =>
      'Уведомете всеки вид за първото откриване за деня';

  @override
  String get notifyEachNewDetection => 'Известие за всяко ново откриване';

  @override
  String get sendWeeklyReport => 'Изпращане на седмичен отчет';

  @override
  String get minTimeBetweenNotifications =>
      'Минимално време между уведомленията за един и същи вид (сек):';

  @override
  String get excludeTheseSpecies =>
      'Изключете тези видове (разделени със запетая):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Уведомявайте САМО за тези видове (разделени със запетая):';

  @override
  String get imageSource => 'Източник на изображението';

  @override
  String get imageProvider => 'Доставчик на изображения:';

  @override
  String get flickrApiKey => 'API ключ на Flickr:';

  @override
  String get flickrFilterEmail =>
      'Търсете само снимки от този потребител на Flickr:';

  @override
  String get localization => 'Локализация';

  @override
  String get databaseLanguage => 'Език на базата данни:';

  @override
  String get otherInfo => 'Друга информация';

  @override
  String get infoSite => 'Информационен сайт:';

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
  String get privacyRecordings => 'Поверителност на записите';

  @override
  String get privacyThreshold => 'Праг на поверителност [0, 99]:';

  @override
  String get diskSpaceManagement => 'Управление на дисковото пространство';

  @override
  String get whenDiskIsFull => 'Когато дискът е пълен:';

  @override
  String get purgeCapacity => 'Капацитет на прочистване [% праг]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Макс. файлове, които да се съхраняват за вид (0 = деактивиране):';

  @override
  String get audioSettings => 'Аудио настройки';

  @override
  String get alsaInputCaptureDevice =>
      'ALSA входно устройство за улавяне (звукова карта):';

  @override
  String get numberOfAudioChannels => 'Брой аудио канали за извличане от:';

  @override
  String get overlap => 'Припокриване (сек) [0, 2.9]:';

  @override
  String get audioFormat => 'Аудио формат:';

  @override
  String get recordingLength => 'Продължителност на записа (сек):';

  @override
  String get extractionLength => 'Продължителност на екстракцията (сек):';

  @override
  String get rtspAudioSharing => 'RTSP аудио споделяне';

  @override
  String get shareLiveAudioStream => 'Споделяне на аудио поток на живо?';

  @override
  String get playAudioStreamThroughWebUi =>
      'Възпроизвеждане на аудио поток през уеб интерфейс?';

  @override
  String get caddyPassword => 'Caddy парола';

  @override
  String get appPassword => 'Парола за приложението:';

  @override
  String get customLogoImage => 'Собствено лого';

  @override
  String get customImageUrl => 'Персонализиран URL адрес на изображението:';

  @override
  String get customImageTitle => 'Персонализирано заглавие на изображението:';

  @override
  String get birdNetLiteModelSettings => 'Настройки на модела BirdNET-Lite';

  @override
  String get confidenceThreshold => 'Праг на достоверност [0, 0,99]:';

  @override
  String get sensitivity => 'Чувствителност [0,5, 1,5]:';

  @override
  String get otherSettings => 'Други настройки';

  @override
  String get silenceUpdateIndicator =>
      'Заглушаване на индикатора „Налична актуализация“.';

  @override
  String get automaticUpdate => 'Автоматично обновяване';

  @override
  String get saveRawSpectrograms => 'Запазване на сурови спектрограми';

  @override
  String get loggingLevels => 'Нива на логване';

  @override
  String get birdnetRecordingService => 'Услуга за запис на BirdNET:';

  @override
  String get spectrogramViewerService => 'Услуга за преглед на спектрограми:';

  @override
  String get liveAudioStreamService =>
      'Услуга за аудио поточно предаване на живо:';

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
  String get errorSavingList => 'Грешка при запазване на списъка';

  @override
  String errorLoadingList(String error) {
    return 'Грешка при зареждането на списъка:\\n$error';
  }

  @override
  String get retry => 'Повторен опит';

  @override
  String get searchSpeciesHint =>
      'Търсете видове (напр. Turdus merula_Обикновен кос)';

  @override
  String get loadingSpecies => 'Зареждане на видове...';

  @override
  String get errorLoadingSpecies => 'Грешка при зареждането на вида';

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
      'Въведете вашите идентификационни данни за достъп до защитени функции.';

  @override
  String get username => 'Потребителско име';

  @override
  String get password => 'Парола';

  @override
  String get loginEmptyError => 'Моля, въведете потребителско име и парола';

  @override
  String get loginInvalidError => 'Невалидни идентификационни данни';

  @override
  String get authenticated => 'Успешен вход';

  @override
  String get signIn => 'Вход';

  @override
  String get loggedInMessage => 'В момента сте удостоверени.';

  @override
  String get logout => 'Изход';

  @override
  String get login => 'Вход';

  @override
  String get audioStream => 'Аудио поток';

  @override
  String get pressPlayToListen => 'Натиснете плей за слушане';

  @override
  String get loginToStart => 'Влезте с 🔒, за да започнете';

  @override
  String get streamRequiresAuth =>
      'Потокът изисква удостоверяване. Докоснете иконата 🔒 горе вдясно, за да влезете.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi аудио на живо';

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
  String get pressPlaySpectrogram => 'Натиснете ▶, за да видите спектрограмата';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Натиснете ▶, за да стартирате спектрограмата в реално време';

  @override
  String get loginThenPlay => 'Влезте с 🔒 и след това натиснете ▶';

  @override
  String get currentAnalyzing => 'Анализира се в момента';

  @override
  String get accessRestricted => 'Ограничен достъп';

  @override
  String get loginToAccessSection => 'Влезте, за да достъпите този раздел.';

  @override
  String get iframeNotSupported =>
      'Вградените рамки се поддържат строго в уеб версията.';

  @override
  String get error => 'Грешка';

  @override
  String get otherUtilities => 'Други инструменти';

  @override
  String liveSeconds(int seconds) {
    return 'НА ЖИВО · $secondsс';
  }

  @override
  String get spectrogramNotAvailable => 'Спектрограмата не е налична';

  @override
  String get ebirdCountIdentifier => '№';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Стационарен';

  @override
  String get ebirdProtocolIncidental => 'Случаен';

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
  String get tooltipRefreshData => 'Обновяване на данните';

  @override
  String get tooltipPreviousDay => 'Предишния ден';

  @override
  String get tooltipNextDay => 'На следващия ден';

  @override
  String get tooltipPreviousWeek => 'Предишната седмица';

  @override
  String get tooltipNextWeek => 'Следващата седмица';

  @override
  String get tooltipDeleteRecording => 'Изтриване на записа';

  @override
  String get tooltipClearSearch => 'Изчистете търсенето';

  @override
  String get tooltipCloseSearch => 'Затворете търсенето';

  @override
  String get tooltipSearch => 'Търсене';

  @override
  String get tooltipPlay => 'Възпроизвеждане на аудио';

  @override
  String get tooltipPickDate => 'Избор на дата';

  @override
  String get passwordOptionalHint => 'Оставете празно, ако не е зададено';

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
    return '$count ангажименти назад';
  }

  @override
  String get sysInfoLoadingError =>
      'Неуспешно зареждане на системна информация.';

  @override
  String get enable => 'Разреши';

  @override
  String get disable => 'Забрани';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Седмица $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Групиране по видове';

  @override
  String get groupByTime => 'Групиране по време';

  @override
  String get readOnWikipedia => 'Прочетете в Уикипедия';

  @override
  String get loadingWikipedia => 'Зарежда се информация от Wikipedia...';

  @override
  String get noWikipediaInfo => 'В Wikipedia няма информация за този вид.';

  @override
  String get searchSpecies => 'Търсене на видове...';

  @override
  String get noResultsFound => 'Няма намерени резултати';

  @override
  String get noSpeciesDetected => 'Няма открити видове';

  @override
  String get species => 'Видове';

  @override
  String get detections => 'Откривания';

  @override
  String get maxConfidence => 'Макс. Увереност';

  @override
  String get topSpecies => 'Top species';

  @override
  String get fromDate => 'От дата';

  @override
  String get toDate => 'До дата';

  @override
  String get fromTime => 'От час';

  @override
  String get toTime => 'До час';

  @override
  String get byPeriod => 'По период';

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
