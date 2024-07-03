import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/routsApp.dart';
import '../../../../core/shared/widgets/buttons/onboarding_Button.dart';

class SuccessButton extends StatelessWidget {
  const SuccessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: OnboardingButton(
          text: "Signin",
          width: double.infinity,
          onPressed: () {
            Get.offNamed(kSignin);
          }),
    );
  }
}
