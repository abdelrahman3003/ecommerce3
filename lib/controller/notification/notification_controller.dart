import 'package:eccommerce4/data/datasource/remote/Notification/notification_data.dart';
import 'package:eccommerce4/data/model/notification_model.dart';
import 'package:get/get.dart';
import '../../core/class/statuscode.dart';
import '../../core/functions/handling _data.dart';
import '../../core/services/services.dart';

abstract class NotificationController extends GetxController {
  viewNotification();
}

class NotificationControllerImp extends NotificationController {
  StatusRequest statusRequest = StatusRequest.none;
  NotificationData notificationData = NotificationData(Get.find());
  AppServices appServices = Get.find();
  List<NotificationModel> notificationList = [];

  @override
  viewNotification() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData
        .getNotifications(appServices.sharedPreferences.getString("id")!);
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
      } else {
        List data = response["data"];
        notificationList.addAll(data.map((e) => NotificationModel.fromJson(e)));
        print("=========== ${notificationList.length}");
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    viewNotification();
  }
}
