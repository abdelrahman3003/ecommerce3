import 'package:eccommerce4/core/class/statuscode.dart';
import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:eccommerce4/core/functions/handling%20_data.dart';
import 'package:eccommerce4/core/services/services.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:eccommerce4/data/datasource/remote/address/address_data.dart';
import 'package:eccommerce4/data/model/address/address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

abstract class AddressDetailsController extends GetxController {
  inilData();
  addAddress();
}

class AddressDetailsControllerImp extends AddressDetailsController {
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  AppServices appServices = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double? lat;
  double? long;
  String? city;
  String? streat;
  String? addresNmae;
  Address? address;
  @override
  void onInit() {
    super.onInit();
    inilData();
    print("=============== lat $lat");
    print("=============== long $long");
  }

  @override
  inilData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  @override
  addAddress() async {
    address = Address(
      addressUserid: appServices.sharedPreferences.getString('id')!,
      addressLat: lat,
      addressLong: long,
      addressName: addresNmae,
      addressCity: city,
      addressStreet: streat,
    );
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.addAddress(address!);

    statusRequest = handlingApiData(response);

    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        Get.toNamed(kHomeScreenView);
        Get.rawSnackbar(
            title: "Successfully",
            messageText: Text(
              "Address is added",
              style: Styles.textStyle16.copyWith(color: Colors.white),
            ));
      }
    }
    update();
  }
}
