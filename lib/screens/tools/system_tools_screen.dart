import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../services/api_service.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_guard.dart';
import '../../widgets/auth_lock_icon.dart';

class SystemToolsScreen extends ConsumerStatefulWidget {
  const SystemToolsScreen({super.key});

  @override
  ConsumerState<SystemToolsScreen> createState() => _SystemToolsScreenState();
}

class _SystemToolsScreenState extends ConsumerState<SystemToolsScreen> {
  List<Map<String, dynamic>> _services = [];
  bool _isLoadingServices = true;
  String? _error;
  final Set<String> _loadingActionForService = {};

  Map<String, dynamic>? _systemInfo;
  bool _isLoadingInfo = true;

  @override
  void initState() {
    super.initState();
    _loadServices();
    _loadSystemInfo();
  }

  Future<void> _loadSystemInfo() async {
    try {
      final api = ref.read(apiServiceProvider);
      final info = await api.getSystemInfo();
      if (mounted) {
        setState(() {
          _systemInfo = info;
          _isLoadingInfo = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _isLoadingInfo = false);
    }
  }

  Future<void> _loadServices() async {
    setState(() {
      _isLoadingServices = true;
      _error = null;
    });
    try {
      final api = ref.read(apiServiceProvider);
      final services = await api.getServices();
      if (mounted) {
        setState(() {
          _services = services;
          _isLoadingServices = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingServices = false;
          _error = e.toString();
        });
      }
    }
  }

  Map<String, dynamic>? _getServiceRecord(String id) {
    try {
      return _services.firstWhere((s) => s['id'] == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final api = ref.watch(apiServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.systemTools),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _isLoadingServices = true;
                _isLoadingInfo = true;
              });
              _loadServices();
              _loadSystemInfo();
            },
            tooltip: AppLocalizations.of(context)!.tooltipRefresh,
          ),
          const AuthLockIcon(),
        ],
      ),
      body: AuthGuard(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ─── System Info Box ───────────────────────
            _buildSystemInfoBox(),
            const SizedBox(height: 16),

            // System Controls
            _sectionTitle(
              AppLocalizations.of(context)!.systemControls,
              Icons.settings_power,
            ),
            const SizedBox(height: 12),
            _actionCard(
              api,
              icon: Icons.restart_alt,
              title: AppLocalizations.of(context)!.restart,
              subtitle: AppLocalizations.of(context)!.restartRaspberryPi,
              action: 'reboot',
              color: AppColors.warning,
              confirmMessage: AppLocalizations.of(
                context,
              )!.areYouSureYouWantToRestart,
            ),
            _actionCard(
              api,
              icon: Icons.system_update,
              title: AppLocalizations.of(context)!.update,
              subtitle: AppLocalizations.of(context)!.updateBirdNetPi,
              action: 'update',
              color: AppColors.primaryLight,
              confirmMessage: AppLocalizations.of(
                context,
              )!.doYouWantToUpdateBirdNet,
            ),
            _actionCard(
              api,
              icon: Icons.power_settings_new,
              title: AppLocalizations.of(context)!.shutdown,
              subtitle: AppLocalizations.of(context)!.shutdownRaspberryPi,
              action: 'shutdown',
              color: AppColors.error,
              confirmMessage: AppLocalizations.of(
                context,
              )!.areYouSureYouWantToShutdown,
            ),
            _actionCard(
              api,
              icon: Icons.delete_forever,
              title: AppLocalizations.of(context)!.clearAllData,
              subtitle: AppLocalizations.of(
                context,
              )!.removeAllRecordingsAndDetections,
              action: 'clear-data',
              color: AppColors.error,
              confirmMessage: AppLocalizations.of(
                context,
              )!.warningAllDataWillBeDeleted,
            ),

            const SizedBox(height: 24),

            // Altre utility
            _sectionTitle(
              AppLocalizations.of(context)!.otherUtilities,
              Icons.build_circle_outlined,
            ),
            const SizedBox(height: 12),
            _utilityCard(
              icon: Icons.info_outline,
              title: AppLocalizations.of(context)!.systemInfo,
              url: '/phpsysinfo/index.php?disp=bootstrap',
            ),
            _utilityCard(
              icon: Icons.folder_open,
              title: AppLocalizations.of(context)!.fileManager,
              url: '/scripts/filemanager/filemanager.php?p=',
            ),
            _utilityCard(
              icon: Icons.storage,
              title: AppLocalizations.of(context)!.databaseMaintenance,
              url: '/scripts/adminer.php',
            ),
            _utilityCard(
              icon: Icons.terminal,
              title: AppLocalizations.of(context)!.webTerminal,
              url: '/terminal/',
            ),

            const SizedBox(height: 24),

            // Services
            _sectionTitle(
              AppLocalizations.of(context)!.services,
              Icons.miscellaneous_services,
            ),
            const SizedBox(height: 12),
            if (_isLoadingServices)
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLight,
                  ),
                ),
              )
            else if (_error != null)
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: AppColors.error,
                        size: 48,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(
                          context,
                        )!.errorLoadingSettings(_error!),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.error),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadServices,
                        child: Text(AppLocalizations.of(context)!.retry),
                      ),
                    ],
                  ),
                ),
              )
            else ...[
              _serviceCard(
                api,
                AppLocalizations.of(context)!.liveAudioStream,
                'livestream',
              ),
              _serviceCard(
                api,
                AppLocalizations.of(context)!.birdNetAnalysis,
                'birdnet_analysis',
              ),
              _serviceCard(
                api,
                AppLocalizations.of(context)!.birdNetRecording,
                'birdnet_recording',
              ),
              _serviceCard(
                api,
                AppLocalizations.of(context)!.statistics,
                'birdnet_stats',
              ),
              _serviceCard(
                api,
                AppLocalizations.of(context)!.birdNetLog,
                'birdnet_log',
              ),
              _serviceCard(
                api,
                AppLocalizations.of(context)!.chartViewer,
                'chart_viewer',
              ),
              _serviceCard(
                api,
                AppLocalizations.of(context)!.spectrogram,
                'spectrogram_viewer',
              ),
            ],

            const SizedBox(height: 24),

            // Quick actions
            _sectionTitle(
              AppLocalizations.of(context)!.quickActions,
              Icons.flash_on,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _quickActionButton(
                    api,
                    icon: Icons.stop_circle,
                    label: AppLocalizations.of(context)!.stopServices,
                    action: 'stop-services',
                    color: AppColors.error,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _quickActionButton(
                    api,
                    icon: Icons.restart_alt,
                    label: AppLocalizations.of(context)!.restartServices,
                    action: 'restart-services',
                    color: AppColors.primaryLight,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildSystemInfoBox() {
    final loc = AppLocalizations.of(context)!;

    if (_isLoadingInfo) {
      return Container(
        height: 120,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: SizedBox(
            width: 28,
            height: 28,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: AppColors.primaryLight,
            ),
          ),
        ),
      );
    }

    if (_systemInfo == null) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(Icons.error_outline, color: AppColors.error, size: 20),
            const SizedBox(width: 10),
            Text(
              loc.sysInfoLoadingError,
              style: const TextStyle(color: AppColors.error, fontSize: 14),
            ),
          ],
        ),
      );
    }

    final info = _systemInfo!;
    final commitsBehind = info['commits_behind'] as int?;
    final gitBranch = info['git_branch'] as String? ?? '';
    final gitHash = info['git_hash'] as String? ?? '';
    final uptime = info['uptime'] as String? ?? '';
    final disk = info['disk_usage'] as String? ?? '';
    final mem = info['memory_usage'] as String? ?? '';
    final temp = info['cpu_temperature'] as String? ?? '';

    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryLight.withValues(alpha: 0.20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.monitor_heart_outlined,
                    size: 18,
                    color: AppColors.primaryLight,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  loc.systemStatus,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryLight,
                    letterSpacing: 0.3,
                  ),
                ),
                const Spacer(),
                if (commitsBehind != null && commitsBehind > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.warning.withValues(alpha: 0.5),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.update,
                          size: 14,
                          color: AppColors.warning,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          loc.sysInfoCommitsBehind(commitsBehind),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.warning,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          // ── Branch / Hash chip (full width) ─────────
          if (gitBranch.isNotEmpty || gitHash.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.commit,
                      size: 15,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${loc.sysInfoBranch}  ',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '$gitBranch @ $gitHash',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'RobotoMono',
                          color: AppColors.accent,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // ── Metric grid ─────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
            child: Row(
              children: [
                if (uptime.isNotEmpty)
                  Expanded(
                    child: _metricCard(
                      icon: Icons.access_time_rounded,
                      iconColor: AppColors.primaryLight,
                      label: loc.sysInfoUptime,
                      value: uptime,
                    ),
                  ),
                if (uptime.isNotEmpty &&
                    (disk.isNotEmpty || mem.isNotEmpty || temp.isNotEmpty))
                  const SizedBox(width: 8),
                if (disk.isNotEmpty)
                  Expanded(
                    child: _metricCard(
                      icon: Icons.storage_rounded,
                      iconColor: const Color(0xFF42A5F5),
                      label: loc.sysInfoDisk,
                      value: disk,
                    ),
                  ),
              ],
            ),
          ),
          if (mem.isNotEmpty || temp.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
              child: Row(
                children: [
                  if (mem.isNotEmpty)
                    Expanded(
                      child: _metricCard(
                        icon: Icons.memory_rounded,
                        iconColor: const Color(0xFFAB47BC),
                        label: loc.sysInfoMemory,
                        value: mem,
                      ),
                    ),
                  if (mem.isNotEmpty && temp.isNotEmpty)
                    const SizedBox(width: 8),
                  if (temp.isNotEmpty)
                    Expanded(
                      child: _metricCard(
                        icon: Icons.thermostat_rounded,
                        iconColor: const Color(0xFFEF5350),
                        label: loc.sysInfoCpuTemp,
                        value: temp,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _metricCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.cardElevated,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, size: 18, color: iconColor),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.primaryLight),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _actionCard(
    ApiService api, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String action,
    required Color color,
    required String confirmMessage,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: AppColors.textHint),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.textHint),
        onTap: () => _confirmSystemAction(api, title, confirmMessage, action),
      ),
    );
  }

  Widget _utilityCard({
    required IconData icon,
    required String title,
    required String url,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primaryLight.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.primaryLight, size: 22),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(
          Icons.open_in_new,
          color: AppColors.textHint,
          size: 18,
        ),
        onTap: () async {
          final uri = Uri.base.resolve(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, webOnlyWindowName: '_blank');
          }
        },
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    IconData icon;
    String label = status.toLowerCase();

    if (label == 'active') {
      color = AppColors.success;
      icon = Icons.check_circle;
    } else if (label == 'inactive' || label == 'stopped') {
      color = AppColors.textHint;
      icon = Icons.stop_circle;
    } else if (label == 'failed') {
      color = AppColors.error;
      icon = Icons.error;
    } else if (label == 'activating') {
      color = AppColors.warning;
      icon = Icons.hourglass_top;
    } else {
      color = AppColors.textSecondary;
      icon = Icons.help_outline;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            status.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnabledBadge(bool isEnabled) {
    final color = isEnabled ? AppColors.success : AppColors.textHint;
    final label = isEnabled ? 'ENABLED' : 'DISABLED';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }

  Widget _serviceCard(ApiService api, String name, String serviceId) {
    final record = _getServiceRecord(serviceId);
    final status = record?['status'] ?? 'unknown';
    final isActive = status == 'active';
    final isWorking = _loadingActionForService.contains(serviceId);
    final isEnabled = record?['enabled'] == true;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildEnabledBadge(isEnabled),
                    const SizedBox(width: 4),
                    _buildStatusBadge(status),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      record?['service_name'] ?? '$serviceId.service',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textHint,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isWorking)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else ...[
            if (isActive)
              IconButton(
                icon: const Icon(
                  Icons.stop_circle_outlined,
                  color: AppColors.warning,
                  size: 22,
                ),
                tooltip: AppLocalizations.of(context)!.tooltipStop,
                onPressed: () => _executeServiceAction(api, serviceId, 'stop'),
              )
            else
              IconButton(
                icon: const Icon(
                  Icons.play_circle_fill,
                  color: AppColors.success,
                  size: 22,
                ),
                tooltip: AppLocalizations.of(context)!.tooltipStart,
                onPressed: () => _executeServiceAction(api, serviceId, 'start'),
              ),
            IconButton(
              icon: const Icon(
                Icons.restart_alt,
                color: AppColors.primaryLight,
                size: 22,
              ),
              tooltip: AppLocalizations.of(context)!.tooltipRestart,
              onPressed: () => _executeServiceAction(api, serviceId, 'restart'),
            ),
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.textSecondary,
                size: 22,
              ),
              color: AppColors.card,
              onSelected: (action) =>
                  _executeServiceAction(api, serviceId, action),
              itemBuilder: (context) {
                final isEnabled = record?['enabled'] == true;
                return [
                  PopupMenuItem(
                    value: isEnabled ? 'disable' : 'enable',
                    child: Text(
                      isEnabled
                          ? AppLocalizations.of(context)!.disable
                          : AppLocalizations.of(context)!.enable,
                      style: TextStyle(
                        color: isEnabled
                            ? AppColors.warning
                            : AppColors.success,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ];
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _quickActionButton(
    ApiService api, {
    required IconData icon,
    required String label,
    required String action,
    required Color color,
  }) {
    return Expanded(
      child: Material(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () => _confirmSystemAction(
            api,
            label,
            '${AppLocalizations.of(context)!.confirm} $label?',
            action,
          ),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Icon(icon, color: color, size: 28),
                const SizedBox(height: 8),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmSystemAction(
    ApiService api,
    String title,
    String message,
    String action,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.background,
        title: Text(
          title,
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          message,
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: Text(AppLocalizations.of(context)!.confirm),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      _executeSystemAction(api, action);
    }
  }

  Future<void> _executeSystemAction(ApiService api, String action) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${AppLocalizations.of(context)!.execution} $action...'),
        backgroundColor: AppColors.primary,
        duration: const Duration(seconds: 2),
      ),
    );

    try {
      final response = await api.systemAction(action);
      if (mounted) {
        final msg =
            response['message'] ??
            AppLocalizations.of(context)!.commandExecuted;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg), backgroundColor: AppColors.success),
        );
        // Reload services just in case a system action affected them (like stop-services)
        if (action.contains('services')) {
          _loadServices();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.errorMsg(e.toString())),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _executeServiceAction(
    ApiService api,
    String serviceId,
    String action,
  ) async {
    setState(() {
      _loadingActionForService.add(serviceId);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${AppLocalizations.of(context)!.execution} $action $serviceId',
        ),
        backgroundColor: AppColors.primary,
        duration: const Duration(seconds: 2),
      ),
    );
    try {
      final result = await api.serviceAction(serviceId, action);
      if (mounted) {
        // Update specific service status locally
        setState(() {
          _loadingActionForService.remove(serviceId);
          final index = _services.indexWhere((s) => s['id'] == serviceId);
          if (index != -1) {
            if (result['new_status'] != null) {
              _services[index]['status'] = result['new_status'];
            }
            if (result['new_enabled'] != null) {
              _services[index]['enabled'] = result['new_enabled'];
            }
          }
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.commandExecuted),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _loadingActionForService.remove(serviceId);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.errorMsg(e.toString())),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }
}
