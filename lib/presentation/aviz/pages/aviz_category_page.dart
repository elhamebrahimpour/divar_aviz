import 'package:divar_aviz/presentation/app/resources/theme_colors.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isCategoryItemSelected = false;
  double animatedContainerWidth = 38;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
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
              animatedContainerWidth = animatedContainerWidth > 38
                  ? animatedContainerWidth - 38
                  : animatedContainerWidth;
            }),
            child: Image.asset('assets/images/icon_arrow_right.png'),
          ),
        ],
      ),
      body: CategoryPageView(
        isCategoryItemSelected,
        animatedContainerWidth,
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryPageView extends StatefulWidget {
  bool isCategoryItemSelected;
  double animatedContainerWidth;
  CategoryPageView(
    this.isCategoryItemSelected,
    this.animatedContainerWidth, {
    super.key,
  });

  @override
  State<CategoryPageView> createState() => _CategoryPageViewState();
}

class _CategoryPageViewState extends State<CategoryPageView> {
  String selectedCategory = '';

  final List<String> buildingSellItems = [
    'فروش آپارتمان',
    'فروش خانه و ویلا',
    'فروش زمین و کلنگی',
  ];

  final List<String> mainCategories = [
    'اجاره مسکونی',
    'فروش مسکونی',
    'فروش دفاتر اداری و تجاری',
    'اجاره دفاتر اداری و تجاری',
    'اجاره کوتاه مدت',
    'پروژه های ساخت و ساز',
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
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
            width: widget.animatedContainerWidth,
          ),
          const SizedBox(
            height: 32,
          ),
          Visibility(
            visible: !widget.isCategoryItemSelected,
            child: Expanded(
              child: ListView.builder(
                itemCount: mainCategories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => setState(() {
                      widget.isCategoryItemSelected = true;
                      widget.animatedContainerWidth =
                          widget.animatedContainerWidth * 2;
                      selectedCategory = mainCategories[index];
                    }),
                    child: CategoryItem(
                      textTheme: textTheme,
                      categoryTitle: mainCategories[index],
                    ),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: widget.isCategoryItemSelected,
            child: Expanded(
              child: ListView.builder(
                itemCount: buildingSellItems.length,
                itemBuilder: (context, index) {
                  return selectedCategory == 'فروش مسکونی'
                      ? CategoryItem(
                          textTheme: textTheme,
                          categoryTitle: buildingSellItems[index],
                        )
                      : Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final TextTheme textTheme;
  final String categoryTitle;

  const CategoryItem({
    super.key,
    required this.textTheme,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 55,
        width: 363,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            Image.asset('assets/images/arrow-left.png'),
            const Spacer(),
            Text(
              categoryTitle,
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
