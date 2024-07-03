import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:eccommerce4/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMiddleWare extends GetMiddleware {
  @override
  int? priority = 0;
  AppServices appServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (appServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: kHomeScreenView);
    }
    if (appServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: kSignin);
    }

    return null;
  }
}
