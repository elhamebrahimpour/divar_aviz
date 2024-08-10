import 'package:divar_aviz/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/category_drop_down_menu.dart';

class CategoryAndAddressSelection extends StatelessWidget {
  final TextTheme textTheme;

  const CategoryAndAddressSelection({
    super.key,
    required this.textTheme,
  });

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
                  GestureDetector(
                    onTap: () {},
                    child: Container(
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
