import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:eccommerce4/core/services/services.dart';
import 'package:eccommerce4/data/model/items_model.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../data/datasource/remote/items/items_data.dart';
import '../../core/functions/handling _data.dart';

abstract class ItemsController extends GetxController {
  changeCategory(int i);
  getItems(int categoryId);
  goToItemDetails(ItemModel itemModel);
  inialData();
}

class ItemsControllerImp extends ItemsController {
  GetItemData getItemData = GetItemData(Get.find());
  AppServices appServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  late int selectedCat;
  List items = [];
  List categories = [];
  @override
  changeCategory(i) {
    selectedCat = i;
    update();
  }

  @override
  getItems(categoryId) async {
    items = [];
    statusRequest = StatusRequest.loading;
    update();
    var response = await getItemData.getItemData(
        categoryId, appServices.sharedPreferences.getString("id")!);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;

        Get.toNamed(kItemsView);
      } else {
        items.addAll(response['data']);
        Get.toNamed(kItemsView);
      }
      update();
    }
  }

  @override
  goToItemDetails(itemModel) {
    Get.toNamed(kItemDetailsView, arguments: {"itemModel": itemModel});
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    inialData();
  }

  @override
  inialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    getItems(selectedCat + 1);
    update();
  }
}
