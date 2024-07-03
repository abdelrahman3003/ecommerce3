import 'package:eccommerce4/controller/setting/order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'order_row_details.dart';

class OrderDetailsList extends GetView<OrderDetailsControllerImp> {
  const OrderDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.orderDtailsList.length,
        itemBuilder: (context, index) => Opacity(
            opacity: .6,
            child: OrderDetailsRow(
                item: controller.orderDtailsList[index].itemsName!,
                qty: "${controller.orderDtailsList[index].itemcount!}",
                price:
                    "${controller.orderDtailsList[index].sumitemdiscountprice!} \$")),
      ),
    );
  }
}
