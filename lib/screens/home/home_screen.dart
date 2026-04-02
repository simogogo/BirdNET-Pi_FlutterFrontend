import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:just_audio/just_audio.dart';
import '../../models/detection.dart';

import '../../l10n/app_localizations.dart';
import '../../config/api_config.dart';
import '../../config/theme.dart';
import '../../providers/detections_provider.dart';
import '../../services/api_service.dart';
import '../../widgets/section_header.dart';
import '../../widgets/detection_card.dart';
import '../../widgets/confidence_badge.dart';
import '../../widgets/detection_detail_sheet.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';
import '../charts/species_hourly_heatmap.dart';
import '../../widgets/ldfcs_chart_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String? _cacheBuster;

  @override
  void initState() {
    super.initState();
    _cacheBuster = DateTime.now().millisecondsSinceEpoch.toString();
    ref.invalidate(todayDetectionsProvider);
    ref.invalidate(overviewProvider);
    ref.invalidate(todayChartDataProvider);
  }

  @override
  Widget build(BuildContext context) {
    final overviewAsync = ref.watch(overviewProvider);
    final api = ref.watch(apiServiceProvider);

    return Scaffold(
      body: RefreshIndicator(
        color: AppColors.primaryLight,
        onRefresh: () async {
          setState(() {
            _cacheBuster = DateTime.now().millisecondsSinceEpoch.toString();
          });
          ref.invalidate(todayDetectionsProvider);
          ref.invalidate(recentDetectionsProvider);
          ref.invalidate(overviewProvider);
          ref.invalidate(todayChartDataProvider);
        },
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              expandedHeight: 60,
              floating: true,
              pinned: true,
              backgroundColor: AppColors.surface,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                tooltip: AppLocalizations.of(context)!.tooltipOpenMenu,
                onPressed: () {
                  AppShell.openDrawer();
                },
              ),
              title: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryLight],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/images/logo.png', height: 24),
                  ),
                  const SizedBox(width: 10),
                  const Text('BirdNET-Pi'),
                ],
              ),
              actions: [
                const AuthLockIcon(),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: AppLocalizations.of(context)!.tooltipRefreshData,
                  onPressed: () {
                    setState(() {
                      _cacheBuster = DateTime.now().millisecondsSinceEpoch.toString();
                    });
                    ref.invalidate(todayDetectionsProvider);
                    ref.invalidate(recentDetectionsProvider);
                    ref.invalidate(overviewProvider);
                    ref.invalidate(todayChartDataProvider);
                  },
                ),
              ],
            ),

            // Comprehensive Stats Box
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: _buildStatsBox(context, overviewAsync),
              ),
            ),

            // Recent Detections List Header
            SliverToBoxAdapter(
              child: SectionHeader(
                title: AppLocalizations.of(context)!.recentDetections,
                icon: Icons.history,
              ),
            ),

            // Recent Detections List
            ref
                .watch(recentDetectionsProvider)
                .when(
                  data: (detections) {
                    if (detections.isEmpty) {
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    }

                    // Logica per mostrare solo 5 specie distinte
                    final seenSpecies = <String>{};
                    final distinctDetections = <Detection>[];
                    for (final d in detections) {
                      if (!seenSpecies.contains(d.scientificName)) {
                        seenSpecies.add(d.scientificName);
                        distinctDetections.add(d);
                        if (distinctDetections.length >= 5) break;
                      }
                    }

                    return SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return DetectionCard(
                          detection: distinctDetections[index],
                          apiService: api,
                          onTap: () => _showDetectionDetail(
                            context,
                            distinctDetections[index],
                            api,
                            ref: ref,
                          ),
                        );
                      }, childCount: distinctDetections.length),
                    );
                  },
                  loading: () => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, _) => _buildShimmerCard(),
                      childCount: 5,
                    ),
                  ),
                  error: (_, _) =>
                      const SliverToBoxAdapter(child: SizedBox.shrink()),
                ),

            // Today's Heatmap Chart
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: _buildHeatmapChartBox(context, api),
              ),
            ),

            // LDFCS Section (Standard & Indices)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: _buildLdfcsSection(context, api),
              ),
            ),
            /*
            // Most Recent Detection
            SliverToBoxAdapter(
              child: detectionsAsync.when(
                data: (detections) {
                  if (detections.isEmpty) {
                    return _buildEmptyState(context);
                  }
                  final latest = detections.first;
                  return _buildLatestDetection(context, latest, api);
                },
                loading: () => _buildLoadingCard(),
                error: (e, _) => _buildErrorCard(context, e.toString()),
              ),
            ),
            */

            // Current Analyzing Spectrogram (auto-refresh)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: _CurrentAnalyzingBox(apiService: api),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 80)),
          ],
        ),
      ),
    );
  }

  Widget _buildLatestDetection(
    BuildContext context,
    dynamic detection,
    ApiService api,
  ) {
    final spectrogramUrl = api.getSpectrogramImageUrl(detection.extractedPath);
    final audioUrl = api.getAudioUrl(detection.fileName);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary.withOpacity(0.3), AppColors.card],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryLight.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.fiber_new,
                        size: 14,
                        color: AppColors.primaryLight,
                      ),
                      SizedBox(width: 4),
                      Text(
                        AppLocalizations.of(context)!.latestDetection,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  '${detection.date} ${detection.time}',
                  style: TextStyle(fontSize: 11, color: AppColors.textHint),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detection.commonName,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        detection.scientificName,
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                ConfidenceBadge(confidence: detection.confidence),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Spectrogram + Player
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 944),
                      child: AspectRatio(
                        aspectRatio: 944.0 / 591.0,
                        child: CachedNetworkImage(
                          imageUrl: spectrogramUrl,
                          width: double.infinity,
                          fit: BoxFit.contain,
                          placeholder: (_, _) =>
                              Container(color: AppColors.card),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _SmallAudioPlayer(audioUrl: audioUrl),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDetectionDetail(
    BuildContext context,
    detection,
    ApiService api, {
    WidgetRef? ref,
  }) {
    final audioUrl = api.getAudioUrl(detection.extractedPath);
    final spectrogramUrl = api.getSpectrogramImageUrl(detection.extractedPath);

    showModalBottomSheet(
      context: context,
      useRootNavigator: false,
      backgroundColor: AppColors.surface,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => DetectionDetailSheet(
        detection: detection,
        audioUrl: audioUrl,
        spectrogramUrl: spectrogramUrl,
        apiService: api,
        onDeleted: () {
          if (ref != null) invalidateRecordings(ref);
        },
        onChanged: () {
          if (ref != null) invalidateRecordings(ref);
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(Icons.search_off, size: 48, color: AppColors.textHint),
          SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.noDetectionsToday,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 4),
          Text(
            AppLocalizations.of(context)!.systemListening,
            style: TextStyle(fontSize: 13, color: AppColors.textHint),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryLight,
          strokeWidth: 2,
        ),
      ),
    );
  }

  Widget _buildErrorCard(BuildContext context, String error) {
    // Se c'è un'eccezione nota e parlante, possiamo estrarre il messaggio
    final errorMessage = error.replaceAll('Exception: ', '');
    return Container(
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.error.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: AppColors.error, size: 36),
          SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.errorOccurred,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.error,
            ),
          ),
          SizedBox(height: 4),
          Text(
            errorMessage,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.error.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerCard() {
    return Card(
      child: Container(
        height: 80,
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.cardElevated,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 14,
                    width: 120,
                    color: AppColors.cardElevated,
                  ),
                  SizedBox(height: 6),
                  Container(
                    height: 10,
                    width: 80,
                    color: AppColors.cardElevated,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsBox(
    BuildContext context,
    AsyncValue<Map<String, dynamic>> overviewAsync,
  ) {
    return overviewAsync.when(
      data: (data) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryDark.withOpacity(0.9),
                AppColors.primary,
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.analytics,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    AppLocalizations.of(context)!.overview,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  _buildStatItem(
                    AppLocalizations.of(context)!.detectionsAllTime,
                    data['total_detections'].toString(),
                    Icons.all_inclusive,
                  ),
                  _buildStatItem(
                    AppLocalizations.of(context)!.detectionsToday,
                    data['today_detections'].toString(),
                    Icons.today,
                  ),
                  _buildStatItem(
                    AppLocalizations.of(context)!.detectionsLastHour,
                    data['hour_detections'].toString(),
                    Icons.access_time,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(color: Colors.white24, height: 1),
              const SizedBox(height: 16),
              Row(
                children: [
                  _buildStatItem(
                    AppLocalizations.of(context)!.speciesToday,
                    data['today_species'].toString(),
                    Icons.pets,
                  ),
                  _buildStatItem(
                    AppLocalizations.of(context)!.speciesAllTime,
                    data['total_species'].toString(),
                    Icons.auto_awesome,
                  ),
                ],
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(
        child: Text('${AppLocalizations.of(context)!.statsLoadingError}: $e'),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: AppColors.accent, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.white.withOpacity(0.95),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.white.withOpacity(0.8),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  // ─── Heatmap Chart Box ───────────────────────────────────
  Widget _buildHeatmapChartBox(BuildContext context, ApiService api) {
    return Consumer(
      builder: (context, ref, child) {
        final chartDataAsync = ref.watch(todayChartDataProvider);

        return chartDataAsync.when(
          data: (data) {
            final hourlyCounts = List<dynamic>.from(
              data['species_hourly_counts'] ?? [],
            );

            if (hourlyCounts.isEmpty) {
              return const SizedBox.shrink();
            }

            return SpeciesHourlyHeatmapWidget(
              hourlyCounts: hourlyCounts,
              hourlyWeather: data['hourly_weather'] as List?,
            );
          },
          loading: () => Container(
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryLight),
            ),
          ),
          error: (e, _) => const SizedBox.shrink(),
        );
      },
    );
  }

  // ─── LDFCS Section ─────────────────────────────────────
  Widget _buildLdfcsSection(BuildContext context, ApiService api) {
    return Consumer(
      builder: (context, ref, child) {
        final chartDataAsync = ref.watch(todayChartDataProvider);

        return chartDataAsync.when(
          data: (data) {
            final hasStd = data['ldfcs_standard_available'] == true;
            final hasInd = data['ldfcs_indices_available'] == true;
            final stdFile = data['ldfcs_standard_file'] as String?;
            final indFile = data['ldfcs_indices_file'] as String?;

            if (!hasStd && !hasInd) return const SizedBox.shrink();

            return Column(
              children: [
                if (hasStd && stdFile != null)
                  LdfcsChartWidget(
                    imageUrl: ApiConfig.chartImage(stdFile),
                    title: AppLocalizations.of(context)!.ldfcsStandardTitle,
                    description: AppLocalizations.of(context)!.ldfcsDescription,
                    hourlyWeather: data['hourly_weather'] as List?,
                    cacheBuster: _cacheBuster,
                  ),
                if (hasInd && indFile != null)
                  LdfcsChartWidget(
                    imageUrl: ApiConfig.chartImage(indFile),
                    title: AppLocalizations.of(context)!.ldfcsIndicesTitle,
                    description: AppLocalizations.of(context)!.ldfcsDescription,
                    hourlyWeather: data['hourly_weather'] as List?,
                    cacheBuster: _cacheBuster,
                  ),
              ],
            );
          },
          loading: () => const SizedBox.shrink(),
          error: (e, _) => const SizedBox.shrink(),
        );
      },
    );
  }

  // ─── Current Analyzing Box (replaced by _CurrentAnalyzingBox widget) ────
}

// ═══════════════════════════════════════════════════════════
// Current Analyzing Box — Auto-refresh con Timer
// ═══════════════════════════════════════════════════════════

class _CurrentAnalyzingBox extends StatefulWidget {
  final ApiService apiService;
  const _CurrentAnalyzingBox({required this.apiService});

  @override
  State<_CurrentAnalyzingBox> createState() => _CurrentAnalyzingBoxState();
}

class _CurrentAnalyzingBoxState extends State<_CurrentAnalyzingBox> {
  late String _spectrogramUrl;
  Timer? _timer;
  int _refreshSeconds = 15; // default

  @override
  void initState() {
    super.initState();
    _spectrogramUrl = _buildUrl();
    _loadRecordingLength();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _buildUrl() {
    return '${ApiConfig.baseUrl}/spectrogram.png?t=${DateTime.now().millisecondsSinceEpoch}';
  }

  Future<void> _loadRecordingLength() async {
    try {
      final config = await widget.apiService.getRecordingLength();
      final recLen = config['RECORDING_LENGTH'];
      if (recLen != null) {
        _refreshSeconds = int.tryParse(recLen.toString()) ?? 15;
      }
    } catch (_) {
      // Usa default 15 secondi
    }
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: _refreshSeconds), (_) {
      if (mounted) {
        setState(() {
          _spectrogramUrl = _buildUrl();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const double aspectRatio = 944.0 / 591.0;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.accent.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.graphic_eq,
                    color: AppColors.accent,
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  AppLocalizations.of(context)!.currentAnalyzing,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  AppLocalizations.of(context)!.liveSeconds(_refreshSeconds),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.greenAccent,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 944),
                  child: AspectRatio(
                    aspectRatio: aspectRatio,
                    child: Image.network(
                      _spectrogramUrl,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: AppColors.cardElevated,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.accent,
                              strokeWidth: 2,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (_, _, _) => Container(
                        color: AppColors.cardElevated,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.graphic_eq,
                                color: AppColors.textHint,
                                size: 48,
                              ),
                              SizedBox(height: 8),
                              Text(
                                AppLocalizations.of(
                                  context,
                                )!.spectrogramNotAvailable,
                                style: TextStyle(
                                  color: AppColors.textHint,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallAudioPlayer extends StatefulWidget {
  final String audioUrl;
  const _SmallAudioPlayer({required this.audioUrl});

  @override
  State<_SmallAudioPlayer> createState() => _SmallAudioPlayerState();
}

class _SmallAudioPlayerState extends State<_SmallAudioPlayer> {
  late AudioPlayer _player;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _playPause() async {
    try {
      if (_player.playing) {
        await _player.pause();
      } else {
        if (_player.processingState == ProcessingState.idle ||
            _player.processingState == ProcessingState.completed) {
          setState(() => _isLoading = true);
          await _player.setUrl(widget.audioUrl);
          setState(() => _isLoading = false);
        }
        await _player.play();
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryLight.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          StreamBuilder<PlayerState>(
            stream: _player.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final playing = playerState?.playing ?? false;

              if (_isLoading) {
                return SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primaryLight,
                  ),
                );
              }

              return Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  icon: Icon(
                    playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    size: 20,
                    color: Colors.white, // Alta visibilità
                  ),
                  onPressed: _playPause,
                ),
              );
            },
          ),
          const SizedBox(width: 12),
          Expanded(
            child: StreamBuilder<Duration>(
              stream: _player.positionStream,
              builder: (context, snapshot) {
                final position = snapshot.data ?? Duration.zero;
                final duration = _player.duration ?? Duration.zero;
                final progress = duration.inMilliseconds > 0
                    ? position.inMilliseconds / duration.inMilliseconds
                    : 0.0;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearProgressIndicator(
                      value: progress.clamp(0.0, 1.0),
                      backgroundColor: AppColors.primaryLight.withOpacity(0.2),
                      valueColor: AlwaysStoppedAnimation(
                        AppColors.primaryLight,
                      ),
                      minHeight: 4,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(position),
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.textHint,
                          ),
                        ),
                        Text(
                          _formatDuration(duration),
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.textHint,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.stop_rounded, size: 20),
            color: AppColors.textSecondary,
            onPressed: () => _player.stop(),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
