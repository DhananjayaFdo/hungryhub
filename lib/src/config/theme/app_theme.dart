import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color PRIMARY = Color(0xFF1FCCC2);
  static const Color BLUE = Color(0xFF3E5481);
  static const Color ASH = Color(0xFFEDEFF3);
  static const Color white = Colors.white;

  static ThemeData light = ThemeData(
    primaryColor: AppTheme.PRIMARY,
    scaffoldBackgroundColor: AppTheme.ASH,

    //? -------------
    textTheme: const TextTheme(
      //? -------
      bodySmall: TextStyle(fontSize: 12, color: AppTheme.BLUE),
      bodyMedium: TextStyle(fontSize: 15, color: AppTheme.BLUE),
      bodyLarge: TextStyle(fontSize: 18, color: AppTheme.BLUE),

      //? -------
      titleSmall: TextStyle(fontSize: 12, color: AppTheme.BLUE, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(fontSize: 15, color: AppTheme.BLUE, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(fontSize: 18, color: AppTheme.BLUE, fontWeight: FontWeight.w700),
    ),
  );

  static ThemeData dark = ThemeData(
    primaryColor: AppTheme.PRIMARY,
    textTheme: const TextTheme(
      //? -------
      bodySmall: TextStyle(fontSize: 12, color: AppTheme.BLUE),
      bodyMedium: TextStyle(fontSize: 15, color: AppTheme.BLUE),
      bodyLarge: TextStyle(fontSize: 18, color: AppTheme.BLUE),

      //? -------
      titleSmall: TextStyle(fontSize: 12, color: AppTheme.BLUE, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(fontSize: 15, color: AppTheme.BLUE, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(fontSize: 18, color: AppTheme.BLUE, fontWeight: FontWeight.w700),
    ),
  );
}
