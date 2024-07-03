import 'package:eccommerce4/controller/cart/cart_controller.dart';
import 'package:eccommerce4/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/widgets/buttons/onboarding_Button.dart';

class CartButton extends GetView<CartControllerImp> {
  const CartButton({super.key, required this.tilte});
  final String tilte;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: OnboardingButton(
        color: ColorsApp.kprimaryColor1,
        width: Get.width,
        text: tilte,
        onPressed: () {
          controller.gotocheckout();
        },
      ),
    );
  }
}
