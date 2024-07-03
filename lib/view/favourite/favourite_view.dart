import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite/myfavourites_controller.dart';
import '../home/widget/home_page_view/home_appbar.dart';
import 'favourite_view/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavouritesCOntrollerImp());
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 5),
          HomeAppbar(),
          SizedBox(height: 30),
          Expanded(child: FavouriteViewBody()),
        ],
      )),
    );
  }
}
