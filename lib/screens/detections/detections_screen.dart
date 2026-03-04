import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../providers/detections_provider.dart';
import '../../services/api_service.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';
import '../../widgets/detection_card.dart';
import '../../widgets/detection_detail_sheet.dart';
import '../../widgets/section_header.dart';

class DetectionsScreen extends ConsumerStatefulWidget {
  const DetectionsScreen({super.key});

  @override
  ConsumerState<DetectionsScreen> createState() => _DetectionsScreenState();
}

class _DetectionsScreenState extends ConsumerState<DetectionsScreen> {
  String? _filterSpecies;
  double _minConfidence = 0.0;

  @override
  Widget build(BuildContext context) {
    final detectionsAsync = ref.watch(todayDetectionsFlatProvider);
    final api = ref.watch(apiServiceProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // Added leading IconButton
          icon: const Icon(Icons.menu),
          tooltip: AppLocalizations.of(context)!.tooltipOpenMenu,
          onPressed: () => AppShell.openDrawer(),
        ),
        title: Text(AppLocalizations.of(context)!.todaysDetections),
        actions: [
          const AuthLockIcon(),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
            tooltip: AppLocalizations.of(context)!.filterDetections,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: AppLocalizations.of(context)!.tooltipRefreshData,
            onPressed: () => ref.invalidate(todayDetectionsProvider),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: AppColors.primaryLight,
        onRefresh: () async => ref.invalidate(todayDetectionsProvider),
        child: detectionsAsync.when(
          data: (detections) {
            var filtered = detections.where((d) {
              if (_filterSpecies != null && d.commonName != _filterSpecies) {
                return false;
              }
              if (d.confidence < _minConfidence) return false;
              return true;
            }).toList();

            if (filtered.isEmpty) {
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
                      _filterSpecies != null
                          ? AppLocalizations.of(context)!.noDetectionsForSpecies
                          : AppLocalizations.of(context)!.noDetectionsToday,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    if (_filterSpecies != null)
                      TextButton(
                        onPressed: () => setState(() => _filterSpecies = null),
                        child: Text(AppLocalizations.of(context)!.removeFilter),
                      ),
                  ],
                ),
              );
            }

            // Group by hour
            final byHour = <String, List<dynamic>>{};
            for (final d in filtered) {
              final hour = d.time.length >= 2 ? d.time.substring(0, 2) : '00';
              byHour.putIfAbsent(hour, () => []).add(d);
            }
            final sortedHours = byHour.keys.toList()
              ..sort((a, b) => b.compareTo(a));

            return ListView.builder(
              itemCount: sortedHours.length,
              itemBuilder: (context, index) {
                final hour = sortedHours[index];
                final hourDetections = byHour[hour]!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(
                      title: '$hour:00 - $hour:59',
                      icon: Icons.schedule,
                      trailing: AppLocalizations.of(
                        context,
                      )!.detectionsCount(hourDetections.length),
                    ),
                    ...hourDetections.map(
                      (d) => DetectionCard(
                        detection: d,
                        apiService: api,
                        onTap: () => _onDetectionTap(context, d),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.primaryLight),
          ),
          error: (e, _) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: AppColors.error,
                  size: 48,
                ),
                const SizedBox(height: 12),
                Text(
                  '${AppLocalizations.of(context)!.errorOccurred}: $e',
                  style: const TextStyle(color: AppColors.error),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => ref.invalidate(todayDetectionsProvider),
                  child: Text(AppLocalizations.of(context)!.retry),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onDetectionTap(BuildContext context, detection) {
    final api = ref.watch(apiServiceProvider);
    final audioUrl = api.getAudioUrl(detection.extractedPath);
    final spectrogramUrl = api.getSpectrogramImageUrl(detection.extractedPath);

    showModalBottomSheet(
      context: context,
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
        onDeleted: () => ref.invalidate(todayDetectionsProvider),
        onChanged: () => ref.invalidate(todayDetectionsProvider),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.filterDetections,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.minimumConfidenceThreshold,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            StatefulBuilder(
              builder: (context, setLocalState) => Column(
                children: [
                  Slider(
                    value: _minConfidence,
                    min: 0,
                    max: 1,
                    divisions: 20,
                    label: '${(_minConfidence * 100).toStringAsFixed(0)}%',
                    onChanged: (v) {
                      setLocalState(() => _minConfidence = v);
                    },
                  ),
                  Text(
                    '${(_minConfidence * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _filterSpecies = null;
                        _minConfidence = 0;
                      });
                      Navigator.pop(ctx);
                    },
                    child: Text(AppLocalizations.of(context)!.reset),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {});
                      Navigator.pop(ctx);
                    },
                    child: Text(AppLocalizations.of(context)!.apply),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
