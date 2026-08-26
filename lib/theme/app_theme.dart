import 'package:flutter/material.dart';

class AppTheme {
  static const accent = Color(0xFF8B7CFF);
  static const cyan = Color(0xFF55D6FF);

  static ThemeData light() => ThemeData(useMaterial3: true, brightness: Brightness.light, scaffoldBackgroundColor: const Color(0xFFF5F6FA), colorScheme: ColorScheme.fromSeed(seedColor: accent, brightness: Brightness.light), fontFamily: 'sans');
  static ThemeData dark() => ThemeData(useMaterial3: true, brightness: Brightness.dark, scaffoldBackgroundColor: const Color(0xFF090A10), colorScheme: ColorScheme.fromSeed(seedColor: accent, brightness: Brightness.dark), fontFamily: 'sans');
}
