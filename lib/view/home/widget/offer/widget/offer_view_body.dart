import 'package:eccommerce4/core/class/data_handilng.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/home/offer_controller.dart';
import 'item_offer_list.dart';

class OfferViewBody extends StatelessWidget {
  const OfferViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsOfferControllerImp>(
      builder: (controller) => DataHandlingState(
        statusRequest: controller.statusRequest,
        widget: const ItemOfferList(),
      ),
    );
  }
}
