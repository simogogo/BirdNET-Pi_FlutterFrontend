import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../services/api_service.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';

class TopSpeciesScreen extends ConsumerStatefulWidget {
  const TopSpeciesScreen({super.key});

  @override
  ConsumerState<TopSpeciesScreen> createState() => _TopSpeciesScreenState();
}

class _TopSpeciesScreenState extends ConsumerState<TopSpeciesScreen> {
  DateTime? _fromDate;
  DateTime? _toDate;
  TimeOfDay? _fromTime;
  TimeOfDay? _toTime;
  bool _isLoading = false;
  bool _isFilterOpen = true;
  List<Map<String, dynamic>> _speciesData = [];

  @override
  void initState() {
    super.initState();
    // Default: last 7 days
    _toDate = DateTime.now();
    _fromDate = _toDate!.subtract(const Duration(days: 7));
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final api = ref.read(apiServiceProvider);
      final data = await api.getSpeciesByPeriod(
        fromDate: _fromDate != null
            ? DateFormat('yyyy-MM-dd').format(_fromDate!)
            : null,
        toDate: _toDate != null
            ? DateFormat('yyyy-MM-dd').format(_toDate!)
            : null,
        fromTime: _fromTime != null
            ? '${_fromTime!.hour.toString().padLeft(2, '0')}:${_fromTime!.minute.toString().padLeft(2, '0')}'
            : null,
        toTime: _toTime != null
            ? '${_toTime!.hour.toString().padLeft(2, '0')}:${_toTime!.minute.toString().padLeft(2, '0')}'
            : null,
      );
      setState(() {
        _speciesData = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)!.errorOccurred}: $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.topSpecies),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: [AuthLockIcon()],
      ),
      body: Column(
        children: [
          _buildFilters(l10n),
          Expanded(
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryLight,
                    ),
                  )
                : _speciesData.isEmpty
                ? Center(
                    child: Text(
                      l10n.noResultsFound,
                      style: TextStyle(color: AppColors.textHint),
                    ),
                  )
                : _buildChart(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters(AppLocalizations l10n) {
    // Detect cross-midnight range
    final isOvernight =
        _fromTime != null &&
        _toTime != null &&
        (_fromTime!.hour > _toTime!.hour ||
            (_fromTime!.hour == _toTime!.hour &&
                _fromTime!.minute > _toTime!.minute));

    return Container(
      color: AppColors.surface,
      child: Column(
        children: [
          // Collapsible filter content
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _isFilterOpen
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _FilterTile(
                                label: l10n.fromDate,
                                value: _fromDate != null
                                    ? DateFormat(
                                        'dd/MM/yyyy',
                                      ).format(_fromDate!)
                                    : '-',
                                icon: Icons.calendar_today,
                                onTap: () => _pickDate(true),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _FilterTile(
                                label: l10n.toDate,
                                value: _toDate != null
                                    ? DateFormat('dd/MM/yyyy').format(_toDate!)
                                    : '-',
                                icon: Icons.calendar_today,
                                onTap: () => _pickDate(false),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: _FilterTile(
                                label: l10n.fromTime,
                                value: _fromTime != null
                                    ? _fromTime!.format(context)
                                    : '-',
                                icon: Icons.access_time,
                                onTap: () => _pickTime(true),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _FilterTile(
                                label: l10n.toTime,
                                value: _toTime != null
                                    ? _toTime!.format(context)
                                    : '-',
                                icon: Icons.access_time,
                                onTap: () => _pickTime(false),
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton.filled(
                              onPressed: _loadData,
                              icon: Icon(Icons.refresh),
                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.primaryLight,
                                foregroundColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        // Overnight indicator + Reset row
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
                                      color: Colors.amber.withValues(
                                        alpha: 0.5,
                                      ),
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
                                  onPressed: _resetFilters,
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
                              onPressed: _resetFilters,
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
            onTap: () => setState(() => _isFilterOpen = !_isFilterOpen),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border(
                  top: BorderSide(color: AppColors.divider, width: 1),
                ),
              ),
              child: AnimatedRotation(
                turns: _isFilterOpen ? 0.0 : 0.5,
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

  void _resetFilters() {
    setState(() {
      _toDate = DateTime.now();
      _fromDate = _toDate!.subtract(const Duration(days: 7));
      _fromTime = null;
      _toTime = null;
    });
    _loadData();
  }

  Widget _buildChart() {
    final l10n = AppLocalizations.of(context)!;
    int maxCount = 0;
    if (_speciesData.isNotEmpty) {
      maxCount = (_speciesData[0]['Count'] as num).toInt();
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: _speciesData.length,
      itemBuilder: (context, index) {
        final item = _speciesData[index];
        final String name =
            item['Com_Name'] ?? item['Sci_Name'] ?? l10n.unknown;
        final int count = (item['Count'] as num).toInt();
        final double widthFactor = maxCount > 0 ? count / maxCount : 0;

        return InkWell(
          onTap: () {
            final fromDateStr = _fromDate != null
                ? DateFormat('yyyy-MM-dd').format(_fromDate!)
                : '';
            final toDateStr = _toDate != null
                ? DateFormat('yyyy-MM-dd').format(_toDate!)
                : '';
            final fromTimeStr = _fromTime != null
                ? '${_fromTime!.hour.toString().padLeft(2, '0')}:${_fromTime!.minute.toString().padLeft(2, '0')}'
                : '';
            final toTimeStr = _toTime != null
                ? '${_toTime!.hour.toString().padLeft(2, '0')}:${_toTime!.minute.toString().padLeft(2, '0')}'
                : '';

            final sciName = item['Sci_Name'] ?? '';

            context.push(
              Uri(
                path: '/recordings',
                queryParameters: {
                  'tab': '2',
                  'fromDate': fromDateStr,
                  'toDate': toDateStr,
                  'fromTime': fromTimeStr,
                  'toTime': toTimeStr,
                  'species': sciName,
                },
              ).toString(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      count.toString(),
                      style: TextStyle(
                        color: AppColors.primaryLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Stack(
                  children: [
                    Container(
                      height: 24,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.cardElevated,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeOutCubic,
                      height: 24,
                      width:
                          MediaQuery.of(context).size.width *
                          0.9 *
                          widthFactor, // Rough estimate, layoutbuilder is better
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryLight.withValues(alpha: 0.6),
                            AppColors.primaryLight,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryLight.withValues(
                              alpha: 0.3,
                            ),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickDate(bool isFrom) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: (isFrom ? _fromDate : _toDate) ?? DateTime.now(),
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
      setState(() {
        if (isFrom) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
      _loadData();
    }
  }

  Future<void> _pickTime(bool isFrom) async {
    final picked = await showTimePicker(
      context: context,
      initialTime:
          (isFrom ? _fromTime : _toTime) ?? const TimeOfDay(hour: 0, minute: 0),
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
      setState(() {
        if (isFrom) {
          _fromTime = picked;
        } else {
          _toTime = picked;
        }
      });
      _loadData();
    }
  }
}

class _FilterTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const _FilterTile({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.divider),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: AppColors.primaryLight),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontSize: 10, color: AppColors.textHint),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
