import 'package:eccommerce4/controller/home/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'setting_vew_widget/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingControllerImp());
    return const SettingViewBody();
  }
}
