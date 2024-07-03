import 'package:eccommerce4/controller/home/offer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/search/search_controller.dart';
import '../../../search/search_view.dart';
import '../home_page_view/home_appbar.dart';
import 'widget/offer_view_body.dart';

class OfferView extends StatelessWidget {
  const OfferView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsOfferControllerImp());
    return GetBuilder<SearchControllerImp>(
      builder: (controller) => Column(
        children: [
          const HomeAppbar(),
          !controller.isSearch
              ? const Expanded(child: OfferViewBody())
              : SearchView(itemsSearch: controller.searchItemsList),
        ],
      ),
    );
  }
}
