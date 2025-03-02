import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/regex.dart';
import 'package:divar_aviz/presentation/app/widgets/buttons/custom_filled_button.dart';
import 'package:divar_aviz/presentation/app/widgets/inputs/text_form_field_widget.dart';
import 'package:divar_aviz/presentation/auth/views/user_login_verify_page.dart';
import 'package:divar_aviz/presentation/app/views/welcome_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 10,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'ورود',
                    style: textTheme.bodyMedium,
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
                        color: ColorNeutral.darkGrey,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
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
                    const UserLoginVerificationPage(),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => context.pushNavigator(
                        const WelcomePage(),
                      ),
                      child: Text(
                        'ثبت نام',
                        style: textTheme.labelLarge,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'تاحالا ثبت نام نکردی؟',
                      style: textTheme.bodySmall!.copyWith(
                        color: ColorPrimary.textGreyColor,
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
      ),
    );
  }
}
