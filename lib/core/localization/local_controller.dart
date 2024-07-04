import 'package:eccommerce4/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../functions/fcmconfg.dart';

class LocalController extends GetxController {
  Locale? language;
  AppServices appServices = Get.find();
  bool iseng = true;
  changeLanguage(String codelang) {
    Locale locale = Locale(codelang);
    appServices.sharedPreferences.setString("lang", codelang);
    Get.updateLocale(locale);
  }

  requesPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Warning", "please turn on  location services");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar(
            "Warning", "Are you want for this app to reach on location");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar(
          "Warning", "can not work on this app without location");
    }
  }

  @override
  void onInit() {
    requestpermisionnotification();
    requesPermissionLocation();
    fcmconfig();
    String? sharedpreflanguage =
        appServices.sharedPreferences.getString("lang");
    if (sharedpreflanguage == "en") {
      language = const Locale("en");
    } else if (sharedpreflanguage == "ar") {
      language = const Locale("ar");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appServices.sharedPreferences
          .setString("lang", Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
