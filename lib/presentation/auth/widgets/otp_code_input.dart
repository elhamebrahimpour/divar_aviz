import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class OTPCodeInput extends StatefulWidget {
  const OTPCodeInput({
    super.key,
  });

  @override
  State<OTPCodeInput> createState() => _OTPCodeInputState();
}

class _OTPCodeInputState extends State<OTPCodeInput> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  Color containerColor = const Color(0xffF9FAFB);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 48,
      width: 73,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: _textEditingController,
        focusNode: _focusNode,
        autofocus: false,
        textAlign: TextAlign.center,
        maxLines: 1,
        keyboardType: TextInputType.number,
        cursorColor: ColorPrimary.mainColor,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        onChanged: (value) {
          setState(() {
            value.isNotEmpty
                ? containerColor = const Color(0xffEAECF0)
                : containerColor = const Color(0xffF9FAFB);
          });

          value.length == 1
              ? FocusScope.of(context).nextFocus()
              : value.isEmpty
                  ? FocusScope.of(context).previousFocus()
                  : null;
        },
      ),
    );
  }
}
