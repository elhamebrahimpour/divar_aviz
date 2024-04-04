import 'package:divar_aviz/presentation/app/resources/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationSelect extends StatefulWidget {
  const LocationSelect({super.key});

  @override
  State<LocationSelect> createState() => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    bool switchValue = false;

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
              style: textTheme.bodyMedium,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: ColorBase.mainColor,
            height: 4,
            width: 38 * 8,
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
                  .copyWith(color: ColorBase.textGreyColor, height: 1.7),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          // location part
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 144,
                  width: 343,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                Container(
                  height: 46,
                  width: 185,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: ColorBase.mainColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/images/icon_location.png'),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Text(
                          'تبریز، بازار، بازار برق تبریز، طبقه همکف',
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                          style: textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Container(
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
                    value: switchValue,
                    activeColor: ColorBase.mainColor,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                ),
                Text(
                  'موقعیت دقیق نقشه نمایش داده شود؟',
                  style: textTheme.bodyMedium!.copyWith(fontFamily: 'SM'),
                ),
              ],
            ),
          ),
          const Spacer(),
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
    );
  }
}
