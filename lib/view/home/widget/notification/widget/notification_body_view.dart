import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/notification/notification_controller.dart';
import 'cotification_list.dart';

class NotificationViewBody extends GetView<NotificationControllerImp> {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
            child: Text("Notifications", style: Styles.textStyle25black)),
        const SizedBox(height: 10),
        Expanded(
            child: NotificationList(
                notificationList: controller.notificationList)),
      ],
    );
  }
}
