import 'package:flutter/material.dart';

class HomeBottomIndicator extends StatelessWidget {
  const HomeBottomIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: double.infinity,
      color: const Color(0xffF9FAFB),
      child: Center(
        child: Container(
          height: 5,
          width: 134,
          decoration: BoxDecoration(
            color: const Color(0xffEDEDED),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
