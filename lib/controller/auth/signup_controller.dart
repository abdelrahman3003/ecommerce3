import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handling _data.dart';
import '../../data/datasource/remote/auth/postdata_signup.dart';

class SignupController extends GetxController {
  PostDataSignup postDataSignup = PostDataSignup(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  signup(String username, String email, String phone, String password) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await postDataSignup.postDataSignup(username, email, phone, password);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "Warrning",
          middleText: "Phone or Email is aleady found",
        );
      } else {
        Get.toNamed(kVerifyCode, arguments: {'email': email});
      }
      update();
    } else {}
  }
}
