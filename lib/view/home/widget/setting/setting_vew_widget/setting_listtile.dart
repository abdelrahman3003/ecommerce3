import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../controller/home/setting_controller.dart';
import 'setting_item_card.dart';

class SeetingListTile extends GetView<SettingControllerImp> {
  const SeetingListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SettinItemCard(title: "Notification", icon: Icons.notifications),
        SettinItemCard(
            onTap: () {
              Get.toNamed(kOrderView);
            },
            title: "Orders",
            icon: Icons.card_travel),
        SettinItemCard(
          title: "Address",
          icon: Icons.location_city_outlined,
          onTap: () {
            Get.toNamed(kAddressView);
          },
        ),
        const SettinItemCard(
            title: "About u", icon: Icons.help_outline_rounded),
        SettinItemCard(
            onTap: () async {
              await launchUrl(Uri.parse("tel:+201050536359"));
            },
            title: "Contact us",
            icon: Icons.phone_callback_outlined),
        SettinItemCard(
            onTap: () {
              controller.logout();
            },
            title: "Logout",
            icon: Icons.logout),
      ],
    );
  }
}
