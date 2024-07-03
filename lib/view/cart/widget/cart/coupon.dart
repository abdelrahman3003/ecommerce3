import 'package:eccommerce4/controller/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/constatns_value.dart';
import '../../../../core/shared/widgets/buttons/onboarding_Button.dart';

class Cpoupon extends GetView<CartControllerImp> {
  const Cpoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SizedBox(
          height: 50,
          child: TextFormField(
              controller: controller.textEditingController,
              decoration: InputDecoration(
                hintText: "Coupon Code",
                filled: true,
                fillColor: ColorsApp.kprimaryColor3,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kborderradius),
                    borderSide: BorderSide.none),
              )),
        )),
        const SizedBox(width: 5),
        OnboardingButton(
          onPressed: () async {
            await controller.checkCoupon();
          },
          text: "Apply",
          width: Get.height * .14,
          color: Colors.orange,
        )
      ],
    );
  }
}
