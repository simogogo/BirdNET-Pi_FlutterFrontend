import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/api_config.dart';

/// Stato di autenticazione dell'app
class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String? username;
  final String? password;
  final String? error;

  const AuthState({
    this.isAuthenticated = false,
    this.isLoading = false,
    this.username,
    this.password,
    this.error,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? username,
    String? password,
    String? error,
    bool clearError = false,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      username: username ?? this.username,
      password: password ?? this.password,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

/// Provider centralizzato per l'autenticazione
final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

class AuthNotifier extends Notifier<AuthState> {
  late final Dio _dio;

  @override
  AuthState build() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: ApiConfig.connectTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
      ),
    );
    _loadCredentials();
    return const AuthState();
  }

  /// Carica credenziali salvate e verifica se sono ancora valide
  Future<void> _loadCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('auth_username');
    final password = prefs.getString('auth_password');

    if (username != null &&
        username.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      state = state.copyWith(
        username: username,
        password: password,
        isLoading: true,
        clearError: true,
      );
      try {
        final response = await _dio.post(
          ApiConfig.authLogin,
          data: {'username': username, 'password': password},
          options: Options(contentType: 'application/json'),
        );
        if (response.data['success'] == true) {
          state = state.copyWith(isAuthenticated: true, isLoading: false);
          return;
        }
      } catch (_) {
        // Credenziali non più valide o server non raggiungibile
      }
      state = state.copyWith(isAuthenticated: false, isLoading: false);
    }
  }

  /// Effettua login con verifica API
  Future<bool> login(String username, String password) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final response = await _dio.post(
        ApiConfig.authLogin,
        data: {'username': username, 'password': password},
        options: Options(contentType: 'application/json'),
      );

      if (response.data['success'] == true) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_username', username);
        await prefs.setString('auth_password', password);

        // Aggiorna anche le credenziali stream per compatibilità
        await prefs.setString('stream_username', username);
        await prefs.setString('stream_password', password);

        state = AuthState(
          isAuthenticated: true,
          isLoading: false,
          username: username,
          password: password,
        );
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.data['error'] ?? 'Credenziali non valide',
        );
        return false;
      }
    } on DioException catch (e) {
      String errorMsg;
      if (e.response?.statusCode == 401) {
        errorMsg = e.response?.data?['error'] ?? 'Credenziali non valide';
      } else {
        errorMsg = 'Errore di connessione al server';
      }
      state = state.copyWith(isLoading: false, error: errorMsg);
      return false;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Errore imprevisto: $e');
      return false;
    }
  }

  /// Effettua logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_username');
    await prefs.remove('auth_password');
    await prefs.remove('stream_username');
    await prefs.remove('stream_password');

    state = const AuthState();
  }

  /// Resetta l'errore
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
