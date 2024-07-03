import 'package:eccommerce4/controller/home/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AddressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("address"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: controller.kGooglePlex,
                onMapCreated: (GoogleMapController gcontroller) {
                  controller.completerController!.complete(gcontroller);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }
}
