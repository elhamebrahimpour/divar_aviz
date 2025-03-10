import 'package:divar_aviz/data/promotion/model/promotion.dart';
import 'package:divar_aviz/presentation/app/widgets/custom_app_bar.dart';
import 'package:divar_aviz/presentation/app/widgets/responsive_container.dart';
import 'package:divar_aviz/presentation/promotion/widgets/promotion_item_widget.dart';
import 'package:flutter/material.dart';

class SeeAllPromotionsPage extends StatefulWidget {
  const SeeAllPromotionsPage({super.key});

  @override
  State<SeeAllPromotionsPage> createState() => _SeeAllPromotionsPageState();
}

class _SeeAllPromotionsPageState extends State<SeeAllPromotionsPage> {
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
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'آگهی‌های داغ',
        ),
        body: SafeArea(
          child: _buildBody(context),
        ),
      ),
    );
  }

  CustomScrollView _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return HorizontalPromotionItemWidget(
                  promotion: mockData[index],
                );
              },
              childCount: mockData.length,
            ),
          ),
        )
      ],
    );
  }
}
