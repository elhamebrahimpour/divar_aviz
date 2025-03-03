import 'dart:async';

import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/presentation/app/widgets/buttons/custom_filled_button.dart';
import 'package:divar_aviz/presentation/app/widgets/responsive_container.dart';
import 'package:divar_aviz/presentation/app/views/main_page.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/presentation/auth/widgets/otp_code_input.dart';
import 'package:flutter/material.dart';

class LoginVerificationPage extends StatefulWidget {
  const LoginVerificationPage({super.key});

  @override
  State<LoginVerificationPage> createState() => _LoginVerificationPageState();
}

class _LoginVerificationPageState extends State<LoginVerificationPage> {
  int _countdownValue = 45;
  final int _timerInterval = 1;

  void _startCountdown() {
    Timer.periodic(Duration(seconds: _timerInterval), (timer) {
      if (_countdownValue > 0) {
        setState(() {
          _countdownValue--;
        });
      } else {
        timer.cancel();
        setState(() {
          _countdownValue = 45;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ResponsiveContainer(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimentions.twentyTwo),
                  child: Text(
                    'تایید شماره موبایل',
                    style: textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  height: Dimentions.thirtyTwo,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimentions.twentyTwo),
                  child: Text(
                    'کد ورود پیامک شده را وارد کنید',
                    style: textTheme.bodySmall?.copyWith(
                      color: ColorNeutral.darkGrey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimentions.sixteen,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OTPCodeInput(),
                    OTPCodeInput(),
                    OTPCodeInput(),
                    OTPCodeInput(),
                  ],
                ),
                const SizedBox(
                  height: Dimentions.thirtyTwo,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (_countdownValue == 45) {
                          _startCountdown();
                        }
                        return;
                      },
                      child: Text(
                        'ارسال مجدد کد',
                        style: textTheme.bodySmall?.copyWith(
                          color: ColorPrimary.textGreyColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '00:$_countdownValue',
                      style: textTheme.bodyMedium!.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                const Spacer(),
                CustomFilledButton(
                  title: 'تایید ورود',
                  isLoading: false,
                  onClicked: () => context.pushNavigator(
                    const MainPage(),
                  ),
                ),
                const SizedBox(
                  height: Dimentions.twentyTwo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
