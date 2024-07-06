import 'dart:async';

import 'package:eccommerce4/core/class/statuscode.dart';
import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddAddressController extends GetxController {
  getCurrentPosition();
  addMarker(LatLng lating);
  goToAddresDetails();
}

class AddAddressControllerImp extends AddAddressController {
  Completer<GoogleMapController>? completerController;
  Position? position;
  CameraPosition? kGooglePlex;
  StatusRequest statusRequest = StatusRequest.loading;
  List<Marker> markers = [];
  double? lat;
  double? long;
  @override
  void onInit() {
    completerController = Completer<GoogleMapController>();
    getCurrentPosition();
    super.onInit();
  }

  @override
  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    lat = position!.altitude;
    long = position!.longitude;
    markers.add(
        Marker(markerId: const MarkerId('1'), position: LatLng(lat!, long!)));

    statusRequest = StatusRequest.success;
    update();
  }

  @override
  addMarker(LatLng lating) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('1'), position: lating));
    lat = lating.latitude;
    long = lating.longitude;

    update();
  }

  @override
  goToAddresDetails() {
    if (lat == null || long == null) {
      return Get.snackbar("warning", "select location");
    }
    Get.toNamed(kAddressDetailsView, arguments: {
      'lat': lat,
      'long': long,
    });
    update();
  }
}
