import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:eccommerce4/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/home/offer_controller.dart';
import '../../../../../core/constant/backlinks.dart';

class ItemOfferCard extends GetView<ItemsOfferControllerImp> {
  const ItemOfferCard({super.key, required this.itemModel});
  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: Get.height / 2.6,
        child: Stack(
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
                      Center(
                        child: SizedBox(
                          height: 150,
                          child: Hero(
                            tag: "${itemModel.itemsId!}",
                            child: CachedNetworkImage(
                              imageUrl:
                                  "$itemsImageNameLink/${itemModel.itemsImage}",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(itemModel.itemsName!,
                          style:
                              Styles.textStyle20.copyWith(color: Colors.black)),
                      Text(
                        itemModel.itemsDes!,
                        style: Styles.textStyle14,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              itemModel.itemsDiscount != 0
                                  ? Text("\$ ${itemModel.itemsPrice}",
                                      style: Styles.textStyle18.copyWith(
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough,
                                      ))
                                  : Container(),
                              Text(
                                  "\$ ${itemModel.itempricediscount.toString()}",
                                  style: Styles.textStyle20
                                      .copyWith(color: Colors.red)),
                            ],
                          ),
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
        ),
      ),
    );
  }
}
