import 'package:flutter/material.dart';

import '../../../data/model/aviz.dart';
import '../../app/resources/theme_colors.dart';

class HorizontalAvizItem extends StatelessWidget {
  final Aviz aviz;
  const HorizontalAvizItem({
    required this.aviz,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 139,
      width: 343,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                        color: ColorBase.textGreyColor,
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
            color: ColorBase.textGreyColor.withOpacity(0.1),
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
                color: ColorBase.textBlackColor,
              ),
        ),
      ],
    );
  }
}
