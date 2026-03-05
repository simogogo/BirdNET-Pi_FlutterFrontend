import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../services/api_service.dart';
import '../../providers/detections_provider.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';
import 'species_hourly_heatmap.dart';

class ChartsScreen extends ConsumerStatefulWidget {
  const ChartsScreen({super.key});

  @override
  ConsumerState<ChartsScreen> createState() => _ChartsScreenState();
}

class _ChartsScreenState extends ConsumerState<ChartsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.charts),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: AppLocalizations.of(context)!.tooltipOpenMenu,
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: const [AuthLockIcon()],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primaryLight,
          labelColor: AppColors.primaryLight,
          unselectedLabelColor: AppColors.textHint,
          tabs: [
            Tab(
              text: AppLocalizations.of(context)!.daily,
              icon: const Icon(Icons.today),
            ),
            Tab(
              text: AppLocalizations.of(context)!.weekly,
              icon: const Icon(Icons.date_range),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [_DailyChartTab(), _WeeklyChartTab()],
      ),
    );
  }
}

class _DailyChartTab extends ConsumerStatefulWidget {
  const _DailyChartTab();

  @override
  ConsumerState<_DailyChartTab> createState() => _DailyChartTabState();
}

class _DailyChartTabState extends ConsumerState<_DailyChartTab> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('yyyy-MM-dd').format(_selectedDate);

    return Column(
      children: [
        // Date navigation
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: AppColors.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: AppColors.primaryLight,
                ),
                tooltip: AppLocalizations.of(context)!.tooltipPreviousDay,
                onPressed: () {
                  setState(
                    () => _selectedDate = _selectedDate.subtract(
                      const Duration(days: 1),
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () => _pickDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primaryLight.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: AppColors.primaryLight,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        DateFormat(
                          'dd MMMM yyyy',
                          Localizations.localeOf(context).languageCode,
                        ).format(_selectedDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.chevron_right,
                  color: AppColors.primaryLight,
                ),
                tooltip: AppLocalizations.of(context)!.tooltipNextDay,
                onPressed: _selectedDate.isBefore(DateTime.now())
                    ? () {
                        setState(
                          () => _selectedDate = _selectedDate.add(
                            const Duration(days: 1),
                          ),
                        );
                      }
                    : null,
              ),
            ],
          ),
        ),
        // Charts
        Expanded(
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity != null) {
                if (details.primaryVelocity! > 0) {
                  setState(
                    () => _selectedDate = _selectedDate.subtract(
                      const Duration(days: 1),
                    ),
                  );
                } else if (details.primaryVelocity! < 0 &&
                    _selectedDate.isBefore(DateTime.now())) {
                  setState(
                    () => _selectedDate = _selectedDate.add(
                      const Duration(days: 1),
                    ),
                  );
                }
              }
            },
            child: Consumer(
              builder: (context, ref, child) {
                final chartDataAsync = ref.watch(
                  dailyChartDataProvider(dateStr),
                );

                return chartDataAsync.when(
                  data: (data) {
                    final hourlyCounts = List<dynamic>.from(
                      data['species_hourly_counts'] ?? [],
                    );

                    return ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        if (hourlyCounts.isNotEmpty)
                          SpeciesHourlyHeatmapWidget(hourlyCounts: hourlyCounts)
                        else
                          Center(
                            child: Text(
                              AppLocalizations.of(context)!.noChartAvailable,
                              style: const TextStyle(color: AppColors.textHint),
                            ),
                          ),
                      ],
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryLight,
                    ),
                  ),
                  error: (e, _) => Center(
                    child: Text(
                      'Errore: $e',
                      style: const TextStyle(color: AppColors.error),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primaryLight,
              onPrimary: Colors.black,
              surface: AppColors.surface,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }
}

class _WeeklyChartTab extends ConsumerStatefulWidget {
  const _WeeklyChartTab();

  @override
  ConsumerState<_WeeklyChartTab> createState() => _WeeklyChartTabState();
}

class _WeeklyChartTabState extends ConsumerState<_WeeklyChartTab> {
  late DateTime _selectedWeeklyDate;

  @override
  void initState() {
    super.initState();
    _selectedWeeklyDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final api = ref.watch(apiServiceProvider);
    final dateStr = DateFormat('yyyy-MM-dd').format(_selectedWeeklyDate);

    return Column(
      children: [
        // Date navigation
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: AppColors.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: AppColors.primaryLight,
                ),
                onPressed: () {
                  setState(
                    () => _selectedWeeklyDate = _selectedWeeklyDate.subtract(
                      const Duration(days: 7),
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () => _pickWeeklyDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primaryLight.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.date_range,
                        size: 16,
                        color: AppColors.primaryLight,
                      ),
                      const SizedBox(width: 8),
                      // Calculate ISO week number
                      Builder(
                        builder: (context) {
                          final thursday = _selectedWeeklyDate.add(
                            Duration(days: 4 - _selectedWeeklyDate.weekday),
                          );

                          final firstThursday = DateTime(thursday.year, 1, 1)
                              .add(
                                Duration(
                                  days:
                                      (4 -
                                          DateTime(
                                            thursday.year,
                                            1,
                                            1,
                                          ).weekday) %
                                      7,
                                ),
                              );

                          final weekNumber =
                              1 +
                              ((thursday.difference(firstThursday).inDays) / 7)
                                  .floor();
                          final year = thursday.year;

                          return Text(
                            AppLocalizations.of(
                              context,
                            )!.weekStr(weekNumber, year),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.chevron_right,
                  color: AppColors.primaryLight,
                ),
                onPressed:
                    _selectedWeeklyDate
                        .add(const Duration(days: 7))
                        .isAfter(DateTime.now())
                    ? null
                    : () {
                        setState(
                          () => _selectedWeeklyDate = _selectedWeeklyDate.add(
                            const Duration(days: 7),
                          ),
                        );
                      },
              ),
            ],
          ),
        ),
        // Chart / Report
        Expanded(
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity != null) {
                if (details.primaryVelocity! > 0) {
                  setState(
                    () => _selectedWeeklyDate = _selectedWeeklyDate.subtract(
                      const Duration(days: 7),
                    ),
                  );
                } else if (details.primaryVelocity! < 0 &&
                    !_selectedWeeklyDate
                        .add(const Duration(days: 7))
                        .isAfter(DateTime.now())) {
                  setState(
                    () => _selectedWeeklyDate = _selectedWeeklyDate.add(
                      const Duration(days: 7),
                    ),
                  );
                }
              }
            },
            child: FutureBuilder<Map<String, dynamic>>(
              future: api.getWeeklyReport(date: dateStr),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryLight,
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
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
                          '${AppLocalizations.of(context)!.errorOccurred}: ${snapshot.error}',
                          style: const TextStyle(color: AppColors.error),
                        ),
                      ],
                    ),
                  );
                }

                final data = snapshot.data ?? {};
                final species = List<Map<String, dynamic>>.from(
                  data['species'] ?? [],
                );
                final newSpecies = List<String>.from(data['new_species'] ?? []);

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.primaryLight.withValues(
                              alpha: 0.2,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryLight.withValues(
                                      alpha: 0.15,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.assessment,
                                    color: AppColors.primaryLight,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.weeklyReport,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${data['period_start'] ?? ''} — ${data['period_end'] ?? ''}',
                                      style: const TextStyle(
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
                                _weekStat(
                                  AppLocalizations.of(context)!
                                      .detectionsCount(0)
                                      .replaceAll(' 0', '')
                                      .replaceAll('0 ', '')
                                      .trim(),
                                  '${data['total_detections'] ?? 0}',
                                  data['total_percent_change'],
                                ),
                                const SizedBox(width: 12),
                                _weekStat(
                                  AppLocalizations.of(
                                    context,
                                  )!.speciesToday.split('\n').first,
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
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight.withValues(
                              alpha: 0.08,
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
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
                                      (s) => Chip(
                                        label: Text(
                                          s,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                        backgroundColor: AppColors.card,
                                        side: BorderSide.none,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                      // Species list
                      const SizedBox(height: 16),
                      ...species
                          .take(20)
                          .map(
                            (sp) => Container(
                              margin: const EdgeInsets.only(bottom: 6),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.card,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          sp['Com_Name'] ?? '',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                        if (sp['is_new'] == true)
                                          Text(
                                            AppLocalizations.of(
                                              context,
                                            )!.newFemale,
                                            style: const TextStyle(
                                              fontSize: 11,
                                              color: AppColors.primaryLight,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '${sp['count'] ?? 0}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColors.primaryLight,
                                    ),
                                  ),
                                  if (sp['percent_change'] != null) ...[
                                    const SizedBox(width: 8),
                                    Icon(
                                      (sp['percent_change'] as num) >= 0
                                          ? Icons.arrow_upward
                                          : Icons.arrow_downward,
                                      size: 14,
                                      color: (sp['percent_change'] as num) >= 0
                                          ? AppColors.success
                                          : AppColors.error,
                                    ),
                                    Text(
                                      '${(sp['percent_change'] as num).abs()}%',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color:
                                            (sp['percent_change'] as num) >= 0
                                            ? AppColors.success
                                            : AppColors.error,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _weekStat(String label, String value, dynamic pctChange) {
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
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryLight,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: AppColors.textHint),
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

  Future<void> _pickWeeklyDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedWeeklyDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primaryLight,
              onPrimary: Colors.black,
              surface: AppColors.surface,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _selectedWeeklyDate = picked);
    }
  }
}
