import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/favorite/favourite_controller.dart';
import '../../../../controller/items/items_view_controller.dart';
import '../../../../core/constant/backlinks.dart';
import '../../../../data/model/items_model.dart';

class ItemCard extends GetView<ItemsControllerImp> {
  const ItemCard({super.key, required this.itemModel});
  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            controller.goToItemDetails(itemModel);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: Hero(
                      tag: "${itemModel.itemsId!}",
                      child: CachedNetworkImage(
                        imageUrl: "$itemsImageNameLink/${itemModel.itemsImage}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(itemModel.itemsName!,
                      style: Styles.textStyle20.copyWith(color: Colors.black)),
                  Text(
                    itemModel.itemsDes!,
                    style: Styles.textStyle14,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const Spacer(),
                  itemModel.itemsDiscount != 0
                      ? Text("\$ ${itemModel.itemsPrice}",
                          style: Styles.textStyle18.copyWith(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                          ))
                      : Container(),
                  Row(
                    children: [
                      Text("\$ ${itemModel.itempricediscount.toString()}",
                          style:
                              Styles.textStyle20.copyWith(color: Colors.red)),
                      const Spacer(),
                      GetBuilder<FavouriteControllerImp>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.favourite[itemModel.itemsId] ==
                                  1) {
                                controller.setFavourite(itemModel.itemsId, 0);
                                controller.removeFavourite(itemModel.itemsId);
                              } else {
                                controller.setFavourite(itemModel.itemsId, 1);
                                controller.addFavourite(itemModel.itemsId);
                              }
                            },
                            icon: Icon(
                              controller.favourite[itemModel.itemsId] == 1
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Colors.red,
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        itemModel.itemsDiscount != 0
            ? const CircleAvatar(
                backgroundImage: AssetImage("assets/images/discount.png"))
            : Container()
      ],
    );
  }
}
