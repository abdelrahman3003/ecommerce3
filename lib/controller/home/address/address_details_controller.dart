import 'package:eccommerce4/core/class/statuscode.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class AddressDetailsController extends GetxController {
  inilData();
}

class AddressDetailsControllerImp extends AddressDetailsController {
  StatusRequest statusRequest = StatusRequest.none;
  String? lat;
  String? long;
  @override
  void onInit() {
    super.onInit();
    inilData();
    print("=================== lat = $lat");
  }

  @override
  inilData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }
}
