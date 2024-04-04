import 'package:flutter/material.dart';

import '../../app/widgets/search_input_widget.dart';

class AvizSearchPage extends StatelessWidget {
  const AvizSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: _buildAppBar(textTheme),
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

  AppBar _buildAppBar(TextTheme textTheme) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Container(
        height: 32,
        padding: const EdgeInsets.only(
          left: 4,
          right: 4,
          top: 4,
          bottom: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'جستجوی آویز',
              style: textTheme.bodySmall!.copyWith(fontSize: 16),
            ),
            const SizedBox(
              width: 8,
            ),
            Image.asset(
              'assets/images/small_logo_colored.png',
              height: 26,
              width: 26,
            ),
          ],
        ),
      ),
    );
  }
}
