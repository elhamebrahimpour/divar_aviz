import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class DetailAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const DetailAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorPrimary.backgroundColor,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      title: Row(
        children: [
          _buildActions(icon: 'icon_archive', onClicked: () {}),
          const SizedBox(
            width: 12,
          ),
          _buildActions(icon: 'icon_share', onClicked: () {}),
          const SizedBox(
            width: 12,
          ),
          _buildActions(icon: 'icon_information', onClicked: () {}),
          const Spacer(),
          _buildActions(
            icon: 'arrow_right',
            onClicked: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildActions({required String icon, Function? onClicked}) =>
      GestureDetector(
        onTap: () => onClicked?.call(),
        child: Image.asset('assets/images/$icon.png'),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
