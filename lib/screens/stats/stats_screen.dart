import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';
import 'iframe_widget.dart';

class SystemStatsScreen extends ConsumerWidget {
  const SystemStatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: PointerInterceptor(
          child: AppBar(
            title: Text(AppLocalizations.of(context)!.statistics),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => AppShell.openDrawer(),
            ),
            actions: const [AuthLockIcon()],
          ),
        ),
      ),
      body: const IframeWidget(url: '/stats'),
    );
  }
}
