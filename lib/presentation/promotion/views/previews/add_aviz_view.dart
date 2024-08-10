import 'package:divar_aviz/core/theme/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category_address_selection.dart';
import 'locate_selection_view.dart';

// ignore: must_be_immutable
class AddAvizView extends StatefulWidget {
  double progress;

  AddAvizView({
    super.key,
    required this.progress,
  });

  @override
  State<AddAvizView> createState() => _AddAvizViewState();
}

class _AddAvizViewState extends State<AddAvizView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return (widget.progress == 38)
        ? LocateSelectionView(progress: widget.progress)
        : SingleChildScrollView(
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
                  width: widget.progress,
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
                GestureDetector(
                  onTap: () {
                    if (widget.progress < 38) {
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
                ),
                const SizedBox(
                  height: 22,
                ),
              ],
            ),
          );
  }
}

class AvizFacilitiesSelection extends StatefulWidget {
  final TextTheme textTheme;

  const AvizFacilitiesSelection({
    super.key,
    required this.textTheme,
  });

  @override
  State<AvizFacilitiesSelection> createState() =>
      _AvizFacilitiesSelectionState();
}

class _AvizFacilitiesSelectionState extends State<AvizFacilitiesSelection> {
  List<int> selectedIndexes = [];

  List<String> mock = [
    'آسانسور',
    'پارکینگ',
    'انباری',
  ];

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
                style: widget.textTheme.bodyMedium,
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
        for (int i = 0; i < 3; i++) ...{
          _buildFacilityItem(
            title: mock[i],
            index: i,
          ),
        }
      ],
    );
  }

  Widget _buildFacilityItem({required String title, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedIndexes.contains(index)) {
            selectedIndexes.remove(index);
          } else {
            selectedIndexes.add(index);
          }
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
                value: selectedIndexes.contains(index),
                activeColor: ColorBase.mainColor,
                onChanged: (value) {
                  setState(() {
                    if (value) {
                      selectedIndexes.add(index);
                    } else {
                      selectedIndexes.remove(index);
                    }
                  });
                },
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: widget.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class AvizPropertiesSelection extends StatefulWidget {
  final TextTheme textTheme;

  const AvizPropertiesSelection({
    super.key,
    required this.textTheme,
  });

  @override
  State<AvizPropertiesSelection> createState() =>
      _AvizPropertiesSelectionState();
}

class _AvizPropertiesSelectionState extends State<AvizPropertiesSelection> {
  int room = 5;
  int meterag = 350;
  int year = 1402;
  int floor = 2;

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
                style: widget.textTheme.bodyMedium,
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
              PropertiesItem(
                title: 'تعداد اتاق',
                number: room,
                onIncreased: () => setState(() {
                  room++;
                }),
                onDecreased: () => setState(() {
                  if (room == 0) return;
                  room--;
                }),
              ),
              PropertiesItem(
                title: 'متراژ',
                number: meterag,
                onIncreased: () => setState(() {
                  meterag++;
                }),
                onDecreased: () => setState(() {
                  if (meterag == 0) return;
                  meterag--;
                }),
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
              PropertiesItem(
                title: 'سال ساخت',
                number: year,
                onIncreased: () => setState(() {
                  year++;
                }),
                onDecreased: () => setState(() {
                  if (year == 1400) return;
                  year--;
                }),
              ),
              PropertiesItem(
                title: 'طبقه',
                number: floor,
                onIncreased: () => setState(() {
                  floor++;
                }),
                onDecreased: () => setState(() {
                  if (floor == -2) return;
                  floor--;
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PropertiesItem extends StatelessWidget {
  final String title;
  final int number;
  final Function? onIncreased;
  final Function? onDecreased;

  const PropertiesItem({
    super.key,
    required this.title,
    required this.number,
    this.onIncreased,
    this.onDecreased,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: textTheme.bodySmall?.copyWith(
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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => onIncreased?.call(),
                    child: const Icon(
                      Icons.arrow_drop_up,
                      color: ColorBase.mainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => onDecreased?.call(),
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: ColorBase.mainColor,
                    ),
                  ),
                ],
              ),
              Text(
                '$number',
                style: textTheme.bodySmall?.copyWith(
                  color: ColorBase.textBlackColor,
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
