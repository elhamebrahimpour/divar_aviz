import 'package:divar_aviz/presentation/app/resources/theme_colors.dart';
import 'package:divar_aviz/presentation/app/widgets/small_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 10,
              ),
              color: Colors.white,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset('assets/images/back_pattern.png'),
                  Center(
                    child: Image.asset(
                      'assets/images/back_asset.png',
                      height: 225,
                      width: 225,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'آگهی شماست',
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(
                  width: 12,
                ),
                SmallLogoWidget(textTheme: textTheme),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'اینجا محل',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'در آویز ملک خود را برای فروش،اجاره و رهن آگهی کنید و یا اگر دنبال ملک با مشخصات دلخواه خود هستید آویز ها را ببینید',
                textAlign: TextAlign.center,
                style: textTheme.bodySmall!.copyWith(
                  color: ColorBase.textGreyColor,
                  letterSpacing: 1,
                  height: 1.5,
                ),
              ),
            ),
            const Spacer(),
            SmoothPageIndicator(
              controller: PageController(),
              count: 3,
              effect: const ExpandingDotsEffect(
                dotColor: Color(0xffEAECF0),
                activeDotColor: ColorBase.mainColor,
                dotHeight: 6,
                dotWidth: 6,
                expansionFactor: 3,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const LoginRegisterButton(),
            const SizedBox(
              height: 22,
            ),
          ],
        ),
      ),
    );
  }
}

class LoginRegisterButton extends StatelessWidget {
  const LoginRegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(
          onPressed: () {},
          style: Theme.of(context).outlinedButtonTheme.style,
          child: const Text(
            'ورود',
            style: TextStyle(
              color: ColorBase.mainColor,
              fontSize: 16,
              fontFamily: 'SM',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: Theme.of(context).elevatedButtonTheme.style,
          child: const Text(
            'ثبت نام',
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
