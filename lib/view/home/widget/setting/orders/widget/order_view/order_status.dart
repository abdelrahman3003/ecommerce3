import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/setting/orders_controller.dart';
import 'rating.dart';
import 'text_item.dart';

class OrderStatus extends GetView<OrderControllerImp> {
  const OrderStatus(
      {super.key, required this.orderStatus, required this.orderid});
  final int orderStatus;
  final int orderid;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextItem(
            tilte: "Order Status",
            subtilte: controller.printOrderStatus(orderStatus)),
        const SizedBox(width: 20),
        orderStatus == 4
            ? InkWell(
                onTap: () {
                  showratingDialog(context, orderid);
                },
                child: Card(
                    child: Text("  Rate  ",
                        style: Styles.textStyle20black.copyWith(
                            color: Colors.green, fontWeight: FontWeight.bold))),
              )
            : const SizedBox()
      ],
    );
  }
}
