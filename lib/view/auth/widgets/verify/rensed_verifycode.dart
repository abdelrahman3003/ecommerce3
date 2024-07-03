import 'package:eccommerce4/controller/auth/verify_code.dart';
import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResnedVerifyCode extends GetView<VerifyCodeController> {
  const ResnedVerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "click here to ",
          style: Styles.textStyle18.copyWith(color: Colors.black),
        ),
        InkWell(
            onTap: () {
              controller.resendVerfyCode();
              Get.rawSnackbar(
                  title: "....",
                  messageText: Text(
                    "check your email to catch a code ",
                    style: Styles.textStyle16.copyWith(color: Colors.white),
                  ));
            },
            child: Text("resend",
                style: Styles.textStyle20
                    .copyWith(color: ColorsApp.kprimaryColor2))),
        Text(
          " code again ",
          style: Styles.textStyle18.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
