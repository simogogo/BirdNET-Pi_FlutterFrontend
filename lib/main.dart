import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Disabilita il caricamento dei font da internet (usa solo gli asset locali)
  GoogleFonts.config.allowRuntimeFetching = false;

  await initializeDateFormatting('it', null);
  runApp(const ProviderScope(child: BirdNetPiApp()));
}
