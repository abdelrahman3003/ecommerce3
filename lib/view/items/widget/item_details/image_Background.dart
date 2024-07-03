import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/items/item_details_controller.dart';
import '../../../../core/constant/backlinks.dart';

class ImageBackground extends StatelessWidget {
  const ImageBackground({super.key, required this.itemImage});
  final String itemImage;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ItemsDetailsControllerImp());
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        ),
        Positioned(
          top: 50,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
              tag: "${controller.itemModel.itemsId}",
              child: SizedBox(
                width: 200,
                height: 200,
                child: CachedNetworkImage(
                  imageUrl: "$itemsImageNameLink/$itemImage",
                  fit: BoxFit.fill,
                ),
              )),
        )
      ],
    );
  }
}
