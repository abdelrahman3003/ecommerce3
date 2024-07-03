import 'package:get/get.dart';

class Showpassordcontroller extends GetxController {
  bool isShowpassword = true;
  showpassword() {
    if (isShowpassword) {
      isShowpassword = false;
    } else {
      isShowpassword = true;
    }
    update();
  }
}
