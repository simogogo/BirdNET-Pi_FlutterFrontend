import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../config/theme.dart';
import '../screens/stats/iframe_widget.dart';
import '../providers/auth_provider.dart';

/// Dialog di login riutilizzabile con verifica API
class LoginDialog {
  /// Mostra il dialog di login
  static Future<void> show(BuildContext context, WidgetRef ref) {
    setIframesInteractable(false);
    return showDialog<void>(
      context: context,
      builder: (ctx) => _LoginDialogContent(parentRef: ref),
    ).then((_) {
      setIframesInteractable(true);
    });
  }
}

class _LoginDialogContent extends ConsumerStatefulWidget {
  final WidgetRef parentRef;
  const _LoginDialogContent({required this.parentRef});

  @override
  ConsumerState<_LoginDialogContent> createState() =>
      _LoginDialogContentState();
}

class _LoginDialogContentState extends ConsumerState<_LoginDialogContent> {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final auth = widget.parentRef.read(authProvider);
    _usernameCtrl.text = auth.username ?? '';
    _passwordCtrl.text = auth.password ?? '';
  }

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _doLogin() async {
    final username = _usernameCtrl.text.trim();
    final password = _passwordCtrl.text.trim();

    if (username.isEmpty) {
      setState(() => _error = AppLocalizations.of(context)!.loginEmptyError);
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    final success = await widget.parentRef
        .read(authProvider.notifier)
        .login(username, password);

    if (mounted) {
      if (success) {
        Navigator.of(context).pop();
      } else {
        final authState = widget.parentRef.read(authProvider);
        setState(() {
          _isLoading = false;
          _error =
              authState.error ??
              AppLocalizations.of(context)!.loginInvalidError;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          const Icon(
            Icons.lock_outline,
            color: AppColors.primaryLight,
            size: 22,
          ),
          const SizedBox(width: 10),
          Text(
            AppLocalizations.of(context)!.loginTitle,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.loginSubtitle,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _usernameCtrl,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.username,
              prefixIcon: const Icon(
                Icons.person_outline,
                color: AppColors.primaryLight,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            autofocus: true,
            enabled: !_isLoading,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _passwordCtrl,
            obscureText: true,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.password,
              hintText: AppLocalizations.of(context)!.passwordOptionalHint,
              prefixIcon: const Icon(Icons.key, color: AppColors.primaryLight),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            enabled: !_isLoading,
            onSubmitted: (_) => _doLogin(),
          ),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.error.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _error!,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.error.withValues(alpha: 0.9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text(
            AppLocalizations.of(context)!.cancel,
            style: const TextStyle(color: AppColors.textSecondary),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: _isLoading ? null : _doLogin,
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(AppLocalizations.of(context)!.login),
        ),
      ],
    );
  }
}
