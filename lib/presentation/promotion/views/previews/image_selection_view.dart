import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/presentation/app/views/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSelectionView extends StatefulWidget {
  final double progress;

  const ImageSelectionView({
    super.key,
    required this.progress,
  });

  @override
  State<ImageSelectionView> createState() => _ImageSelectionViewState();
}

class _ImageSelectionViewState extends State<ImageSelectionView> {
  final TextEditingController _controller = TextEditingController();

  int selectedIndex = 0;

  List<String> mock = [
    'فعال کردن گفتگو',
    'فعال کردن تماس',
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: ColorPrimary.mainColor,
            height: 4,
            width: widget.progress,
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'تصویر آویز',
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(
                  width: 6,
                ),
                Image.asset('assets/images/icon_camera.png'),
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          UploadImageWidget(textTheme: textTheme),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'عنوان آویز',
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(
                  width: 6,
                ),
                Image.asset('assets/images/icon_edit_2.png'),
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Container(
            height: 48,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                hintText: 'عنوان آویز را وارد کنید',
                hintStyle: textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[400],
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  right: 8,
                  left: 8,
                  bottom: 12,
                ),
              ),
              onChanged: (query) {},
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'توضیحات',
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(
                  width: 6,
                ),
                Image.asset('assets/images/icon_clipboard.png'),
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Container(
            height: 104,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              textAlign: TextAlign.end,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: '...توضیحات آویز را وارد کنید ',
                hintStyle: textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[400],
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  right: 8,
                  left: 8,
                  bottom: 12,
                ),
              ),
              onChanged: (query) {},
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          for (int i = 0; i < 2; i++) ...{
            _buildComminicationItem(
              textTheme,
              title: mock[i],
              index: i,
            ),
          },
          const SizedBox(
            height: 22,
          ),
          GestureDetector(
            onTap: () {
              context.pushNavigator(const MainPage());
            },
            child: Container(
              height: 48,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: ColorPrimary.mainColor,
              ),
              child: Center(
                child: Text(
                  'ثبت آگهی',
                  style: textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
        ],
      ),
    );
  }

  Widget _buildComminicationItem(textTheme,
      {required String title, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
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
                value: selectedIndex == index,
                activeColor: ColorPrimary.mainColor,
                onChanged: (value) {},
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class UploadImageWidget extends StatelessWidget {
  final TextTheme textTheme;

  const UploadImageWidget({
    super.key,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 160,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                width: 1,
                color: ColorPrimary.textGreyColor,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                'لطفا تصویر آویز خود را بارگذاری کنید',
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
                style: textTheme.bodyMedium!.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 46,
                width: 158,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: ColorPrimary.mainColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'انتخاب تصویر',
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
                    Image.asset('assets/images/icon_upload.png'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
