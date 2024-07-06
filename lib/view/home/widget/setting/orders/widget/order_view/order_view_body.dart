import 'package:eccommerce4/controller/setting/orders_controller.dart';
import 'package:eccommerce4/core/class/data_handilng.dart';
import 'package:eccommerce4/view/home/widget/setting/orders/widget/order_view/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderControllerImp>(
      builder: (controller) => DataHandlingState(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.orderList.length,
            itemBuilder: (context, index) => OrderCard(
              orderModel: controller.orderList[index],
              index: index,
            ),
          )),
    );
  }
}
