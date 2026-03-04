import 'package:flutter/material.dart';
import '../../config/theme.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';

class SpeciesHourlyHeatmapWidget extends StatelessWidget {
  final List<dynamic> hourlyCounts;

  const SpeciesHourlyHeatmapWidget({super.key, required this.hourlyCounts});

  @override
  Widget build(BuildContext context) {
    if (hourlyCounts.isEmpty) {
      return const SizedBox.shrink();
    }

    // Convert dynamic list to a strong typed list
    final data = hourlyCounts.map((e) => Map<String, dynamic>.from(e)).toList();

    // Find absolute maximum detection across all species for 100% bar width reference
    int maxTotal = 0;
    // Find maximum single hour detection across all cells for color intensity mapping
    int maxCell = 0;

    for (final sp in data) {
      final total = (sp['total'] as num?)?.toInt() ?? 0;
      if (total > maxTotal) maxTotal = total;

      final hours = List<int>.from(sp['hours'] ?? List.filled(24, 0));
      for (final h in hours) {
        if (h > maxCell) maxCell = h;
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black26
            : Colors.grey.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Icon(
                Icons.grid_on,
                color: AppColors.primaryLight,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(
                  context,
                )!.detectionsBySpecies, // Reusing existing localized string
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              // Left column for species names + total bar
              const double leftColWidth = 150;
              // Right column for 24h grid
              final double gridWidth = constraints.maxWidth - leftColWidth - 8;
              final double cellWidth = gridWidth / 24;

              return Column(
                children: [
                  // Headers
                  Row(
                    children: [
                      const SizedBox(width: leftColWidth),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(25, (index) {
                            if (index == 24) {
                              return const SizedBox.shrink(); // Right border padding correction
                            }

                            // Hide all labels if cell is too small, similar to cell values
                            if (cellWidth < 16) {
                              return SizedBox(width: cellWidth);
                            }

                            // Show labels only for even hours to save space on medium sizes
                            if (index % 2 != 0 && cellWidth < 24) {
                              return SizedBox(width: cellWidth);
                            }

                            return SizedBox(
                              width: cellWidth,
                              child: Text(
                                index.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColors.textHint,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Data Rows
                  ...data.map((sp) {
                    final String name =
                        sp['Com_Name'] ?? sp['Sci_Name'] ?? 'Unknown';
                    final int total = (sp['total'] as num?)?.toInt() ?? 0;
                    final List<int> hours = List<int>.from(
                      sp['hours'] ?? List.filled(24, 0),
                    );

                    // Normalize total bar width
                    final double pctWidth = maxTotal > 0 ? total / maxTotal : 0;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        children: [
                          // Left Panel: Name & Total Bar
                          SizedBox(
                            width: leftColWidth,
                            height:
                                30, // Fixed height per row to keep grid exact
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                // Background proportional bar
                                FractionallySizedBox(
                                  widthFactor: pctWidth,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryLight.withValues(
                                        alpha: 0.15,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(4),
                                        bottomRight: Radius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          name,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        total.toString(),
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: AppColors.primaryLight,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),

                          // Right Panel: Hourly Grid
                          Expanded(
                            child: Row(
                              children: List.generate(24, (index) {
                                final count = hours[index];
                                // Map intensity logarithmically or linearly.
                                // Here we use linear relative to the max cell, enforcing a min alpha if count > 0.
                                double alpha = 0.0;
                                if (count > 0 && maxCell > 0) {
                                  alpha = 0.2 + (0.8 * (count / maxCell));
                                  alpha = alpha.clamp(0.2, 1.0);
                                }

                                return Container(
                                  width: cellWidth,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: count > 0
                                        ? AppColors.primaryLight.withValues(
                                            alpha: alpha,
                                          )
                                        : AppColors.cardElevated.withValues(
                                            alpha: 0.3,
                                          ),
                                    border: Border.all(
                                      color: AppColors.divider.withValues(
                                        alpha: 0.3,
                                      ),
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: count > 0 && cellWidth >= 16
                                      ? Text(
                                          count.toString(),
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            // Make text white for dark backgrounds, dark for light backgrounds
                                            color: alpha > 0.5
                                                ? Colors.white
                                                : AppColors.textPrimary,
                                          ),
                                        )
                                      : null,
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
