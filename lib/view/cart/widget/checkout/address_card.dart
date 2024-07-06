import 'package:eccommerce4/controller/cart/checkout_controller.dart';
import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constatns_value.dart';

class AddessCard extends GetView<CheckoutControllerImp> {
  const AddessCard(
      {super.key,
      required this.isActive,
      required this.address,
      required this.subaddress,
      required this.index,
      
      });
  final bool isActive;
  final String address;
  final String subaddress;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          if (controller.deliveryType == "1") {
            controller.chooseAddress(index);
          }
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: Get.height / 9,
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kborderradius),
                color: isActive ? ColorsApp.kprimaryColor1 : Colors.white,
                border: Border.all(color: ColorsApp.kprimaryColor1)),
            child: ListTile(
              title: Text(address,
                  style: Styles.textStyle25.copyWith(
                      color: isActive ? Colors.white : ColorsApp.kprimaryColor1,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(subaddress,
                  style: Styles.textStyle20.copyWith(
                      color: isActive ? Colors.white : ColorsApp.kprimaryColor1,
                      fontWeight: FontWeight.bold)),
            )),
      ),
    );
  }
}
