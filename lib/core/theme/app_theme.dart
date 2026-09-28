import 'package:flutter/material.dart';

class AppTheme {
  static const telegramBlue = Color(0xff229ed9);
  static ThemeData light() => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: telegramBlue),
  );
  static ThemeData dark() => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: telegramBlue,
      brightness: Brightness.dark,
    ),
  );
}
