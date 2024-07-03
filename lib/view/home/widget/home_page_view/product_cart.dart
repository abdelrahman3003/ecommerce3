import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccommerce4/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home/home_controller.dart';
import '../../../../core/constant/backlinks.dart';

class ProductCart extends GetView<HomePageControllerImp> {
  const ProductCart({super.key, required this.itemModel});
  final ItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: () {
          controller.goToItemDetails(itemModel);
        },
        child: Container(
          height: Get.height / 7,
          width: Get.width / 2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: CachedNetworkImage(
            imageUrl: "$itemsImageNameLink/${itemModel.itemsImage}",
          ),
        ),
      ),
    );
  }
}
