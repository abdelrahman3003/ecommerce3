import 'package:eccommerce4/view/home/widget/setting/orders/widget/order_view/text_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/setting/orders_controller.dart';
import '../../../../../../../core/shared/widgets/buttons/onboarding_Button.dart';

class OrderNumber extends GetView<OrderControllerImp> {
  const OrderNumber({
    super.key,
    required this.orderNumber,
  });
  final int orderNumber;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TextItem(tilte: "Order Number", subtilte: " $orderNumber"),
      const Spacer(),
      Card(
        child: OnboardingButton(
          text: "Delete",
          onPressed: () {
            controller.deleteOrder(orderNumber);
          },
          width: Get.width / 5,
          color: Colors.white,
          textColor: Colors.red,
        ),
      )
    ]);
  }
}
