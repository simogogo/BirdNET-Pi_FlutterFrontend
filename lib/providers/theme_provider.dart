import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/theme.dart';

const _kColorSchemeKey = 'color_scheme';

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(() {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    // Nota: l'init asincrono deve avvenire fuori dal build o tramite un meccanismo
    // specifico se vogliamo caricare da prefs.
    // Riverpod 3.x consiglia di caricare i valori iniziali in modo asincrono 
    // se necessario, ma per semplicità qui facciamo un trigger asincrono.
    _init();
    return ThemeMode.dark;
  }

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_kColorSchemeKey) ?? 'dark';
    final mode = saved == 'light' ? ThemeMode.light : ThemeMode.dark;
    AppColors.setDark(mode == ThemeMode.dark);
    state = mode;
  }

  /// Cambia tema in tempo reale e persiste in SharedPreferences.
  Future<void> setScheme(String scheme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kColorSchemeKey, scheme);
    final mode = scheme == 'light' ? ThemeMode.light : ThemeMode.dark;
    AppColors.setDark(mode == ThemeMode.dark);
    state = mode;
  }
}
