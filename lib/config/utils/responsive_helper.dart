import 'package:flutter/material.dart';

const String web = 'WEB';
const String android = 'ANDROID';
const String iOS = 'IOS';

class Env {
  static const String platform = web;

  static const bool isProduction = false;
}

class Responsive {
  getResponsiveValue({
    dynamic forShortScreen,
    dynamic forLargeScreen,
    dynamic forMobLandScapeMode,
    dynamic forTabletScreen,
    required BuildContext context,
  }) {
    if (isDesktop(context)) {
      return forLargeScreen ?? forShortScreen;
    } else if (isTablet(context)) {
      return forTabletScreen ?? forLargeScreen ?? forShortScreen;
    } else if (isMobile(context) && isLandscape(context)) {
      return forMobLandScapeMode ?? forShortScreen;
    } else {
      return forShortScreen;
    }
  }

  static const double adaptiveWidth = 500;
  static const int mobileBreakpoint = 480;
  static const int tabletBreakpoint = 840;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double hTwoThirds(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return height - (height / 3);
  }

  static double wTwoThirds(BuildContext context) {
    double width = getAdaptiveWidth(context);
    return width - (width / 3);
  }

  static double getAdaptiveWidth(BuildContext context) {
    if (Env.platform == web) {
      double w = MediaQuery.of(context).size.width;
      if (w < adaptiveWidth) {
        return w;
      } else {
        return adaptiveWidth;
      }
    } else {
      return MediaQuery.of(context).size.width;
    }
  }

  static double adaptiveTitleText(BuildContext context) =>
      isDesktop(context) ? 22 : 20;

  static double adaptiveBodyText(BuildContext context) =>
      isDesktop(context) ? 16 : 14;
}
