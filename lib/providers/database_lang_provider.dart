import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';

/// Provider che recupera DATABASE_LANG dal server (cached).
/// Non richiede autenticazione.
final databaseLangProvider = FutureProvider<String>((ref) async {
  return ref.read(apiServiceProvider).getDatabaseLang();
});
