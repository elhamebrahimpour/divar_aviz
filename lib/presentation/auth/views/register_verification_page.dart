import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/config/utils/responsive_helper.dart';
import 'package:divar_aviz/presentation/app/widgets/buttons/custom_filled_button.dart';
import 'package:divar_aviz/presentation/app/views/main_page.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/presentation/app/widgets/responsive_container.dart';
import 'package:divar_aviz/presentation/auth/widgets/resend_code_widget.dart';
import 'package:divar_aviz/presentation/auth/widgets/code_input_widget.dart';
import 'package:flutter/material.dart';

class RegisterVerificationPage extends StatefulWidget {
  const RegisterVerificationPage({super.key});

  @override
  State<RegisterVerificationPage> createState() =>
      _RegisterVerificationPageState();
}

class _RegisterVerificationPageState extends State<RegisterVerificationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      'کد پیامک شده را وارد کنید',
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
                      if (code.length == 4) {
                        print(code);
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
                    title: 'تایید ثبت نام',
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
