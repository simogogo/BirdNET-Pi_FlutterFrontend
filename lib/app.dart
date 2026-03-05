import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import 'config/theme.dart';
import 'config/routes.dart';

class BirdNetPiApp extends ConsumerWidget {
  const BirdNetPiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'BirdNET-Pi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
      builder: (context, child) {
        return DefaultTextStyle(
          style: const TextStyle(fontFamily: 'Inter'),
          child: child!,
        );
      },
    );
  }
}
