import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statuscode.dart';
import '../../core/constant/routsApp.dart';
import '../../core/functions/handling _data.dart';
import '../../core/services/services.dart';
import '../../core/shared/styles.dart';
import '../../data/datasource/remote/order/order_data.dart';
import '../../data/model/order_model.dart';

abstract class OrderController extends GetxController {
  viewOrder();
  deleteOrder(int index);
  refreshOrderpage();
  goToOrederDetails(OrderModel orderModel);
  String printOrderStatus(val);
  rating(int orderid, double rate, String comment);
}

class OrderControllerImp extends OrderController {
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest statusRequest2 = StatusRequest.none;
  OrderData orderData = OrderData(Get.find());
  AppServices appServices = Get.find();
  List<OrderModel> orderList = [];
  bool isArchived = false;
  int? orderDeleted;

  @override
  viewOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderData
        .viewOrder(appServices.sharedPreferences.getString("id")!);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List data = response["data"];
        orderList.addAll(data.map((e) => OrderModel.fromJson(e)));
      }
    }
    update();
  }

  @override
  deleteOrder(index) async {
    orderDeleted = index;
    statusRequest2 = StatusRequest.loading;
    update();
    var response = await orderData.deleteOrder(orderList[index].ordersId!);
    statusRequest2 = handlingApiData(response);
    if (statusRequest2 == StatusRequest.success) {
      if (response["status"] == "failure") {
        Get.rawSnackbar(
            title: "alarm",
            messageText: Text(
              "the order isn't approved and  can't deleted ",
              style: Styles.textStyle16.copyWith(color: Colors.white),
            ));
      } else {
        orderList.removeAt(index);
        update();
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    viewOrder();
  }

  @override
  refreshOrderpage() async {
    orderList.clear();
    await viewOrder();
  }

  @override
  goToOrederDetails(orderModel) {
    Get.toNamed(kOrderDetailsView, arguments: {"ordermodel": orderModel});
    update();
  }

  @override
  String printOrderStatus(val) {
    if (val == 0) {
      return "Approving";
    } else if (val == 1) {
      return "preparing";
    } else if (val == 2) {
      return "Ready to pick";
    } else if (val == 3) {
      return "On the way";
    }
    return "Archived";
  }

  @override
  rating(orderid, rate, comment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderData.orderRating(orderid, rate, comment);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        Get.rawSnackbar(
            title: "alarm",
            messageText: Text(
              "rating is added",
              style: Styles.textStyle16.copyWith(color: Colors.white),
            ));
      }
    }
    update();
  }
}
