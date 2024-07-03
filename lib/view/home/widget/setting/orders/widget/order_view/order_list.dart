import 'package:eccommerce4/controller/setting/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'order_card.dart';

class OrderList extends GetView<OrderControllerImp> {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: controller.orderList.length,
      itemBuilder: (context, index) => OrderCard(
        orderModel: controller.orderList[index],
      ),
    );
  }
}
