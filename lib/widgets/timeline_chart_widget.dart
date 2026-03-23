import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../config/theme.dart';

class TimelineChartWidget extends StatelessWidget {
  final List<dynamic> dailyData;
  final bool showTemp;
  final bool showWind;
  final bool showUniqueSpecies;

  const TimelineChartWidget({
    super.key,
    required this.dailyData,
    required this.showTemp,
    required this.showWind,
    this.showUniqueSpecies = false,
  });

  @override
  Widget build(BuildContext context) {
    if (dailyData.isEmpty) return const Center(child: Text('Nessun dato'));

    // Generate Continuous Data list
    final List<Map<String, dynamic>> continuousData = [];
    final startDate = DateTime.parse(dailyData.first['date'] as String);
    final endDate = DateTime.parse(dailyData.last['date'] as String);
    final totalDays = endDate.difference(startDate).inDays + 1;
    
    final Map<String, Map<String, dynamic>> dataMap = {
      for (var e in dailyData) e['date'] as String: Map<String, dynamic>.from(e)
    };

    for (int i = 0; i < totalDays; i++) {
      final d = startDate.add(Duration(days: i));
      final dateStr = DateFormat('yyyy-MM-dd').format(d);
      if (dataMap.containsKey(dateStr)) {
        continuousData.add(dataMap[dateStr]!);
      } else {
        continuousData.add({
          'date': dateStr,
          'count': 0,
          'unique_species': 0,
          'avg_temp': null,
          'avg_wind': null,
        });
      }
    }

    double maxCount = 1.0;
    double maxTemp = 1.0;
    double maxWind = 1.0;

    for (var e in continuousData) {
      if ((e['count'] as int) > maxCount)
        maxCount = (e['count'] as int).toDouble();
      if ((e['unique_species'] as int? ?? 0) > maxCount)
        maxCount = (e['unique_species'] as int).toDouble();
      if ((e['avg_temp'] ?? 0.0) > maxTemp)
        maxTemp = (e['avg_temp'] ?? 0.0).toDouble();
      if ((e['avg_wind'] ?? 0.0) > maxWind)
        maxWind = (e['avg_wind'] ?? 0.0).toDouble();
    }
    maxCount = maxCount * 1.2; // Padding top

    final double barWidth = continuousData.length > 50
        ? 4
        : (continuousData.length > 20 ? 8 : 14);
    final double groupSpace = continuousData.length > 50
        ? 2
        : (continuousData.length > 20 ? 6 : 12);

    final barGroups = continuousData.asMap().entries.map((entry) {
      final index = entry.key;
      final count = entry.value['count'] as int;
      final uniqueCount = entry.value['unique_species'] as int? ?? 0;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: count.toDouble(),
            color: AppColors.primaryLight.withValues(alpha: 0.6),
            width: barWidth,
            borderRadius: BorderRadius.circular(4),
          ),
          if (showUniqueSpecies) ...[
            BarChartRodData(
              toY: uniqueCount.toDouble(),
              color: Colors.greenAccent.withValues(alpha: 0.6),
              width: barWidth,
              borderRadius: BorderRadius.circular(4),
            ),
          ]
        ],
      );
    }).toList();

    List<LineChartBarData> lineBars = [];

    if (showTemp) {
      lineBars.add(
        LineChartBarData(
          spots: continuousData.asMap().entries.where((entry) => entry.value['avg_temp'] != null).map((entry) {
            final index = entry.key;
            final temp = (entry.value['avg_temp'] as num).toDouble();
            final scaledY = maxTemp > 0
                ? (temp / maxTemp) * (maxCount * 0.8)
                : 0.0;
            return FlSpot(index.toDouble(), scaledY);
          }).toList(),
          isCurved: true,
          color: Colors.orangeAccent.withValues(alpha: 0.6),
          barWidth: 1.2,
          dotData: const FlDotData(show: false),
        ),
      );
    }

    if (showWind) {
      lineBars.add(
        LineChartBarData(
          spots: continuousData.asMap().entries.where((entry) => entry.value['avg_wind'] != null).map((entry) {
            final index = entry.key;
            final wind = (entry.value['avg_wind'] as num).toDouble();
            final scaledY = maxWind > 0
                ? (wind / maxWind) * (maxCount * 0.8)
                : 0.0;
            return FlSpot(index.toDouble(), scaledY);
          }).toList(),
          isCurved: true,
          color: Colors.cyanAccent.withValues(alpha: 0.6),
          barWidth: 1.2,
          dotData: const FlDotData(show: false),
        ),
      );
    }

    return Stack(
      children: [
        BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceBetween,
            groupsSpace: groupSpace,
            maxY: maxCount,
            minY: 0,
            barGroups: barGroups,
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                getTooltipColor: (_) => Colors.blueGrey.shade900,
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  final entry = continuousData[group.x.toInt()];
                  final date = entry['date'] as String;
                  final count = entry['count'] as int;
                  final uniqueCount = entry['unique_species'] as int? ?? 0;
                  final temp = entry['avg_temp'];
                  final wind = entry['avg_wind'];

                  String text = 'Data: $date\nDetections: $count';
                  if (showUniqueSpecies) text += '\nSpecie: $uniqueCount';
                  if (showTemp) text += '\nTemp: ${temp != null ? (temp as num).toStringAsFixed(1) + "°C" : "N/D"}';
                  if (showWind) text += '\nVento: ${wind != null ? (wind as num).toStringAsFixed(1) + " km/h" : "N/D"}';

                  return BarTooltipItem(
                    text,
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (val, meta) {
                    final index = val.toInt();
                    final totalCount = continuousData.length;
                    if (totalCount == 0 || index < 0 || index >= totalCount)
                      return const SizedBox.shrink();

                    final bool isDesktop =
                        MediaQuery.of(context).size.width > 700;
                    final int maxLabels = isDesktop ? 8 : 4;
                    final int interval = (totalCount / (maxLabels - 1)).ceil();

                    final bool isLast = index == totalCount - 1;
                    if (index % interval != 0 && !isLast) {
                      return const SizedBox.shrink();
                    }

                    final date = continuousData[index]['date'] as String;
                    return Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        DateFormat('dd/MM').format(DateTime.parse(date)),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 35,
                  getTitlesWidget: (value, meta) => Text(
                    '${value.toInt()}',
                    style: TextStyle(fontSize: 10, color: AppColors.textHint),
                  ),
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
              getDrawingHorizontalLine: (val) => FlLine(
                color: AppColors.divider.withValues(alpha: 0.1),
                strokeWidth: 1,
              ),
            ),
            borderData: FlBorderData(show: false),
          ),
        ),
        if (lineBars.isNotEmpty)
          IgnorePointer(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: (dailyData.length - 1).toDouble(),
                minY: 0,
                maxY: maxCount,
                lineBarsData: lineBars,
                titlesData: const FlTitlesData(show: false),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
      ],
    );
  }
}
