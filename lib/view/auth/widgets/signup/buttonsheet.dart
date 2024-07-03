import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/shared/widgets/buttons/onboarding_Button.dart';

class ButtonSheet extends StatelessWidget {
  const ButtonSheet(
      {super.key,
      this.onTapGallary,
      this.onTapCamera,
      this.color = ColorsApp.kprimaryColor1});
  final Function()? onTapGallary;
  final Function()? onTapCamera;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return OnboardingButton(
        color: color,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SizedBox(
                height: 100,
                child: Column(
                  children: [
                    InkWell(
                      onTap: onTapGallary,
                      child: const Text(
                        "From Galary",
                        style: Styles.textStyle16,
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: onTapCamera,
                      child: const Text(
                        "From Camera",
                        style: Styles.textStyle16,
                      ),
                    ),
                  ],
                )),
          );
        },
        text: "Upload Image");
  }
}
