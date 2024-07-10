import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:eccommerce4/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController {
  logout();
}

class SettingControllerImp extends SettingController {
  AppServices appServices = Get.find();
  @override
  logout() {
    String userid = appServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic('users');
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    Get.offAllNamed(kSignin);
    appServices.sharedPreferences.clear();
  }
}
