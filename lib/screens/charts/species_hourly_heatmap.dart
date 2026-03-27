import 'package:flutter/material.dart';
import '../../config/theme.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../widgets/species_detail_sheet.dart';

class SpeciesHourlyHeatmapWidget extends StatelessWidget {
  final List<dynamic> hourlyCounts;
  final List<dynamic>? hourlyWeather;

  const SpeciesHourlyHeatmapWidget({
    super.key,
    required this.hourlyCounts,
    this.hourlyWeather,
  });

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
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Icons.grid_on, color: AppColors.primaryLight, size: 20),
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
              const double leftColWidth = 180;
              // Right column for 24h grid
              final double gridWidth = constraints.maxWidth - leftColWidth - 8;
              final double cellWidth = gridWidth / 24;
              const double rowHeight = 36;

              return Column(
                children: [
                  // --- WEATHER HEADERS ADDITION ---
                  if (hourlyWeather != null) ...[
                    // 1. Weather Icons Row
                    Row(
                      children: [
                        const SizedBox(width: leftColWidth + 8),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(24, (index) {
                              final w = index < hourlyWeather!.length
                                  ? hourlyWeather![index]
                                  : null;
                              final condition = (w?['condition'] ?? 'Clear')
                                  .toString();
                              // Hide labels exactly as the even/odd hour rule below
                              if (cellWidth < 18 ||
                                  (index % 2 != 0 && cellWidth < 26)) {
                                return SizedBox(width: cellWidth);
                              }

                              final isNightClear = condition.toLowerCase() == 'clear' && w?['isday'] == 0;
                              return SizedBox(
                                width: cellWidth,
                                child: Center(
                                  child: Image.asset(
                                    isNightClear
                                        ? 'assets/images/weather/clearmoon.png'
                                        : 'assets/images/weather/${condition.toLowerCase()}.png',
                                    width: 50, // Ulteriormente maggiorata
                                    height: 50,
                                    fit: BoxFit.contain,
                                    errorBuilder: (_, __, ___) =>
                                        const SizedBox.shrink(),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ), // Spazio aumentato per icone grandi
                    // 2. Temperatures Row
                    Row(
                      children: [
                        const SizedBox(width: leftColWidth + 8),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(24, (index) {
                              final w = index < hourlyWeather!.length
                                  ? hourlyWeather![index]
                                  : null;
                              final temp = w?['temp'];
                              if (cellWidth < 18 ||
                                  (index % 2 != 0 && cellWidth < 26)) {
                                return SizedBox(width: cellWidth);
                              }

                              Color tempColor = AppColors.primaryLight;
                              if (temp != null) {
                                final t = temp as num;
                                if (t >= 30) {
                                  tempColor = AppColors.error;
                                } else if (t >= 15) {
                                  tempColor = AppColors.warning;
                                }
                              }

                              return SizedBox(
                                width: cellWidth,
                                child: Text(
                                  temp != null
                                      ? '${(temp as num).toStringAsFixed(0)}°'
                                      : '-',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: tempColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                    // 3. Wind Row
                    Row(
                      children: [
                        const SizedBox(width: leftColWidth + 8),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(24, (index) {
                              final w = index < hourlyWeather!.length
                                  ? hourlyWeather![index]
                                  : null;
                              final wind = w?['wind'];
                              final windDeg = w?['wind_deg'];

                              if (cellWidth < 18 ||
                                  (index % 2 != 0 && cellWidth < 26)) {
                                return SizedBox(width: cellWidth);
                              }

                              final bool isStrongWind = wind != null && ((wind as num) * 1.60934) >= 16.09;
                              final Color windColor = isStrongWind
                                  ? AppColors.error
                                  : AppColors.primaryLight;
                              final Color windTextColor = isStrongWind
                                  ? AppColors.error
                                  : AppColors.primaryLight.withValues(alpha: 0.8);

                              return SizedBox(
                                width: cellWidth,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (windDeg != null)
                                      Transform.rotate(
                                        angle:
                                            ((windDeg as num) + 180) *
                                            3.141592653589793 /
                                            180,
                                        child: Icon(
                                          Icons.arrow_upward,
                                          size: 13,
                                          color: windColor,
                                        ),
                                      ),
                                    const SizedBox(width: 1),
                                    Text(
                                      wind != null
                                          ? '${((wind as num) * 1.60934).toStringAsFixed(0)}'
                                          : '-',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: windTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],

                  // --------------------------------

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
                                style: TextStyle(
                                  fontSize: 13,
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
                    final bool isNew = sp['is_new'] == true;
                    final num? pctChange = sp['percent_change'] as num?;

                    final List<int> hours = List<int>.from(
                      sp['hours'] ?? List.filled(24, 0),
                    );

                    // Normalize total bar width
                    final double pctWidth = maxTotal > 0 ? total / maxTotal : 0;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        children: [
                          // Left Panel: Name & Total Bar (tappable)
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(4),
                              onTap: () {
                                final sciName =
                                    sp['Sci_Name'] as String? ?? name;
                                showSpeciesDetailSheet(
                                  context,
                                  sciName: sciName,
                                  comName: name,
                                  showImage: false,
                                );
                              },
                              child: SizedBox(
                                width: leftColWidth,
                                height: rowHeight,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    // Background proportional bar
                                    FractionallySizedBox(
                                      widthFactor: pctWidth,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryLight
                                              .withValues(alpha: 0.15),
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(4),
                                            bottomRight: Radius.circular(4),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  name,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColors.textPrimary,
                                                    height: 1.1,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                if (isNew || pctChange != null)
                                                  Row(
                                                    children: [
                                                      if (isNew)
                                                        Text(
                                                          AppLocalizations.of(
                                                            context,
                                                          )!.newFemale,
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: AppColors
                                                                .primaryLight,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      if (isNew &&
                                                          pctChange != null)
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                      if (pctChange !=
                                                          null) ...[
                                                        Icon(
                                                          pctChange >= 0
                                                              ? Icons
                                                                    .arrow_upward
                                                              : Icons
                                                                    .arrow_downward,
                                                          size: 10,
                                                          color: pctChange >= 0
                                                              ? AppColors
                                                                    .success
                                                              : AppColors.error,
                                                        ),
                                                        Text(
                                                          '${pctChange.abs()}%',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                pctChange >= 0
                                                                ? AppColors
                                                                      .success
                                                                : AppColors
                                                                      .error,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            total.toString(),
                                            style: TextStyle(
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
                            ),
                          ), // MouseRegion / InkWell
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
                                  height: rowHeight,
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
                                            color:
                                                (alpha > 0.5 ||
                                                    Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark)
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
