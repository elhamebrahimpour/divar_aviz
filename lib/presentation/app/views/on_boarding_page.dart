import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/presentation/auth/views/register_page.dart';
import 'package:divar_aviz/presentation/app/widgets/boarding_view_item_widget.dart';
import 'package:divar_aviz/presentation/app/widgets/buttons/custom_filled_button.dart';
import 'package:divar_aviz/presentation/app/widgets/buttons/custom_outlined_button.dart';
import 'package:divar_aviz/presentation/app/widgets/responsive_container.dart';
import 'package:divar_aviz/presentation/auth/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({
    super.key,
  });

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    BoardingViewItemWidget(
                      image: getPng('back_asset'),
                      title: 'اینجا محل آگهی شماست',
                      subTitle:
                          'در آویز ملک خود را برای فروش،اجاره و رهن آگهی کنید و یا اگر دنبال ملک با مشخصات دلخواه خود هستید آویز ها را ببینید',
                    ),
                    BoardingViewItemWidget(
                      image: getPng('back_asset'),
                      title: 'اینجا محل آگهی شماست',
                    ),
                    BoardingViewItemWidget(
                      image: getPng('back_asset'),
                      title: 'اینجا محل آگهی شماست',
                      subTitle:
                          'در آویز ملک خود را برای فروش،اجاره و رهن آگهی کنید و یا اگر دنبال ملک با مشخصات دلخواه خود هستید آویز ها را ببینید',
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotColor: ColorNeutral.lightGrey,
                  activeDotColor: ColorPrimary.mainColor,
                  dotHeight: 7,
                  dotWidth: 7,
                  expansionFactor: 3,
                ),
              ),
              const SizedBox(
                height: Dimentions.thirtyTwo,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      title: 'ورود',
                      isLoading: false,
                      onClicked: () => context.pushNavigator(
                        const LoginPage(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomFilledButton(
                      title: 'ثبت نام',
                      isLoading: false,
                      onClicked: () => context.pushNavigator(
                        const RegisterPage(),
                      ),
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
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
