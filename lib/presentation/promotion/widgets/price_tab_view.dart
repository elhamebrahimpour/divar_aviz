import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dashed_line_horizontal.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:flutter/material.dart';

class PriceTabView extends StatefulWidget {
  const PriceTabView({super.key});

  @override
  State<PriceTabView> createState() => _PriceTabViewState();
}

class _PriceTabViewState extends State<PriceTabView> {
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
              'قیمت',
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '46.460.000',
                    style: textTheme.bodyLarge,
                  ),
                  Text(
                    ':قیمت هر متر ',
                    style: textTheme.labelLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, Dimentions.sixteen),
                painter: DashedLineHorizontalPainter(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '46.460.000',
                    style: textTheme.bodyLarge,
                  ),
                  Text(
                    ':قیمت کل',
                    style: textTheme.labelLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
