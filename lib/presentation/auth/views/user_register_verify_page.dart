import 'dart:async';

import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/presentation/dashboard/views/dashboard_page.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/presentation/auth/widgets/otp_code_input.dart';
import 'package:flutter/material.dart';

class UserRegisterVerificationPage extends StatefulWidget {
  const UserRegisterVerificationPage({super.key});

  @override
  State<UserRegisterVerificationPage> createState() =>
      _UserRegisterVerificationPageState();
}

class _UserRegisterVerificationPageState
    extends State<UserRegisterVerificationPage> {
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
                  'کد ثبت نام پیامک شده را وارد کنید',
                  style: textTheme.bodySmall!.copyWith(
                    color: ColorPrimary.textGreyColor,
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
                      style: textTheme.bodyMedium!.copyWith(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '00:$_countdownValue ',
                    style: textTheme.bodySmall?.copyWith(
                      color: ColorPrimary.textGreyColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => context.pushNavigator(const DashboardPage()),
                child: Container(
                  height: 48,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ColorPrimary.mainColor,
                  ),
                  child: Center(
                    child: Text(
                      'تایید ثبت نام',
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
