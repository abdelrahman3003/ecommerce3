import 'package:eccommerce4/core/class/crud.dart';
import 'package:eccommerce4/core/constant/backlinks.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(int itemid, String userid) async {
    var response = await crud.postData(
        addcartNameLink, {"itemid": itemid.toString(), "userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  removeCart(itemid, String userid) async {
    var response = await crud.postData(
        removecartNameLink, {"itemid": itemid.toString(), "userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  getCountItem(itemid, String userid) async {
    var response = await crud.postData(
        getcounitemNameLink, {"itemid": itemid.toString(), "userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String userid) async {
    var response = await crud.postData(viewcartNameLink, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  checkcoupon(String couponname, String userid) async {
    var response = await crud.postData(
        checkcouponNameLink, {"couponname": couponname, "userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
