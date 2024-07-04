import 'package:eccommerce4/controller/home/address/add_address_controller.dart';
import 'package:eccommerce4/core/class/data_handling_request.dart';

import 'package:eccommerce4/core/shared/widgets/buttons/onboarding_Button.dart';
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
              child: GetBuilder<AddAddressControllerImp>(builder: (controller) {
                return DataHandlingRequsetState(
                    statusRequest: controller.statusRequest,
                    widget: controller.kGooglePlex != null
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              GoogleMap(
                                mapType: MapType.normal,
                                markers: controller.markers.toSet(),
                                onTap: (latlong) {
                                  controller.addMarker(latlong);
                                },
                                initialCameraPosition: controller.kGooglePlex!,
                                onMapCreated:
                                    (GoogleMapController gcontroller) {
                                  controller.completerController!
                                      .complete(gcontroller);
                                },
                              ),
                              Positioned(
                                  bottom: 5,
                                  child: OnboardingButton(
                                    text: "Complete",
                                    onPressed: () {
                                      controller.goToAddresDetails();
                                    },
                                  ))
                            ],
                          )
                        : const SizedBox());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
