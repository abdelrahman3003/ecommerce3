import 'package:eccommerce4/controller/cart/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'address_card.dart';

class AddressList extends StatelessWidget {
  const AddressList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutControllerImp>(
        builder: (controller) => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.addressController!.addressLsit.length,
              itemBuilder: (context, index) => AddessCard(
                isActive: controller.addressName ==
                        controller
                            .addressController!.addressLsit[index].addressName
                    ? true
                    : false,
                address: controller
                        .addressController!.addressLsit[index].addressName ??
                    "",
                subaddress: controller
                        .addressController!.addressLsit[index].addressStreet ??
                    "",
                index: index,
              ),
            ));
  }
}
