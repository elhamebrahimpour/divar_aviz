import 'package:divar_aviz/presentation/app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../data/model/aviz.dart';

class AvizItemDetailPage extends StatefulWidget {
  final Aviz aviz;

  const AvizItemDetailPage({
    super.key,
    required this.aviz,
  });

  @override
  State<AvizItemDetailPage> createState() => _AvizItemDetailPageState();
}

class _AvizItemDetailPageState extends State<AvizItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(
        textTheme: textTheme,
        title: widget.aviz.title,
        showBackArrow: false,
      ),
      body: const SafeArea(
        child: Center(
          child: Text('detail'),
        ),
      ),
    );
  }
}
