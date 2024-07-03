import 'package:eccommerce4/view/home/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../view/home/widget/notification/notification_view.dart';
import '../../view/home/widget/offer/offer_view.dart';
import '../../view/home/widget/setting/setting_view.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int pageCount = 0;
  List<Widget> pageList = [
    const HomePageView(),
    const NotificationView(),
    const SettingView(),
    const OfferView(),
  ];
  @override
  changepage(i) {
    pageCount = i;
    update();
  }
}
