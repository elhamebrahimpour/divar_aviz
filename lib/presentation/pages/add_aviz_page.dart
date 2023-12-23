import 'package:divar_aviz/config/theme_colors.dart';
import 'package:flutter/material.dart';

class AddAvizPage extends StatefulWidget {
  const AddAvizPage({super.key});

  @override
  State<AddAvizPage> createState() => _AddAvizPageState();
}

class _AddAvizPageState extends State<AddAvizPage> {
  double animatedContainerWidth = 38;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Image.asset('assets/images/icon_close.png'),
        title: Text(
          'دسته بندی آویز',
          style: textTheme.bodySmall!.copyWith(fontSize: 16),
        ),
        actions: [
          GestureDetector(
            onTap: () => setState(() {
              animatedContainerWidth = animatedContainerWidth > 38
                  ? animatedContainerWidth - 38
                  : animatedContainerWidth;
            }),
            child: Image.asset('assets/images/icon_arrow_right.png'),
          ),
        ],
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
              color: ThemeColors.mainColor,
              height: 4,
              width: animatedContainerWidth,
            ),
            const SizedBox(
              height: 32,
            ),
            CategoryItem(
              textTheme: textTheme,
              categoryTitle: 'اجاره مسکونی',
              onItemTapped: () {},
            ),
            CategoryItem(
              textTheme: textTheme,
              categoryTitle: 'فروش مسکونی',
              onItemTapped: () {
                setState(() {
                  animatedContainerWidth = animatedContainerWidth * 2;
                });
              },
            ),
            CategoryItem(
              textTheme: textTheme,
              categoryTitle: 'فروش دفاتر اداری و تجاری',
              onItemTapped: () {},
            ),
            CategoryItem(
              textTheme: textTheme,
              categoryTitle: 'اجاره دفاتر اداری و تجاری',
              onItemTapped: () {},
            ),
            CategoryItem(
              textTheme: textTheme,
              categoryTitle: 'اجاره کوتاه مدت',
              onItemTapped: () {},
            ),
            CategoryItem(
              textTheme: textTheme,
              categoryTitle: 'پروژه های ساخت و ساز',
              onItemTapped: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class BuildingSellItemsGeneration extends StatefulWidget {
  double animatedContainerWidth;
  BuildingSellItemsGeneration(this.animatedContainerWidth, {super.key});

  @override
  State<BuildingSellItemsGeneration> createState() =>
      _BuildingSellItemsGenerationState();
}

class _BuildingSellItemsGenerationState
    extends State<BuildingSellItemsGeneration> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        CategoryItem(
          textTheme: textTheme,
          categoryTitle: 'فروش آپارتمان',
          onItemTapped: () {},
        ),
        CategoryItem(
          textTheme: textTheme,
          categoryTitle: 'فروش خانه و ویلا',
          onItemTapped: () {
            setState(() {
              widget.animatedContainerWidth = widget.animatedContainerWidth * 2;
            });
          },
        ),
        CategoryItem(
          textTheme: textTheme,
          categoryTitle: 'فروش زمین و کلنگی',
          onItemTapped: () {},
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final TextTheme textTheme;
  final String categoryTitle;
  final VoidCallback? onItemTapped;

  const CategoryItem({
    super.key,
    required this.textTheme,
    required this.categoryTitle,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTapped!.call(),
      child: Center(
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
      ),
    );
  }
}
