import 'package:eccommerce4/controller/cart/cart_controller.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:eccommerce4/view/cart/widget/cart/coupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponStateHandling extends GetView<CartControllerImp> {
  const CouponStateHandling({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.couponing == null
        ? const Cpoupon()
        : controller.couponing == "true"
            ? Text(
                "discount is added",
                style: Styles.textStyle20
                    .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
              )
            : Column(
                children: [
                  const Cpoupon(),
                  Text(
                    "coupon is not valid",
                    style: Styles.textStyle20.copyWith(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )
                ],
              );
  }
}
