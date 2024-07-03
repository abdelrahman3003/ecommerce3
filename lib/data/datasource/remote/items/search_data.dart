import 'package:eccommerce4/core/class/crud.dart';
import 'package:eccommerce4/core/constant/backlinks.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  searchData(String search) async {
    var response = await crud.postData(searchNameLink, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
