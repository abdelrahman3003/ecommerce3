import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handling _data.dart';
import '../../core/services/services.dart';
import '../../core/shared/styles.dart';
import '../../data/datasource/remote/cart/cart_data.dart';
import '../../data/model/cart_model.dart';
import '../../data/model/coupon_model.dart';

abstract class CartController extends GetxController {
  addCart(int itemid);
  removeCart(int itemid);
  viewCart();
  getCountItem(int itemid);
  refreshCart();
  resetCart();
  checkCoupon();
  gotocheckout();
}

class CartControllerImp extends CartController {
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(Get.find());
  AppServices appServices = Get.find();
  List<CartModel> cartmodelLsit = [];
  CouponModel? couponModel;
  dynamic tolalprice = 0;
  dynamic tolalcount = 0;
  String? couponName;
  TextEditingController? textEditingController;
  int coupondiscount = 0;
  String? couponing;
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
  viewCart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(appServices.sharedPreferences.getString("id")!);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List data = response["data"];
        cartmodelLsit.addAll(data.map((e) => CartModel.fromJson(e)));
        print("=============== ${cartmodelLsit[0].itemdiscountprice}");
        tolalprice = response['countprice']['totalprice'];
        tolalcount = int.parse(response['countprice']['totalcount']);
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
  refreshCart() {
    resetCart();
    viewCart();
  }

  @override
  void onInit() {
    super.onInit();
    viewCart();
    textEditingController = TextEditingController();
  }

  @override
  resetCart() {
    tolalprice = 0;
    tolalcount = 0;
    cartmodelLsit.clear();
  }

  @override
  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkcoupon(textEditingController!.text,
        appServices.sharedPreferences.getString("id")!);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        couponing = "failure";
      } else {
        couponModel = CouponModel.fromJson(response['data'][0]);
        coupondiscount = couponModel!.couponDiscount!;
        tolalprice =
            tolalprice - (tolalprice * couponModel!.couponDiscount / 100);
        couponing = "true";
        couponName = couponModel!.couponName;
      }
    }
    update();
  }

  @override
  gotocheckout() {
    if (cartmodelLsit.isEmpty) {
      return Get.snackbar("alarm", "cart is empty");
    }
    Get.toNamed(kCheckout,
        arguments: {"priceorder": tolalprice, "couponName": couponName});
  }
}
