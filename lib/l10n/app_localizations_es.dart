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
  String get noDetectionsForSpecies => 'No hay detecciones para esta especie.';

  @override
  String get removeFilter => 'Quitar filtro';

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
  String get monthly => 'Monthly';

  @override
  String get detectionsBySpecies => 'Detecciones por especie';

  @override
  String get hourlyDistribution => 'Distribución horaria';

  @override
  String get noChartAvailable => 'No hay gráfico disponible';

  @override
  String get weeklyReport => 'Informe Semanal';

  @override
  String get monthlyReport => 'Monthly Report';

  @override
  String get newSpecies => 'Nueva especie';

  @override
  String get newFemale => '¡Nuevo!';

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
    return '¿Quieres eliminar \"$name\" del $date $time?';
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
  String get noRecordingsAvailable => 'No hay grabaciones disponibles.';

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
      'Detecciones automáticas vía BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully =>
      '¡La descarga comenzó exitosamente!';

  @override
  String get cannotDownloadCsv => 'No se puede descargar CSV.';

  @override
  String get zipDownloadInProgress => 'Descarga ZIP en curso...';

  @override
  String get cannotOpenZipUrl => 'No se puede abrir la URL para descargar ZIP';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'El servidor no devolvió la URL de descarga.';

  @override
  String get unknownError => 'Error desconocido';

  @override
  String get serverError => 'Error del servidor';

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
  String get autoRemoveLessThan80 => 'Eliminar automáticamente < 80%';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Especies leídas: $totalSpecies | Ocurrencias: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count detecciones';
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
  String get totalUniqueSpecies => 'Especies totales (únicas)';

  @override
  String get hourlyModeledChecklists =>
      'Listas de verificación modeladas por horas';

  @override
  String get averageConfidence => 'Confianza promedio';

  @override
  String get wizardInfoText =>
      'Al presionar \"Generar CSV\", el archivo se compilará dividiendo las estaciones por horas, listo para ser cargado en eBird.';

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
  String get restartRaspberryPi => 'Reinicie la Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      '¿Está seguro de que desea reiniciar el sistema?';

  @override
  String get update => 'Actualizar';

  @override
  String get updateBirdNetPi => 'Actualice BirdNET-Pi a la última versión';

  @override
  String get doYouWantToUpdateBirdNet => '¿Quieres actualizar BirdNET-Pi?';

  @override
  String get shutdown => 'Apagar';

  @override
  String get shutdownRaspberryPi => 'Apagar la Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      '¿Está seguro de que desea apagar el sistema?';

  @override
  String get clearAllData => 'Borrar todos los datos';

  @override
  String get removeAllRecordingsAndDetections =>
      'Eliminar todas las grabaciones y detecciones';

  @override
  String get warningAllDataWillBeDeleted =>
      'ADVERTENCIA: Todos los datos se eliminarán permanentemente. ¿Continuar?';

  @override
  String get services => 'Servicios';

  @override
  String get liveAudioStream => 'Transmisión de audio en vivo';

  @override
  String get birdNetAnalysis => 'Análisis BirdNET';

  @override
  String get birdNetRecording => 'Grabación BirdNET';

  @override
  String get birdNetLog => 'Registro de BirdNET';

  @override
  String get chartViewer => 'Visor de gráficos';

  @override
  String get spectrogram => 'Espectrograma';

  @override
  String get quickActions => 'Acciones rápidas';

  @override
  String get stopServices => 'Detener servicios';

  @override
  String get restartServices => 'Reiniciar servicios';

  @override
  String get confirm => 'Confirmar';

  @override
  String get execution => 'Ejecución:';

  @override
  String get commandExecuted => '✅ Comando ejecutado';

  @override
  String errorMsg(String error) {
    return '❌ Error: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Error';
  }

  @override
  String get settings => 'Ajustes';

  @override
  String get basicSettings => 'Ajustes básicos';

  @override
  String get basicSettingsSubtitle =>
      'Configure la hora, la ubicación, el idioma y las notificaciones.';

  @override
  String get advancedSettings => 'Ajuster avanzados';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacidad, administración de discos y más.';

  @override
  String get connection => 'Conexión';

  @override
  String get birdNetPiServerAddress => 'Dirección del servidor BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Ingrese la dirección IP o el nombre de host de su Raspberry Pi';

  @override
  String get testInProgress => 'Prueba en progreso...';

  @override
  String get saveAndTestConnection => 'Guardar y probar la conexión';

  @override
  String get deviceInformation => 'Información del dispositivo';

  @override
  String get loading => 'Cargando...';

  @override
  String get notConnected => 'No conectado';

  @override
  String get configureServerAddress => 'Configurar la dirección del servidor';

  @override
  String get latitude => 'Latitud';

  @override
  String get longitude => 'Longitud';

  @override
  String get locality => 'Localidad';

  @override
  String get stateProvince => 'Estado/Provincia';

  @override
  String get countryCode => 'Código de país';

  @override
  String get information => 'Información';

  @override
  String get appVersion => 'Versión 1.0.0';

  @override
  String get appDescription =>
      'Aplicación complementaria para BirdNET-Pi. Supervise las detecciones de aves desde su Raspberry Pi.';

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
  String get errorWhileSaving => 'Error al guardar';

  @override
  String exceptionDuringSave(String error) {
    return 'Excepción al guardar: $error';
  }

  @override
  String get model => 'Modelo';

  @override
  String get selectAModel => 'Seleccione un modelo:';

  @override
  String get speciesRangeModel => 'Modelo de gama de especies V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Umbral de frecuencia de aparición de especies [0,0005, 0,99]:';

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
  String get appriseConfig => 'Configuración de notificaciones informativas:';

  @override
  String get notificationTitle => 'Título de la notificación:';

  @override
  String get notificationBody => 'Cuerpo de la notificación:';

  @override
  String get notifyNewInfrequent =>
      'Notificar cada nueva detección de especies poco frecuentes';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notificar a cada especie la primera detección del día.';

  @override
  String get notifyEachNewDetection => 'Notificar cada nueva detección';

  @override
  String get sendWeeklyReport => 'Enviar informe semanal';

  @override
  String get minTimeBetweenNotifications =>
      'Tiempo mínimo entre notificaciones de la misma especie (seg):';

  @override
  String get excludeTheseSpecies =>
      'Excluya estas especies (separadas por comas):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Notificar SÓLO para estas especies (separadas por comas):';

  @override
  String get imageSource => 'Fuente de la imagen';

  @override
  String get imageProvider => 'Proveedor de imágenes:';

  @override
  String get flickrApiKey => 'Clave API de Flickr:';

  @override
  String get flickrFilterEmail =>
      'Buscar sólo fotos de este usuario de Flickr:';

  @override
  String get localization => 'Localización';

  @override
  String get databaseLanguage => 'Idioma de la base de datos:';

  @override
  String get otherInfo => 'Otra info';

  @override
  String get infoSite => 'Sitio de información:';

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
  String get privacyRecordings => 'Privacidad de las grabaciones';

  @override
  String get privacyThreshold => 'Umbral de privacidad [0, 99]:';

  @override
  String get diskSpaceManagement => 'Gestión de espacio en disco';

  @override
  String get whenDiskIsFull => 'Cuando el disco esté lleno:';

  @override
  String get purgeCapacity => 'Capacidad de purga [% umbral]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Máximo de archivos para conservar por especie (0 = deshabilitar):';

  @override
  String get audioSettings => 'Ajustes de audio';

  @override
  String get alsaInputCaptureDevice =>
      'Dispositivo de captura de entrada ALSA (Tarjeta de sonido):';

  @override
  String get numberOfAudioChannels =>
      'Número de canales de audio de los que extraer:';

  @override
  String get overlap => 'Solapamiento (seg) [0, 2.9]:';

  @override
  String get audioFormat => 'Formato de audio:';

  @override
  String get recordingLength => 'Longitud de grabación (seg):';

  @override
  String get extractionLength => 'Longitud de extracción (seg):';

  @override
  String get rtspAudioSharing => 'Compartir audio RTSP';

  @override
  String get shareLiveAudioStream => '¿Compartir transmisión de audio en vivo?';

  @override
  String get playAudioStreamThroughWebUi =>
      '¿Reproducir transmisión de audio a través de la interfaz de usuario web?';

  @override
  String get caddyPassword => 'Contraseña Caddy';

  @override
  String get appPassword => 'Contraseña de la app:';

  @override
  String get customLogoImage => 'Logotipo personalizado';

  @override
  String get customImageUrl => 'URL de imagen personalizada:';

  @override
  String get customImageTitle => 'Título de imagen personalizado:';

  @override
  String get birdNetLiteModelSettings =>
      'Configuración del modelo BirdNET-Lite';

  @override
  String get confidenceThreshold => 'Umbral de confianza [0, 0,99]:';

  @override
  String get sensitivity => 'Sensibilidad [0,5, 1,5]:';

  @override
  String get otherSettings => 'Otras configuraciones';

  @override
  String get silenceUpdateIndicator =>
      'Silenciar el indicador \"Actualización disponible\"';

  @override
  String get automaticUpdate => 'Actualización automática';

  @override
  String get saveRawSpectrograms => 'Guardar espectrogramas RAW';

  @override
  String get loggingLevels => 'Niveles de registro';

  @override
  String get birdnetRecordingService => 'Servicio de grabación BirdNET:';

  @override
  String get spectrogramViewerService => 'Servicio de visor de espectrogramas:';

  @override
  String get liveAudioStreamService =>
      'Servicio de transmisión de audio en vivo:';

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
  String get errorSavingList => 'Error al guardar la lista';

  @override
  String errorLoadingList(String error) {
    return 'Error al cargar la lista:\\n$error';
  }

  @override
  String get retry => 'Reintentar';

  @override
  String get searchSpeciesHint =>
      'Buscar especies (por ejemplo, Turdus merula_Mirlo común)';

  @override
  String get loadingSpecies => 'Cargando especies...';

  @override
  String get errorLoadingSpecies => 'Error al cargar especies';

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
      'Ingrese sus credenciales para acceder a funciones protegidas.';

  @override
  String get username => 'Usuario';

  @override
  String get password => 'Contraseña';

  @override
  String get loginEmptyError =>
      'Por favor ingrese nombre de usuario y contraseña';

  @override
  String get loginInvalidError => 'Credenciales no válidas';

  @override
  String get authenticated => 'Autenticado';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get loggedInMessage => 'Actualmente estás autenticado.';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get audioStream => 'Transmisión de audio';

  @override
  String get pressPlayToListen => 'Presione reproducir para escuchar';

  @override
  String get loginToStart => 'Inicia sesión con 🔒 para comenzar';

  @override
  String get streamRequiresAuth =>
      'La transmisión requiere autenticación. Toca el ícono 🔒 en la parte superior derecha para iniciar sesión.';

  @override
  String get liveAudioFootnote => 'Audio en vivo BirdNET-Pi';

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
  String get pressPlaySpectrogram => 'Presione ▶ para ver el espectrograma';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Presione ▶ para iniciar el espectrograma en tiempo real';

  @override
  String get loginThenPlay => 'Inicie sesión con 🔒 y luego presione ▶';

  @override
  String get currentAnalyzing => 'Analizando actualmente';

  @override
  String get accessRestricted => 'Acceso restringido';

  @override
  String get loginToAccessSection =>
      'Inicie sesión para acceder a esta sección.';

  @override
  String get iframeNotSupported =>
      'Los iframes son estrictamente compatibles con la versión web.';

  @override
  String get error => 'Error';

  @override
  String get otherUtilities => 'Otras utilidades';

  @override
  String liveSeconds(int seconds) {
    return 'EN VIVO · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Espectrograma no disponible';

  @override
  String get ebirdCountIdentifier => 'Nº';

  @override
  String get ebirdCountDefault => 'incógnita';

  @override
  String get ebirdProtocolStationary => 'Estacionario';

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
  String get tooltipRefreshData => 'Actualizar datos';

  @override
  String get tooltipPreviousDay => 'dia anterior';

  @override
  String get tooltipNextDay => 'dia siguiente';

  @override
  String get tooltipPreviousWeek => 'Semana anterior';

  @override
  String get tooltipNextWeek => 'La próxima semana';

  @override
  String get tooltipDeleteRecording => 'Eliminar grabación';

  @override
  String get tooltipClearSearch => 'Borrar búsqueda';

  @override
  String get tooltipCloseSearch => 'Cerrar búsqueda';

  @override
  String get tooltipSearch => 'Buscar';

  @override
  String get tooltipPlay => 'Reproducir audio';

  @override
  String get tooltipPickDate => 'Elegir fecha';

  @override
  String get passwordOptionalHint => 'Dejar vacío si no está configurado';

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
    return '$count se compromete detrás';
  }

  @override
  String get sysInfoLoadingError =>
      'No se pudo cargar la información del sistema.';

  @override
  String get enable => 'Activar';

  @override
  String get disable => 'Desactivar';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Semana $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Agrupar por especie';

  @override
  String get groupByTime => 'Agrupar por tiempo';

  @override
  String get readOnWikipedia => 'Leer en Wikipedia';

  @override
  String get loadingWikipedia => 'Cargando información de Wikipedia...';

  @override
  String get noWikipediaInfo =>
      'No se encontró información en Wikipedia para esta especie.';

  @override
  String get searchSpecies => 'Buscar especies...';

  @override
  String get noResultsFound => 'No se encontraron resultados';

  @override
  String get noSpeciesDetected => 'No se detectaron especies';

  @override
  String get species => 'Especies';

  @override
  String get detections => 'Detecciones';

  @override
  String get maxConfidence => 'Máx. Confianza';

  @override
  String get topSpecies => 'Top species';

  @override
  String get fromDate => 'Desde fecha';

  @override
  String get toDate => 'Hasta fecha';

  @override
  String get fromTime => 'Desde hora';

  @override
  String get toTime => 'Hasta hora';

  @override
  String get byPeriod => 'Por período';

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
  String get firstSeen => 'Visto por primera vez';

  @override
  String get lastSeen => 'Visto por última vez';

  @override
  String get thirtyDaysTrend => 'Tendencia 30 días';

  @override
  String get avgConfidence => 'Conf. Media';

  @override
  String get mySpecies => 'Mis Especies';

  @override
  String get bestDetection => 'Mejor Detección';

  @override
  String get externalInfoLink => 'Información Externa';

  @override
  String get includedListInfo =>
      'Warning! If this list contains ANY species, the system will ONLY recognize those species. Keep this list EMPTY unless you are ONLY interested in detecting specific species.';

  @override
  String get excludedListInfo =>
      'Once the desired species has been highlighted, click it and then click ADD to have it excluded.';

  @override
  String get whitelistInfo =>
      'Once the desired species has been highlighted, click it and then click ADD to have it whitelisted. This species will be detected even if below the Species Occurrence Frequency Threshold defined in the settings. This is not a recommended way of working : it is preferable to first try first both Species Occurrence models (v1 and v2.4).';
}
