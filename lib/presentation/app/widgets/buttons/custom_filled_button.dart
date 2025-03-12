import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final String? icon;
  final bool isIconTransfrom;
  final Color? color;
  final double? radius;
  final bool isLoading;
  final bool isEnable;
  final double? width;
  final double? margin;
  final Function onClicked;

  const CustomFilledButton({
    super.key,
    required this.title,
    required this.isLoading,
    required this.onClicked,
    this.titleColor,
    this.icon,
    this.isIconTransfrom = false,
    this.color,
    this.radius,
    this.isEnable = true,
    this.margin,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    double w = width ?? double.infinity;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? Dimentions.sixteen),
      width: w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: Size(w, 46),
          padding: const EdgeInsets.symmetric(
              horizontal: Dimentions.fifteen, vertical: Dimentions.four),
          backgroundColor: isEnable
              ? color ?? ColorPrimary.mainColor
              : ColorNeutral.mediumGrey,
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
            : Center(
                child: icon == null
                    ? Text(
                        title,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: !isEnable
                                ? ColorPrimary.white
                                : ColorPrimary.white),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.flip(
                            flipX: isIconTransfrom ? true : false,
                            child: SvgPicture.asset(
                              '$icon',
                            ),
                          ),
                          const SizedBox(
                            width: Dimentions.six,
                          ),
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: !isEnable
                                        ? ColorPrimary.white
                                        : ColorPrimary.white),
                          ),
                        ],
                      ),
              ),
      ),
    );
  }
}
