import 'package:eccommerce4/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home/home_screen_controller.dart';

class AppbarItem extends GetView<HomeScreenControllerImp> {
  const AppbarItem({
    super.key,
    this.iconName = "",
    required this.icon,
    required this.isactive,
  });
  final String iconName;
  final IconData icon;
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              if (icon == Icons.notifications) {
                controller.changepage(1);
              } else if (icon == Icons.settings) {
                controller.changepage(2);
              } else if (icon == Icons.offline_bolt_outlined) {
                controller.changepage(3);
              } else {
                controller.changepage(0);
              }
            },
            icon: Icon(icon,
                size: 30,
                color: isactive ? ColorsApp.kprimaryColor1 : Colors.black),
          ),
          // Text(
          //   iconName,
          //   style: Styles.textStyle16,
          // ),
        ],
      ),
    );
  }
}
