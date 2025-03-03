import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackArrow;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorPrimary.backgroundColor,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: showBackArrow,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
