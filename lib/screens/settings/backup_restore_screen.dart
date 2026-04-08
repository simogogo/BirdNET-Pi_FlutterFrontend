import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/api_service.dart';
import '../../l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../widgets/auth_lock_icon.dart';

class BackupRestoreScreen extends ConsumerStatefulWidget {
  const BackupRestoreScreen({super.key});

  @override
  ConsumerState<BackupRestoreScreen> createState() => _BackupRestoreScreenState();
}

class _BackupRestoreScreenState extends ConsumerState<BackupRestoreScreen> {
  List<Map<String, dynamic>> _backups = [];
  bool _isRefreshing = false;
  bool _isActionInProgress = false;
  Timer? _pollingTimer;

  @override
  void initState() {
    super.initState();
    _refreshBackups();
    _startPolling();
  }

  @override
  void dispose() {
    _pollingTimer?.cancel();
    super.dispose();
  }

  void _startPolling() {
    _pollingTimer = Timer.periodic(const Duration(seconds: 5), (_) => _refreshBackups(silent: true));
  }

  Future<void> _refreshBackups({bool silent = false}) async {
    if (!silent) setState(() => _isRefreshing = true);
    try {
      final backups = await ref.read(apiServiceProvider).getAvailableBackups();
      if (mounted) setState(() => _backups = backups);
    } catch (_) {
    } finally {
      if (mounted && !silent) setState(() => _isRefreshing = false);
    }
  }

  String _formatSize(int bytes) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    var i = (math.log(bytes) / math.log(1024)).floor();
    return ((bytes / math.pow(1024, i)).toStringAsFixed(2)) + ' ' + suffixes[i];
  }

  Future<void> _handleCreateBackup() async {
    setState(() => _isActionInProgress = true);
    try {
      final success = await ref.read(apiServiceProvider).createBackup();
      if (success) {
        _refreshBackups();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
        );
      }
    } finally {
      if (mounted) setState(() => _isActionInProgress = false);
    }
  }

  Future<void> _handleDeleteBackup(String filename) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.delete),
        content: Text("Sei sicuro di voler eliminare questo backup?"), // TODO: Use localized string if available
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(apiServiceProvider).deleteBackup(filename);
      _refreshBackups();
    }
  }

  Future<void> _handleDownload(String filename) async {
    try {
      final url = await ref.read(apiServiceProvider).getBackupFileUrl(filename);
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Impossibile aprire l\'URL di download';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Errore download: $e')),
        );
      }
    }
  }

  Future<void> _handleRestore() async {
    final l10n = AppLocalizations.of(context)!;
    
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['tar'],
      withData: true,
    );

    if (result == null || result.files.isEmpty) return;

    final file = result.files.first;
    if (file.bytes == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.restoreBackup),
        content: Text(l10n.restoreWarning),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: Text(l10n.restore),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isActionInProgress = true);
    try {
      await ref.read(apiServiceProvider).restoreBackup(file.bytes!, file.name);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.restoreStarted),
            duration: const Duration(seconds: 10),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${l10n.errorRestoring}: $e")),
        );
      }
    } finally {
      if (mounted) setState(() => _isActionInProgress = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.backupRestore),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _isRefreshing ? null : () => _refreshBackups(),
          ),
          const AuthLockIcon(),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Backup Section
          _buildCard(
            title: l10n.backup,
            description: l10n.backupWarning,
            icon: Icons.cloud_download,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  onPressed: _isActionInProgress ? null : _handleCreateBackup,
                  icon: _isActionInProgress
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Icon(Icons.add),
                  label: Text(l10n.createBackup),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.availableBackups,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                if (_isRefreshing && _backups.isEmpty)
                  const Center(child: Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator()))
                else if (_backups.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        l10n.noBackupsAvailable,
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ),
                  )
                else
                  ..._backups.map((b) => _buildBackupItem(b, l10n)),
              ],
            ),
          ),
          
          const SizedBox(height: 24),

          // Restore Section
          _buildCard(
            title: l10n.restore,
            description: l10n.restoreWarning,
            icon: Icons.settings_backup_restore,
            color: AppColors.error.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  onPressed: _isActionInProgress ? null : _handleRestore,
                  icon: const Icon(Icons.upload_file),
                  label: Text(l10n.restoreBackup),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.error,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
                if (_isActionInProgress)
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackupItem(Map<String, dynamic> backup, AppLocalizations l10n) {
    final status = backup['status'] as String;
    final filename = backup['filename'] as String;
    final isProcessing = status == 'processing';

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(filename),
      subtitle: isProcessing
          ? Text(l10n.generatingBackup, style: const TextStyle(color: Colors.orange))
          : Text(l10n.backupSize(_formatSize(backup['size'] ?? 0))),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isProcessing) ...[
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 8),
          ],
          if (!isProcessing)
            IconButton(
              icon: const Icon(Icons.download),
              onPressed: () => _handleDownload(filename),
            ),
          IconButton(
            icon: Icon(Icons.delete, color: AppColors.error),
            onPressed: () => _handleDeleteBackup(filename),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required IconData icon,
    required Widget child,
    Color? color,
  }) {
    return Card(
      elevation: 0,
      color: color ?? AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.divider),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.primaryLight),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),
            const SizedBox(height: 20),
            child,
          ],
        ),
      ),
    );
  }
}
