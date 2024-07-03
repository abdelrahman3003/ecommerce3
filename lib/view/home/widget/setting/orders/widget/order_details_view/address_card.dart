import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/core/constant/constatns_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: Get.height / 3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kborderradius),
          border: Border.all(color: ColorsApp.kprimaryColor1)),
      child: const Center(child: Text("Address")),
    );
  }
}
