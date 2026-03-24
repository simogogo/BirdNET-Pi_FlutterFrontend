import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import '../../l10n/app_localizations.dart';
import '../../config/theme.dart';

class TrendsHeatmapWidget extends StatelessWidget {
  final List<dynamic> dailyHourly;
  final List<dynamic> sunInfo;
  final String? startDate;
  final String? endDate;
  final bool showBox;
  final EdgeInsets padding;

  const TrendsHeatmapWidget({
    super.key,
    required this.dailyHourly,
    required this.sunInfo,
    this.startDate,
    this.endDate,
    this.showBox = true,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    if (dailyHourly.isEmpty) return const SizedBox.shrink();

    // 1. Group Data by Date
    final Map<String, Map<int, int>> grouped = {};
    int maxCount = 1;

    for (var d in dailyHourly) {
      final date = d['date'] as String;
      final hour = d['hour'] as int;
      final count = d['count'] as int;

      if (!grouped.containsKey(date)) {
        grouped[date] = {};
      }
      grouped[date]![hour] = count;
      if (count > maxCount) maxCount = count;
    }

    // 2. Map Sun Info by Date
    final Map<String, Map<String, double>> sunMap = {};
    for (var s in sunInfo) {
      final date = s['date'] as String;
      if (s['sunrise'] != null && s['sunset'] != null) {
        sunMap[date] = {
          'sunrise': (s['sunrise'] as num).toDouble(),
          'sunset': (s['sunset'] as num).toDouble(),
        };
      }
    }

    // 3. Generate Continuous Dates
    final initialDates = grouped.keys.toList()..sort();
    final List<String> dates = [];
    final startStr = startDate ?? (initialDates.isNotEmpty ? initialDates.first : null);
    final endStr = endDate ?? (initialDates.isNotEmpty ? initialDates.last : null);

    if (startStr != null && endStr != null) {
      final start = DateTime.parse(startStr);
      final end = DateTime.parse(endStr);
      final totalDays = end.difference(start).inDays + 1;
      for (int i = 0; i < totalDays; i++) {
        final d = start.add(Duration(days: i));
        dates.add(DateFormat('yyyy-MM-dd').format(d));
      }
    }

    return Container(
      height: 350,
      padding: padding,
      decoration: showBox
          ? BoxDecoration(
              color: AppColors.cardElevated,
              borderRadius: BorderRadius.circular(16),
            )
          : null,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (dates.isEmpty) return Center(child: Text(AppLocalizations.of(context)!.noData));

          return Stack(
            children: [
              CustomPaint(
                size: Size(constraints.maxWidth, constraints.maxHeight - 30),
                painter: TrendsHeatmapPainter(
                  dates: dates,
                  data: grouped,
                  sunInfo: sunMap,
                  maxCount: maxCount,
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: CustomPaint(
                    size: Size(constraints.maxWidth, constraints.maxHeight - 30),
                    painter: _TimelineLabelsPainter(dates: dates, isDesktop: constraints.maxWidth > 700),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class TrendsHeatmapPainter extends CustomPainter {
  final List<String> dates;
  final Map<String, Map<int, int>> data;
  final Map<String, Map<String, double>> sunInfo;
  final int maxCount;

  TrendsHeatmapPainter({
    required this.dates,
    required this.data,
    required this.sunInfo,
    required this.maxCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (dates.isEmpty) return;

    final cellWidth = size.width / dates.length;
    final cellHeight = size.height / 24;

    final paint = Paint()..style = PaintingStyle.fill;

    // 1. Draw Heatmap Cells
    for (int i = 0; i < dates.length; i++) {
      final date = dates[i];
      final dayData = data[date] ?? {};

      for (int h = 0; h < 24; h++) {
        final count = dayData[h] ?? 0;
        if (count > 0) {
          final intensity = count / maxCount;
          paint.color = Colors.teal.withValues(alpha: 0.2 + 0.8 * intensity);
          
          canvas.drawRect(
            Rect.fromLTWH(
              i * cellWidth, 
              (23 - h) * cellHeight, 
              cellWidth, 
              cellHeight
            ),
            paint,
          );
        }
      }
    }

    // 2. Draw Sunrise & Sunset curves
    final sunPaint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final sunrisePath = Path();
    final sunsetPath = Path();
    bool firstSunrise = true;
    bool firstSunset = true;

    for (int i = 0; i < dates.length; i++) {
      final date = dates[i];
      final sun = sunInfo[date];

      if (sun != null) {
        final sunrise = sun['sunrise']!;
        final sunset = sun['sunset']!;

        final x = i * cellWidth + cellWidth / 2;
        final sunriseY = (24 - sunrise) * cellHeight;
        final sunsetY = (24 - sunset) * cellHeight;

        if (firstSunrise) {
          sunrisePath.moveTo(x, sunriseY);
          firstSunrise = false;
        } else {
          sunrisePath.lineTo(x, sunriseY);
        }

        if (firstSunset) {
          sunsetPath.moveTo(x, sunsetY);
          firstSunset = false;
        } else {
          sunsetPath.lineTo(x, sunsetY);
        }
      }
    }

    canvas.drawPath(sunrisePath, sunPaint);
    canvas.drawPath(sunsetPath, sunPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _TimelineLabelsPainter extends CustomPainter {
  final List<String> dates;
  final bool isDesktop;

  _TimelineLabelsPainter({required this.dates, required this.isDesktop});

  @override
  void paint(Canvas canvas, Size size) {
    final cellHeight = size.height / 24;
    final textPainter = TextPainter(textDirection: ui.TextDirection.ltr);

    final labels = [0, 4, 8, 12, 16, 20, 23];
    for (var h in labels) {
      final y = (23 - h) * cellHeight + (cellHeight / 2);
      textPainter.text = TextSpan(
        text: '${h.toString().padLeft(2, '0')}:00',
        style: TextStyle(fontSize: 9, color: Colors.grey.withValues(alpha: 0.8)),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(4, y - (textPainter.height / 2)));
    }

    // X Axis Sample Labels for Dates (Aligned with count and Screen size)
    if (dates.isNotEmpty) {
      final maxLabels = isDesktop ? 8 : 4;
      final interval = (dates.length / (maxLabels - 1)).ceil();

      for (int i = 0; i < dates.length; i++) {
        final isLast = i == dates.length - 1;
        if (i % interval != 0 && !isLast) continue;

        final x = i * (size.width / dates.length);
        final date = dates[i];
        String formatted = date;
        try {
          formatted = DateFormat('dd/MM').format(DateTime.parse(date));
        } catch (_) {}

        textPainter.text = TextSpan(
          text: formatted,
          style: const TextStyle(fontSize: 9, color: Colors.grey, fontWeight: FontWeight.bold),
        );
        textPainter.layout();
        // Shift last label slightly left to stay bounded
        final offsetX = isLast ? x - textPainter.width : x;
        textPainter.paint(canvas, Offset(offsetX, size.height + 4));
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
