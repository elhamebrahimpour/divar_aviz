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
      appBar: _buildAppBar(textTheme),
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
              'همه آویزها',
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
