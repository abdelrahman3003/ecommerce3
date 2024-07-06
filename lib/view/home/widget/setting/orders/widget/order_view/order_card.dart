import 'package:eccommerce4/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../../../controller/setting/orders_controller.dart';
import 'details_button.dart';
import 'order_number.dart';
import 'order_status.dart';
import 'text_item.dart';

class OrderCard extends GetView<OrderControllerImp> {
  const OrderCard({
    super.key,
    required this.orderModel,
    required this.index,
  });

  final OrderModel orderModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        OrderNumber(
          index: index,
          ordernumber: orderModel.ordersId!,
        ),
        TextItem(
            tilte: "Order date",
            subtilte: " ${Jiffy.parse(orderModel.ordersDatetime!).fromNow()}"),
        TextItem(
          tilte: "Order Type ",
          subtilte: orderModel.ordersType == 0 ? "Receive" : "Delivery",
        ),
        TextItem(
            tilte: "Order Price", subtilte: " ${orderModel.ordersPrice} \$"),
        "${orderModel.ordersDatetime}" == "Receive"
            ? const SizedBox()
            : TextItem(
                tilte: "Delivery Price",
                subtilte: " ${orderModel.ordersPricedelivery} \$"),
        TextItem(
          tilte: "Payment Method ",
          subtilte:
              orderModel.ordersPaymentmethod == 0 ? "On Delivery" : "On Card",
        ),
        OrderStatus(
          orderStatus: orderModel.ordersStatus!,
          orderid: orderModel.ordersId!,
        ),
        const SizedBox(height: 15),
        DetailsButton(
            totlaPrice: "${orderModel.totalprice}", orderModel: orderModel),
        const SizedBox(height: 5),
        const Divider(color: Colors.grey, thickness: 1.5),
      ]),
    );
  }
}
