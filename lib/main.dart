import 'package:divar_aviz/core/theme/app_theme.dart';
import 'package:divar_aviz/di/di_init.dart';
import 'package:divar_aviz/presentation/app/views/boarding_page.dart';
import 'package:flutter/material.dart';

void main() async {
  await getItInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: const OnBoardingPage(),
    );
  }
}
