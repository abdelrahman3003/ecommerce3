import 'package:eccommerce4/core/class/crud.dart';
import 'package:eccommerce4/core/constant/backlinks.dart';

class AddRemoveFavourite {
  Crud crud;
  AddRemoveFavourite(this.crud);
  addFavourite(String itemid, String userid) async {
    var response = await crud
        .postData(addtofavouriteNameLink, {"itemid": itemid, "userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  removeFavourite(String itemid, String userid) async {
    var response = await crud.postData(
        removefromfavouriteNameLink, {"itemid": itemid, "userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
