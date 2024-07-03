import 'package:eccommerce4/controller/favorite/myfavourites_controller.dart';
import 'package:eccommerce4/view/favourite/favourite_view/item_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/lotties/empty_lottie.dart';

class FavouriteListView extends GetView<MyFavouritesCOntrollerImp> {
  const FavouriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavouritesCOntrollerImp>(
        builder: (controller) => controller.myfavouritesList.isNotEmpty
            ? GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.5 / 2.8),
                itemCount: controller.myfavouritesList.length,
                itemBuilder: (context, index) {
                  return ItemCard(
                      myfavouritesModel: controller.myfavouritesList[index]);
                },
              )
            : const EmptyLottie());
  }
}
