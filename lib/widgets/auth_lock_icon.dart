import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';
import '../config/theme.dart';
import '../providers/auth_provider.dart';
import 'login_dialog.dart';

/// Icona lucchetto per l'AppBar — mostra stato autenticazione
///
/// - Non autenticato: lucchetto aperto (Icons.lock_outline) grigio
/// - Autenticato: lucchetto chiuso (Icons.lock) colorato
///
/// Al tap: apre il dialog di login se non autenticato,
/// oppure mostra opzione logout se autenticato.
class AuthLockIcon extends ConsumerWidget {
  const AuthLockIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return IconButton(
      icon: Icon(
        auth.isAuthenticated ? Icons.lock : Icons.lock_outline,
        color: auth.isAuthenticated
            ? AppColors.primaryLight
            : AppColors.textHint,
      ),
      tooltip: auth.isAuthenticated
          ? AppLocalizations.of(context)!.authenticated
          : AppLocalizations.of(context)!.signIn,
      onPressed: () {
        if (auth.isAuthenticated) {
          _showLogoutMenu(context, ref);
        } else {
          LoginDialog.show(context, ref);
        }
      },
    );
  }

  void _showLogoutMenu(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authProvider);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.lock, color: AppColors.primaryLight, size: 22),
            const SizedBox(width: 10),
            Text(
              AppLocalizations.of(context)!.authenticated,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.person, color: AppColors.primaryLight, size: 18),
                SizedBox(width: 8),
                Text(
                  auth.username ?? '',
                  style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.loggedInMessage,
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              AppLocalizations.of(context)!.close,
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error.withValues(alpha: 0.9),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.logout, size: 18),
            label: Text(AppLocalizations.of(context)!.logout),
            onPressed: () {
              ref.read(authProvider.notifier).logout();
              Navigator.of(ctx).pop();
              context.go('/');
            },
          ),
        ],
      ),
    );
  }
}
