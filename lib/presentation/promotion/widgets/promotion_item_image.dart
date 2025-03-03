import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:flutter/material.dart';

class PromotionItemImage extends StatelessWidget {
  final String image;
  final bool isVertical;

  const PromotionItemImage({
    super.key,
    required this.image,
    required this.isVertical,
  });

  @override
  Widget build(BuildContext context) {
    return isVertical
        ? Container(
            height: 112,
            width: 192,
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimentions.radius4),
              child: Image.asset(
                getPng(image),
                fit: BoxFit.fitWidth,
              ),
            ),
          )
        : Container(
            height: 111,
            width: 111,
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimentions.radius4),
              child: Image.asset(
                getPng(image),
                fit: BoxFit.cover,
              ),
            ),
          );
  }
}
