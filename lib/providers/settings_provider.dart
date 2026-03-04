import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider = NotifierProvider<SettingsNotifier, AppSettings>(() {
  return SettingsNotifier();
});

class AppSettings {
  final bool isConnected;

  AppSettings({this.isConnected = false});

  AppSettings copyWith({bool? isConnected}) {
    return AppSettings(isConnected: isConnected ?? this.isConnected);
  }
}

class SettingsNotifier extends Notifier<AppSettings> {
  @override
  AppSettings build() {
    return AppSettings();
  }

  void setConnected(bool connected) {
    state = state.copyWith(isConnected: connected);
  }
}
