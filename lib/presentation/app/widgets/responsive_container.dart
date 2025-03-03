import 'package:divar_aviz/config/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResponsiveContainer extends StatelessWidget {
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final bool isDialog;

  const ResponsiveContainer({
    super.key,
    this.height,
    this.color,
    this.margin,
    this.padding,
    required this.child,
    this.isDialog = false,
  });

  @override
  Widget build(BuildContext context) {
    if (Env.platform != web) {
      return child;
    } else {
      if (isDialog) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: _buildContainer(context),
        );
      } else {
        return Center(
          child: _buildContainer(context),
        );
      }
    }
  }

  Container _buildContainer(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      color: color,
      width: (Env.platform == web &&
              Responsive.getWidth(context) > Responsive.adaptiveWidth)
          ? Responsive.adaptiveWidth
          : null, // this cause to center the child even in web platfrom
      height: height,
      child: child,
    );
  }
}
