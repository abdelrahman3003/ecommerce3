import 'package:eccommerce4/controller/cart/checkout_controller.dart';
import 'package:eccommerce4/view/cart/widget/checkout/checkouy_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutControllerImp());
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CheckoutViewBody(),
        ),
      ),
    );
  }
}
