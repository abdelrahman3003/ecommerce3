import 'package:eccommerce4/core/class/statuscode.dart';
import 'package:eccommerce4/core/functions/handling%20_data.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:eccommerce4/data/datasource/remote/address/address_data.dart';
import 'package:eccommerce4/data/model/address/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressController extends GetxController {
  getAdress();
  deleteAddress(int index);
}

class AddressControllerIMp extends AddressController {
  List<Address> addressLsit = [];
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest statusRequest2 = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  int deleteIndex = 0;
  @override
  void onInit() {
    super.onInit();
    getAdress();
  }

  @override
  getAdress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.getAddress();

    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        print("==============${addressLsit.length}");
        List data = response["data"];
        addressLsit.addAll(data.map((e) => Address.fromJson(e)));
      }
    }
    update();
  }

  @override
  deleteAddress(int index) async {
    deleteIndex = index;
    statusRequest2 = StatusRequest.loading;
    update();
    var response =
        await addressData.deleteAddress(addressLsit[index].addressId!);
    addressLsit.removeAt(index);
    statusRequest2 = handlingApiData(response);
    if (statusRequest2 == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest2 = StatusRequest.failure;
      } else {
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            title: "Successfully",
            messageText: Text(
              "Address is Deletes",
              style: Styles.textStyle16.copyWith(color: Colors.white),
            ));
      }
    }
    update();
  }
}
