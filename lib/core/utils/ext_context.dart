import 'package:flutter/material.dart';

extension DynamicContext on BuildContext {
  pushNavigator(Widget destinationScreen) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.of(this).push(
          MaterialPageRoute(
            builder: ((context) {
              return destinationScreen;
            }),
          ),
        );
      },
    );
  }

  pushReplacementNavigator(Widget destinationScreen) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.of(this).pushReplacement(
          MaterialPageRoute(
            builder: ((context) {
              return destinationScreen;
            }),
          ),
        );
      },
    );
  }
}