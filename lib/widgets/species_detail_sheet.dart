import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:just_audio/just_audio.dart';
import 'package:universal_html/html.dart' as html;
import '../l10n/app_localizations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/theme.dart';
import '../models/species_detail.dart';
import '../providers/detections_provider.dart';
import '../services/api_service.dart';

void showSpeciesDetailSheet(
  BuildContext context, {
  required String sciName,
  required String comName,
  bool showImage = true,
}) {
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
        child: SpeciesDetailSheet(
          sciName: sciName,
          comName: comName,
          showImage: showImage,
        ),
      ),
    ),
  );
}

class SpeciesDetailSheet extends ConsumerStatefulWidget {
  final String sciName;
  final String comName;
  final bool showImage;

  const SpeciesDetailSheet({
    super.key,
    required this.sciName,
    required this.comName,
    this.showImage = true,
  });

  @override
  ConsumerState<SpeciesDetailSheet> createState() => _SpeciesDetailSheetState();
}

class _SpeciesDetailSheetState extends ConsumerState<SpeciesDetailSheet> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlayerLoading = false;
  double? _dragValue;
  String? _error;
  String? _blobUrl;
  bool _mediaMissing = false;

  @override
  void initState() {
    super.initState();
    // Reset to start on completion for smoother seekbar experience
    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        if (kIsWeb) {
          _player.stop(); // MacOS/iOS Safari workaround
        } else {
          _player.pause().then((_) => _player.seek(Duration.zero));
        }
        if (mounted) setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    if (_blobUrl != null) {
      html.Url.revokeObjectUrl(_blobUrl!);
    }
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
        _mediaMissing = false;
      });

      if (_blobUrl != null) {
        await _player.setAudioSource(
          AudioSource.uri(Uri.parse(_blobUrl!)),
          preload: true,
        );
        setState(() => _isPlayerLoading = false);
        return;
      }

      // Scarichiamo l'audio come byte e creiamo un Blob URL locale.
      final bytes = await api.downloadAudioBytes(url);

      String mime = 'audio/wav';
      if (fileName.toLowerCase().endsWith('.mp3')) mime = 'audio/mpeg';
      if (fileName.toLowerCase().endsWith('.flac')) mime = 'audio/flac';

      final blob = html.Blob([bytes], mime);
      _blobUrl = html.Url.createObjectUrlFromBlob(blob);

      await _player.setAudioSource(
        AudioSource.uri(Uri.parse(_blobUrl!)),
        preload: true,
      );
      setState(() => _isPlayerLoading = false);
    } catch (e) {
      if (mounted) {
        setState(() {
          _isPlayerLoading = false;
          if (e is MediaNotFoundException) {
            _mediaMissing = true;
            _error = null;
          } else {
            _error = l10n.errorMsgSimple(e.toString());
          }
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
        if (_player.position >= (_player.duration ?? Duration.zero)) {
          await _player.seek(Duration.zero);
        }
      }
      if (_error == null) {
        if (mounted) setState(() => _dragValue = null);
        await _player.play();
      }
    }
  }

  Future<void> _stop() async {
    await _player.pause();
    await _player.seek(Duration.zero);
    setState(() {
      _dragValue = null;
    });
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
    ref.listen(speciesDetailProvider(widget.sciName), (previous, next) {
      if (next.hasValue && next.value?.bestDetection != null) {
        if (_player.processingState == ProcessingState.idle) {
          _initAudio(next.value!.bestDetection!.extractedPath);
        }
      }
    });

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
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
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
                detail.comName.isNotEmpty ? detail.comName : widget.comName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                detail.sciName.isNotEmpty ? detail.sciName : widget.sciName,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: AppColors.textSecondary,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),

              // Image
              if (widget.showImage) ...[
                imageAsync.when(
                  data: (imageMap) {
                    final base64String = imageMap?['base64_data'] as String?;
                    final imageUrl = imageMap?['image_url'] as String?;

                    Widget imageWidget;
                    if (base64String != null && base64String.isNotEmpty) {
                      try {
                        final bytes = base64Decode(
                          base64String.split(',').last,
                        );
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
                  error: (_, e2) => _defaultImage(),
                ),
                const SizedBox(height: 24),
              ],

              // Audio Player Control
              if (detail.bestDetection != null &&
                  detail.bestDetection!.fileName.isNotEmpty &&
                  !_mediaMissing)
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Container(
                    padding: EdgeInsets.all(16),
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
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textHint,
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
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
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    detail.bestDetection!.fileName,
                                    style: TextStyle(
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
                          initialData: _player.position,
                          builder: (context, posSnap) {
                            final position = posSnap.data ?? _player.position;
                            final duration = _player.duration ?? Duration.zero;
                            final isIdle =
                                _player.processingState == ProcessingState.idle;
                            final progress = (kIsWeb && isIdle)
                                ? 0.0
                                : (duration.inMilliseconds > 0
                                      ? position.inMilliseconds /
                                            duration.inMilliseconds
                                      : 0.0);

                            return Column(
                              children: [
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: AppColors.primaryLight,
                                    inactiveTrackColor: AppColors.primaryLight
                                        .withOpacity(0.2),
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
                                    value: (_dragValue ?? progress).clamp(
                                      0.0,
                                      1.0,
                                    ),
                                    onChanged: duration.inMilliseconds > 0
                                        ? (v) {
                                            setState(() {
                                              _dragValue = v;
                                            });
                                          }
                                        : null,
                                    onChangeEnd: duration.inMilliseconds > 0
                                        ? (v) async {
                                            final target = Duration(
                                              milliseconds:
                                                  (v * duration.inMilliseconds)
                                                      .toInt(),
                                            );
                                            await _player.seek(target);

                                            // Polling per sincronizzazione (max 500ms)
                                            for (int i = 0; i < 5; i++) {
                                              await Future.delayed(
                                                const Duration(
                                                  milliseconds: 100,
                                                ),
                                              );
                                              if ((_player.position - target)
                                                      .abs() <
                                                  const Duration(
                                                    milliseconds: 200,
                                                  )) {
                                                break;
                                              }
                                            }

                                            if (mounted) {
                                              setState(() {
                                                if (_player.playing) {
                                                  _dragValue = null;
                                                }
                                              });
                                            }
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
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: AppColors.textHint,
                                        ),
                                      ),
                                      Text(
                                        _formatDuration(duration),
                                        style: TextStyle(
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
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              _error!,
                              style: TextStyle(
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
                              icon: Icon(Icons.stop_rounded),
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
                                      color: AppColors.primaryLight.withOpacity(0.15),
                                    ),
                                    child: Center(
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
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.primary,
                                        AppColors.primaryLight,
                                      ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primaryLight
                                            .withOpacity(0.3),
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
                      l10n.externalInfoLink,
                      style: TextStyle(color: Colors.white),
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
          padding: EdgeInsets.all(20),
          children: [
            Center(
              child: CircularProgressIndicator(color: AppColors.primaryLight),
            ),
          ],
        ),
        error: (e, _) => Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            l10n.errorMsgSimple(e.toString()),
            style: TextStyle(color: AppColors.error),
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
                      TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: rod.toY.toInt().toString(),
                          style: TextStyle(
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
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          text,
                          style: TextStyle(
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
                        style: TextStyle(
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
                rightTitles: AxisTitles(
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
                  color: AppColors.divider.withOpacity(0.5),
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
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 10, color: AppColors.textHint),
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
