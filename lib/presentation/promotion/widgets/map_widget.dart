import 'package:divar_aviz/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';


class MapWidget extends StatelessWidget {
  final TextTheme textTheme;

  const MapWidget({
    super.key,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 144,
            width: 343,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          Container(
            height: 46,
            width: 185,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: ColorBase.mainColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/icon_location.png'),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    'تبریز، بازار، بازار برق تبریز، طبقه همکف',
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                    style: textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
