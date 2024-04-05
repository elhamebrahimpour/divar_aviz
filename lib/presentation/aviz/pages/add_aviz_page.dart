import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';
import 'views/add_aviz_view.dart';

class AddAvizPage extends StatefulWidget {
  const AddAvizPage({super.key});

  @override
  State<AddAvizPage> createState() => _AddAvizPageState();
}

class _AddAvizPageState extends State<AddAvizPage> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBarWidget(
        childWidget: Row(
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
