import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/data/promotion/model/promotion.dart';
import 'package:divar_aviz/presentation/promotion/widgets/promotion_item_image.dart';
import 'package:divar_aviz/presentation/promotion/widgets/promotion_item_price.dart';
import 'package:divar_aviz/presentation/promotion/widgets/promotion_item_title.dart';
import 'package:flutter/material.dart';

import '../views/subViews/promotion_item_detail_page.dart';

class VerticalPromotionItemWidget extends StatelessWidget {
  final Promotion promotion;

  const VerticalPromotionItemWidget({
    required this.promotion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNavigator(
        PromotionItemDetailPage(
          promotion: promotion,
        ),
      ),
      child: Container(
        width: 224,
        margin: const EdgeInsets.only(
          left: 8,
          right: 16,
          top: 8,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          color: ColorPrimary.white,
          borderRadius: BorderRadius.circular(Dimentions.radius6),
          boxShadow: [
            BoxShadow(
              color: ColorPrimary.lightPurple.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: -10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 3,
            ),
            PromotionItemImage(
              image: promotion.image,
              isVertical: true,
            ),
            PromotionItemTitle(
              promotion: promotion,
              alignment: CrossAxisAlignment.start,
              textAlign: TextAlign.start,
            ),
            const Spacer(),
            PromotionItemPrice(
              promotion: promotion,
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalPromotionItemWidget extends StatelessWidget {
  final Promotion promotion;

  const HorizontalPromotionItemWidget({
    required this.promotion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNavigator(
        PromotionItemDetailPage(
          promotion: promotion,
        ),
      ),
      child: Container(
        height: 139,
        margin: const EdgeInsets.only(
          left: 8,
          right: 16,
          top: 8,
          bottom: 12,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: ColorPrimary.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: ColorPrimary.lightPurple.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: -10,
              offset: const Offset(0, 0),
            )
          ],
        ),
        child: Row(
          children: [
            PromotionItemImage(
              image: promotion.image,
              isVertical: false,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                children: [
                  PromotionItemTitle(
                    promotion: promotion,
                    alignment: CrossAxisAlignment.end,
                    textAlign: TextAlign.end,
                  ),
                  const Spacer(),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: PromotionItemPrice(
                      promotion: promotion,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
