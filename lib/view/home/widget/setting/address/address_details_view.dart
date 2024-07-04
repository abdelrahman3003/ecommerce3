import 'package:eccommerce4/controller/home/address/address_details_controller.dart';
import 'package:eccommerce4/core/class/data_handling_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class AddressDetailsView extends StatelessWidget {
  const AddressDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address Details"),
      ),
      body: GetBuilder<AddressDetailsControllerImp>(
        builder: (controller) => DataHandlingRequsetState(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [],
            )),
      ),
    );
  }
}
