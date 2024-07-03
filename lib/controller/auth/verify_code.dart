import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handling _data.dart';
import '../../data/datasource/remote/auth/verify_Code_data.dart';
import '../forget_password_controller.dart';

class VerifyCodeController extends GetxController {
  GetVerifyCode getVerifyCode = GetVerifyCode(Get.find());
  var controller = Get.put(ForgetPasssowrdController());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  verifycode(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getVerifyCode.gettVerifyCode(email!, verifyCode);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "error",
          middleText: "Verify code failed",
        );
      } else {
        if (controller.isforegetpassword) {
          Get.toNamed(kRestPassword, arguments: {'email': email});
        } else {
          Get.offNamed(kSignupSucess);
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
  }

  resendVerfyCode() {
    getVerifyCode.resendVerifyCode(email!);
  }
}
