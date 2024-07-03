import 'package:eccommerce4/controller/auth/signin_controller.dart';
import 'package:eccommerce4/core/functions/alert_exit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/forget_password_controller.dart';
import '../../core/class/data_handling_request.dart';
import 'widgets/signin/signin_body.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SigninController());
    Get.put(ForgetPasssowrdController());
    return Scaffold(
        body: WillPopScope(
      onWillPop: alertExitApp,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<SigninController>(
              builder: (controller) => DataHandlingRequsetState(
                  statusRequest: controller.statusRequest,
                  widget: const SigninBody()))),
    ));
  }
}
