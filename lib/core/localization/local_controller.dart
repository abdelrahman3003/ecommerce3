import 'package:eccommerce4/core/services/services.dart';
import 'package:flutter/material.dart';
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

  @override
  void onInit() {
    requestpermisionnotification();
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
