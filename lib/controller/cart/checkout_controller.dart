import 'package:eccommerce4/controller/home/address/address_controller.dart';
import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handling _data.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/order/order_data.dart';
import '../../data/model/order_model.dart';

abstract class CheckoutController extends GetxController {
  choosePayWay(String val);
  chooseDeliveryType(String val);
  chooseAddress(int index);
  checkout();
  viewOrder();
  initidata();
}

class CheckoutControllerImp extends CheckoutController {
  StatusRequest statusRequest = StatusRequest.none;
  OrderData orderData = OrderData(Get.find());
  AppServices appServices = Get.find();
  AddressControllerIMp? addressController;
  String? payWay;
  String? deliveryType;
  int? addressid;
  String? addressName;
  dynamic priceorder;
  String? ordercoupon;
  List<OrderModel> orderList = [];
  @override
  void onInit() {
    super.onInit();
    initidata();
  }

  @override
  initidata() {
    addressController = Get.put(AddressControllerIMp());
    priceorder = Get.arguments['priceorder'];
    ordercoupon = Get.arguments['couponName'];
    ordercoupon ?? "null";
    update();
  }

  @override
  chooseAddress(index) {
    addressName = addressController!.addressLsit[index].addressName;
    addressid = addressController!.addressLsit[index].addressId;
    update();
  }

  @override
  chooseDeliveryType(val) {
    deliveryType = val;
    addressName = "";
    update();
  }

  @override
  choosePayWay(val) {
    payWay = val;
    update();
  }

  @override
  checkout() async {
    if (payWay == null) {
      return Get.snackbar("alarm", "please payway to checkout ");
    }

    if (deliveryType == null) {
      return Get.snackbar("alarm", "please order type  to checkout ");
    }
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "userid": appServices.sharedPreferences.getString("id")!,
      "addressid": addressid.toString(),
      "orderprice": priceorder.toString(),
      "orderpricedelivery": '10',
      "ordercoupon": ordercoupon.toString(),
      "ordertype": deliveryType.toString(),
      "orderspaymentmethod": payWay.toString(),
    };
    var response = await orderData.checkout(data);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
        Get.snackbar("alarm", "there was an error");
      } else {
        Get.offAllNamed(kHomeScreenView);
        Get.snackbar("alarm", "cart is empty");
      }
    }
    update();
  }

  @override
  viewOrder() async {
    statusRequest = StatusRequest.loading;
    var response = await orderData
        .viewOrder(appServices.sharedPreferences.getString("id")!);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
      } else {
        List data = response["data"];
        orderList.addAll(data.map((e) => OrderModel.fromJson(e)));
      }
    }
    update();
  }
}
