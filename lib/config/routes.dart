import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../screens/detections/detections_screen.dart';
import '../screens/charts/charts_screen.dart';
import '../screens/recordings/recordings_screen.dart';
import '../screens/recordings/ebird_wizard_screen.dart';
import '../screens/species/species_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/settings/species_lists_screen.dart';
import '../screens/tools/system_tools_screen.dart';
import '../screens/stats/stats_screen.dart';
import '../screens/tools/logs_screen.dart';
import '../screens/stream/live_stream_screen.dart';
import '../screens/stream/spectrogram_screen.dart';
import '../widgets/app_shell.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final location = state.uri.path;
          int index = 0; // Default: Home
          if (location == '/detections') index = 1;
          if (location == '/charts') index = 2;
          if (location == '/recordings') index = 3;
          if (location == '/livestream') index = 4;
          // Per stats, logs e altre view specifiche usiamo -1 in modo che nessun bottom nav item appaia selezionato,
          // ma mostriamo comunque la barra e il drawer.
          if (location == '/stats' ||
              location == '/logs' ||
              location == '/species' ||
              location == '/settings' ||
              location == '/tools' ||
              location == '/spectrogram' ||
              location.startsWith('/lists/')) {
            index = -1;
          }
          return AppShell(currentIndex: index, child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: '/detections',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: DetectionsScreen()),
          ),
          GoRoute(
            path: '/charts',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ChartsScreen()),
          ),
          GoRoute(
            path: '/recordings',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: RecordingsScreen()),
          ),
          GoRoute(
            path: '/livestream',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: LiveStreamScreen()),
          ),
          GoRoute(
            path: '/stats',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SystemStatsScreen()),
          ),
          GoRoute(
            path: '/logs',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: LogsScreen()),
          ),
          GoRoute(
            path: '/species',
            builder: (context, state) => const SpeciesScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
          GoRoute(
            path: '/tools',
            builder: (context, state) => const SystemToolsScreen(),
          ),
          GoRoute(
            path: '/spectrogram',
            builder: (context, state) => const SpectrogramScreen(),
          ),
          GoRoute(
            path: '/lists/:type',
            builder: (context, state) {
              final type = state.pathParameters['type'] ?? 'included';
              return SpeciesListsScreen(initialType: type);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/ebird-wizard',
        builder: (context, state) {
          final date = state.uri.queryParameters['date'] ?? '';
          return EBirdWizardScreen(date: date);
        },
      ),
    ],
  );
});
