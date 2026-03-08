// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Monitoreo de Aves';

  @override
  String get home => 'Inicio';

  @override
  String get today => 'Hoy';

  @override
  String get recordings => 'Grabaciones';

  @override
  String get liveStream => 'Transmisión en Vivo';

  @override
  String get liveSpectrogram => 'Espectrograma en Vivo';

  @override
  String get speciesManagement => 'GESTIÓN DE ESPECIES';

  @override
  String get inclusionList => 'Lista de Inclusión';

  @override
  String get exclusionList => 'Lista de Exclusión';

  @override
  String get analysisLog => 'Log de Análisis';

  @override
  String get openWebInterface => 'Abrir Interfaz Web';

  @override
  String get loadingLiveSpectrogram => 'Cargando espectrograma en vivo...';

  @override
  String get spectrogramInstruction =>
      'Si el audio no comienza automáticamente, por favor interactúe con la página o revise los permisos de su navegador.';

  @override
  String get configureServerFirst =>
      'Configure primero la dirección del servidor en Ajustes';

  @override
  String get recentDetections => 'Detecciones Recientes';

  @override
  String get latestDetection => 'Última detección';

  @override
  String get audioFile => 'Archivo de Audio';

  @override
  String get playing => 'Reproduciendo';

  @override
  String get noDetectionsToday => 'No hay detecciones hoy';

  @override
  String get systemListening => 'El sistema está escuchando...';

  @override
  String get errorOccurred => 'Ocurrió un error';

  @override
  String get overview => 'Resumen';

  @override
  String get detectionsAllTime => 'Detecciones\ntotal';

  @override
  String get detectionsToday => 'Detecciones\nhoy';

  @override
  String get detectionsLastHour => 'Detecciones\núltima hora';

  @override
  String get speciesToday => 'Especies\nhoy';

  @override
  String get speciesAllTime => 'Especies\ntotal';

  @override
  String get statsLoadingError => 'Error al cargar estadísticas';

  @override
  String get todaysDetections => 'Detecciones de Hoy';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count detecciones';
  }

  @override
  String get filterDetections => 'Filtrar detecciones';

  @override
  String get minimumConfidenceThreshold => 'Umbral mínimo de confianza';

  @override
  String get reset => 'Restablecer';

  @override
  String get apply => 'Aplicar';

  @override
  String get charts => 'Gráficos';

  @override
  String get daily => 'Diario';

  @override
  String get weekly => 'Semanal';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'No hay gráfico disponible';

  @override
  String get weeklyReport => 'Informe Semanal';

  @override
  String get newSpecies => 'Nueva especie';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Especies identificadas';

  @override
  String get byDate => 'Por fecha';

  @override
  String get bySpecies => 'Por especie';

  @override
  String exportToEbird(String date) {
    return 'Exportar a eBird ($date)';
  }

  @override
  String get noRecordings => 'No hay grabaciones';

  @override
  String get deleteRecording => 'Eliminar grabación';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get noSpeciesFound => 'No se encontraron especies.';

  @override
  String get unknown => 'Desconocido';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Reproducir';

  @override
  String get changeId => 'Cambiar ID';

  @override
  String get protect => 'Proteger';

  @override
  String get unprotect => 'Desproteger';

  @override
  String get download => 'Descargar';

  @override
  String get cannotDownloadFile => 'No se puede descargar el archivo';

  @override
  String get errorLoading => 'Error al cargar';

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
  String get ebirdExport => 'Exportación eBird';

  @override
  String get generateCsvForEbird => 'Generar CSV para eBird';

  @override
  String get downloadAudioZip => 'Descargar audio (ZIP)';

  @override
  String get close => 'Cerrar';

  @override
  String get continueStep => 'Continuar';

  @override
  String get back => 'Atrás';

  @override
  String get review => 'Revisión';

  @override
  String get configuration => 'Configuración';

  @override
  String get summary => 'Resumen';

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
  String get protocol => 'Protocolo';

  @override
  String get stationaryPoint => 'Estacionario - Punto fijo';

  @override
  String get nocturnalFlightCall => 'Llamada de vuelo nocturno (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Nombre de la localidad *';

  @override
  String get requiredField => 'Campo obligatorio';

  @override
  String get numberOfObservers => 'Número de observadores';

  @override
  String get additionalComments => 'Comentarios adicionales';

  @override
  String get includeAudioFileNamesInComments =>
      'Incluir nombres de archivos de audio en los comentarios';

  @override
  String get readyForExport => 'Listo para exportar';

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
  String get statistics => 'Estadísticas';

  @override
  String get systemLogs => 'Logs del Sistema';

  @override
  String get systemTools => 'Herramientas del Sistema';

  @override
  String get systemControls => 'Controles del Sistema';

  @override
  String get restart => 'Reiniciar';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Actualizar';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Apagar';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Borrar todos los datos';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Servicios';

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
  String get spectrogram => 'Espectrograma';

  @override
  String get quickActions => 'Acciones rápidas';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Confirmar';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Comando ejecutado';

  @override
  String errorMsg(String error) {
    return '❌ Error: $error';
  }

  @override
  String get species => 'Especies';

  @override
  String get noSpeciesDetected => 'No se detectaron especies';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Detections';

  @override
  String get maxConfidence => 'Confianza máxima';

  @override
  String get searchSpecies => 'Buscar especies...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Ajustes';

  @override
  String get basicSettings => 'Ajustes básicos';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Ajuster avanzados';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Conexión';

  @override
  String get birdNetPiServerAddress => 'Dirección del servidor BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Información del dispositivo';

  @override
  String get loading => 'Cargando...';

  @override
  String get notConnected => 'No conectado';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Latitud';

  @override
  String get longitude => 'Longitud';

  @override
  String get locality => 'Localidad';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Código de país';

  @override
  String get information => 'Información';

  @override
  String get appVersion => 'Versión 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Conectado a $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ No se puede conectar a $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Error al cargar ajustes: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Ajustes básicos guardados con éxito';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Modelo';

  @override
  String get selectAModel => 'Seleccione un modelo:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Ubicación';

  @override
  String get siteName => 'Nombre del sitio:';

  @override
  String get latitudeInput => 'Latitud:';

  @override
  String get longitudeInput => 'Longitud:';

  @override
  String get birdWeatherToken => 'Token BirdWeather:';

  @override
  String get notificationsApprise => 'Notificaciones (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Título de la notificación:';

  @override
  String get notificationBody => 'Cuerpo de la notificación:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Notificar cada nueva detección';

  @override
  String get sendWeeklyReport => 'Enviar informe semanal';

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
  String get localization => 'Localización';

  @override
  String get databaseLanguage => 'Idioma de la base de datos:';

  @override
  String get otherInfo => 'Otra info';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Tema gráfico (Web)';

  @override
  String get colorScheme => 'Esquema de colores:';

  @override
  String get none => 'Ninguno';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Ajustes avanzados guardados con éxito';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Gestión de espacio en disco';

  @override
  String get whenDiskIsFull => 'Cuando el disco esté lleno:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Ajustes de audio';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Solapamiento (seg) [0, 2.9]:';

  @override
  String get audioFormat => 'Formato de audio:';

  @override
  String get recordingLength => 'Longitud de grabación (seg):';

  @override
  String get extractionLength => 'Longitud de extracción (seg):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Contraseña Caddy';

  @override
  String get appPassword => 'Contraseña de la app:';

  @override
  String get customLogoImage => 'Logotipo personalizado';

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
  String get automaticUpdate => 'Actualización automática';

  @override
  String get saveRawSpectrograms => 'Guardar espectrogramas RAW';

  @override
  String get loggingLevels => 'Niveles de registro';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Gestión de listas de especies';

  @override
  String get inclusion => 'Inclusión';

  @override
  String get exclusion => 'Exclusión';

  @override
  String get whitelist => 'Lista blanca';

  @override
  String get speciesAlreadyInList => 'La especie ya está en la lista';

  @override
  String get listSavedSuccessfully => 'Lista guardada con éxito';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Reintentar';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'Cargando especies...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'No hay especies en esta lista.';

  @override
  String get removeFromList => 'Eliminar de la lista';

  @override
  String get saving => 'Guardando...';

  @override
  String get save => 'Guardar';

  @override
  String get loginRequired => 'Se requiere inicio de sesión para esta acción';

  @override
  String get loginTitle => 'Autenticación';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Usuario';

  @override
  String get password => 'Contraseña';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Autenticado';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get audioStream => 'Transmisión de audio';

  @override
  String get pressPlayToListen => 'Presione reproducir para escuchar';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Activar sonido';

  @override
  String get mute => 'Silenciar';

  @override
  String get resume => 'Reanudar';

  @override
  String get pause => 'Pausa';

  @override
  String get autoRefresh => 'Actualización automática';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'Analizando actualmente';

  @override
  String get accessRestricted => 'Acceso restringido';

  @override
  String get loginToAccessSection =>
      'Inicie sesión para acceder a esta sección.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Error';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Otras utilidades';

  @override
  String liveSeconds(int seconds) {
    return 'EN VIVO · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram not available';

  @override
  String get ebirdCountIdentifier => 'Nº';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationary';

  @override
  String get ebirdProtocolIncidental => 'Incidental';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Actualizar';

  @override
  String get tooltipStop => 'Detener';

  @override
  String get tooltipStart => 'Iniciar';

  @override
  String get tooltipRestart => 'Reiniciar';

  @override
  String get systemInfo => 'Info del sistema';

  @override
  String get fileManager => 'Gestor de archivos';

  @override
  String get databaseMaintenance => 'Mantenimiento de base de datos';

  @override
  String get webTerminal => 'Terminal web';

  @override
  String get tooltipOpenMenu => 'Abrir menú';

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
  String get tooltipSearch => 'Buscar';

  @override
  String get tooltipPlay => 'Reproducir audio';

  @override
  String get tooltipPickDate => 'Elegir fecha';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Estado del sistema';

  @override
  String get sysInfoUptime => 'Tiempo de actividad';

  @override
  String get sysInfoDisk => 'Disco';

  @override
  String get sysInfoMemory => 'Memoria';

  @override
  String get sysInfoCpuTemp => 'Temp. CPU';

  @override
  String get sysInfoBranch => 'Rama';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Activar';

  @override
  String get disable => 'Desactivar';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Semana $weekNumber - $year';
  }
}
