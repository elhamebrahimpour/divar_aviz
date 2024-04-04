import 'package:divar_aviz/presentation/app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../data/model/aviz.dart';
import '../widgets/horizontal_aviz_item_widget.dart';

class SeeAllAvizPage extends StatefulWidget {
  const SeeAllAvizPage({super.key});

  @override
  State<SeeAllAvizPage> createState() => _SeeAllAvizPageState();
}

class _SeeAllAvizPageState extends State<SeeAllAvizPage> {
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
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(
        textTheme: textTheme,
        title: 'همه آویزها',
      ),
      body: SafeArea(
        child: _buildBody(context),
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
                return HorizontalAvizItem(
                  aviz: mockData[index],
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
