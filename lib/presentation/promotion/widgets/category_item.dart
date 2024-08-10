import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final TextTheme textTheme;
  final String title;

  const CategoryItem({
    super.key,
    required this.textTheme,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
          color: const Color(0xffF2F4F7),
        ),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/arrow-left.png'),
          const Spacer(),
          Text(
            title,
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
