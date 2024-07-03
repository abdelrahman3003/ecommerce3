import 'package:eccommerce4/controller/items/items_view_controller.dart';
import 'package:eccommerce4/data/model/items_model.dart';
import 'package:eccommerce4/view/items/widget/items_view/item_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/favorite/favourite_controller.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    var favouriteController = Get.put(FavouriteControllerImp());
    return GetBuilder<ItemsControllerImp>(
        builder: (controller) => GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.5 / 2.8),
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                favouriteController
                        .favourite[controller.items[index]['items_id']] =
                    controller.items[index]['favourite'];
                return ItemCard(
                  itemModel: ItemModel.fromJson(controller.items[index]),
                );
              },
            ));
  }
}
