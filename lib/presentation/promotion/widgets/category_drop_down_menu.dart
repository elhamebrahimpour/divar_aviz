import 'package:divar_aviz/core/theme/theme_colors.dart';
import 'package:divar_aviz/core/utils/utilities.dart';
import 'package:flutter/material.dart';


class CategoryDropDownMenu extends StatefulWidget {
  const CategoryDropDownMenu({super.key});

  @override
  State<CategoryDropDownMenu> createState() => _CategoryDropDownMenuState();
}

class _CategoryDropDownMenuState extends State<CategoryDropDownMenu> {
  String? selectedCategory = 'اجاره مسکونی';

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
      child: DropdownButtonFormField<String>(
        iconSize: 0,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Image.asset('assets/images/icon_arrow_down.png'),
        ),
        value: selectedCategory,
        isExpanded: true,
        items: MockCategoryUtil.mainCategories
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  textAlign: TextAlign.end,
                  style: textTheme.bodySmall?.copyWith(
                    color: ColorBase.textBlackColor,
                    fontSize: 16,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (item) {
          setState(() {
            selectedCategory = item;
          });
        },
      ),
    );
  }
}
