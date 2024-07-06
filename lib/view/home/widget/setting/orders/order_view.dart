import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/setting/orders_controller.dart';
import 'widget/order_view/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderControllerImp());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Orders"),
            centerTitle: true,
          ),
          body: const OrderViewBody()),
    );
  }
}
