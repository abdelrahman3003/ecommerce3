import 'package:eccommerce4/controller/cart/checkout_controller.dart';
import 'package:eccommerce4/core/class/data_handilng.dart';
import 'package:eccommerce4/core/class/data_handling_request.dart';
import 'package:eccommerce4/core/class/statuscode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../cart/custom_abbpar.dart';
import 'address_list.dart';
import 'checkoutButton.dart';
import 'delivery_type.dart';
import 'payway.dart';
import 'text_title.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutControllerImp());
    return GetBuilder<CheckoutControllerImp>(
        builder: (controller) => DataHandlingRequsetState(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAbbpar(title: "CheckOut"),
                    const SizedBox(height: 12),
                    const TextTitle(text: "Choose your pay way"),
                    const SizedBox(height: 12),
                    PayWay(
                        text: "On delivery",
                        isActive: controller.payWay == "0" ? true : false),
                    const SizedBox(height: 12),
                    PayWay(
                        text: "on Card",
                        isActive: controller.payWay == "1" ? true : false),
                    const SizedBox(height: 12),
                    const TextTitle(text: "Choose delivery type "),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        DeliveryType(
                            icon: Icons.drive_file_rename_outline,
                            isActive:
                                controller.deliveryType == "0" ? true : false,
                            text: "Drive Thru"),
                        const SizedBox(width: 12),
                        DeliveryType(
                            icon: Icons.delivery_dining,
                            isActive:
                                controller.deliveryType == "1" ? true : false,
                            text: "Delivery"),
                      ],
                    ),
                    const SizedBox(height: 12),
                    controller.deliveryType == "1"
                        ? const TextTitle(text: "Shipping address")
                        : const SizedBox(),
                    const SizedBox(height: 12),
                    controller.deliveryType == "1"
                        ? DataHandlingState(
                            statusRequest:
                                controller.addressController!.statusRequest,
                            widget: const SizedBox(
                                height: 300, child: AddressList()))
                        : const SizedBox(height: 12),
                    const SizedBox(height: 12),
                  ],
                ),
                const Spacer(),
                const CheckoutButton(tilte: "Checkout"),
              ],
            )));
  }
}
