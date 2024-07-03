import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home/home_screen_controller.dart';
import 'appar_item.dart';

class AppBottomNavigatorBar extends StatelessWidget {
  const AppBottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppbarItem(
              icon: Icons.home,
              //iconName: ConstanstValue.home,
              isactive: controller.pageCount == 0 ? true : false,
            ),
            AppbarItem(
              icon: Icons.notifications,
              // iconName: ConstanstValue.favourite,
              isactive: controller.pageCount == 1 ? true : false,
            ),
            AppbarItem(
              icon: Icons.offline_bolt_outlined,
              // iconName: ConstanstValue.setting,
              isactive: controller.pageCount == 3 ? true : false,
            ),
            AppbarItem(
              icon: Icons.settings,
              //iconName: ConstanstValue.cart,
              isactive: controller.pageCount == 2 ? true : false,
            ),
          ],
        ),
      ),
    );
  }
}
