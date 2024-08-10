import 'package:divar_aviz/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextTheme textTheme;
  final String title;
  final bool showBackArrow;

  const CustomAppBar({
    super.key,
    required this.textTheme,
    required this.title,
    this.showBackArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorBase.backgroundColor,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: showBackArrow,
      elevation: 0,
      centerTitle: true,
      title: Container(
        height: 32,
        padding: const EdgeInsets.only(
          left: 4,
          right: 4,
          top: 4,
          bottom: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: textTheme.bodySmall!.copyWith(fontSize: 16),
            ),
            const SizedBox(
              width: 8,
            ),
            Image.asset(
              'assets/images/small_logo_colored.png',
              height: 26,
              width: 26,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
