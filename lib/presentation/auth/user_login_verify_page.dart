import 'dart:async';

import 'package:divar_aviz/domain/utils/ext_context.dart';
import 'package:divar_aviz/presentation/app/home_page.dart';
import 'package:divar_aviz/presentation/app/resources/theme_colors.dart';
import 'package:divar_aviz/presentation/auth/widgets/otp_code_input.dart';
import 'package:flutter/material.dart';

class UserLoginVerificationPage extends StatefulWidget {
  const UserLoginVerificationPage({super.key});

  @override
  State<UserLoginVerificationPage> createState() =>
      _UserLoginVerificationPageState();
}

class _UserLoginVerificationPageState extends State<UserLoginVerificationPage> {
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

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'تایید شماره موبایل',
                  style: textTheme.bodyMedium,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'کد ورود پیامک شده را وارد کنید',
                  style: textTheme.bodySmall!.copyWith(
                    color: ColorBase.textGreyColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OTPCodeInput(
                    textTheme: textTheme,
                  ),
                  OTPCodeInput(
                    textTheme: textTheme,
                  ),
                  OTPCodeInput(
                    textTheme: textTheme,
                  ),
                  OTPCodeInput(
                    textTheme: textTheme,
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
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
                        color: ColorBase.textGreyColor,
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
              GestureDetector(
                onTap: () => context.pushNavigator(const HomePage()),
                child: Container(
                  height: 48,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ColorBase.mainColor,
                  ),
                  child: Center(
                    child: Text(
                      'تایید ورود',
                      style: textTheme.bodySmall!.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
