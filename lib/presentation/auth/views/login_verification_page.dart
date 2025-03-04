import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/config/utils/responsive_helper.dart';
import 'package:divar_aviz/presentation/app/widgets/buttons/custom_filled_button.dart';
import 'package:divar_aviz/presentation/auth/widgets/resend_code_widget.dart';
import 'package:divar_aviz/presentation/app/widgets/responsive_container.dart';
import 'package:divar_aviz/presentation/app/views/main_page.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/presentation/auth/widgets/code_input_widget.dart';
import 'package:flutter/material.dart';

class LoginVerificationPage extends StatefulWidget {
  const LoginVerificationPage({super.key});

  @override
  State<LoginVerificationPage> createState() => _LoginVerificationPageState();
}

class _LoginVerificationPageState extends State<LoginVerificationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String x = '';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ResponsiveContainer(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: Responsive.getHeight(context) / 10,
            ),
            child: Form(
              key: _formKey,
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
                  CodeInputWidget(
                    numbers: 4,
                    onOtpChanged: (code) {
                      x = code;

                      if (x.length == 4) {
                        print(x);
                      }
                    },
                  ),
                  const SizedBox(
                    height: Dimentions.thirtyTwo,
                  ),
                  ResendCodeWidget(
                    onResendCode: () {
                      // event call
                    },
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
      ),
    );
  }
}
