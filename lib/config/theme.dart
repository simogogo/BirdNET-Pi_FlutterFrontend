import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Accesso centralizzato ai colori dell'app.
/// I getter leggono [_isDark] al momento del build, così quando [setDark]
/// viene chiamato e MaterialApp viene ricostruito con il nuovo ThemeMode,
/// tutti i widget che usano AppColors.xxx ottengono i colori aggiornati
/// senza alcuna modifica al loro codice.
class AppColors {
  AppColors._();

  static bool _isDark = true;

  /// Chiamato da app.dart ad ogni build, PRIMA che i widget figli vengano costruiti.
  static void setDark(bool isDark) => _isDark = isDark;

  // ── Sfondi e superfici ────────────────────────────────────────────────────
  static Color get background =>
      _isDark ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  static Color get surface =>
      _isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF0FAF5);
  static Color get card =>
      _isDark ? const Color(0xFF252525) : const Color(0xFFE8F5F0);
  static Color get cardElevated =>
      _isDark ? const Color(0xFF2C2C2C) : const Color(0xFFDCEFE9);

  // ── Brand / Accenti ───────────────────────────────────────────────────────
  static Color get primary =>
      _isDark ? const Color(0xFF2E7D32) : const Color(0xFF006D5B);
  static Color get primaryLight =>
      _isDark ? const Color(0xFF66BB6A) : const Color(0xFF009688);
  static Color get primaryDark =>
      _isDark ? const Color(0xFF1B5E20) : const Color(0xFF00695C);
  static Color get accent =>
      _isDark ? const Color(0xFF81C784) : const Color(0xFF4DB6AC);

  // ── Testo ─────────────────────────────────────────────────────────────────
  static Color get textPrimary =>
      _isDark ? const Color(0xFFE0E0E0) : const Color(0xFF1B5E20);
  static Color get textSecondary =>
      _isDark ? const Color(0xFF9E9E9E) : const Color(0xFF212121);
  static Color get textHint =>
      _isDark ? const Color(0xFF616161) : const Color(0xFF78909C);

  // ── Struttura ─────────────────────────────────────────────────────────────
  static Color get divider =>
      _isDark ? const Color(0xFF333333) : const Color(0xFFDEECE3);

  // ── Stato ─────────────────────────────────────────────────────────────────
  static Color get error =>
      _isDark ? const Color(0xFFEF5350) : const Color(0xFFFF5252);
  static Color get warning =>
      _isDark ? const Color(0xFFFFA726) : const Color(0xFFFB8C00);
  static Color get success =>
      _isDark ? const Color(0xFF66BB6A) : const Color(0xFF009688);

  // ── Confidenza ────────────────────────────────────────────────────────────
  static Color get confidenceHigh =>
      _isDark ? const Color(0xFF4CAF50) : const Color(0xFF00695C);
  static Color get confidenceMedium =>
      _isDark ? const Color(0xFFFFC107) : const Color(0xFF26A69A);
  static Color get confidenceLow =>
      _isDark ? const Color(0xFFFF5722) : const Color(0xFFB2DFDB);

  // ── Servizi ───────────────────────────────────────────────────────────────
  static Color get serviceActive =>
      _isDark ? const Color(0xFF4CAF50) : const Color(0xFF009688);
  static Color get serviceInactive =>
      _isDark ? const Color(0xFFFFA726) : const Color(0xFFFB8C00);
  static Color get serviceError =>
      _isDark ? const Color(0xFFEF5350) : const Color(0xFFFF5252);
}

class AppTheme {
  static ThemeData get darkTheme => _buildTheme(Brightness.dark);
  static ThemeData get lightTheme => _buildTheme(Brightness.light);

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    // Palette locale al tema — usata solo dentro ThemeData
    final bg = isDark ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
    final surf = isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF0FAF5);
    final cardCol = isDark ? const Color(0xFF252525) : const Color(0xFFE8F5F0);
    final primary = isDark ? const Color(0xFF2E7D32) : const Color(0xFF006D5B);
    final primaryLight = isDark ? const Color(0xFF66BB6A) : const Color(0xFF009688);
    final textPrimary = isDark ? const Color(0xFFE0E0E0) : const Color(0xFF1B5E20);
    final textSecondary = isDark ? const Color(0xFF9E9E9E) : const Color(0xFF212121);
    final textHint = isDark ? const Color(0xFF616161) : const Color(0xFF78909C);
    final divider = isDark ? const Color(0xFF333333) : const Color(0xFFDEECE3);
    final error = isDark ? const Color(0xFFEF5350) : const Color(0xFFFF5252);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: isDark ? Colors.white : Colors.white,
        secondary: primaryLight,
        onSecondary: isDark ? Colors.black : Colors.white,
        surface: surf,
        onSurface: textPrimary,
        error: error,
        onError: Colors.white,
      ),
      textTheme: GoogleFonts.interTextTheme(
        isDark ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
      ).copyWith(
        headlineLarge: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(fontSize: 16, color: textPrimary),
        bodyMedium: GoogleFonts.inter(fontSize: 14, color: textSecondary),
        bodySmall: GoogleFonts.inter(fontSize: 12, color: textHint),
        labelLarge: GoogleFonts.robotoMono(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: primaryLight,
        ),
      ),
      cardTheme: CardThemeData(
        color: cardCol,
        elevation: isDark ? 0 : 1,
        shadowColor: isDark ? null : divider,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: surf,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        iconTheme: IconThemeData(color: primaryLight),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surf,
        selectedItemColor: primaryLight,
        unselectedItemColor: textHint,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      drawerTheme: DrawerThemeData(backgroundColor: surf),
      dividerTheme: DividerThemeData(color: divider, thickness: 0.5),
      chipTheme: ChipThemeData(
        backgroundColor: cardCol,
        labelStyle: GoogleFonts.inter(fontSize: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: primaryLight,
        inactiveTrackColor: divider,
        thumbColor: primaryLight,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return primaryLight;
          return textHint;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primary.withValues(alpha: 0.5);
          }
          return divider;
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardCol,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryLight, width: 1.5),
        ),
        hintStyle: GoogleFonts.inter(color: textHint),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}
