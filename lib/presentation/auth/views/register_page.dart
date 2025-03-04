import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/regex.dart';
import 'package:divar_aviz/config/utils/responsive_helper.dart';
import 'package:divar_aviz/presentation/app/widgets/buttons/custom_filled_button.dart';
import 'package:divar_aviz/presentation/app/widgets/inputs/text_form_field_widget.dart';
import 'package:divar_aviz/presentation/app/widgets/responsive_container.dart';
import 'package:divar_aviz/presentation/auth/views/login_page.dart';
import 'package:divar_aviz/presentation/auth/views/register_verification_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      'خوش اومدی به آویز',
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
                      'این فوق العادست که آویزو برای آگهی هات انتخاب کردی!',
                      style: textTheme.bodySmall?.copyWith(
                        color: ColorNeutral.darkGrey,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  TextFormFieldWidget(
                    hint: 'نام و نام خانوادگی',
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    onChanged: (String? value) {},
                  ),
                  TextFormFieldWidget(
                    hint: 'شماره موبایل',
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    maxLength: 11,
                    textInputFormatters: [numberFormatter],
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'لطفا شماره موبایل را وارد نمایید.';
                      }

                      if (!value.startsWith('0')) {
                        return 'شماره موبایل باید با صفر شروع شود.';
                      }
                    },
                    onChanged: (String? value) {},
                  ),
                  const Spacer(),
                  CustomFilledButton(
                    title: 'مرحله بعد',
                    isLoading: false,
                    icon: getPng('icon_arrow_left'),
                    onClicked: () => context.pushNavigator(
                      const RegisterVerificationPage(),
                    ),
                  ),
                  const SizedBox(
                    height: Dimentions.sixteen,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => context.pushNavigator(
                          const LoginPage(),
                        ),
                        child: Text(
                          'ورود',
                          style: textTheme.labelLarge,
                        ),
                      ),
                      const SizedBox(
                        width: Dimentions.six,
                      ),
                      Text(
                        'قبلا ثبت نام نکردی؟',
                        style: textTheme.bodySmall?.copyWith(
                          color: ColorPrimary.textGreyColor,
                        ),
                      ),
                    ],
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
