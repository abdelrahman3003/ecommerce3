import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:eccommerce4/data/datasource/remote/home/home_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import '../../core/class/statuscode.dart';
import '../../core/functions/handling _data.dart';
import '../../data/datasource/remote/items/items_data.dart';
import '../../data/model/items_model.dart';

abstract class HomeController extends GetxController {
  getAllDataHome();
  goToItems(List categoreis, int selectedCa);
}

class HomePageControllerImp extends HomeController {
  GetHomeData getHomeData = GetHomeData(Get.find());
  GetItemData getItemData = GetItemData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  int pageCount = 0;
  List categories = [];
  List<ItemModel> topselling = [];
  List textDiscount = [];

  @override
  getAllDataHome() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getHomeData.getHomeData();
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List data = response['topselling'];
        categories.addAll(response['categories']);
        topselling.addAll(data.map((e) => ItemModel.fromJson(e)));
        textDiscount.addAll(response['textdiscount']);
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();

    getAllDataHome();
    FirebaseMessaging.instance.subscribeToTopic("users");
  }

  @override
  goToItems(categoreis, selectedCa) {
    Get.toNamed(
      kItemsView,
      arguments: {"categories": categories, "selectedCat": selectedCa},
    );
    update();
  }

  @override
  goToItemDetails(ItemModel itemModel) {
    Get.toNamed(kItemDetailsView, arguments: {"itemModel": itemModel});
    update();
  }
}
