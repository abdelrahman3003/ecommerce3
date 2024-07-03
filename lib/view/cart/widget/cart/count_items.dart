import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/core/constant/constatns_value.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountItems extends StatelessWidget {
  const CountItems({super.key, required this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          color: ColorsApp.kprimaryColor2,
          borderRadius: BorderRadius.circular(kborderradius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have  ",
                style: Styles.textStyle20.copyWith(color: Colors.black)),
            Text("$count",
                style: Styles.textStyle25.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            count == 1
                ? Text("  item in your ist",
                    style: Styles.textStyle20.copyWith(color: Colors.black))
                : Text("  items in your ist",
                    style: Styles.textStyle20.copyWith(color: Colors.black))
          ],
        ),
      ),
    );
  }
}
