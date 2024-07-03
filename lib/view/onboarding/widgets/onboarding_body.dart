import 'package:eccommerce4/view/onboarding/widgets/custom_onboarding_buttton.dart';
import 'package:eccommerce4/view/onboarding/widgets/pageview_onboard.dart';
import 'package:eccommerce4/view/onboarding/widgets/spotes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: Get.height * .7, child: const PageViewOnboarding()),
          const Spotes(),
          const Padding(
            padding: EdgeInsets.only(top: 150),
            child: CustomOnboardingButton(),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
