import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:flutter/material.dart';

class CallRowWidget extends StatelessWidget {
  const CallRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {},
          child: _buildItemContainer(
            textTheme,
            'اطلاعات تماس',
            'icon_call',
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: _buildItemContainer(
            textTheme,
            'گفتگو',
            'icon_message',
          ),
        ),
      ],
    );
  }

  Widget _buildItemContainer(
    TextTheme textTheme,
    String title,
    String icon,
  ) {
    return Container(
      height: 46,
      width: 159,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: ColorPrimary.mainColor,
        borderRadius: BorderRadius.circular(Dimentions.radius6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            textDirection: TextDirection.rtl,
            style: textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Image.asset(
            getPng(icon),
          ),
        ],
      ),
    );
  }
}
