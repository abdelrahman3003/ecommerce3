import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/routsApp.dart';
import '../../../../core/shared/styles.dart';

class SigninNavigate extends StatelessWidget {
  const SigninNavigate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Opacity(
          opacity: .8,
          child: Text(
            "Do have an account? ",
            style: Styles.textStyle16,
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(kSignin);
          },
          child: Text("SignIn",
              style:
                  Styles.textStyle18.copyWith(color: ColorsApp.kprimaryColor1)),
        ),
      ],
    );
  }
}
