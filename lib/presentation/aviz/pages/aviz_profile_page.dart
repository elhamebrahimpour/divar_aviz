import 'package:flutter/material.dart';

import '../../app/widgets/search_input_widget.dart';

class AvizProfilePage extends StatelessWidget {
  const AvizProfilePage({super.key});

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'حساب کاربری',
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset('assets/images/icon_user.png'),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 95,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.grey[200]!,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Divider(
              height: 64,
              thickness: 1,
              indent: 16,
              endIndent: 16,
              color: Colors.grey[100]!,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    height: 40,
                    margin:
                        const EdgeInsets.only(right: 16, left: 16, bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.grey[200]!,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Text(
                  'نسخه',
                  style: textTheme.bodySmall,
                ),
                Text(
                  '1.5.9',
                  style: textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
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
              'آویز من',
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
