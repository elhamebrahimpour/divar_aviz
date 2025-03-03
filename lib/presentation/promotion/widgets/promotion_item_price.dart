import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:divar_aviz/data/promotion/model/promotion.dart';
import 'package:flutter/material.dart';

class PromotionItemPrice extends StatelessWidget {
  const PromotionItemPrice({
    super.key,
    required this.promotion,
  });

  final Promotion promotion;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'قیمت:',
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorPrimary.textBlackColor,
              ),
        ),
        Container(
          height: 26,
          padding: const EdgeInsets.symmetric(
              horizontal: Dimentions.egith, vertical: Dimentions.four),
          decoration: BoxDecoration(
            color: ColorPrimary.textGreyColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(Dimentions.radius4),
          ),
          child: Text(
            promotion.price,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ColorPrimary.mainColor,
                ),
          ),
        ),
      ],
    );
  }
}
