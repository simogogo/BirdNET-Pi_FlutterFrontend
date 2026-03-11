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
  String get noDetectionsForSpecies => 'この種は検出されませんでした';

  @override
  String get removeFilter => 'フィルターを削除する';

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
  String get monthly => '月ごと';

  @override
  String get detectionsBySpecies => '種ごとの検出';

  @override
  String get hourlyDistribution => '時間ごとの配信';

  @override
  String get noChartAvailable => 'チャートは利用不可';

  @override
  String get weeklyReport => '週報';

  @override
  String get monthlyReport => '月間レポート';

  @override
  String get newSpecies => '新種';

  @override
  String get newFemale => '新しい！';

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
    return '「$name」を $date $time から削除しますか?';
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
  String get noRecordingsAvailable => '利用可能な録音はありません。';

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
  String get autoDetectionsViaBirdNet => 'BirdNET-Piによる自動検出...';

  @override
  String get downloadStartedSuccessfully => 'ダウンロードが正常に開始されました!';

  @override
  String get cannotDownloadCsv => 'CSVをダウンロードできません。';

  @override
  String get zipDownloadInProgress => 'ZIPダウンロード中...';

  @override
  String get cannotOpenZipUrl => 'ZIPダウンロード用のURLを開けません';

  @override
  String get serverDidNotReturnDownloadUrl => 'サーバーはダウンロード URL を返しませんでした。';

  @override
  String get unknownError => '不明なエラー';

  @override
  String get serverError => 'サーバーエラー';

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
  String get autoRemoveLessThan80 => '自動的に削除 < 80%';

  @override
  String speciesRead(int totalSpecies, int totalDetects) {
    return '読み取り種: $totalSpecies |発生数: $totalDetects';
  }

  @override
  String detectionsCountStr(int count) {
    return '$count 件の検出';
  }

  @override
  String get protocol => 'プロトコル';

  @override
  String get stationaryPoint => '定点観測';

  @override
  String get nocturnalFlightCall => '夜間飛行音 (NFC)';

  @override
  String get incidental => '偶発';

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
  String get totalUniqueSpecies => '総種（ユニーク）';

  @override
  String get hourlyModeledChecklists => '時間ごとのモデル化されたチェックリスト';

  @override
  String get averageConfidence => '平均信頼度';

  @override
  String get wizardInfoText =>
      '「CSV を生成」を押すと、時間ごとにステーションを分割してファイルがコンパイルされ、eBird にアップロードできるようになります。';

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
  String get restartRaspberryPi => 'ラズベリーパイを再起動します';

  @override
  String get areYouSureYouWantToRestart => 'システムを再起動してもよろしいですか?';

  @override
  String get update => 'アップデート';

  @override
  String get updateBirdNetPi => 'BirdNET-Piを最新バージョンにアップデートする';

  @override
  String get doYouWantToUpdateBirdNet => 'BirdNET-Piをアップデートしますか?';

  @override
  String get shutdown => 'シャットダウン';

  @override
  String get shutdownRaspberryPi => 'Raspberry Piをシャットダウンする';

  @override
  String get areYouSureYouWantToShutdown => 'システムをシャットダウンしてもよろしいですか?';

  @override
  String get clearAllData => '全データ消去';

  @override
  String get removeAllRecordingsAndDetections => 'すべての記録と検出を削除します';

  @override
  String get warningAllDataWillBeDeleted => '警告: すべてのデータは完全に削除されます。続く？';

  @override
  String get services => 'サービス';

  @override
  String get liveAudioStream => 'ライブオーディオストリーム';

  @override
  String get birdNetAnalysis => 'BirdNET 分析';

  @override
  String get birdNetRecording => 'BirdNET の記録';

  @override
  String get birdNetLog => 'バードネットログ';

  @override
  String get chartViewer => 'チャートビューア';

  @override
  String get spectrogram => 'スペクトログラム';

  @override
  String get quickActions => 'クイックアクション';

  @override
  String get stopServices => 'サービスの停止';

  @override
  String get restartServices => 'サービスを再起動する';

  @override
  String get confirm => '確認';

  @override
  String get execution => '実行：';

  @override
  String get commandExecuted => '✅ コマンド実行完了';

  @override
  String errorMsg(String error) {
    return '❌ エラー: $error';
  }

  @override
  String errorMsgSimple(String error) {
    return 'エラー';
  }

  @override
  String get settings => '設定';

  @override
  String get basicSettings => '基本設定';

  @override
  String get basicSettingsSubtitle => '時間、場所、言語、通知を設定します。';

  @override
  String get advancedSettings => '詳細設定';

  @override
  String get advancedSettingsSubtitle => 'オーディオ、プライバシー、ディスク管理などを構成します。';

  @override
  String get connection => '接続';

  @override
  String get birdNetPiServerAddress => 'BirdNET-Pi サーバーアドレス';

  @override
  String get enterIpOrHostname => 'Raspberry Pi の IP アドレスまたはホスト名を入力します';

  @override
  String get testInProgress => 'テスト中...';

  @override
  String get saveAndTestConnection => '接続を保存してテストする';

  @override
  String get deviceInformation => 'デバイス情報';

  @override
  String get loading => '読み込み中...';

  @override
  String get notConnected => '未接続';

  @override
  String get configureServerAddress => 'サーバーアドレスを設定する';

  @override
  String get latitude => '緯度';

  @override
  String get longitude => '経度';

  @override
  String get locality => '場所';

  @override
  String get stateProvince => '州/県';

  @override
  String get countryCode => '国コード';

  @override
  String get information => '情報';

  @override
  String get appVersion => 'バージョン 1.0.0';

  @override
  String get appDescription =>
      'BirdNET-Piのコンパニオンアプリ。 Raspberry Pi から鳥の検出を監視します。';

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
  String get errorWhileSaving => '保存中にエラーが発生しました';

  @override
  String exceptionDuringSave(String error) {
    return '保存中の例外: $error';
  }

  @override
  String get model => 'モデル';

  @override
  String get selectAModel => 'モデルを選択:';

  @override
  String get speciesRangeModel => '種範囲モデル V2.4 - V2';

  @override
  String get speciesOccurrenceFrequencyThreshold =>
      '種の出現頻度のしきい値 [0.0005、0.99]:';

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
  String get appriseConfig => 'Apprise 通知の構成:';

  @override
  String get notificationTitle => '通知タイトル:';

  @override
  String get notificationBody => '通知本文:';

  @override
  String get notifyNewInfrequent => '頻度の低い種が新たに検出されるたびに通知します';

  @override
  String get notifyFirstDetectionOfDay => '各種のその日の最初の検出を通知します';

  @override
  String get notifyEachNewDetection => '新しい検出ごとに通知';

  @override
  String get sendWeeklyReport => '週報を送信';

  @override
  String get minTimeBetweenNotifications => '同じ種の通知間の最小時間 (秒):';

  @override
  String get excludeTheseSpecies => '次の種を除外します (カンマ区切り):';

  @override
  String get onlyNotifyForTheseSpecies => '以下の種についてのみ通知します (カンマ区切り):';

  @override
  String get imageSource => '画像ソース';

  @override
  String get imageProvider => '画像プロバイダー:';

  @override
  String get flickrApiKey => 'Flickr API キー:';

  @override
  String get flickrFilterEmail => 'この Flickr ユーザーの写真のみを検索します:';

  @override
  String get localization => 'ローカライズ';

  @override
  String get databaseLanguage => 'データベース言語:';

  @override
  String get otherInfo => 'その他の情報';

  @override
  String get infoSite => '情報サイト:';

  @override
  String get themeWeb => 'グラフィックテーマ (Web)';

  @override
  String get colorScheme => 'カラースキーム:';

  @override
  String get none => 'なし';

  @override
  String get advancedSettingsSavedSuccessfully => '詳細設定を保存しました';

  @override
  String get privacyRecordings => '録音のプライバシー';

  @override
  String get privacyThreshold => 'プライバシーしきい値 [0, 99]:';

  @override
  String get diskSpaceManagement => 'ディスク容量管理';

  @override
  String get whenDiskIsFull => 'ディスクが満杯の場合:';

  @override
  String get purgeCapacity => 'パージ容量 [% しきい値]:';

  @override
  String get maxFilesToKeepPerSpecies => '種ごとに保持する最大ファイル数 (0 = 無効):';

  @override
  String get audioSettings => 'オーディオ設定';

  @override
  String get alsaInputCaptureDevice => 'ALSA インプット キャプチャ デバイス (サウンドカード):';

  @override
  String get numberOfAudioChannels => '抽出するオーディオ チャンネルの数:';

  @override
  String get overlap => 'オーバーラップ (秒) [0, 2.9]:';

  @override
  String get audioFormat => 'オーディオ形式:';

  @override
  String get recordingLength => '録音時間 (秒):';

  @override
  String get extractionLength => '抽出時間 (秒):';

  @override
  String get rtspAudioSharing => 'RTSPオーディオ共有';

  @override
  String get shareLiveAudioStream => 'ライブオーディオストリームを共有しますか?';

  @override
  String get playAudioStreamThroughWebUi => 'Web UI を通じてオーディオ ストリームを再生しますか?';

  @override
  String get caddyPassword => 'Caddyパスワード';

  @override
  String get appPassword => 'アプリパスワード:';

  @override
  String get customLogoImage => 'カスタムロゴ';

  @override
  String get customImageUrl => 'カスタム画像の URL:';

  @override
  String get customImageTitle => 'カスタム画像のタイトル:';

  @override
  String get birdNetLiteModelSettings => 'BirdNET-Lite モデルの設定';

  @override
  String get confidenceThreshold => '信頼度のしきい値 [0, 0.99]:';

  @override
  String get sensitivity => '感度 [0.5、1.5]:';

  @override
  String get otherSettings => 'その他の設定';

  @override
  String get silenceUpdateIndicator => '「アップデートが利用可能」インジケーターを消す';

  @override
  String get automaticUpdate => '自動アップデート';

  @override
  String get saveRawSpectrograms => '生のスペクトログラムを保存';

  @override
  String get loggingLevels => 'ログレベル';

  @override
  String get birdnetRecordingService => 'BirdNET録画サービス：';

  @override
  String get spectrogramViewerService => 'スペクトログラム ビューア サービス:';

  @override
  String get liveAudioStreamService => 'ライブオーディオストリームサービス:';

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
  String get errorSavingList => 'リストの保存中にエラーが発生しました';

  @override
  String errorLoadingList(String error) {
    return 'リストのロード中にエラーが発生しました:\\n$error';
  }

  @override
  String get retry => '再試行';

  @override
  String get searchSpeciesHint => '種の検索 (例: Turdus merula_Common Blackbird)';

  @override
  String get loadingSpecies => '種を読み込み中...';

  @override
  String get errorLoadingSpecies => '種の読み込みエラー';

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
  String get loginSubtitle => '認証情報を入力して、保護された機能にアクセスします。';

  @override
  String get username => 'ユーザー名';

  @override
  String get password => 'パスワード';

  @override
  String get loginEmptyError => 'ユーザー名とパスワードを入力してください';

  @override
  String get loginInvalidError => '無効な認証情報';

  @override
  String get authenticated => '認証済み';

  @override
  String get signIn => 'サインイン';

  @override
  String get loggedInMessage => '現在認証されています。';

  @override
  String get logout => 'ログアウト';

  @override
  String get login => 'ログイン';

  @override
  String get audioStream => 'オーディオストリーム';

  @override
  String get pressPlayToListen => '再生ボタンを押して聴く';

  @override
  String get loginToStart => '🔒でログインして始めてください';

  @override
  String get streamRequiresAuth => 'ストリームには認証が必要です。右上の🔒アイコンをタップしてログインします。';

  @override
  String get liveAudioFootnote => 'BirdNET-Pi ライブオーディオ';

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
  String get pressPlaySpectrogram => '▶ を押してスペクトログラムを表示します';

  @override
  String get pressPlayRealtimeSpectrogram => '▶を押してリアルタイムスペクトログラムを開始します';

  @override
  String get loginThenPlay => '🔒でログインして▶を押してください';

  @override
  String get currentAnalyzing => '現在分析中';

  @override
  String get accessRestricted => 'アクセス制限';

  @override
  String get loginToAccessSection => 'このセクションにアクセスするにはログインしてください。';

  @override
  String get iframeNotSupported => 'iframe は Web バージョンで厳密にサポートされています。';

  @override
  String get error => 'エラー';

  @override
  String get otherUtilities => 'その他のユーティリティ';

  @override
  String liveSeconds(int seconds) {
    return 'ライブ · $seconds秒';
  }

  @override
  String get spectrogramNotAvailable => 'スペクトログラムは利用できません';

  @override
  String get ebirdCountIdentifier => 'No';

  @override
  String get ebirdCountDefault => '×';

  @override
  String get ebirdProtocolStationary => '固定式';

  @override
  String get ebirdProtocolIncidental => '偶発';

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
  String get tooltipRefreshData => 'データを更新する';

  @override
  String get tooltipPreviousDay => '前日';

  @override
  String get tooltipNextDay => '翌日';

  @override
  String get tooltipPreviousWeek => '前の週';

  @override
  String get tooltipNextWeek => '来週';

  @override
  String get tooltipDeleteRecording => '録音の削除';

  @override
  String get tooltipClearSearch => '検索をクリア';

  @override
  String get tooltipCloseSearch => '検索を閉じる';

  @override
  String get tooltipSearch => '検索';

  @override
  String get tooltipPlay => 'オーディオを再生';

  @override
  String get tooltipPickDate => '日付を選択';

  @override
  String get passwordOptionalHint => '設定しない場合は空のままにしてください';

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
    return '$count 件のコミットが遅れています';
  }

  @override
  String get sysInfoLoadingError => 'システム情報の読み込みに失敗しました。';

  @override
  String get enable => '有効化';

  @override
  String get disable => '無効化';

  @override
  String weekStr(int weekNumber, int year) {
    return '$year年 第$weekNumber週';
  }

  @override
  String get groupBySpecies => '種ごとにグループ化';

  @override
  String get groupByTime => '時間ごとにグループ化する';

  @override
  String get readOnWikipedia => 'ウィキペディアで読む';

  @override
  String get loadingWikipedia => 'ウィキペディアから情報を読み込んでいます...';

  @override
  String get noWikipediaInfo => 'この種に関するウィキペディアには情報がありません。';

  @override
  String get searchSpecies => '種を検索...';

  @override
  String get noResultsFound => '結果が見つかりませんでした';

  @override
  String get noSpeciesDetected => '検出された種はありません';

  @override
  String get species => '種';

  @override
  String get detections => '検出';

  @override
  String get maxConfidence => '最高信頼度';

  @override
  String get topSpecies => 'トップ種';

  @override
  String get fromDate => '開始日';

  @override
  String get toDate => '終了日';

  @override
  String get fromTime => '開始時間';

  @override
  String get toTime => '終了時間';

  @override
  String get byPeriod => '期間別';

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
  String get firstSeen => '初確認';

  @override
  String get lastSeen => '最終確認';

  @override
  String get thirtyDaysTrend => '30日間の傾向';

  @override
  String get avgConfidence => '平均信頼度';

  @override
  String get mySpecies => '私の種リスト';

  @override
  String get bestDetection => 'ベスト検出';

  @override
  String get externalInfoLink => '外部情報';

  @override
  String get includedListInfo =>
      '警告！このリストに「いずれかの」種が含まれている場合、システムはそれらの種「のみ」を認識します。特定の種の検出に「のみ」関心がある場合を除き、このリストは「空」にしておいてください。';

  @override
  String get excludedListInfo => '目的の種が強調表示されたら、それをクリックし、「追加」をクリックして除外対象とします。';

  @override
  String get whitelistInfo =>
      '目的の種が強調表示されたら、それをクリックし、「追加」をクリックしてホワイトリストに登録対象とします。設定された出現頻度のしきい値（Species Occurrence Frequency Threshold）を下回っていても検出されます。この方法は推奨されていません。両方の出現頻度モデル（v1およびv2.4）を最初に試すことをお勧めします。';
}
