import 'package:divar_aviz/config/app_theme.dart';
import 'package:divar_aviz/presentation/pages/home_page.dart';
import 'package:divar_aviz/presentation/widgets/home_indicator.dart';
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
      home: const Column(
        children: [
          Expanded(
            child: HomePage(),
          ),
          HomeBottomIndicator(),
        ],
      ),
    );
  }
}
