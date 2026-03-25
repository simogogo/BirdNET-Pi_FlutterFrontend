import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../providers/trends_provider.dart';
import '../../providers/detections_provider.dart';
import '../../services/api_service.dart';
import 'trends_heatmap_widget.dart';
import '../../widgets/timeline_chart_widget.dart';

class TrendsScreen extends ConsumerStatefulWidget {
  const TrendsScreen({super.key});

  @override
  ConsumerState<TrendsScreen> createState() => _TrendsScreenState();
}

class _TrendsScreenState extends ConsumerState<TrendsScreen> {
  String? _selectedSpecies;
  String? _appliedSpecies;
  late DateTime _fromDate;
  late DateTime _toDate;
  DateTime? _appliedFromDate;
  DateTime? _appliedToDate;
  bool _showTemp = false;
  bool _showWind = false;
  bool _isFilterOpen = true;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _fromDate = now.subtract(const Duration(days: 30));
    _toDate = now;
  }

  @override
  Widget build(BuildContext context) {
    final allSpeciesAsync = ref.watch(allSpeciesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.trends),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Column(
        children: [
          _buildFiltersPanel(context, allSpeciesAsync),
          Expanded(
            child: _appliedSpecies == null
                ? _buildEmptyState()
                : _buildTrendsContent(ref),
          ),
        ],
      ),
    );
  }

  Widget _buildFiltersPanel(
    BuildContext context,
    AsyncValue<List<Map<String, dynamic>>> allSpeciesAsync,
  ) {
    return Container(
      color: AppColors.surface,
      child: Column(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _isFilterOpen
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                    child: Column(
                      children: [
                        // 1. Species Selection (Autocomplete) + Refresh
                        Row(
                          children: [
                            Expanded(
                              child: allSpeciesAsync.when(
                                data: (speciesList) {
                                  return Autocomplete<Map<String, dynamic>>(
                                    displayStringForOption: (option) =>
                                        option['Com_Name'] ??
                                        option['Sci_Name'],
                                    initialValue: TextEditingValue(
                                      text: _selectedSpecies != null
                                          ? (speciesList.firstWhere(
                                                  (s) =>
                                                      s['Sci_Name'] ==
                                                      _selectedSpecies,
                                                  orElse: () => {
                                                    'Com_Name':
                                                        _selectedSpecies,
                                                  },
                                                )['Com_Name'] ??
                                                _selectedSpecies!)
                                          : '',
                                    ),
                                    optionsBuilder:
                                        (TextEditingValue textEditingValue) {
                                          if (textEditingValue.text.isEmpty) {
                                            return const Iterable<
                                              Map<String, dynamic>
                                            >.empty();
                                          }
                                          final query = textEditingValue.text
                                              .toLowerCase();
                                          return speciesList.where((s) {
                                            final common =
                                                (s['Com_Name'] as String?)
                                                    ?.toLowerCase() ??
                                                '';
                                            final scientific =
                                                (s['Sci_Name'] as String?)
                                                    ?.toLowerCase() ??
                                                '';
                                            return common.contains(query) ||
                                                scientific.contains(query);
                                          });
                                        },
                                    onSelected:
                                        (Map<String, dynamic> selection) {
                                          setState(
                                            () => _selectedSpecies =
                                                selection['Sci_Name'],
                                          );
                                        },
                                    fieldViewBuilder:
                                        (
                                          context,
                                          controller,
                                          focusNode,
                                          onFieldSubmitted,
                                        ) {
                                          return TextField(
                                            controller: controller,
                                            focusNode: focusNode,
                                              decoration: InputDecoration(
                                                hintText: AppLocalizations.of(context)!.searchSpecies,
                                                prefixIcon: Icon(
                                                  Icons.search,
                                                  color: AppColors.textHint,
                                                ),
                                                suffixIcon: controller.text.isNotEmpty
                                                    ? IconButton(
                                                        icon: Icon(
                                                          Icons.clear,
                                                          size: 18,
                                                          color: AppColors.textHint,
                                                        ),
                                                        onPressed: () {
                                                          controller.clear();
                                                          setState(() => _selectedSpecies = null);
                                                        },
                                                      )
                                                    : null,
                                              ),
                                            onSubmitted: (value) =>
                                                onFieldSubmitted(),
                                          );
                                        },
                                    optionsViewBuilder:
                                        (context, onSelected, options) {
                                          return Align(
                                            alignment: Alignment.topLeft,
                                            child: Material(
                                              elevation: 8,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: AppColors.surface,
                                              child: ConstrainedBox(
                                                constraints: BoxConstraints(
                                                  maxHeight: 250,
                                                  maxWidth:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.width -
                                                      32,
                                                ),
                                                child: ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  itemCount: options.length,
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const Divider(
                                                            height: 1,
                                                          ),
                                                  itemBuilder: (context, index) {
                                                    final option = options
                                                        .elementAt(index);
                                                    return ListTile(
                                                      title: Text(
                                                        option['Com_Name'] ??
                                                            option['Sci_Name'],
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        option['Sci_Name'],
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: AppColors
                                                              .textHint,
                                                        ),
                                                      ),
                                                      onTap: () =>
                                                          onSelected(option),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                  );
                                },
                                loading: () => const LinearProgressIndicator(),
                                error: (e, _) => const SizedBox.shrink(),
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton.filled(
                              onPressed: _appliedSpecies != null
                                  ? () {
                                      ref.invalidate(
                                        trendsDataProvider((
                                          species: _appliedSpecies!,
                                          startDate: DateFormat(
                                            'yyyy-MM-dd',
                                          ).format(_appliedFromDate!),
                                          endDate: DateFormat(
                                            'yyyy-MM-dd',
                                          ).format(_appliedToDate!),
                                        )),
                                      );
                                    }
                                  : null,
                              icon: Icon(Icons.refresh),
                              tooltip: AppLocalizations.of(context)!.tooltipRefresh,
                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.primary.withValues(
                                  alpha: 0.1,
                                ),
                                foregroundColor: AppColors.primaryLight,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // 2. Dates Row
                        Row(
                          children: [
                            Expanded(
                              child: _FilterTile(
                                label: AppLocalizations.of(context)!.fromLabel,
                                value: DateFormat(
                                  'dd/MM/yyyy',
                                ).format(_fromDate),
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    initialDate: _fromDate,
                                    firstDate: DateTime(2020),
                                    lastDate: _toDate,
                                  );
                                  if (picked != null)
                                    setState(() => _fromDate = picked);
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _FilterTile(
                                label: AppLocalizations.of(context)!.toLabel,
                                value: DateFormat('dd/MM/yyyy').format(_toDate),
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    initialDate: _toDate,
                                    firstDate: _fromDate,
                                    lastDate: DateTime.now(),
                                  );
                                  if (picked != null)
                                    setState(() => _toDate = picked);
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton.filled(
                              onPressed: () {
                                if (_selectedSpecies == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(AppLocalizations.of(context)!.selectSpecies),
                                    ),
                                  );
                                  return;
                                }
                                setState(() {
                                  _appliedSpecies = _selectedSpecies;
                                  _appliedFromDate = _fromDate;
                                  _appliedToDate = _toDate;
                                });
                              },
                              icon: const Icon(Icons.search),
                              tooltip: AppLocalizations.of(context)!.tooltipSearch,
                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.primaryLight,
                                foregroundColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          // Expand/Collapse header
          GestureDetector(
            onTap: () => setState(() => _isFilterOpen = !_isFilterOpen),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.divider)),
              ),
              child: Icon(
                _isFilterOpen ? Icons.expand_less : Icons.expand_more,
                color: AppColors.primaryLight,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.trending_up, size: 64, color: Colors.grey),
          const SizedBox(height: 12),
          Text(AppLocalizations.of(context)!.selectSpeciesToViewTrends),
        ],
      ),
    );
  }

  Widget _buildTrendsContent(WidgetRef ref) {
    if (_appliedSpecies == null) return _buildEmptyState();

    final trendsAsync = ref.watch(
      trendsDataProvider((
        species: _appliedSpecies!,
        startDate: DateFormat('yyyy-MM-dd').format(_appliedFromDate!),
        endDate: DateFormat('yyyy-MM-dd').format(_appliedToDate!),
      )),
    );

    return trendsAsync.when(
      data: (data) {
        final hourlyData = List<int>.from(
          data['hourly_distribution'] ?? List.filled(24, 0),
        );
        final dailyData = List<dynamic>.from(data['daily_trend'] ?? []);
        final stats = data['stats'] ?? {};
        final dayNightCondition = data['day_night_condition'] ?? {};
        final dailyHourly = List<dynamic>.from(data['daily_hourly'] ?? []);
        final sunInfo = List<dynamic>.from(data['sun_info'] ?? []);

        return LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 800;

            final roseChartSection = Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.hourlyDistributionDetections,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.cardElevated,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.divider.withValues(alpha: 0.1),
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: RoseChartWidget(hourlyData: hourlyData),
                  ),
                ),
              ],
            );

            final radarChartSection = Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.dayNightWeatherProfile,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 16),
                if (isDesktop)
                  Expanded(
                    child: _buildDayNightRadarChart(
                      context,
                      Map<String, dynamic>.from(dayNightCondition),
                      height: null,
                    ),
                  )
                else
                  _buildDayNightRadarChart(
                    context,
                    Map<String, dynamic>.from(dayNightCondition),
                    height: 260,
                  ),
                const SizedBox(height: 16),
                _buildWeatherImpactGrid(
                  context,
                  Map<String, dynamic>.from(dayNightCondition),
                ),
              ],
            );

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TrendsSpeciesHeader(
                    sciName: _appliedSpecies!,
                    comName: stats['Com_Name'] ?? '',
                    periodStats: Map<String, dynamic>.from(stats),
                    dailyData: dailyData,
                  ),
                  const SizedBox(height: 24),
                  if (isDesktop)
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(child: roseChartSection),
                          const SizedBox(width: 24),
                          Expanded(child: radarChartSection),
                        ],
                      ),
                    )
                  else ...[
                    roseChartSection,
                    const SizedBox(height: 24),
                    radarChartSection,
                  ],
                  const SizedBox(height: 32),
                  Text(
                    AppLocalizations.of(context)!.dailyDetections,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.cardElevated,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.divider.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _showTemp,
                                  activeColor: Colors.orangeAccent,
                                  onChanged: (val) =>
                                      setState(() => _showTemp = val ?? false),
                                ),
                                Text(
                                   AppLocalizations.of(context)!.temperature,
                                   style: const TextStyle(fontSize: 13),),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Row(
                              children: [
                                Checkbox(
                                  value: _showWind,
                                  activeColor: Colors.cyanAccent,
                                  onChanged: (val) =>
                                      setState(() => _showWind = val ?? false),
                                ),
                                Text(
                                   AppLocalizations.of(context)!.wind,
                                   style: const TextStyle(fontSize: 13),),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 240,
                          child: TimelineChartWidget(
                            dailyData: dailyData,
                            showTemp: _showTemp,
                            showWind: _showWind,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    AppLocalizations.of(context)!.densityMapSunInfo,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  TrendsHeatmapWidget(
                    dailyHourly: dailyHourly,
                    sunInfo: sunInfo,
                    startDate: DateFormat('yyyy-MM-dd').format(_appliedFromDate!),
                    endDate: DateFormat('yyyy-MM-dd').format(_appliedToDate!),
                  ),
                ],
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Center(child: Text(AppLocalizations.of(context)!.errorMsgSimple(e.toString()))),
    );
  }

  Widget _buildStatsRow(Map<dynamic, dynamic> stats) {
    final total = stats['total'] ?? 0;
    final maxConf = (stats['max_confidence'] as num?)?.toDouble() ?? 0.0;
    final avgConf = (stats['avg_confidence'] as num?)?.toDouble() ?? 0.0;

    return Row(
      children: [
        _statBox(AppLocalizations.of(context)!.detectionsTotal, '$total'),
        const SizedBox(width: 8),
        _statBox(AppLocalizations.of(context)!.maxConfidenceLabel, '${(maxConf * 100).toStringAsFixed(1)}%'),
        const SizedBox(width: 8),
        _statBox(AppLocalizations.of(context)!.averageConfidenceLabel, '${(avgConf * 100).toStringAsFixed(1)}%'),
      ],
    );
  }

  Widget _statBox(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardElevated,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryLight,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: AppColors.textHint),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayNightRadarChart(
    BuildContext context,
    Map<String, dynamic> data, {
    double? height,
  }) {
    if (data.isEmpty) return const SizedBox.shrink();

    final day = Map<String, dynamic>.from(data['day'] ?? {});
    final night = Map<String, dynamic>.from(data['night'] ?? {});

    final conditions = [
      'Clear',
      'Cloudy',
      'Fog',
      'Rain',
      'Snow',
      'Thunderstorm',
    ];
    double maxVal = 1.0;
    for (final c in conditions) {
      if ((day[c] ?? 0) > maxVal) maxVal = (day[c] ?? 0).toDouble();
      if ((night[c] ?? 0) > maxVal) maxVal = (night[c] ?? 0).toDouble();
    }

    return Container(
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardElevated,
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
                    dataEntries: conditions
                        .map((c) => RadarEntry(value: (day[c] ?? 0).toDouble()))
                        .toList(),
                  ),
                  RadarDataSet(
                    fillColor: Colors.deepPurpleAccent.withValues(alpha: 0.2),
                    borderColor: Colors.deepPurpleAccent,
                    entryRadius: 3,
                    borderWidth: 2,
                    dataEntries: conditions
                        .map(
                          (c) => RadarEntry(value: (night[c] ?? 0).toDouble()),
                        )
                        .toList(),
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
                ticksTextStyle: TextStyle(
                  color: AppColors.textHint,
                  fontSize: 9,
                ),
                tickCount: 3,
                radarBorderData: BorderSide(color: AppColors.divider),
                tickBorderData: BorderSide(
                  color: AppColors.divider.withValues(alpha: 0.4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendDot(Colors.amber, AppLocalizations.of(context)!.dayLegend),
              const SizedBox(width: 16),
              _buildLegendDot(Colors.deepPurpleAccent, AppLocalizations.of(context)!.nightLegend),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherImpactGrid(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    if (data.isEmpty) return const SizedBox.shrink();

    final day = Map<String, dynamic>.from(data['day'] ?? {});
    final night = Map<String, dynamic>.from(data['night'] ?? {});
    final conditions = [
      'Clear',
      'Cloudy',
      'Fog',
      'Rain',
      'Snow',
      'Thunderstorm',
    ];

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1.3,
      children: conditions.map((c) {
        final dayVal = (day[c] ?? 0) as num;
        final nightVal = (night[c] ?? 0) as num;
        final total = dayVal + nightVal;
        return _weatherImpactBox(
          _translateCondition(c),
          total.toInt(),
          _getConditionIcon(c),
        );
      }).toList(),
    );
  }

  Widget _weatherImpactBox(String label, int count, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardElevated,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider.withValues(alpha: 0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primaryLight, size: 24),
          const SizedBox(height: 8),
          Text(
            '$count',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 11, color: AppColors.textHint),
          ),
        ],
      ),
    );
  }

  IconData _getConditionIcon(String c) {
    switch (c) {
      case 'Clear':
        return Icons.wb_sunny;
      case 'Cloudy':
        return Icons.cloud;
      case 'Fog':
        return Icons.dehaze;
      case 'Rain':
        return Icons.umbrella;
      case 'Snow':
        return Icons.ac_unit;
      case 'Thunderstorm':
        return Icons.thunderstorm;
      default:
        return Icons.wb_cloudy;
    }
  }

  Widget _buildLegendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String _translateCondition(String condition) {
    final map = {
      'Clear': AppLocalizations.of(context)!.weatherClear,
      'Cloudy': AppLocalizations.of(context)!.weatherCloudy,
      'Fog': AppLocalizations.of(context)!.weatherFog,
      'Rain': AppLocalizations.of(context)!.weatherRain,
      'Snow': AppLocalizations.of(context)!.weatherSnow,
      'Thunderstorm': AppLocalizations.of(context)!.weatherThunderstorm,
    };
    return map[condition] ?? condition;
  }
}

class RoseChartWidget extends StatelessWidget {
  final List<int> hourlyData;

  const RoseChartWidget({super.key, required this.hourlyData});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RoseChartPainter(
        hourlyData,
        Theme.of(context).textTheme.bodySmall?.color ?? Colors.grey.shade700,
      ),
      child: Container(),
    );
  }
}

