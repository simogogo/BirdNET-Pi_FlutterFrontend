import 'package:birdnet_pi_app/models/detection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../providers/detections_provider.dart';
import '../../services/api_service.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';
import '../../widgets/confidence_badge.dart';
import '../../widgets/detection_detail_sheet.dart';
import '../../widgets/section_header.dart';

class RecordingsScreen extends ConsumerStatefulWidget {
  final int? initialTab;
  final String? initialFromDate;
  final String? initialToDate;
  final String? initialFromTime;
  final String? initialToTime;
  final String? initialSpecies;
  final String? initialSearch;

  const RecordingsScreen({
    super.key,
    this.initialTab,
    this.initialFromDate,
    this.initialToDate,
    this.initialFromTime,
    this.initialToTime,
    this.initialSpecies,
    this.initialSearch,
  });

  @override
  ConsumerState<RecordingsScreen> createState() => _RecordingsScreenState();
}

class _RecordingsScreenState extends ConsumerState<RecordingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime _selectedDate = DateTime.now();

  // Period filters
  late DateTime _fromDate;
  late DateTime _toDate;
  late TimeOfDay _fromTime;
  late TimeOfDay _toTime;
  String? _selectedSpecies;

  // Applied filters (the ones actually used for fetching)
  late DateTime _appliedFromDate;
  late DateTime _appliedToDate;
  late TimeOfDay _appliedFromTime;
  late TimeOfDay _appliedToTime;
  String? _appliedSpecies;

  String _searchQuery = '';
  double _minConfidence = 0.0;
  bool _isGroupByTime = false;
  bool _isPeriodFilterOpen = true;

  @override
  void initState() {
    super.initState();
    _searchQuery = widget.initialSearch ?? '';
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialTab ?? 0,
    );

    // Initialize period filters from widget or defaults
    _fromDate =
        widget.initialFromDate != null && widget.initialFromDate!.isNotEmpty
        ? DateFormat('yyyy-MM-dd').parse(widget.initialFromDate!)
        : DateTime.now().subtract(const Duration(days: 7));

    _toDate = widget.initialToDate != null && widget.initialToDate!.isNotEmpty
        ? DateFormat('yyyy-MM-dd').parse(widget.initialToDate!)
        : DateTime.now();

    _fromTime =
        widget.initialFromTime != null && widget.initialFromTime!.isNotEmpty
        ? _parseTime(widget.initialFromTime!)
        : const TimeOfDay(hour: 0, minute: 0);

    _toTime = widget.initialToTime != null && widget.initialToTime!.isNotEmpty
        ? _parseTime(widget.initialToTime!)
        : const TimeOfDay(hour: 23, minute: 59);

    if (widget.initialSpecies != null && widget.initialSpecies!.isNotEmpty) {
      _selectedSpecies = widget.initialSpecies!;
    }

    _applyFilters();
  }

  void _applyFilters() {
    _appliedFromDate = _fromDate;
    _appliedToDate = _toDate;
    _appliedFromTime = _fromTime;
    _appliedToTime = _toTime;
    _appliedSpecies = _selectedSpecies;
  }

  TimeOfDay _parseTime(String timeStr) {
    try {
      final parts = timeStr.split(':');
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    } catch (e) {
      return const TimeOfDay(hour: 0, minute: 0);
    }
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
        title: Text(AppLocalizations.of(context)!.identifiedSpecies),
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
              text: AppLocalizations.of(context)!.byDate,
              icon: const Icon(Icons.calendar_today),
            ),
            Tab(
              text: AppLocalizations.of(context)!.bySpecies,
              icon: const Icon(Icons.pets),
            ),
            Tab(
              text: AppLocalizations.of(context)!.byPeriod,
              icon: const Icon(Icons.date_range),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildByDateTab(),
          _buildBySpeciesTab(),
          _buildByPeriodTab(),
        ],
      ),
    );
  }

  Widget _buildByDateTab() {
    final dateStr = DateFormat('yyyy-MM-dd').format(_selectedDate);
    final api = ref.watch(apiServiceProvider);

    return Column(
      children: [
        // View Toggle, Date selector, and Actions
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: AppColors.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left: View Mode Toggle
              IconButton(
                icon: Icon(_isGroupByTime ? Icons.pets : Icons.access_time),
                tooltip: _isGroupByTime
                    ? AppLocalizations.of(context)!.groupBySpecies
                    : AppLocalizations.of(context)!.groupByTime,
                onPressed: () =>
                    setState(() => _isGroupByTime = !_isGroupByTime),
              ),
              // Center: Date Controls
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        // We use the language code of the current locale for date formatting
                        DateFormat(
                          'dd/MM/yyyy',
                          Localizations.localeOf(context).languageCode,
                        ).format(_selectedDate),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      color: AppColors.primaryLight,
                    ),
                    tooltip: AppLocalizations.of(context)!.tooltipNextDay,
                    onPressed:
                        _selectedDate.isBefore(
                          DateTime.now().subtract(const Duration(days: 1)),
                        )
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
              // Right: Tab-Specific Actions
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    tooltip: AppLocalizations.of(context)!.filterDetections,
                    onPressed: () => _showFilterDialog(context),
                  ),
                  IconButton(
                    icon: const Icon(Icons.ios_share),
                    tooltip: AppLocalizations.of(context)!.exportToEbird(
                      DateFormat(
                        'dd/MM/yyyy',
                        Localizations.localeOf(context).languageCode,
                      ).format(_selectedDate),
                    ),
                    onPressed: () {
                      final formattedDate = DateFormat(
                        'yyyy-MM-dd',
                      ).format(_selectedDate);
                      context.push('/ebird-wizard?date=$formattedDate');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ref
              .watch(allDetectionsForDateProvider(dateStr))
              .when(
                data: (allDetectionsRaw) {
                  final allDetections = allDetectionsRaw
                      .where((d) => d.confidence >= _minConfidence)
                      .toList();

                  if (allDetections.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.folder_open,
                            size: 48,
                            color: AppColors.textHint,
                          ),
                          SizedBox(height: 12),
                          Text(
                            AppLocalizations.of(context)!.noRecordings,
                            style: TextStyle(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  if (_isGroupByTime) {
                    final byHour = <String, List<Detection>>{};
                    for (final d in allDetections) {
                      final hour = d.time.length >= 2
                          ? d.time.substring(0, 2)
                          : '00';
                      byHour.putIfAbsent(hour, () => []).add(d);
                    }
                    final sortedHours = byHour.keys.toList()
                      ..sort((a, b) => b.compareTo(a));

                    return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 80),
                      itemCount: sortedHours.length,
                      itemBuilder: (context, index) {
                        final hour = sortedHours[index];
                        final hourDetections = byHour[hour]!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionHeader(
                              title: '$hour:00 - $hour:59',
                              icon: Icons.schedule,
                              trailing: AppLocalizations.of(
                                context,
                              )!.detectionsCount(hourDetections.length),
                            ),
                            ...hourDetections.map(
                              (d) =>
                                  _buildDismissibleRecording(d, api, dateStr),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Group by species
                    final bySpecies = <String, List<Detection>>{};
                    for (final d in allDetections) {
                      bySpecies.putIfAbsent(d.commonName, () => []).add(d);
                    }

                    final sortedSpecies = bySpecies.keys.toList()..sort();

                    return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 80),
                      itemCount: sortedSpecies.length,
                      itemBuilder: (context, index) {
                        final speciesName = sortedSpecies[index];
                        final speciesDetections = bySpecies[speciesName]!;
                        final firstDetection = speciesDetections.first;

                        return ExpansionTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '${speciesDetections.length}',
                                style: TextStyle(
                                  color: AppColors.primaryLight,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            speciesName,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            firstDetection.scientificName,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                              color: AppColors.textHint,
                            ),
                          ),
                          children: speciesDetections.map((d) {
                            return _buildDismissibleRecording(d, api, dateStr);
                          }).toList(),
                        );
                      },
                    );
                  }
                },
                loading: () => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLight,
                  ),
                ),
                error: (e, _) => Center(
                  child: Text(
                    '${AppLocalizations.of(context)!.errorOccurred}: $e',
                    style: TextStyle(color: AppColors.error),
                  ),
                ),
              ),
        ),
      ],
    );
  }

  Widget _buildBySpeciesTab() {
    final speciesAsync = ref.watch(allSpeciesProvider);
    final api = ref.watch(apiServiceProvider);

    return Column(
      children: [
        // Search bar
        Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.searchSpecies,
              prefixIcon: Icon(Icons.search, color: AppColors.textHint),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.clear, color: AppColors.textHint),
                      onPressed: () => setState(() => _searchQuery = ''),
                    )
                  : null,
            ),
            onChanged: (v) => setState(() => _searchQuery = v),
          ),
        ),
        Expanded(
          child: speciesAsync.when(
            data: (allSpecies) {
              var filteredSpecies = allSpecies;
              if (_searchQuery.isNotEmpty) {
                final query = _searchQuery.toLowerCase();
                filteredSpecies = allSpecies.where((s) {
                  final comName =
                      (s['Com_Name'] as String?)?.toLowerCase() ?? '';
                  final sciName =
                      (s['Sci_Name'] as String?)?.toLowerCase() ?? '';
                  return comName.contains(query) || sciName.contains(query);
                }).toList();
              }

              if (filteredSpecies.isEmpty) {
                return Center(
                  child: Text(AppLocalizations.of(context)!.noSpeciesFound),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 80),
                itemCount: filteredSpecies.length,
                itemBuilder: (context, index) {
                  final species = filteredSpecies[index];
                  final comName =
                      species['Com_Name'] ??
                      AppLocalizations.of(context)!.unknown;
                  final sciName = species['Sci_Name'] ?? '';
                  final count = species['Count'] ?? 0;

                  return ExpansionTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '$count',
                          style: TextStyle(
                            color: AppColors.primaryLight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      comName,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      sciName,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: AppColors.textHint,
                      ),
                    ),
                    children: [
                      // Usiamo un Consumer per caricare le registrazioni solo quando il tile viene espanso
                      Consumer(
                        builder: (context, ref, child) {
                          final recordingsAsync = ref.watch(
                            recordingsForSpeciesProvider(sciName),
                          );

                          return recordingsAsync.when(
                            data: (recordings) {
                              if (recordings.isEmpty) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.noRecordingsAvailable,
                                  ),
                                );
                              }

                              return Column(
                                children: recordings.map<Widget>((r) {
                                  final d = Detection.fromJson(r);
                                  final spectrogramUrl = api
                                      .getSpectrogramImageUrl(d.extractedPath);
                                  return _buildRecordingTile(
                                    d,
                                    spectrogramUrl,
                                    api,
                                  );
                                }).toList(),
                              );
                            },
                            loading: () => Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(
                                color: AppColors.primaryLight,
                              ),
                            ),
                            error: (e, _) => Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                '${AppLocalizations.of(context)!.errorOccurred}: $e',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
            loading: () => Center(
              child: CircularProgressIndicator(color: AppColors.primaryLight),
            ),
            error: (e, _) => Center(
              child: Text('${AppLocalizations.of(context)!.errorOccurred}: $e'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecordingTile(dynamic d, String spectrogramUrl, ApiService api) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/waveform_placeholder.png',
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: 56,
              height: 56,
              color: AppColors.cardElevated,
              child: Icon(
                Icons.music_note,
                color: AppColors.textHint,
                size: 20,
              ),
            ),
          ),
        ),
        title: Text(
          d.commonName,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        subtitle: Text(
          '${d.date} ${d.time}',
          style: TextStyle(fontSize: 12, color: AppColors.textHint),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConfidenceBadge(confidence: d.confidence),
            SizedBox(width: 8),
            Icon(Icons.chevron_right, color: AppColors.textHint),
          ],
        ),
        onTap: () => _showDetectionDetail(d, api),
      ),
    );
  }

  Widget _buildDismissibleRecording(
    Detection d,
    ApiService api,
    String dateStr,
  ) {
    final spectrogramUrl = api.getSpectrogramImageUrl(d.extractedPath);
    final l10n = AppLocalizations.of(context)!;

    return Dismissible(
      key: Key(d.fileName),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        color: AppColors.error,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        final authState = ref.read(authProvider);
        if (!authState.isAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.loginRequired),
              backgroundColor: AppColors.error,
            ),
          );
          return false;
        }

        final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: AppColors.surface,
            title: Text(l10n.deleteRecording),
            content: Text(
              l10n.deleteRecordingConfirmation(d.commonName, d.date, d.time),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text(l10n.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(
                  l10n.delete,
                  style: TextStyle(color: AppColors.error),
                ),
              ),
            ],
          ),
        );

        if (confirmed != true) return false;

        final success = await api.deleteRecording(
          d.fileName,
          sciName: d.scientificName,
          date: d.date,
          time: d.time,
        );

        if (success) {
          return true;
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.errorOccurred),
                backgroundColor: AppColors.error,
              ),
            );
          }
          return false;
        }
      },
      onDismissed: (direction) {
        invalidateRecordings(ref);
      },
      child: _buildRecordingTile(d, spectrogramUrl, api),
    );
  }

  Widget _buildByPeriodTab() {
    final fromDateStr = DateFormat('yyyy-MM-dd').format(_appliedFromDate);
    final toDateStr = DateFormat('yyyy-MM-dd').format(_appliedToDate);
    final fromTimeStr =
        '${_appliedFromTime.hour.toString().padLeft(2, '0')}:${_appliedFromTime.minute.toString().padLeft(2, '0')}';
    final toTimeStr =
        '${_appliedToTime.hour.toString().padLeft(2, '0')}:${_appliedToTime.minute.toString().padLeft(2, '0')}';

    final speciesAsync = ref.watch(
      speciesByPeriodProvider((
        fromDate: fromDateStr,
        toDate: toDateStr,
        fromTime: fromTimeStr,
        toTime: toTimeStr,
      )),
    );

    final api = ref.watch(apiServiceProvider);

    return Column(
      children: [
        _buildPeriodFilters(),
        if (_searchQuery.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${AppLocalizations.of(context)!.searchSpeciesHint}: $_searchQuery',
                    style: TextStyle(
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 18),
                  onPressed: () => setState(() => _searchQuery = ''),
                ),
              ],
            ),
          ),
        Expanded(
          child: speciesAsync.when(
            data: (allSpecies) {
              // Client-side filtering
              final filteredSpecies = allSpecies.where((s) {
                final comName = (s['Com_Name'] ?? '').toString().toLowerCase();
                final sciName = (s['Sci_Name'] ?? '').toString().toLowerCase();

                // 1. Filter by selected species (exact match on Sci_Name OR Com_Name)
                if (_appliedSpecies != null && _appliedSpecies!.isNotEmpty) {
                  final applied = _appliedSpecies!.toLowerCase();
                  if (sciName != applied && comName != applied) {
                    return false;
                  }
                }

                // 2. Filter by search query (partial match)
                if (_searchQuery.isNotEmpty) {
                  final query = _searchQuery.toLowerCase();
                  if (!comName.contains(query) && !sciName.contains(query)) {
                    return false;
                  }
                }

                return true;
              }).toList();

              if (filteredSpecies.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 48,
                        color: AppColors.textHint,
                      ),
                      SizedBox(height: 12),
                      Text(
                        AppLocalizations.of(context)!.noResultsFound,
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 80),
                itemCount: filteredSpecies.length,
                itemBuilder: (context, index) {
                  final species = filteredSpecies[index];
                  final comName =
                      species['Com_Name'] ??
                      AppLocalizations.of(context)!.unknown;
                  final sciName = species['Sci_Name'] ?? '';
                  final count = species['Count'] ?? 0;

                  return ExpansionTile(
                    initiallyExpanded:
                        (_searchQuery.isNotEmpty &&
                            (sciName.toLowerCase() == _searchQuery.toLowerCase() ||
                             comName.toLowerCase() == _searchQuery.toLowerCase())) ||
                        (_selectedSpecies != null &&
                            (sciName.toLowerCase() == _selectedSpecies!.toLowerCase() ||
                             comName.toLowerCase() == _selectedSpecies!.toLowerCase())),
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '$count',
                          style: TextStyle(
                            color: AppColors.primaryLight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      comName,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      sciName,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: AppColors.textHint,
                      ),
                    ),
                    children: [
                      Consumer(
                        builder: (context, ref, child) {
                          final recordingsAsync = ref.watch(
                            recordingsForPeriodProvider((
                              species: sciName,
                              fromDate: fromDateStr,
                              toDate: toDateStr,
                              fromTime: fromTimeStr,
                              toTime: toTimeStr,
                            )),
                          );

                          return recordingsAsync.when(
                            data: (recordings) {
                              if (recordings.isEmpty) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.noRecordingsAvailable,
                                  ),
                                );
                              }

                              return Column(
                                children: recordings.map<Widget>((r) {
                                  final d = Detection.fromJson(r);
                                  final spectrogramUrl = api
                                      .getSpectrogramImageUrl(d.extractedPath);
                                  return _buildRecordingTile(
                                    d,
                                    spectrogramUrl,
                                    api,
                                  );
                                }).toList(),
                              );
                            },
                            loading: () => Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(
                                color: AppColors.primaryLight,
                              ),
                            ),
                            error: (e, _) => Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                '${AppLocalizations.of(context)!.errorOccurred}: $e',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
            loading: () => Center(
              child: CircularProgressIndicator(color: AppColors.primaryLight),
            ),
            error: (e, _) => Center(
              child: Text('${AppLocalizations.of(context)!.errorOccurred}: $e'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodFilters() {
    final l10n = AppLocalizations.of(context)!;
    // Detect cross-midnight range
    final isOvernight = _fromTime.hour > _toTime.hour ||
        (_fromTime.hour == _toTime.hour &&
            _fromTime.minute > _toTime.minute);

    return Container(
      color: AppColors.surface,
      child: Column(
        children: [
          // Collapsible filter content
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _isPeriodFilterOpen
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                    child: Column(
                      children: [
                        // 1. Species Selection (Autocomplete)
                        Consumer(
                          builder: (context, ref, child) {
                            final speciesAsync = ref.watch(allSpeciesProvider);
                            final l10n = AppLocalizations.of(context)!;

                            return speciesAsync.when(
                              data: (speciesList) {
                                return Autocomplete<Map<String, dynamic>>(
                                  displayStringForOption: (option) =>
                                      option['Com_Name'] ?? option['Sci_Name'],
                                  initialValue: TextEditingValue(
                                    text: _selectedSpecies != null
                                        ? (speciesList.firstWhere(
                                                (s) => s['Sci_Name'] == _selectedSpecies || s['Com_Name'] == _selectedSpecies,
                                                orElse: () => {'Com_Name': _selectedSpecies},
                                              )['Com_Name'] ??
                                          _selectedSpecies!)
                                        : '',
                                  ),
                                  optionsBuilder: (TextEditingValue textEditingValue) {
                                    if (textEditingValue.text.isEmpty) {
                                      return const Iterable<Map<String, dynamic>>.empty();
                                    }
                                    final query = textEditingValue.text.toLowerCase();
                                    return speciesList.where((s) {
                                      final common =
                                          (s['Com_Name'] as String?)?.toLowerCase() ?? '';
                                      final scientific =
                                          (s['Sci_Name'] as String?)?.toLowerCase() ?? '';
                                      return common.contains(query) ||
                                          scientific.contains(query);
                                    });
                                  },
                                  onSelected: (Map<String, dynamic> selection) {
                                    setState(() => _selectedSpecies = selection['Sci_Name']);
                                  },
                                  fieldViewBuilder:
                                      (context, controller, focusNode, onFieldSubmitted) {
                                        return TextField(
                                          controller: controller,
                                          focusNode: focusNode,
                                          decoration: InputDecoration(
                                            hintText: l10n.selectSpecies,
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
                                            filled: true,
                                            fillColor: AppColors.card,
                                            contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 12,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          onSubmitted: (value) => onFieldSubmitted(),
                                        );
                                      },
                                  optionsViewBuilder: (context, onSelected, options) {
                                    return Align(
                                      alignment: Alignment.topLeft,
                                      child: Material(
                                        elevation: 8,
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.surface,
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxHeight: 300,
                                            maxWidth: MediaQuery.of(context).size.width - 32,
                                          ),
                                          child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            itemCount: options.length,
                                            separatorBuilder: (context, index) =>
                                                const Divider(height: 1),
                                            itemBuilder: (context, index) {
                                              final option = options.elementAt(index);
                                              return ListTile(
                                                title: Text(
                                                  option['Com_Name'] ?? option['Sci_Name'],
                                                  style: TextStyle(fontSize: 14),
                                                ),
                                                subtitle: Text(
                                                  option['Sci_Name'],
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: AppColors.textHint,
                                                  ),
                                                ),
                                                onTap: () => onSelected(option),
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
                            );
                          },
                        ),
                        const SizedBox(height: 12),

                        // 2. Dates Row
                        Row(
                          children: [
                            Expanded(
                              child: _FilterTile(
                                label: l10n.fromDate,
                                value: DateFormat('dd/MM/yyyy').format(_fromDate),
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    initialDate: _fromDate,
                                    firstDate: DateTime(2020),
                                    lastDate: _toDate,
                                  );
                                  if (picked != null) setState(() => _fromDate = picked);
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _FilterTile(
                                label: l10n.toDate,
                                value: DateFormat('dd/MM/yyyy').format(_toDate),
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    initialDate: _toDate,
                                    firstDate: _fromDate,
                                    lastDate: DateTime.now(),
                                  );
                                  if (picked != null) setState(() => _toDate = picked);
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            IconButton.filled(
                              onPressed: () {
                                final fromDateStr = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(_appliedFromDate);
                                final toDateStr = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(_appliedToDate);
                                final fromTimeStr =
                                    '${_appliedFromTime.hour.toString().padLeft(2, '0')}:${_appliedFromTime.minute.toString().padLeft(2, '0')}';
                                final toTimeStr =
                                    '${_appliedToTime.hour.toString().padLeft(2, '0')}:${_appliedToTime.minute.toString().padLeft(2, '0')}';

                                ref.invalidate(
                                  speciesByPeriodProvider((
                                    fromDate: fromDateStr,
                                    toDate: toDateStr,
                                    fromTime: fromTimeStr,
                                    toTime: toTimeStr,
                                  )),
                                );
                              },
                              icon: Icon(Icons.refresh),
                              tooltip: l10n.tooltipRefreshData,
                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                                foregroundColor: AppColors.primaryLight,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // 3. Times Row
                        Row(
                          children: [
                            Expanded(
                              child: _FilterTile(
                                label: l10n.fromTime,
                                value: _fromTime.format(context),
                                onTap: () async {
                                  final picked = await showTimePicker(
                                    context: context,
                                    initialTime: _fromTime,
                                  );
                                  if (picked != null) setState(() => _fromTime = picked);
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _FilterTile(
                                label: l10n.toTime,
                                value: _toTime.format(context),
                                onTap: () async {
                                  final picked = await showTimePicker(
                                    context: context,
                                    initialTime: _toTime,
                                  );
                                  if (picked != null) setState(() => _toTime = picked);
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            IconButton.filled(
                              onPressed: () {
                                setState(() {
                                  _applyFilters();
                                });
                              },
                              icon: Icon(Icons.search),
                              tooltip: l10n.search,
                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.primaryLight,
                                foregroundColor: Colors.black,
                              ),
                            ),
                          ],
                        ),

                        // 4. Overnight indicator + Reset row
                        if (isOvernight)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.amber.withValues(alpha: 0.5),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.nightlight_round,
                                        size: 14,
                                        color: Colors.amber,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        l10n.overnightRange,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.amber,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                TextButton.icon(
                                  onPressed: _resetPeriodFilters,
                                  icon: Icon(Icons.restart_alt, size: 16),
                                  label: Text(l10n.resetFilters),
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.textHint,
                                    textStyle: const TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton.icon(
                              onPressed: _resetPeriodFilters,
                              icon: Icon(Icons.restart_alt, size: 16),
                              label: Text(l10n.resetFilters),
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.textHint,
                                textStyle: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          // Toggle arrow button
          InkWell(
            onTap: () => setState(() => _isPeriodFilterOpen = !_isPeriodFilterOpen),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border(
                  top: BorderSide(
                    color: AppColors.divider,
                    width: 1,
                  ),
                ),
              ),
              child: AnimatedRotation(
                turns: _isPeriodFilterOpen ? 0.0 : 0.5,
                duration: Duration(milliseconds: 300),
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: AppColors.textHint,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _resetPeriodFilters() {
    setState(() {
      _fromDate = DateTime.now().subtract(const Duration(days: 7));
      _toDate = DateTime.now();
      _fromTime = const TimeOfDay(hour: 0, minute: 0);
      _toTime = const TimeOfDay(hour: 23, minute: 59);
      _selectedSpecies = null;
      _applyFilters();
    });
  }

  void _showDetectionDetail(dynamic d, ApiService api) {
    final audioUrl = api.getAudioUrl(d.extractedPath);
    final spectrogramUrl = api.getSpectrogramImageUrl(d.extractedPath);

    showModalBottomSheet(
      context: context,
      useRootNavigator: false,
      backgroundColor: AppColors.surface,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => DetectionDetailSheet(
        detection: d,
        audioUrl: audioUrl,
        spectrogramUrl: spectrogramUrl,
        apiService: api,
        onDeleted: () {
          invalidateRecordings(ref);
        },
        onChanged: () {
          invalidateRecordings(ref);
        },
      ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(
            primary: AppColors.primaryLight,
            surface: AppColors.surface,
            onSurface: AppColors.textPrimary,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.filterDetections,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.minimumConfidenceThreshold,
              style: TextStyle(color: AppColors.textSecondary),
            ),
            StatefulBuilder(
              builder: (context, setLocalState) => Column(
                children: [
                  Slider(
                    value: _minConfidence,
                    min: 0,
                    max: 1,
                    divisions: 20,
                    label: '${(_minConfidence * 100).toStringAsFixed(0)}%',
                    onChanged: (v) {
                      setLocalState(() => _minConfidence = v);
                    },
                  ),
                  Text(
                    '${(_minConfidence * 100).toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _minConfidence = 0;
                      });
                      Navigator.pop(ctx);
                    },
                    child: Text(AppLocalizations.of(context)!.reset),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {});
                      Navigator.pop(ctx);
                    },
                    child: Text(AppLocalizations.of(context)!.apply),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
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
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.card,
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
