import 'package:get/get.dart';
import '../../core/class/statuscode.dart';
import '../../core/functions/handling _data.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/order/order_data.dart';
import '../../data/model/order_details_model.dart';
import '../../data/model/order_model.dart';

abstract class OrderDetailsController extends GetxController {
  getOrderDetails();
}

class OrderDetailsControllerImp extends OrderDetailsController {
  StatusRequest statusRequest = StatusRequest.none;
  OrderData orderData = OrderData(Get.find());
  AppServices appServices = Get.find();
  List<OrderDetailsModel> orderDtailsList = [];
  OrderModel? orderModel;

  @override
  getOrderDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await orderData.viewOrderDetail(orderModel!.ordersId.toString());
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
      } else {
        List data = response["data"];
        orderDtailsList.addAll(data.map((e) => OrderDetailsModel.fromJson(e)));
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    orderModel = Get.arguments["ordermodel"];
    getOrderDetails();
  }
}
