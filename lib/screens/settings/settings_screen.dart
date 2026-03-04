import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../services/api_service.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';
import 'basic_settings_screen.dart';
import 'advanced_settings_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: const [AuthLockIcon()],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Navigations
          _buildNavigationCard(
            context: context,
            title: AppLocalizations.of(context)!.basicSettings,
            subtitle: AppLocalizations.of(context)!.basicSettingsSubtitle,
            icon: Icons.settings,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BasicSettingsScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          _buildNavigationCard(
            context: context,
            title: AppLocalizations.of(context)!.advancedSettings,
            subtitle: AppLocalizations.of(context)!.advancedSettingsSubtitle,
            icon: Icons.tune,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdvancedSettingsScreen(),
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          // Server Info
          _buildSectionTitle(
            AppLocalizations.of(context)!.deviceInformation,
            Icons.info_outline,
          ),
          const SizedBox(height: 12),
          FutureBuilder<Map<String, String>>(
            future: ref.watch(apiServiceProvider).getLocationConfig(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _buildInfoRow(
                  AppLocalizations.of(context)!.loading,
                  '',
                  Icons.hourglass_empty,
                );
              }
              if (snapshot.hasError) {
                return _buildInfoRow(
                  AppLocalizations.of(context)!.notConnected,
                  AppLocalizations.of(context)!.configureServerAddress,
                  Icons.signal_wifi_off,
                  isError: true,
                );
              }
              final data = snapshot.data ?? {};
              return Column(
                children: [
                  _buildInfoRow(
                    AppLocalizations.of(context)!.latitude,
                    data['latitude'] ?? '—',
                    Icons.location_on,
                  ),
                  _buildInfoRow(
                    AppLocalizations.of(context)!.longitude,
                    data['longitude'] ?? '—',
                    Icons.location_on,
                  ),
                  _buildInfoRow(
                    AppLocalizations.of(context)!.locality,
                    data['locality'] ?? '—',
                    Icons.place,
                  ),
                  _buildInfoRow(
                    AppLocalizations.of(context)!.stateProvince,
                    data['stateProvince'] ?? '—',
                    Icons.map,
                  ),
                  _buildInfoRow(
                    AppLocalizations.of(context)!.countryCode,
                    data['countryCode'] ?? '—',
                    Icons.flag,
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 24),

          // About Section
          _buildSectionTitle(
            AppLocalizations.of(context)!.information,
            Icons.flutter_dash,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.flutter_dash,
                      color: AppColors.primaryLight,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'BirdNET-Pi App',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          AppLocalizations.of(context)!.appVersion,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textHint,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  AppLocalizations.of(context)!.appDescription,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
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
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textHint),
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

  Widget _buildInfoRow(
    String label,
    String value,
    IconData icon, {
    bool isError = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: isError ? AppColors.error : AppColors.textHint,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              color: isError ? AppColors.error : AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isError ? AppColors.error : AppColors.textPrimary,
              ),
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
