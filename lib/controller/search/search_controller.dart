import 'package:eccommerce4/core/services/services.dart';
import 'package:eccommerce4/data/datasource/remote/items/search_data.dart';
import 'package:eccommerce4/data/model/items_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../core/class/statuscode.dart';
import '../../core/constant/routsApp.dart';
import '../../core/functions/handling _data.dart';

abstract class SearchController extends GetxController {
  checkSearch(String val);
  search();
  getSearch(String search);
  goToItemDetails(ItemModel itemModel);
}

class SearchControllerImp extends SearchController {
  AppServices appServices = Get.find();
  SearchData searchData = SearchData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  bool isSearch = false;
  TextEditingController? searchText;
  List<ItemModel> searchItemsList = [];
  @override
  checkSearch(String val) {
    if (val == "") {
      isSearch = false;
      statusRequest = StatusRequest.none;
    } else {
      isSearch = true;
    }
    update();
  }

  @override
  search() {
    isSearch = true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    searchText = TextEditingController();
  }

  @override
  getSearch(search) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchData.searchData(search);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        searchItemsList.clear();
        List responseData = response['data'];
        searchItemsList.addAll(responseData.map((e) => ItemModel.fromJson(e)));
      }
    }
    update();
  }

  @override
  goToItemDetails(itemModel) {
    Get.toNamed(kItemDetailsView, arguments: {"itemModel": itemModel});
    update();
  }
}
