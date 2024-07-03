import 'package:eccommerce4/controller/setting/orders_controller.dart';
import 'package:eccommerce4/core/class/data_handilng.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../cart/widget/cart/custom_abbpar.dart';
import 'order_list.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAbbpar(title: "Orders"),
        GetBuilder<OrderControllerImp>(
          builder: (controller) => DataHandlingState(
              statusRequest: controller.statusRequest,
              widget: const Expanded(child: OrderList())),
        )
      ],
    );
  }
}
