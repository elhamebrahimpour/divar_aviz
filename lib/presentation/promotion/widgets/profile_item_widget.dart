import 'package:flutter/material.dart';

class ProfileItemwidget extends StatelessWidget {
  final String title;
  final String? icon;
  final TextTheme textTheme;
  final Function? onItemTapped;

  const ProfileItemwidget({
    super.key,
    required this.title,
    this.icon,
    required this.textTheme,
    this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTapped?.call(),
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.grey[200]!,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.grey[400],
            ),
            const Spacer(),
            Text(title, style: textTheme.bodyMedium),
            const SizedBox(
              width: 16,
            ),
            if (icon != null) Image.asset('assets/images/$icon.png'),
          ],
        ),
      ),
    );
  }
}
