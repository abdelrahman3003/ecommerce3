import 'package:eccommerce4/controller/cart/checkout_controller.dart';
import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayWay extends GetView<CheckoutControllerImp> {
  const PayWay({super.key, required this.text, required this.isActive});
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (text == "On delivery") {
          controller.choosePayWay("0");
        }
        if (text == "on Card") {
          controller.choosePayWay("1");
        }
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: isActive ? ColorsApp.kprimaryColor1 : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: ColorsApp.kprimaryColor1)),
        child: Text(text,
            style: Styles.textStyle18.copyWith(
                color: isActive ? Colors.white : ColorsApp.kprimaryColor1,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
