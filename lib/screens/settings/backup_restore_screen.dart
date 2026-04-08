import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:file_selector/file_selector.dart';
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

  // Nuovi stati per il restore
  Map<String, dynamic>? _restoreFileStatus;
  double? _uploadProgress;
  String _uploadStatusText = "";
  bool _isUploading = false;
  bool _isRestoring = false;
  String _restoreLogs = "";
  Timer? _restoreLogsTimer;

  @override
  void initState() {
    super.initState();
    _refreshBackups();
    _checkRestoreStatus();
    _startPolling();
  }

  @override
  void dispose() {
    _pollingTimer?.cancel();
    _restoreLogsTimer?.cancel();
    super.dispose();
  }

  void _startPolling() {
    _pollingTimer = Timer.periodic(const Duration(seconds: 5), (_) => _refreshBackups(silent: true));
  }

  Future<void> _checkRestoreStatus() async {
    try {
      final status = await ref.read(apiServiceProvider).getRestoreStatus();
      if (mounted) {
        setState(() {
          _restoreFileStatus = (status['has_file'] == true) ? status : null;
          // Se il file esiste già e non stiamo caricando, resettiamo il progresso
          if (!_isUploading) _uploadProgress = 0;
        });
      }
    } catch (_) {}
  }

  void _startLogsPolling() {
    _restoreLogsTimer?.cancel();
    _restoreLogsTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      try {
        final logs = await ref.read(apiServiceProvider).getRestoreLogs();
        if (mounted) {
          setState(() {
            _restoreLogs = logs;
            if (logs.contains("Restore done")) {
              _isRestoring = false;
              _restoreLogsTimer?.cancel();
              _checkRestoreStatus();
            }
          });
        }
      } catch (_) {}
    });
  }

  Future<void> _handleDeleteRestoreFile() async {
    setState(() => _isActionInProgress = true);
    try {
      await ref.read(apiServiceProvider).deleteRestoreFile();
      await _checkRestoreStatus();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Errore durante l'eliminazione: $e")),
        );
      }
    } finally {
      if (mounted) setState(() => _isActionInProgress = false);
    }
  }

  Future<void> _handleStartRestore() async {
    final l10n = AppLocalizations.of(context)!;
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

    setState(() {
      _isRestoring = true;
      _restoreLogs = "Avvio ripristino...\n";
    });
    
    try {
      await ref.read(apiServiceProvider).startRestore();
      _startLogsPolling();
    } catch (e) {
      if (mounted) {
        setState(() => _isRestoring = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${l10n.errorRestoring}: $e")),
        );
      }
    }
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
        content: Text("Sei sicuro di voler eliminare questo backup?"),
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

    XFile? file;
    try {
      final tarGroup = XTypeGroup(
        label: 'tar',
        extensions: <String>['tar', 'TAR'],
      );
      file = await openFile(
        acceptedTypeGroups: kIsWeb ? [] : [tarGroup],
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${l10n.error}: $e")),
        );
      }
      return;
    }

    if (file == null) return;
    
    if (!file.name.toLowerCase().endsWith('.tar')) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Per favore seleziona un file .tar valido")),
        );
      }
      return;
    }

    setState(() {
      _isUploading = true;
      _uploadProgress = null;
      _uploadStatusText = "Lettura file...";
    });

    Uint8List? bytes;
    try {
      bytes = await file.readAsBytes();
    } catch (e) {
      if (mounted) {
        setState(() => _isUploading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${l10n.error}: Impossibile leggere il file.")),
        );
      }
      return;
    }

    setState(() {
      _uploadStatusText = "Caricamento archivio...";
    });

    try {
      await ref.read(apiServiceProvider).uploadRestoreFile(
        bytes, 
        file.name,
        onProgress: (p) => setState(() {
          _uploadProgress = p < 0 ? null : p;
        }),
      );
      await _checkRestoreStatus();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Errore durante l'upload: $e")),
        );
      }
    } finally {
      if (mounted) setState(() => _isUploading = false);
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
            child: _isRestoring 
              ? _buildLogsTerminal()
              : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (_restoreFileStatus == null && !_isUploading)
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
                  
                  if (_isUploading) ...[
                    Text(_uploadStatusText, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: _uploadProgress,
                        minHeight: 10,
                        backgroundColor: AppColors.primary.withOpacity(0.1),
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (_uploadProgress != null)
                      Text("${(_uploadProgress! * 100).toStringAsFixed(1)}%", textAlign: TextAlign.right),
                  ],

                  if (_restoreFileStatus != null) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.divider),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.insert_drive_file, size: 16),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _restoreFileStatus!['filename'] ?? "backup.tar",
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(_formatSize(_restoreFileStatus!['size'] ?? 0)),
                            ],
                          ),
                          const Divider(),
                          const Text("Validazione contenuto:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              _buildValidationFlag(
                                "File Obbligatori", 
                                _restoreFileStatus!['validation']['mandatory'] == true
                              ),
                              const SizedBox(width: 8),
                              _buildValidationFlag(
                                "File Opzionali", 
                                _restoreFileStatus!['validation']['optional'] == true
                              ),
                            ],
                          ),
                          if (_restoreFileStatus!['validation']['mandatory'] != true)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Componenti mancanti: ${(_restoreFileStatus!['validation']['required_missing'] as List).join(', ')}",
                                style: const TextStyle(color: Colors.red, fontSize: 11),
                              ),
                            ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _restoreFileStatus!['validation']['mandatory'] == true && !_isActionInProgress
                                      ? _handleStartRestore 
                                      : null,
                                  icon: const Icon(Icons.play_arrow),
                                  label: const Text("AVVIA RESTORE"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.red),
                                tooltip: "Elimina archivio",
                                onPressed: _isActionInProgress ? null : _handleDeleteRestoreFile,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],

                  if (_isActionInProgress && !_isUploading)
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

  Widget _buildValidationFlag(String label, bool isValid) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isValid ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: isValid ? Colors.green : Colors.red),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.error, 
            size: 14, 
            color: isValid ? Colors.green : Colors.red
          ),
          const SizedBox(width: 4),
          Text(
            label, 
            style: TextStyle(
              fontSize: 11, 
              color: isValid ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold
            )
          ),
        ],
      ),
    );
  }

  Widget _buildLogsTerminal() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        reverse: true,
        child: Text(
          _restoreLogs,
          style: const TextStyle(
            color: Colors.greenAccent,
            fontFamily: 'monospace',
            fontSize: 12,
          ),
        ),
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
