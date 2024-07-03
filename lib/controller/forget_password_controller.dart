import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:get/get.dart';

class ForgetPasssowrdController extends GetxController {
  bool isforegetpassword = false;
  forgetpassword() {
    isforegetpassword = true;
    Get.toNamed(kCheckEmail);
    update();
  }
}
