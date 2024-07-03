import 'package:eccommerce4/controller/cart/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'address_card.dart';
import 'text_title.dart';

class AddressList extends StatelessWidget {
  const AddressList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutControllerImp>(
        builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const TextTitle(text: "Shipping address"),
                const SizedBox(height: 12),
                AddessCard(
                  isActive: controller.addressName == "Home" ? true : false,
                  address: "Home",
                  subaddress: "qena , dishna",
                ),
                const SizedBox(height: 15),
                AddessCard(
                    isActive:
                        controller.addressName == "Company" ? true : false,
                    address: "Company",
                    subaddress: "Cairo , ain shams"),
              ],
            ));
  }
}
