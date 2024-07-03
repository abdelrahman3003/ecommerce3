import 'package:eccommerce4/core/constant/colors.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';

class SigninText extends StatelessWidget {
  const SigninText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Opacity(
          opacity: .8,
          child: Text(
            "Already  have an account? ",
            style: Styles.textStyle18,
          ),
        ),
        GestureDetector(
            onTap: () {},
            child: Text(
              "SIGN IN",
              style:
                  Styles.textStyle20.copyWith(color: ColorsApp.kprimaryColor1),
            )),
      ],
    );
  }
}
