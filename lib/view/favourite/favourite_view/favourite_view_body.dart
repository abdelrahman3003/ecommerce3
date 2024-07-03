import 'package:eccommerce4/controller/favorite/myfavourites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/data_handling_request.dart';
import 'favourite_list_view.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavouritesCOntrollerImp>(
        builder: (controller) => DataHandlingRequsetState(
              statusRequest: controller.statusRequest,
              widget: const FavouriteListView(),
            ));
  }
}
