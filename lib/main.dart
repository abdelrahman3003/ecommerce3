import 'dart:io';
import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:eccommerce4/core/localization/local_controller.dart';
import 'package:eccommerce4/core/localization/translations.dart';
import 'package:eccommerce4/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/constant/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inialServices();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      locale: controller.language,
      translations: AppTrnaslations(),
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      initialBinding: AppBinding(),
      //routes: routes,
      theme: ThemeData(fontFamily: "Cairo"),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
