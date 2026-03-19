import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../providers/insights_provider.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';

class InsightsScreen extends ConsumerWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final periodState = ref.watch(insightsPeriodProvider);
    final insightsAsync = ref.watch(insightsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Insights'), // TODO: Localize if needed
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: AppLocalizations.of(context)!.tooltipOpenMenu,
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: [
          AuthLockIcon(),
          _buildPeriodSelector(context, ref, periodState),

        ],
      ),
      body: insightsAsync.when(
        data: (data) => _buildContent(context, data),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text(
            'Errore nel caricamento: $err',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodSelector(
      BuildContext context, WidgetRef ref, InsightsFilter currentFilter) {
    const periodMap = {
      '7d': '7 Giorni',
      '30d': '30 Giorni',
      'all': 'Sempre',
      'custom': 'Personalizzato...',
    };

    final currentPeriod = currentFilter.period;
    String label = periodMap[currentPeriod] ?? currentPeriod;
    if (currentPeriod == 'custom' && currentFilter.range != null) {
      final start = currentFilter.range!.start.toString().substring(5, 10);
      final end = currentFilter.range!.end.toString().substring(5, 10);
      label = '$start a $end';
    }

    return PopupMenuButton<String>(
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryLight)),
          Icon(Icons.arrow_drop_down, color: AppColors.primaryLight),
        ],

      ),
      onSelected: (value) async {
        if (value == 'custom') {
          final picker = await showDateRangePicker(
            context: context,
            firstDate: DateTime(2020),
            lastDate: DateTime.now(),
            builder: (context, child) {
              return Theme(
                data: ThemeData.dark().copyWith(
                  colorScheme: ColorScheme.dark(
                    primary: AppColors.primaryLight,
                    surface: AppColors.card,
                    onSurface: Colors.white,
                  ),
                ),

                child: child!,
              );
            },
          );
          if (picker != null) {
            ref.read(insightsPeriodProvider.notifier).state = InsightsFilter(period: 'custom', range: picker);
          }
        } else {
          ref.read(insightsPeriodProvider.notifier).state = InsightsFilter(period: value);
        }
      },
      itemBuilder: (context) => periodMap.entries
          .map((e) => PopupMenuItem(
                value: e.key,
                child: Text(
                  e.value,
                  style: TextStyle(
                    fontWeight: e.key == currentPeriod ? FontWeight.bold : FontWeight.normal,
                    color: e.key == currentPeriod ? AppColors.primaryLight : null,
                  ),
                ),
              ))
          .toList(),
    );
  }


  Widget _buildContent(BuildContext context, Map<String, dynamic> data) {
    final hasWeather = data['has_weather'] ?? false;
    if (!hasWeather) {
      return const Center(
        child: Text('Dati meteo non disponibili per questo periodo.'),
      );
    }

    final tempBrackets = data['temp_brackets'] as List? ?? [];
    final conditionImpact = data['condition_impact'] as List? ?? [];
    final windImpact = data['wind_impact'] as List? ?? [];
    final speciesIdeal = data['species_ideal'] as List? ?? [];

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildSectionTitle('Distribuzione per Temperatura'),
              const SizedBox(height: 8),
              _buildTemperatureChart(context, tempBrackets),
              const SizedBox(height: 24),
              _buildSectionTitle('Impatto Condizioni Meteo'),
              const SizedBox(height: 8),
              _buildConditionGrid(context, conditionImpact),
              const SizedBox(height: 24),
              _buildSectionTitle('Impatto del Vento'),
              const SizedBox(height: 8),
              _buildWindList(context, windImpact),
              const SizedBox(height: 24),
              _buildSectionTitle('Temperature Ideali per Specie (Min 5 Detections)'),
              const SizedBox(height: 8),
              _buildIdealList(context, speciesIdeal),
              const SizedBox(height: 24),
              _buildSectionTitle('Correlazione Specie vs Meteo'),
              const SizedBox(height: 8),
              _buildSpeciesConditionChart(context, data['species_condition_correlation'] as List? ?? []),
              const SizedBox(height: 24),
              _buildSectionTitle('Sensibilità al Vento'),
              const SizedBox(height: 8),
              _buildWindSensitivityCards(context, data['wind_sensitivity'] as List? ?? []),
              const SizedBox(height: 24),
              _buildSectionTitle('Profilo Giorno vs Notte (Meteo)'),
              const SizedBox(height: 8),
              _buildDayNightRadarChart(context, Map<String, dynamic>.from(data['day_night_condition'] ?? {})),
              const SizedBox(height: 24),
              _buildSectionTitle('Golden Window (Temperatura × Vento)'),
              const SizedBox(height: 8),
              _buildGoldenWindowGrid(context, data['golden_window'] as List? ?? []),
            ]),

          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildTemperatureChart(BuildContext context, List<dynamic> brackets) {
    if (brackets.isEmpty) return const SizedBox.shrink();

    final maxVal = brackets.isEmpty
        ? 0
        : brackets.map((e) => e['count'] as int).reduce((a, b) => a > b ? a : b);

    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: (maxVal * 1.2).toDouble(),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final b = brackets[groupIndex];
                return BarTooltipItem(
                  '${b['bracket']}\n${b['count']} Detections',
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                  if (index >= 0 && index < brackets.length) {
                    final b = brackets[index]['bracket'] as String;
                    final display = b.split(' – ')[0]; // Prende solo es. "20"
                    return SideTitleWidget(
                      meta: meta,
                      space: 4,
                      child: Text(
                        '$display°',
                        style: TextStyle(color: AppColors.textHint, fontSize: 10),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
                reservedSize: 24,
              ),
            ),
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: List.generate(brackets.length, (index) {
            final b = brackets[index];
            final count = b['count'] as int;
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: count.toDouble(),
                  color: AppColors.primaryLight,
                  width: 14,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: (maxVal * 1.2).toDouble(),
                    color: AppColors.divider.withValues(alpha: 0.1),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildConditionGrid(BuildContext context, List<dynamic> conditions) {
    if (conditions.isEmpty) return const SizedBox.shrink();

    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = 2;
    double childAspectRatio = 1.4;

    if (width > 900) {
      crossAxisCount = 4;
      childAspectRatio = 1.7;
    } else if (width > 600) {
      crossAxisCount = 3;
      childAspectRatio = 1.5;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),

      itemCount: conditions.length,
      itemBuilder: (context, index) {
        final c = conditions[index];
        final desc = c['description'] ?? 'Nuvoloso';
        final count = c['det_count'] as int? ?? 0;
        final speciesCount = c['species_count'] as int? ?? 0;

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.divider.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/weather/${desc.toLowerCase()}.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      _getIconForCondition(desc),
                      color: _getIconColor(desc),
                      size: 26,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _translateCondition(desc),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$count Detections',
                      style: TextStyle(color: AppColors.textHint, fontSize: 11),
                    ),
                    Text(
                      '$speciesCount Specie',
                      style: TextStyle(
                        color: AppColors.primaryLight,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWindList(BuildContext context, List<dynamic> winds) {
    if (winds.isEmpty) return const SizedBox.shrink();

    return Column(
      children: winds.map((w) {
        final b = w['bracket'] ?? '';
        final count = w['det_count'] as int? ?? 0;
        final emoji = w['emoji'] ?? '🍃';

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          elevation: 0,
          color: AppColors.card,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: ListTile(
            leading: Text(emoji, style: const TextStyle(fontSize: 24)),
            title: Text(
              b,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            trailing: Text(
              '$count Detections',
              style: TextStyle(color: AppColors.textHint, fontSize: 13),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildIdealList(BuildContext context, List<dynamic> list) {
    if (list.isEmpty) return const SizedBox.shrink();

    return Column(
      children: list.map((item) {
        final name = item['Com_Name'] ?? 'Sconosciuto';
        final avg = item['avg_temp'] as double? ?? 0.0;
        final min = item['min_temp'] as double? ?? 0.0;
        final max = item['max_temp'] as double? ?? 0.0;

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          color: AppColors.card,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            title: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            subtitle: Text(
              'Range: ${min.toStringAsFixed(1)}°C – ${max.toStringAsFixed(1)}°C',
              style: TextStyle(color: AppColors.textHint, fontSize: 12),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${avg.toStringAsFixed(1)}°C',
                style: TextStyle(
                  color: AppColors.primaryLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSpeciesConditionChart(BuildContext context, List<dynamic> spCondData) {
    if (spCondData.isEmpty) return const SizedBox.shrink();

    // Trova il max totale o valore singolo per scalare maxY
    double maxVal = 1.0;
    for (final sp in spCondData) {
      final conds = sp['conditions'] as Map<String, dynamic>? ?? {};
      for (final v in conds.values) {
        if ((v as num).toDouble() > maxVal) maxVal = v.toDouble();
      }
    }

    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxVal * 1.2,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final sp = spCondData[groupIndex];
                final conds = ['Clear', 'Cloudy', 'Fog', 'Rain', 'Snow', 'Thunderstorm'];
                final cond = conds[rodIndex];
                final count = sp['conditions'][cond] ?? 0;
                return BarTooltipItem(
                  '${sp['Com_Name']}\n${_translateCondition(cond)}: $count',
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < spCondData.length) {
                    final name = spCondData[index]['Com_Name'] as String? ?? '?';
                    return SideTitleWidget(
                      meta: meta,
                      space: 6,
                      child: Text(
                        name.length > 8 ? '${name.substring(0, 7)}…' : name,
                        style: TextStyle(color: AppColors.textHint, fontSize: 9),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
                reservedSize: 24,
              ),
            ),
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: List.generate(spCondData.length, (sIndex) {
            final sp = spCondData[sIndex];
            final conds = sp['conditions'] as Map<String, dynamic>;
            
            return BarChartGroupData(
              x: sIndex,
              barRods: [
                BarChartRodData(toY: (conds['Clear'] ?? 0).toDouble(), color: Colors.amber, width: 6),
                BarChartRodData(toY: (conds['Cloudy'] ?? 0).toDouble(), color: Colors.grey, width: 6),
                BarChartRodData(toY: (conds['Fog'] ?? 0).toDouble(), color: Colors.blueGrey, width: 6),
                BarChartRodData(toY: (conds['Rain'] ?? 0).toDouble(), color: Colors.blue, width: 6),
                BarChartRodData(toY: (conds['Snow'] ?? 0).toDouble(), color: Colors.cyan, width: 6),
                BarChartRodData(toY: (conds['Thunderstorm'] ?? 0).toDouble(), color: Colors.deepPurpleAccent, width: 6),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildWindSensitivityCards(BuildContext context, List<dynamic> windData) {
    if (windData.isEmpty) return const SizedBox.shrink();

    return Column(
      children: windData.map((w) {
        final String name = w['Com_Name'] ?? '?';
        final int calm = w['Calm'] ?? 0;
        final int windy = w['Windy'] ?? 0;
        final int total = calm + windy;

        String description = 'Canta prevalentemente con vento calmo.';
        IconData icon = Icons.check_circle_outline;
        Color color = Colors.green;

        if (total > 0) {
          final double calmRatio = calm / total;
          if (calmRatio > 0.75) {
            description = '$name riduce drasticamente i canti del ${(calmRatio * 100).toStringAsFixed(0)}% con vento forte!';
            icon = Icons.warning_amber_rounded;
            color = Colors.orangeAccent;
          } else if (calmRatio < 0.50) {
            description = 'Molto tollerante al vento forte (canta anche con vento).';
            icon = Icons.bolt;
            color = Colors.blueAccent;
          }
        }

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: color.withValues(alpha: 0.15),
              child: Icon(icon, color: color, size: 20),
            ),
            title: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            subtitle: Text(
              description,
              style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
            ),
            trailing: Text(
              '🍃 $calm | 🌪️ $windy',
              style: TextStyle(color: AppColors.textHint, fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDayNightRadarChart(BuildContext context, Map<String, dynamic> data) {
    if (data.isEmpty) return const SizedBox.shrink();

    final day = Map<String, dynamic>.from(data['day'] ?? {});
    final night = Map<String, dynamic>.from(data['night'] ?? {});

    final conditions = ['Clear', 'Cloudy', 'Fog', 'Rain', 'Snow', 'Thunderstorm'];
    double maxVal = 1.0;
    for (final c in conditions) {
      if ((day[c] ?? 0) > maxVal) maxVal = (day[c] ?? 0).toDouble();
      if ((night[c] ?? 0) > maxVal) maxVal = (night[c] ?? 0).toDouble();
    }

    return Container(
      height: 260,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: RadarChart(
              RadarChartData(
                radarTouchData: RadarTouchData(enabled: true),


                dataSets: [
                  RadarDataSet(
                    fillColor: Colors.amber.withValues(alpha: 0.2),
                    borderColor: Colors.amber,
                    entryRadius: 3,
                    borderWidth: 2,
                    dataEntries: conditions.map((c) => RadarEntry(value: (day[c] ?? 0).toDouble())).toList(),
                  ),
                  RadarDataSet(
                    fillColor: Colors.deepPurpleAccent.withValues(alpha: 0.2),
                    borderColor: Colors.deepPurpleAccent,
                    entryRadius: 3,
                    borderWidth: 2,
                    dataEntries: conditions.map((c) => RadarEntry(value: (night[c] ?? 0).toDouble())).toList(),
                  ),
                ],
                radarShape: RadarShape.circle,
                getTitle: (index, angle) {
                  if (index >= 0 && index < conditions.length) {
                    final c = conditions[index];
                    return RadarChartTitle(
                      text: _translateCondition(c),
                      angle: angle,
                    );
                  }
                  return const RadarChartTitle(text: '');
                },
                ticksTextStyle: TextStyle(color: AppColors.textHint, fontSize: 9),
                tickCount: 3,
                radarBorderData: BorderSide(color: AppColors.divider),
                tickBorderData: BorderSide(color: AppColors.divider.withValues(alpha: 0.4)),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendDot(Colors.amber, 'Giorno ☀️'),
              const SizedBox(width: 16),
              _buildLegendDot(Colors.deepPurpleAccent, 'Notte 🌙'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLegendDot(Color color, String label) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildGoldenWindowGrid(BuildContext context, List<dynamic> data) {
    if (data.isEmpty) return const SizedBox.shrink();

    final temps = ['< 10°C', '10-18°C', '18-25°C', '> 25°C'];
    final winds = ['Calm (0-5)', 'Breezy (6-15)', 'Windy (> 15)'];

    // Aggrega in una mappa strutturata
    final grid = <String, Map<String, int>>{};
    int maxCount = 1;

    for (final t in temps) {
      grid[t] = {};
      for (final w in winds) {
        grid[t]![w] = 0;
      }
    }

    for (final d in data) {
      final t = d['temp'] as String? ?? '?';
      final w = d['wind'] as String? ?? '?';
      final c = d['count'] as int? ?? 0;
      if (grid.containsKey(t) && grid[t]!.containsKey(w)) {
        grid[t]![w] = c;
        if (c > maxCount) maxCount = c;
      }
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Table(
        border: TableBorder.all(color: AppColors.divider.withValues(alpha: 0.3), width: 0.5, borderRadius: BorderRadius.circular(8)),
        columnWidths: const {
          0: FlexColumnWidth(1.2),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(1),
        },
        children: [
          // Header Row
          TableRow(
            decoration: BoxDecoration(color: AppColors.divider.withValues(alpha: 0.1)),

            children: [
              const Padding(padding: EdgeInsets.all(8), child: Text('Temp \\ Vento', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10))),
              ...winds.map((w) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(w.split(' ')[0], textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                  )),
            ],
          ),
          // Data Rows
          ...temps.map((t) {
            return TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(t, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                ),
                ...winds.map((w) {
                  final count = grid[t]![w] ?? 0;
                  final intensity = count > 0 ? (count / maxCount) : 0.0;
                  final bgColor = count > 0 ? Colors.green.withValues(alpha: 0.1 + (intensity * 0.7)) : Colors.transparent;

                  return Container(
                    padding: const EdgeInsets.all(8),
                    color: bgColor,
                    child: Center(
                      child: Text(
                        '$count',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: count > 0 ? FontWeight.bold : FontWeight.normal,
                          color: count > 0 ? Colors.white : AppColors.textHint,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            );
          }),
        ],
      ),
    );
  }

  // --- Helper Methods ---

  IconData _getIconForCondition(String condition) {
    switch (condition) {
      case 'Clear':
        return Icons.wb_sunny_rounded;
      case 'Cloudy':
        return Icons.cloud_rounded;
      case 'Fog':
        return Icons.blur_on_rounded;
      case 'Rain':
        return Icons.water_drop_rounded;
      case 'Snow':
        return Icons.ac_unit_rounded;
      case 'Thunderstorm':
        return Icons.thunderstorm_rounded;
      default:
        return Icons.help_outline_rounded;
    }
  }

  Color _getIconColor(String condition) {
    switch (condition) {
      case 'Clear':
        return Colors.amber;
      case 'Cloudy':
        return Colors.grey;
      case 'Fog':
        return Colors.blueGrey;
      case 'Rain':
        return Colors.blue;
      case 'Snow':
        return Colors.cyan;
      case 'Thunderstorm':
        return Colors.deepPurpleAccent;
      default:
        return Colors.grey;
    }
  }

  String _translateCondition(String condition) {
    const map = {
      'Clear': 'Sereno',
      'Cloudy': 'Nuvoloso',
      'Fog': 'Nebbia',
      'Rain': 'Pioggia',
      'Snow': 'Neve',
      'Thunderstorm': 'Temporale',
    };
    return map[condition] ?? condition;
  }
}

