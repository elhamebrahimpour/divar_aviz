import 'package:divar_aviz/presentation/app/resources/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAvizPage extends StatefulWidget {
  const AddAvizPage({super.key});

  @override
  State<AddAvizPage> createState() => _AddAvizPageState();
}

class _AddAvizPageState extends State<AddAvizPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Image.asset('assets/images/icon_close.png'),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'آویز',
              style: textTheme.bodySmall!.copyWith(fontSize: 16),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'ثبت',
              style: textTheme.bodyMedium!.copyWith(fontSize: 16),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => {},
            child: Image.asset('assets/images/icon_arrow_right.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: ColorBase.mainColor,
              height: 4,
              width: 38 * 4,
            ),
            const SizedBox(
              height: 32,
            ),
            CategoryAndAddressSelection(textTheme: textTheme),
            const SizedBox(
              height: 22,
            ),
            const Divider(
              color: Color(0xffF9FAFB),
              thickness: 1,
              indent: 16,
              endIndent: 16,
              height: 40,
            ),
            AvizPropertiesSelection(textTheme: textTheme),
            const SizedBox(
              height: 22,
            ),
            const Divider(
              color: Color(0xffF9FAFB),
              thickness: 1,
              indent: 16,
              endIndent: 16,
              height: 40,
            ),
            AvizFacilitiesSelection(textTheme: textTheme),
            const SizedBox(
              height: 22,
            ),
            // next button
            Container(
              height: 48,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: ColorBase.mainColor,
              ),
              child: Center(
                child: Text(
                  'بعدی',
                  style: textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvizFacilitiesSelection extends StatelessWidget {
  const AvizFacilitiesSelection({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'امکانات',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset('assets/images/icon_facilities.png'),
            ],
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        _buildFacilityItem(
          title: 'آسانسور',
          onValueChanged: (p0) {},
        ),
        _buildFacilityItem(
          title: 'پارکینگ',
          onValueChanged: (p0) {},
        ),
        _buildFacilityItem(
          title: 'انباری',
          onValueChanged: (p0) {},
        ),
      ],
    );
  }

  Container _buildFacilityItem(
      {required String title, Function(bool)? onValueChanged}) {
    return Container(
      height: 55,
      width: 363,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
          color: const Color(0xffF2F4F7),
        ),
      ),
      child: Row(
        children: [
          Transform.scale(
            scale: 0.6,
            child: CupertinoSwitch(
              value: true,
              activeColor: ColorBase.mainColor,
              onChanged: (value) => onValueChanged?.call(value),
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class AvizPropertiesSelection extends StatelessWidget {
  const AvizPropertiesSelection({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'ویژگی ها',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset('assets/images/icon_properties.png'),
            ],
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPropertyItem(
                title: 'تعداد اتاق',
                number: 6,
              ),
              _buildPropertyItem(
                title: 'متراژ',
                number: 350,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPropertyItem(
                title: 'سال ساخت',
                number: 1402,
              ),
              _buildPropertyItem(
                title: 'طبقه',
                number: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _buildPropertyItem({required String title, required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: textTheme.bodySmall!.copyWith(
            color: ColorBase.textGreyColor,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 50,
          width: 164,
          padding: const EdgeInsets.only(left: 6, right: 12),
          decoration: BoxDecoration(
            color: const Color(0xffF9FAFB),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 1,
              color: const Color(0xffF9FAFB),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_drop_down,
                    color: ColorBase.mainColor,
                  ),
                  Icon(
                    Icons.arrow_drop_up,
                    color: ColorBase.mainColor,
                  )
                ],
              ),
              Text(
                '$number',
                style: textTheme.bodySmall!.copyWith(
                  color: ColorBase.textGreyColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryDropDownMenu extends StatefulWidget {
  const CategoryDropDownMenu({super.key});

  @override
  State<CategoryDropDownMenu> createState() => _CategoryDropDownMenuState();
}

class _CategoryDropDownMenuState extends State<CategoryDropDownMenu> {
  final List<String> mainCategories = [
    'اجاره مسکونی',
    'فروش مسکونی',
    'فروش دفاتر اداری و تجاری',
    'اجاره دفاتر اداری و تجاری',
    'اجاره کوتاه مدت',
    'پروژه های ساخت و ساز',
  ];

  String? selectedItem = 'اجاره مسکونی';
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 164,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1,
          color: const Color(0xffF2F4F7),
        ),
      ),
      alignment: Alignment.centerRight,
      child: DropdownButtonFormField<String>(
        iconSize: 0,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Image.asset('assets/images/icon_arrow_down.png'),
        ),
        value: selectedItem,
        isExpanded: true,
        items: mainCategories
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  textAlign: TextAlign.end,
                  style: textTheme.bodySmall!.copyWith(
                    color: ColorBase.textBlackColor,
                    fontSize: 16,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (item) {
          setState(() {
            selectedItem = item;
          });
        },
      ),
    );
  }
}

class CategoryAndAddressSelection extends StatelessWidget {
  const CategoryAndAddressSelection({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'انتخاب دسته بندی آویز',
                style: textTheme.bodyMedium!.copyWith(fontSize: 18),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(Icons.category),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'محدوده ملک',
                    style: textTheme.bodySmall!.copyWith(
                      color: ColorBase.textGreyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 48,
                    width: 164,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xffF9FAFB),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffF9FAFB),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'خیابان صیاد شیرازی',
                        style: textTheme.bodySmall!.copyWith(
                          color: ColorBase.textGreyColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'دسته بندی',
                    style: textTheme.bodySmall!.copyWith(
                      color: ColorBase.textGreyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const CategoryDropDownMenu(),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
