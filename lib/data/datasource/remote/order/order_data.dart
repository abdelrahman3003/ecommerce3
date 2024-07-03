import '../../../../core/class/crud.dart';
import '../../../../core/constant/backlinks.dart';

class OrderData {
  Crud crud;
  OrderData(this.crud);
  checkout(Map data) async {
    var response = await crud.postData(checkoutOrderNameLink, data);
    return response.fold((l) => l, (r) => r);
  }

  viewOrder(String userid) async {
    var response = await crud.postData(viewOrderNameLink, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  deleteOrder(int orderid) async {
    var response = await crud
        .postData(deleteOrderNameLink, {"orderid": orderid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  viewOrderDetail(String orderid) async {
    var response =
        await crud.postData(viewOrderDetailsNameLink, {"orderid": orderid});
    return response.fold((l) => l, (r) => r);
  }

  orderRating(int orderid, double rate, String comment) async {
    var response = await crud.postData(orderRatingNameLink, {
      "orderid": orderid.toString(),
      "rate": rate.toString(),
      "comment": comment.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
