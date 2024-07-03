import 'package:eccommerce4/controller/notification/notification_controller.dart';
import 'package:eccommerce4/core/class/data_handilng.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/notification_body_view.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationControllerImp());
    return GetBuilder<NotificationControllerImp>(
      builder: (controller) => DataHandlingState(
          statusRequest: controller.statusRequest,
          widget: const NotificationViewBody()),
    );
  }
}
