import 'package:eccommerce4/controller/onboarding/onboarding_controller.dart';
import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Spotes extends StatelessWidget {
  const Spotes({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      builder: (controller) {
        return SizedBox(
            width: 89,
            child: Row(
              children: [
                ...List.generate(
                    onboardingmodeList.length,
                    (index) => AnimatedContainer(
                        margin: const EdgeInsets.only(right: 7),
                        duration: const Duration(milliseconds: 300),
                        height: 7,
                        width: controller.pagecount == index ? 25 : 12,
                        decoration: const BoxDecoration(
                            color: ColorsApp.kprimaryColor1,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))))
              ],
            ));
      },
    );
  }
}
// ListView.builder(
            
//             itemCount: onboardingmodeList.length,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(right: 5),
//                 child: Container(
//                   margin: const EdgeInsets.only(left: 5),
//                   width: controller.pagecount == index ? 20 : 8,
//                   height: 7,
//                   decoration: const BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.all(Radius.circular(20))),
//                 ),
//               );
//             },
//           ),