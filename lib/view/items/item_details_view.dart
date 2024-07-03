import 'package:eccommerce4/view/items/widget/item_details/item_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items/item_details_controller.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());
    return const Scaffold(
      body: SafeArea(child: ItemDetailsViewBody()),
    );
  }
}
