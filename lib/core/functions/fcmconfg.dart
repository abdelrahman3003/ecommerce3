import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../../controller/setting/orders_controller.dart';

requestpermisionnotification() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen((message) {
    FlutterRingtonePlayer().playNotification();
    print("================= notification");
    print("================= ${message.notification}");
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshorderpage(message.data);
  });
}

refreshorderpage(data) {
  if (Get.currentRoute == "/OrderView" && data['pagename'] == "approved") {
    OrderControllerImp controller = Get.find();
    controller.refreshOrderpage();
  }
}
