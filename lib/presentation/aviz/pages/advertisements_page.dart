import 'package:divar_aviz/domain/utils/ext_context.dart';
import 'package:divar_aviz/presentation/app/resources/theme_colors.dart';
import 'package:divar_aviz/data/model/aviz.dart';
import 'package:divar_aviz/presentation/aviz/pages/see_all_aviz_page.dart';
import 'package:flutter/material.dart';

import '../widgets/vertical_aviz_item_widget.dart';
import '../widgets/horizontal_aviz_item_widget.dart';

class AdvertisementsPage extends StatefulWidget {
  const AdvertisementsPage({super.key});

  @override
  State<AdvertisementsPage> createState() => _AdvertisementsPageState();
}

class _AdvertisementsPageState extends State<AdvertisementsPage> {
  final List<Aviz> mockData = [
    Aviz(
      title: 'ویلا ۵۰۰ متری زیر قیمت',
      descryption: 'ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری',
      image: 'asset0',
      price: '۲۵٬۶۸۳٬۰۰۰٬۰۰۰',
    ),
    Aviz(
      title: 'واحد ۵ خواب متراژ ۲۵۰',
      descryption: 'دکور شیک و مینیمال، موقعیت عالی، ۳ طبقه، ۳ واحد',
      image: 'asset1',
      price: '۸٬۲۰۰٬۰۰۰٬۰۰۰',
    ),
    Aviz(
      title: 'واحد دوبلکس فول امکانات',
      descryption: 'سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل',
      image: 'asset2',
      price: '۸٬۲۰۰٬۰۰۰٬۰۰۰',
    ),
    Aviz(
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
      appBar: _buildAppBar(textTheme),
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
            height: 286,
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
                      color: ColorBase.textGreyColor,
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
                      color: ColorBase.textGreyColor,
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

  AppBar _buildAppBar(TextTheme textTheme) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Container(
        height: 32,
        padding: const EdgeInsets.only(
          left: 4,
          right: 4,
          top: 4,
          bottom: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'آویز',
              style: textTheme.bodySmall!.copyWith(fontSize: 16),
            ),
            const SizedBox(
              width: 8,
            ),
            Image.asset(
              'assets/images/small_logo_colored.png',
              height: 26,
              width: 26,
            ),
          ],
        ),
      ),
    );
  }
}
