import 'package:divar_aviz/config/theme_colors.dart';
import 'package:divar_aviz/data/model/aviz.dart';
import 'package:flutter/material.dart';

class AdvertisementsPage extends StatefulWidget {
  const AdvertisementsPage({super.key});

  @override
  State<AdvertisementsPage> createState() => _AdvertisementsPageState();
}

class _AdvertisementsPageState extends State<AdvertisementsPage> {
  final List<Aviz> testList = [
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Container(
          height: 32,
          width: 74,
          padding: const EdgeInsets.only(
            left: 4,
            right: 4,
            top: 4,
            bottom: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'آویز',
                style: textTheme.bodySmall!.copyWith(fontSize: 16),
              ),
              Image.asset(
                'assets/images/small_logo_colored.png',
                height: 26,
                width: 26,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
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
                    Text(
                      'مشاهده همه',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ThemeColors.textGreyColor,
                          ),
                    ),
                    Text(
                      'آویزهای داغ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 286,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: testList.length,
                    itemBuilder: (context, index) {
                      return HotestAvizItem(
                        aviz: testList[index],
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverPadding(
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
                    Text(
                      'مشاهده همه',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ThemeColors.textGreyColor,
                          ),
                    ),
                    Text(
                      'آویزهای اخیر',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return RecentAvizItem(
                    aviz: testList[index],
                  );
                },
                childCount: testList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RecentAvizItem extends StatelessWidget {
  final Aviz aviz;
  const RecentAvizItem({
    required this.aviz,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 139,
      width: 343,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: ThemeColors.textGreyColor.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: -10,
            offset: const Offset(0.0, 8),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 111,
            width: 111,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Image.asset(
              'assets/images/${aviz.image}.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  aviz.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  aviz.descryption,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ThemeColors.textGreyColor,
                      ),
                  textAlign: TextAlign.end,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 26,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: ThemeColors.textGreyColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        aviz.price,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Text(
                      'قیمت:',
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ThemeColors.textBlackColor,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HotestAvizItem extends StatelessWidget {
  final Aviz aviz;
  const HotestAvizItem({
    required this.aviz,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        height: 235,
        width: 192,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: ThemeColors.textGreyColor.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: -10,
              offset: const Offset(0.0, 8),
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 112,
              width: 192,
              color: Colors.transparent,
              child: Image.asset(
                'assets/images/${aviz.image}.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    aviz.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    aviz.descryption,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ThemeColors.textGreyColor,
                        ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'قیمت:',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ThemeColors.textBlackColor,
                      ),
                ),
                Container(
                  height: 26,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: ThemeColors.textGreyColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    aviz.price,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
