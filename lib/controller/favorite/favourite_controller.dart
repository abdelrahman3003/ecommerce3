import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handling _data.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/favorite/add_remove_favourite_data.dart';

abstract class FavouriteController extends GetxController {
  setFavourite(id, val);
  addFavourite(itemid);
  removeFavourite(itemid);
}

class FavouriteControllerImp extends FavouriteController {
  StatusRequest statusRequest = StatusRequest.none;
  AddRemoveFavourite addRemoveFavourite = AddRemoveFavourite(Get.find());

  AppServices appServices = Get.find();
  Map favourite = {};
  @override
  setFavourite(id, val) {
    favourite[id] = val;
    update();
  }

  @override
  addFavourite(itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addRemoveFavourite.addFavourite(
        "$itemid", appServices.sharedPreferences.getString("id")!);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        Get.rawSnackbar(
            title: "alarm",
            messageText: Text(
              "this product is removed to favourites",
              style: Styles.textStyle16.copyWith(color: Colors.white),
            ));
      }
    }
  }

  @override
  removeFavourite(itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addRemoveFavourite.removeFavourite(
        "$itemid", appServices.sharedPreferences.getString("id")!);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        Get.rawSnackbar(
            title: "alarm",
            messageText: const Text(
              "this product is added to favourites",
              style: Styles.textStyle16,
            ));
      }
    }
  }
}
