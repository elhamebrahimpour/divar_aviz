import 'package:divar_aviz/core/theme/theme_colors.dart';
import 'package:divar_aviz/presentation/app/widgets/custom_app_bar.dart';
import 'package:divar_aviz/presentation/app/widgets/search_input_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/aviz_profile_item.dart';

class AvizProfilePage extends StatefulWidget {
  const AvizProfilePage({super.key});

  @override
  State<AvizProfilePage> createState() => _AvizProfilePageState();
}

class _AvizProfilePageState extends State<AvizProfilePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    int selectedIndex = 0;

    List mockIcons = [
      'icon_note',
      'icon_card',
      'icon_view',
      'icon_save',
      'icon_setting',
      'icon_question',
      'icon_info',
    ];

    List mockTitles = [
      'آگهی های من',
      'پرداخت های من',
      'بازدیدهای اخیر',
      'ذخیره شده ها',
      'تنظیمات',
      'پشتیبانی و قوانین',
      'درباره آویز',
    ];

    return Scaffold(
      appBar: CustomAppBar(
        textTheme: textTheme,
        title: 'آویز من',
      ),
      body: SafeArea(
        child: Column(
          children: [
            SearchInputWidget(textTheme: textTheme),
            const SizedBox(
              height: 16,
            ),
            _buildUserProfileHeader(textTheme),
            Divider(
              height: 44,
              thickness: 1,
              indent: 16,
              endIndent: 16,
              color: Colors.grey[100]!,
            ),
            // aviz items
            for (int i = 0; i < mockTitles.length; i++) ...{
              AvizProfileItem(
                title: mockTitles[i],
                icon: mockIcons[i],
                textTheme: textTheme,
                onItemTapped: () {
                  setState(() {
                    selectedIndex = i;
                  });

                  _openItemDetailBottomSheet(
                      context, mockTitles, selectedIndex);
                },
              ),
            },
            const SizedBox(
              height: 8,
            ),
            _buildFooter(textTheme),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  Column _buildFooter(TextTheme textTheme) {
    return Column(
      children: [
        Text(
          'نسخه',
          style: textTheme.bodySmall?.copyWith(
            color: Colors.grey[400],
          ),
        ),
        Text(
          '1.5.9',
          style: textTheme.bodySmall?.copyWith(
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }

  Future<dynamic> _openItemDetailBottomSheet(
      BuildContext context, List<dynamic> mockTitles, int selectedIndex) {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      isDismissible: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                mockTitles[selectedIndex],
                textAlign: TextAlign.end,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUserProfileHeader(TextTheme textTheme) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'حساب کاربری',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                width: 8,
              ),
              Image.asset('assets/images/icon_user.png'),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 95,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: Colors.grey[200]!,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/icon_edit.png'),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'الهام ابراهیم پور',
                    style: textTheme.bodyMedium,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 26,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: ColorBase.mainColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'تایید شده',
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        '0914*******',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              const CircleAvatar(
                radius: 30,
                backgroundColor: ColorBase.mainColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
