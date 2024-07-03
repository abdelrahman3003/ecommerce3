import 'package:eccommerce4/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/styles.dart';
import 'categorie_list.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: Styles.textStyle20.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 10),
          const CategoriesList(),
        ],
      ),
    );
  }
}
