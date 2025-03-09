import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dashed_line_horizontal.dart';
import 'package:divar_aviz/config/utils/dashed_line_vertical.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:divar_aviz/presentation/promotion/widgets/map_widget.dart';
import 'package:flutter/material.dart';

class PropertiesTabView extends StatefulWidget {
  const PropertiesTabView({super.key});

  @override
  State<PropertiesTabView> createState() => _PropertiesTabViewState();
}

class _PropertiesTabViewState extends State<PropertiesTabView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'ویژگی‌ها',
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
        _buildProperties(textTheme),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'موقعیت مکانی',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(
              width: 6,
            ),
            Image.asset(
              getPng('icon_map'),
              color: ColorPrimary.mainColor,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        MapWidget(textTheme: textTheme),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }

  Container _buildProperties(TextTheme textTheme) {
    return Container(
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPropertyItems(textTheme, 'ساخت', '1402'),
              CustomPaint(
                size: const Size(1, 50),
                painter: DashedLineVerticalPainter(),
              ),
              _buildPropertyItems(textTheme, 'طبقه', 'دوبلکس'),
              CustomPaint(
                size: const Size(1, 50),
                painter: DashedLineVerticalPainter(),
              ),
              _buildPropertyItems(textTheme, 'اتاق', '6'),
              CustomPaint(
                size: const Size(1, 50),
                painter: DashedLineVerticalPainter(),
              ),
              _buildPropertyItems(textTheme, 'متراژ', '500'),
            ],
          ),
          const SizedBox(
            height: Dimentions.twentyTwo,
          ),
          CustomPaint(
            size: const Size(double.infinity, 22),
            painter: DashedLineHorizontalPainter(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'جهت ساختمان: شمالی',
                style: textTheme.labelMedium,
              ),
              Text(
                'سند: تک برگ',
                style: textTheme.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildPropertyItems(TextTheme textTheme, String title, String number) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: textTheme.bodySmall,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          number,
          style: textTheme.titleSmall,
        ),
      ],
    );
  }
}
