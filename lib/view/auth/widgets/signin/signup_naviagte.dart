import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/shared/styles.dart';

class SignupNavigate extends StatelessWidget {
  const SignupNavigate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Opacity(
          opacity: 1,
          child: Text(
            "Don't have an account ",
            style: Styles.textStyle16,
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(kSignup);
          },
          child: Text("SignUp",
              style:
                  Styles.textStyle18.copyWith(color: ColorsApp.kprimaryColor1)),
        ),
      ],
    );
  }
}
