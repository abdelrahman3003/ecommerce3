import 'package:eccommerce4/core/class/statuscode.dart';
import 'package:eccommerce4/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handling _data.dart';
import '../../core/services/services.dart';
import '../../core/shared/styles.dart';
import '../../data/datasource/remote/cart/cart_data.dart';
import '../../data/model/cart_model.dart';

abstract class ItemsDetailsController extends GetxController {
  inialData();
  addCart(int itemid);
  removeCart(int itemid);
  getCountItem(int itemid);
  add();
  remove();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late ItemModel itemModel;
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(Get.find());
  AppServices appServices = Get.find();
  List<CartModel> cartmodelLsit = [];
  int count = 0;

  @override
  inialData() async {
    itemModel = Get.arguments['itemModel'];
    count = await getCountItem(itemModel.itemsId!);
    update();
  }

  @override
  addCart(itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        itemid, appServices.sharedPreferences.getString("id")!);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        Get.rawSnackbar(
            title: "alarm",
            messageText: Text(
              "1 product is added to your cart",
              style: Styles.textStyle16.copyWith(color: Colors.white),
            ));
      }
    }
    update();
  }

  @override
  removeCart(itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        "$itemid", appServices.sharedPreferences.getString("id")!);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        Get.rawSnackbar(
            title: "alarm",
            messageText: Text(
              "1 product is removed from your cart",
              style: Styles.textStyle16.copyWith(color: Colors.white),
            ));
      }
    }
    update();
  }

  @override
  getCountItem(itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCountItem(
        "$itemid", appServices.sharedPreferences.getString("id")!);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        return response["data"];
      }
    }
    update();
  }

  @override
  add() {
    addCart(itemModel.itemsId!);
    count++;
    update();
  }

  @override
  remove() {
    removeCart(itemModel.itemsId!);
    if (count >= 0) count--;
    update();
  }

  @override
  void onInit() {
    inialData();
    // TODO: implement onInit
    super.onInit();
  }
}
