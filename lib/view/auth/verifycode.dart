import 'package:eccommerce4/controller/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/verify_code.dart';
import '../../core/class/data_handling_request.dart';
import 'widgets/verify/Verify_body.dart';

class VerifyCode extends GetView<ForgetPasssowrdController> {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeController());
    return Scaffold(
        body: GetBuilder<VerifyCodeController>(
            builder: (verifycodecontroller) => DataHandlingRequsetState(
                  statusRequest: verifycodecontroller.statusRequest,
                  widget: const VerfiyBody(
                    titlebold: "Check your email",
                    title: "Verification code",
                    subtitle: "please enter your code sent to your email ",
                  ),
                )));
  }
}
