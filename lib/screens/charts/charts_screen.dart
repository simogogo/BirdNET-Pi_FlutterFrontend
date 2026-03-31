import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../services/api_service.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';
import 'report_content_view.dart';

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
    _tabController = TabController(length: 3, vsync: this);
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
        actions: [AuthLockIcon()],
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
            Tab(
              text: AppLocalizations.of(context)!.monthly,
              icon: const Icon(Icons.event),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _DailyChartTab(),
          _WeeklyChartTab(),
          _MonthlyChartTab(),
        ],
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: AppColors.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left, color: AppColors.primaryLight),
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
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: AppColors.primaryLight,
                      ),
                      SizedBox(width: 8),
                      Text(
                        DateFormat(
                          'dd MMMM yyyy',
                          Localizations.localeOf(context).languageCode,
                        ).format(_selectedDate),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right, color: AppColors.primaryLight),
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
        // Chart / Report
        ReportContentView(
          future: ref.read(apiServiceProvider).getDailyReport(date: dateStr),
          reportTitle: AppLocalizations.of(context)!.daily,
          reportIcon: Icons.today,
          fromDate: dateStr,
          toDate: dateStr,
          reportType: ReportType.daily,
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
            colorScheme: ColorScheme.dark(
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
    final monday = _selectedWeeklyDate.subtract(
      Duration(days: _selectedWeeklyDate.weekday - 1),
    );
    final sunday = _selectedWeeklyDate.add(
      Duration(days: 7 - _selectedWeeklyDate.weekday),
    );
    final fromStr = DateFormat('yyyy-MM-dd').format(monday);
    final toStr = DateFormat('yyyy-MM-dd').format(sunday);

    return Column(
      children: [
        // Date navigation
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: AppColors.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left, color: AppColors.primaryLight),
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
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      Icon(
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
                            style: TextStyle(
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
                icon: Icon(Icons.chevron_right, color: AppColors.primaryLight),
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
        ReportContentView(
          future: api.getWeeklyReport(date: dateStr),
          reportTitle: AppLocalizations.of(context)!.weeklyReport,
          reportIcon: Icons.assessment,
          fromDate: fromStr,
          toDate: toStr,
          reportType: ReportType.weekly,
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
        ),
      ],
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
            colorScheme: ColorScheme.dark(
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

class _MonthlyChartTab extends ConsumerStatefulWidget {
  const _MonthlyChartTab();

  @override
  ConsumerState<_MonthlyChartTab> createState() => _MonthlyChartTabState();
}

class _MonthlyChartTabState extends ConsumerState<_MonthlyChartTab> {
  late DateTime _selectedMonthlyDate;

  @override
  void initState() {
    super.initState();
    _selectedMonthlyDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final api = ref.watch(apiServiceProvider);
    final dateStr = DateFormat('yyyy-MM-dd').format(_selectedMonthlyDate);
    final firstDay = DateTime(
      _selectedMonthlyDate.year,
      _selectedMonthlyDate.month,
      1,
    );
    final lastDay = DateTime(
      _selectedMonthlyDate.year,
      _selectedMonthlyDate.month + 1,
      0,
    );
    final fromStr = DateFormat('yyyy-MM-dd').format(firstDay);
    final toStr = DateFormat('yyyy-MM-dd').format(lastDay);

    return Column(
      children: [
        // Date navigation
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: AppColors.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left, color: AppColors.primaryLight),
                onPressed: () {
                  setState(
                    () => _selectedMonthlyDate = DateTime(
                      _selectedMonthlyDate.year,
                      _selectedMonthlyDate.month - 1,
                      _selectedMonthlyDate.day,
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () => _pickMonthlyDate(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      Icon(
                        Icons.event,
                        size: 16,
                        color: AppColors.primaryLight,
                      ),
                      SizedBox(width: 8),
                      Text(
                        DateFormat(
                          'MMMM yyyy',
                          Localizations.localeOf(context).languageCode,
                        ).format(_selectedMonthlyDate),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right, color: AppColors.primaryLight),
                onPressed:
                    DateTime(
                      _selectedMonthlyDate.year,
                      _selectedMonthlyDate.month + 1,
                      1,
                    ).isAfter(DateTime.now())
                    ? null
                    : () {
                        setState(
                          () => _selectedMonthlyDate = DateTime(
                            _selectedMonthlyDate.year,
                            _selectedMonthlyDate.month + 1,
                            _selectedMonthlyDate.day,
                          ),
                        );
                      },
              ),
            ],
          ),
        ),
        // Chart / Report
        ReportContentView(
          future: api.getMonthlyReport(date: dateStr),
          reportTitle: AppLocalizations.of(context)!.monthlyReport,
          reportIcon: Icons.event,
          fromDate: fromStr,
          toDate: toStr,
          reportType: ReportType.monthly,
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity != null) {
              if (details.primaryVelocity! > 0) {
                setState(
                  () => _selectedMonthlyDate = DateTime(
                    _selectedMonthlyDate.year,
                    _selectedMonthlyDate.month - 1,
                    _selectedMonthlyDate.day,
                  ),
                );
              } else if (details.primaryVelocity! < 0 &&
                  !DateTime(
                    _selectedMonthlyDate.year,
                    _selectedMonthlyDate.month + 1,
                    1,
                  ).isAfter(DateTime.now())) {
                setState(
                  () => _selectedMonthlyDate = DateTime(
                    _selectedMonthlyDate.year,
                    _selectedMonthlyDate.month + 1,
                    _selectedMonthlyDate.day,
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }

  Future<void> _pickMonthlyDate(BuildContext context) async {
    int selectedYear = _selectedMonthlyDate.year;

    final DateTime? picked = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: AppColors.surface,
              contentPadding: EdgeInsets.all(16),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: AppColors.primaryLight,
                    ),
                    onPressed: () => setDialogState(() => selectedYear--),
                  ),
                  Text(
                    selectedYear.toString(),
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      color: AppColors.primaryLight,
                    ),
                    onPressed: selectedYear >= DateTime.now().year
                        ? null
                        : () => setDialogState(() => selectedYear++),
                  ),
                ],
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    final month = index + 1;
                    final isCurrentSelection =
                        month == _selectedMonthlyDate.month &&
                        selectedYear == _selectedMonthlyDate.year;
                    final isFuture =
                        selectedYear == DateTime.now().year &&
                        month > DateTime.now().month;

                    final dateForMonthName = DateTime(selectedYear, month, 1);
                    final monthName = DateFormat(
                      'MMM',
                      Localizations.localeOf(context).languageCode,
                    ).format(dateForMonthName);

                    return InkWell(
                      onTap: isFuture
                          ? null
                          : () {
                              Navigator.pop(
                                context,
                                DateTime(selectedYear, month, 1),
                              );
                            },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isCurrentSelection
                              ? AppColors.primaryLight
                              : AppColors.cardElevated,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          monthName,
                          style: TextStyle(
                            color: isFuture
                                ? AppColors.textHint
                                : (isCurrentSelection
                                      ? Colors.black
                                      : AppColors.textPrimary),
                            fontWeight: isCurrentSelection
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );

    if (picked != null) {
      setState(() => _selectedMonthlyDate = picked);
    }
  }
}
