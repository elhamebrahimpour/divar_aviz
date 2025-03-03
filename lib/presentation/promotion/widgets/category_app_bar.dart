import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:flutter/material.dart';

class CategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Function? onBack;
  final Function? onClose;
  final bool hasCloseIcon;
  final bool hasBackIcon;

  const CategoryAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.onClose,
    this.hasCloseIcon = false,
    this.hasBackIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: hasCloseIcon
          ? GestureDetector(
              onTap: () => onClose?.call(),
              child: Image.asset(
                getPng('icon_close'),
              ),
            )
          : const SizedBox.shrink(),
      title: title,
      actions: [
        hasBackIcon
            ? GestureDetector(
                onTap: () => onBack?.call(),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Image.asset(
                    getPng('icon_arrow_right'),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
