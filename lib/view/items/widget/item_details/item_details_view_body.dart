import 'package:eccommerce4/view/items/widget/item_details/image_Background.dart';
import 'package:eccommerce4/view/items/widget/item_details/item_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/items/item_details_controller.dart';
import 'add_cart_button.dart';
import 'item_colors.dart';
import 'item_des.dart';
import 'title.dart';

class ItemDetailsViewBody extends StatelessWidget {
  const ItemDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsDetailsControllerImp>(
      builder: (controller) => Column(
        children: [
          ImageBackground(itemImage: controller.itemModel.itemsImage!),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  ItemTitle(text: controller.itemModel.itemsName!),
                  const SizedBox(height: 12),
                  ItemPrice(
                      discountprice:
                          "${controller.itemModel.itempricediscount!}",
                      price: "${controller.itemModel.itemsPrice!}",
                      count: controller.count),
                  const SizedBox(height: 30),
                  ItemDes(
                    des: "${controller.itemModel.itemsDes}",
                  ),
                  const SizedBox(height: 10),
                  const ItemColors(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const Spacer(),
          const AddCartButton(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
