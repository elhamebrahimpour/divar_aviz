import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/data/promotion/model/promotion.dart';
import 'package:divar_aviz/presentation/app/widgets/custom_app_bar.dart';
import 'package:divar_aviz/presentation/promotion/views/subViews/see_all_promotions_page.dart';
import 'package:flutter/material.dart';

import '../widgets/promotion_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Promotion> mockData = [
    Promotion(
      title: 'ویلا ۵۰۰ متری زیر قیمت',
      descryption: 'ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری',
      image: 'asset0',
      price: '۲۵٬۶۸۳٬۰۰۰٬۰۰۰',
    ),
    Promotion(
      title: 'واحد ۵ خواب متراژ ۲۵۰',
      descryption: 'دکور شیک و مینیمال، موقعیت عالی، ۳ طبقه، ۳ واحد',
      image: 'asset1',
      price: '۸٬۲۰۰٬۰۰۰٬۰۰۰',
    ),
    Promotion(
      title: 'واحد دوبلکس فول امکانات',
      descryption: 'سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل',
      image: 'asset2',
      price: '۸٬۲۰۰٬۰۰۰٬۰۰۰',
    ),
    Promotion(
      title: 'پنت هاوس ۳۰۰ متری ناهارخوران',
      descryption: 'تحویل فوری، ویو عالی به همراه امکانات فول',
      image: 'asset3',
      price: '۵٬۹۰۰٬۰۰۰٬۰۰۰',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'صفحه اصلی',
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildHotestTitle(context),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 287,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mockData.length,
                    itemBuilder: (context, index) {
                      return VerticalPromotionItemWidget(
                        promotion: mockData[index],
                      );
                    },
                  ),
                ),
              ),
            ),
            _buildRecentTitle(context),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return HorizontalPromotionItemWidget(
                    promotion: mockData[index],
                  );
                },
                childCount: mockData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding _buildHotestTitle(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 30,
        right: MediaQuery.of(context).size.width / 30,
        top: 20,
        bottom: 12,
      ),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => context.pushNavigator(
                const SeeAllAvizPage(),
              ),
              child: Text(
                'مشاهده همه',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorPrimary.textGreyColor,
                    ),
              ),
            ),
            Text(
              'آگهی های داغ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding _buildRecentTitle(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 30,
        right: MediaQuery.of(context).size.width / 30,
        top: 26,
        bottom: 12,
      ),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => context.pushNavigator(
                const SeeAllAvizPage(),
              ),
              child: Text(
                'مشاهده همه',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorPrimary.textGreyColor,
                    ),
              ),
            ),
            Text(
              'آگهی های اخیر',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
