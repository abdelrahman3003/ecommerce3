import 'package:eccommerce4/controller/forget_password_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/shared/styles.dart';

class ForgetPasswordText extends GetView<ForgetPasssowrdController> {
  const ForgetPasswordText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.forgetpassword();
      },
      child: const Opacity(
          opacity: .6,
          child: Text("Forget password", style: Styles.textStyle16)),
    );
  }
}
