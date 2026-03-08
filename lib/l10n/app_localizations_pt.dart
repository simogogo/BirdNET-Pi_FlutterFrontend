// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => 'Monitorização de Aves';

  @override
  String get home => 'Início';

  @override
  String get today => 'Hoje';

  @override
  String get recordings => 'Gravações';

  @override
  String get liveStream => 'Transmissão ao Vivo';

  @override
  String get liveSpectrogram => 'Espetrograma ao Vivo';

  @override
  String get speciesManagement => 'GESTÃO DE ESPÉCIES';

  @override
  String get inclusionList => 'Lista de Inclusão';

  @override
  String get exclusionList => 'Lista de Exclusão';

  @override
  String get analysisLog => 'Registo de Análise';

  @override
  String get openWebInterface => 'Abrir Interface Web';

  @override
  String get loadingLiveSpectrogram => 'A carregar espetrograma ao vivo...';

  @override
  String get spectrogramInstruction =>
      'Se o áudio não começar automaticamente, interaja com a página ou verifique as permissões do navegador.';

  @override
  String get configureServerFirst =>
      'Configure primeiro o endereço do servidor nas Definições';

  @override
  String get recentDetections => 'Deteções Recentes';

  @override
  String get latestDetection => 'Última deteção';

  @override
  String get audioFile => 'Ficheiro de Áudio';

  @override
  String get playing => 'A reproduzir';

  @override
  String get noDetectionsToday => 'Sem deteções hoje';

  @override
  String get systemListening => 'O sistema está a ouvir...';

  @override
  String get errorOccurred => 'Ocorreu um erro';

  @override
  String get overview => 'Visão Geral';

  @override
  String get detectionsAllTime => 'Deteções\ntotal';

  @override
  String get detectionsToday => 'Deteções\nhoje';

  @override
  String get detectionsLastHour => 'Detections\núltima hora';

  @override
  String get speciesToday => 'Espécies\nhoje';

  @override
  String get speciesAllTime => 'Espécies\ntotal';

  @override
  String get statsLoadingError => 'Erro ao carregar estatísticas';

  @override
  String get todaysDetections => 'Deteções de Hoje';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count deteções';
  }

  @override
  String get filterDetections => 'Filtrar deteções';

  @override
  String get minimumConfidenceThreshold => 'Limiar mínimo de confiança';

  @override
  String get reset => 'Repor';

  @override
  String get apply => 'Aplicar';

  @override
  String get charts => 'Gráficos';

  @override
  String get daily => 'Diário';

  @override
  String get weekly => 'Semanal';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'Gráfico indisponível';

  @override
  String get weeklyReport => 'Relatório Semanal';

  @override
  String get newSpecies => 'Nova espécie';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => 'Espécies identificadas';

  @override
  String get byDate => 'Por data';

  @override
  String get bySpecies => 'Por espécie';

  @override
  String exportToEbird(String date) {
    return 'Exportar para eBird ($date)';
  }

  @override
  String get noRecordings => 'Sem gravações';

  @override
  String get deleteRecording => 'Eliminar gravação';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get noSpeciesFound => 'Nenhuma espécie encontrada.';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => 'Reproduzir';

  @override
  String get changeId => 'Alterar ID';

  @override
  String get protect => 'Proteger';

  @override
  String get unprotect => 'Desproteger';

  @override
  String get download => 'Descarregar';

  @override
  String get cannotDownloadFile => 'Não foi possível descarregar o ficheiro';

  @override
  String get errorLoading => 'Erro ao carregar';

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
  String get ebirdExport => 'Exportação eBird';

  @override
  String get generateCsvForEbird => 'Gerar CSV para eBird';

  @override
  String get downloadAudioZip => 'Descarregar áudio (ZIP)';

  @override
  String get close => 'Fechar';

  @override
  String get continueStep => 'Continuar';

  @override
  String get back => 'Voltar';

  @override
  String get review => 'Revisão';

  @override
  String get configuration => 'Configuração';

  @override
  String get summary => 'Resumo';

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
  String get stationaryPoint => 'Estacionário - Ponto fixo';

  @override
  String get nocturnalFlightCall => 'Chamamento de voo noturno (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => 'Nome da localidade *';

  @override
  String get requiredField => 'Campo obrigatório';

  @override
  String get numberOfObservers => 'Número de observadores';

  @override
  String get additionalComments => 'Comentários adicionais';

  @override
  String get includeAudioFileNamesInComments =>
      'Incluir nomes dos ficheiros de áudio nos comentários';

  @override
  String get readyForExport => 'Pronto para exportar';

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
  String get statistics => 'Estatísticas';

  @override
  String get systemLogs => 'Registos do Sistema';

  @override
  String get systemTools => 'Ferramentas do Sistema';

  @override
  String get systemControls => 'Controlos do Sistema';

  @override
  String get restart => 'Reiniciar';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'Atualizar';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'Desligar';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => 'Limpar todos os dados';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'Serviços';

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
  String get spectrogram => 'Espetrograma';

  @override
  String get quickActions => 'Ações rápidas';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => 'Confirmar';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ Comando executado';

  @override
  String errorMsg(String error) {
    return '❌ Erro: $error';
  }

  @override
  String get species => 'Espécies';

  @override
  String get noSpeciesDetected => 'Nenhuma espécie detetada';

  @override
  String get max => 'Max:';

  @override
  String get detections => 'Deteções';

  @override
  String get maxConfidence => 'Confiança máxima';

  @override
  String get searchSpecies => 'Procurar espécies...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => 'Definições';

  @override
  String get basicSettings => 'Definições básicas';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => 'Definições avançadas';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => 'Conexão';

  @override
  String get birdNetPiServerAddress => 'Endereço do servidor BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'Informação do dispositivo';

  @override
  String get loading => 'A carregar...';

  @override
  String get notConnected => 'Não ligado';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => 'Latitude';

  @override
  String get longitude => 'Longitude';

  @override
  String get locality => 'Localidade';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => 'Código do país';

  @override
  String get information => 'Informação';

  @override
  String get appVersion => 'Versão 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ Ligado a $url';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ Não foi possível ligar a $url';
  }

  @override
  String errorLoadingSettings(String error) {
    return 'Erro ao carregar definições: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully =>
      'Definições básicas guardadas com sucesso';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'Modelo';

  @override
  String get selectAModel => 'Selecione um modelo:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => 'Localização';

  @override
  String get siteName => 'Nome do sítio:';

  @override
  String get latitudeInput => 'Latitude:';

  @override
  String get longitudeInput => 'Longitude:';

  @override
  String get birdWeatherToken => 'Token BirdWeather:';

  @override
  String get notificationsApprise => 'Notificações (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => 'Título da notificação:';

  @override
  String get notificationBody => 'Corpo da notificação:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => 'Notificar cada nova deteção';

  @override
  String get sendWeeklyReport => 'Enviar relatório semanal';

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
  String get localization => 'Localização';

  @override
  String get databaseLanguage => 'Idioma da base de dados:';

  @override
  String get otherInfo => 'Outras info';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'Tema gráfico (Web)';

  @override
  String get colorScheme => 'Esquema de cores:';

  @override
  String get none => 'Nenhum';

  @override
  String get advancedSettingsSavedSuccessfully =>
      'Definições avançadas guardadas com sucesso';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'Gestão de espaço em disco';

  @override
  String get whenDiskIsFull => 'Apoio ao preenchimento do disco:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'Definições de áudio';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'Sobreposição (seg) [0, 2.9]:';

  @override
  String get audioFormat => 'Formato de áudio:';

  @override
  String get recordingLength => 'Duração da gravação (seg):';

  @override
  String get extractionLength => 'Duração da extração (seg):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Palavra-passe Caddy';

  @override
  String get appPassword => 'Palavra-passe da aplicação:';

  @override
  String get customLogoImage => 'Logótipo personalizado';

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
  String get automaticUpdate => 'Atualização automática';

  @override
  String get saveRawSpectrograms => 'Guardar espetrogramas originais';

  @override
  String get loggingLevels => 'Níveis de registo';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => 'Gestão de listas de espécies';

  @override
  String get inclusion => 'Inclusão';

  @override
  String get exclusion => 'Exclusão';

  @override
  String get whitelist => 'Lista branca';

  @override
  String get speciesAlreadyInList => 'Espécie já presente na lista';

  @override
  String get listSavedSuccessfully => 'Lista guardada com sucesso';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => 'Tentar novamente';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'A carregar espécies...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'Nenhuma espécie nesta lista.';

  @override
  String get removeFromList => 'Remover da lista';

  @override
  String get saving => 'A guardar...';

  @override
  String get save => 'Guardar';

  @override
  String get loginRequired => 'Autenticação necessária para esta ação';

  @override
  String get loginTitle => 'Autenticação';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'Nome de utilizador';

  @override
  String get password => 'Palavra-passe';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => 'Autenticado';

  @override
  String get signIn => 'Iniciar sessão';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'Terminar sessão';

  @override
  String get login => 'Iniciar sessão';

  @override
  String get audioStream => 'Fluxo de áudio';

  @override
  String get pressPlayToListen => 'Prima reproduzir para ouvir';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'Ativar som';

  @override
  String get mute => 'Silenciar';

  @override
  String get resume => 'Retomar';

  @override
  String get pause => 'Pausa';

  @override
  String get autoRefresh => 'Atualização automática';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => 'A analisar agora';

  @override
  String get accessRestricted => 'Acesso restrito';

  @override
  String get loginToAccessSection => 'Inicie sessão para aceder a esta secção.';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'Erro';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'Outras utilidades';

  @override
  String liveSeconds(int seconds) {
    return 'DIRETO · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram not available';

  @override
  String get ebirdCountIdentifier => 'N.º';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationary';

  @override
  String get ebirdProtocolIncidental => 'Incidental';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => 'Atualizar';

  @override
  String get tooltipStop => 'Parar';

  @override
  String get tooltipStart => 'Iniciar';

  @override
  String get tooltipRestart => 'Reiniciar';

  @override
  String get systemInfo => 'Informação do sistema';

  @override
  String get fileManager => 'Gestor de ficheiros';

  @override
  String get databaseMaintenance => 'Manutenção da base de dados';

  @override
  String get webTerminal => 'Terminal web';

  @override
  String get tooltipOpenMenu => 'Abrir menu';

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
  String get tooltipSearch => 'Procurar';

  @override
  String get tooltipPlay => 'Reproduzir áudio';

  @override
  String get tooltipPickDate => 'Escolher data';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'Estado do sistema';

  @override
  String get sysInfoUptime => 'Tempo de atividade';

  @override
  String get sysInfoDisk => 'Disco';

  @override
  String get sysInfoMemory => 'Memória';

  @override
  String get sysInfoCpuTemp => 'Temp. CPU';

  @override
  String get sysInfoBranch => 'Branch';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => 'Ativar';

  @override
  String get disable => 'Desativar';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Semana $weekNumber - $year';
  }
}
