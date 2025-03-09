import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:flutter/material.dart';

class DescriptionTabView extends StatefulWidget {
  const DescriptionTabView({super.key});

  @override
  State<DescriptionTabView> createState() => _DescriptionTabViewState();
}

class _DescriptionTabViewState extends State<DescriptionTabView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'توضیحات',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(
              width: 6,
            ),
            Image.asset(
              getPng('icon_properties'),
              color: ColorPrimary.mainColor,
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: Dimentions.sixteen,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: Dimentions.twellve,
            vertical: Dimentions.twellve,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimentions.radius4),
            border: Border.all(
              width: 1,
              color: ColorNeutral.lightestGrey,
            ),
          ),
          child: Text(
            'ویلا ۵۰۰ متری در خیابان صیاد شیرازی ویو عالی وسط جنگل قیمت فوق العاده  گذاشتم فروش فوری  خریدار باشی تخفیف پای معامله میدم.',
            textAlign: TextAlign.justify,
            textDirection: TextDirection.rtl,
            style: textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
