import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../services/api_service.dart';
import '../../config/api_config.dart';

class ZipManagerScreen extends ConsumerStatefulWidget {
  const ZipManagerScreen({super.key});

  @override
  ConsumerState<ZipManagerScreen> createState() => _ZipManagerScreenState();
}

class _ZipManagerScreenState extends ConsumerState<ZipManagerScreen> {
  List<Map<String, dynamic>> _zips = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchZips();
  }

  Future<void> _fetchZips() async {
    setState(() => _isLoading = true);
    final zips = await ref.read(apiServiceProvider).getAvailableZips();
    if (mounted) {
      setState(() {
        _zips = zips;
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteZip(String filename) async {
    final success = await ref.read(apiServiceProvider).deleteZip(filename);
    if (success) {
      _fetchZips();
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.errorOccurred),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _downloadZip(String urlStr) async {
    final serverUrl = ApiConfig.baseUrl;
    final fullUrl = '$serverUrl$urlStr';
    var uri = Uri.parse(fullUrl);
    if (kIsWeb && !uri.hasScheme) {
      uri = Uri.base.resolve(fullUrl);
    }
    
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.cannotOpenZipUrl),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.zipManager),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: l10n.refreshList,
            onPressed: _fetchZips,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _zips.isEmpty
              ? Center(
                  child: Text(
                    l10n.noData,
                    style: TextStyle(color: AppColors.textHint, fontSize: 16),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _fetchZips,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: _zips.length,
                    itemBuilder: (context, index) {
                      final zip = _zips[index];
                      final isProcessing = zip['status'] == 'processing';
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        color: AppColors.card,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: AppColors.divider),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          title: Text(
                            zip['filename']?.isNotEmpty == true ? zip['filename'] : zip['date'] ?? 'Zip',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            isProcessing
                              ? l10n.zipDownloadInProgress
                              : _formatBytes(zip['size'] ?? 0),
                            style: TextStyle(
                              color: isProcessing ? AppColors.primaryLight : AppColors.textSecondary,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (!isProcessing && zip['url'] != null && zip['url'].toString().isNotEmpty)
                                IconButton(
                                  icon: Icon(Icons.download, color: AppColors.primaryLight),
                                  tooltip: l10n.downloadZip,
                                  onPressed: () => _downloadZip(zip['url']),
                                ),
                              IconButton(
                                icon: Icon(Icons.delete_outline, color: AppColors.error),
                                tooltip: l10n.delete,
                                onPressed: () {
                                  final nameToDelete = zip['filename']?.isNotEmpty == true
                                      ? zip['filename']
                                      : zip['date'];
                                  if (nameToDelete != null) {
                                    _deleteZip(nameToDelete);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
