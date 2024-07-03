import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handling _data.dart';
import '../../data/datasource/remote/auth/reset_password_data.dart';
import '../forget_password_controller.dart';

class ResetPasswordController extends GetxController {
  ResetpasswordData resetpasswordData = ResetpasswordData(Get.find());
  var controller = Get.put(ForgetPasssowrdController());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  resetpassword(String newPaaword, String retypePassword) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await resetpasswordData.resetpassword(
        email!, newPaaword, retypePassword);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "NoMatchFailure") {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "error",
          middleText: "no matched password",
        );
      } else if (response["status"] == "RepeatPassFailure") {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "error",
          middleText: "this password is already found",
        );
      } else {
        Get.offNamed(kResetpasswordsucsess);
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
  }
}
