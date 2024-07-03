import 'package:eccommerce4/core/class/crud.dart';
import 'package:eccommerce4/core/constant/backlinks.dart';

class GetHomeData {
  Crud crud;
  GetHomeData(this.crud);
  getHomeData() async {
    var response = await crud.getData(homeNameLink, {});
    return response.fold((l) => l, (r) => r);
  }
}
