import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dashed_line_horizontal.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:flutter/material.dart';

class FacilitiesTabView extends StatefulWidget {
  const FacilitiesTabView({super.key});

  @override
  State<FacilitiesTabView> createState() => _FacilitiesTabViewState();
}

class _FacilitiesTabViewState extends State<FacilitiesTabView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const SizedBox(
          height: Dimentions.sixteen,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'امکانات',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(
              width: 6,
            ),
            Image.asset(
              getPng('icon_facilities'),
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
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                'آسانسور',
                style: textTheme.bodySmall,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'پارکینگ',
                style: textTheme.bodySmall,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'انباری',
                style: textTheme.bodySmall,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'بالکن',
                style: textTheme.bodySmall,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'پنت هاوس',
                style: textTheme.bodySmall,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'جنس کف سرامیک',
                style: textTheme.bodySmall,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'سرویس بهداشتی ایرانی و فرنگی',
                style: textTheme.bodySmall,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
