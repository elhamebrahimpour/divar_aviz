import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:flutter/material.dart';

class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double? margin;

  const CachedImageWidget({
    super.key,
    required this.imageUrl,
    this.height = 160,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: margin ?? Dimentions.twenty,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(Dimentions.radius4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimentions.radius4),
        child: Image.asset(
          getPng(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
