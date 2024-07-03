import 'package:eccommerce4/core/class/crud.dart';
import 'package:eccommerce4/core/constant/backlinks.dart';

class GetItemData {
  Crud crud;
  GetItemData(this.crud);
  getItemData(int id, String userid) async {
    var response = await crud.postData(
        itemsNameLink, {"categoryId": id.toString(), "userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  getIteOffermData() async {
    var response = await crud.postData(itemsOffersNameLink, {});
    return response.fold((l) => l, (r) => r);
  }
}
