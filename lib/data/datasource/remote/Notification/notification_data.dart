import 'package:eccommerce4/core/class/crud.dart';
import 'package:eccommerce4/core/constant/backlinks.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getNotifications(String userid) async {
    var response =
        await crud.postData(getNotifcationsNameLink, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
