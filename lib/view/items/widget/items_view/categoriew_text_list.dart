import 'package:eccommerce4/controller/items/items_view_controller.dart';
import 'package:eccommerce4/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_text.dart';

class CategoriesTextList extends StatelessWidget {
  const CategoriesTextList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => SizedBox(
        height: 50,
        child: ListView.builder(
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryText(
              text:
                  "${CategoriesModel.fromJson(controller.categories[index]).categoriesName}",
              id: index,
            );
          },
        ),
      ),
    );
  }
}
