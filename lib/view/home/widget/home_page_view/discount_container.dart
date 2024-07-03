import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home/home_controller.dart';

class DiscountContainer extends GetView<HomePageControllerImp> {
  const DiscountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 165,
      decoration: BoxDecoration(
          color: ColorsApp.kprimaryColor1,
          borderRadius: BorderRadius.circular(20)),
      child: Stack(children: [
        Positioned(
          right: -20,
          top: -20,
          child: Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
                color: ColorsApp.kprimaryColor2,
                borderRadius: BorderRadius.circular(150)),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: ListTile(
            title: Text(
              "${controller.textDiscount[controller.textDiscount.length - 1]['textdiscount_title']}",
              style: Styles.textStyle20,
            ),
            subtitle: Text(
              "${controller.textDiscount[controller.textDiscount.length - 1]['textdiscount_body']}",
              style: Styles.textStyle30,
            ),
          ),
        )
      ]),
    );
  }
}
