import 'package:flutter/material.dart';

import '../../../../core/shared/styles.dart';
import 'success_icon.dart';

class SuccessSection extends StatelessWidget {
  const SuccessSection(
      {super.key,
      required this.successtext,
      required this.title,
      required this.subtitle});
  final String successtext;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: .4,
          child: Text(
            successtext,
            style: Styles.textStyle30,
          ),
        ),
        const SizedBox(height: 30),
        const Center(
          child: SuccesIcon(),
        ),
        const SizedBox(height: 10),
        Opacity(
          opacity: 1,
          child: Text(
            title,
            style: Styles.textStyle30,
          ),
        ),
        const SizedBox(height: 5),
        Opacity(
          opacity: .4,
          child: Text(
            subtitle,
            style: Styles.textStyle18,
          ),
        ),
      ],
    );
  }
}
