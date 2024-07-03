import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

class SuccesIcon extends StatelessWidget {
  const SuccesIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.check_circle_outline,
      size: 200,
      color: ColorsApp.kprimaryColor1,
    );
  }
}
