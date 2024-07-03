import 'package:eccommerce4/controller/items/item_details_controller.dart';
import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPrice extends GetView<ItemsDetailsControllerImp> {
  const ItemPrice(
      {super.key,
      required this.price,
      required this.count,
      required this.discountprice});
  final String price;
  final String discountprice;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  controller.add();
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              Opacity(
                opacity: .7,
                child: Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: ColorsApp.kprimaryColor2,
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: Text("$count",
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.remove();
                },
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              "\$ $price",
              style: Styles.textStyle16.copyWith(
                  color: Colors.red, decoration: TextDecoration.lineThrough),
            ),
            Text(
              "\$ $discountprice",
              style: Styles.textStyle20.copyWith(color: Colors.red),
            ),
          ],
        )
      ],
    );
  }
}
