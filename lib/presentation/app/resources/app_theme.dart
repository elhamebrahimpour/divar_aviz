import 'package:divar_aviz/presentation/app/resources/theme_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final themeData = ThemeData(
    scaffoldBackgroundColor: ColorBase.backgroundColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: ColorBase.textBlackColor,
        fontSize: 16,
        fontFamily: 'SB',
      ),
      bodySmall: TextStyle(
        color: ColorBase.mainColor,
        fontSize: 14,
        fontFamily: 'SM',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(159, 40),
        backgroundColor: ColorBase.mainColor,
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
          color: ColorBase.mainColor,
        ),
        backgroundColor: Colors.white,
      ),
    ),
  );
}
