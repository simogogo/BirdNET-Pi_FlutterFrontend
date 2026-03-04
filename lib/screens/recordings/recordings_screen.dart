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
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';
import '../../widgets/detection_detail_sheet.dart';

class RecordingsScreen extends ConsumerStatefulWidget {
  const RecordingsScreen({super.key});

  @override
  ConsumerState<RecordingsScreen> createState() => _RecordingsScreenState();
}

class _RecordingsScreenState extends ConsumerState<RecordingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime _selectedDate = DateTime.now();
  String _searchQuery = '';
  double _minConfidence = 0.0;

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
        title: Text(AppLocalizations.of(context)!.identifiedSpecies),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: AppLocalizations.of(context)!.tooltipOpenMenu,
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.ios_share,
            ), // Share-like icon for eBird export
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
          IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: AppLocalizations.of(context)!.filterDetections,
            onPressed: () => _showFilterDialog(context),
          ),
          const AuthLockIcon(),
        ],
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
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildByDateTab(), _buildBySpeciesTab()],
      ),
    );
  }

  Widget _buildByDateTab() {
    final dateStr = DateFormat('yyyy-MM-dd').format(_selectedDate);
    final api = ref.watch(apiServiceProvider);

    return Column(
      children: [
        // Date selector and eBird export button
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: AppColors.surface,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
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
                      ),
                      child: Text(
                        // We use the language code of the current locale for date formatting
                        DateFormat(
                          'dd/MM/yyyy',
                          Localizations.localeOf(context).languageCode,
                        ).format(_selectedDate),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
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
                          const Icon(
                            Icons.folder_open,
                            size: 48,
                            color: AppColors.textHint,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            AppLocalizations.of(context)!.noRecordings,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

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
                              style: const TextStyle(
                                color: AppColors.primaryLight,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          speciesName,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          firstDetection.scientificName,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                            color: AppColors.textHint,
                          ),
                        ),
                        children: speciesDetections.map((d) {
                          final spectrogramUrl = api.getSpectrogramImageUrl(
                            d.extractedPath,
                          );
                          return Dismissible(
                            key: Key(d.fileName),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              color: AppColors.error,
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            confirmDismiss: (direction) async {
                              return await showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  backgroundColor: AppColors.surface,
                                  title: Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.deleteRecording,
                                  ),
                                  content: Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.deleteRecordingConfirmation(
                                      d.commonName,
                                      d.date,
                                      d.time,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(ctx, false),
                                      child: Text(
                                        AppLocalizations.of(context)!.cancel,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx, true),
                                      child: Text(
                                        AppLocalizations.of(context)!.delete,
                                        style: const TextStyle(
                                          color: AppColors.error,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            onDismissed: (direction) async {
                              await api.deleteRecording(d.fileName);
                              ref.invalidate(
                                allDetectionsForDateProvider(dateStr),
                              );
                            },
                            child: _buildRecordingTile(d, spectrogramUrl, api),
                          );
                        }).toList(),
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLight,
                  ),
                ),
                error: (e, _) => Center(
                  child: Text(
                    '${AppLocalizations.of(context)!.errorOccurred}: $e',
                    style: const TextStyle(color: AppColors.error),
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
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.searchSpecies,
              prefixIcon: const Icon(Icons.search, color: AppColors.textHint),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: AppColors.textHint),
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
                          style: const TextStyle(
                            color: AppColors.primaryLight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      comName,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      sciName,
                      style: const TextStyle(
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
                            loading: () => const Padding(
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
            loading: () => const Center(
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: spectrogramUrl,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            placeholder: (_, _) =>
                Container(width: 56, height: 56, color: AppColors.cardElevated),
            errorWidget: (_, _, _) => Container(
              width: 56,
              height: 56,
              color: AppColors.cardElevated,
              child: const Icon(
                Icons.music_note,
                color: AppColors.textHint,
                size: 20,
              ),
            ),
          ),
        ),
        title: Text(
          d.commonName,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        subtitle: Text(
          '${d.time} \u2014 ${d.confidencePercent}',
          style: const TextStyle(fontSize: 12, color: AppColors.textHint),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.textHint),
        onTap: () => _showDetectionDetail(d, api),
      ),
    );
  }

  void _showDetectionDetail(dynamic d, ApiService api) {
    final audioUrl = api.getAudioUrl(d.extractedPath);
    final spectrogramUrl = api.getSpectrogramImageUrl(d.extractedPath);

    showModalBottomSheet(
      context: context,
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
          ref.invalidate(allSpeciesProvider);
          final dateStr = DateFormat('yyyy-MM-dd').format(_selectedDate);
          ref.invalidate(allDetectionsForDateProvider(dateStr));
        },
        onChanged: () {
          ref.invalidate(allSpeciesProvider);
          final dateStr = DateFormat('yyyy-MM-dd').format(_selectedDate);
          ref.invalidate(allDetectionsForDateProvider(dateStr));
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
          colorScheme: const ColorScheme.dark(
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
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.minimumConfidenceThreshold,
              style: const TextStyle(color: AppColors.textSecondary),
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
                    style: const TextStyle(
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
                const SizedBox(width: 12),
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
