import 'package:divar_aviz/config/theme_colors.dart';
import 'package:flutter/material.dart';

class AddAvizPage extends StatefulWidget {
  const AddAvizPage({super.key});

  @override
  State<AddAvizPage> createState() => _AddAvizPageState();
}

class _AddAvizPageState extends State<AddAvizPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
              style: textTheme.bodyMedium!.copyWith(fontSize: 16),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => setState(() {}),
            child: Image.asset('assets/images/icon_arrow_right.png'),
          ),
        ],
      ),
      body: AddAvizView(textTheme: textTheme),
    );
  }
}

class AddAvizView extends StatelessWidget {
  const AddAvizView({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: ThemeColors.mainColor,
          height: 4,
          width: 38 * 4,
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
              Text(
                'محدوده ملک',
                style: textTheme.bodySmall!.copyWith(
                  color: ThemeColors.textGreyColor,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'دسته بندی',
                style: textTheme.bodySmall!.copyWith(
                  color: ThemeColors.textGreyColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
