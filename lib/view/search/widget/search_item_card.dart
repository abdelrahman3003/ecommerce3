import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccommerce4/core/constant/backlinks.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchItemCard extends StatelessWidget {
  const SearchItemCard(
      {super.key,
      required this.image,
      required this.title,
      required this.subtilte,
      required this.price,
      required this.onTap});
  final String image;
  final String title;
  final String subtilte;
  final int price;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            SizedBox(
              height: Get.height / 7,
              width: Get.width / 7,
              child: CachedNetworkImage(imageUrl: "$itemsImageNameLink/$image"),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Styles.textStyle20black),
                Text(subtilte, style: Styles.textStyle18),
              ],
            ),
            Spacer(),
            Text("$price \$", style: Styles.textStyle20black),
          ],
        ),
      ),
    );
  }
}
