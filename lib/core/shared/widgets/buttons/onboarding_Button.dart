import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';

import '../../../constant/constatns_value.dart';

// ignore: must_be_immutable
class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
    required this.text,
    this.width = 170,
    required this.onPressed,
    this.color = ColorsApp.kprimaryColor1,
    this.borderRadius = kborderradius,
    this.textColor = Colors.white,
  });

  final Function()? onPressed;
  final String text;
  final double width;
  final Color color;
  final Color textColor;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius), color: color),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle18
              .copyWith(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
