import 'package:eccommerce4/controller/auth/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/data_handling_request.dart';
import '../../core/functions/alert_exit.dart';
import 'widgets/signup/signup_body.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<SignupController>(
                builder: (controller) => DataHandlingRequsetState(
                      statusRequest: controller.statusRequest,
                      widget: const SignupBody(),
                    ))),
      ),
    );
  }
}
