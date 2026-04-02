import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import '../config/theme.dart';
import '../l10n/app_localizations.dart';

enum InsightReportType { daily, weekly, monthly }

class ReportInsightsWidget extends StatelessWidget {
  final List<dynamic> speciesHourlyCounts;
  final List<dynamic> species;
  final InsightReportType reportType;

  const ReportInsightsWidget({
    super.key,
    required this.speciesHourlyCounts,
    required this.species,
    required this.reportType,
  });

  @override
  Widget build(BuildContext context) {
    if (speciesHourlyCounts.isEmpty && species.isEmpty) {
      return const SizedBox.shrink();
    }

    final isNarrow = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black26
              : Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.divider),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(
                  Icons.insights,
                  color: AppColors.primaryLight,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  reportType == InsightReportType.daily
                      ? AppLocalizations.of(context)!.dailyInsightsTitle
                      : reportType == InsightReportType.weekly
                          ? AppLocalizations.of(context)!.weeklyInsightsTitle
                          : AppLocalizations.of(context)!.monthlyInsightsTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (isNarrow)
              Column(
                children: [
                  _buildHourlyContainer(context),
                  const SizedBox(height: 32),
                  _buildSpeciesContainer(context),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildHourlyContainer(context)),
                  const SizedBox(width: 24),
                  Expanded(child: _buildSpeciesContainer(context)),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHourlyContainer(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.hourlyActivityTitle,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final side = constraints.maxWidth;
            return SizedBox(
              width: side,
              height: side,
              child: HourlyRadialChart(speciesHourlyCounts: speciesHourlyCounts),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSpeciesContainer(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.speciesDiversityTitle,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final side = constraints.maxWidth;
            return SizedBox(
              width: side,
              height: side,
              child: SpeciesPieChart(species: species),
            );
          },
        ),
      ],
    );
  }
}

class HourlyRadialChart extends StatefulWidget {
  final List<dynamic> speciesHourlyCounts;

  const HourlyRadialChart({super.key, required this.speciesHourlyCounts});

  @override
  State<HourlyRadialChart> createState() => _HourlyRadialChartState();
}

