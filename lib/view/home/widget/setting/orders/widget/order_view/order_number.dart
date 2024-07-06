import 'package:eccommerce4/core/class/statuscode.dart';
import 'package:eccommerce4/view/home/widget/setting/orders/widget/order_view/text_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/setting/orders_controller.dart';
import '../../../../../../../core/shared/widgets/buttons/onboarding_Button.dart';

class OrderNumber extends StatelessWidget {
  const OrderNumber({
    super.key,
    required this.index,required this.ordernumber,
  });
  final int index;
  final int  ordernumber;
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderControllerImp>(builder: (controller) {
      return Row(children: [
        TextItem(tilte: "Order Number", subtilte: " $ordernumber"),
        const Spacer(),
        Card(
          child: controller.statusRequest2 == StatusRequest.loading &&
                  controller.orderDeleted == index
              ? const CircularProgressIndicator()
              : OnboardingButton(
                  text: "Delete",
                  onPressed: () {
                    controller.deleteOrder(index);
                  },
                  width: Get.width / 5,
                  color: Colors.white,
                  textColor: Colors.red,
                ),
        )
      ]);
    });
  }
}
