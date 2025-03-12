import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/ext_context.dart';
import 'package:divar_aviz/config/utils/utilities.dart';
import 'package:divar_aviz/presentation/promotion/views/add_promotion_page.dart';
import 'package:flutter/material.dart';

import '../widgets/category_app_bar.dart';
import '../widgets/category_item_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isCategoryItemSelected = false;
  double progress = 0;
  String selectedCategory = '';

  bool hasBackIcon = false;
  bool hasCloseIcon = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CategoryAppBar(
        title: Text(
          'دسته بندی ها',
          style: textTheme.titleSmall,
        ),
        hasBackIcon: hasBackIcon,
        hasCloseIcon: hasCloseIcon,
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
                        hasBackIcon = true;
                        progress = progress + 38;
                        selectedCategory =
                            MockCategoryUtil.mainCategories[index];
                      }),
                      child: CategoryItemWidget(
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
              onTap: () => context.pushNavigator(const AddPromotionPage()),
              child: CategoryItemWidget(
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
