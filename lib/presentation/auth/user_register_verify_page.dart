import 'package:divar_aviz/presentation/app/resources/theme_colors.dart';
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
                    onPressed: () {},
                    child: Text(
                      'ارسال مجدد کد',
                      style: textTheme.bodyMedium!.copyWith(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '00:00',
                    style: textTheme.bodySmall!.copyWith(
                      color: ColorBase.textGreyColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
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
                    'تایید ثبت نام',
                    style: textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      color: Colors.white,
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
