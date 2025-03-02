import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/presentation/promotion/views/previews/image_selection_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/map_widget.dart';

// ignore: must_be_immutable
class LocateSelectionView extends StatefulWidget {
  double progress;

  LocateSelectionView({
    super.key,
    required this.progress,
  });

  @override
  State<LocateSelectionView> createState() => _LocateSelectionViewState();
}

class _LocateSelectionViewState extends State<LocateSelectionView> {
  bool isLocationShowed = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return (widget.progress > 38)
        ? ImageSelectionView(progress: widget.progress)
        : Column(
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
                      'موقعیت مکانی',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Image.asset('assets/images/icon_map.png'),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'بعد انتخاب محل دقیق روی نقشه میتوانید نمایش آن را فعال یا غیر فعال کید تا حریم خصوصی شما خفظ شود.',
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.rtl,
                  style: textTheme.bodySmall!
                      .copyWith(color: ColorPrimary.textGreyColor, height: 1.7),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              MapWidget(textTheme: textTheme),
              const SizedBox(
                height: 22,
              ),
              _buildSwitchItem(textTheme),
              const Spacer(),
              // next button
              _buildNextButton(textTheme),
              const SizedBox(
                height: 22,
              ),
            ],
          );
  }

  GestureDetector _buildSwitchItem(TextTheme textTheme) {
    return GestureDetector(
      onTap: () => setState(() {
        isLocationShowed = !isLocationShowed;
      }),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Transform.scale(
              scale: 0.6,
              child: CupertinoSwitch(
                value: isLocationShowed ? true : false,
                activeColor: ColorPrimary.mainColor,
                onChanged: (value) {},
              ),
            ),
            Text(
              'موقعیت دقیق نقشه نمایش داده شود؟',
              style: textTheme.bodyMedium?.copyWith(fontFamily: 'SM'),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildNextButton(TextTheme textTheme) {
    return GestureDetector(
      onTap: () {
        if (widget.progress == 38) {
          setState(() {
            widget.progress = widget.progress + 38;
          });
        }
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
            'بعدی',
            style: textTheme.bodySmall?.copyWith(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
