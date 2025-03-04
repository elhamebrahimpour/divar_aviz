import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final themeData = ThemeData(
    scaffoldBackgroundColor: ColorPrimary.backgroundColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: ColorPrimary.textBlackColor,
        fontSize: 24,
        fontFamily: 'SB',
      ),
      titleMedium: TextStyle(
        color: ColorPrimary.textBlackColor,
        fontSize: 20,
        fontFamily: 'SB',
      ),
      titleSmall: TextStyle(
        color: ColorPrimary.textBlackColor,
        fontSize: 16,
        fontFamily: 'SB',
      ),
      bodyLarge: TextStyle(
        color: ColorPrimary.textBlackColor,
        fontSize: 18,
        fontFamily: 'SM',
      ),
      bodyMedium: TextStyle(
        color: ColorPrimary.textBlackColor,
        fontSize: 16,
        fontFamily: 'SM',
      ),
      bodySmall: TextStyle(
        color: ColorPrimary.textBlackColor,
        fontSize: 14,
        fontFamily: 'SM',
      ),
      labelLarge: TextStyle(
        color: ColorPrimary.textBlackColor,
        fontSize: 14,
        fontFamily: 'SB',
      ),
      labelMedium: TextStyle(
        color: ColorPrimary.textBlackColor,
        fontSize: 12,
        fontFamily: 'SB',
      ),
      labelSmall: TextStyle(
        color: ColorPrimary.textBlackColor,
        fontSize: 10,
        fontFamily: 'SB',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(66, 26),
        backgroundColor: ColorPrimary.mainColor,
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
          color: ColorPrimary.mainColor,
        ),
        backgroundColor: Colors.white,
      ),
    ),
  );
}
