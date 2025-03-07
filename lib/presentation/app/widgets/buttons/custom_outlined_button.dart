import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final IconData? icon;
  final Color? color;
  final double? radius;
  final bool isLoading;
  final bool isEnable;
  final double? width;
  final double? margin;
  final Function onClicked;
  final bool hasBorder;

  const CustomOutlinedButton({
    super.key,
    required this.title,
    required this.isLoading,
    required this.onClicked,
    this.titleColor,
    this.icon,
    this.width,
    this.color,
    this.radius,
    this.margin,
    this.isEnable = true,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    double w = width ?? double.infinity;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? Dimentions.sixteen),
      width: w,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(w, 42),
          padding: const EdgeInsets.symmetric(
              horizontal: Dimentions.fifteen, vertical: Dimentions.four),
          backgroundColor: Colors.transparent,
          side: !hasBorder
              ? BorderSide.none
              : BorderSide(
                  width: 1.3,
                  color: isEnable
                      ? color ?? ColorPrimary.mainColor
                      : ColorNeutral.darkGrey,
                  // strokeAlign: BorderSide.strokeAlignOutside,
                ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? Dimentions.radius6),
            ),
          ),
        ),
        onPressed: () => (isEnable && isLoading == false) ? onClicked() : null,
        child: (isLoading)
            ? Center(
                child: Container(
                  margin: const EdgeInsets.only(
                      left: Dimentions.ten, right: Dimentions.ten),
                  width: 16,
                  height: 16,
                  child: const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ColorPrimary.white),
                  ),
                ),
              )
            : !hasBorder
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: isEnable
                                  ? (titleColor ?? ColorPrimary.mainColor)
                                  : ColorNeutral.darkGrey,
                            ),
                      ),
                      const SizedBox(width: Dimentions.six),
                      Icon(
                        icon,
                        color: color,
                      ),
                    ],
                  )
                : Center(
                    child: icon == null
                        ? Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: isEnable
                                      ? (titleColor ?? ColorPrimary.mainColor)
                                      : ColorNeutral.darkGrey,
                                ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                icon,
                                color: color,
                              ),
                              const SizedBox(width: Dimentions.six),
                              Text(
                                title,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: isEnable
                                          ? (titleColor ??
                                              ColorPrimary.mainColor)
                                          : ColorNeutral.darkGrey,
                                    ),
                              ),
                            ],
                          ),
                  ),
      ),
    );
  }
}
