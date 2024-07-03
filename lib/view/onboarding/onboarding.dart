import 'package:eccommerce4/controller/onboarding/onboarding_controller.dart';
import 'package:eccommerce4/view/onboarding/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return const SafeArea(
      child: Scaffold(
        body: OnboardingBody(),
      ),
    );
  }
}
