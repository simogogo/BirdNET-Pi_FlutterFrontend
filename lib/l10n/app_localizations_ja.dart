// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'BirdNET-Pi';

  @override
  String get birdMonitoring => '鳥のモニタリング';

  @override
  String get home => 'ホーム';

  @override
  String get today => '今日';

  @override
  String get recordings => '録音';

  @override
  String get liveStream => 'ライブストリーム';

  @override
  String get liveSpectrogram => 'ライブスペクトログラム';

  @override
  String get speciesManagement => '種管理';

  @override
  String get inclusionList => '包含リスト';

  @override
  String get exclusionList => '除外リスト';

  @override
  String get analysisLog => '分析ログ';

  @override
  String get openWebInterface => 'ウェブインターフェースを開く';

  @override
  String get loadingLiveSpectrogram => 'ライブスペクトログラムを読み込み中...';

  @override
  String get spectrogramInstruction =>
      'オーディオが自動的に開始されない場合は、ページを操作するか、ブラウザの権限を確認してください。';

  @override
  String get configureServerFirst => '最初に設定でサーバーアドレスを構成してください';

  @override
  String get recentDetections => '最近の検出';

  @override
  String get latestDetection => '最新の検出';

  @override
  String get audioFile => 'オーディオファイル';

  @override
  String get playing => '再生中';

  @override
  String get noDetectionsToday => '今日の検出はありません';

  @override
  String get systemListening => 'システムがリスニング中...';

  @override
  String get errorOccurred => 'エラーが発生しました';

  @override
  String get overview => '概要';

  @override
  String get detectionsAllTime => '検出\n合計';

  @override
  String get detectionsToday => '検出\n今日';

  @override
  String get detectionsLastHour => '検出\n過去1時間';

  @override
  String get speciesToday => '種\n今日';

  @override
  String get speciesAllTime => '種\n合計';

  @override
  String get statsLoadingError => '統計の読み込みエラー';

  @override
  String get todaysDetections => '今日の検出';

  @override
  String get noDetectionsForSpecies => 'No detections for this species';

  @override
  String get removeFilter => 'Remove filter';

  @override
  String detectionsCount(int count) {
    return '$count 件の検出';
  }

  @override
  String get filterDetections => '検出をフィルタリング';

  @override
  String get minimumConfidenceThreshold => '最小信頼度しきい値';

  @override
  String get reset => 'リセット';

  @override
  String get apply => '適用';

  @override
  String get charts => 'チャート';

  @override
  String get daily => '日次';

  @override
  String get weekly => '週次';

  @override
  String get detectionsBySpecies => 'Detections by Species';

  @override
  String get hourlyDistribution => 'Hourly Distribution';

  @override
  String get noChartAvailable => 'チャートは利用不可';

  @override
  String get weeklyReport => '週報';

  @override
  String get newSpecies => '新種';

  @override
  String get newFemale => 'New!';

  @override
  String get identifiedSpecies => '特定された種';

  @override
  String get byDate => '日付順';

  @override
  String get bySpecies => '種順';

  @override
  String exportToEbird(String date) {
    return 'eBirdへエクスポート ($date)';
  }

  @override
  String get noRecordings => '録音なし';

  @override
  String get deleteRecording => '録音を削除';

  @override
  String deleteRecordingConfirmation(String name, String date, String time) {
    return 'Do you want to delete \"$name\" from $date $time?';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get delete => '削除';

  @override
  String get noSpeciesFound => '種が見つかりません。';

  @override
  String get unknown => '不明';

  @override
  String get noRecordingsAvailable => 'No recordings available.';

  @override
  String get play => '再生';

  @override
  String get changeId => 'IDを変更';

  @override
  String get protect => '保護';

  @override
  String get unprotect => '保護解除';

  @override
  String get download => 'ダウンロード';

  @override
  String get cannotDownloadFile => 'ファイルをダウンロードできません';

  @override
  String get errorLoading => '読み込みエラー';

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
  String get ebirdExport => 'eBirdエクスポート';

  @override
  String get generateCsvForEbird => 'eBird用CSV生成';

  @override
  String get downloadAudioZip => 'オーディオをダウンロード (ZIP)';

  @override
  String get close => '閉じる';

  @override
  String get continueStep => '続行';

  @override
  String get back => '戻る';

  @override
  String get review => 'レビュー';

  @override
  String get configuration => '構成';

  @override
  String get summary => '概要';

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
  String get protocol => 'プロトコル';

  @override
  String get stationaryPoint => '定点観測';

  @override
  String get nocturnalFlightCall => '夜間飛行音 (NFC)';

  @override
  String get incidental => 'Incidental';

  @override
  String get localityName => '場所名 *';

  @override
  String get requiredField => '必須項目';

  @override
  String get numberOfObservers => '観察者数';

  @override
  String get additionalComments => '追加コメント';

  @override
  String get includeAudioFileNamesInComments => 'コメントにオーディオファイル名を含める';

  @override
  String get readyForExport => 'エクスポート準備完了';

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
  String get statistics => '統計';

  @override
  String get systemLogs => 'システムログ';

  @override
  String get systemTools => 'システムツール';

  @override
  String get systemControls => 'システムコントロール';

  @override
  String get restart => '再起動';

  @override
  String get restartRaspberryPi => 'Restart the Raspberry Pi';

  @override
  String get areYouSureYouWantToRestart =>
      'Are you sure you want to restart the system?';

  @override
  String get update => 'アップデート';

  @override
  String get updateBirdNetPi => 'Update BirdNET-Pi to the latest version';

  @override
  String get doYouWantToUpdateBirdNet => 'Do you want to update BirdNET-Pi?';

  @override
  String get shutdown => 'シャットダウン';

  @override
  String get shutdownRaspberryPi => 'Shutdown the Raspberry Pi';

  @override
  String get areYouSureYouWantToShutdown =>
      'Are you sure you want to shutdown the system?';

  @override
  String get clearAllData => '全データ消去';

  @override
  String get removeAllRecordingsAndDetections =>
      'Remove all recordings and detections';

  @override
  String get warningAllDataWillBeDeleted =>
      'WARNING: All data will be permanently deleted. Continue?';

  @override
  String get services => 'サービス';

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
  String get spectrogram => 'スペクトログラム';

  @override
  String get quickActions => 'クイックアクション';

  @override
  String get stopServices => 'Stop Services';

  @override
  String get restartServices => 'Restart Services';

  @override
  String get confirm => '確認';

  @override
  String get execution => 'Execution:';

  @override
  String get commandExecuted => '✅ コマンド実行完了';

  @override
  String errorMsg(String error) {
    return '❌ エラー: $error';
  }

  @override
  String get species => '種';

  @override
  String get noSpeciesDetected => '検出された種はありません';

  @override
  String get max => 'Max:';

  @override
  String get detections => '検出';

  @override
  String get maxConfidence => '最高信頼度';

  @override
  String get searchSpecies => '種を検索...';

  @override
  String get errorMsgSimple => 'Error';

  @override
  String get settings => '設定';

  @override
  String get basicSettings => '基本設定';

  @override
  String get basicSettingsSubtitle =>
      'Configure time, location, language, and notifications.';

  @override
  String get advancedSettings => '詳細設定';

  @override
  String get advancedSettingsSubtitle =>
      'Configure audio, privacy, disk management, and more.';

  @override
  String get connection => '接続';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi サーバーアドレス';

  @override
  String get enterIpOrHostname =>
      'Enter the IP address or hostname of your Raspberry Pi';

  @override
  String get testInProgress => 'Test in progress...';

  @override
  String get saveAndTestConnection => 'Save and Test Connection';

  @override
  String get deviceInformation => 'デバイス情報';

  @override
  String get loading => '読み込み中...';

  @override
  String get notConnected => '未接続';

  @override
  String get configureServerAddress => 'Configure the server address';

  @override
  String get latitude => '緯度';

  @override
  String get longitude => '経度';

  @override
  String get locality => '場所';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get countryCode => '国コード';

  @override
  String get information => '情報';

  @override
  String get appVersion => 'バージョン 1.0.0';

  @override
  String get appDescription =>
      'Companion app for BirdNET-Pi. Monitor bird detections from your Raspberry Pi.';

  @override
  String connectedTo(String url) {
    return '✅ $url に接続済み';
  }

  @override
  String cannotConnectTo(String url) {
    return '❌ $url に接続できません';
  }

  @override
  String errorLoadingSettings(String error) {
    return '設定の読み込みエラー: $error';
  }

  @override
  String get basicSettingsSavedSuccessfully => '基本設定を保存しました';

  @override
  String get errorWhileSaving => 'Error while saving';

  @override
  String exceptionDuringSave(String error) {
    return 'Exception during save: $error';
  }

  @override
  String get model => 'モデル';

  @override
  String get selectAModel => 'モデルを選択:';

  @override
  String get speciesRangeModel => 'Species range model V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      'Species Occurrence Frequency Threshold [0.0005, 0.99]:';

  @override
  String get location => '位置';

  @override
  String get siteName => 'サイト名:';

  @override
  String get latitudeInput => '緯度:';

  @override
  String get longitudeInput => '経度:';

  @override
  String get birdWeatherToken => 'BirdWeatherトークン:';

  @override
  String get notificationsApprise => '通知 (Apprise)';

  @override
  String get appriseConfig => 'Apprise Notifications Configuration:';

  @override
  String get notificationTitle => '通知タイトル:';

  @override
  String get notificationBody => '通知本文:';

  @override
  String get notifyNewInfrequent =>
      'Notify each new infrequent species detection';

  @override
  String get notifyFirstDetectionOfDay =>
      'Notify each species first detection of the day';

  @override
  String get notifyEachNewDetection => '新しい検出ごとに通知';

  @override
  String get sendWeeklyReport => '週報を送信';

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
  String get localization => 'ローカライズ';

  @override
  String get databaseLanguage => 'データベース言語:';

  @override
  String get otherInfo => 'その他の情報';

  @override
  String get infoSite => 'Info Site:';

  @override
  String get themeWeb => 'グラフィックテーマ (Web)';

  @override
  String get colorScheme => 'カラースキーム:';

  @override
  String get none => 'なし';

  @override
  String get advancedSettingsSavedSuccessfully => '詳細設定を保存しました';

  @override
  String get privacyRecordings => 'Recordings Privacy';

  @override
  String get privacyThreshold => 'Privacy Threshold [0, 99]:';

  @override
  String get diskSpaceManagement => 'ディスク容量管理';

  @override
  String get whenDiskIsFull => 'ディスクが満杯の場合:';

  @override
  String get purgeCapacity => 'Purge capacity [% threshold]:';

  @override
  String get maxFilesToKeepPerSpecies =>
      'Max files to keep per species (0 = disable):';

  @override
  String get audioSettings => 'オーディオ設定';

  @override
  String get alsaInputCaptureDevice => 'ALSA input capture device (Soundcard):';

  @override
  String get numberOfAudioChannels =>
      'Number of audio channels to extract from:';

  @override
  String get overlap => 'オーバーラップ (秒) [0, 2.9]:';

  @override
  String get audioFormat => 'オーディオ形式:';

  @override
  String get recordingLength => '録音時間 (秒):';

  @override
  String get extractionLength => '抽出時間 (秒):';

  @override
  String get rtspAudioSharing => 'RTSP Audio Sharing';

  @override
  String get shareLiveAudioStream => 'Share live audio stream?';

  @override
  String get playAudioStreamThroughWebUi => 'Play audio stream through Web UI?';

  @override
  String get caddyPassword => 'Caddyパスワード';

  @override
  String get appPassword => 'アプリパスワード:';

  @override
  String get customLogoImage => 'カスタムロゴ';

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
  String get automaticUpdate => '自動アップデート';

  @override
  String get saveRawSpectrograms => '生のスペクトログラムを保存';

  @override
  String get loggingLevels => 'ログレベル';

  @override
  String get birdnetRecordingService => 'BirdNET Recording Service:';

  @override
  String get spectrogramViewerService => 'Spectrogram Viewer Service:';

  @override
  String get liveAudioStreamService => 'Live Audio Stream Service:';

  @override
  String get speciesListsManagement => '種リスト管理';

  @override
  String get inclusion => '包含';

  @override
  String get exclusion => '除外';

  @override
  String get whitelist => 'ホワイトリスト';

  @override
  String get speciesAlreadyInList => 'この種は既にリストにあります';

  @override
  String get listSavedSuccessfully => 'リストを保存しました';

  @override
  String get errorSavingList => 'Error while saving the list';

  @override
  String errorLoadingList(String error) {
    return 'Error loading the list:\\n$error';
  }

  @override
  String get retry => '再試行';

  @override
  String get searchSpeciesHint =>
      'Search species (e.g. Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => '種を読み込み中...';

  @override
  String get errorLoadingSpecies => 'Error loading species';

  @override
  String get noSpeciesInThisList => 'このリストに種はありません。';

  @override
  String get removeFromList => 'リストから削除';

  @override
  String get saving => '保存中...';

  @override
  String get save => '保存';

  @override
  String get loginRequired => 'このアクションにはログインが必要です';

  @override
  String get loginTitle => '認証';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access protected features.';

  @override
  String get username => 'ユーザー名';

  @override
  String get password => 'パスワード';

  @override
  String get loginEmptyError => 'Please enter username and password';

  @override
  String get loginInvalidError => 'Invalid credentials';

  @override
  String get authenticated => '認証済み';

  @override
  String get signIn => 'サインイン';

  @override
  String get loggedInMessage => 'You are currently authenticated.';

  @override
  String get logout => 'ログアウト';

  @override
  String get login => 'ログイン';

  @override
  String get audioStream => 'オーディオストリーム';

  @override
  String get pressPlayToListen => '再生ボタンを押して聴く';

  @override
  String get loginToStart => 'Log in with 🔒 to start';

  @override
  String get streamRequiresAuth =>
      'The stream requires authentication. Tap the 🔒 icon in the top right to log in.';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi Live Audio';

  @override
  String get unmute => 'ミュート解除';

  @override
  String get mute => 'ミュート';

  @override
  String get resume => '再開';

  @override
  String get pause => '一時停止';

  @override
  String get autoRefresh => '自動更新';

  @override
  String get pressPlaySpectrogram => 'Press ▶ to view the spectrogram';

  @override
  String get pressPlayRealtimeSpectrogram =>
      'Press ▶ to start the real-time spectrogram';

  @override
  String get loginThenPlay => 'Log in with 🔒 then press ▶';

  @override
  String get currentAnalyzing => '現在分析中';

  @override
  String get accessRestricted => 'アクセス制限';

  @override
  String get loginToAccessSection => 'このセクションにアクセスするにはログインしてください。';

  @override
  String get iframeNotSupported =>
      'Iframes are strictly supported on the web version.';

  @override
  String get error => 'エラー';

  @override
  String get searchSpeciesStr => 'Search species...';

  @override
  String get otherUtilities => 'その他のユーティリティ';

  @override
  String liveSeconds(int seconds) {
    return 'ライブ · $seconds秒';
  }

  @override
  String get spectrogramNotAvailable => 'Spectrogram not available';

  @override
  String get ebirdCountIdentifier => 'No';

  @override
  String get ebirdCountDefault => 'X';

  @override
  String get ebirdProtocolStationary => 'Stationary';

  @override
  String get ebirdProtocolIncidental => 'Incidental';

  @override
  String get ebirdProtocolNFC => 'P54';

  @override
  String get tooltipRefresh => '更新';

  @override
  String get tooltipStop => '停止';

  @override
  String get tooltipStart => '開始';

  @override
  String get tooltipRestart => '再起動';

  @override
  String get systemInfo => 'システム情報';

  @override
  String get fileManager => 'ファイルマネージャー';

  @override
  String get databaseMaintenance => 'データベースメンテナンス';

  @override
  String get webTerminal => 'ウェブターミナル';

  @override
  String get tooltipOpenMenu => 'メニューを開く';

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
  String get tooltipSearch => '検索';

  @override
  String get tooltipPlay => 'オーディオを再生';

  @override
  String get tooltipPickDate => '日付を選択';

  @override
  String get passwordOptionalHint => 'Leave empty if not set';

  @override
  String get systemStatus => 'システム状態';

  @override
  String get sysInfoUptime => '稼働時間';

  @override
  String get sysInfoDisk => 'ディスク';

  @override
  String get sysInfoMemory => 'メモリ';

  @override
  String get sysInfoCpuTemp => 'CPU温度';

  @override
  String get sysInfoBranch => 'ブランチ';

  @override
  String sysInfoCommitsBehind(int count) {
    return '$count commits behind';
  }

  @override
  String get sysInfoLoadingError => 'Failed to load system info.';

  @override
  String get enable => '有効化';

  @override
  String get disable => '無効化';

  @override
  String weekStr(int weekNumber, int year) {
    return '$year年 第$weekNumber週';
  }
}
