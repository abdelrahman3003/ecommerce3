import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/cart/cart_controller.dart';
import '../../../../core/constant/backlinks.dart';

class CartItem extends GetView<CartControllerImp> {
  const CartItem({
    required this.index,
    super.key,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CachedNetworkImage(
                imageUrl:
                    "$itemsImageNameLink/${controller.cartmodelLsit[index].itemsImage}",
                fit: BoxFit.fill,
              ),
            ),
            // Container(
            //   width: 160,
            //   height: 140,
            //   decoration: BoxDecoration(
            //       color: ColorsApp.kprimaryColor1,
            //       borderRadius: BorderRadius.circular(kborderradius)),
            // ),
            Expanded(
              child: ListTile(
                title: Text("${controller.cartmodelLsit[index].itemsName}",
                    style: Styles.textStyle25.copyWith(color: Colors.black)),
                subtitle: Opacity(
                  opacity: .6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 2),
                      Text(
                          "${controller.cartmodelLsit[index].itemdiscountprice} \$ ",
                          style:
                              Styles.textStyle16.copyWith(color: Colors.black)),
                      Text(
                          "Total : ${controller.cartmodelLsit[index].sumitemdiscountprice} \$ ",
                          style: Styles.textStyle18.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () async {
                    await controller
                        .addCart(controller.cartmodelLsit[index].itemsId!);
                    controller.refreshCart();
                  },
                  icon: const Icon(Icons.add),
                ),
                Text("${controller.cartmodelLsit[index].itemcount}",
                    style: Styles.textStyle25
                        .copyWith(color: ColorsApp.kprimaryColor1)),
                IconButton(
                  onPressed: () async {
                    await controller
                        .removeCart(controller.cartmodelLsit[index].itemsId!);
                    controller.refreshCart();
                  },
                  icon: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
