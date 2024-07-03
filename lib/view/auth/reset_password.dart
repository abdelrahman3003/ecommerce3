import 'package:eccommerce4/controller/auth/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../core/class/data_handling_request.dart';
import 'widgets/restpassword/restpassword_body.dart';

class RestPassword extends StatelessWidget {
  const RestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return Scaffold(
        body: GetBuilder<ResetPasswordController>(
            builder: (controller) => DataHandlingRequsetState(
                  statusRequest: controller.statusRequest,
                  widget: const ResetpasswordBody(),
                )));
  }
}
