import 'package:flutter/material.dart';

import '../../../../../../../core/shared/styles.dart';

class TextItemOrderCard extends StatelessWidget {
  const TextItemOrderCard({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center,
        style: Styles.textStyle20black.copyWith(fontWeight: FontWeight.bold));
  }
}
