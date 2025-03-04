import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:divar_aviz/data/promotion/model/promotion.dart';
import 'package:flutter/material.dart';

class PromotionItemTitle extends StatelessWidget {
  const PromotionItemTitle({
    super.key,
    required this.promotion,
    required this.alignment,
    required this.textAlign,
  });

  final Promotion promotion;
  final CrossAxisAlignment alignment;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimentions.twellve,
        vertical: Dimentions.egith,
      ),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Text(
            promotion.title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            height: Dimentions.six,
          ),
          Text(
            promotion.descryption,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorNeutral.darkGrey,
                  fontSize: 13,
                  height: 1.2,
                ),
            textAlign: textAlign,
          ),
        ],
      ),
    );
  }
}
