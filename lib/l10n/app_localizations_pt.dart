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
  String get noDetectionsForSpecies => 'Nenhuma detecção para esta espécie';

  @override
  String get removeFilter => 'Remover filtro';

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
  String get detectionsBySpecies => 'Detecções por espécie';

  @override
  String get hourlyDistribution => 'Distribuição por hora';

  @override
  String get noChartAvailable => 'Gráfico indisponível';

  @override
  String get weeklyReport => 'Relatório Semanal';

  @override
  String get newSpecies => 'Nova espécie';

  @override
  String get newFemale => 'Novo!';

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
    return 'Deseja excluir \"$name\" de $date $time?';
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
  String get noRecordingsAvailable => 'Nenhuma gravação disponível.';

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
      'Detecções automáticas via BirdNET-Pi...';

  @override
  String get downloadStartedSuccessfully => 'Download iniciado com sucesso!';

  @override
  String get cannotDownloadCsv => 'Não é possível baixar o CSV.';

  @override
  String get zipDownloadInProgress => 'Download ZIP em andamento...';

  @override
  String get cannotOpenZipUrl => 'Não é possível abrir o URL para download ZIP';

  @override
  String get serverDidNotReturnDownloadUrl =>
      'O servidor não retornou o URL de download.';

  @override
  String get unknownError => 'Erro desconhecido';

  @override
  String get serverError => 'Erro no servidor';

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
  String get autoRemoveLessThan80 => 'Remover automaticamente <80%';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return 'Espécies lidas: $totalSpecies | Ocorrências: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count detecções';
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
  String get totalUniqueSpecies => 'Total de Espécies (Único)';

  @override
  String get hourlyModeledChecklists =>
      'Listas de verificação modeladas por hora';

  @override
  String get averageConfidence => 'Confiança Média';

  @override
  String get wizardInfoText =>
      'Ao pressionar “Gerar CSV”, o arquivo será compilado dividindo as estações por hora, pronto para ser carregado no eBird.';

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
  String get restartRaspberryPi => 'Reinicie o Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Tem certeza de que deseja reiniciar o sistema?';

  @override
  String get update => 'Atualizar';

  @override
  String get updateBirdNetPi =>
      'Atualize BirdNET-Pi para a versão mais recente';

  @override
  String get doYouWantToUpdateBirdNet => 'Deseja atualizar o BirdNET-Pi?';

  @override
  String get shutdown => 'Desligar';

  @override
  String get shutdownRaspberryPi => 'Desligue o Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Tem certeza de que deseja desligar o sistema?';

  @override
  String get clearAllData => 'Limpar todos os dados';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remova todas as gravações e detecções';

  @override
  String get warningAllDataWillBeDeleted =>
      'AVISO: Todos os dados serão excluídos permanentemente. Continuar?';

  @override
  String get services => 'Serviços';

  @override
  String get liveAudioStream => 'Transmissão de áudio ao vivo';

  @override
  String get birdNetAnalysis => 'Análise BirdNET';

  @override
  String get birdNetRecording => 'Gravação BirdNET';

  @override
  String get birdNetLog => 'Registro do BirdNET';

  @override
  String get chartViewer => 'Visualizador de gráficos';

  @override
  String get spectrogram => 'Espetrograma';

  @override
  String get quickActions => 'Ações rápidas';

  @override
  String get stopServices => 'Parar serviços';

  @override
  String get restartServices => 'Reinicie os serviços';

  @override
  String get confirm => 'Confirmar';

  @override
  String get execution => 'Execução:';

  @override
  String get commandExecuted => '✅ Comando executado';

  @override
  String errorMsg(String error) {
    return '❌ Erro: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'Erro';
  }

  @override
  String get settings => 'Definições';

  @override
  String get basicSettings => 'Definições básicas';

  @override
  String get basicSettingsSubtitle =>
      'Configure hora, local, idioma e notificações.';

  @override
  String get advancedSettings => 'Definições avançadas';

  @override
  String get advancedSettingsSubtitle =>
      'Configure áudio, privacidade, gerenciamento de disco e muito mais.';

  @override
  String get connection => 'Conexão';

  @override
  String get birdNetPiServerAddress => 'Endereço do servidor BirdNET-Pi';

  @override
  String get enterIpOrHostname =>
      'Digite o endereço IP ou nome do host do seu Raspberry Pi';

  @override
  String get testInProgress => 'Teste em andamento...';

  @override
  String get saveAndTestConnection => 'Salvar e testar conexão';

  @override
  String get deviceInformation => 'Informação do dispositivo';

  @override
  String get loading => 'A carregar...';

  @override
  String get notConnected => 'Não ligado';

  @override
  String get configureServerAddress => 'Configurar o endereço do servidor';

  @override
  String get latitude => 'Latitude';

  @override
  String get longitude => 'Longitude';

  @override
  String get locality => 'Localidade';

  @override
  String get stateProvince => 'Estado/Província';

  @override
  String get countryCode => 'Código do país';

  @override
  String get information => 'Informação';

  @override
  String get appVersion => 'Versão 1.0.0';

  @override
  String get appDescription =>
      'Aplicativo complementar para BirdNET-Pi. Monitore as detecções de pássaros no seu Raspberry Pi.';

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
  String get errorWhileSaving => 'Erro ao salvar';

  @override
  String exceptionDuringSave(String error) {
    return 'Exceção durante o salvamento: $error';
  }

  @override
  String get model => 'Modelo';

  @override
  String get selectAModel => 'Selecione um modelo:';

  @override
  String get speciesRangeModel => 'Gama de espécies modelo V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Limite de frequência de ocorrência de espécies [0,0005, 0,99]:';

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
  String get appriseConfig => 'Configuração de notificações informadas:';

  @override
  String get notificationTitle => 'Título da notificação:';

  @override
  String get notificationBody => 'Corpo da notificação:';

  @override
  String get notifyNewInfrequent =>
      'Notificar cada nova detecção de espécie pouco frequente';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notificar cada espécie na primeira detecção do dia';

  @override
  String get notifyEachNewDetection => 'Notificar cada nova deteção';

  @override
  String get sendWeeklyReport => 'Enviar relatório semanal';

  @override
  String get minTimeBetweenNotifications =>
      'Tempo mínimo entre notificações da mesma espécie (seg):';

  @override
  String get excludeTheseSpecies =>
      'Exclua estas espécies (separadas por vírgula):';

  @override
  String get onlyNotifyForTheseSpecies =>
      'Notificar SOMENTE para estas espécies (separadas por vírgula):';

  @override
  String get imageSource => 'Fonte da imagem';

  @override
  String get imageProvider => 'Provedor de imagem:';

  @override
  String get flickrApiKey => 'Chave de API do Flickr:';

  @override
  String get flickrFilterEmail =>
      'Pesquise apenas fotos deste usuário do Flickr:';

  @override
  String get localization => 'Localização';

  @override
  String get databaseLanguage => 'Idioma da base de dados:';

  @override
  String get otherInfo => 'Outras info';

  @override
  String get infoSite => 'Site de informações:';

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
  String get privacyRecordings => 'Privacidade de gravações';

  @override
  String get privacyThreshold => 'Limite de privacidade [0, 99]:';

  @override
  String get diskSpaceManagement => 'Gestão de espaço em disco';

  @override
  String get whenDiskIsFull => 'Apoio ao preenchimento do disco:';

  @override
  String get purgeCapacity => 'Capacidade de purga [% limite]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Máximo de arquivos a serem mantidos por espécie (0 = desabilitar):';

  @override
  String get audioSettings => 'Definições de áudio';

  @override
  String get alsaInputCaptureDevice =>
      'Dispositivo de captura de entrada ALSA (placa de som):';

  @override
  String get numberOfAudioChannels =>
      'Número de canais de áudio dos quais extrair:';

  @override
  String get overlap => 'Sobreposição (seg) [0, 2.9]:';

  @override
  String get audioFormat => 'Formato de áudio:';

  @override
  String get recordingLength => 'Duração da gravação (seg):';

  @override
  String get extractionLength => 'Duração da extração (seg):';

  @override
  String get rtspAudioSharing => 'Compartilhamento de áudio RTSP';

  @override
  String get shareLiveAudioStream =>
      'Compartilhar transmissão de áudio ao vivo?';

  @override
  String get playAudioStreamThroughWebUi =>
      'Reproduzir fluxo de áudio através da interface da Web?';

  @override
  String get caddyPassword => 'Palavra-passe Caddy';

  @override
  String get appPassword => 'Palavra-passe da aplicação:';

  @override
  String get customLogoImage => 'Logótipo personalizado';

  @override
  String get customImageUrl => 'URL da imagem personalizada:';

  @override
  String get customImageTitle => 'Título da imagem personalizada:';

  @override
  String get birdNetLiteModelSettings => 'Configurações do modelo BirdNET-Lite';

  @override
  String get confidenceThreshold => 'Limite de confiança [0, 0,99]:';

  @override
  String get sensitivity => 'Sensibilidade [0,5, 1,5]:';

  @override
  String get otherSettings => 'Outras configurações';

  @override
  String get silenceUpdateIndicator =>
      'Indicador de silêncio \"Atualização disponível\"';

  @override
  String get automaticUpdate => 'Atualização automática';

  @override
  String get saveRawSpectrograms => 'Guardar espetrogramas originais';

  @override
  String get loggingLevels => 'Níveis de registo';

  @override
  String get birdnetRecordingService => 'Serviço de gravação BirdNET:';

  @override
  String get spectrogramViewerService =>
      'Serviço de visualizador de espectrograma:';

  @override
  String get liveAudioStreamService =>
      'Serviço de transmissão de áudio ao vivo:';

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
  String get errorSavingList => 'Erro ao salvar a lista';

  @override
  String errorLoadingList(String error) {
    return 'Erro ao carregar a lista:\\n$error';
  }

  @override
  String get retry => 'Tentar novamente';

  @override
  String get searchSpeciesHint =>
      'Espécies de pesquisa (por exemplo, Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => 'A carregar espécies...';

  @override
  String get errorLoadingSpecies => 'Erro ao carregar espécies';

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
      'Insira suas credenciais para acessar recursos protegidos.';

  @override
  String get username => 'Nome de utilizador';

  @override
  String get password => 'Palavra-passe';

  @override
  String get loginEmptyError => 'Por favor insira nome de usuário e senha';

  @override
  String get loginInvalidError => 'Credenciais inválidas';

  @override
  String get authenticated => 'Autenticado';

  @override
  String get signIn => 'Iniciar sessão';

  @override
  String get loggedInMessage => 'Você está autenticado no momento.';

  @override
  String get logout => 'Terminar sessão';

  @override
  String get login => 'Iniciar sessão';

  @override
  String get audioStream => 'Fluxo de áudio';

  @override
  String get pressPlayToListen => 'Prima reproduzir para ouvir';

  @override
  String get loginToStart => 'Faça login com 🔒 para começar';

  @override
  String get streamRequiresAuth =>
      'O fluxo requer autenticação. Toque no ícone 🔒 no canto superior direito para fazer login.';

  @override
  String get liveAudioFootnote => 'Áudio ao vivo BirdNET-Pi';

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
  String get pressPlaySpectrogram =>
      'Pressione ▶ para visualizar o espectrograma';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Pressione ▶ para iniciar o espectrograma em tempo real';

  @override
  String get loginThenPlay => 'Faça login com 🔒 e pressione ▶';

  @override
  String get currentAnalyzing => 'A analisar agora';

  @override
  String get accessRestricted => 'Acesso restrito';

  @override
  String get loginToAccessSection => 'Inicie sessão para aceder a esta secção.';

  @override
  String get iframeNotSupported =>
      'Iframes são estritamente suportados na versão web.';

  @override
  String get error => 'Erro';

  @override
  String get otherUtilities => 'Outras utilidades';

  @override
  String liveSeconds(int seconds) {
    return 'DIRETO · ${seconds}s';
  }

  @override
  String get spectrogramNotAvailable => 'Espectrograma não disponível';

  @override
  String get ebirdCountIdentifier => 'N.º';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Estacionário';

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
  String get tooltipRefreshData => 'Atualizar dados';

  @override
  String get tooltipPreviousDay => 'Dia anterior';

  @override
  String get tooltipNextDay => 'Dia seguinte';

  @override
  String get tooltipPreviousWeek => 'Semana anterior';

  @override
  String get tooltipNextWeek => 'Próxima semana';

  @override
  String get tooltipDeleteRecording => 'Excluir gravação';

  @override
  String get tooltipClearSearch => 'Limpar pesquisa';

  @override
  String get tooltipCloseSearch => 'Fechar pesquisa';

  @override
  String get tooltipSearch => 'Procurar';

  @override
  String get tooltipPlay => 'Reproduzir áudio';

  @override
  String get tooltipPickDate => 'Escolher data';

  @override
  String get passwordOptionalHint => 'Deixe em branco se não estiver definido';

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
    return '$count commits atrasados';
  }

  @override
  String get sysInfoLoadingError => 'Falha ao carregar informações do sistema.';

  @override
  String get enable => 'Ativar';

  @override
  String get disable => 'Desativar';

  @override
  String weekStr(int weekNumber, int year) {
    return 'Semana $weekNumber - $year';
  }

  @override
  String get groupBySpecies => 'Agrupar por espécie';

  @override
  String get groupByTime => 'Agrupar por horário';

  @override
  String get readOnWikipedia => 'Leia na Wikipédia';

  @override
  String get loadingWikipedia => 'Carregando informações da Wikipédia...';

  @override
  String get noWikipediaInfo =>
      'Nenhuma informação encontrada na Wikipedia para esta espécie.';

  @override
  String get searchSpecies => 'Procurar espécies...';

  @override
  String get noResultsFound => 'Nenhum resultado encontrado';

  @override
  String get noSpeciesDetected => 'Nenhuma espécie detetada';

  @override
  String get species => 'Espécies';

  @override
  String get detections => 'Deteções';

  @override
  String get maxConfidence => 'Confiança Máx.';

  @override
  String get topSpecies => 'Top species';

  @override
  String get fromDate => 'De data';

  @override
  String get toDate => 'Até data';

  @override
  String get fromTime => 'De hora';

  @override
  String get toTime => 'Até hora';

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
  String get firstSeen => 'Visto pela primeira vez';

  @override
  String get lastSeen => 'Visto pela última vez';

  @override
  String get thirtyDaysTrend => 'Tendência de 30 dias';

  @override
  String get avgConfidence => 'Conf. Média';

  @override
  String get mySpecies => 'Minhas Espécies';

  @override
  String get bestDetection => 'Melhor Detecção';

  @override
  String get externalInfoLink => 'Info Externa';
}
