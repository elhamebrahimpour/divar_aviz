
import 'package:divar_aviz/presentation/app/widgets/custom_app_bar.dart';
import 'package:divar_aviz/presentation/app/widgets/search_input_widget.dart';
import 'package:flutter/material.dart';

class AvizSearchPage extends StatelessWidget {
  const AvizSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(
        textTheme: textTheme,
        title: 'جستجوی آویز',
      ),
      body: SafeArea(
        child: Column(
          children: [
            SearchInputWidget(textTheme: textTheme),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                'Searching ...',
                style: textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
