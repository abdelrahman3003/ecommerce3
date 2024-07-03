import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handling _data.dart';
import '../../data/datasource/remote/auth/chechkemail_data.dart';

class CheckEmailController extends GetxController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  checkemail(String email) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkEmailData.checkemail(email);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "error",
          middleText: "email not found ",
        );
      } else {
        Get.toNamed(kVerifyCode, arguments: {'email': email});
      }
      update();
    } else {}
  }
}
