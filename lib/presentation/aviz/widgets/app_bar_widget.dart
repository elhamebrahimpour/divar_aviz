import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget childWidget;
  final Function? onBack;
  final Function? onClose;

  const AppBarWidget({
    super.key,
    required this.childWidget,
    this.onBack,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => onClose?.call(),
        child: Image.asset('assets/images/icon_close.png'),
      ),
      title: childWidget,
      actions: [
        GestureDetector(
          onTap: () => onBack?.call(),
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset('assets/images/icon_arrow_right.png'),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
