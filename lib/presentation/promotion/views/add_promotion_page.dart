import 'package:flutter/material.dart';

import '../widgets/category_app_bar.dart';
import 'previews/add_aviz_view.dart';

class AddPromotionPage extends StatefulWidget {
  const AddPromotionPage({super.key});

  @override
  State<AddPromotionPage> createState() => _AddPromotionPageState();
}

class _AddPromotionPageState extends State<AddPromotionPage> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CategoryAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'آویز',
              style: textTheme.bodySmall?.copyWith(fontSize: 16),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'ثبت',
              style: textTheme.bodyMedium?.copyWith(fontSize: 16),
            ),
          ],
        ),
        hasBackIcon: true,
        hasCloseIcon: true,
        onBack: () {
          if (progress > 0) {
            setState(() {
              progress = progress - 38;
            });
          }
        },
        onClose: () => Navigator.of(context).pop(),
      ),
      body: AddAvizView(progress: progress),
    );
  }
}
