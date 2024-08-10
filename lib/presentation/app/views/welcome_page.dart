import 'package:divar_aviz/core/utils/ext_context.dart';
import 'package:divar_aviz/core/theme/theme_colors.dart';
import 'package:divar_aviz/presentation/app/widgets/small_logo_widget.dart';
import 'package:divar_aviz/presentation/auth/views/login_page.dart';
import 'package:divar_aviz/presentation/auth/views/user_register_verify_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SmallLogoWidget(textTheme: textTheme),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'خوش اومدی به آویز',
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'این فوق العادست که آویزو برای آگهی هات انتخاب کردی!',
                  style: textTheme.bodySmall!.copyWith(
                    color: ColorBase.textGreyColor,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              UserCredentialTextField(
                textTheme: textTheme,
                hintText: 'نام و نام خانوادگی',
                textInputType: TextInputType.name,
              ),
              const SizedBox(
                height: 22,
              ),
              UserCredentialTextField(
                textTheme: textTheme,
                hintText: 'شماره موبایل',
                textInputType: TextInputType.phone,
              ),
              const Spacer(),
              NextStepButton(textTheme: textTheme),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => context.pushNavigator(const LoginPage()),
                    child: Text(
                      'ورود',
                      style: textTheme.bodySmall!.copyWith(fontFamily: 'SB'),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    'قبلا ثبت نام نکردی؟',
                    style: textTheme.bodySmall!.copyWith(
                      color: ColorBase.textGreyColor,
                    ),
                  ),
                ],
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

class NextStepButton extends StatelessWidget {
  const NextStepButton({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNavigator(const UserRegisterVerificationPage()),
      child: Container(
        height: 48,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ColorBase.mainColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icon_arrow_left.png'),
            const SizedBox(
              width: 6,
            ),
            Text(
              'مرحله بعد',
              style: textTheme.bodySmall!.copyWith(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserCredentialTextField extends StatelessWidget {
  const UserCredentialTextField({
    super.key,
    required this.textTheme,
    required this.hintText,
    required this.textInputType,
  });

  final TextTheme textTheme;
  final String hintText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF9FAFB),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        keyboardType: textInputType,
        textAlign: TextAlign.end,
        cursorColor: ColorBase.mainColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: textTheme.bodySmall!.copyWith(
            fontSize: 16,
            color: const Color(0xffD0D5DD),
          ),
        ),
      ),
    );
  }
}