class _HourlyRadialChartState extends State<HourlyRadialChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    // Aggregazione dati orari
    final List<int> hourlyTotals = List.filled(24, 0);
    for (var sp in widget.speciesHourlyCounts) {
      final hours = sp['hours'] as List<dynamic>;
      for (int i = 0; i < 24; i++) {
        hourlyTotals[i] += (hours[i] as num).toInt();
      }
    }

    final int maxDetections = hourlyTotals.reduce((a, b) => a > b ? a : b);
    final int totalDetections = hourlyTotals.reduce((a, b) => a + b);

    return LayoutBuilder(
      builder: (context, constraints) {
        final radiusLimit = constraints.maxWidth / 2;
        final baseSectionRadius = radiusLimit * 0.6;
        final maxVarRadius = radiusLimit * 0.35;

        return Stack(
          alignment: Alignment.center,
          children: [
            // Background with rings and labels
            CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxWidth),
              painter: RadialChartBackgroundPainter(
                labelColor: AppColors.textHint,
                lineColor: AppColors.divider.withOpacity(0.15),
              ),
            ),
            PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                startDegreeOffset: 270, // Start at 00:00 (top)
                borderData: FlBorderData(show: false),
                sectionsSpace: 1.5,
                centerSpaceRadius: 30,
                sections: List.generate(24, (i) {
                  final double value = hourlyTotals[i].toDouble();
                  final isTouched = i == touchedIndex;
                  
                  // Calcolo raggio variabile (Rose Chart style)
                  final double ratio = maxDetections > 0 ? value / maxDetections : 0;
                  final double sectionRadius = baseSectionRadius + (maxVarRadius * ratio);
                  
                  // Calcolo colore basato sull'intensità
                  final Color color = Color.lerp(
                    AppColors.primaryLight.withOpacity(0.15),
                    AppColors.primaryLight,
                    ratio,
                  )!;

                  return PieChartSectionData(
                    color: value > 0 ? color : Colors.transparent,
                    value: 1, // Angolo uguale per ogni ora
                    radius: value > 0 ? (isTouched ? sectionRadius + 5 : sectionRadius) : 0,
                    showTitle: false,
                    badgeWidget: (value > 0 && isTouched) ? _buildBadge(i, value.toInt()) : null,
                    badgePositionPercentageOffset: 1.1,
                  );
                }),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  totalDetections.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryLight,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.detShort,
                  style: TextStyle(fontSize: 9, color: AppColors.textHint),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildBadge(int index, int count) {
    final start = index.toString().padLeft(2, '0');
    final end = ((index + 1) % 24).toString().padLeft(2, '0');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.cardElevated,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: AppColors.primaryLight.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$start:00 - $end:00",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.detectionsCount(count),
            style: TextStyle(
              fontSize: 12,
              color: AppColors.primaryLight,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class RadialChartBackgroundPainter extends CustomPainter {
  final Color labelColor;
  final Color lineColor;

  RadialChartBackgroundPainter({
    required this.labelColor,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = lineColor
      ..strokeWidth = 1;

    // Draw 2 concentric rings (double circle)
    canvas.drawCircle(center, radius * 0.5, strokePaint);
    canvas.drawCircle(center, radius, strokePaint);

    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    const double angleStep = 2 * math.pi / 24;

    for (int i = 0; i < 24; i += 2) {
      double angle = i * angleStep - (math.pi / 2);
      double labelRadius = radius + 15;

      double dx = center.dx + labelRadius * math.cos(angle);
      double dy = center.dy + labelRadius * math.sin(angle);

      final hourStr = i == 0
          ? '12am'
          : (i < 12 ? '${i}am' : (i == 12 ? '12pm' : '${i - 12}pm'));

      textPainter.text = TextSpan(
        text: hourStr,
        style: TextStyle(
          fontSize: 9,
          color: labelColor,
          fontWeight: FontWeight.bold,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(dx - textPainter.width / 2, dy - textPainter.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SpeciesPieChart extends StatefulWidget {
  final List<dynamic> species;

  const SpeciesPieChart({super.key, required this.species});

  @override
  State<SpeciesPieChart> createState() => _SpeciesPieChartState();
}

class _SpeciesPieChartState extends State<SpeciesPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    if (widget.species.isEmpty) return Center(child: Text(AppLocalizations.of(context)!.noData));

    // Prendiamo le prime 5 specie + Altre
    final List<dynamic> topSpecies = widget.species.take(5).toList();
    final int totalDetections = widget.species.fold(0, (sum, sp) => sum + (sp['count'] as num).toInt());
    
    final List<Color> palette = [
      AppColors.primaryDark,
      AppColors.primary,
      AppColors.primaryLight,
      AppColors.accent,
      AppColors.accent.withOpacity(0.6),
    ];
    const Color othersColor = Colors.grey;

    return LayoutBuilder(
      builder: (context, constraints) {
        final diameter = constraints.maxWidth;
        int topSum = 0;
        final List<PieChartSectionData> sections = [];

        for (int i = 0; i < topSpecies.length; i++) {
            final sp = topSpecies[i];
            final count = (sp['count'] as num).toInt();
            topSum += count;
            final isTouched = i == touchedIndex;
            
            final double radius = isTouched ? diameter * 0.3 : diameter * 0.25;

            sections.add(PieChartSectionData(
                color: palette[i % palette.length],
                value: count.toDouble(),
                title: isTouched ? '${sp['Com_Name']}\n$count' : '${totalDetections > 0 ? ((count/totalDetections)*100).toStringAsFixed(0) : "0"}%',
                radius: radius,
                titleStyle: TextStyle(fontSize: isTouched ? 14 : 12, fontWeight: FontWeight.bold, color: Colors.white),
                titlePositionPercentageOffset: 0.5,
            ));
        }

        if (totalDetections > topSum) {
            final otherCount = totalDetections - topSum;
            final isTouched = touchedIndex == topSpecies.length;
            final double radius = isTouched ? diameter * 0.3 : diameter * 0.25;

            sections.add(PieChartSectionData(
                color: othersColor,
                value: otherCount.toDouble(),
                title: isTouched ? '${AppLocalizations.of(context)!.others}\n$otherCount' : '${totalDetections > 0 ? ((otherCount/totalDetections)*100).toStringAsFixed(0) : "0"}%',
                radius: radius,
                titleStyle: TextStyle(fontSize: isTouched ? 14 : 12, fontWeight: FontWeight.bold, color: Colors.white),
                titlePositionPercentageOffset: 0.5,
            ));
        }

        return PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(show: false),
            sectionsSpace: 2,
            centerSpaceRadius: diameter * 0.15,
            sections: sections,
          ),
        );
      },
    );
  }
}
