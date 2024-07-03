import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../data/model/notification_model.dart';
import 'notification_card.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key, required this.notificationList});
  final List<NotificationModel> notificationList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notificationList.length,
      itemBuilder: (context, index) => NotificationCard(
        date:
            " ${Jiffy.parse(notificationList[index].notificationsDatetime!).fromNow()}",
        subtitle: "${notificationList[index].notificationsBody}",
        tilte: "${notificationList[index].notificationsTitle}",
      ),
    );
  }
}