class RoseChartPainter extends CustomPainter {
  final List<int> hourlyData;
  final Color labelColor;
  RoseChartPainter(this.hourlyData, this.labelColor);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;

    final maxVal = hourlyData.reduce((a, b) => a > b ? a : b);
    if (maxVal == 0) return;

    final paint = Paint()..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.grey.withValues(alpha: 0.15)
      ..strokeWidth = 1;

    for (int ring = 1; ring <= 3; ring++) {
      canvas.drawCircle(center, radius * (ring / 3), strokePaint);
    }

    const double angleStep = 2 * 3.141592653589793 / 24;

    for (int i = 0; i < 24; i++) {
      if (hourlyData[i] == 0) continue;

      double currentRadius = radius * (hourlyData[i] / maxVal);
      final rect = Rect.fromCircle(center: center, radius: currentRadius);

      paint.color = Colors.green.withValues(
        alpha: 0.5 + 0.5 * (hourlyData[i] / maxVal),
      );

      canvas.drawArc(
        rect,
        i * angleStep - (3.14159 / 2),
        angleStep - 0.02,
        true,
        paint,
      );
    }

    final textPainter = TextPainter(textDirection: ui.TextDirection.ltr);
    for (int i = 0; i < 24; i += 2) {
      double angle = i * angleStep - (3.14159 / 2);
      double dx = center.dx + (radius + 10) * math.cos(angle);
      double dy = center.dy + (radius + 10) * math.sin(angle);

      final hourStr = i == 0
          ? '12am'
          : (i < 12 ? '${i}am' : (i == 12 ? '12pm' : '${i - 12}pm'));
      textPainter.text = TextSpan(
        text: hourStr,
        style: TextStyle(
          fontSize: 10,
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}



class _FilterTile extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const _FilterTile({
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.cardElevated,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.divider.withValues(alpha: 0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 11, color: AppColors.textHint),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

class TrendsSpeciesHeader extends ConsumerStatefulWidget {
  final String sciName;
  final String comName;
  final Map<String, dynamic> periodStats;
  final List<dynamic> dailyData;

  const TrendsSpeciesHeader({
    super.key,
    required this.sciName,
    required this.comName,
    required this.periodStats,
    required this.dailyData,
  });

  @override
  ConsumerState<TrendsSpeciesHeader> createState() =>
      _TrendsSpeciesHeaderState();
}

class _TrendsSpeciesHeaderState extends ConsumerState<TrendsSpeciesHeader> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlayerLoading = false;
  bool _mediaMissing = false;
  double? _dragValue;
  String? _error;
  String? _blobUrl;

  @override
  void initState() {
    super.initState();
    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        if (kIsWeb) {
          _player.stop();
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
    if (kIsWeb && _blobUrl != null) {
      html.Url.revokeObjectUrl(_blobUrl!);
    }
    super.dispose();
  }

  Future<void> _initAudio(String fileName) async {
    final api = ref.read(apiServiceProvider);
    final url = api.getAudioUrl(fileName);

    try {
      setState(() {
        _isPlayerLoading = true;
        _mediaMissing = false;
        _error = null;
      });

      if (kIsWeb) {
        if (_blobUrl != null) {
          await _player.setAudioSource(
            AudioSource.uri(Uri.parse(_blobUrl!)),
            preload: true,
          );
          setState(() => _isPlayerLoading = false);
          return;
        }

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
      } else {
        final bytes = await api.downloadAudioBytes(url);
        String mime = 'audio/wav';
        if (fileName.toLowerCase().endsWith('.mp3')) mime = 'audio/mpeg';
        if (fileName.toLowerCase().endsWith('.flac')) mime = 'audio/flac';
        final base64String = base64Encode(bytes);
        final dataUrl = 'data:$mime;base64,$base64String';
        await _player.setAudioSource(
          AudioSource.uri(Uri.parse(dataUrl)),
          preload: true,
        );
      }
      setState(() => _isPlayerLoading = false);
    } catch (e) {
      if (mounted) {
        setState(() {
          _isPlayerLoading = false;
          _mediaMissing = true;
          _error = AppLocalizations.of(context)!.errorLoadingAudioLabel;
        });
      }
    }
  }

  void _stop() {
    _player.pause().then((_) => _player.seek(Duration.zero));
    setState(() => _dragValue = null);
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return 'N/D';
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (_) {
      return dateStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(speciesDetailProvider(widget.sciName), (previous, next) {
      if (next.hasValue && next.value!.bestDetection != null) {
        if (_player.processingState == ProcessingState.idle) {
          _initAudio(next.value!.bestDetection!.extractedPath);
        }
      }
    });

    final detailAsync = ref.watch(speciesDetailProvider(widget.sciName));
    final imageAsync = ref.watch(speciesImageProvider(widget.sciName));

    return detailAsync.when(
      data: (detail) {
        final bool isDesktop = MediaQuery.of(context).size.width > 700;

        final totalCount = widget.periodStats['total'] ?? 0;
        final maxConf = (widget.periodStats['max_confidence'] as num?)?.toDouble() ?? 0.0;
        final avgConf = (widget.periodStats['avg_confidence'] as num?)?.toDouble() ?? 0.0;
        final firstSeen = detail.firstSeen;
        final lastSeen = detail.lastSeen;
        final firstSeenPeriod = widget.periodStats['first_seen'] as String?;
        final lastSeenPeriod = widget.periodStats['last_seen'] as String?;

        Widget statsContent = Column(
          children: [
            Row(
              children: [
                _statItemCard(
                  Icons.history,
                  detail.detectionCount.toString(),
                  AppLocalizations.of(context)!.totalAllTime,
                ),
                _statItemCard(
                  Icons.sensors,
                  totalCount.toString(),
                  AppLocalizations.of(context)!.detectionsLabel,
                ),
                _statItemCard(
                  Icons.query_stats,
                  '${(maxConf * 100).toStringAsFixed(0)}%',
                  AppLocalizations.of(context)!.maxConfidenceLabel,
                ),
                _statItemCard(
                  Icons.leaderboard,
                  '${(avgConf * 100).toStringAsFixed(0)}%',
                  AppLocalizations.of(context)!.averageConfidenceLabel,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _statItemCard(
                  Icons.calendar_today,
                  _formatDate(firstSeen),
                  AppLocalizations.of(context)!.firstSeen,
                ),
                _statItemCard(
                  Icons.calendar_today,
                  _formatDate(lastSeen),
                  AppLocalizations.of(context)!.lastSeen,
                ),
                _statItemCard(
                  Icons.event,
                  _formatDate(firstSeenPeriod),
                  AppLocalizations.of(context)!.firstSeenPeriod,
                ),
                _statItemCard(
                  Icons.event,
                  _formatDate(lastSeenPeriod),
                  AppLocalizations.of(context)!.lastSeenPeriod,
                ),
              ],
            ),
          ],
        );

        Widget imageWidgetContent(bool constrained) {
          return imageAsync.when(
            data: (imageMap) {
              final base64String = imageMap?['base64_data'] as String?;
              final imageUrl = imageMap?['image_url'] as String?;

              Widget image;
              if (base64String != null && base64String.isNotEmpty) {
                try {
                  final bytes = base64Decode(base64String.split(',').last);
                  image = Image.memory(
                    bytes,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _defaultImage(),
                  );
                } catch (e) {
                  image = _defaultImage();
                }
              } else if (imageUrl != null && imageUrl.isNotEmpty) {
                image = CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.card,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => _defaultImage(),
                );
              } else {
                image = _defaultImage();
              }

              return AspectRatio(
                aspectRatio: 1.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: image,
                ),
              );
            },
            loading: () => const AspectRatio(
              aspectRatio: 1.0,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            ),
            error: (_, __) => const AspectRatio(
              aspectRatio: 1.0,
              child: Center(child: Icon(Icons.image_not_supported, size: 40)),
            ),
          );
        }

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardElevated,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.divider.withValues(alpha: 0.1)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                detail.comName.isNotEmpty ? detail.comName : widget.comName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.sciName,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: AppColors.textSecondary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),

              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 220),
                      child: imageWidgetContent(true),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: statsContent),
                  ],
                )
              else
                Column(
                  children: [
                    imageWidgetContent(false),
                    const SizedBox(height: 16),
                    statsContent,
                  ],
                ),

              const SizedBox(height: 16),
              if (detail.infoUrl != null && detail.infoUrl!.isNotEmpty)
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton.icon(
                    onPressed: () async {
                      final url = Uri.parse(detail.infoUrl!);
                      if (await canLaunchUrl(url)) await launchUrl(url);
                    },
                    icon: Icon(Icons.open_in_new, size: 18),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.externalSheet,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              if (detail.bestDetection != null &&
                  detail.bestDetection!.extractedPath.isNotEmpty &&
                  !_mediaMissing) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.bestDetection,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.audio_file,
                            color: AppColors.primaryLight,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '${detail.bestDetection!.date} ${detail.bestDetection!.time}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      StreamBuilder<Duration>(
                        stream: _player.positionStream,
                        builder: (context, snapshot) {
                          final position = snapshot.data ?? Duration.zero;
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
                                  thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 6,
                                  ),
                                  trackHeight: 3,
                                ),
                                child: Slider(
                                  value: (_dragValue ?? progress).clamp(
                                    0.0,
                                    1.0,
                                  ),
                                  onChanged: duration.inMilliseconds > 0
                                      ? (v) => setState(() => _dragValue = v)
                                      : null,
                                  onChangeEnd: duration.inMilliseconds > 0
                                      ? (v) async {
                                          final target = Duration(
                                            milliseconds:
                                                (v * duration.inMilliseconds)
                                                    .toInt(),
                                          );
                                          await _player.seek(target);
                                          if (mounted)
                                            setState(() => _dragValue = null);
                                        }
                                      : null,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _formatDuration(position),
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: AppColors.textHint,
                                    ),
                                  ),
                                  Text(
                                    _formatDuration(duration),
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: AppColors.textHint,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.stop_rounded),
                            iconSize: 28,
                            color: AppColors.textSecondary,
                            onPressed: _stop,
                          ),
                          const SizedBox(width: 12),
                          StreamBuilder<PlayerState>(
                            stream: _player.playerStateStream,
                            builder: (context, snapshot) {
                              final playing = snapshot.data?.playing ?? false;
                              if (_isPlayerLoading)
                                return const SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                );
                              return Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryLight,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    playing
                                        ? Icons.pause_rounded
                                        : Icons.play_arrow_rounded,
                                    color: Colors.black,
                                  ),
                                  onPressed: () => playing
                                      ? _player.pause()
                                      : _player.play(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
      loading: () => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardElevated,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Container(
        padding: const EdgeInsets.all(16),
        child: Center(child: Text(AppLocalizations.of(context)!.speciesDetailsError(e.toString()))),
      ),
    );
  }

  Widget _statItemCard(IconData icon, String value, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.divider.withValues(alpha: 0.1)),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primaryLight, size: 22),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 10, color: AppColors.textHint),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _defaultImage() {
    return Container(
      color: AppColors.card,
      child: const Center(child: Icon(Icons.image_not_supported, size: 40)),
    );
  }
}
