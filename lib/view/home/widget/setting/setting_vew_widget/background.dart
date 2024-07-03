import 'package:eccommerce4/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: ColorsApp.kprimaryColor1,
          height: Get.width / 2,
        ),
        Positioned(
          left: Get.width / 2.5,
          top: Get.width / 2.5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/person.png"),
            ),
          ),
        )
      ],
    );
  }
}
