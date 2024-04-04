import 'package:flutter/material.dart';

import '../../../domain/utils/utilities.dart';
import '../../app/resources/theme_colors.dart';
import '../widgets/category_item.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isCategoryItemSelected = false;
  double animatedContainerWidth = 0;
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: _buildCategoryAppBar(context, textTheme),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: ColorBase.mainColor,
              height: 4,
              width: animatedContainerWidth,
            ),
            const SizedBox(
              height: 32,
            ),
            Visibility(
              visible: !isCategoryItemSelected,
              child: Expanded(
                child: ListView.builder(
                  itemCount: MockCategoryUtil.mainCategories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => setState(() {
                        isCategoryItemSelected = true;
                        animatedContainerWidth = animatedContainerWidth + 38;
                        selectedCategory =
                            MockCategoryUtil.mainCategories[index];
                      }),
                      child: CategoryItem(
                        textTheme: textTheme,
                        title: MockCategoryUtil.mainCategories[index],
                      ),
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible: isCategoryItemSelected,
              child: _buildSubCategories(
                textTheme,
                checkSubCategory(selectedCategory),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubCategories(TextTheme textTheme, List<String> subCategories) {
    return Expanded(
      child: ListView.builder(
        itemCount: subCategories.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            textTheme: textTheme,
            title: subCategories[index],
          );
        },
      ),
    );
  }

  AppBar _buildCategoryAppBar(BuildContext context, TextTheme textTheme) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Image.asset('assets/images/icon_close.png'),
      ),
      title: Text(
        'دسته بندی آویز',
        style: textTheme.bodySmall!.copyWith(fontSize: 16),
      ),
      actions: [
        GestureDetector(
          onTap: () => setState(() {
            isCategoryItemSelected = false;
            animatedContainerWidth = animatedContainerWidth >= 38
                ? animatedContainerWidth - 38
                : animatedContainerWidth;
          }),
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset('assets/images/icon_arrow_right.png'),
          ),
        ),
      ],
    );
  }
}
