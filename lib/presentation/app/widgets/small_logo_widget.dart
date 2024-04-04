import 'package:flutter/material.dart';

class SmallLogoWidget extends StatelessWidget {
  const SmallLogoWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 74,
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
        top: 4,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF2F4F7),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'آویز',
            style: textTheme.bodySmall!.copyWith(fontSize: 16),
          ),
          Image.asset(
            'assets/images/small_logo_colored.png',
            height: 26,
            width: 26,
          ),
        ],
      ),
    );
  }
}
