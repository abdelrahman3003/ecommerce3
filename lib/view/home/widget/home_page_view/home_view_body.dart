import 'package:eccommerce4/controller/home/home_controller.dart';
import 'package:eccommerce4/core/class/data_handilng.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'categories_listview.dart';
import 'discount_container.dart';
import 'producr_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => DataHandlingState(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: const [
              SizedBox(height: 20),
              DiscountContainer(),
              SizedBox(height: 20),
              CategoriesListView(),
              SizedBox(height: 20),
              ProductListView(text: "Top Selling"),
              SizedBox(height: 20),
              ProductListView(text: "Offer"),
              SizedBox(height: 50),
            ],
          )),
    );
  }
}
