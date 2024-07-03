import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/items/items_view_controller.dart';

class CategoryText extends GetView<ItemsControllerImp> {
  const CategoryText({
    super.key,
    required this.id,
    required this.text,
  });
  final String text;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          controller.changeCategory(id);
          controller.getItems(id + 1);
        },
        child: Column(
          children: [
            SizedBox(
                width: 100,
                child: Center(child: Text(text, style: Styles.textStyle18))),
            const SizedBox(height: 4),
            Container(
              width: 100,
              height: 4,
              decoration: controller.selectedCat == id
                  ? BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
