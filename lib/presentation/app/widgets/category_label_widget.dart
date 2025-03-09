import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:flutter/material.dart';

class CategoryLabelWidget extends StatelessWidget {
  final String label;

  const CategoryLabelWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 29,
      padding: const EdgeInsets.symmetric(
          horizontal: Dimentions.twellve, vertical: Dimentions.six),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(Dimentions.radius4),
      ),
      child: Text(
        label,
        style: textTheme.labelMedium?.copyWith(
          color: ColorPrimary.purple,
        ),
      ),
    );
  }
}
