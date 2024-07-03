import 'package:eccommerce4/controller/search/search_controller.dart';
import 'package:eccommerce4/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/search_item_card.dart';

class SearchView extends GetView<SearchControllerImp> {
  const SearchView({super.key, required this.itemsSearch});
  final List<ItemModel> itemsSearch;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemsSearch.length,
      itemBuilder: (context, index) {
        return SearchItemCard(
          onTap: () {},
          image: itemsSearch[index].itemsImage!,
          subtilte: itemsSearch[index].categoriesName!,
          title: itemsSearch[index].itemsName!,
          price: itemsSearch[index].itemsPrice!,
        );
      },
    );
  }
}
