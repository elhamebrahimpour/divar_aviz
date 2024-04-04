import 'package:divar_aviz/presentation/app/resources/app_theme.dart';
import 'package:divar_aviz/presentation/app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: const HomePage(),
    );
  }
}
