import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'config/theme.dart';
import 'config/routes.dart';
import 'providers/theme_provider.dart';

class BirdNetPiApp extends ConsumerWidget {
  const BirdNetPiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);

    // Sync AppColors._isDark PRIMA che qualsiasi widget figlio venga costruito.
    // Questo garantisce che AppColors.xxx restituiscano i colori corretti
    // durante l'intero rebuild del sottoalbero.
    AppColors.setDark(themeMode == ThemeMode.dark);

    return MaterialApp.router(
      title: 'BirdNET-Pi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
