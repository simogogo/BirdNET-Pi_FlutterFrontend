import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:just_audio/just_audio.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/theme.dart';
import '../../models/species_detail.dart';
import '../../providers/detections_provider.dart';
import '../../services/api_service.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';
import '../../widgets/confidence_badge.dart';

class SpeciesScreen extends ConsumerStatefulWidget {
  const SpeciesScreen({super.key});

  @override
  ConsumerState<SpeciesScreen> createState() => _SpeciesScreenState();
}

class _SpeciesScreenState extends ConsumerState<SpeciesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final speciesAsync = ref.watch(allSpeciesProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.mySpecies),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: const [AuthLockIcon()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: l10n.searchSpecies,
                prefixIcon: const Icon(Icons.search, color: AppColors.textHint),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: AppColors.textHint,
                        ),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                filled: true,
                fillColor: AppColors.cardElevated,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() => _searchQuery = value.toLowerCase());
              },
            ),
          ),
        ),
      ),
      body: speciesAsync.when(
        data: (speciesList) {
          final filteredList = speciesList.where((s) {
            final comName = (s['Com_Name'] ?? '').toString().toLowerCase();
            final sciName = (s['Sci_Name'] ?? '').toString().toLowerCase();
            return comName.contains(_searchQuery) ||
                sciName.contains(_searchQuery);
          }).toList();

          if (filteredList.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.search_off,
                    size: 56,
                    color: AppColors.textHint,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _searchQuery.isEmpty
                        ? l10n.noSpeciesDetected
                        : l10n.noResultsFound,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              mainAxisExtent: 360,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: filteredList.length,
            itemBuilder: (context, index) => SpeciesCard(
              key: ValueKey(filteredList[index]['Sci_Name']),
              species: filteredList[index],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primaryLight),
        ),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: AppColors.error, size: 48),
              const SizedBox(height: 8),
              Text(
                l10n.errorMsg(e.toString()),
                style: const TextStyle(color: AppColors.error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpeciesCard extends ConsumerStatefulWidget {
  final Map<String, dynamic> species;
  const SpeciesCard({super.key, required this.species});

  @override
  ConsumerState<SpeciesCard> createState() => _SpeciesCardState();
}

class _SpeciesCardState extends ConsumerState<SpeciesCard> {
  @override
  Widget build(BuildContext context) {
    final sciName = (widget.species['Sci_Name'] ?? 'Unknown').toString();
    final comName = (widget.species['Com_Name'] ?? sciName).toString();
    final occurrences =
        int.tryParse(widget.species['Count']?.toString() ?? '0') ?? 0;
    final maxConfidence =
        (widget.species['MaxConfidence'] as num?)?.toDouble() ?? 0.0;

    final imageAsync = ref.watch(speciesImageProvider(sciName));
    final l10n = AppLocalizations.of(context)!;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Header: Names
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  sciName,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                    color: AppColors.textHint,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // 2. Stats: Detections & Confidence
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Row(
              children: [
                // Emphasized detection count
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.sensors,
                      size: 14,
                      color: AppColors.primaryLight,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      l10n.occurrenceCount(occurrences),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ConfidenceBadge(confidence: maxConfidence),
              ],
            ),
          ),

          // 3. Image area - Squared and Centered
          AspectRatio(
            aspectRatio: 1.0,
            child: GestureDetector(
              onTap: () => _showSpeciesDetail(
                context,
                sciName,
                comName,
                occurrences,
                maxConfidence,
              ),
              child: imageAsync.when(
                data: (imageMap) {
                  final base64String = imageMap?['base64_data'] as String?;
                  final imageUrl = imageMap?['image_url'] as String?;

                  if (base64String != null && base64String.isNotEmpty) {
                    try {
                      final bytes = base64Decode(base64String.split(',').last);
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Image.memory(
                          bytes,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          width: double.infinity,
                          errorBuilder: (_, __, ___) => _defaultImage(),
                        ),
                      );
                    } catch (e) {
                      debugPrint('Error decoding base64 image: $e');
                    }
                  }

                  if (imageUrl != null && imageUrl.isNotEmpty) {
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        width: double.infinity,
                        placeholder: (_, _) => Container(
                          color: AppColors.cardElevated,
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (_, _, _) => _defaultImage(),
                      ),
                    );
                  }
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: _defaultImage(),
                  );
                },
                loading: () => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    color: AppColors.cardElevated,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),
                error: (context, error) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: _defaultImage(),
                ),
              ),
            ),
          ),
          // (Audio Player Control removed from here, moved to Detail Sheet)
        ],
      ),
    );
  }

  Widget _defaultImage() {
    return Container(
      color: AppColors.cardElevated,
      child: Image.asset(
        'assets/images/no-image.png',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  void _showSpeciesDetail(
    BuildContext context,
    String sciName,
    String comName,
    int count,
    double maxConf,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      useSafeArea: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: _SpeciesDetailSheet(
            sciName: sciName,
            comName: comName,
            count: count,
            maxConf: maxConf,
          ),
        ),
      ),
    );
  }
}

class _SpeciesDetailSheet extends ConsumerStatefulWidget {
  final String sciName;
  final String comName;
  final int count;
  final double maxConf;

