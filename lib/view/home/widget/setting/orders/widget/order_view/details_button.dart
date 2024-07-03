import 'package:eccommerce4/core/shared/styles.dart';
import 'package:eccommerce4/core/shared/widgets/buttons/onboarding_Button.dart';
import 'package:eccommerce4/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/setting/orders_controller.dart';

class DetailsButton extends GetView<OrderControllerImp> {
  const DetailsButton({
    super.key,
    required this.totlaPrice,
    required this.orderModel,
  });
  final String totlaPrice;
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Totla Price:  $totlaPrice \$",
            style: Styles.textStyle20
                .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
            width: Get.width / 4,
            child: OnboardingButton(
                text: "Details",
                onPressed: () {
                  controller.goToOrederDetails(orderModel);
                }))
      ],
    );
  }
}
