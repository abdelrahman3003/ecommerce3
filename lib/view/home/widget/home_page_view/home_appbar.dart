import 'package:eccommerce4/controller/search/search_controller.dart';
import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/core/constant/constatns_value.dart';
import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:eccommerce4/view/home/widget/home_page_view/icon_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppbar extends GetView<SearchControllerImp> {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 60,
            child: TextFormField(
              controller: controller.searchText,
              onChanged: (value) {
                controller.checkSearch(value);
              },
              decoration: InputDecoration(
                prefix: IconButton(
                    onPressed: () {
                      controller.search();
                      controller.getSearch(controller.searchText!.text);
                    },
                    icon:
                        const Icon(Icons.search, color: Colors.grey, size: 30)),
                hintText: "Find product",
                filled: true,
                fillColor: ColorsApp.kprimaryColor3,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kborderradius),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconAppbar(
            icon: Icons.card_travel,
            onPressed: () {
              Get.toNamed(kCartView);
            }),
        const SizedBox(width: 10),
        IconAppbar(
            icon: Icons.favorite_outline_outlined,
            onPressed: () {
              Get.toNamed(kfavouroteview);
            }),
      ],
    );
  }
}
