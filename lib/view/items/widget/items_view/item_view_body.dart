import 'package:eccommerce4/controller/search/search_controller.dart';
import 'package:eccommerce4/core/class/data_handilng.dart';
import 'package:eccommerce4/view/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/items/items_view_controller.dart';
import '../../../home/widget/home_page_view/home_appbar.dart';
import 'categoriew_text_list.dart';
import 'items_list_view.dart';

class ItemsViewBody extends StatelessWidget {
  const ItemsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp);
    return ListView(children: [
      const HomeAppbar(),
      GetBuilder<SearchControllerImp>(
          builder: (controller) => DataHandlingState(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? const Column(
                      children: [
                        SizedBox(height: 30),
                        CategoriesTextList(),
                        ItemListView(),
                      ],
                    )
                  : SearchView(
                      itemsSearch: controller.searchItemsList,
                    )))
    ]);
  }
}
