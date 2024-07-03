import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/shared/styles.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Styles.textStyle25.copyWith(color: ColorsApp.kprimaryColor1));
  }
}
