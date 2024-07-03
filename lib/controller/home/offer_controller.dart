import 'package:eccommerce4/core/services/services.dart';
import 'package:eccommerce4/data/model/items_model.dart';
import 'package:get/get.dart';
import '../../core/class/statuscode.dart';
import '../../core/constant/routsApp.dart';
import '../../data/datasource/remote/items/items_data.dart';
import '../../core/functions/handling _data.dart';

abstract class ItemsOfferController extends GetxController {
  getOfferItems();
  goToItemDetails(ItemModel itemModel);
}

class ItemsOfferControllerImp extends ItemsOfferController {
  GetItemData getItemData = GetItemData(Get.find());
  AppServices appServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  late int selectedCat;
  List<ItemModel> itemsoffer = [];

  @override
  getOfferItems() async {
    itemsoffer = [];
    statusRequest = StatusRequest.loading;
    update();
    var response = await getItemData.getIteOffermData();
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List data = response["data"];
        itemsoffer.addAll(data.map((e) => ItemModel.fromJson(e)));
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getOfferItems();
  }

  @override
  goToItemDetails(ItemModel itemModel) {
    Get.toNamed(kItemDetailsView, arguments: {"itemModel": itemModel});
    update();
  }
}
