import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../config/theme.dart';
import '../screens/stats/iframe_widget.dart';

class AppShell extends StatefulWidget {
  final Widget child;
  final int currentIndex;

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  static void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  static void closeDrawer() {
    scaffoldKey.currentState?.closeDrawer();
  }

  const AppShell({super.key, required this.child, required this.currentIndex});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppShell.scaffoldKey,
      onDrawerChanged: (isOpen) {
        setIframesInteractable(!isOpen);
      },
      drawer: _buildDrawerContent(context),
      body: widget.child,
      bottomNavigationBar: PointerInterceptor(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    context,
                    0,
                    Icons.home_rounded,
                    AppLocalizations.of(context)!.home,
                    '/',
                  ),
                  _buildNavItem(
                    context,
                    1,
                    Icons.list_alt_rounded,
                    AppLocalizations.of(context)!.today,
                    '/detections',
                  ),
                  _buildNavItem(
                    context,
                    2,
                    Icons.bar_chart_rounded,
                    AppLocalizations.of(context)!.charts,
                    '/charts',
                  ),
                  _buildNavItem(
                    context,
                    3,
                    Icons.album_rounded,
                    AppLocalizations.of(context)!.recordings,
                    '/recordings',
                  ),
                  _buildNavItem(
                    context,
                    4,
                    Icons.graphic_eq,
                    AppLocalizations.of(context)!.liveStream,
                    '/livestream',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int index,
    IconData icon,
    String label,
    String route,
  ) {
    final isSelected = index == widget.currentIndex;
    return Expanded(
      child: InkWell(
        onTap: () {
          if (!isSelected) context.go(route);
        },
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 16 : 0,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryLight.withValues(alpha: 0.15)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: isSelected
                      ? AppColors.primaryLight
                      : AppColors.textHint,
                  size: 22,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: isSelected
                      ? AppColors.primaryLight
                      : AppColors.textHint,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerContent(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primaryDark, AppColors.primary],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.asset('assets/images/logo.png', height: 48),
                ),
                const SizedBox(height: 14),
                Text(
                  AppLocalizations.of(context)!.appTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.birdMonitoring,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _drawerItem(
                  context,
                  Icons.home,
                  AppLocalizations.of(context)!.home,
                  () {
                    AppShell.closeDrawer();
                    context.go('/');
                  },
                ),
                const Divider(color: AppColors.divider),
                _drawerItem(
                  context,
                  Icons.graphic_eq,
                  AppLocalizations.of(context)!.liveStream,
                  () {
                    AppShell.closeDrawer();
                    context.go('/livestream');
                  },
                ),
                _drawerItem(
                  context,
                  Icons.analytics,
                  AppLocalizations.of(context)!.liveSpectrogram,
                  () {
                    AppShell.closeDrawer();
                    context.go('/spectrogram');
                  },
                ),
                const Divider(color: AppColors.divider),
                _drawerItem(
                  context,
                  Icons.bar_chart,
                  AppLocalizations.of(context)!.statistics,
                  () {
                    AppShell.closeDrawer();
                    context.go('/stats');
                  },
                ),
                _drawerItem(
                  context,
                  Icons.receipt_long,
                  AppLocalizations.of(context)!.systemLogs,
                  () {
                    AppShell.closeDrawer();
                    context.go('/logs');
                  },
                ),
                _drawerItem(
                  context,
                  Icons.settings,
                  AppLocalizations.of(context)!.settings,
                  () {
                    AppShell.closeDrawer();
                    context.go('/settings');
                  },
                ),
                _drawerItem(
                  context,
                  Icons.build,
                  AppLocalizations.of(context)!.systemTools,
                  () {
                    AppShell.closeDrawer();
                    context.go('/tools');
                  },
                ),
                const Divider(color: AppColors.divider),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.speciesManagement,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textHint,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                _drawerItem(
                  context,
                  Icons.checklist,
                  AppLocalizations.of(context)!.inclusionList,
                  () {
                    AppShell.closeDrawer();
                    context.go('/lists/included');
                  },
                ),
                _drawerItem(
                  context,
                  Icons.block,
                  AppLocalizations.of(context)!.exclusionList,
                  () {
                    AppShell.closeDrawer();
                    context.go('/lists/excluded');
                  },
                ),
                _drawerItem(
                  context,
                  Icons.star_outline,
                  AppLocalizations.of(context)!.whitelist,
                  () {
                    AppShell.closeDrawer();
                    context.go('/lists/whitelist');
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'v1.0.0 — BirdNET-Pi Flutter',
              style: TextStyle(fontSize: 11, color: AppColors.textHint),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryLight, size: 22),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      onTap: onTap,
      dense: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
