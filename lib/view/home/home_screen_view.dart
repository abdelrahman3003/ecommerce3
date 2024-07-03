import 'dart:io';

import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/home_screen_controller.dart';
import 'widget/home_screen_view/custom_botttom_navigatorbar.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return Scaffold(
        bottomNavigationBar: const AppBottomNavigatorBar(),
        //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //     backgroundColor: ColorsApp.kprimaryColor1,
        //     onPressed: () {},
        //     child: const Icon(Icons.home)),
        body: GetBuilder<HomeScreenControllerImp>(
          builder: (controller) {
            return SafeArea(
                child: WillPopScope(
              child: controller.pageList[controller.pageCount],
              onWillPop: () {
                Get.defaultDialog(
                  title: "Warning",
                  titleStyle: Styles.textStyle20black
                      .copyWith(fontWeight: FontWeight.bold),
                  middleText: "are sure to exit",
                  buttonColor: ColorsApp.kprimaryColor1,
                  textConfirm: "OK",
                  confirmTextColor: Colors.white,
                  onConfirm: () => exit(0),
                );
                return Future.value(false);
              },
            ));
          },
        ));
  }
}
