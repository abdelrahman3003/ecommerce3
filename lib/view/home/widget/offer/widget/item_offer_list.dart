import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/home/offer_controller.dart';
import 'item_offer_card.dart';

class ItemOfferList extends GetView<ItemsOfferControllerImp> {
  const ItemOfferList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.itemsoffer.length,
      itemBuilder: (context, index) =>
          ItemOfferCard(itemModel: controller.itemsoffer[index]),
    );
  }
}
