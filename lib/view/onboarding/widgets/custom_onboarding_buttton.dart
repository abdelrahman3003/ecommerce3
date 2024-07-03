import 'package:eccommerce4/controller/onboarding/onboarding_controller.dart';
import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:eccommerce4/core/shared/widgets/buttons/onboarding_Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnboardingButton extends StatelessWidget {
  const CustomOnboardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      builder: (controller) => OnboardingButton(
        onPressed: () {
          controller.next();
          if (controller.isfinish) {
            Get.offAllNamed(kSignin);
          }
        },
        text: controller.isfinish
            ? "onbordingButtonFinshed".tr
            : "onbordingButton".tr,
      ),
    );
  }
}
