import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeInputWidget extends StatefulWidget {
  final double width;
  final int numbers;
  final Function(String) onOtpChanged;

  const CodeInputWidget({
    super.key,
    this.width = 52,
    required this.onOtpChanged,
    required this.numbers,
  });

  @override
  State<CodeInputWidget> createState() => _CodeInputWidgetState();
}

class _CodeInputWidgetState extends State<CodeInputWidget> {
  late List<TextEditingController> _controllers;

  late List<FocusNode> _focusNodes;

  late List<bool> _hasFocus;

  Color borderColor = ColorNeutral.lightestGrey.withOpacity(0.4);

  @override
  void initState() {
    _controllers =
        List.generate(widget.numbers, (_) => TextEditingController());

    _focusNodes = List.generate(widget.numbers, (_) => FocusNode());

    _hasFocus = List.generate(widget.numbers, (_) => false);

    super.initState();

    _focusNodes[0].requestFocus();
    for (int i = 0; i < widget.numbers; i++) {
      _focusNodes[i].addListener(() {
        if (_focusNodes[i].hasFocus) {
          setState(() {
            _hasFocus[i] = true;
          });
        } else {
          setState(() {
            _hasFocus[i] = false;
          });
        }
      });
    }

    // _listenOtp();
  }

  // _listenOtp() async {
  //   await SmsAutoFill().listenForCode();

  //   SmsAutoFill().code.listen(
  //     (code) {
  //       _fillInputsAutomatically(code);
  //     },
  //   );
  // }

  // void _fillInputsAutomatically(String receivedOtp) {
  //   if (receivedOtp.length == 5) {
  //     for (int i = 0; i < 5; i++) {
  //       controllers[i].text = receivedOtp[i];
  //     }
  //     widget.onOtpChanged(receivedOtp);
  //     FocusScope.of(context).unfocus();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < widget.numbers; i++)
          Container(
            height: 48,
            width: 73,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: _hasFocus[i]
                  ? ColorPrimary.lightestPurple
                  : _controllers[i].text.isNotEmpty
                      ? ColorPrimary.lightestPurple
                      : borderColor,

              borderRadius: BorderRadius.circular(Dimentions.radius4),
              // border: Border.all(
              //   width: _controllers[i].text.isNotEmpty ? 2 : 1,
              //   color: _hasFocus[i]
              //       ? ColorPrimary.lightPurple
              //       : _controllers[i].text.isNotEmpty
              //           ? ColorPrimary.lightPurple
              //           : borderColor,
              // ),
            ),
            child: Center(
              child: SizedBox(
                width: widget.width * 0.68,
                child: TextField(
                  controller: _controllers[i],
                  focusNode: _focusNodes[i],
                  autofocus: false,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textInputAction: (i == widget.numbers - 1)
                      ? TextInputAction.done
                      : TextInputAction.next,
                  cursorColor: ColorPrimary.mainColor,
                  cursorWidth: 1.3,
                  maxLines: 1,
                  maxLength: 1,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                  ),
                  onChanged: (value) {
                    if (i == widget.numbers - 1 && value.isNotEmpty) {
                      // if the last code has entered
                      String otpCode = '';
                      for (var input in _controllers) {
                        otpCode = otpCode + input.text;
                      }

                      widget.onOtpChanged(otpCode);

                      FocusScope.of(context).unfocus();
                      // if fields are not empty
                    } else if (value.isNotEmpty) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty) {
                      // if previous one is empty
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }

    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }

    // SmsAutoFill().unregisterListener();

    super.dispose();
  }
}
