import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:flutter/material.dart';

class BoardingViewItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final String? subTitle;

  const BoardingViewItemWidget({
    super.key,
    required this.image,
    required this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 86),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Stack(
              children: [
                Image.asset(
                  getPng('back_pattern'),
                ),
                Center(
                  child: Image.asset(
                    image,
                    height: 225,
                    width: 225,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Dimentions.twentyTwo,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: Dimentions.twentyTwo,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimentions.thirtyTwo,
            ),
            child: Text(
              subTitle ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorPrimary.textGreyColor,
                    letterSpacing: 0.7,
                    height: 1.5,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
