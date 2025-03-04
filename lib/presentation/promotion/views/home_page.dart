import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
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
            SliverToBoxAdapter(
              child: SectionTitleWidget(
                sectionName: 'آگهی های داغ',
                onSeeAllClicked: () => context.pushNavigator(
                  const SeeAllAvizPage(),
                ),
              ),
            ),
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
            SliverToBoxAdapter(
              child: SectionTitleWidget(
                sectionName: 'آگهی های اخیر',
                onSeeAllClicked: () => context.pushNavigator(
                  const SeeAllAvizPage(),
                ),
              ),
            ),
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
}

class SectionTitleWidget extends StatelessWidget {
  final String? sectionName;
  final Function? onSeeAllClicked;

  const SectionTitleWidget({
    super.key,
    this.sectionName,
    this.onSeeAllClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimentions.sixteen,
        right: Dimentions.sixteen,
        top: Dimentions.twenty,
        bottom: Dimentions.egith,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => onSeeAllClicked?.call(),
            child: Text(
              'مشاهده همه',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ColorNeutral.darkGrey,
                  ),
            ),
          ),
          Text(
            sectionName ?? 'بخش',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
