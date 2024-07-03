import 'package:eccommerce4/controller/onboarding/onboarding_controller.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:eccommerce4/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PageViewOnboarding extends StatelessWidget {
  const PageViewOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<OnboardingControllerImp>(
      builder: (controller) {
        return PageView.builder(
          controller: controller.pageController,
          onPageChanged: (val) {
            val == onboardingmodeList.length - 1
                ? controller.isfinish = true
                : false;
            controller.pageInchanged(val);
          },
          itemCount: onboardingmodeList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  onboardingmodeList[index].title,
                  style: Styles.textStyle25black,
                ),
                const SizedBox(height: 100),
                SizedBox(
                  height: 250,
                  width: width * .5,
                  child: Image.asset(
                    onboardingmodeList[index].image,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Opacity(
                    opacity: .7,
                    child: Text(
                      textAlign: TextAlign.center,
                      onboardingmodeList[index].subtitle,
                      style: Styles.textStyle20black,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
