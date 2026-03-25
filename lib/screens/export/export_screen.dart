import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';

class ExportScreen extends ConsumerWidget {
  const ExportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.exportDataTitle),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: const [AuthLockIcon()],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNavigationCard(
            context: context,
            title: l10n.ebirdExport,
            subtitle: l10n.ebirdExportDesc,
            icon: Icons.upload_file,
            onTap: () => context.push('/export/ebird'),
          ),
          const SizedBox(height: 12),
          _buildNavigationCard(
            context: context,
            title: l10n.csvExport,
            subtitle: l10n.csvExportDesc,
            icon: Icons.table_chart,
            onTap: () => context.push('/export/csv'),
          ),
          const SizedBox(height: 12),
          _buildNavigationCard(
            context: context,
            title: l10n.audioZipExport,
            subtitle: l10n.audioZipExportDesc,
            icon: Icons.folder_zip,
            onTap: () => context.push('/export/zip'),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle(l10n.zipManager, Icons.manage_search),
          const SizedBox(height: 12),
          _buildNavigationCard(
            context: context,
            title: l10n.zipManager,
            subtitle: l10n.zipManagerDesc,
            icon: Icons.download_done,
            onTap: () => context.push('/export/manager'),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.divider, width: 1),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.primaryLight, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.textHint),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
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
}
