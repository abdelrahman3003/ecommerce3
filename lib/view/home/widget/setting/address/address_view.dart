import 'package:eccommerce4/controller/home/address/address_controller.dart';
import 'package:eccommerce4/core/class/data_handilng.dart';
import 'package:eccommerce4/core/class/statuscode.dart';
import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressControllerIMp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("address"),
        centerTitle: true,
      ),
      body: GetBuilder<AddressControllerIMp>(
          builder: (controller) => DataHandlingState(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.addressLsit.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          controller.addressLsit[index].addressName ??
                              " knowon",
                          style: Styles.textStyle20black,
                        ),
                        subtitle: Text(
                          controller.addressLsit[index].addressStreet ??
                              " knowon",
                          style: Styles.textStyle16,
                        ),
                        trailing: controller.statusRequest2 ==
                                    StatusRequest.loading &&
                                index == controller.deleteIndex
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child:
                                    Center(child: CircularProgressIndicator()))
                            : IconButton(
                                onPressed: () {
                                  controller.deleteAddress(index);
                                },
                                icon: const Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                )),
                      ),
                    ),
                  ),
                ),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(kAddAddressView);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
