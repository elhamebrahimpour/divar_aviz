import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/data/promotion/model/promotion.dart';
import 'package:divar_aviz/presentation/promotion/views/aviz_item_detail_page.dart';
import 'package:flutter/material.dart';

class HorizontalAvizItem extends StatelessWidget {
  final Promotion aviz;
  const HorizontalAvizItem({
    required this.aviz,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNavigator(
        AvizItemDetailPage(
          aviz: aviz,
        ),
      ),
      child: Container(
        height: 139,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: ColorPrimary.textGreyColor.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: -10,
              offset: const Offset(0.0, 8),
            )
          ],
        ),
        child: Row(
          children: [
            _buildImage(),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    aviz.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    aviz.descryption,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorPrimary.textGreyColor,
                        ),
                    textAlign: TextAlign.end,
                  ),
                  const Spacer(),
                  _buildPrice(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildImage() {
    return Container(
      height: 111,
      width: 111,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Image.asset(
        'assets/images/${aviz.image}.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Row _buildPrice(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 26,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: ColorPrimary.textGreyColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            aviz.price,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Text(
          'قیمت:',
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ColorPrimary.textBlackColor,
              ),
        ),
      ],
    );
  }
}
