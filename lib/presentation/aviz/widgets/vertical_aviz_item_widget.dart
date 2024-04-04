import 'package:flutter/material.dart';

import '../../../data/model/aviz.dart';
import '../../app/resources/theme_colors.dart';

class VerticalAvizItem extends StatelessWidget {
  final Aviz aviz;
  const VerticalAvizItem({
    required this.aviz,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 224,
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: ColorBase.textGreyColor.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: -10,
            offset: const Offset(0.0, 8),
          )
        ],
      ),
      child: Column(
        children: [
          _buildImage(),
          _buildTitle(context),
          const Spacer(),
          _buildPrice(context),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Container _buildImage() {
    return Container(
      height: 112,
      width: 192,
      color: Colors.transparent,
      child: Image.asset(
        'assets/images/${aviz.image}.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Padding _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            aviz.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            aviz.descryption,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorBase.textGreyColor,
                ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Row _buildPrice(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'قیمت:',
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ColorBase.textBlackColor,
              ),
        ),
        Container(
          height: 26,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: ColorBase.textGreyColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            aviz.price,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
