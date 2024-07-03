import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAbbpar extends StatelessWidget {
  const CustomAbbpar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: Styles.textStyle25
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 32)
      ],
    );
  }
}
