import 'dart:async';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddressController extends GetxController {}

class AddressControllerImp extends AddressController {
  Completer<GoogleMapController>? completerController;

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  CameraPosition kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  void onInit() {
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }
}
