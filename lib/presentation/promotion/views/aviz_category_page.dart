import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/config/utils/utilities.dart';
import 'package:divar_aviz/presentation/promotion/views/add_aviz_page.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/category_item.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isCategoryItemSelected = false;
  double progress = 0;
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBarWidget(
        childWidget: Text(
          'دسته بندی آویز',
          style: textTheme.bodySmall?.copyWith(fontSize: 16),
        ),
        onBack: () => setState(() {
          isCategoryItemSelected = false;
          progress = progress >= 38 ? progress - 38 : progress;
        }),
        onClose: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: ColorPrimary.mainColor,
              height: 4,
              width: progress,
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
                        progress = progress + 38;
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
          return GestureDetector(
            onTap: () => setState(() {
              progress = progress + 38;
            }),
            child: GestureDetector(
              onTap: () => context.pushNavigator(const AddAvizPage()),
              child: CategoryItem(
                textTheme: textTheme,
                title: subCategories[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
