import 'package:eccommerce4/controller/home/home_controller.dart';
import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:eccommerce4/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constant/backlinks.dart';

class CategoryCart extends GetView<HomePageControllerImp> {
  const CategoryCart({
    super.key,
    required this.categoriesModel,
    required this.categoryid,
  });

  final CategoriesModel categoriesModel;
  final int categoryid;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              controller.goToItems(controller.categories, categoryid);
            },
            child: Container(
                height: 110,
                width: 100,
                decoration: BoxDecoration(
                  color: ColorsApp.kprimaryColor2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SvgPicture.network(
                    "$categoriesImageNameLink/${categoriesModel.categoriesImage!}")),
          ),
          Text(categoriesModel.categoriesName!, style: Styles.textStyle18)
        ],
      ),
    );
  }
}
