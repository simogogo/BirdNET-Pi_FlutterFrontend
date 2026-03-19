import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import 'species_hourly_heatmap.dart';

class ReportContentView extends StatelessWidget {
  final Future<Map<String, dynamic>> future;
  final String reportTitle;
  final IconData reportIcon;
  final Function(DragEndDetails) onHorizontalDragEnd;
  final String? fromDate;
  final String? toDate;

  const ReportContentView({
    super.key,
    required this.future,
    required this.reportTitle,
    required this.reportIcon,
    required this.onHorizontalDragEnd,
    this.fromDate,
    this.toDate,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onHorizontalDragEnd: onHorizontalDragEnd,
        child: FutureBuilder<Map<String, dynamic>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primaryLight),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: AppColors.error,
                      size: 48,
                    ),
                    SizedBox(height: 12),
                    Text(
                      '${AppLocalizations.of(context)!.errorOccurred}: ${snapshot.error}',
                      style: TextStyle(color: AppColors.error),
                    ),
                  ],
                ),
              );
            }

            final data = snapshot.data ?? {};
            final newSpecies = List<String>.from(data['new_species'] ?? []);
            final hourlyCounts = List<dynamic>.from(
              data['species_hourly_counts'] ?? [],
            );

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primaryLight.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight.withValues(
                                  alpha: 0.15,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                reportIcon,
                                color: AppColors.primaryLight,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  reportTitle,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (data['period_start'] != null)
                                  Text(
                                    '${data['period_start']} — ${data['period_end']}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(height: 30),
                        // Stats row
                        Row(
                          children: [
                            _statBox(
                              AppLocalizations.of(context)!
                                  .detectionsCount(0)
                                  .replaceAll(' 0', '')
                                  .replaceAll('0 ', '')
                                  .trim(),
                              '${data['total_detections'] ?? 0}',
                              data['total_percent_change'],
                            ),
                            const SizedBox(width: 12),
                            _statBox(
                              AppLocalizations.of(context)!.speciesToday.split('\n').first,
                              '${data['unique_species'] ?? 0}',
                              null,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // New species
                  if (newSpecies.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.new_releases,
                                color: AppColors.primaryLight,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                AppLocalizations.of(context)!.newSpecies,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            children: newSpecies
                                .map(
                                  (s) => ActionChip(
                                    label: Text(
                                      s,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryLight,
                                      ),
                                    ),
                                    backgroundColor: AppColors.cardElevated,
                                    side: BorderSide(
                                      color: AppColors.primaryLight.withValues(alpha: 0.3),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    onPressed: () {
                                      final query = Uri.encodeComponent(s);
                                        context.push(
                                          '/recordings?tab=2&fromDate=${fromDate ?? ''}&toDate=${toDate ?? ''}&species=$query',
                                        );
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Hourly distribution chart
                  if (hourlyCounts.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    SpeciesHourlyHeatmapWidget(
                      hourlyCounts: hourlyCounts,
                      hourlyWeather: data['hourly_weather'] as List?,
                    ),

                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _statBox(String label, String value, dynamic pctChange) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardElevated,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryLight,
              ),
            ),
            SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: AppColors.textHint),
            ),
            if (pctChange != null)
              Builder(
                builder: (_) {
                  final pct = pctChange as num;
                  return Text(
                    '${pct >= 0 ? '+' : ''}$pct%',
                    style: TextStyle(
                      fontSize: 11,
                      color: pct >= 0 ? AppColors.success : AppColors.error,
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
