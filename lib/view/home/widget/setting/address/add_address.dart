import 'package:eccommerce4/controller/home/add_address_controller.dart';
import 'package:eccommerce4/core/class/data_handilng.dart';
import 'package:eccommerce4/core/class/data_handling_request.dart';
import 'package:eccommerce4/core/class/statuscode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text("adddress"),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child:
                    GetBuilder<AddAddressControllerImp>(builder: (controller) {
                  return DataHandlingRequsetState(
                      statusRequest: controller.statusRequest,
                      widget: controller.kGooglePlex != null
                          ? GoogleMap(
                              mapType: MapType.normal,
                              initialCameraPosition: controller.kGooglePlex!,
                              onMapCreated: (GoogleMapController gcontroller) {
                                controller.completerController!
                                    .complete(gcontroller);
                              },
                            )
                          : const SizedBox());
                }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ));
  }
}
