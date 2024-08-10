import 'package:divar_aviz/core/utils/ext_context.dart';
import 'package:divar_aviz/core/theme/theme_colors.dart';
import 'package:divar_aviz/presentation/app/widgets/small_logo_widget.dart';
import 'package:divar_aviz/presentation/auth/views/user_login_verify_page.dart';
import 'package:divar_aviz/presentation/app/views/welcome_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      width: 8,
                    ),
                    Text(
                      'ورود به',
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
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    'خوشحالیم که مجددا آویز رو برای آگهی انتخاب کردی!',
                    style: textTheme.bodySmall!.copyWith(
                      color: ColorBase.textGreyColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              CredentialTextField(textTheme: textTheme),
              const Spacer(),
              NextStepButton(textTheme: textTheme),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => context.pushNavigator(const WelcomePage()),
                    child: Text(
                      'ثبت نام',
                      style: textTheme.bodySmall!.copyWith(fontFamily: 'SB'),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    'تاحالا ثبت نام نکردی؟  ',
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

class CredentialTextField extends StatelessWidget {
  const CredentialTextField({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

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
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.end,
        cursorColor: ColorBase.mainColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'شماره موبایل',
          hintStyle: textTheme.bodySmall!.copyWith(
            fontSize: 16,
            color: const Color(0xffD0D5DD),
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
      onTap: () => context.pushNavigator(const UserLoginVerificationPage()),
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
              style: textTheme.bodySmall?.copyWith(
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
