import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/data/promotion/model/promotion.dart';
import 'package:divar_aviz/presentation/app/widgets/custom_app_bar.dart';
import 'package:divar_aviz/presentation/promotion/views/see_all_aviz_page.dart';
import 'package:flutter/material.dart';

import '../widgets/vertical_aviz_item_widget.dart';
import '../widgets/horizontal_aviz_item_widget.dart';

class AdvertisementsPage extends StatefulWidget {
  const AdvertisementsPage({super.key});

  @override
  State<AdvertisementsPage> createState() => _AdvertisementsPageState();
}

class _AdvertisementsPageState extends State<AdvertisementsPage> {
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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(
        textTheme: textTheme,
        title: 'آویز',
      ),
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  CustomScrollView _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildHotestTitle(context),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 290,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mockData.length,
                itemBuilder: (context, index) {
                  return VerticalAvizItem(
                    aviz: mockData[index],
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
              return HorizontalAvizItem(
                aviz: mockData[index],
              );
            },
            childCount: mockData.length,
          ),
        )
      ],
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
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorPrimary.textGreyColor,
                    ),
              ),
            ),
            Text(
              'آویزهای داغ',
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
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorPrimary.textGreyColor,
                    ),
              ),
            ),
            Text(
              'آویزهای اخیر',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
