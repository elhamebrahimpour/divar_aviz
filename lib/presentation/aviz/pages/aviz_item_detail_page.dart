import 'package:divar_aviz/domain/utils/dashed_line_vertical.dart';
import 'package:divar_aviz/presentation/aviz/widgets/map_widget.dart';
import 'package:flutter/material.dart';

import '../../../data/model/aviz.dart';
import '../../../domain/utils/dashed_line_horizontal.dart';
import '../../app/resources/theme_colors.dart';
import '../widgets/detail_app_bar_widget.dart';

class AvizItemDetailPage extends StatefulWidget {
  final Aviz aviz;

  const AvizItemDetailPage({
    super.key,
    required this.aviz,
  });

  @override
  State<AvizItemDetailPage> createState() => _AvizItemDetailPageState();
}

class _AvizItemDetailPageState extends State<AvizItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const DetailAppBarWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height / 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 160,
                  margin: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.asset(
                    'assets/images/${widget.aviz.image}.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '۱۶ دقیقه پیش در گرگان',
                      style: textTheme.bodyMedium?.copyWith(
                        color: ColorBase.textGreyColor,
                      ),
                    ),
                    Container(
                      height: 29,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'آپارتمان',
                        style: textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  widget.aviz.title,
                  textAlign: TextAlign.end,
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomPaint(
                  size: const Size(double.infinity, 1),
                  painter: DashedLineHorizontalPainter(),
                ),
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.grey[200]!,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.grey[400],
                        ),
                        const Spacer(),
                        Text('!هشدارهای قبل از معامله',
                            style: textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const DetailPropertyTabs()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPropertyTabs extends StatefulWidget {
  const DetailPropertyTabs({super.key});

  @override
  State<DetailPropertyTabs> createState() => _DetailPropertyTabsState();
}

class _DetailPropertyTabsState extends State<DetailPropertyTabs>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 3);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          dividerColor: Colors.transparent,
          isScrollable: true,
          labelStyle: textTheme.bodySmall,
          unselectedLabelColor: ColorBase.mainColor,
          unselectedLabelStyle: textTheme.bodySmall,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorBase.mainColor,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'توضیحات',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'ویژگی ها و امکانات',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'قیمت',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'مشخصات',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.1,
          child: TabBarView(
            controller: _tabController,
            children: [
              _descriptionView(textTheme),
              _facilitiesView(textTheme),
              _priceView(textTheme),
              _propertiesView(textTheme),
            ],
          ),
        )
      ],
    );
  }

  Widget _descriptionView(TextTheme textTheme) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        const Text(
          'ویلا ۵۰۰ متری در خیابان صیاد شیرازی ویو عالی وسط جنگل قیمت فوق العاده  گذاشتم فروش فوری  خریدار باشی تخفیف پای معامله میدم.',
          textAlign: TextAlign.end,
        ),
        const SizedBox(
          height: 32,
        ),
        _buildCall(textTheme),
      ],
    );
  }

  Column _facilitiesView(TextTheme textTheme) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'ویژگی ها',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(
              width: 6,
            ),
            Image.asset('assets/images/icon_properties.png'),
          ],
        ),
        Container(
          height: 98,
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: Colors.grey[300]!,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'تک برگ',
                    style: textTheme.bodyMedium,
                  ),
                  Text(
                    'سند',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'شمالی',
                    style: textTheme.bodyMedium,
                  ),
                  Text(
                    'جهت ساختمان',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'امکانات',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(
              width: 6,
            ),
            Image.asset('assets/images/icon_facilities.png'),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: Colors.grey[300]!,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                'آسانسور',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'پارکینگ',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'انباری',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'بالکن',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'پنت هاوس',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'جنس کف سرامیک',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'سرویس بهداشتی ایرانی و فرنگی',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        _buildCall(textTheme),
      ],
    );
  }

  Column _priceView(TextTheme textTheme) {
    return Column(
      children: [
        Container(
          height: 98,
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: Colors.grey[300]!,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '46.460.000',
                    style: textTheme.bodyMedium,
                  ),
                  Text(
                    ':قیمت هر متر ',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DashedLineHorizontalPainter(),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '46.460.000',
                    style: textTheme.bodyMedium,
                  ),
                  Text(
                    ':قیمت کل',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        _buildCall(textTheme),
      ],
    );
  }

  Column _propertiesView(TextTheme textTheme) {
    return Column(
      children: [
        _buildProperties(textTheme),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'موقعیت مکانی',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(
              width: 6,
            ),
            Image.asset('assets/images/icon_map.png'),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        MapWidget(textTheme: textTheme),
        const SizedBox(
          height: 32,
        ),
        _buildCall(textTheme)
      ],
    );
  }

  Container _buildProperties(TextTheme textTheme) {
    return Container(
      height: 98,
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
          color: Colors.grey[300]!,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildPropertyItems(textTheme, 'ساخت', '1402'),
          CustomPaint(
            size: const Size(1, 50),
            painter: DashedLineVerticalPainter(),
          ),
          _buildPropertyItems(textTheme, 'طبقه', 'دوبلکس'),
          CustomPaint(
            size: const Size(1, 50),
            painter: DashedLineVerticalPainter(),
          ),
          _buildPropertyItems(textTheme, 'اتاق', '6'),
          CustomPaint(
            size: const Size(1, 50),
            painter: DashedLineVerticalPainter(),
          ),
          _buildPropertyItems(textTheme, 'متراژ', '500'),
        ],
      ),
    );
  }

  Column _buildPropertyItems(TextTheme textTheme, String title, String number) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          number,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }

  Row _buildCall(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 46,
          width: 159,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: ColorBase.mainColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'اطلاعات تماس',
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.rtl,
                  style: textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Image.asset('assets/images/icon_call.png'),
            ],
          ),
        ),
        Container(
          height: 46,
          width: 159,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: ColorBase.mainColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'گفتگو',
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.rtl,
                  style: textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Image.asset('assets/images/icon_message.png'),
            ],
          ),
        ),
      ],
    );
  }
}
