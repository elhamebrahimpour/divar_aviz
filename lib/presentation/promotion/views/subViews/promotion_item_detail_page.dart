import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dashed_line_horizontal.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:divar_aviz/data/promotion/model/promotion.dart';
import 'package:divar_aviz/presentation/app/widgets/cached_image_widget.dart';
import 'package:divar_aviz/presentation/app/widgets/category_label_widget.dart';
import 'package:divar_aviz/presentation/promotion/widgets/promotion_detail_tabs_widget.dart';
import 'package:flutter/material.dart';
import '../../widgets/detail_app_bar_widget.dart';

class PromotionItemDetailPage extends StatefulWidget {
  final Promotion promotion;

  const PromotionItemDetailPage({
    super.key,
    required this.promotion,
  });

  @override
  State<PromotionItemDetailPage> createState() =>
      _PromotionItemDetailPageState();
}

class _PromotionItemDetailPageState extends State<PromotionItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const DetailAppBarWidget(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: Dimentions.sixteen,
            ),
            CachedImageWidget(
              imageUrl: widget.promotion.image,
            ),
            const SizedBox(
              height: Dimentions.sixteen,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimentions.twentyTwo),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.promotion.dateTime ?? '۱۶ دقیقه پیش در گرگان',
                    textDirection: TextDirection.rtl,
                    style: textTheme.bodySmall?.copyWith(
                      color: ColorPrimary.textGreyColor,
                    ),
                  ),
                  const CategoryLabelWidget(
                    label: 'آپارتمان',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Dimentions.egithteen,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimentions.sixteen),
              child: Text(
                widget.promotion.title,
                textAlign: TextAlign.end,
                style: textTheme.bodyMedium,
              ),
            ),
            const SizedBox(
              height: Dimentions.egithteen,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimentions.sixteen),
              child: CustomPaint(
                size: const Size(double.infinity, 20),
                painter: DashedLineHorizontalPainter(),
              ),
            ),
            _buildAlertConatiner(textTheme),
            const SizedBox(
              height: Dimentions.thirtyTwo,
            ),
            const Expanded(
              child: PromotionDetailTabsWidget(),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildAlertConatiner(TextTheme textTheme) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: Dimentions.sixteen),
        padding: const EdgeInsets.symmetric(horizontal: Dimentions.sixteen),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.grey[200]!,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Image.asset(
              getPng('arrow-left'),
              color: ColorNeutral.darkGrey,
            ),
            const Spacer(),
            Text('!هشدارهای قبل از معامله', style: textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
