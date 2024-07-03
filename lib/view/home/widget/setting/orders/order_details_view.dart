import 'package:eccommerce4/controller/setting/order_details_controller.dart';
import 'package:eccommerce4/core/class/data_handilng.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/order_details_view/order_details_view_body.dart';

class OrderdetailsView extends StatelessWidget {
  const OrderdetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsControllerImp());
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GetBuilder<OrderDetailsControllerImp>(
            builder: (controller) => DataHandlingState(
              statusRequest: controller.statusRequest,
              widget: const OrederDetailsViewBody(),
            ),
          )),
    ));
  }
}