  const _SpeciesDetailSheet({
    required this.sciName,
    required this.comName,
    required this.count,
    required this.maxConf,
  });

  @override
  ConsumerState<_SpeciesDetailSheet> createState() =>
      _SpeciesDetailSheetState();
}

class _SpeciesDetailSheetState extends ConsumerState<_SpeciesDetailSheet> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlayerLoading = false;

  String? _error;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _initAudio(String fileName) async {
    final api = ref.read(apiServiceProvider);
    final url = api.getAudioUrl(fileName);
    final l10n = AppLocalizations.of(context)!;

    try {
      setState(() {
        _isPlayerLoading = true;
        _error = null;
      });
      await _player.setUrl(url);
      setState(() => _isPlayerLoading = false);
    } catch (e) {
      if (mounted) {
        setState(() {
          _isPlayerLoading = false;
          _error = l10n.errorMsgSimple(e.toString());
        });
      }
    }
  }

  Future<void> _playPause(String fileName) async {
    if (_player.playing) {
      await _player.pause();
    } else {
      if (_player.processingState == ProcessingState.idle) {
        await _initAudio(fileName);
      } else if (_player.processingState == ProcessingState.completed) {
        await _player.seek(Duration.zero);
      }
      if (_error == null) {
        await _player.play();
      }
    }
  }

  Future<void> _stop() async {
    await _player.stop();
    await _player.seek(Duration.zero);
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String _formatDate(String dateStr) {
    if (dateStr.isEmpty) return dateStr;
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (_) {
      return dateStr;
    }
  }

  Widget _defaultImage() {
    return AspectRatio(
      aspectRatio: 1.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: AppColors.cardElevated,
          child: Image.asset(
            'assets/images/no-image.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(speciesDetailProvider(widget.sciName));
    final imageAsync = ref.watch(speciesImageProvider(widget.sciName));
    final l10n = AppLocalizations.of(context)!;
    final screenHeight = MediaQuery.of(context).size.height;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: screenHeight * 0.9),
      child: detailAsync.when(
        data: (detail) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
            children: [
              // Drag handle
              // Status and drag handle
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.divider,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Text(
                detail.comName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                detail.sciName,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: AppColors.textSecondary,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),

              // Image
              imageAsync.when(
                data: (imageMap) {
                  final base64String = imageMap?['base64_data'] as String?;
                  final imageUrl = imageMap?['image_url'] as String?;

                  Widget imageWidget;
                  if (base64String != null && base64String.isNotEmpty) {
                    try {
                      final bytes = base64Decode(base64String.split(',').last);
                      imageWidget = Image.memory(
                        bytes,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        errorBuilder: (_, _, _) => _defaultImage(),
                      );
                    } catch (e) {
                      debugPrint('Error decoding base64 detail image: $e');
                      imageWidget = _defaultImage();
                    }
                  } else if (imageUrl != null && imageUrl.isNotEmpty) {
                    imageWidget = CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      placeholder: (context, url) => Container(
                        color: AppColors.cardElevated,
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (context, url, error) => _defaultImage(),
                    );
                  } else {
                    imageWidget = _defaultImage();
                  }

                  return Center(
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: imageWidget,
                      ),
                    ),
                  );
                },
                loading: () => AspectRatio(
                  aspectRatio: 1.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: AppColors.cardElevated,
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  ),
                ),
                error: (_, __) => _defaultImage(),
              ),
              const SizedBox(height: 24),

              // Audio Player Control
              if (detail.bestDetection != null &&
                  detail.bestDetection!.fileName.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.divider),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.bestDetection,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textHint,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(
                              Icons.audio_file,
                              color: AppColors.primaryLight,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${detail.bestDetection!.date} ${detail.bestDetection!.time}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    detail.bestDetection!.fileName,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: AppColors.textHint,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Progress bar
                        StreamBuilder<Duration>(
                          stream: _player.positionStream,
                          builder: (context, posSnap) {
                            final position = posSnap.data ?? Duration.zero;
                            final duration = _player.duration ?? Duration.zero;
                            final progress = duration.inMilliseconds > 0
                                ? position.inMilliseconds /
                                      duration.inMilliseconds
                                : 0.0;

                            return Column(
                              children: [
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: AppColors.primaryLight,
                                    inactiveTrackColor: AppColors.primaryLight
                                        .withValues(alpha: 0.2),
                                    thumbColor: AppColors.primaryLight,
                                    thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 6,
                                    ),
                                    trackHeight: 3,
                                    overlayShape: const RoundSliderOverlayShape(
                                      overlayRadius: 14,
                                    ),
                                  ),
                                  child: Slider(
                                    value: progress.clamp(0.0, 1.0),
                                    onChanged: duration.inMilliseconds > 0
                                        ? (v) {
                                            _player.seek(
                                              Duration(
                                                milliseconds:
                                                    (v *
                                                            duration
                                                                .inMilliseconds)
                                                        .toInt(),
                                              ),
                                            );
                                          }
                                        : null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _formatDuration(position),
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: AppColors.textHint,
                                        ),
                                      ),
                                      Text(
                                        _formatDuration(duration),
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: AppColors.textHint,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 8),

                        // Playback controls
                        if (_error != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              _error!,
                              style: const TextStyle(
                                color: AppColors.error,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Stop
                            IconButton(
                              icon: const Icon(Icons.stop_rounded),
                              color: AppColors.textSecondary,
                              iconSize: 32,
                              onPressed: _stop,
                            ),
                            const SizedBox(width: 16),
                            // Play/Pause
                            StreamBuilder<PlayerState>(
                              stream: _player.playerStateStream,
                              builder: (context, snapshot) {
                                final playerState = snapshot.data;
                                final playing = playerState?.playing ?? false;

                                if (_isPlayerLoading) {
                                  return Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primaryLight.withValues(
                                        alpha: 0.15,
                                      ),
                                    ),
                                    child: const Center(
                                      child: SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryLight,
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                return Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: const LinearGradient(
                                      colors: [
                                        AppColors.primary,
                                        AppColors.primaryLight,
                                      ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primaryLight
                                            .withValues(alpha: 0.3),
                                        blurRadius: 12,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      playing
                                          ? Icons.pause_rounded
                                          : Icons.play_arrow_rounded,
                                    ),
                                    color: Colors.white,
                                    iconSize: 32,
                                    onPressed: () => _playPause(
                                      detail.bestDetection!.extractedPath,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              // Stats Row 1
              Row(
                children: [
                  _statItem(
                    Icons.sensors,
                    l10n.detections,
                    detail.detectionCount.toString(),
                  ),
                  const SizedBox(width: 8),
                  _statItem(
                    Icons.analytics,
                    l10n.maxConfidence,
                    '${(detail.maxConfidence * 100).toStringAsFixed(0)}%',
                  ),
                  const SizedBox(width: 8),
                  _statItem(
                    Icons.analytics_outlined,
                    l10n.avgConfidence,
                    '${(detail.avgConfidence * 100).toStringAsFixed(2)}%',
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Stats Row 2
              Row(
                children: [
                  _statItem(
                    Icons.event_available,
                    l10n.firstSeen,
                    _formatDate(detail.firstSeen),
                  ),
                  const SizedBox(width: 8),
                  _statItem(
                    Icons.event_available,
                    l10n.lastSeen,
                    _formatDate(detail.lastSeen),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // InfoURL Button
              if (detail.infoUrl != null && detail.infoUrl!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.public, color: Colors.white),
                    label: Text(
                      l10n.externalInfoLink, // Wait, I haven't added this string to l10n yet! Need to add it or use fallback
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      final uri = Uri.parse(detail.infoUrl!);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                  ),
                ),

              // Trend Chart
              if (detail.dailyTrend.isNotEmpty)
                _buildTrendChart(detail.dailyTrend, l10n),
            ],
          );
        },
        loading: () => ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: const [
            Center(
              child: CircularProgressIndicator(color: AppColors.primaryLight),
            ),
          ],
        ),
        error: (e, _) => Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            l10n.errorMsgSimple(e.toString()),
            style: const TextStyle(color: AppColors.error),
          ),
        ),
      ),
    );
  }

  Widget _buildTrendChart(List<DailyTrend> trend, AppLocalizations l10n) {
    final sortedTrend = List<DailyTrend>.from(trend)
      ..sort((a, b) => a.date.compareTo(b.date));
    int maxCount = 0;
    for (var t in sortedTrend) {
      if (t.count > maxCount) maxCount = t.count;
    }
    if (maxCount == 0) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.thirtyDaysTrend,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: maxCount.toDouble() * 1.2,
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    final date = sortedTrend[group.x.toInt()].date;
                    return BarTooltipItem(
                      '$date\n',
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: rod.toY.toInt().toString(),
                          style: const TextStyle(
                            color: AppColors.primaryLight,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index < 0 || index >= sortedTrend.length) {
                        return const SizedBox.shrink();
                      }
                      if (sortedTrend.length > 7 &&
                          index % (sortedTrend.length ~/ 5) != 0 &&
                          index != sortedTrend.length - 1 &&
                          index != 0) {
                        return const SizedBox.shrink();
                      }
                      final dateStr = sortedTrend[index].date;
                      DateTime? date;
                      try {
                        date = DateTime.parse(dateStr);
                      } catch (_) {}
                      final text = date != null
                          ? DateFormat('MM-dd').format(date)
                          : '';
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          text,
                          style: const TextStyle(
                            color: AppColors.textHint,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) {
                      if (value == 0) return const SizedBox.shrink();
                      return Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          color: AppColors.textHint,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.left,
                      );
                    },
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: maxCount > 5
                    ? (maxCount / 5).ceilToDouble()
                    : 1,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: AppColors.divider.withValues(alpha: 0.5),
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: sortedTrend.asMap().entries.map((entry) {
                return BarChartGroupData(
                  x: entry.key,
                  barRods: [
                    BarChartRodData(
                      toY: entry.value.count.toDouble(),
                      color: AppColors.primaryLight,
                      width: 8,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(4),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _statItem(IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.divider),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primaryLight, size: 20),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 10, color: AppColors.textHint),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
