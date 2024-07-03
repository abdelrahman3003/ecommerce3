import 'package:eccommerce4/data/model/myfavourites_model.dart';

import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handling _data.dart';
import '../../core/services/services.dart';

import '../../data/datasource/remote/favorite/myfavourites_data.dart';

abstract class MyFavouritesCOntroller extends GetxController {
  viewMyfavourite();
  deleteMyfavourite(favouriteid);
}

class MyFavouritesCOntrollerImp extends MyFavouritesCOntroller {
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();
  MyFavourites myFavourites = MyFavourites(Get.find());
  List<MyfavouritesModel> myfavouritesList = [];
  @override
  viewMyfavourite() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myFavourites
        .viewmyvafourite(appServices.sharedPreferences.getString("id")!);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List reponseData = response['data'];
        myfavouritesList
            .addAll(reponseData.map((e) => MyfavouritesModel.fromJson(e)));
      }
    }
    update();
  }

  @override
  deleteMyfavourite(favouriteid) {
    myFavourites.deleteFavourite(favouriteid);
    myfavouritesList
        .removeWhere((element) => element.favouritesId == favouriteid);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    viewMyfavourite();
    super.onInit();
  }
}
