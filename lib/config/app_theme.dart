import 'package:divar_aviz/config/theme_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final themeData = ThemeData(
    scaffoldBackgroundColor: ThemeColors.backgroundColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: ThemeColors.textBlackColor,
        fontSize: 16,
        fontFamily: 'SB',
      ),
      bodySmall: TextStyle(
        color: ThemeColors.mainColor,
        fontSize: 14,
        fontFamily: 'SM',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(159, 40),
        backgroundColor: ThemeColors.mainColor,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'SM',
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(159, 40),
        side: const BorderSide(
          width: 1,
          color: ThemeColors.mainColor,
        ),
        backgroundColor: Colors.white,
      ),
    ),
  );
}
